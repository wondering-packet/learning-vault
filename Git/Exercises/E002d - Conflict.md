#### **1. Create a new branch, new files &  committing**
```bash
# creating a new branch
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git checkout -b test/conflict-2  
Switched to a new branch 'test/conflict-2'  
# checking the contents of files we will be using to cause confict
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ ls  
beta.md  hello.txt  login.md  logout.md  newlogout  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat login.md  
conflict: new conflict v2  
conflict/main in login.md  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat logout.md  
conflict: new conflict v2
# modifying the files by appending new data
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "conflict-2 v1" >> logout.md 
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "conflict-2 v1" >> login.md
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat logout.md  
conflict: new conflict v2  
conflict-2 v1  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat login.md  
conflict: new conflict v2  
conflict/main in login.md  
conflict-2 v1   
# staging & commiting. checkout the IMPORTANT note at the end.
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "conflict-2: v1"  
[test/conflict-2 77be3c6] conflict-2: v1  
2 files changed, 2 insertions(+)
```
#### **2. Modifying the files & committing**
```bash
# back to main
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git checkout main  
Switched to branch 'main'  
Your branch is ahead of 'origin/main' by 4 commits.  
(use "git push" to publish your local commits)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline --graph --all 
# ignore 1f6b3a6 - that's from previous testing. 77be3c6 is the last commit we have from previous step.
* 77be3c6 (test/conflict-2) conflict-2: v1  
*   1f6b3a6 (HEAD -> main) testing commit after fixing conflicts  
|\  
..truncating output..
|/  
* 4097e98 new repo for IaC  
# just validating main still has the old content.
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat login.md  
conflict: new conflict v2  
conflict/main in login.md  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat logout.md  
conflict: new conflict v2  
# modifying the content of files to cause conflict; we need to modify the same files to cause conflict. checkout the IMPORTANT note at the end.
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "main: new lines to login" >> login.md  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "main: new lines to logout" >> logout.md  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "main: modified login & logout"  
[main 9f873cc] main: modified login & logout  
2 files changed, 2 insertions(+)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline --graph --all  
* 9f873cc (HEAD -> main) main: modified login & logout  
| * 77be3c6 (test/conflict-2) conflict-2: v1  
..truncating output..
|/  
* 4097e98 new repo for IaC  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$
```