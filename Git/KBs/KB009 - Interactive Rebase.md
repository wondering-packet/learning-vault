#### **What it is:**

Interactive rebase is a powerful Git command that allows you to modify a sequence of commits. Instead of just replaying commits on top of another base, it gives you an editor where you can choose exactly how to rewrite your project's history.

#### **Purpose:**

The primary purpose of an interactive rebase is to **clean up your commit history** before sharing it with others. It helps you make a linear, logical, and easy-to-understand project timeline. This is especially useful for pull requests, where you want to present a clean, final set of changes, rather than all the "work in progress" commits you made along the way.

#### **Analogy:**

Think of it like editing a rough draft of an essay. You might have written many sentences and paragraphs, some of which are clumsy or repetitive. An interactive rebase is like going back and tidying up your work:

- **Squashing** combines multiple sentences into one concise, clear sentence.
    
- **Rewording** corrects grammar and spelling mistakes.
    
- **Reordering** moves paragraphs around to improve the flow of ideas.
    
- **Dropping** removes sentences that don't belong in the final draft.
    

The end result is a polished, professional document that tells a clear story.

#### **Real world application:**

- **Preparing a Pull Request:** A developer might make 10 small commits to a feature branch, including commits like "WIP," "fix typo," and "update comment." Before submitting a pull request, they use interactive rebase to squash these into a single, meaningful commit like "feat: Add user login functionality."
    
- **Fixing a Past Mistake:** You realize a commit you made several commits ago has a typo in its message. You can use interactive rebase to go back and simply reword that one commit without changing the others.
    
- **Splitting a Large Commit:** You accidentally committed two unrelated changes together. You can use an interactive rebase to "edit" the commit and split it into two separate, logical commits.
    

#### **Example Commands:**

To start an interactive rebase on the last 3 commits:

Bash

```
git rebase -i HEAD~3
```

Inside the interactive editor that opens, you would see a list of your commits and can choose one of the following actions for each:

- **`pick`**: Keep the commit as is.
    
- **`reword` (or `r`)**: Keep the commit, but change its message.
    
- **`edit` (or `e`)**: Stop at this commit to amend it (e.g., change files).
    
- **`squash` (or `s`)**: Combine this commit with the previous one.
    
- **`fixup` (or `f`)**: Combine this commit with the previous one, but discard this commit's message.
    
- **`drop` (or `d`)**: Remove the commit entirely.