## bgit: the beginner's git

bgit is a git automation tool written in bash. It is designed to quickly automate away alot of the simple git commands that git beginners use every day. These include commands like git init, git add, git commit -m, git push, as well as git log and git reset. bgit essentially presents you with a series of simple prompts that make the git workflow seamless and quick to use, so that you can quickly commit your recent version updates and move on with your day.

[![asciicast](https://asciinema.org/a/524975.svg)](https://asciinema.org/a/524975)

### Installation

bgit is packaged with an installation script for your convenience (this installation script does require root privileges, so please review it carefully before executing it).

You'll need change the permissions on the install script in order to execute it:

`chmod +x ./install.sh`

Afterwards which simply invoke the script:

`./install.sh`

bgit also comes with an uninstall script, repeat the above commands above to uninstall, simply replacing 'install' with 'uninstall'.

### Basic Usage

`bgit`

Invoking bgit without any arguments will automatically prompt the user to stage your recent changes for commits if there are any and, of course, if a local git repository has already been initiated. If a local .git directory is not found (i.e., a git repository was never initiated), then bgit will prompt the user if they'd like to initiate a repository in this directory (this can also be done by invoking bgit with the -i flag). bgit recursively checks for the presence of multiple remotes, and will commit changes to each of them automatically.

`bgit -i`

Invoking bgit with the -i flag will prompt the user to initialize a new local git repository and proceeds to set up some sane defaults while attempting to not be too opinionated about it. This init script prompts the user if they'd like to set up a very bare bones README, a default .gitignore [^1], as well as a default LICENSE [^2]. The script will also create the initial commit for the project and push it to whatever repository the user inputs. Additionally, if the project is to be pushed to Github, the repository can be initiated remotely utilizing Github's API (this feature may soon be deprecated depending on Github and their decisions regarding their API).

`bgit -d`

Invoking bgit with the -d flag will prompt the user if they would like to delete the repository. This script interfaces soley with the Github API and will NOT work with other software development hosting services. When invoked, it will proceed to ask a series of prompts needed to remotely delete a Github repository.

`bgit -l`

Invoking bgit with the -l flag will prompt the user to input how many previous commits they would like to review. This is essentially a very abreviated version of git log.

`bgit -r`

Invoking bgit with the -r flag will prompt the user to input how many previous commits they would like to review for the purposes of reverting back to one of these previous commits.

`bgit -h`

Invoking bgit with the -h flag will provide the user with a standard help page about basic usage of this script.

### A Brief Note on DevIcons/Colors

bgit makes heavy use of emojis in its prompts as well as colors displayed by invoking tput. If you have previously installed devicons and have a terminal emulator capable of displaying UTF-8 characters, then the script should display these with no problem [^3].

### Required and Optional Dependencies

bgit is a simple bash script, and thusly relies on many of the standard GNU and Linux utils, including echo, grep, awk, tr, read, and less, and of course git. bgit also relies on curl and xclip for some of its more nuanced features (like initializing/deleting a repository on Github via the Github API). Lastly, bgit also optionally utilizes bat and legit. Utilize your best judgement and install these various packages via your favorite package manager(s) as you see fit. Most of these packages are preinstalled on the majority of Linux Distributions and are otherwise easily installed.

### Bare Bones bgit

There is a bare bones version of bgit included in this repository. This version omits colorized output, devicons, gitmojis, and does not suppress certain outputs (it also does not remember you password for an hour). To install this version of bgit, simply navigate into the bare_bones_bgit directory and run the install script from within that directory instead.

### On Usage with Github API

bgit has features contained within its init and delete scripts that utilize the Github API. In order to utilize these features, you must have a personal access token generated and stored as an environment variable referenced within a file in your home directory. Please see Github's [documentation](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) on generating a personal access token. Once you have generated this token, you'll need to store it in a file in your home directory called .gh_pat like so:

`echo "GH_TOKEN=your_personal_access_token_goes_here" > ~/.gh_pat`

[^1]: bgit's .gitignore selection currently only support C, Javascript, and Python, for a full list of default .gitignores, please see the [github page](https://github.com/github/gitignore).

[^2]: bgit utilizes captainsafia's [legit](https://github.com/captainsafia/legit) to generate default LICENSES

[^3]: If you'd like to install devicons, please visit [vorillaz's github page](https://github.com/vorillaz/devicons). If you'd rather not install devicons, use the barebones version of bgit instead.
