Our code is in the `first.asm` file. It is a convention to use the `.asm`
extension for assembly code files. There are two steps in the building
process.

## Build and Run

First we "assemble" the program using the `nasm` assembler. This is simpler
than compiling because each line of assembly code translates almost directly
to bytes of machine code. To assemble, from the project's root directory
(not from the directory where the code is), type:

    $ nasm -f elf64 tasks/first_prog/first.asm -o bin/first.o

This will generate the object file `first.o` in the `bin` directory (under
the project's root). The object file needs to be linked before we can 
execute it:

    $ ld bin/first.o -o bin/first

Now we created an executable file `first` in the `bin` directory. We can
now execute our program, from the root directory, with:

    $ bin/first

## Check the result

The program should return `0` which means `success`. But since this is not
*printed*, we need to use the following command, that checks the return
value of the last executed program:

    $ echo $?
    0

You should see `0` in your terminal.

Try also the `exit256.asm` that uses another exit code. It turns out that
the exit codes are represented with 1 byte (unsigned), in this case ranging 
from 0-255.

## A Shortcut

If you are working from the local 
directory where `first.asm` is, we can do all these steps with just:

    $ nasm -f elf64 first.asm -o first.o
    $ ld first.o -o first
    $ ./first
    $ echo $?
    0

Or even shorter:

    $ nasm -felf64 first.asm -o first.o && ld first.o -o first && ./first
    $ echo $?
    0

But since the project will have lots of executables, we will leave them all
at `bin` so we can easily clean up (and make `git` ignore them easily).

## Reference for Syscalls

In this simple example we use a system call. The codes for all system calls
in Linux x64 can be found 
[here](https://github.com/torvalds/linux/blob/v3.13/arch/x86/syscalls/syscall_64.tbl#L69).
