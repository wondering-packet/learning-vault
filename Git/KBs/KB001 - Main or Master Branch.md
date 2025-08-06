#### **What it is:** 

`main` (or historically, `master`) is the conventional name for the **primary, default, or main development branch** in your Git repository.

- It's where the "official" version of your project's history usually resides.
- It's a pointer to a specific sequence of commits.
- You can have many other branches (e.g., `feature-x`, `bugfix-y`, `develop`), but `main` is typically the one from which releases are made and into which other branches are merged.

#### **Local vs. Remote:** 

A branch exists both **locally** (on your machine, e.g., `main`) and **remotely** (on a server, e.g., `origin/main`). When you push your local `main` branch, it becomes `origin/main` on the `origin` remote.

#### **Real world application**

In a team of developers, the main branch is the single source of truth for the project. It represents the official, stable version of the code that's ready to be deployed to users. Developers work on separate feature branches and then merge their completed, tested code into the main branch to update the project.
#### **Example Commands:**

- `git checkout main`: Switch to your local `main` branch.
- `git branch`: See all your local branches (e.g., `* main`, `feature-a`).
- `git merge feature-b main`: Merge `feature-b` into `main`.

> [!NOTE]
> #### Connection b/w Main & Origin:
> The connection between `main` and `origin` is that `main` is a **branch**, and `origin` is the **remote server** where a copy of that `main` branch usually resides.
> 
> - When you `git clone https://github.com/user/repo.git`, you get a local `main` branch, and Git automatically sets up `origin` pointing to `https://github.com/user/repo.git`. It also creates a remote-tracking branch named `origin/main` that keeps track of the state of the `main` branch on the `origin` server.
> 
> - Your **local `main` branch** is typically configured to **track** the **remote `origin/main` branch**. This "tracking" relationship means:
>     - When you `git pull`, it knows to pull from `origin/main`.
>     - When you `git push`, it knows to push to `origin/main`.
> 
> 
> > `main` is **what** you're working on (the branch).
> > `origin` is **where** the primary remote copy of your work resides (the remote server alias).
> > 
> You work on `main` locally, and you use `origin` to synchronize that `main` branch with the central repository.

> [!tip]
> Exercise at: [[E002a - Create branch]].