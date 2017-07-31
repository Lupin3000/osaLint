# osaLint

__Requirements__

- [Docker for Mac](https://www.docker.com/docker-mac) installed
- Git installed

## Prepare for usage

```shell
# clone repository
$ git clone https://github.com/Lupin3000/osaLint.git

# change directory
$ cd osaLint/

# build Docker image
$ docker build -t alpine/shellcheck .

# change permission
$ chmod +x linter.scpt
```

## Simple usage

```shell
# run Applescript from Terminal
$ osascript linter.scpt
```

## Extended usage

```shell
# create script directory
$ mkdir ~/Library/Scripts

# copy script into directory
$ cp -a linter.scpt ~/Library/Scripts

# add alias to .bash_profile
echo "alias shelllint='osascript ~/Library/Scripts/linter.scpt'" >> ~/.bash_profile

# reload source
$ source ~/.bash_profile

# run shelllint
$ shelllint
```
