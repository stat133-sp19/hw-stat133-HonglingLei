lab06-hongling-lei
================

#### Your Turn\*:

``` r
# print working directory
pwd

#display name of user
Hongling Lei
```

#### 2. Setting up Git

``` r
git config --global user.name "Hongling Lei"
git config --global user.email "honglinglei@berkeley.edu"

git config --global core.autocrlf input
git config --list

# to use a proxy
git config --global http.proxy proxy-url
git config --global https.proxy proxy-url

# to disable a proxy
git config --global --unset http.proxy
git config --global --unset https.proxy

# Git help and manual
git config -h
git config --help
```

#### 3. Creating a Repository

``` r
cd ~/Desktop
mkdir planets
cd planets
# to make planets a repository
git init
ls
ls -a
git status

# return to Desktop directory
cd ~/Desktop   
# go into planets directory, which is already a Git repository
cd planets
# ensure the .git sub-directory is still present in the planets directory
ls -a
# make a sub-directory planets/moons
mkdir moons    
# go into moons sub-directory
cd moons       
# make the moons sub-directory a Git repository
git init       
# ensure the .git sub-directory is present indicating we have created a new Git repository
ls -a          
```

#### 4. Tracking Changes

``` r
pwd
cd ..
nano mars.txt
ls
cat mars.txt
git status
git add mars.txt
git status
git commit -m "Start notes on Mars as a base"
git status
git log

nano mars.txt
git status
git diff
git add mars.txt
git diff
git diff --staged
git commit -m "Discuss concerns about Mars' climate for Mummy"
git status
git log

# limit log size
git log -1
git log --oneline
git log --oneline --graph --all --decorate

# Directories
mkdir spaceships
git status
git add spaceships
git status

git add <directory-with-files>
touch spaceships/apollo-11 spaceships/sputnik-1
git status
git add spaceships
git status

git commit -m "Add some initial thoughts on spaceships"
```

#### 5. Exploring History

``` r
nano mars.txt
cat mars.txt
git diff HEAD mars.txt
git diff HEAD~1 mars.txt
git diff HEAD~2 mars.txt
git show HEAD~2 mars.txt
git diff f22b25e3233b4645dabd0d81e651fe074bd8e73b mars.txt
git diff f22b25e mars.txt
git status
git checkout HEAD mars.txt
cat mars.txt
git checkout f22b25e mars.txt
cat mars.txt
git status
git checkout HEAD mars.txt


cd planets
echo "Venus is beautiful and full of love" > venus.txt
git add venus.txt
echo "Venus is too hot to be suitable as a base" >> venus.txt
git commit -m "Comment on Venus as an unsuitable base"
git checkout HEAD venus.txt
cat venus.txt #this will print the contents of venus.txt to the screen


git log mars.txt
git log --patch mars.txt
git log --patch HEAD~3 *.txt
```

#### 6. Version Control with Git

``` r
mkdir results
touch a.dat b.dat c.dat results/a.out results/b.out
git status
nano .gitignore
cat .gitignore
git status
git add .gitignore
git commit -m "Ignore data files and the results folder."
git status
git add a.dat
git status --ignored

results/data
results/plots

results/data/position/gps/a.data
results/data/position/gps/b.data
results/data/position/gps/c.data
results/data/position/gps/info.txt
results/plots

*.data
!*.data
```

#### 7. Remotes in GitHub

``` r
mkdir planets
cd planets
git init
git remote add origin https://github.com/vlad/planets.git
git remote -v
git push origin master

# Proxy
git config --global http.proxy http://user:password@proxy.url
git config --global https.proxy http://user:password@proxy.url

git config --global --unset http.proxy
git config --global --unset https.proxy

# Password managers
unset SSH_ASKPASS

# The -u' Flag
git pull origin master

git pull origin master
git pull --allow-unrelated-histories origin master
```

#### Your Turn\*: 1) Create a New GitHub Repository

``` r
This part is done using my browser.
```

#### Your Turn\*: 2) Create a local Git Repository

``` r
pwd
cd /Users/Macbook/Desktop
mkdir demo-repo
cd demo-repo
git init
```

#### Your Turn\*: 3) Adding a README file

``` r
echo "# Demo Repo" >> README.md
git status
git add README.md
git status
git commit -m "first commit"
```

#### Your Turn\*: 4) Adding a remote

``` r
git remote add origin https://github.com/HonglingLei/demo-repo.git
git remote -v
```

#### Your Turn\*: 5) Pushing changes to a remote repo

``` r
git status
git push origin master

# Go to your Github repository and refresh the browser. If everything went fine, you should be able to see the contents of your customized README.md file.

# Keep modifying the content of README.md file, add the modifications to the git repository, display the status, commit the modifications, and push them to github repo.
git add README.md
git status
git commit -m "second line"
git log
git push origin master
```
