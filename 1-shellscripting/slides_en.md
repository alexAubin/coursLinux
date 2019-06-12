title: Bash Scripting
class: animation-fade
layout: true

---

class: impact

# Bash Scripting

### and "advanced" commands

---

# Overview

## 9. Advanced commands

   - 9.1 redirection and command assembly
   - 9.2 pipes and toolbox

## 10. Bash scripting

   - 10.0 writing and running scripts
   - 10.1 variables
   - 10.2 interactivity
   - 10.3 conditions
   - 10.4 functions
   - 10.5 loops

---

class: impact

# 9. Advanced commands

## 9.1 - Redirections and assembly

---

# 9.1 - Redirections and assembly

## Functional sketch of a command

- A command is a box with inputs and outputs
- and a return code (`$?`)
   - 0 : everything went fine (success)
   - 1 (or any value different than zero) : there was an issue ! (failure)

.center[
![](img/commandbox.png)
]

---

# 9.1 - Redirections and assembly

## Inputs / outputs

.center[
![](img/commandbox.png)
]

- **arguments** : data given at the launch of the command (e.g. `/usr/` in `ls /usr/`)
- **stdin** : input stream (typ. from the keyboard)
- **stdout** : output stream (typ. to the terminal)
- **stderr** : error stream (typ. to the terminal as well!)

---

# 9.1 - Redirections and assembly

## Return code

```bash
$ ls /toto
ls: cannot access '/toto': No such file or directory
$ echo $?
2
```

---

# 9.1 - Redirections and assembly

## Redirecting the inputs/outputs (1/3)

- `cmd > file` : redirect stdout to file (the file will first be erased !)
- `cmd >> file ` : append stdout at the end of the file
- `cmd < file` : use the content of 'file' as stdin for the command
- `cmd <<< "string"` : use "string" as stdin for the command

Examples

```bash
ls -la ~/ > all_my_files.txt  # Save a list of all my files in the home directory
echo "eat lunch" >> todo.txt  # Add "eat lunch" at the end of the todo list
wc < "a long piece of text"   # Count the number of words in the given string
```

---

# 9.1 - Redirections and assembly

## Redirecting the inputs/outputs (2/3)

- `command 2> file` : redirect stderr to file (the file will first be erased !)
- `command 2>&1` : redirect stderr to stdout

Exemples :

```bash
ls /* 2> errors   # Save all the error messages in 'errors'
ls /* 2>&1 > log  # Redirect all errors to stdout (the console) and stdout to 'log'
ls /* > log 2>&1  # Redirect everything to 'log' !
```

---

# 9.1 - Redirections and assembly

## Redirecting the inputs/outputs (3/3)

Special files :
- `/dev/null` : a bottomless pit (or black hole)
- `/dev/urandom` : a random generator (or white hole)

.center[
![](img/bottomlesspit.png)
]

---

# 9.1 - Redirections and assembly

## Redirecting the inputs/outputs (3/3)

Special files :
- `/dev/null` : a bottomless pit (or black hole)
- `/dev/urandom` : a random generator (or white hole)

```bash
ls /* 2> /dev/null           # Ignore stderr
mv ./todo.txt /dev/null      # Original way to delete a file !
head -c 5 < /dev/urandom     # Print 5 chars from /dev/urandom
cat /dev/urandom > /dev/null # Try to fill the bottomless pit with random stuff
```

---

# 9.1 - Redirections and assembly

## Assembling commands

Run several commands in a row :

- `cmd1; cmd2` : execute `cmd1` then `cmd2`
- `cmd1 && cmd2` : execute `cmd1` then `cmd2` but only if `cmd1` succeeded !
- `cmd1 || cmd2` : execute `cmd1` then `cmd2` but only if `cmd1` failed
- `cmd1 && (cmd2; cmd3)` : "groups" `cmd2` and `cmd3` together

Live exercice :

what does `cmd1 && cmd2 || cmd3`

---

class: impact

# 9. Advanced commands

## 9.2 - Pipes and toolbox

---

# 9.2 Pipes and toolbox

