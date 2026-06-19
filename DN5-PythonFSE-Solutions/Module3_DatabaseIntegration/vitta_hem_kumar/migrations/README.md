# Alembic Migrations

This folder is dedicated to holding database migration scripts generated via Alembic.

## Setup Instructions

1. Initialize alembic inside this directory:
   ```bash
   alembic init alembic
   ```
2. Configure `alembic.ini` to connect to your database using environment variables or a direct string.
3. Generate a migration:
   ```bash
   alembic revision --autogenerate -m "Initial schema"
   ```
4. Run migrations:
   ```bash
   alembic upgrade head
   ```
