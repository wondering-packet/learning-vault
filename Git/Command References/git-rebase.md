### `git rebase`

- **Command:**  
  `git rebase <base-branch>`

- **Purpose:**  
  Reapply commits on top of another base tip, used for linearizing history.

- **Syntax:**  
  ```bash
  git rebase main
  ```

- **Key Flags:**  
  - `-i`: Interactive mode  
  - `--continue`: Continue after conflict resolution  
  - `--abort`: Cancel an ongoing rebase

- **Example:**  
  ```bash
  git rebase main
  ```

- **Related Commands:**  
  - `git merge` – alternative for combining branches  
  - `git cherry-pick` – apply specific commits