#### **What it is:**

Squashing is a Git operation that combines multiple commits into a single commit. When used with interactive rebase (`git rebase -i`), it allows you to choose which commits to merge together, presenting a clean, unified change to your project history.

#### **Purpose:**

The purpose of squashing is to **simplify and streamline your commit history**. This is done by consolidating small, temporary commits (e.g., "WIP," "fix typo," "refactor") into one logical, atomic commit. This makes the project history easier to read and understand, and provides a clear narrative for each major change.

#### **Real world application:**

- **Finalizing a Feature:** A developer might make several commits while building a new feature. Before merging into the main branch, they use interactive rebase to squash all of these small changes into one commit with a comprehensive message like "feat: implement user authentication."
- **Cleaning Up a Pull Request:** If a pull request has a messy history with many incremental commits, squashing allows the contributor to present a clean, single commit that represents the entire feature.
- **Reverting a Change:** If you need to revert a feature that was built across many commits, squashing those commits into one makes the reversion process much simpler, as you only have to revert a single commit instead of many.

### Example Commands

To begin an interactive rebase on the last **3** commits, you would run:

Bash

```bash
git rebase -i HEAD~3
```

When the editor opens, you'll see a list of your commits. **The key thing to notice is that the commits are shown in reverse chronological order**, with the oldest commit at the bottom and the newest at the top. This is the opposite of a `git log` output, so it's a common point of confusion. The editor will look similar to this:

```
pick 6c303f5 feat: finish feature  (newest commit)
pick 5a3371f fix: typo in previous commit
pick 9128f09 WIP: add some code     (oldest commit)
```

To squash commits, you must **keep the top-most commit in the list as "pick"**. This commit serves as the "base" or starting point for the new, combined commit. The commits you mark with `squash` will be merged into this base commit. If you were to squash all of them, there would be no base to merge them into, leading to a rebase error.

After marking the second and third commits with `squash`, the file would look like this:

```
pick 6c303f5 feat: finish feature
squash 5a3371f fix: typo in previous commit
squash 9128f09 WIP: add some code
```

After you save and close the editor, Git will then open a new prompt where you can write the final, single commit message for all the combined changes.