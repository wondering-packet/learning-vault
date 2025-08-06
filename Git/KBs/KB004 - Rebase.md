#### What it is:

`git rebase` is a Git command that allows you to **re-write commit history** by moving or combining a sequence of commits to a new base commit.

* **Changes Commit Hashes:** When you rebase, Git creates *new commits* for the ones being moved. Even if the content changes are identical, the new commits will have different hashes because their parent commit has changed.
* **Moves Branch Base:** It essentially takes your branch's commits that are unique to it, "unapplies" them, updates your branch to the new base, and then "reapplies" your unique commits on top of that new base.
* **No New Merge Commit (typically):** When used to integrate changes, rebasing avoids creating the "merge commit" that `git merge` would produce. This keeps the history linear.

**Visual Representation (Before Rebase):**

Imagine `feature/A` branched from `main` at commit `C`. Since then, both `main` and `feature/A` have new commits.

```
A -- B -- C (main_original_base) -- D -- E (main)

F -- G -- H (feature/A)
```
(Here, `main` has commits D and E, while `feature/A` has commits F, G, and H, all parallel.)

**Visual Representation (After `git rebase main`):**

`feature/A`'s commits (F, G, H) are re-written as F', G', H' and placed on top of `main`'s latest commit (E).

```
A -- B -- C -- D -- E (main) -- F' -- G' -- H' (feature/A)
```
(Notice the linear history; F, G, H no longer exist in the active history.)

#### Purpose:

The primary purposes of `git rebase` are:

1.  **Create a Cleaner, Linear History:** By reapplying commits on top of another branch, `rebase` eliminates the divergent branches and merge commits that `git merge` would create. This makes the project history look cleaner, as if all work was done sequentially on a single line.
2.  **Update Feature Branches:** It's commonly used to "update" a feature branch with the latest changes from a `main` or `develop` branch before merging. This ensures your feature branch is based on the most current code, minimizing potential conflicts during the final merge.
3.  **Squash/Edit Commits:** Interactive rebase (`git rebase -i`) allows for powerful history manipulation like combining multiple commits into one (squashing), reordering commits, editing commit messages, or even dropping commits. (This is an advanced use case).

#### Analogy:

Think of your branch (`feature/A`) as a stack of new building blocks (commits F, G, H) that you've added to a foundation (commit C). Meanwhile, the main building (`main` branch) has had more floors (commits D, E) added.

* **`git merge main`**: Is like building a new bridge between your feature stack and the main building at its current height. You create a new connection point (merge commit).
* **`git rebase main`**: Is like taking your stack of new building blocks (F, G, H), carefully *dismantling them*, moving them to the top of the main building's latest floor (E), and then *re-stacking them* (as F', G', H') on top of that new base. Your blocks are the same, but their position in the overall structure has changed, and they are now directly part of the main tower.

#### **Real world application** 

Imagine you've been working on a new feature for a week and the main branch has had 20 new commits from other team members. Before you merge your feature into the main branch, it's good practice to rebase your branch on top of main. This ensures your code is up-to-date with all the latest changes and a final merge will be a simple fast-forward, preventing merge conflicts and keeping the project history clean.
#### Example Commands:

Let's illustrate a common rebase scenario: you have a feature branch, `main` has new commits, and you want to rebase your feature branch on top of `main`.

1.  **Initial Setup (Diverging History):**
    * Assume `main` has commits `C1 -- C2`.
    * You create `feature/rebase-me` from `C2`.
    * You add `F1 -- F2` to `feature/rebase-me`.
    * Separately, someone else adds `M1 -- M2` to `main`.

    **Graph before rebase:**
    ```
    A -- B -- C1 -- C2 (origin/main) -- M1 -- M2 (HEAD -> main)
                   \
                    F1 -- F2 (feature/rebase-me)
    ```

2.  **Ensure `main` is up-to-date locally:**
    Before rebasing your feature branch, always make sure your local `main` branch has the latest changes from the remote.

    ```bash
    git checkout main
    git pull origin main # Pulls M1 and M2 into your local main
    ```

3.  **Rebase your Feature Branch:**
    Now, switch back to your feature branch and rebase it onto `main`.

    ```bash
    git checkout feature/rebase-me
    git rebase main
    ```

    **Expected Output (Illustrative - actual messages vary):**
    ```
    Successfully rebased and updated refs/heads/feature/rebase-me.
    ```
    *If there are conflicts*, Git will pause and tell you to resolve them. After resolving, you'd `git add .` the resolved files, and then `git rebase --continue`.

4.  **Validate the Changed History (using `git log`):**
    Observe the linear history and the new commit hashes.

    ```bash
    git log --oneline --graph --all
    ```

    **Expected Output (Conceptual After Rebase):**
    ```
    * F2' (HEAD -> feature/rebase-me) Feature commit F2 (new hash)
    * F1' Feature commit F1 (new hash)
    * M2 (main) Main commit M2
    * M1 Main commit M1
    * C2 Base commit C2
    * C1 Base commit C1
    * ... (previous commits)
    ```
    Notice how F1 and F2 are now F1' and F2' (new hashes), and they are directly on top of M2, making the history linear.

> [!caution]
> ### **CRITICAL WARNING: DO NOT REBASE SHARED HISTORY**
> 
> * **Never rebase commits that you have already pushed to a public/shared remote repository and that other people might have pulled down.**
> * Rebasing re-writes history by creating new commits. If others have based their work on your *old* commits, then when you push your *new* commits after a rebase, their history will diverge from yours, causing significant headaches and requiring complex `git pull --rebase` or `git pull --force` commands for them, which can be disastrous.
> * **Rebase only your local, unpushed, private branches.** Once commits are shared, prefer `git merge` for integration.

> [!tip]
> Exercise at: [[E002c - Rebase]].