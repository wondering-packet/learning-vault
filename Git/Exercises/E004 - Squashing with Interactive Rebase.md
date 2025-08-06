#### 1. Squashing latest commits

1. **Create some WIP commits or Select previous WIP commits that you want to squash**
```bash
# i already have a few commits from past exercises that i am going to squash
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
	# old commits: 30d04bb, d290506, bd6398e
# instead now we have a new commit which represents our final commit.
	# new commit: 
git log --oneline  
1aab5ac (HEAD -> feature/x) x: squash-testing: added beta 2 & beta 3  
4720f32 Another - Merge branch 'feature/logout'  
9f9d69d main: added v3  
..truncating output..
458eafb main: readme.md  
4097e98 new repo for IaC
```