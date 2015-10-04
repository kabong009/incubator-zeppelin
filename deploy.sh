#!/bin/bash
set -e # exit with nonzero exit code if anything fails

# clear and re-create the out directory
rm -rf out || exit 0;
mkdir out;

# copy the tar
echo "Current dir is ${PWD}"
ls zeppelin-distribution/target/
cp zeppelin-distribution/target/zepp*gz ./out/.
cp zeppelin-distribution/target/zeppelin-0.6.0-incubating-SNAPSHOT.tar.gz ./out/.

# go to the out directory and create a *new* Git repo
cd out
git init

# inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "travis@northpole.org"

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy to GitHub Pages"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --force "https://BqZwb1+3xzfC/4/ZPm4K2Z5Q3BU1AjCVXR2NKVHKAj0oKiGkVYYA0ofxQAKQ8oHSSey2phqOm3zIMF5+YaPu8U+xSaAupiO1asrZ5ON/LnG6FdN3Vn9gz0K/huN29DQveOu/3S7rxMtZA6We7heIdkFdEjnjB/2XIPamRSovr9mcNV3UFFDkxC0bHRdceaxtoTYqasyXMP7mMvRlt5nzstkNfONZiE7x+aAgjtVsr8FXUEjJ21d35mub1hMR9cjekRiBhu1AGk5x7mBC0PyUVDJjMypXKhdCb8aGmM7OL0gOZbJVeineNA1snbFkXv0N8pyxxjAErLYqfk1C4M4qP1kQviGCUYRy75NL3DNzCsgkcd7fzCORrDBmCKzsy/YPGjclTezC60xVuNOM8twJ7u2G6g+MWIDPTqjoW8aqJwaY2PpPTR9smSPV16BdKI/4u5EriHxq+OnbKTnoa/zSANitMWWHYqNUC/xMuEH2YsG7ppLUQcUR7L4rvMJubgtiQ/IE4ZjfZxZPWKkjhHZDl7HAEBjqTeLgrELPdxdi8GraL3h3ltSV9LmpqvRln+7dGEYHyZI/qdEfweY1B36h034P2LXCexn/SPh4zJCSPFaLPuGosrrDrQu5Drs39wzKxPzE3/dWoKzAE1EsPQSQanElt+1TZh426ac1FsoF/Jc=@$github.com/kabong009/incubator-zeppelin.git" master:gh-pages

# ace1183c05345923f930068d9f6ac619b398b3de