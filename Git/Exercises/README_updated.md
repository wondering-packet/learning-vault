# CI/CD Lab – Python + GitHub Actions (Tested Setup)

Repo: `https://github.com/wondering-packet/ci-cd-lab-files.git`.

Above repo is a **minimal, battle-tested CI pipeline** for a Python project using:
- **Black** (formatting)
- **isort** (imports)
- **Flake8** (linting)
- **Pytest + Coverage** (tests + coverage threshold)
- **GitHub Actions** (CI on push / pull request to `main`)

Follow this guide to **replicate the exact setup** locally and in GitHub.

---

## 1) Prerequisites

- **Git** installed
- **Python 3.10+** installed
- A **GitHub account** and a repo (or fork this one)
- (Optional) A code editor with Python support (VS Code, PyCharm, etc.)

> Tip: On Linux/macOS, confirm versions:
```bash
git --version
python3 --version
```

---

## 2) Project Structure

```
├── .github/
│   └── workflows/           # GitHub Actions CI configuration
├── hooks/                   # Install folder for local Git hooks
│   └── pre-commit           # Hook file, copied via install_hook.sh
├── pyproject.toml           # Tooling config (Black, isort, pytest/coverage)
├── README.md                # Lab instructions
├── requirements.txt         # Project dependencies
├── scripts/                 # Bash scripts
│   ├── tools.sh              # Run formatter & tools manually
│   └── install_hook.sh       # Installs pre-commit hook into .git/hooks
├── src/                     # Python package source
│   ├── apps/                 # Application code
│   │   └── calculator_private.py  # App logic for the lab
│   └── apps.egg-info/        # Auto-generated package metadata (ignore)
│       ├── dependency_links.txt  
│       ├── PKG-INFO  
│       ├── SOURCES.txt  
│       └── top_level.txt  
└── tests/                   # Unit tests (pytest auto-discovers here)
    └── test_calculate.py     # Tests for calculator app
```

**Key choices**:
- **Src layout**: code lives under `src/`, package root is configured via `pyproject.toml`.
- **Coverage gate**: enforced via pytest `addopts` in `pyproject.toml` (80% by default).
- **CI**: workflow in `.github/workflows/ci.yml` runs on push/PR to `main`.

---

## 3) Local Setup (Step-by-Step)

1) **Clone** the repo:

```bash
git clone https://github.com/wondering-packet/ci-cd-lab-files.git
cd ci-cd-lab-files
```

2) **Create & activate** a virtual environment:

```bash
# always use virtual environment for personal/test projects
# so we don't mess with the system's python!

# macOS/Linux
python3 -m venv .venv
source .venv/bin/activate

# Windows (PowerShell)
python -m venv .venv
.venv\Scripts\Activate.ps1
```

3) **Install dependencies**:

```bash
# requirements file lets us define dependent packages &
# the exact versions required for our lab.
cat requirements.txt  
flake8==7.1.0  
pytest==8.2.0  
black==23.9.1  
isort==5.12.0  
pytest-cov==5.0.0
# installs the packages
pip install -r requirements.txt
```


4) **Install the package in editable mode** (required for `src/` layout imports in tests):

```bash
pip install -e .
```

5) **Install local pre-commit hook**:

```bash
# this script copies our hooks/pre-commit file to .git/hooks/pre-commit location.
bash scripts/install_hook.sh

# IMPORTANT:
# remove the pre-commit file from hooks/ folder.
# note that this file has already been copied to .git/hooks.

# if you don't remove this file then your commits later will fail since 
# this file contains the keyword "TODO" - this keyword is used in the lab 
# to stop commits.
rm hooks/pre-commit
```

6) **Add python virtual environment folder to `.gitignore` file:**

```bash
echo ".venv/" > .gitignore
# IMPORTANT:
# the reason we are ignoring the venv folder is because our venv contains 
# lots of python files (used by python interpreter) which are not part of 
# our actual lab so we don't want to lint/format them.

# if you don't do this, then you will likely run into issues because 
# i noticed a lot of venv files fail flake8 checks.
```

