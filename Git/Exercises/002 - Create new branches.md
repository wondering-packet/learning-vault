#### 1. Create a new branch
```bash
# list all branches; * indicates where you currently are.
git branch
* main  
# creating a new branch feature/login.
git branch feature/login  
# validate; notice we are still on "main".
git branch  
feature/login  
* main  
# switching to a branch.
git checkout feature/login  
Switched to branch 'feature/login'  # validation message.
git branch  
* feature/login  # * confirms we are not on feature/login branch.
main
# here is you can combine creating + switcing in one command.
git checkout -b feature/logout  
Switched to a new branch 'feature/logout'  
git branch  
feature/login  
* feature/logout  
main
```
####2. 