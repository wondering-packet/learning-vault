#### **Command**

`git clean`

#### **Purpose**

Removes untracked files from your working directory. This is useful for tidying up your project directory and removing temporary files or build artifacts that you don't want to commit.

#### **Syntax**

git clean -n

git clean -f

git clean -df

git clean -x

#### **Key Flags**

- `-n` or `--dry-run`: Performs a "dry run" and shows you which files **would be deleted** without actually deleting them. This is a crucial safety step.
    
- `-f` or `--force`: Deletes the files. This flag is required unless the `clean.requireForce` configuration is set to `false`.
    
- `-d`: Removes untracked directories in addition to untracked files.
    
- `-x`: Removes untracked files ignored by `.gitignore`, as well as regular untracked files. This is very destructive and should be used with extreme caution.
    
- `-e` or `--exclude`: Excludes specific files from being cleaned.
    

#### **Example**

```bash
# See what files would be deleted (safe dry-run)
git clean -n

# Forcefully delete all untracked files
git clean -f

# Forcefully delete all untracked files and directories
git clean -df

# Forcefully delete all untracked files, including those in .gitignore
git clean -xf
```

#### **Related Commands**

- **`git status`**: Shows which files are untracked and would be affected by `git clean`. You should always run `git status` before `git clean -n`.
    
- **`.gitignore`**: A file that tells Git to ignore certain files and directories. `git clean` respects this file unless you use the `-x` flag.