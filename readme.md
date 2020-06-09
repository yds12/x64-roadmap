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
  ([`exit8.asm`](tasks/first_prog/exit8.asm) and
  [`exit256.asm`](tasks/first_prog/exit256.asm))

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

  * The `mov` instruction

  * ✓ Write a program that moves values between registers of different sizes
  ([run](tasks/registers/run.md))

  * The `xchg` instruction

* ✓ Look into machine code 
  ([`inspect_binary/howto.md`](tasks/inspect_binary/howto.md))

  * ✓ Check out the machine code of a program with `hexdump`

  * ✓ Disassemble a program with `objdump`

* ✓ Basic Arithmetic ([`arithmetic/run.md`](tasks/arithmetic/run.md))

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

* ✓ Labels and Unconditional Jumps ([`jump`](tasks/jump))

  * ✓ Write a program with a `jmp` instruction
  ([`jump.asm`](tasks/jump/jump.asm) and [`labels.asm`](tasks/jump/labels.asm))

* ✓ Flags, Comparisons and Conditional Jumps 
  ([`flags/theory.md`](tasks/flags/theory.md))

  * ✓ Write a program with a conditional jump 
  ([`cond_jump.asm`](tasks/flags/cond_jump.asm))

  * ✓ Write a program with a loop ([`loop.asm`](tasks/flags/loop.asm))

  * ✓ Write a program using the overflow flag
  ([`overflow.asm`](tasks/flags/overflow.asm))

  * ✓ Write a program contrasting the above and below comparisons with the
  greater than and less than comparisons
  ([`above_below.asm`](tasks/flags/above_below.asm))

* Logical and Bitwise Operations ([`logical`](tasks/logical))

  * ✓ Use AND and OR ([`and_or.asm`](tasks/logical/and_or.asm))
  
  * ✓ Use NOT and XOR ([`not_xor.asm`](tasks/logical/not_xor.asm))

  * ✓ Shift and Rotate operations ([`shift.asm`](tasks/logical/shift.asm))

* ✓ Data Types, Memory Addressing and the `.data` Section
  ([`data/run.md`](tasks/data/run.md))

  * ✓ How memory works in Linux?
  ([`theory.md`](tasks/data/theory.md))

  * ✓ Write a program that uses the `.data` section
  ([`print_data.asm`](tasks/data/print_data.asm))
 
  * ✓ Write a program that uses different data types
  ([`types.asm`](tasks/data/types.asm))

  * ✓ Write a program that uses addressing with displacement
  ([`ret4bytes.asm`](tasks/data/ret4bytes.asm))

  * ✓ Write a program using addressing with a base register,
  an index register and scale factor
  ([`ret_words.asm`](tasks/data/ret_words.asm))

  * ✓ Write a program using the `.bss` section
  ([`bss.asm`](tasks/data/bss.asm))

  * ✓ Write a program that uses a "global variable" from the `.bss` section
  ([`var_bss.asm`](tasks/data/var_bss.asm))

  * ✓ Write a program that increments a "global variable" from the 
  `.bss` section ([`inc_var.asm`](tasks/data/inc_var.asm))

  * ✓ Write a program that manipulates an array
  ([`array.asm`](tasks/data/array.asm))

* ✓ The Stack ([`stack/theory.md`](tasks/stack/theory.md))

  * ✓ Write a program that uses `push` and `pop`
  ([`push_pop.asm`](tasks/stack/push_pop.asm))

  * ✓ Write a program that uses the stack pointer to allocate space and
  access elements on the stack ([`sp.asm`](tasks/stack/sp.asm) and
  [`sp2.asm`](tasks/stack/sp2.asm))

* ✓ The `call` Instruction ([`call/theory.md`](tasks/call/theory.md))

  * ✓ Write a program that uses `call` ([`call.asm`](tasks/call/call.asm))

  * ✓ Write a program that `call`s a `print` function/subroutine
  ([`print_func.asm`](tasks/call/print_func.asm))

* Calling External Functions

  * ✓ Write a program divided in two files using `extern`/`global`
  ([`uselib.asm`](tasks/extern/uselib.asm) and
  [`lib.asm`](tasks/extern/uselib.asm))

  * ✓ Write a program divided into two `.asm` files using the `include` macro
  ([`includer.asm`](tasks/extern/includer.asm) and
  [`include.asm`](tasks/extern/include.asm))

  * Write a library with a function containing arguments, and call it from
  another `asm` file

  * Call a function from C

  * Write an assembly library function that takes arguments, and call it from C

  * Write an assembly program that calls a C function

  * ✓ Write an assembly program that calls a C library function
  ([`malloc.asm`](tasks/extern/malloc.asm))

* Using the Heap

  * Use C's `malloc` and `free` to allocate and free memory dynamically

* Special `mov` instructions

  * Sign and Zero Extend `mov` and "size casting" directive

  * Conditional `mov`

* Arithmetic 2

  * Division

* Manipulating Strings

* Floating point arithmetic

* NASM local labels

## Challenges

* Write a function that receives an integer and prints it

* Write a function that receives an integer and returns a string with it
