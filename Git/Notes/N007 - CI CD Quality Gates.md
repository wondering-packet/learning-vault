
## **1. What is CI/CD?**

- **CI** = **Continuous Integration**
    
    - Automatically test & validate your code every time you push changes.
    - Goal: Catch bugs early & keep `main` branch stable.
    
- **CD** = **Continuous Delivery** / **Continuous Deployment**
    
    - Automatically deploy tested code to production or staging after it passes CI checks.
    - **Delivery** → Requires a human to approve deploy.
    - **Deployment** → Fully automated deploy.

**💡 Analogy:**  
Think of CI/CD like having a robotic pit crew. Every time you bring your car (code) into the pit (push), they **check it**, **fix issues**, and **send it out** without you lifting a wrench.

**Why it matters**:  
CI/CD creates a feedback loop that ensures:
- Problems are caught early (in minutes, not days).
- Code is always in a deployable state.
- Developers spend less time fixing integration issues and more time delivering features.

---
## **2. Where Git Fits into CI/CD**

Git acts as the **trigger** for automation.

- Push code → Automation pipeline runs.
- Merge PR → Tests run automatically.
- Tag release → Deployment job runs.

---

## **3. Git Hooks**

Git itself has a built-in **hooks** system:

- **Client-side hooks** (your machine):
    
    - Example: `pre-commit` → runs before commit is saved.
    - Block bad commits (e.g., stop commits if linting fails).
    
- **Server-side hooks** (on remote repo):
    
    - Example: `pre-receive` → blocks incoming pushes if they fail validation.


---
### **4. GitHub Actions (Cloud CI/CD)**

GitHub Actions lets you create `.yml` workflows that run **in GitHub’s cloud** whenever events happen in your repo.

**Example Workflow:** Runs tests every time you push to `main`.

```yaml
name: Run Tests

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.10'
    - name: Install dependencies
      run: pip install -r requirements.txt
    - name: Run tests
      run: pytest
```

💡 **Note:** You store this file in `.github/workflows/` directory.

---

### **5. Pre-commit Hook Example**

Local hook to block commits if there are lint errors:

```bash
# .git/hooks/pre-commit
#!/bin/bash
echo "Running linter..."
flake8 .
if [ $? -ne 0 ]; then
  echo "❌ Lint failed, commit aborted."
  exit 1
fi
```

To enable:

```bash
chmod +x .git/hooks/pre-commit
```

---

### **6. Workflow in Real Life**

1. You **commit & push** → Pre-commit hook checks your code.
2. Push passes → GitHub Actions runs tests.
3. If tests pass → PR can be merged.
4. Merge to main → Deploy pipeline triggers (optional).

---

## **7. Why This Matters**

1. Stops bugs **before** they hit production.
2. Automates boring tasks (tests, builds, deploys).
3. Builds trust in the `main` branch — always stable, always deployable.

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