7) **Run formatters (checks only)**:

```bash
isort --check-only .  # "." means all files (recursive)
black --check .
```

> If these fail, auto-fix with:

```bash
isort .
black .
```

8) **Run linter**:

```bash
flake8 .
```

9) **Run tests with coverage** (threshold enforced via `pyproject.toml`):

```bash
pytest -q  # -q suppresses noise from the output
```

This will fail the run if coverage is below the configured threshold (default **80%**). It also produces a `coverage.xml` report. The 80% config is in our tooling config file:

```plaintext
[tool.pytest.ini_options]  
addopts = "--cov=src --cov-report=term-missing --cov-report=xml --cov-fail-under=80"
```

---

## 4) GitHub Actions (CI) – What’s Included

The workflow file at `.github/workflows/ci.yml` is already set up to:
- Trigger on **push** and **pull requests** to `main`.
- Use **Python 3.10**.
- Install dependencies and the package (`pip install -e .`).
- Run **isort/black (checks only)**, **flake8**, and **pytest** (with coverage gate).
- Upload `coverage.xml` as a build **artifact**.

### How to enable CI in your repo

1) Create a repo in your account, name it `ci-cd-lab` (or whatever you like). Copy the repo URL.
2) Push this repository to GitHub (or copy these files into your own repo):
```bash
git remote add origin <repo_url>
git branch -M main
git push -u origin main
```

2) In GitHub, go to **Actions** tab. The workflow should appear automatically and run on the next push/PR to `main`.

3) To **download coverage** from a run: open the workflow run → **Artifacts** → download `coverage-xml`.

---

## 5) Configuration Reference

### `pyproject.toml` (important parts)

```toml
[tool.black]
line-length = 88
target-version = ['py310']
skip-string-normalization = true

[tool.isort]
profile = "black"
line_length = 88

[tool.pytest.ini_options]
addopts = "--cov=src --cov-report=term-missing --cov-report=xml --cov-fail-under=80"
```

- Adjust **coverage threshold** by changing the number in `--cov-fail-under=80`.
- Coverage includes the `src/` tree because we use `--cov=src`.

---

## 6) Common Commands

```bash
# Auto-fix formatting/imports
black .
isort .

# Lint
flake8 .

# Run tests (quiet) with coverage thresholds (configured in pyproject)
pytest -q
```

---

## 7) Troubleshooting

**Q: `ModuleNotFoundError: No module named 'apps'`**  
A: Make sure you ran `pip install -e .` so the `src/` package is discoverable.

**Q: CI fails on formatting**  
A: Run locally:
```bash
isort .
black .
```
Commit, push again.

**Q: CI fails on coverage (below 80%)**  
A: Add or improve tests under `tests/`, or (not recommended) lower the threshold in `pyproject.toml`.

**Q: I don’t see the workflow in GitHub**  
A: Ensure the file path is exactly `.github/workflows/ci.yml` on the default branch (`main`). Check Actions are enabled in repo settings.

---

## 8) Extending the Lab (Example)

1) **Add a new function** in `src/apps/calculator_private.py`:
```python
def power(a, b):
    return a ** b
```

2) **Test it** in `tests/test_calculate.py`:
```python
from apps.calculator_private import power

def test_power():
    assert power(2, 3) == 8
```

3) **Run the suite**:
```bash
pytest -q
```

CI will pick it up on push/PR.

---

## 9) Why this setup works

- **Fast feedback**: Format/lint/test on every push/PR.
- **Consistent style**: Black + isort keep diffs clean and reviews faster.
- **Quality gate**: Coverage threshold prevents untested code from slipping into `main`.
- **Portable**: Single `pyproject.toml` drives local + CI behavior.

---

Happy shipping! If you clone this lab and follow the steps, you’ll get the **exact same, reproducible** CI behavior locally and in GitHub.
