# Exercises sheet

### 0. Setting up

- Install Virtualbox
- Import the Debian or Linux Mint box (File > Import a virtual device)

### 1. Boot and log in

- Observe the boot of the machine
- Log in

### 2. First contact with the command line

- Change the password by typing `passwd` then *Enter* and follow the instructions
- Type `pwd` then *Enter* then observe
- Type `ls` then *Enter* then observe
- Type `cd /var` then *Enter* then observe
- Type `pwd` then *Enter* then observe
- Type `ls` then *Enter* then observe
- Type `ls -l` then *Enter* then observe
- Type `echo 'Je suis dans la matrice'` then *Enter* then observe

 
### 3. The command line

- 3.1 - Go to `/usr/bin` and list the content of the directory
- 3.2 - Are there any hidden files in your home folder ?
- 3.3 - When was /etc/shadow last modified ?
- 3.4 - Identify what's the purpose of the `-h` option for the command `ls` using its `man`.
- 3.5 - Identify what the command `sleep` does using `man`.
- 3.6 - Run `sleep 30` and stop its execution before the command ends.
- 3.7 - List successively and as quickly as you can the content of the directories `/usr`, `/usr/share`, `/usr/share/man` and `/usr/share/man/man1` using [Tab] and ↑. (The purpose is to make you more familiar with these two keys)
- 3.8 - Find out what `date` and `cal` do.
- 3.9 - Display the calendar for the year 2019, then *just* the month of August 2019
- 3.10 - Find out what the command `free` does, and try to make sense of the output of `free -h` on your machine
- 3.11 - Find out what the command `ping` does, and try to make sense of the output of `ping 8.8.8.8`.

### 4. Files and filesystem

- 4.1 - By using `mkdir` and `touch`, create the following file tree in your personal directory:

```bash
documents/
├── notes_abouts_commands/
│   ├── ls.txt
│   ├── cd.txt
│   └── pwd.txt
├── img/
│   ├── pikachu.jpg
│   └── tortoise.jpg
└── linuxLecture.pdf
```

- 4.2 - Fill `ls.txt`, `cd.txt` and `pwd.txt` with some text using `nano` (for example, a very short summary of what the command does - or just dummy content)
- 4.3 - Check that the files actually got modified by displaying their content with `cat`.
- 4.4 - Display the content of `/etc/os-release`
- 4.4 - Go to `~/documents/notes_abouts_commands` then, *using only relative paths* (and using [Tab]!), move successively to:
    - `~/documents/img/`
    - `/usr/share/doc/`
    - `~/.nano/`
    - `~/documents/img/`
- 4.5 - Display the content of `/etc/motd` and `/etc/login.defs`
- 4.6 - Using `less`, look for occurences of `LOGIN_TIMEOUT` in the file `/etc/login.defs`. Same thing, but now using `nano`.
- 4.7 - What is the length of `/etc/login.defs` in terms of number of lines?
- 4.8 - Create the file `charizard.jpg` in the folder `~/documents/notes_abouts_commands/`... You then realize that you wanted to put this file in `~/documents/img` ! Use the command `mv` to move `charizard.jpg` to the right folder.
- 4.9 - Rename `~/documents/img` to `~/documents/pokemons`
- 4.10 - Create a new directory `~/mybins` and copy the files `/bin/ls` and `/bin/pwd` into it.
- 4.11 - Create a directory `~/bkp/` and create a copy of `~/documents/notes_abouts_commands` called `~/bkp/cmd_bkp`
- 4.12 - Delete `~/bkp/cmd_bkp/pwd.txt`
- 4.13 - Delete all the directory `~/bkp/` recursively
- 4.14 - Try to delete `/etc/passwd` (as a regular user !)
- 4.15 - Inspect the output of `df -h` and `lsblk`
- 4.16 - Try to resize a partition using `gparted`

### 5. Users and groups

