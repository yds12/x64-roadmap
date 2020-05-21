## The `call` Instruction

The `call` instruction, behind the scenes, puts the address of **RIP** (the
instruction pointer) onto the stack, then jumps to the specified label.
When we use `ret`, the process is the opposite: the address of the caller is
popped from the stack, then the program jumps to it.

When we want to call functions from other programs, there are some
[calling conventions](https://en.wikipedia.org/wiki/X86_calling_conventions#System_V_AMD64_ABI),
which specify things like:

* where should we put the parameters (in order): registers, stack, etc.

* which registers the called function should preserve for the caller

* which registers the caller should save before calling

* to which number of bytes the stack should be aligned before the call

* etc.

For now, what is important to know is that in Linux x64 the parameters are 
passed via registers, in this order: RDI, RSI, RDX, RCX, R8, R9.
