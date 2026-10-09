# Architecture

Source database -> Looker connection -> LookML model -> Explores -> dashboards.

Recommended layers:
1. Raw source tables
2. SQL transformations / warehouse views
3. LookML views
4. Explores and joins
5. Governed dashboards

Use persistent derived tables for reusable transformations where warehouse views are not appropriate.
