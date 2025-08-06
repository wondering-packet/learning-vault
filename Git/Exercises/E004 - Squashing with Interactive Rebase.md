#### 1. Squashing latest commits

```bash
# i already have a few commits from past exercises that i am going to squash
# if you are starting fresh then simply make a few commits before starting
git log --oneline  
bd6398e (HEAD -> feature/x, origin/feature/x) x: added beta 2 & beta 3  # we will pick/keep this
d290506 x: beta v2  # we will squash this
30d04bb x: beta v1  # we will squash this
4720f32 Another - Merge branch 'feature/logout'  
9f9d69d main: added v3  
..truncating output..
458eafb main: readme.md  
4097e98 new repo for IaC
# using interactive rebase (-i) to work on latest 3 commits (HEAD~3).
git rebase -i HEAD~3  
[detached HEAD 1aab5ac] x: squash-testing: added beta 2 & beta 3  
Date: Wed Aug 6 00:13:04 2025 +0530  
3 files changed, 4 insertions(+)  
create mode 100644 beta.md  
create mode 100644 beta2.md  
create mode 100644 beta3.md  
Successfully rebased and updated refs/heads/feature/x.  
# notice how the 3 commits (2 squashed & 1 picked) have disappeared.
	# old commits: 30d04bb, d290506, bd6398e.
# instead now we have a new commit which represents our final commit.
	# new commit: 1aab5ac.
git log --oneline  
1aab5ac (HEAD -> feature/x) x: squash-testing: added beta 2 & beta 3  
4720f32 Another - Merge branch 'feature/logout'  
9f9d69d main: added v3  
..truncating output..
458eafb main: readme.md  
4097e98 new repo for IaC
```

#### 2. Squashing by Commit hash or ID

```bash
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git branch  
feature/login  
feature/login-hotfix  
feature/logout  
feature/rebase  
* feature/x  
main  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ ls  
beta2.md  beta3.md  beta.md  hello.txt  login.md  logout.md  newlogout  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "beta4: testing a new feature v1" > beta4  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "x: beta4 v1"  
[feature/x e089b0f] x: beta4 v1  
1 file changed, 1 insertion(+)  
create mode 100644 beta4  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "beta4: bugfix v1.1" > beta4  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "x: beta4 v1.1"  
[feature/x 48f3f22] x: beta4 v1.1  
1 file changed, 1 insertion(+), 1 deletion(-)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "beta4: bugfix v1.2" > beta4  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "x: beta4 v1.2"  
[feature/x 099e0d6] x: beta4 v1.2  
1 file changed, 1 insertion(+), 1 deletion(-)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "beta4: new release v2.0" > beta4  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "x: beta4 v2.0"  
[feature/x 7c7c005] x: beta4 v2.0  
1 file changed, 1 insertion(+), 1 deletion(-)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "beta4: final release with bugfix v2.2" > beta4  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "x: beta4 v2.2"  
[feature/x 1cb585c] x: beta4 v2.2  
1 file changed, 1 insertion(+), 1 deletion(-)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git tag -a v2.2 -m "x: feature beta4 final release"  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline  
1cb585c (HEAD -> feature/x, tag: v2.2) x: beta4 v2.2  
7c7c005 x: beta4 v2.0  
099e0d6 x: beta4 v1.2  
48f3f22 x: beta4 v1.1  
e089b0f x: beta4 v1  
1aab5ac (origin/feature/x) x: squash-testing: added beta 2 & beta 3  
4720f32 Another - Merge branch 'feature/logout'  
9f9d69d main: added v3  
e384331 (feature/logout) logout: modified feature v5  
e83ac39 logout: modified feature v4  
ac404d9 New feature in branch 'feature/logout'  
e6423bc logout: modified feature v3  
a5efa78 logout: modified feature v2  
4832fcc logout: modified feature v1  
6a01500 main: new features v2  
5cfa15d (origin/feature/logout) logout: new feature v1  
4421ab9 main: v2  
c3be76d Merge branch 'feature/login'  
3c86970 login: v1  
f1e6f88 Merge branch 'main' into feature/logout  
826dd10 main: added signature  
821ce60 logout: v3  
2f11877 logout: v2  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git rebase -i 1aab5ac  

# this will open an editor where you will see all the commits that were made after 1aab5ac.
----text-editor----
pick e089b0f x: beta4 v1  # picking/keeping; first commit we are keeping
squash 48f3f22 x: beta4 v1.1  # squashing into ^ above
squash 099e0d6 x: beta4 v1.2  # squashing into ^ above
pick 7c7c005 x: beta4 v2.0  # picking/keeping; second commit we are keeping
squash 1cb585c x: beta4 v2.2  # squashing into ^ above
----text-editor----
# once you select what you want to do with the commit
# save the file, this will then open a another text editor where you will type in the commit message for the kept 2 commits (editor will open twice - one for each commit)
[detached HEAD be285b9] x: beta4 final release  
Date: Thu Aug 7 02:48:20 2025 +0530  
1 file changed, 1 insertion(+)  
create mode 100644 beta4  
[detached HEAD 3b06249] x: beta4 final release v2  
Date: Thu Aug 7 02:50:06 2025 +0530  
1 file changed, 1 insertion(+), 1 deletion(-)  
Successfully rebased and updated refs/heads/feature/x.  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline  
3b06249 (HEAD -> feature/x) x: beta4 final release v2  
be285b9 x: beta4 final release  
1aab5ac (origin/feature/x) x: squash-testing: added beta 2 & beta 3  
4720f32 Another - Merge branch 'feature/logout'  
9f9d69d main: added v3  
e384331 (feature/logout) logout: modified feature v5  
e83ac39 logout: modified feature v4  
ac404d9 New feature in branch 'feature/logout'  
e6423bc logout: modified feature v3  
a5efa78 logout: modified feature v2  
4832fcc logout: modified feature v1  
6a01500 main: new features v2  
5cfa15d (origin/feature/logout) logout: new feature v1  
4421ab9 main: v2  
c3be76d Merge branch 'feature/login'  
3c86970 login: v1  
f1e6f88 Merge branch 'main' into feature/logout  
826dd10 main: added signature  
821ce60 logout: v3  
2f11877 logout: v2  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC




pick e089b0f x: beta4 v1  
squash 48f3f22 x: beta4 v1.1  
squash 099e0d6 x: beta4 v1.2  
pick 7c7c005 x: beta4 v2.0  
squash 1cb585c x: beta4 v2.2
```