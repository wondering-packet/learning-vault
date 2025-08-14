# CI/CD Quality Gates

## What is CI/CD?
- **CI (Continuous Integration)**: The practice of frequently merging code changes into a shared repository and automatically verifying them through automated builds and tests.
  - Goal: Catch bugs early, avoid "merge hell", and maintain a working main branch.
  - Example: Every time you push code to GitHub, tests run automatically.

- **CD (Continuous Delivery / Deployment)**:
  - **Continuous Delivery**: Code changes are automatically prepared for release but require a manual step to deploy to production.
  - **Continuous Deployment**: Every change that passes automated tests is automatically deployed to production without manual intervention.

- **Why it matters**:  
  CI/CD creates a feedback loop that ensures:
  - Problems are caught early (in minutes, not days).
  - Code is always in a deployable state.
  - Developers spend less time fixing integration issues and more time delivering features.

---

## What are Quality Gates?
Quality gates are **checkpoints** in the CI/CD pipeline that code must pass before being merged or deployed.  
Think of them as **filters** to prevent bad code from entering the main branch.

Common quality gates:
1. **Code formatting checks** – enforce consistent style.
2. **Linting** – detect syntax errors, unused variables, and style violations.
3. **Automated tests** – verify functionality.
4. **Coverage thresholds** – ensure enough of your code is tested.

---

## Key Topics Covered

### 1. Pre-commit Hooks
- Purpose: Catch issues **before** code is committed to Git.
- For example, we can create a `.git/hooks/pre-commit` script that:
  1. Blocks commits if staged changes contain `TODO`.
  2. Runs `black` and `isort` to auto-format code.
  3. Runs `flake8` for linting.

---

### 2. Formatters
- **Black**:
	- An **uncompromising Python code formatter**. Its job is to take your messy, inconsistently spaced code and reformat it to a single, beautiful standard. The key thing about Black is that it's **opinionated**. That means there are almost no configuration options. You don't argue with Black; you just let it do its thing. 
	- Its goal is to eliminate debates about code style entirely. By running Black, you get a clean, consistent format across your entire project, no matter who wrote the code.
	- Usage:
	    ```bash
	    # run on all python files in the current directory resursively.
		black .  
		# same as above but silent execution (no output).
		# note: good for use in pre-commit hook.
		black . --quiet  
		# checks only. no auto formatting like above two.
		# note: good for use in CI workflow.
		black --check  
	    ```

- **isort**:
	- isort is a tool that **sorts your imports**. It automatically organizes all your import statements at the top of your Python files.
	- Usage:
	    ```bash
	    # run on all python files in the current directory resursively.
	    # note: good for use in pre-commit hook.
	    isort . 
	    # be compatiable with Black's formatting.
	    # note: good for use in CI workflow.
	    isort . --profile black 
	    ```

---

### 3. Linting
- **flake8**:
	- Checks Python code for PEP8 compliance and common issues.
	- Run after formatters to catch logic/style issues that formatters don’t fix.
	- Usage:
		```bash
		flake8 .  # run on all python files in the current directory resursively.
		```

---

### 4. Coverage
- **Coverage** measures how much of your code is executed by tests.
- Command:
  ```bash
  pytest --cov=apps --cov-report=term-missing
  ```
- Fail pipeline if coverage < threshold:
  ```bash
  pytest --cov=apps --cov-fail-under=80
  ```

---

### 5. Fixing Import Errors in CI
- Problem: `ModuleNotFoundError` in GitHub Actions.
- Solution: Added `pytest.ini`:
  ```ini
  [pytest]
  pythonpath = .
  ```
  This ensures tests can import from the project root.

---

### 6. “All done! ✨ 🍰 ✨” Message
- This message is from **black**, not from our hook.

---

## Commands Recap
```bash
# Run formatters
black .
isort .

# Run linting
flake8 .

# Run tests with coverage
pytest --cov=apps --cov-report=term-missing

# Fail if coverage <80%
pytest --cov=apps --cov-fail-under=80
```

---

## Lesson Takeaways
- **Automate everything** – the earlier an error is caught, the cheaper it is to fix.
- Formatters → Linting → Tests → Coverage = solid quality pipeline.
- CI/CD ensures constant feedback, stable code, and faster delivery.

---

## Quiz Result
- Score: **7/10** ✅  
- Q7 & Q9 need re-attempt (cheated last time 😏).

---
