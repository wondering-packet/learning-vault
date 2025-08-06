#### **What it is:**

Squashing is a Git operation that combines multiple commits into a single commit. When used with interactive rebase (`git rebase -i`), it allows you to choose which commits to merge together, presenting a clean, unified change to your project history.

#### **Purpose:**

The purpose of squashing is to **simplify and streamline your commit history**. This is done by consolidating small, temporary commits (e.g., "WIP," "fix typo," "refactor") into one logical, atomic commit. This makes the project history easier to read and understand, and provides a clear narrative for each major change.

#### **Real world application:**

- **Finalizing a Feature:** A developer might make several commits while building a new feature. Before merging into the main branch, they use interactive rebase to squash all of these small changes into one commit with a comprehensive message like "feat: implement user authentication."
- **Cleaning Up a Pull Request:** If a pull request has a messy history with many incremental commits, squashing allows the contributor to present a clean, single commit that represents the entire feature.
- **Reverting a Change:** If you need to revert a feature that was built across many commits, squashing those commits into one makes the reversion process much simpler, as you only have to revert a single commit instead of many.

#### **Example Commands:**

1. To begin an interactive rebase on the last **3** commits, you would run:

    ```bash
    git rebase -i HEAD~3
    ```

2. In the editor that opens, you would keep the first commit with `pick` and change the subsequent commits to `squash` (or `s`).

    ```bash
    pick 6c303f5 feat: finish feature
    squash 5a3371f fix: typo in previous commit
    squash 9128f09 WIP: add some code
    ```

3. After saving and closing the editor, a new prompt will open. This is where you write the final, single commit message for all the squashed commits.