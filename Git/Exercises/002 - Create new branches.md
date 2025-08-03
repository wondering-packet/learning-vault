#### 1. Create a new branch
```bash
# list all branches; * indicates where you currently are.
git branch
* main  
# creating a new branch feature/login
git branch feature/login  
# validate; notice we are still on "main"
git branch  
feature/login  
* main  
git checkout feature/login  
Switched to branch 'feature/login'  
git branch  
* feature/login  
main
git checkout -b feature/logout  
Switched to a new branch 'feature/logout'  
git branch  
feature/login  
* feature/logout  
main

```