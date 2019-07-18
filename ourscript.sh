
echo 'here we go'
SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd)
LINK_DIR=$(pwd $(readlink $SCRIPT_DIR/ourscript.sh))
echo "$(dirname "$0")"
echo "script ran from dir: $SCRIPT_DIR"
echo "link dir: $LINK_DIR"
echo '==='
ls -alh $LINK_DIR
echo '==='
ls -alh $LINK_DIR/../

# Read app name
APP_NAME="$1"
if [ $# -eq 0 ] ; then echo 'enter an app name'; read APP_NAME ; fi

# Create APP_NAME react app
create-react-app $APP_NAME

# Cleanup
cd $APP_NAME
rm src/logo.svg
rsync -au $LINK_DIR/templates/ ./


echo 'here we went'
