It's best practice to always backup your branch before a rebase or reset. Let's practice this with before we do a `git reset` in this exercise.

#### **1. Do some work**

```bash
git switch test/undo4-test  
Switched to branch 'test/undo4-test'  
echo "undo4: feature 6" >> undo4  
git commit -am "undo4: feature 6"  
[test/undo4-test a3a3736] undo4: feature 6  
1 file changed, 1 insertion(+)  
 
echo "undo4: feature 7" >> undo4  
git commit -am "undo4: feature 7"  
[test/undo4-test 9757fe9] undo4: feature 7  
1 file changed, 1 insertion(+)
```

#### **2. Need to do a reset; Let's backup first**

```bash
# let's assume i realized that some of my last work might have caused an issue
# so to isolate the problem, i decide to do a rollback by doing a git reset. 
# Since i am not sure (even if i was) i take a backup of my branch first. 
# this way, in case it turns out i shouldn't have done a reset, 
# i can simply restore from the backup branch.
git branch undo4-backup-before-reset  
cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
undo4: feature 4 (no bugs)  
undo4: feature 5 (contains a bug) - fixed now  
undo4: feature 6  # this is from new work
undo4: feature 7  
git reset --hard HEAD~2  
HEAD is now at 94f2194 undo4-temp: fixed the bug  
cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
undo4: feature 4 (no bugs)  
undo4: feature 5 (contains a bug) - fixed now  
git log --oneline  
94f2194 (HEAD -> test/undo4-test) undo4-temp: fixed the bug  
fa0dd3c undo4: feature 5  
a95e420 undo4: feature 4  
b0ba17d undo4: feature 3  
5083711 undo4: feature 2  
585eb96 undo4: added feature 1
..truncated output..
```

#### 3. Restore

```bash
# turns out the issue happened because of something else.
# so now we need to restore to the state before we did the reset.
git reset --hard undo4-backup-before-reset  
HEAD is now at 9757fe9 undo4: feature 7  
cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
undo4: feature 4 (no bugs)  
undo4: feature 5 (contains a bug) - fixed now  
undo4: feature 6  
undo4: feature 7  
 
git log --oneline  
9757fe9 (HEAD -> test/undo-4, undo4-backup-before-reset) undo4: feature 7  
a3a3736 undo4: feature 6  
94f2194 (test/undo4-test) undo4-temp: fixed the bug  
fa0dd3c undo4: feature 5  
a95e420 undo4: feature 4  
b0ba17d undo4: feature 3  
5083711 undo4: feature 2  
585eb96 undo4: added feature 1
..truncated output..
```