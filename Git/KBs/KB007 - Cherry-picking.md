#### **What it is:**

`git cherry-pick` is a command that allows you to take a specific commit from one branch and apply its changes to another branch. Instead of merging the entire history of a branch, it copies the changes from a single commit and creates a new, identical commit on your current branch.

#### **Purpose:**

The purpose of `git cherry-pick` is to selectively integrate a single change, or a few specific changes, without bringing over an entire branch's history. This is particularly useful for applying a bug fix that was committed to a development branch directly to a stable release branch. It allows for surgical application of a change, leaving all other commits on the source branch behind.

#### **Real world application:**

A critical bug is found in the production version of a web application. The fix for this bug is developed and committed on a new feature branch. Instead of performing a full merge of the entire feature branch (which might contain unfinished or untested code), a developer can cherry-pick just the single commit with the bug fix and apply it directly to the `main` or `production` branch. This gets the fix out quickly and safely without introducing any unstable code.

#### **Example Commands:**

- **To cherry-pick a single commit:**

    ```bash
    # Switch to the target branch (the branch you want to add the commit to)
    git checkout main
    
    # Find the hash of the commit you want to copy (e.g., 0de1146)
    git cherry-pick <commit-hash>
    ```

- **To cherry-pick a range of commits:**

    ```bash
    # This will cherry-pick all commits from <start-hash> to <end-hash>
    # (The start hash is excluded)
    git cherry-pick <start-hash>..<end-hash>
    ```

- **To resolve a conflict during cherry-pick:**

    ```bash
    # After a conflict, edit the file(s) and stage the resolved version
    git add <conflicted_file>
    
    # Continue the cherry-pick
    git cherry-pick --continue
    ```