# git-promp-style

![Screenshot](https://github.com/KillerCoderPT/git-promp-style/blob/master/screenshot.png)

`git-prompt.sh` is the my old look and the wrong way to edit it, because git bash stop to received the updates.

The right way to create a style for the git bash prompt is using the command `code ~/.bashrc` and edit the file. This will generate a new styled prompt and this file we can edit whitout any problem.

# Very useful links

Have some cool things:

https://dev.to/pablohs1986/tuning-git-bash-1eeo

Have some cool commands:

https://bneijt.nl/blog/post/add-a-timestamp-to-your-bash-prompt/

Foreground colors: `echo -e "\e[38;5;82mHello \e[38;5;198mWorld"`

https://misc.flogisoft.com/bash/tip_colors_and_formatting

Learn more about Bash Prompt:

https://tldp.org/HOWTO/Bash-Prompt-HOWTO/index.html

### Helpers:

`PS1='${PWD#"${PWD%/*/*}/"} \$ '` This command will present the working directory and the previous one.

https://unix.stackexchange.com/questions/216953/show-only-current-and-parent-directory-in-bash-prompt
