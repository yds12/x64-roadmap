This is a roadmap for learning x86 assembly, using
[nasm](https://www.nasm.us/) on Linux. I will try to list the topics as I
learn, sorting them from the most basic to most advanced, adding a series of
small tasks and reference material for each topic.

As I complete each task/topic, a check mark (✓) will be added to the item
and a pointer to the solution will be provided. All solutions are inside
the `tasks` directory.

# Roadmap

## The Basics

* ✓ Install the necessary tools ([`installation/`](tasks/installation))

  * ✓ Install `nasm` ([`nasm.md`](tasks/installation/nasm.md))

  * ✓ Install `ld`, `gcc`, `hexdump`, `objdump` (most Linux distros 
  already come with this installed)

* ✓ First program: the `exit` system call ([`first_prog/`](tasks/first_prog))

  * ✓ Write, assemble and run a program that "does nothing", and check 
  the return value ([`build.md`](tasks/first_prog/build.md))

  * ✓ Try to exit with various exit codes 

* ✓ Make a "hello world" program ([`hello.asm`](tasks/helloworld/hello.asm))

* ✓ Call assembly functions from C ([`call_from_c`](tasks/call_from_c))

  * ✓ Write an assembly program with a callable function that returns a
  64-bit integer ([ret_int64.asm](tasks/call_from_c/ret_int64.asm))

  * ✓ Write a small C program that calls this assembly function and displays
  the result in decimal, hexadecimal and binary formats 
  ([`caller.c`](tasks/call_from_c/caller.c))

* Make our lives easier: make some bash files that

  * Passing the name of the `.asm` file, assembles and links into an executable

  * Passing the name of the `.asm` file, assembles and creates an
  executable from `caller.c` linked with our assembly program

* Registers ([`registers`](tasks/registers))

  * ✓ Register names and sizes ([theory](tasks/registers/theory.md))

  * The `mov` instruction.

  * ✓ Write a program that moves values between registers of different sizes
  ([run](tasks/registers/run.md))

* ✓ Look into machine code 
  ([`inspect_binary/howto.md`](tasks/inspect_binary/howto.md))

  * ✓ Check out the machine code of a program with `hexdump`

  * ✓ Disassemble a program with `objdump`

* Unconditional Jump

* Flags and comparisons

* Conditional Jump

* The Stack

* Addresses and Pointers

* The `call` Instruction 

* Calling External Functions

* Interacting with C
