# Model-level examples are normally placed in the model file.
# This snippet illustrates access_grants and user attributes.

access_grant: branch_access {
  user_attribute: allowed_branch
  allowed_values: ["101", "102", "103"]
}

# Explore example:
# explore: loans {
#   sql_always_where: ${branches.branch_id} = CAST({% user_attributes allowed_branch %} AS INT64) ;;
# }
