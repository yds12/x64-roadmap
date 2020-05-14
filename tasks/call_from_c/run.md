Many tasks that are trivial in high level languages can be quite complicated in
Assembly. So far we have printed a string to the screen and read the exit code
of a program via `echo $?`. Sometimes, however, we just want to know what is
the content of a register.

We can do this by writing a program that "returns" the value of that register
by putting it in **RAX** and returning control to the caller, and writing a
C program to call this assembly program and writing its return to the screen.

These are `ret_int64.asm` and `caller.c`. First, assemble the `.asm` program
as usual:

    $ nasm -felf64 tasks/call_from_c/ret_int64.asm -o bin/ret_int64.o

Then, use gcc to compile `caller.c`, linking it to our asm library:

    $ gcc tasks/call_from_c/caller.c bin/ret_int64.o -o bin/caller_c

Notice that our `ret_int64.asm` does not have an entry point, denoted in
assembly by the label `_start`. Here, the entry point will be provided by
the C runtime, which will call the main function from `caller.c`, which in turn
will call our program.

Now, just invoke `caller_c`:

    $ bin/caller_c
    10000000000
    2540be400

That's the content of **RAX** at the moment before the `ret` call.

We will use this same C program with other assembly programs, all they need
to have is a "function" `asm_func` declared globally with a `ret`
instruction at the end. The return value will be read from **RAX** (if 
the assembly program does not set it, it will be random garbage).
