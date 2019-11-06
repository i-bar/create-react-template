# Create React Sensible Defaults

## Purpose

Every time a new React app was needed, we would `create-react-app` and then would perform the same changes on the new project: add a formatter, add a linter, add some configuration files for both (to easier share them within the team), add some git hooks to run tests before pushing, etc...

This project was created to automatically perform all that manual work 😉.

## How to use it

From bash

```
npx create-react-sensible-defaults myAwesomeApp
```

## How it works

It starts by running `create-react-app` with a given app name, and then performs the following changes on the newly created projec:

- Adds **linter** (ESLint) and **formatter** (Prettier) resource files.
- Adds **pre-push hook** to run the unit tests before every `git push` command.
- Adds a `globalStyles.js` file to store **reusable style** constants like e.g. color codes, font details etc.
- **Folder structure**: Store component code & style & test in a folder with the same name as the component.
- **Code conventions**: the default JavaScript code conventions (e.g. naming) were used.
