#### **What it is:**

`git stash` is a command that temporarily saves your uncommitted changes (both staged and unstaged) and reverts your working directory to a clean state. It stores these changes on a stack of stashes, allowing you to reapply them later. This is useful when you need to quickly switch context without creating an unnecessary commit.

#### **Purpose:**

The primary purpose of `git stash` is to handle work-in-progress that you are not ready to commit. Common scenarios include:

- **Switching Branches:** You need to switch to another branch to fix an urgent bug or pull in new changes, but your current work is incomplete. Stashing allows you to move to the new branch with a clean working directory and then return to your unfinished work later.
- **Running a Quick Test:** You want to run a test on a clean version of your code but don't want to discard your recent changes. Stashing saves your changes so you can run the test and then reapply them.
- **Cleaning up a Branch:** You've made several changes on a branch and want to rebase, but you want to ensure the rebase applies cleanly without interference from uncommitted changes.

#### **Analogy:**

Think of your working directory as a workbench. You're in the middle of a project and have tools and parts scattered all over it. Suddenly, someone needs the workbench for a moment.

- **`git stash`** is like sweeping all your tools and parts into a box and placing the box on a nearby shelf. Your workbench is now clean and ready for the other person to use.
    
- **`git stash list`** is checking the shelf to see all the boxes you've put there.
    
- **`git stash pop`** is taking the most recent box from the shelf, emptying its contents back onto your workbench exactly where they were, and then throwing the box away.
    
- **`git stash apply`** is taking a box from the shelf and putting its contents back on your workbench, but leaving the box on the shelf in case you need to re-use it elsewhere.
    

#### **Example Commands:**

- **Save your changes with a message:**
    
    Bash
    
    ```
    git stash push -m "work on feature-xyz"
    ```
    
    _(`git stash` without a message will also work, but a message is recommended)_
    
- **View your list of stashes:**
    
    Bash
    
    ```
    git stash list
    # Example output:
    # stash@{0}: On main: work on feature-xyz
    # stash@{1}: On main: another bug fix
    ```
    
- **Apply the most recent stash and remove it from the list:**
    
    Bash
    
    ```
    git stash pop
    ```
    
    _(This is the most common command to restore your work)_
    
- **Apply a specific stash (without removing it from the list):**
    
    Bash
    
    ```
    git stash apply stash@{1}
    ```
    
- **Remove the most recent stash:**
    
    Bash
    
    ```
    git stash drop
    ```
    
- **Remove a specific stash:**
    
    Bash
    
    ```
    git stash drop stash@{1}
    ```
    
- **Delete all stashes:**
    
    Bash
    
    ```
    git stash clear
    ```