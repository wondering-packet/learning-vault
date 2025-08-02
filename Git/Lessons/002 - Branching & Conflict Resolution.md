### Branches
- A branch is just a **pointer** to a commit.
- `[^1]main` (or `master`) is the default branch.
- Feature branches allow isolated development.

### Merging
- Combines histories of two branches.
- **Fast-forward merge** → when main hasn’t moved since branch creation.
- **Merge commit** → when histories diverge.

### Rebasing
- Moves your branch commits **on top of** another branch.
- Keeps history linear → no merge commits.
- Good for keeping a clean main history.

### Conflicts
- Occur when Git can’t decide which changes to keep.
- **Conflict markers**:
    ```plaintext
    <<<<<<< HEAD      # current branch’s code
    =======           # separator
    >>>>>>> branch    # other branch’s code
    ```
- You must **manually edit**, then:
   ```bash
    git add <filename>
    git rebase --continue
    # or
    git merge --continue
    ```

[^1]: [[]]
