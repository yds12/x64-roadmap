To build the programs of this section, do the usual (as in
[the first program](../first_prog/build.md)). To run the first program, type:

    $ bin/reg1
    $ echo $?
    10

Again, the `echo $?` command shows the value returned by our program. In the
case of `reg1` it should be `10`.

Now, for the second program, we will use the 
[technique from earlier](../call_from_c/run.md). Assemble the program as
usual:

    $ nasm -felf64 tasks/registers/reg2.asm -o bin/reg2.o

But generate the executable from `caller.c`, linking with it:

    $ gcc tasks/call_from_c/caller.c bin/reg2.o -o reg2

And execute:

    $ bin/reg2
    DEC: 65543
    HEX: 10007
    BIN: 0000000000000000000000000000000000000000000000010000000000000111

Notice that copying `7` (the `111` in the end of the binary number)
to **AX** did not clear the upper half of **EAX** (notice that `1` in the
17th bit). However, this is behaviour does not hold for `mov` into
32-bit registers. If we compile and run `reg3.asm` (in the same way), we get:

    $ bin/reg3
    DEC: 3
    HEX: 3
    BIN: 0000000000000000000000000000000000000000000000000000000000000011

I am yet to check what happens to the 16-bit registers when we do a `mov` 
into its 8-bit sub-registers.
