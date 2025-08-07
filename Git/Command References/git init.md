#### **Command**

`git init`

#### **Purpose**

Initializes a new, empty Git repository in the current directory. This creates the hidden `.git` folder, which contains all the necessary objects and files to track your project's history.

#### **Syntax**

`git init`

#### **Key Flags**

- `--bare`: Creates a "bare" repository. Bare repos do not have a working directory and are typically used for remote repositories (e.g., on a server) to host the project's history without allowing direct editing.
    
- `--initial-branch=<name>`: Specifies the name of the first branch to be created. For example, `git init --initial-branch=main`.
    

#### **Example**

Bash

```bash
# Creates a new directory for your project
mkdir my-new-project
cd my-new-project

# Initializes an empty Git repository in 'my-new-project'
git init
```

#### **Related Commands**

- **`git clone`**: Creates a copy of an existing remote repository on your local machine. If you're starting a project that already exists, this is the command you'll use instead of `git init`.
    
- **`git add`**: After `git init`, you'll use `git add` to start staging your project's files.
    
- **`git remote add origin`**: Once you have an empty local repository, you'll use this command to link it to a remote repository (like one on GitHub or GitLab).