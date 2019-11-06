## Release Change Log

### 1.0.1
The 1.0.1 minor release includes the following bug fixes:
* There is no post-push git hook, therefore it was removed.
* Stashing the local changes and applying the stash can easily be done via the `autostash` setting of `git rebase`. This was considered the responsibility of the git user, therefore it was removed from the pre-push hook.

### 1.0.0
Initial release