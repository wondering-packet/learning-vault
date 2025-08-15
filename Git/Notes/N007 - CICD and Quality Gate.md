# **CI/CD & Quality Gates in Git**

## **1. What is CI/CD?**

- **CI** = **Continuous Integration**
  - Automatically test & validate your code every time you push changes.
  - Goal: Catch bugs early & keep `main` branch stable.

- **CD** = **Continuous Delivery** / **Continuous Deployment**
  - **Continuous Delivery** → Automatically prepares tested code for release, but requires human approval to deploy.
  - **Continuous Deployment** → Fully automates deployment to production once tests pass.

**💡 Analogy:**  
Think of CI/CD like a **robotic pit crew**. Every time you bring your car (code) into the pit (push), they **check it**, **fix issues**, and **send it out** without you lifting a wrench.

**Why it matters:**  
CI/CD creates a feedback loop that ensures:
- Problems are caught early (in minutes, not days).
- Code is always in a deployable state.
- Developers spend more time delivering features, less time fixing integration issues.

> [!tip]
> 
> Find the exercise for these notes here: [E007 - CICD](../Exercises/E007%20-%20CICD.md).

---

## **2. Where Git Fits into CI/CD**
Git acts as the **trigger** for automation.

- Push code → Automation pipeline runs.
- Merge PR → Tests run automatically.
- Tag release → Deployment job runs.

---

## **3. What are Quality Gates?**
Quality gates are **checkpoints** in the CI/CD pipeline that code must pass before being merged or deployed.

Think of them as **filters** that prevent bad code from entering `main`.

Common quality gates:
- **Code formatting checks** – enforce consistent style.
- **Linting** – detect syntax errors, unused variables, and style violations.
- **Automated tests** – verify functionality.
- **Coverage thresholds** – ensure enough of your code is tested.

Implementation:
- **Local**: Git Hooks (e.g., pre-commit hooks).
- **Remote**: CI workflow (e.g., GitHub Actions).

---

## **4. Git Hooks**

Git has a built-in hooks system.

### **4.1 Client-side hooks** (your machine):
- Example: `pre-commit` → runs before commit is saved.
- Blocks bad commits (e.g., stop commits if linting fails).

### **4.2 Server-side hooks** (on remote repo):
- Example: `pre-receive` → blocks incoming pushes if they fail validation.

**Important:** Local hooks are **not shared by default** with other developers. Use a tool like [`pre-commit`](https://pre-commit.com/) to manage and share hook configs.

---

## **5. Pre-commit Hooks & Example Tools**

### **a) Formatters**

#### **Black** (Python Code Formatter)
- Opinionated formatter – no debates, no arguments.
- Usage:
```bash
# Format all Python files in current directory (recursive)
black .

# Silent execution (good for hooks)
black . --quiet

# Check only (good for CI workflows)
black --check
```

#### **isort** (Import Sorter)
- Automatically sorts import statements.
- Usage:
```bash
# Sort imports recursively 
isort .

# Compatible with Black formatting (good for hooks)
isort . --profile black

# Check only (good for CI workflows)
isort --check-only .
```

### **b) Linting**

#### **flake8** (Python Linter)
- Checks Python code for PEP8 compliance and common issues.
- Usage:
```bash
flake8 .
```

### **c) Coverage**
- Measures how much of your code is executed by tests.
- Example commands:
```bash
# Show coverage
pytest --cov=apps --cov-report=term-missing

# Fail if coverage is under 80%
pytest --cov=apps --cov-fail-under=80
```
**Note:** 80% is a common threshold, but coverage ≠ quality. High coverage with weak tests is still risky.


### **d) Pytest**

Pytest automatically **discovers and runs your test functions**, telling you instantly if they pass or fail. This helps you catch bugs early and ensures your code remains rock-solid and reliable every time you make a change.

#### **Example**

Let's say you have a simple function in a file named `my_functions.py`:

Python

```python
# my_functions.py
def add(x, y):
    return x + y
```

You would create a separate test file (Pytest looks for files starting with `test_`) to check it:

```python
# test_my_functions.py
from my_functions import add

def test_add_positive_numbers():
    assert add(2, 3) == 5

def test_add_negative_numbers():
    assert add(-1, -1) == -2
```

Now, from your terminal, you just run the `pytest` command.

```bash
$ pytest
```

**Output:**

```
============================= test session starts ==============================
collected 2 items

test_my_functions.py ..                                                  [100%]

============================== 2 passed in 0.01s ===============================
```

---

## **6. GitHub Actions – Cloud CI/CD**

GitHub Actions lets you create `.yml` workflows in `.github/workflows/` that run whenever events happen in your repo.

### **Example: Full Quality Gate Workflow**

name: Quality Gates  # Workflow name as it will appear in GitHub Actions tab

```yaml
on:
  push:
    branches: [ main ]       # Trigger when code is pushed to main
  pull_request:
    branches: [ main ]       # Trigger when PR targets main

jobs:
  quality-checks:            # Job name (can be anything)
    runs-on: ubuntu-latest    # Runs on GitHub's latest Ubuntu environment
    steps:
    - uses: actions/checkout@v3  # Step 1: Pull repo code into the runner

    - name: Set up Python
      uses: actions/setup-python@v4
      with:
        python-version: '3.10'  # Python version for all steps below

    - name: Install dependencies
      run: |                     # '|' means multi-line shell command
        pip install -r requirements.txt   # Install project dependencies
        pip install black isort flake8 pytest pytest-cov  # Install quality gate tools

    - name: Check formatting with Black
      run: black --check .       # Fail if code not formatted per Black standards

    - name: Check imports with isort
      run: isort . --check --profile black  # Fail if imports not sorted, use Black style

    - name: Lint with flake8
      run: flake8 .              # Fail if PEP8 or linting issues are found

    - name: Run tests with coverage
      run: pytest --cov=apps --cov-fail-under=80  # Run tests, fail if <80% coverage
```

---

## **7. CI/CD Workflow in Real Life**
1. **Commit & Push** → Local pre-commit hook runs.
2. **Push passes** → GitHub Actions runs formatters, linters, tests.
3. **All checks pass** → PR can be merged.
4. **Merge to main** → Deploy pipeline triggers (optional).

---

## **8. Why This Matters**
- Stops bugs **before** they hit production.
- Automates boring tasks (tests, builds, deploys).
- Builds trust in `main` – always stable, always deployable.
- Saves time & money – catching bugs early is far cheaper than fixing them post-deploy.

---

**📌 Pro Tip:** Use both local hooks (instant feedback) and remote CI (team-wide enforcement) for maximum code quality.
