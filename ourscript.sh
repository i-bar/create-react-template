
echo 'here we go'
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)

# Read app name
APP_NAME="$1"
if [ $# -eq 0 ] ; then echo 'enter an app name'; read APP_NAME ; fi

# Create APP_NAME react app
create-react-app $APP_NAME

# Cleanup
cd $APP_NAME
rm src/logo.svg
rsync -au $SCRIPT_DIR/templates/ ./


echo 'here we went'
