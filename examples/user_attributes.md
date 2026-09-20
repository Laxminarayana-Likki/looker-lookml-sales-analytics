# Looker User Attributes

User Attributes allow Looker administrators to store values associated
with individual users or user groups.

They are commonly used for:

- Row-level security
- Access filters
- Dynamic database connections
- Dynamic filtering
- Liquid templating
- Environment-specific configuration

---

## Example: Region-Based Security

Create a User Attribute:

Name:

user_region

Type:

String

Example values:

Hyderabad
Chennai
Bangalore

---

## Assigning Values

Example:

| User | user_region |
|------|-------------|
| user_a | Hyderabad |
| user_b | Chennai |
| user_c | Bangalore |

---

## Using the User Attribute

Example LookML:

```lookml
explore: orders {

  access_filter: {
    field: orders.region
    user_attribute: user_region
  }

}
