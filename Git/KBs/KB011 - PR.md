### **What it is:**

A Pull Request (PR), also known as a Merge Request, is a feature of Git hosting services like GitHub, GitLab, and Bitbucket.1 It's a formal request to merge changes from one branch into another.2 A PR is not a Git command itself but a workflow and a communication tool built on top of Git.

### **Purpose:**

The primary purpose of a PR is to facilitate code review and discussion before merging changes into a shared branch (like `main` or `develop`).3 It allows team members to:

- **Review code** for bugs, style, and best practices.4
    
- **Discuss** the changes and propose improvements.5
    
- **Run automated tests** to ensure the new code doesn't break anything.6
    
- **Track** the progress of a feature or bug fix.7
    

### **Real world application:**

Imagine a team of developers working on a new feature for an e-commerce website. A developer creates a new branch, writes their code, and pushes it to the remote.8 To get their code into the `main` branch, they open a PR.9 This notifies the rest of the team that the code is ready for review.10 Other developers can then comment, suggest changes, or approve the PR, and once it's approved, the code is merged. This collaborative process ensures code quality and prevents unwanted changes from making it into the main codebase.

### **Example Commands:**

Pull Requests don't have their own Git commands. Instead, they are part of a workflow that uses standard Git commands.

```bash
# Step 1: Create a new branch and make changes
git switch -c feature/new-login-form
# ...make your changes...
git add .
git commit -m "feat: add new login form"
git push -u origin feature/new-login-form

# Step 2: Go to GitHub (or other service)
# GitHub will detect your push and show a "Compare & Pull Request" button.
# Click it to open the Pull Request.

# Step 3: Get approval and merge
# Your team reviews the code. Once approved, you merge it.
# The merge action is performed on the GitHub UI.
```