#### **1. Create a new branch, new files &  committing**
```bash
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git checkout -b test/conflict-2  
Switched to a new branch 'test/conflict-2'  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ ls  
beta.md  hello.txt  login.md  logout.md  newlogout  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat login.md  
conflict: new conflict v2  
conflict/main in login.md  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat logout.md  
conflict: new conflict v2
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "conflict-2 v1" >> logout.md 
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "conflict-2 v1" >> login.md
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat logout.md  
conflict: new conflict v2  
conflict-2 v1  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat login.md  
conflict: new conflict v2  
conflict/main in login.md  
conflict-2 v1  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "conflict-2: v1"  
[test/conflict-2 77be3c6] conflict-2: v1  
2 files changed, 2 insertions(+)
```
#### **2. Modifying the files (that have changed in our conflict branch) & committing**
```bash
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git checkout main  
Switched to branch 'main'  
Your branch is ahead of 'origin/main' by 4 commits.  
(use "git push" to publish your local commits)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline --graph --all 
# ignore 1f6b3a6 - that's from previous testing. 77be3c6 is the last commit we have from previous step
* 77be3c6 (test/conflict-2) conflict-2: v1  
*   1f6b3a6 (HEAD -> main) testing commit after fixing conflicts  
|\  
..truncating output..
|/  
* 4097e98 new repo for IaC  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat login.md  
conflict: new conflict v2  
conflict/main in login.md  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat logout.md  
conflict: new conflict v2  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "main: new lines to login" >> login.md  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "main: new lines to logout" >> logout.md  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "main: modified login & logout"  
[main 9f873cc] main: modified login & logout  
2 files changed, 2 insertions(+)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline --graph --all  
* 9f873cc (HEAD -> main) main: modified login & logout  
| * 77be3c6 (test/conflict-2) conflict-2: v1  
|/  
*   1f6b3a6 testing commit after fixing conflicts  
|\  
| * e4ea6c0 (test/conflict) conflict: NEW & v1  
* | 6931aa8 main: creating conflict v1  
|/  
* 8ff8c92 conflict: new conflict v2  
* 729b1e5 (origin/test/conflict, origin/main) conflict: conflict v1  
* d290506 (feature/x) x: beta v2  
* 30d04bb (origin/feature/x) x: beta v1  
*   4720f32 Another - Merge branch 'feature/logout'  
|\  
| * e384331 (feature/logout) logout: modified feature v5  
| * e83ac39 logout: modified feature v4  
* | 9f9d69d main: added v3  
* | ac404d9 New feature in branch 'feature/logout'  
|\|  
| * e6423bc logout: modified feature v3  
| * a5efa78 logout: modified feature v2  
| * 4832fcc logout: modified feature v1  
| * 5cfa15d (origin/feature/logout) logout: new feature v1  
| | * 10659aa (origin/feature/rebase, feature/rebase) rebase: v3  
| | * 72be6f5 rebase: v2  
| | * 040432a rebase: v1  
| |/  
|/|  
* | 6a01500 main: new features v2  
|/  
| * 1b364ef (feature/login) login: new feature v3  
| * 0de1146 login: new feature v2  
| * 1da19b5 login: new feature v1  
|/  
* 4421ab9 main: v2  
*   c3be76d Merge branch 'feature/login'  
|\  
| * 3c86970 (origin/feature/login) login: v1  
* |   f1e6f88 Merge branch 'main' into feature/logout  
|\ \  
| * | 826dd10 main: added signature  
| |/  
* | 821ce60 logout: v3  
* | 2f11877 logout: v2  
* | ee1a39f logout: added v1  
* | 458eafb main: readme.md  
|/  
* 4097e98 new repo for IaC  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$
```