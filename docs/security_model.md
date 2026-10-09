# Security Model

Recommended controls:
- Model access via roles
- Explore access via access grants
- Row-level security with user attributes
- Sensitive fields hidden from general users
- Separate developer and production projects
- Audit access and dashboard usage

Example:
```lookml
access_grant: branch_access {
  user_attribute: allowed_branch
  allowed_values: ["101", "102", "103"]
}
```
