This is a roadmap for learning x86 assembly, using
[nasm](https://www.nasm.us/) on Linux. I will try to list the topics as I
learn, sorting them from the most basic to most advanced, adding a series of
small tasks for each topic.

As I complete each task/topic, a check mark (✓) will be added to the item
and a pointer to the solution will be provided. All solutions are inside
the `tasks` directory. Then each major topic (for example: *Install the
necessary tools*) in the list will refer to a directory inside `tasks` 
where its solutions are (in this case, `tasks/installation`), and then each 
task of the topic (for example, *install nasm*) will refer to the main file 
containing the solution (`tasks/installation/nasm.md`).

# Roadmap

## The Basics

* ✓ Install the necessary tools ([`installation/`](installation))

  * ✓ Install `ld` (most Linux distros already come with have this installed)

  * ✓ Install `nasm` ([`nasm.md`](installation/nasm.md))

* ✓ First program (`first_prog/`)

  * ✓ Write, assemble and run a program that "does nothing", and check 
  the return value (`build.md`)

* Make a "hello world" program

* Registers

  * Register names and sizes.

  * The `mov` instruction.

  * Write a program that moves values between registers of different sizes.

* Unconditional Jump

* Flags and comparisons

* Conditional Jump

* The Stack

* Addresses and Pointers
