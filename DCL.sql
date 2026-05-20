-- creates a user
CREATE USER retail_user WITH PASSWORD 'StrongPassword123';

-- allow user to login
ALTER ROLE retail_user LOGIN;

-- allow user to connect to the database
GRANT CONNECT ON DATABASE retail_workspace TO retail_user;

--create a schema
CREATE SCHEMA retail;

-- allow user to access retail schema
GRANT USAGE ON SCHEMA retail TO retail_user;

-- allow user to select, insert, update, delete on all tables in retail schema
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA retail TO retail_user;


ALTER DEFAULT PRIVILEGES IN SCHEMA retail
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO retail_user;

ALTER DEFAULT PRIVILEGES IN SCHEMA retail
GRANT USAGE, SELECT ON SEQUENCES TO retail_user;

GRANT CREATE ON SCHEMA retail TO retail_user;

select current_user;