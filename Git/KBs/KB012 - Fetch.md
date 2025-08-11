### **What it is:**

`git fetch` is a fundamental Git command used to download commits, files, and refs (pointers) from a remote repository into your local repository. It is the "download" half of the `git pull` command.

### **Purpose:**

The primary purpose of `git fetch` is to safely inspect what has changed on a remote repository without altering your local working copy. It updates your **remote-tracking branches** (like `origin/main`), giving you a preview of your team's new work. It allows you to review the changes before you decide to merge them into your own branch, which helps you avoid unexpected merge conflicts.

### **Real world application:**

You are in the middle of a big feature and don't want to mess up your work by automatically pulling in new changes. Instead, you run `git fetch origin`. This downloads all the latest commits from the remote `origin` but keeps them completely separate from your local branch. You can then use `git log` to compare your local branch with the remote one (`git log main..origin/main`), see what's new, and then manually merge or rebase the changes when you're ready. This is a crucial step in a safe, controlled workflow.

### **Example Commands:**

Bash

```
# Fetches all branches and tags from the remote named 'origin'
git fetch origin

# Fetches everything from all remote repositories
git fetch --all

# Fetches only the 'main' branch from the 'origin' remote
git fetch origin main

# After fetching, view what has changed on the remote before merging
# This will show a log of all commits in origin/main that are not yet in your local main branch.
git log main..origin/main
```
