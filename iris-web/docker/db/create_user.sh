#!/bin/bash
set -e

POSTGRES="psql --username ${POSTGRES_USER}"

echo "Creating database role: ${POSTGRES_ADMIN_USER}"

$POSTGRES <<-EOSQL
CREATE USER ${POSTGRES_ADMIN_USER} WITH CREATEDB SUPERUSER PASSWORD '${POSTGRES_ADMIN_PASSWORD}';
\c iris_db;
CREATE EXTENSION IF NOT EXISTS pgcrypto CASCADE;
EOSQL


##########################################
##########################################
#moiseev new Script !
# Создание расширения pgcrypto для шифрования данных
# Создание пользователя суперпользователя с возможностью создавать базы данных
# Создание ролей для postgres, raptor с возможностью создавать базы данных
# Предоставление полных привилегий на все таблицы в схеме public для ролей postgres, raptor 
# Установка прав по умолчанию для создания таблиц и баз данных для ролей  postgres, raptor 
# Установка прав по умолчанию на все таблицы в схеме public для ролей a postgres, raptor 

#!/bin/bash
# set -e

# POSTGRES="psql --username ${POSTGRES_USER}"

# $POSTGRES <<-EOSQL
# CREATE EXTENSION IF NOT EXISTS pgcrypto CASCADE;
# CREATE USER ${POSTGRES_ADMIN_USER} WITH CREATEDB SUPERUSER PASSWORD '${POSTGRES_ADMIN_PASSWORD}';

# CREATE ROLE postgres WITH LOGIN CREATEDB PASSWORD 'postgres';
# CREATE ROLE raptor WITH LOGIN CREATEDB PASSWORD 'postgres';

# ALTER DEFAULT PRIVILEGES FOR ROLE raptor GRANT CREATE TABLE;
# ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT CREATE TABLE;

# ALTER DEFAULT PRIVILEGES FOR ROLE raptor GRANT CREATE DATABASE;
# ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT CREATE DATABASE;

# GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO raptor;
# GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;

# ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO raptor;
# ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO postgres;
# EOSQL