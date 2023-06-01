output "arn" {
  description = "arn of the role"
  value       = aws_iam_role.iam_role.arn
}

output "create_date" {
  description = "date which the role was created"
  value       = aws_iam_role.iam_role.create_date
}

output "description" {
  description = "description of the role"
  value       = aws_iam_role.iam_role.description
}

output "id" {
  description = "id of the role"
  value       = aws_iam_role.iam_role.id
}

output "name" {
  description = "name of the role"
  value       = aws_iam_role.iam_role.name
}

output "unique_id" {
  description = "unique id of the role"
  value       = aws_iam_role.iam_role.unique_id
}

output "role_session_duration" {
  description = "maximum duration a role can be assume for"
  value       = aws_iam_role.iam_role.max_session_duration
}

output "custom_policy_arn" {
  description = "ARN of the custom policy"
  value       = length(aws_iam_policy.policy) > 0 ? aws_iam_policy.policy[0].arn : null
}

output "custom_policy_id" {
  description = "id of the custom policy"
  value       = length(aws_iam_policy.policy) > 0 ? aws_iam_policy.policy[0].id : null
}

output "custom_policy_name" {
  description = "name of the custom policy"
  value       = length(aws_iam_policy.policy) > 0 ? aws_iam_policy.policy[0].name : null
}

