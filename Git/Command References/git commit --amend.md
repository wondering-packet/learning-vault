### `git commit --amend`

- **Command:**  
  `git commit --amend`

- **Purpose:**  
  Modify the most recent commit — typically used to change the commit message or add forgotten staged changes.

- **Syntax:**  
  ```bash
  git commit --amend [--no-edit]
  ```

- **Key Flags:**  
  - `--no-edit`: Keep the existing commit message  
  - *(No flag)*: Opens editor to change the message  

- **Example:**  
  ```bash
  git add forgotten_file.py
  git commit --amend
  ```
  > Adds `forgotten_file.py` to the previous commit and lets you edit the commit message.

- **Related Commands:**  
  - `git commit` – standard commit  
  - `git reset --soft HEAD~1` – undo the last commit while keeping changes staged  
  - `git rebase -i` – for rewriting multiple commits