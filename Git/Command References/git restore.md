### `git restore`

- **Command:**  
  `git restore <file>`

- **Purpose:**  
  Discards changes in the working directory for tracked files.

- **Syntax:**  
  ```bash
  git restore config.yaml
  ```

- **Key Flags:**  
  - `--staged`: Unstage file  
  - *(No flag)*: Restore from last commit

- **Example:**  
  ```bash
  git restore main.py
  ```

- **Related Commands:**  
  - `git checkout -- <file>` – legacy version  
  - `git reset` – unstage changes