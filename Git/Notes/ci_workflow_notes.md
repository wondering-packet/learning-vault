Gotcha big dawg 🐾 — we’ll build **Lesson 7** from scratch for someone who’s a Git master-in-training but **fresh** to CI/CD.

---

## **Lesson 7 — CI/CD Git Integration Basics**

### **1. What the heck is CI/CD?**

- **CI** = **Continuous Integration**
    
    - Automatically test & validate your code every time you push changes.
        
    - Goal: Catch bugs early & keep `main` branch stable.
        
- **CD** = **Continuous Delivery** / **Continuous Deployment**
    
    - Automatically deploy tested code to production or staging after it passes CI checks.
        
    - **Delivery** → Requires a human to approve deploy.
        
    - **Deployment** → Fully automated deploy.
        

**💡 Analogy:**  
Think of CI/CD like having a robotic pit crew. Every time you bring your car (code) into the pit (push), they **check it**, **fix issues**, and **send it out** without you lifting a wrench.

---

### **2. Where Git Fits into CI/CD**

Git acts as the **trigger** for automation.

- Push code → Automation pipeline runs.
    
- Merge PR → Tests run automatically.
    
- Tag release → Deployment job runs.
    

---

### **3. Git Hooks**

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

### **7. Why This Matters**

- Stops bugs **before** they hit production.
    
- Automates boring tasks (tests, builds, deploys).
    
- Builds trust in the `main` branch — always stable, always deployable.
    

---

✅ **Next Step:**  
We’ll do a **hands-on exercise**:

1. Create a repo.
    
2. Add a pre-commit hook that blocks commits with `TODO` in code.
    
3. Add a GitHub Actions workflow that runs a Python linter (`flake8`) on push.
    

---

Do you want me to **jump into the exercise setup right now**, or should I **also give you a mini visual diagram** of how Git + CI/CD flows?