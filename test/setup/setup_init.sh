set -ue

VERBOSE="${VERBOSE:=off}"

if [ $VERBOSE == 'on' ]; then
  set -x
fi

psql="psql --no-psqlrc -d postgres"

username=test_connector
password=test_password
database_name=test_postgresql_connector