## Pipes ! (1/3)

- `cmd1 | cmd2` allows to assemble commands, such that `stdout` of `cmd1` becomes `stdin` of `cmd2` !

Example : `cat /etc/login.defs | head -n 3`

.center[
![](img/pipe.png)
]

- (Beware that, by default, `stderr` is not affected by pipes !)

---

# 9.2 Pipes and toolbox

## Pipes ! (2/3)

When using pipes, it is generally to chain operations like:
- generate or fetch some data
- process the data on the fly
- filter the data

---

# 9.2 Pipes and toolbox

## Pipes ! (3/3)

Technical addition
- The transmission of one command to the other is done "in real time" and as it goes. The first command does not need to finish for the second command to start working.
- If the second command is done, it *can* tell the first one such that it *may* prematurely finish (SIGPIPE).
    - This is the case for example in `cat very_big_file | head -n 3`

---

# 9.2 Pipes and toolbox

## Toolbox : tee

`tee` allows to redirect `stdout` to a file while still displaying it in the terminal

```bash
tree ~/documents | tee arbo_docs.txt  # Display and save the file tree of ~/documents
openssl speed | tee -a tests.log      # Display and append the output after tests.log
```

---

# 9.2 Pipes and toolbox

## Toolbox : grep (1/3)

`grep` allows to filter lines matching a keyword (or more generally a pattern)

```bash
$ ls -l | grep r2d2
-rw-r--r--  1 alex alex        0 Oct  2 20:31 r2d2.conf
-rw-r--r--  1 r2d2 alex     1219 Jan  6  2018 zblorf.scd
```

```bash
$ cat /etc/login.defs | grep TIMEOUT
LOGIN_TIMEOUT		60
```

(we could also simply do : `grep TIMEOUT /etc/login.defs`)

---

# 9.2 Pipes and toolbox

## Toolbox : grep (2/3)

Another useful option (among other) : `-v` allows to reverse the filter

```bash
$ ls -l | grep -v "alex alex"
total 158376
d---rwxr-x  2 alex droid    4096 Oct  2 15:48 droidplace
-rw-r--r--  1 r2d2 alex     1219 Jan  6  2018 zblorf.scd
```

An "or" can be created this way : `r2d2\|c3p0`

```bash
$ ps -ef | grep "alex\|r2d2"
# Display only lines containing alex or r2d2
```

---

# 9.2 Pipes and toolbox

## Toolbox : grep (3/3)

One can refer to the begining and end of line using `^` and `$` :

```bash
$ cat /etc/os-release | grep "^ID"
ID=manjaro

$ ps -ef | grep "bash$"
alex      5411   956  0 Oct02 pts/13   00:00:00 -bash
alex      5794   956  0 Oct02 pts/14   00:00:00 -bash
alex      6164   956  0 Oct02 pts/15   00:00:00 -bash
root      6222  6218  0 Oct02 pts/15   00:00:00 bash
```

---

# 9.2 Pipes and toolbox

## Toolbox : tr

`tr` translated characters from one set to characters in the other set ...

```bash
$ cat /etc/os-release \
   | grep "^ID" \
   | tr '=' ' '
ID manjaro

$ echo "ho hello" | tr 'a-m' 'A-M'
Ho HeLLo
```

---

# 9.2 Pipes and toolbox

## Toolbox : awk

`awk` est un processeur de texte assez puissant ...
- En pratique, il est souvent utilisé pour "récupérer seulement une ou plusieurs colonnes"
- Attention à la syntaxe un peu compliquée !

```bash
$ cat /etc/os-release  \
    | grep "^ID"       \
    | tr '=' ' '       \
    | awk '{print $2}' \
manjaro

$ who | awk '{print $1 " " $4}'
alex 22:10
r2d2 11:27
```

- L'option `-F` permet de specifier un autre délimiteur
    - par ex. `cat /etc/passwd | awk -F: '{print $3}'`

---

# 9.2 Pipes and toolbox

## Toolbox : sort

`sort` is used to sort data:
- `-k` to specify which column to use during the sort (by default: the first one)
- `-n` to sort by numeric order (instead of alphabetic order by default)

