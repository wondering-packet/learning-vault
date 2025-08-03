
## 1. Create a local directory, Initialize it & make our first commit

```bash
cd /path/to/your/working/directory
mkdir iac-git
cd iac-git
# initialize git inside this directory.
git init
# set the default branch name. we are using main which is commonly used.
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

1. Create a new repo by going to [GitHub](https://github.com/) , name it same as your local repo "iac-git".

> [!important]
> **DO NOT** initialize it with a README, license, or `.gitignore` file. You want an _empty_ repository so your local history can be pushed cleanly without merge conflicts initially.

2. Copy the HTTPS URL e.g. `https://github.com/wondering-packet/iac-git.git`.

## 3. Configure Git

```bash
git config user.name wondering-packet # "Your Name"
git config --global user.name # validate
wondering-packet
git config user.email "packetwondering@gmail.com" # "your.email@example.com"
git config user.email # validate
packetwondering@gmail.com
```

## 4. Connect to remote repo & Push

```bash
git remote add origin `https://github.com/wondering-packet/iac-git.git`
git remote -v # validate
origin  https://github.com/wondering-packet/learning-vault.git (fetch)  
origin  https://github.com/wondering-packet/learning-vault.git (push)
# push our commit.
git push -u origin main
# you will see something like this.
Enumerating objects: 7, done.  
Counting objects: 100% (7/7), done.  
Delta compression using up to 4 threads  
Compressing objects: 100% (5/5), done.  
Writing objects: 100% (7/7), 1.61 KiB | 824.00 KiB/s, done.  
Total 7 (delta 0), reused 0 (delta 0), pack-reused 0  
To https://github.com/wondering-packet/learning-vault.git  
* [new branch]      main -> main  
branch 'main' set up to track 'origin/main'
```

