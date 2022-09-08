## bgit: a handy shell script for simple git inits/commits

bgit is my personal git automation tool written in bash. It is designed to quickly automate away alot of the simple git commands that git beginners use every day. These include commands like git init, git add, git commit -m, and git push. It is a series of simple prompts that make the git workflow seamless and quick to use, so that you can quickly commit your recent version updates and move on with your day.

If for whatever reason you have stumbled across this project, please note that it is not quite done. However, as of right now, you can simply move the bgit executable into a directory that is within your $PATH, and move the bgit_config directory to your $HOME/.config directory and rename the bgit_config directory to bgit like so:

`mv bgit <some_directory_in_your_$PATH>`

`mv bgit_config $HOME/.config/ && mv $HOME/.config/bgit_config $HOME/.config/bgit`

I'll write a more extensive Use Manual here later, but for now you can simply invoke the script like so:

`bgit`

This will initialize a series of prompts if there is a git repository in your current working directory and prompt you by showing you what files are being added/modified/deleted. It will also prompt you for gitmojis(optional), commit messages, and passwords(it actually saves your password for one hour, but this doesn't apply to personal access tokens nor ssh keys).

NOTE: Keep in mind that this script silences most error messages, so it's best to check your repository when using this script (at least when first using it to be sure).

If you attempt to use bgit in a directory that has no .git directory, it will ask if you'd like to initialize a new one (this also can be done using the -i flag):

`bgit -i`

Lastly, there is a revert feature that prompts you if you'd like to revert back to any of the last five commits:

`bgit -r`

That's it for now. This is a personal project by a bash scripting noob, so I doubt anyone will read this, let alone utilize this, but should you choose to try it out and have any questions, please feel free to reach out to me.

__Project Checklist:__

- [x] Initial Commit
- [ ] Create a --help Flag feature/message
- [ ] Organize files so that they source from a common directory (i.e $HOME/config)
- [ ] Update README to include usage/configuration as well as examples/pics/gifs
