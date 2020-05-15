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

* ✓ Call assembly functions from C ([`call_from_c`](tasks/call_from_c/run.md))

  * ✓ Write an assembly program with a callable function that returns a
  64-bit integer ([`ret_int64.asm`](tasks/call_from_c/ret_int64.asm))

  * ✓ Write a small C program that calls this assembly function and displays
  the result in decimal, hexadecimal and binary formats 
  ([`caller.c`](tasks/call_from_c/caller.c))

  * ✓ Write a program with a function that returns a negative number
  ([`ret_neg.asm`](tasks/call_from_c/ret_neg.asm))

* Registers ([`registers`](tasks/registers))

  * ✓ Register names and sizes ([theory](tasks/registers/theory.md))

  * The `mov` instruction.

  * ✓ Write a program that moves values between registers of different sizes
  ([run](tasks/registers/run.md))

* ✓ Look into machine code 
  ([`inspect_binary/howto.md`](tasks/inspect_binary/howto.md))

  * ✓ Check out the machine code of a program with `hexdump`

  * ✓ Disassemble a program with `objdump`

* ✓ Basic Arithmetic ([`arithmetic`](tasks/arithmetic))

  * ✓ Make a program that sums two numbers 
  ([`add.asm`](tasks/arithmetic/add.asm))

  * ✓ Make a program that subtracts two numbers
  ([`sub.asm`](tasks/arithmetic/sub.asm))
  
  * ✓ Make a program that uses increment
  ([`inc.asm`](tasks/arithmetic/inc.asm))

  * ✓ Make a program that uses decrement
  ([`dec.asm`](tasks/arithmetic/dec.asm))

  * ✓ Make a program that uses unsigned integer multiplication
  ([`mul.asm`](tasks/arithmetic/mul.asm))
  
  * ✓ Make a program that uses signed integer multiplication
  ([`imul.asm`](tasks/arithmetic/imul.asm))

* ✓ Labels and Unconditional Jumps

  * ✓ Write a program with a `jmp` instruction
  ([`jump.asm`](tasks/jump/jump.asm) and [`labels.asm`](tasks/jump/labels.asm))

* ✓ Flags, Comparisons and Conditional Jumps ([theory](tasks/flags/theory.md))

  * ✓ Write a program with a conditional jump 
  ([`cond_jump.asm`](tasks/flags/cond_jump.asm))

  * ✓ Write a program with a loop ([`loop.asm`](tasks/flags/loop.asm))

  * ✓ Write a program using the overflow flag
  ([`overflow.asm`](tasks/flags/overflow.asm))

* Logical Operations

  * ✓ Use AND and OR ([`and_or.asm`](tasks/logical/and_or.asm))
  
  * ✓ Use NOT and XOR ([`not_xor.asm`](tasks/logical/not_xor.asm))

* Bit Operations

  * Shift and Rotate operations

* Arithmetic 2

  * Multiplication

  * Division

* The Stack

* Data Types

* Memory Addressing and Pointers

* The `call` Instruction 

* Calling External Functions

* Interacting with C

* Vectors

* Manipulating Strings
