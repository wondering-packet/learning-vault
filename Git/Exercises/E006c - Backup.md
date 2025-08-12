It's best practice to always backup your branch before a rebase or reset. Let's practice this with before we do a `git reset` in this exercise.

#### **1. Do some work**

```bash
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git switch test/undo4-test  
Switched to branch 'test/undo4-test'  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "undo4: feature 6" >> undo4  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -am "undo4: feature 6"  
[test/undo4-test a3a3736] undo4: feature 6  
1 file changed, 1 insertion(+)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "undo4: feature 7" >> undo4  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -am "undo4: feature 7"  
[test/undo4-test 9757fe9] undo4: feature 7  
1 file changed, 1 insertion(+)
```

#### **2. Need to do a reset; Let's backup first**

```bash
# let's assume i realized that some of my last work might have cause an issue so to isolate the problem, we 
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git branch undo4-backup-before-reset  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
undo4: feature 4 (no bugs)  
undo4: feature 5 (contains a bug) - fixed now  
undo4: feature 6  
undo4: feature 7  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git reset --hard HEAD~2  
HEAD is now at 94f2194 undo4-temp: fixed the bug  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
undo4: feature 4 (no bugs)  
undo4: feature 5 (contains a bug) - fixed now  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline  
94f2194 (HEAD -> test/undo4-test) undo4-temp: fixed the bug  
fa0dd3c undo4: feature 5  
a95e420 undo4: feature 4  
b0ba17d undo4: feature 3  
5083711 undo4: feature 2  
585eb96 undo4: added feature 1
```