```bash
ps -ef | sort         # Sort processes according to their owner (first col)
ps -ef | sort -k2 -n  # Sort processes according to their PID (2nd col., numbers)
```

---

# 9.2 Pipes and toolbox

## Toolbox : uniq

`uniq` keeps only unique occurences ... or can be used to count number of occurences (with `-c`)

`uniq` is to be used on **already sorted** data

```bash
who | awk '{print $1}' | sort | uniq             # Display the list of users logged in
who | awk '{print $1}' | sort | uniq -c          # Countes the number of shell per user
```

---

# 9.2 Pipes and toolbox

## Toolbox : sed

`sed` is very powerful to manipulate text ... but it syntax can be deemed complex

Search and replace : `s/pattern/replacement/g`

Example :
```bash
ls -l | sed 's/alex/padawan/g'   # Replace all the occurences of alex with padawan
```

---

class: impact

# 10. Bash scripts

---

class: impact

# 10. Bash scripts

### 10.0 Writing and running scripts

---

# 10.0 Writing and running scripts

## Scripts

- `bash` <small>(`/bin/bash`)</small> is an interpreter
- Instead of writing commands interactively, one may instead write a serie of command in a file : a script
- A script can be considered to be a program, characterized by the fact that it's usually small and standalone

---

# 10.0 Writing and running scripts

## Usefulness of bash scripts

What it usually does **not**:
- scientific computations
- graphical / web interfaces
- subtle or complex data manipulations

What it does pretty well:
- rapid prototyping
- automation of sysadmin tasks (related to files, services, ...)
- make repetitive tasks configurable or interactive

---

# 10.0 Writing and running scripts

## Writing a script (1/2)

```bash
#!/bin/bash

# A comment
cmd1
cmd2
cmd3
...

exit 0    # (Optional, 0 by default)
```

---

# 10.0 Writing and running scripts

## Writing a script (2/2)

```bash
#!/bin/bash

echo "Hello, world !"
echo "How are you today ?"
```

---

# 10.0 Writing and running scripts

## `exit`

- `exit` stops and exit the script immediately
- `exit 0` quit and tells that everything went fine (success)
- `exit 1` (or any value different than 0) quit and tells that something went wrong (failure)

---

# 10.0 Writing and running scripts

## Running a script (1/3)

First way : with the `bash` interpreter

