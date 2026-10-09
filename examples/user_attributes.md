# User Attributes

Typical user attributes:
- `allowed_branch`: branch identifier used for row-level security
- `region`: business region
- `environment`: dev/qa/prod
- `currency`: reporting currency

Example Liquid:
```lookml
sql_always_where:
  ${branches.region} = '{{ _user_attributes['region'] }}' ;;
```

Use user attributes together with `access_grant`, `sql_always_where`, or templated filters according to your security design.
