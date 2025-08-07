### `git clean`

- **Command:**  
  `git clean -fd`

- **Purpose:**  
  Remove untracked files and directories from the working directory.

- **Syntax:**  
  ```bash
  git clean -fd
  ```

- **Key Flags:**  
  - `-f`: Force (required)  
  - `-d`: Include directories

- **Example:**  
  ```bash
  git clean -fd
  ```

- **Related Commands:**  
  - `git reset --hard` – discard tracked changes  
  - `git status` – view untracked files