- 5.1 - Open a shell as `root` with `sudo`, `su`, or in another `tty`
- 5.2 - Create a new user `r2d2`
- 5.3 - Create a new group `droid`
- 5.4 - Add `r2d2` to the group `droid`
- 5.5 - Using `su`, open a new shell as `r2d2` and check the result of `whoami`, `id` and `groups`
- 5.6 - Define the password with `passwd`
- 5.7 - Open several `tty` with different users, then observe what `who` returns
- 5.8 - Check that the info of `r2d2` exist in `/etc/passwd` and `/etc/shadow`
- 5.9 - What happens if you define `/bin/false` as the default shell for `r2d2` ?
- 5.10 - Inspect the content of `/etc/sudoers` : can you give the right to `r2d2` to use `sudo` ?

### 6. Permissions

- 6.1 - Create a file `xwing.conf` which only you and your primary group can read
- 6.2 - Create a file `private` and remove all permissions on it
- 6.3 - Using three separate commands, add to `private` the read permission for the user owner, the write permission for the owner and the group, and execution right for everybody.
- 6.4 - Re-remove all permissions on `private`.
- 6.5 - Put back all the previous permissions, but now using a single command
- 6.6 - Change the permissions of your home folder such that only you can write and enter (x).
- 6.7 - Forbid every "other" users to snoop in and change files in `~/documents`, using a single recursive command
- 6.8 - Create a home folder for `r2d2`
- 6.9 - Define `r2d2` as owner of its home folder, and make sure that the permissions allows it (and only it) to read, write and enter this directory
- 6.10 - Create a file `droid.conf` in this home folder, and set `r2d2` and `droid` as user and group owners.
- 6.11 - Create the files `beep.wav`, `boop.wav` and `blop.wav` that only `r2d2` may execute.
- 6.12 - Are you able to create a folder containing files which you can read, but not list ?
- 6.13 - As a non-root user, are you able to give one of your file to `r2d2` ?

### 7. Processes

- 7.1 - Run `sleep 30`, then put this command in background. Check with `jobs` that it is indeed running and eventually ends.
- 7.2 - Same thing, but put back the command in foreground *before* it ends.
- 7.3 - Run `sleep 30` *directly* in background (using `&`) then kill the process before it ends.
- 7.4 - Run again `sleep 30` in a terminal, then check in another terminal using `ps` that the command is indeed running.
- 7.5 - Identify which process (its parent) corresponds to the shell that launched that `sleep 30`
- 7.6 - Knowing the PID of this shell, try to kill it gently (or brutally if it resists)
- 7.7 - Identify using `top` which process is currently consuming the biggest amount of CPU, and the one consuming the biggest amount of memory.
- 7.8 - Run the command `openssl speed -multi 4` - then do the test again
- 7.9 - Can you kill using just one command all `openssl` processes ?
- 7.10 - Start a screen session, then run a long command (e.g. `sleep 120`). Detach the session, then re-attach it from another terminal or tty.
- 7.11 - From another terminal, use `ps` to identify the PID of the screen session, and try to kill the process.

### 8. Personalize your environment

- 8.1 - Personalize the appearance of your command prompt (syntax, color) by changing the `PS1` variable
- 8.2 - Add this personalization to your `.bashrc` and propagate the change on your open shells
- 8.3 - Add a welcome message (e.g. `"May the source be with you"`) that will be printed everytime a shell is opened.
- 8.4 - Change the `.bashrc` or root such that its command prompt is in red !
- 8.5 - Make sure that you have the alias `ll` enabled and that `--color=auto` is automatically added when using `ls`
- 8.6 - Create the aliases `suls` and `sucat` which allow to list files in a folder and print the content of a file automatically adding `sudo`. Test these aliases by typing `suls /root` and `sucat /etc/shadow` as a non-root user.
- 8.7 - Create an alias `r2d2` which opens a shell as `r2d2` using `sudo` and `su`
- 8.8 - Figure out what is `LS_COLORS` and how to customize this variable.
- 8.9 - By using `echo`, how can you make it so that typing `ls` will now just display `"I don't feel like it"` instead of its normal behavior?
