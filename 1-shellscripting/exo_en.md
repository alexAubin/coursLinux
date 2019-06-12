# Exercises sheet #2

## 9 part 1 - redirections and assembly

- 9.1 - Create a file just by using `echo` and a redirection
- 9.2 - On a small screen, displaying the list of files in `/usr/bin` with `ls` isn't so practical because the output is way too long. To work around this issue, save the output in a file then browse it with `less`.
- 9.3 - Using a **single line of command** : create a folder `dev` in your home folder, then create a sub-directory called `bash`, then inside it a file called `intro` containing `"Bash is pretty cool!"
- 9.4 - Write a **single line of command** that will (only) display "I can!" or "I can't!" if you are able to list the content of `/root` (do the test on other folders to validate the behavior)
- 9.5 - `bc` is an utility for simple arithmetic operations. Test `bc` in interactive mode by doing a few additions (then Ctrl+D to quit). Now put a serie of additions in a file, and use it as the `stdin` for bc. Do the same thing, but now directly inject a string as `stdin` for `bc`.
- 9.6 - `curl` is a utility to download the source code of a webpage (for example, en.wikipedia.org) from the terminal.
    - How can you save the source code to a file instead of displaying it in the terminal?
    - Try again with an URL that doesn't exist, then change the command to hide error messages, but still display "This didn't work" if the command failed.
- 9.7 - Create file `/tmp/chat` in which both you and r2d2 can write. Figure out what the option `-f` of the command `tail` does, then:
    - Run `tail -f /tmp/chat` as a background task in both terms (one with your user, the other one as r2d2)
    - Using redirections, send messages in the file `/tmp/chat` and observe both terminals ;
    - Improve the system by creating an alias `say` that display the message prefixed by your username (e.g.: [r2d2] beep boop).
    
## 9 part 2 - pipes and toolbox

- 9.8 - If it is not already the case, add an alias to automatically enable `--color=auto` each time `grep` is used. Try to use `grep` a few times to validate that matches are indeed highlighted.
- 9.9 - List the lines of `/etc/passwd` corresponding to user with `/bin/bash` set as the login shell.
- 9.10 - Same thing, but this time only display the name of the users !
- 9.11 - List users (only their names!) which have `nologin` as login shell
- 9.12 - List users (only their names) which have an empty password
- 9.13 - Display the content of `/etc/login.defs` without comment lines
- 9.14 - Write a small alias `canisudo` that checks if you are in the `sudo` group.
- 9.15 - By analyzing the options of `grep`, find a way to recursively list all occurences of the word `daemon` in `/etc/`
- 9.16 - Knowing that for grep, `^` and `$` correspond to the beginning and the end of line, can you display the content of `/etc/login.defs` without empty lines, and without empty lines nor comments ?
- 9.17 - Write a command line that will display "Yes" or "No" if r2d2 is currently logged in. To do so, we can (among other things) use the fact that `grep` has a return code, and possibly the option `-q`.
- 9.18 - Using `ps`, `sort` and `uniq`, generate a summary of the number of process currently running for each user
- 9.19 - Using `sort` and `uniq`, anayze the file `loginattemps.log`, and display a summary of each connection attempt per ip
- 9.20 - Build a command line that lists the address of all images on the website `yolowag.team`. You might need to us `curl`, `grep`, `tr`, `awk` (and maybe `sed`).

## 10 part 1 - variables

- 10.1 - Create yourself a development directory (for example: `~/dev/bash`) in which you'll create all your scripts. Write a first script called `hello.sh` which just prints "Hello world !" and "How are you today ?" and run it.
- 10.2 - Using the color code we used in chapter 8, define a few color variables like `PURPLE` containing `\[\033[35m\]`. Change the code of the previous question such that "How are you today ?" is displayed with rainbow colors! (Reminder: when using color codes, `echo` shall be called with option `-e`)
- 10.3 - Get those infos and store them in variables:
    - the name of the distribution (using the content in `/etc/os-release`)
    - the number of different users currently logged in (using `who`)
    - the free and total RAM on the system (c.f. `free -h`)
then display a report like:
```
The distribution is Debian Stretch
There is currently 4 different users logged in
The system has 262MB available RAM over a total of 5.5G
```
- 10.4 - Start the script with `bash -x votrescript.sh` and analyze what's printed: this is useful to see and debug what's happening in a script!

## 10 part 2 - configurability and interactivity

- 10.4 - Write a script `test_args.sh` that will display the name of the script, the number of arguments given, as well as the first and second argument.
- 10.5 - Write a script `add.sh` that will take two number as argument and display the result of their addition
- 10.6 - Write a script `age.sh` that ask the *birth year* of the user, then compute display the corresponding age.
- 10.7 - Write a script `exist.sh` that take a filename as argument, and display "The file exists!" and returns 0 if it's possible to `ls` the file, or displays "Uh Oh !? Not sure this file exists!" and returns 1 otherwise
- 10.8 - Create a script `bkp.sh` that takes a filename as argument, and creates a copy of it in `~/bkp/` (the directory shall automatically be created if needed). The script finally displays a message like "The file was backuped as ~/bkp/file".
- 10.9 - In `bkp.sh`, before starting the copy, use `exist.sh` to check that the file indeed exists before continuing.
- 10.10 - Create a file `check_user.sh`. It is meant to be launched by `root` to make sure a given user is not doing nasty stuff on the system. Implement the following checks one by one, testing them along the way:
   - Ask a user name ;
   - Check that this user name indeed exists via `/etc/passwd`, or display an error message (in stderr) and stop the script and return 1 ;
   - Count the number of processes currently running and owner by this user (you can use `ps -u <user>`) and display a message like "The user has X processes running" ;
   - Same thing, but with the number of currently opened terminals ;
   - Compute the disk space used by the home directory of the user (you can use `du -hs <directory>`). Display a message like "The user's home directory is using X MB".

## 10 part 3 - conditions

- 10.11 - Reopen `age.sh` from question 10.6. Add a check that the given answer is consistent with a year : for instance, if it's lower than 1900, you can display "Hmm, are you sure !?" - and if the year is higher than 2019, you can display something like "Are you coming from the future !?". In both case, the program shall exit and return an error code.
- 10.12 - Similarly to 10.7, write a script called `whatis.sh` that'll take a filename as argument, and display "This is a regular file" or "This is a folder" or "This file does not exist". (You might want to use `elif`)
- 10.13 - Reopen `check_user.sh` :
    - change the test about the user existence now using the syntax `if then ... fi`
    - adapt the behavior of the script such that `./check_user.sh --help` (or `-h`) will diplay a description of what the script does and how to use it instead of the normal behavior.
    - add tests such that the script will complain if it finds that the user has more than 50 running processes, and/or more than 5 opened terminals, or if the size of its home directory is beyond a treshold.

## 10 part 4 - functions

- 10.14 - As in 10.2, create a script `utils.sh` that defines variables corresponding to color codes. Using these, implement (and test along the way) the following functions :
    - `success` that takes a message as argument, and displays `"[ OK ] The message"` with just the word `OK` in green ;
    - `info`    that takes a message as argument, and displays `"[INFO] The message"` with just the word `INFO` in blue ;
    - `warning` that takes a message as argument, and displays *in the error stream* `"[WARN] The message"` with just the word `WARN` in orange ;
    - `error`   that takes a message as argument, and displays *in the error stream* `"[FAIL] The message"` with just the word `FAIL` in red ;
    - `critical` that takes a message as argument, and displays *in the error stream* "[CRIT] The message"` with just the word `CRIT` in red, **and directly exit the script with an exit code equal to 1**.
- 10.15 - Duplicate the script `check_user.sh` of 10.10 (e.g. call it `check_user_v2.sh`), and change the various part of the code into functions. This kind of work is called *(re)factoring*. **Test your changes gradually !**
    - at the beginning (after the `#!/bin/bash`), you can `source utils.sh` to load functions defined in `utils.sh` into your script.
    - introduce a function `assert_user_exists` that will display an error and stop the script (using `critical`) if the user does not exists ;
    - introduce a function `usage` that will be called to describe how to use the script, if it is used with `--help` or `-h` ;
    - introduce a function `check_processes` that will check that the number of processes from the user ain't too high. It will display the number using `info` - or `warn` otherwise.
    - similarly, a function `check_terminals`
    - similarly, a function `check_home_space_usage`
- 10.16 - Finally, tweak the script such that, at the end, it will tell that everything is okay using `success` if no issue was found, or `fail` to tell that there are issues.

## 10 part 5 - loops

- 10.17 - Using a `for` loop, write a script that count 2 by 2 until 100.
- 10.18 - Same thing, but using a `while` loop.
- 10.19 - Reopen the script `check_user.sh`, and use a `for` loop to run this script on all users with `/bin/bash` as login shell.
- 10.20 - Write a script `confirm.sh` that uses a `while` loop to as the user `Are you sure? [yes/no]` as long as it did not answer exactly `yes` or exactly `no`
- 10.21 - Coming back from the mariage of your aunt or cousin, you decide to share the 100 pictures you took with the rest of the family. Knowing that your cutting edge camera takes pictures weighting about 10MB each, you realize that you should resize those before sending 1GB of data into everybody's inbox. To do so, have a look at the `convert` command (in package ImageMagick) which allows to rescale or change the quality level of pictures. Use it in a `for` loop to resize all `jpg` pictures in the current folder. (You can test it for example by downloading free pictures on `pixabay.com`)
- 10.22 - Write a game consisting in making a user guess a number chosen randomly by the program. The user will enter a number, and the program shall tell if the number to guess is lower or higher, until the right number is found.
