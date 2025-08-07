#### **Command**

`git branch`

#### **Purpose**

Manages branches in your repository. This command can list existing branches, create new ones, and delete them.

#### **Syntax**

git branch

git branch <new-branch-name>

git branch -d <branch-name>

#### **Key Flags**

- `-a` or `--all`: Lists both local and remote-tracking branches.
    
- `-r` or `--remotes`: Lists only the remote-tracking branches.
    
- `-d` or `--delete`: Deletes a local branch, but only if it's already been merged. This is a "safe" delete.
    
- `-D`: Forces the deletion of a local branch, even if it has unmerged changes. Use with caution.
    
- `-m` or `--move`: Renames a branch.
    

#### **Example**

```bash
# Lists all local branches, with an asterisk (*) next to the current branch
git branch

# Creates a new local branch called 'feature/branch-management'
git branch feature/branch-management

# Deletes a local branch named 'feature/old-branch'
git branch -d feature/old-branch

# Lists all local and remote branches
git branch -a
```

#### **Related Commands**

- **`git checkout`**: Switches to an existing branch. You can also use `git checkout -b <new-branch-name>` to create and switch to a new branch in one command.
    
- **`git switch`**: A newer, more dedicated command for switching branches.
    
- **`git merge`**: Combines the history of a specified branch into the current one.
    
- **`git push`**: Used to push a new branch to a remote repository.
    
- **`git push origin --delete <branch-name>`**: The command used to delete a branch from a remote repository.