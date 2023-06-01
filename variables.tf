variable "aws_region" {
  description = "aws region"
  type        = string
}

variable "description" {
  description = "description of the role"
  type        = string
}

variable "max_session_duration" {
  description = "maximum duration in seconds for role, between 1 to 12 hours"
  type        = number
  default     = 3600
}

variable "external_id" {
  description = "external id condition for assume role"
  type        = string
  default     = ""
}

variable "name" {
  description = "name of the role in aws console"
  type        = string
}

variable "path" {
  description = "path of the role in aws console"
  type        = string
  default     = "/"
}

variable "custom_policy" {
  description = "custom policy to be applied to role using the EOF syntax"
  type        = string
  default     = ""
}

variable "attach_policies" {
  description = "map(string) of existing policies to attach"
  type        = map(string)
  default     = {}
}

variable "techpass_email_addresses" {
  description = "list of TechPass users' email addresses to allow use of this role"
  type        = list(string)
  default     = []
}

variable "agency_assume_local_role_id" {
  description = "your agency_assume_local role_id, use `aws iam list-roles --query \"Roles[?starts_with(RoleName, 'AWSReservedSSO_agency_assume_local')].[RoleId]\" --output text`"
  type        = string
}

variable "permissions_boundary" {
  description = "ARN of permissions boundary policy to attach to role"
  type        = string
  default     = ""
}

variable "managed_policies" {
  description = "Custom polices to be created managed policies (not inline)."
  type        = map(string)
  default     = {}
}
