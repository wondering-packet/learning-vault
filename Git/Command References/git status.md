#### **Command**

`git status`

#### **Purpose**

Shows the current state of your working directory and staging area. It tells you which files are staged, which are modified but not staged, and which are untracked. It's the most common command you'll run to get a quick overview of what's happening in your repository.

#### **Syntax**

`git status`

#### **Key Flags**

- `-s` or `--short`: Gives a condensed, one-line summary of the status. This is great for a quick look without the verbose output.
    
- `-b` or `--branch`: Shows the branch name and a short summary of its status. This is on by default and is often used with other flags.
    

#### **Example**


```bash
# A typical status output with untracked, modified, and staged files
git status
# On branch main
# Your branch is up to date with 'origin/main'.
#
# Changes to be committed:
#   (use "git restore --staged <file>..." to unstage)
#         modified:   login.md
#
# Changes not staged for commit:
#   (use "git add <file>..." to update what will be committed)
#   (use "git restore <file>..." to discard changes in working directory)
#         modified:   git-flow.md
#
# Untracked files:
#   (use "git add <file>..." to include in what will be committed)
#         README.md
```

#### **Related Commands**

- **`git add`**: Used to move files from the "Changes not staged for commit" or "Untracked files" sections to the "Changes to be committed" section.
    
- **`git commit`**: Takes the files from the "Changes to be committed" section and creates a new commit.
    
- **`git restore`**: Used to unstage a file (`--staged`) or discard changes in the working directory.
    
- **`git log`**: Shows the history of committed changes, which is what `git status` helps you prepare.