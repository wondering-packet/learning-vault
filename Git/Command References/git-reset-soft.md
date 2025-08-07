### `git reset --soft`

- **Command:**  
  `git reset --soft HEAD~1`

- **Purpose:**  
  Undo the last commit but keep the changes staged.

- **Syntax:**  
  ```bash
  git reset --soft HEAD~1
  ```

- **Key Flags:**  
  - `--soft`: Keep changes in the index  
  - `HEAD~1`: Reset to one commit before HEAD

- **Example:**  
  ```bash
  git reset --soft HEAD~1
  ```

- **Related Commands:**  
  - `git reset --mixed` – unstage changes  
  - `git reset --hard` – discard changes completely