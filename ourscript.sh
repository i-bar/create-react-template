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
LINK_DIR=$(dirname $(readlink $SCRIPT_DIR/learn-npx))
rsync -au $SCRIPT_DIR/$LINK_DIR/templates/ ./

# Install useful packages
npm install -D enzyme eslint-plugin-prettier husky prettier

# Add pre-push and post-push hooks to run tests
PRE_PUSH_COMMAND="git stash save pre-push-stash && CI=true npm test || \$(git stash pop \$(git stash list | grep pre-push-stash | cut -d: -f1) && exit 1)"
POST_PUSH_COMMAND="git stash pop \$(git stash list | grep pre-push-stash | cut -d: -f1)"

cat package.json | npx json . -e "
this.husky={};
this.husky.hooks={
  'pre-push': \"${PRE_PUSH_COMMAND}\",
  'post-push': \"${POST_PUSH_COMMAND}\"
};" > package_with_hook.json

rm package.json
mv package_with_hook.json package.json

# Commit the changes on top of the Create React App initial commit
git add .
git commit -qm "Updated / cleaned-up Create React App files."