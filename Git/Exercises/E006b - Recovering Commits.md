
##### **We will be breaking this down into 2 scenarios:**
1. **Restoring a branch to a previous state:** you made some commits (good ones that implemented some new features) then you made some more commits (which accidentally broke new features) - Now you want to restore your work to how it was when the new features were working.
2. **Inspecting a Commit, Branching Off & Restoring a Specific Commit:** after a while later, you are asked to find out more about what changes in those new commits caused the new features to break So you decide to checkout one of the commits to explore the changes in detail. While you are exploring you realize there is a bug in this commit - you decide to fix the bug & replay this commit back to the branch. 

> We are skipping the PR process in this scenarios but in real-world there will of course be a proper review & approval before the fixed is implemented.

#### **1. Restoring a branch to a previous state**
