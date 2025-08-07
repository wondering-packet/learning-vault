#### **Command**

`git switch`

#### **Purpose**

Switches to an existing branch or creates and switches to a new one. It was introduced in Git version 2.23 as a safer, more intuitive, and dedicated alternative to `git checkout` for managing branches.

#### **Syntax**

git switch <branch-name>

git switch -c <new-branch-name>

#### **Key Flags**

- `-c` or `--create`: Creates a new branch and immediately switches to it. This is the modern replacement for `git checkout -b`.
    
- `-` (hyphen): Switches back to the branch you were on previously. This is a handy shortcut for toggling between two branches.
    
- `--detach`: Switches to a specific commit, leaving you in a "detached HEAD" state. This is useful for inspecting or experimenting with an older version of your code.
    
- `--discard-changes`: Force-switches to a branch, discarding any local un-staged changes that would conflict. Use this with extreme caution, as it will cause data loss.
    

#### **Example**

```bash
# Switches to an existing branch named 'main'
git switch main

# Creates a new branch named 'feature/profile' and switches to it
git switch -c feature/profile

# Switches back to the previous branch you were on
git switch -
```

#### **Related Commands**

- **`git checkout`**: The older, more versatile command that handles both branch switching and file restoration. `git switch` and `git restore` were created to split `git checkout`'s functionality into two clearer commands.
    
- **`git restore`**: The modern command for restoring files in the working directory, taking over the file-related functions of `git checkout`.
    
- **`git branch`**: Used to list, create, or delete branches without switching to them.