#### 1. Merging fast-forward. [[KB-003 (Merge fast-forward)]]
```bash
# feature/logout branch
git checkout feature/logout  
Switched to branch 'feature/logout'  
Your branch is up to date with 'origin/feature/logout'.  
ls  
# we have added this logout.txt file
hello.txt  logout.txt

# main branch
git checkout main  
Switched to branch 'main'  
Your branch is up to date with 'origin/main'.  
ls  
# logout file not merged yet
hello.txt  

# merging; notice fast forward in output
git merge feature/logout  
Updating 826dd10..f1e6f88  
Fast-forward 
logout.txt | 1 +  
1 file changed, 1 insertion(+)  
create mode 100644 logout.txt  
# validate; logout file now added
ls  
hello.txt  logout.txt

# checking commit history

# few things to learn here:
# 1. **main, origin/feature/logout, feature/logout are at f1e6f88 commit.**
# 2. **origin/main (which is the remote main) is still at 826dd10 commit.**
# 3. notice the text clearly stating merge source & target.
# 4. HEAD -> main ; this tells you you are currently in main branch.
# 5. notice main hasn't had any new commits since the creation of feature/logout.
# 6. 4097e98 is the commit when feature/logout branch was created.
# 7. read the graph: all other commits are from branches.
git log --oneline --graph --all  
*   f1e6f88 (HEAD -> main, origin/feature/logout, feature/logout) Merge branch 'main' into feature/logout  
|\  
| * 826dd10 (origin/main) main: added signature  
* | 821ce60 logout: v3  
* | 2f11877 logout: v2  
* | ee1a39f logout: added v1  
* | 458eafb main: readme.md  
|/  
* 4097e98 (feature/login) new repo for IaC  
# you can also confirm this in status
git status  
On branch main  
Your branch is ahead of 'origin/main' by 5 commits.  
(use "git push" to publish your local commits)  
  
nothing to commit, working tree clean  

# let's push
git push  
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0  
To https://github.com/wondering-packet/iac-git.git  
826dd10..f1e6f88  main -> main  

# notice the major change:
# now origin/main has also moved to the commit f1e6f88.
git log --oneline --graph --all  
*   f1e6f88 (HEAD -> main, origin/main, origin/feature/logout, feature/logout) Merge branch 'main' into feature/logout  
|\  
| * 826dd10 main: added signature  
* | 821ce60 logout: v3  
* | 2f11877 logout: v2  
* | ee1a39f logout: added v1  
* | 458eafb main: readme.md  
|/  
* 4097e98 (feature/login) new repo for IaC
```