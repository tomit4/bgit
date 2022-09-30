## bgit: a shell script to simplify the standard git workflow

bgit is a git automation tool written in bash. It is designed to quickly automate away alot of the simple git commands that git beginners use every day. These include commands like git init, git add, git commit -m, git push, as well as git log and git reset. bgit essentially presents you with a series of simple prompts that make the git workflow seamless and quick to use, so that you can quickly commit your recent version updates and move on with your day.

### Installation

bgit is packaged with an installation script for your convenience (this installation script does require root privileges, so please review it carefully before executing it).

You'll need change the permissions on the install script in order to execute it:

`chmod +x ./install.sh`

Afterwards which simply invoke the script:

`./install.sh`

bgit also comes with an uninstall script, repeat the above commands above to uninstall, simply replacing 'install' with 'uninstall'.

### Basic Usage

`bgit`

Invoking bgit without any arguments will automatically prompt the user to stage your recent changes for commits if there are any and, of course, if a local git repository has already been initiated. If a local .git directory is not found (i.e., a git repository was never initiated), then bgit will prompt the user if they'd like to initiate a repository in this directory (this can also be done by invoking bgit with the -i flag).

`bgit -i`

Invoking bgit with the -i flag will prompt the user to initialize a new local git repository and proceeds to set up some sane defaults while attempting to not be too opinionated about it. This init script prompts the user if they'd like to set up a very bare bones README.md, a default .gitignore [^1], as well as a default LICENCE [^2]. The script will also create the initial commit for the project and push it to whatever repository the user inputs. Additionally, if the project is to be pushed to Github, the repository can be initiated remotely utilizing the github-cli (this feature may soon be deprecated depending on the decisions made by Github).

`bgit -l`

Invoking bgit with the -l flag will prompt the user to input how many previous commits they would like to review. This is essentially a very abreviated version of git log.

`bgit -r`

Invoking bgit with the -r flag will prompt the user to input how many previous commits they would like to review for the purposes of reverting back to one of these previous commits.

`bgit -h`

Invoking bgit with the -h flag will provide the user with a standard help page about basic usage of this script.

### A Brief Note on DevIcons/Colors

bgit makes heavy use of emojis in its prompts as well as colors displayed by invoking tput. If you have previously installed devicons and have a terminal emulator capable of displaying UTF-8 characters, then the script should display these with no problem [^3].

__Project Checklist:__

- [x] Initial Commit
- [x] Organize files so that they source from a common directory (i.e $HOME/config)
- [x] Create a --help Flag feature/message
- [x] Create a man page for bgit using troff
- [x] Create install script
- [x] Create uninstall script
- [x] Create a git log script (very similar to -r flag)
- [x] Update README to include usage/configuration
- [ ] Create a barebones version of bgit without colors, suppressed output, and icons
- [ ] Update README to include examples/pics/gifs

[^1]: bgit's .gitignore selection currently only support C, Javascript, and Python, for a full list of default .gitignores, please see the [github page](https://github.com/github/gitignore).

[^2]: bgit utilizes captainsafia's [legit](https://github.com/captainsafia/legit) to generate default LICENCES

[^3]: If you'd like to install devicons, please visit the [github page](https://github.com/vorillaz/devicons). If you'd rather not install devicons, I will be providing a more barebones version of bgit in the near future.
