# CI/CD Lab – Python + GitHub Actions (Tested Setup)

Repo: `https://github.com/wondering-packet/ci-cd-lab.git`.

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
.
├─ .github/
│  └─ workflows/
│     └─ ci.yml                 # GitHub Actions workflow (CI)
├─ src/
│  └─ apps/
│     └─ calculator_private.py  # our main script
├─ tests/
│  └─ test_calculate.py         # Unit tests (pytest)
├─ pyproject.toml               # Tooling config (Black, isort, pytest/coverage)
├─ requirements.txt             # Dev dependencies
└─ .gitignore
```

**Key choices**:
- **Src layout**: code lives under `src/`, package root is configured via `pyproject.toml`.
- **Coverage gate**: enforced via pytest `addopts` in `pyproject.toml` (80% by default).
- **CI**: workflow in `.github/workflows/ci.yml` runs on push/PR to `main`.

---

## 3) Local Setup (Step-by-Step)

1) **Clone** the repo:
```bash
git clone <your-repo-url>.git
cd <your-repo-name>
```

2) **Create & activate** a virtual environment:
```bash
# macOS/Linux
python3 -m venv .venv
source .venv/bin/activate

# Windows (PowerShell)
python -m venv .venv
.venv\Scripts\Activate.ps1
```

3) **Install dependencies**:
```bash
pip install -r requirements.txt
```

4) **Install the package in editable mode** (required for `src/` layout imports in tests):
```bash
pip install -e .
```

5) **Run formatters (checks only)**:
```bash
isort --check-only .
black --check .
```
> If these fail, auto-fix with:
```bash
isort .
black .
```

6) **Run linter**:
```bash
flake8 .
```

7) **Run tests with coverage** (threshold enforced via `pyproject.toml`):
```bash
pytest -q
```
This will fail the run if coverage is below the configured threshold (default **80%**). It also produces a `coverage.xml` report.

---

## 4) GitHub Actions (CI) – What’s Included

The workflow file at `.github/workflows/ci.yml` is already set up to:
- Trigger on **push** and **pull requests** to `main`.
- Use **Python 3.10**.
- Install dependencies and the package (`pip install -e .`).
- Run **isort/black (checks only)**, **flake8**, and **pytest** (with coverage gate).
- Upload `coverage.xml` as a build **artifact**.

### How to enable CI in your repo

1) Push this repository to GitHub (or copy these files into your own repo):
```bash
git remote add origin git@github.com:<you>/<repo>.git
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

### `requirements.txt`
```
flake8==7.1.0
pytest==8.2.0
black==23.9.1
isort==5.12.0
pytest-cov==5.0.0
```

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
