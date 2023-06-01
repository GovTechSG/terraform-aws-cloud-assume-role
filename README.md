# Iam Role Gcc

```hcl
module 'role-gcc' {
  group_names = ["gpcgr"]

  # Attaches list of existing policies to the role
  attach_policies = {
    terraformer = "arn:aws:iam::${get_aws_account_id()}:policy/terraformer",
  }

  trusted_root_accounts = [
    "arn:aws:iam::ACCOUNT_ID:root",
  ]
  trusted_role_arns = [
    "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME",
  ]

  # Will not create if empty, if need custom policy, use the EOF syntax
  custom_policy = ""

  description = "great power comes great responsibility role"
  name = "gpcgr"
}
```

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attach\_policies | map(string) of existing policies to attach | `map(string)` | `{}` | no |
| aws\_region | aws region | `string` | n/a | yes |
| custom\_policy | custom policy to be applied to role using the EOF syntax | `string` | `""` | no |
| description | description of the role | `string` | n/a | yes |
| group\_names | list of groups that can assume this role | `list(string)` | `[]` | no |
| max\_session\_duration | maximum duration in seconds for role, between 1 to 12 hours | `number` | `3600` | no |
| name | name of the role in aws console | `string` | n/a | yes |
| path | path of the role in aws console | `string` | `"/"` | no |
| enable\_gcci\_boundary | permission boundary toggle | `bool` | `true` | no |
| trusted_root_accounts | allowed accounts to assume this role | `list(string)` | `[]` | no |
| trusted_role_arns | allowed roles to assume this role | `list(string)` | `[]` | no |
| external_id | conditional id for external assume role | `string` | `default` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | arn of the role |
| create\_date | date which the role was created |
| description | description of the role |
| id | id of the role |
| name | name of the role |
| policy | policy attached to this role |
| policy\_arn | arn of policy attached to this role |
| policy\_description | description of policy attached to this role |
| policy\_id | id of policy attached to this role |
| policy\_name | name of policy attached to this role |
| policy\_path | path of policy attached to this role |
| role\_session\_duration | maximum duration a role can be assume for |
| trust\_policy | trust role policy of this role |
| unique\_id | unique id of the role |

