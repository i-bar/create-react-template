# Read app name
APP_NAME="$1"
if [ $# -eq 0 ] ; then echo 'Please enter an app name: '; read APP_NAME ; fi

# Create APP_NAME react app
create-react-app $APP_NAME

# Cleanup
cd $APP_NAME
rm src/logo.svg
rm src/App.js  # Will be replaced by a new App.jsx

# Copy template files to the app
SCRIPT_DIR=$(dirname "$0")
LINK_DIR=$(dirname $(readlink $SCRIPT_DIR/create-react-sensible-defaults))
rsync -au $SCRIPT_DIR/$LINK_DIR/templates/ ./

# Add pre-push hook to run tests
cat package.json | npx json . -e "
this.husky={};
this.husky.hooks={
  'pre-push': \"CI=true npm test\"
};" > package_with_hook.json

rm package.json
mv package_with_hook.json package.json

# Commit the changes on top of the Create React App initial commit
git add .
git commit -m "Updated / cleaned-up Create React App files."