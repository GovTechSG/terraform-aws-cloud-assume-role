#
# iam-role
# --------
# this module assists in creating an iam role that enables Techpass SSO to assume this role
# techpass users should be provided the CLOUD_ASSUME_ROLE permission in CMP before being added to techpass_email_addresses

# ref: https://www.terraform.io/docs/providers/aws/d/caller_identity.html
data "aws_caller_identity" "current" {}

# ref: https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html
data "aws_iam_policy_document" "trusted_accounts" {
  statement {
    sid = "TrustedAccounts"
    actions = [
    "sts:AssumeRole"]
    principals {
      type = "AWS"
      # root looks scary but this is just a trust policy so that we can attach the actual
      # policy that allows sts:AssumeRole to be exercised, this alone will not enable anything
      # to assume the role
      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
    }

    dynamic "condition" {
      for_each = length(var.external_id) > 0 ? [1] : []
      content {
        test     = "StringEquals"
        variable = "sts:ExternalId"
        values   = [var.external_id]
      }

    }
  }
}

data "aws_iam_policy_document" "iam_trusted" {
  source_policy_documents = [data.aws_iam_policy_document.trusted_accounts.json]
}

# ref: https://www.terraform.io/docs/providers/aws/r/iam_role.html
resource "aws_iam_role" "iam_role" {
  name                  = var.name
  path                  = var.path
  description           = var.description
  assume_role_policy    = data.aws_iam_policy_document.iam_trusted.json
  max_session_duration  = var.max_session_duration
  force_detach_policies = true
}

# Maps the given list of existing policies to the role
resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.iam_role.name
  for_each   = var.attach_policies
  policy_arn = each.value
}

resource "aws_iam_policy" "policy" {
  count       = var.custom_policy != "" ? 1 : 0
  name        = "${var.name}-policy"
  description = var.description

  policy = var.custom_policy
}

resource "aws_iam_role_policy_attachment" "attach_custom_policy" {
  count      = var.custom_policy != "" ? 1 : 0
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.policy[0].arn
}

# Maps the given list of existing policies to the role
