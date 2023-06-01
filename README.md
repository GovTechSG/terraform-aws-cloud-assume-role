# terraform-aws-cloud-assume-role

Creates a custom role for which you assume through your GCC2.0 cloud assume role

```hcl
module 'role-gcc' {
  group_names = ["gpcgr"]

  # Run `aws iam list-roles --query "Roles[?starts_with(RoleName, 'AWSReservedSSO_agency_assume_local')].[RoleId]" --output text`"
  agency_assume_local_role_id = "AXXXXXXXXXXXX"

  attach_policies = {
    "read-only-access" : "arn:aws:iam::aws:policy/ReadOnlyAccess",
  }

  techpass_email_addresses = [
    "your_techpass_email@tech.gov.sg",
  ]

  external_id = "some_external_id"

  # Will not create if empty, if need custom policy, use the EOF syntax
  custom_policy = ""

  description = "great power comes great responsibility role"
  name = "gpcgr"
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.iam_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.attach_custom_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.attach_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.iam_trusted](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.trusted_accounts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_agency_assume_local_role_id"></a> [agency\_assume\_local\_role\_id](#input\_agency\_assume\_local\_role\_id) | your agency\_assume\_local role\_id, use `aws iam list-roles --query "Roles[?starts_with(RoleName, 'AWSReservedSSO_agency_assume_local')].[RoleId]" --output text` | `string` | n/a | yes |
| <a name="input_attach_policies"></a> [attach\_policies](#input\_attach\_policies) | map(string) of existing policies to attach | `map(string)` | `{}` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | aws region | `string` | n/a | yes |
| <a name="input_custom_policy"></a> [custom\_policy](#input\_custom\_policy) | custom policy to be applied to role using the EOF syntax | `string` | `""` | no |
| <a name="input_description"></a> [description](#input\_description) | description of the role | `string` | n/a | yes |
| <a name="input_external_id"></a> [external\_id](#input\_external\_id) | external id condition for assume role | `string` | `""` | no |
| <a name="input_max_session_duration"></a> [max\_session\_duration](#input\_max\_session\_duration) | maximum duration in seconds for role, between 1 to 12 hours | `number` | `3600` | no |
| <a name="input_name"></a> [name](#input\_name) | name of the role in aws console | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | path of the role in aws console | `string` | `"/"` | no |
| <a name="input_techpass_email_addresses"></a> [techpass\_email\_addresses](#input\_techpass\_email\_addresses) | list of TechPass users' email addresses to allow use of this role | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | arn of the role |
| <a name="output_create_date"></a> [create\_date](#output\_create\_date) | date which the role was created |
| <a name="output_custom_policy_arn"></a> [custom\_policy\_arn](#output\_custom\_policy\_arn) | ARN of the custom policy |
| <a name="output_custom_policy_id"></a> [custom\_policy\_id](#output\_custom\_policy\_id) | id of the custom policy |
| <a name="output_custom_policy_name"></a> [custom\_policy\_name](#output\_custom\_policy\_name) | name of the custom policy |
| <a name="output_description"></a> [description](#output\_description) | description of the role |
| <a name="output_id"></a> [id](#output\_id) | id of the role |
| <a name="output_name"></a> [name](#output\_name) | name of the role |
| <a name="output_role_session_duration"></a> [role\_session\_duration](#output\_role\_session\_duration) | maximum duration a role can be assume for |
| <a name="output_unique_id"></a> [unique\_id](#output\_unique\_id) | unique id of the role |