- `bash script.sh` runs `script.sh` in a child process
- we're telling explicitly that it should be understood as a bash script
    - (here, we didn't really need to put `#!/bin/bash` at the top)

---

# 10.0 Writing and running scripts

## Running a script (2/3)

Second way: using `source`

- `source script.sh` runs the script **inside** the current terminal
- 95% of the time, this is **not** the appropriate thing for your use case !
- Typical use case for `source` : reload the `.bashrc`
- (Other case : `source venv/bin/activate` for python virtualenv)

---

# 10.0 Writing and running scripts

## Running a script (3/3)

Third way: by giving execution permission to your script

```
chmod +x script.sh   # Do it only once, the first time
./script.sh
```

- The script will be interpreted using the program set after `#!`
- (in our case: `#!/bin/bash`)

---

# 10.0 Writing and running scripts

## About the `PATH` variable (1/2)

The `PATH` environment variable defines where to look for programs

```bash
$ echo $PATH
/usr/local/bin:/usr/bin:/bin:/usr/local/sbin

$ which ls
/usr/bin/ls

$ which script.sh
which: no script.sh in (/usr/local/bin:/usr/bin:/bin:/usr/local/sbin
```

---

# 10.0 Writing and running scripts

## About the `PATH` variable (2/2)

```bash
$ ./script.sh  # Will work (if +x enabed)
$ script.sh    # Apriori won't work
```

Nevertheless it's possible to add directories to `PATH` :

```bash
PATH="$PATH:/home/padawan/my_programs/"
```

And then, you can use directly (and from anywhere else) programs listed in `~/my_programs` !

---

# 10.0 Writing and running scripts

## Summary

- `bash script.sh` is the "explicit" way to run a bash script
- `./script.sh` run an executable (+x) using an absolute or relative path
- `source script.sh` runs the script *in the current shell* !
- `script.sh` may be used only if the script is in one of the directories of `PATH`

---

class: impact

# 10. Bash scripts

### 10.1 Variables

---

# 10.1 Variables

Generally speaking, variables are:
- a container for piece of data
- a way to give a name to this piece of data

Initializing a variable in bash (beware the syntax):

```bash
PI="3.1415"
```

Using a variable:

```bash
echo "Pi is (approximately) $PI"
```

N.B. : in bash, there's not so much ambiguity between the container and the content


---

# 10.1 Variables

You may change the value of an existing variable:

```bash
$ HOME="/home/alex"
$ HOME="/var/log"
```

... except if it is defined as `readonly`!

```bash
$ readonly PI="2"           # ... oopsie!
$ PI="3.14"
-bash: PI: readonly variable
```

---

# 10.1 Variables

Initialze a variable with the result of another command

```bash
NB_OF_LINES=$(wc -l < /etc/login.defs)
```

Equivalent syntax with backquotes <small>(or backticks)</small> (historical, deprecated)

```bash
NB_OF_LINES=`wc -l < /etc/login.defs`
```

---

# 10.1 Variables

You can also compose stuff using other variables:

```bash
MY_HOME="/home/$USER"
```

or also:

```bash
FILE="/etc/login.defs"
NB_OF_LINES=$(wc -l < $FILE)
MESSAGE="There are $NB_OF_LINES lines in $FILE"
echo "$MESSAGE"
```

---

# 10.1 Variables

## Various notes (1/5)

- In bash, we only manipulate text!

```bash
$ PI="3.14"

$ NUMBER="$PI+2"

$ echo $NUMBER
3.14+2           # literally!
```

---

# 10.1 Variables

## Various notes (2/5)

- When using a variable, it's usually better to put quotes around it:

```bash
$ FILE="signed document.pdf"

$ ls -l $FILE
ls: cannot access 'signed': No such file or directory
ls: cannot access 'document.pdf': No such file or directory

$ ls -l "$FILE"
-rw-r--r-- 1 alex alex 106814 Mar  2  2018 'signed document.pdf'
```

---

# 10.1 Variables

## Various notes (3/5)

- ACHTUNG : a nonexisting variable is an empty string... !

```bash
$ NB_OF_LINES=42
$ echo "$NB_OF_LINES"
                        # <<< empty line !
```

---

# 10.1 Variables

## Various notes (3/5)

- To use a variable unambiguously, it may be necessary to write it like this `${VAR}`:

```bash
$ FILE=/var/log/

$ cp $FILE $FILE_old
cp: missing destination file operand after 'stuff'
# (because the variable `FILE_old` doesn't exist!)

$ cp $FILE ${FILE}_old
# works as intended !
```

---

# 10.1 Variables

## Various notes (4/5)

- 'simple quotes' can be used to prevent the interpretation of variables:
- Or one may also use \ to escape a character:

```bash
$ echo "My home is $HOME"
My home is /home/alex

$ echo 'My home is $HOME'
My home is $HOME

$ echo "My home is \$HOME"
My home is $HOME
```

---

class: impact

# 10. Bash scripts

### 10.2 Configurability / interactivity

---

# 10.2 Configurability / interactivity

- The behavior of a script can be parametrized using options or data given in arguments
- It's also possible to add interactivity, meaning asking information to the user during the execution of the script

---

# 10.2 Configurability / interactivity

## Paremeters

- `$0` contains the name of the script
- `$1` contains the first argument
- `$2` contains the second argument
- and so on ...
- `$#` contains the total number of argument
- `$@` corresponds to "all the arguments" (in a single block)

---

# 10.2 Configurability / interactivity

```bash
#!/bin/bash

echo "This script is named $0 and had $# arguments given"
echo "The first arg is : $1"
echo "The second arg is : $2"
```

```bash
$ ./myscript.sh hello "to the world"
This script is named myscript.sh and had 2 arguments given
The first arg is : hello
The second arg is : to the world
```

---

# 10.2 Configurability / interactivity

## Interacitivity

It is possible to wait for a user input with `read` :

```bash
echo -n "What is your name?"
read NAME
echo "OK, hello $NAME !"
```

---

class: impact

# 10. Bash scripts

### 10.3 Conditions

---

# 10.3 Conditions

## Generalities

Conditions allow to adapt the execution of a program according to specific cases...

---

# 10.3 Conditions

## Using double brackets (1/3)

```bash
NB_OPENED_TERMS=$(who | wc -l)

if [[ "$NB_OPENED_TERMS" -ge "4" ]]
then
   echo "There is a lot of terms opened on this machine!"
else
   echo "There's only $NB_OPENED_TERMS on this machine"
fi
```

---

# 10.3 Conditions

## Using double brackets (2/3)

```bash
if [[ ! -f "$HOME/.bashrc" ]] 
then
   echo "You should create yourself a .bashrc !"
fi
```

---

# 10.3 Conditions

## Using double brackets (3/3)

```bash
if [[ expression ]]
then
   cmd1
   cmd2
   ...
else
   cmd3
   cmd4
fi
```

N.B. : An 'else' case is not mandatory !

---

# 10.3 Conditions

## Test numeric values

- `[[ X -eq Y ]]` : X **equals** to Y
- `[[ X -ne Y ]]` : X **not equals** to Y
- `[[ X -ge Y ]]` : X is **greater than or equals** to Y
- `[[ X -le Y ]]` : X is **lesser than or equals** to Y
- `[[ X -gt Y ]]` : X is **greater than** to Y
- `[[ X -lt Y ]]` : X is **lesser than** to Y

For instance to test that a variable `RADIUS` is higher than 42 :

```bash
[[ "$RADIUS" -gt "42" ]]
```

---

# 10.3 Conditions

## Test text values

- `[[ STRING1 == STRING2 ]]` : strings are equal
- `[[ STRING1 != STRING2 ]]` : strings are different
- `[[ STRING =~ REGEX ]]` : string matches the regex...
- `[[ -z STRING ]]` : string is empty (zero length)
- `[[ -n STRING ]]` : string is not empty (non-zero length)

Examples :
```bash
[[ "$USER" == "root" ]]   # Test if current user is root (N.B. : not the secure way!)
[[ -z "$ANSWER" ]]        # Test if the variable ANSWER is not empty
[[ "$USER" =~ "r2d2\|c3p0" ]]  # Test if current user is r2d2 or c3p0 
```

---

# 10.3 Conditions

## Test files

- `[[ -e FILE ]]`   # Test if FILE exists
- `[[ -f FILE ]]`   # Test if FILE is a regular file
- `[[ -d FILE ]]`   # Test if FILE is a directory

Examples:
```bash
[[ -d "$HOME/documents" ]] # Test if the directory documents exists
[[ -f "$HOME/.bashrc" ]]   # Test if you have a file .bashrc
```

---

# 10.3 Conditions

## Combining expressions

- `[[ ! expression ]]`         # Test the negation of the expression
- `[[ expr1 ]] && [[ expr2 ]]` # Test that expr1 AND expr2 are true
- `[[ expr1 ]] || [[ expr2 ]]` # Test that expr1 OR </small>(inclusive)</small> expr2 are true

Examples:
```bash
[[ ! -e "$HOME/.bashrc" ]]     # Test that your .bashrc does not exists
[[ "$CPU_USE" > "100" ]] && [[ "$MEM_FREE" < 0 ]]
```

---

# 10.3 Conditions

## Conditions from a command return

```bash
if command
then
   cmd1
   cmd2
   ...
else
   cmd3
   cmd4
fi
```

---

# 10.3 Conditions

## Conditions from a command return

```bash
if grep "r2d2" /etc/passwd
then
   echo "r2d2 is indeed registered as a user"
else
   echo "r2d2 is not registered as a user"
fi
```

---

# 10.3 Conditions

## About expressions between brackets

`[[ expression ]]` can be used as a command !

It is sometimes lightweight to write small conditions:

```bash
[[ -f "$HOME/.bashrc" ]] || echo "You should create a .bashrc !"
```


---

class: impact

# 10. Bash scripts

### 10.4 Functions

---

# 10.4 Functions

## Generalities

Functions are like commands, which are defined by the script and only exist in the context of the script
Like commands, they have an `stdin`, `stdout`, `stderr`, arguments (`$1`, `$2`, ...) and a return code

The purpose of functions is to:
- wrap a serie of commands and "package it" into a small standalone consistent task
- give a **relevant** name to this task
- (make this task parametrizable)
- be able to call this task several times
- create structure in the code

---

# 10.4 Functions

## Example

Initializing a user:
- (it needs a name)
- create the user with `useradd`
- create the home folder
- create a `.bashrc`
- add the right permissions on files and directories
- define a quota
- ...


---

# 10.4 Functions

## Concrete example (not tested)

```bash
function create_droid()
{
    local NAME="$1" 

    useradd $NAME
    mkdir /home/$NAME
    echo "alias ls='ls --color=auto'" > /home/$NAME/.bashrc
    chown -R $NAME:$NAME /home/$NAME
    adduser $NAME droid

    return 0
}

create_droid r2d2
create_droid c3p0
create_droid bb8
```

---

# 10.4 Functions

## Syntax

```bash
function my_function()
{
    cmd1
    cmd2
    cmd3

    return 0   # Optional
}
```

---

# 10.4 Functions

## Return code

```bash
function create_droid()
{
    local NAME="$1" 
    if grep "^$NAME" /etc/passwd
    then
       echo "A user named $NAME already exists!"
       return 1
    fi

    # [...]

    return 0
}
```

---

# 10.4 Functions

## Local variables

- In a function, you may defined local variables using the keyword `local`
- Such a variable only has meaning inside the context of this function
- Typicaly, this can be used to clarify the expected arguments

```bash
function set_quota()
{
   local USER="$1"
   local LIMIT="$2"

   # [...]
}

set_quota r2d2 100M
echo $LIMIT   ## << This won't work ! (LIMIT will be empty)
```

---

class: impact

# 10.5 - `for` / `while` loops

---

# 10.5 - `for` / `while` loops

## Generalities about loops

Repeat instructions:
- over a list of values / data (`for` loops)
- or as long as a condition is true (`while` loops)

---

# 10.5 - `for` / `while` loops

## `for` loop

```bash
for I in $(seq 1 10)
do
    echo "I contains $I"
done
```

```bash
I contains 1
I contains 2
I contains 3
...
I contains 10
```

---

# 10.5 - `for` / `while` loops

## `for` loop

```bash
for FILENAME in $(ls)
do
    cp "$FILENAME" "/home/alex/backups/${FILENAME}.bkp"
done
```

---

# 10.5 - `for` / `while` loops

## `for` loop

```bash
for USER in $(cat /etc/passwd | awk -F: '{print $1}')
do
   SHELL=$(grep "^$USER:" /etc/passwd | awk -F: '{print $7}')
   echo "The $USER shell is : $SHELL"
done
```

---

# 10.5 - `for` / `while` loops

## `while` loop

```bash
I=10
while [[ "$I" -ge 0 ]]
do
   echo "Now I contains $I"
   I=$(bc <<< "$I-1")
done
```

```
Now I contains 10
Now I contains 9
Now I contains 8
...
Now I contains 0
```

---

# 10.5 - `for` / `while` loops

## `while` loop

As long as a condition is true....

```bash
while [[ "$NUMBER" -ge 0 ]]
do
    echo "Please provide a negative number !"
    read NUMBER
done
echo "Congratz ! $NUMBER is indeed a negative number !"
```

---

# 10.5 - `for` / `while` loops

## `while` loop

```bash
while [[ -z "$(ip a | grep 'inet ' | awk '{print $2}' | grep -v '127.0.0.1')" ]]
do
   echo "Waiting ..."
   sleep 1
done
```


