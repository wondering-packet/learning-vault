#### **Command**

`git rebase`

#### **Purpose**

Moves or combines a series of commits to a new base commit. It's a powerful tool for rewriting commit history and maintaining a clean, linear project history.

#### **Syntax**

git rebase <base-branch>

git rebase -i <commit-hash>

#### **Key Flags**

- `-i` or `--interactive`: Opens an interactive session that allows you to reorder, squash, edit, or drop individual commits. This is a very powerful and flexible tool for cleaning up your history before a final merge.
    
- `--onto`: Used in more advanced scenarios to rebase a subset of commits from one branch to another.
    
- `--continue`, `--skip`, `--abort`: These are subcommands used during an interactive rebase to manage the process after a conflict or an edit.
    

#### **Example**

```bash
# Move the current branch's commits on top of the 'main' branch
git rebase main

# Start an interactive rebase on the last 3 commits
git rebase -i HEAD~3
```

#### **Related Commands**

- **`git merge`**: The primary alternative to `git rebase` for combining branches. `git merge` preserves a branch's history with a merge commit, while `git rebase` rewrites history to create a linear flow.
    
- **`git cherry-pick`**: A more surgical tool for applying changes from a single, specific commit, without replaying a whole series of commits.
    
- **`git push --force`**: Often necessary when pushing a rebased branch to a remote repository, as you are rewriting history. This is dangerous for shared branches, so use it with caution.
    
- **`git log`**: Essential for viewing the commit history both before and after a rebase to understand the changes.