#### **What it is:**

`git stash` is a command that temporarily saves your uncommitted changes (both staged and unstaged) and reverts your working directory to a clean state. It stores these changes on a stack of stashes, allowing you to reapply them later. This is useful when you need to quickly switch context without creating an unnecessary commit.

#### **Purpose:**

The primary purpose of `git stash` is to handle work-in-progress that you are not ready to commit. Common scenarios include:

- **Switching Branches:** You need to switch to another branch to fix an urgent bug or pull in new changes, but your current work is incomplete. Stashing allows you to move to the new branch with a clean working directory and then return to your unfinished work later.
- **Running a Quick Test:** You want to run a test on a clean version of your code but don't want to discard your recent changes. Stashing saves your changes so you can run the test and then reapply them.
- **Cleaning up a Branch:** You've made several changes on a branch and want to rebase, but you want to ensure the rebase applies cleanly without interference from uncommitted changes.

#### **Real world application** 

You're in the middle of writing a new feature on your branch, but your teammate finds a critical bug in production and needs you to fix it immediately on the main branch. Instead of making a half-finished commit just to switch branches, you can stash your current work. This clears your workspace, allowing you to switch to the main branch, make the hotfix commit, and then switch back to your original branch to pop the stash and resume your work right where you left off.
#### **Example Commands:**

- **Save your changes with a message:**

    ```bash
    git stash push -m "work on feature-xyz"
    ```

    _(`git stash` without a message will also work, but a message is recommended)_

- **View your list of stashes:**
  
    ```bash
    git stash list
    # Example output:
    # stash@{0}: On main: work on feature-xyz
    # stash@{1}: On main: another bug fix
    ```

- **Apply the most recent stash and remove it from the list:**

    ```bash
    git stash pop
    ```

    _(This is the most common command to restore your work)_

- **Apply a specific stash (without removing it from the list):**
 
    ```bash
    git stash apply stash@{1}
    ```

- **Remove the most recent stash:**

    ```bash
    git stash drop
    ```

- **Remove a specific stash:**

    ```bash
    git stash drop stash@{1}
    ```

- **Delete all stashes:**

    ```bash
    git stash clear
    ```