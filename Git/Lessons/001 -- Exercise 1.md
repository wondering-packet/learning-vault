# Goal: Let's create a new repository & connect it to a remote branch

## 1. Create a local directory, Initialize & make first commit

```bash
cd /path/to/your/working/directory
mkdir iac-git
cd iac-git
# initialize git inside this directory.
git init
# set the default branch name. we are using main which is common.
git branch -m main
# let's make a test file which will be included in our first commit.
echo "hello, i am learning Git!" >> hello.txt
ls
	hello.txt
# let's stage the change. "." means all files in the directory.
git add .
# add a commit message.
git commit -m "Initial commit using git"
``` 

## 2. Create remote repository in GitHub

1. Create a new repo by going to GitHub page, name it same as your local repo "iac-git".

	**Note**: *DO NOT* initialize it with a README, license, or `.gitignore` file. You want an _empty_ repository so your local history can be pushed cleanly without merge conflicts initially.

2. Copy the HTTPS URL e.g. `https://github.com/wondering-packet/iac-git.git`.
## 3. Configure credentials

```bash
git config user.name wondering-packet # "Your Name"
git config --global user.name # validate
	wondering-packet
git config user.email "packetwondering@gmail.com" # "your.email@example.com"
git config user.email # validate
	packetwondering@gmail.com
```

## 4. Connect to remote repo

```bash
git remote add origin `https://github.com/wondering-packet/iac-git.git`
git remote -v # validate


```
