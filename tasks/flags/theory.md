So far our programs have been quite boring. There is few interesting
things to be done with unconditional jumps. To start doing some control flow,
we need to learn about *flags*.


## Flags

The register **RFlags** that we have seen [earlier](../registers/theory.md)
is used to store boolean flags. Each of its bits represent a certain flag.
Most arithmetic and logical instructions executed by the CPU alter those 
flags. Some important flags are:

* Carry flag (CF), bit 0

* Parity flag (PF), bit 2

* Zero flag (ZF), bit 6

* Sign flag (SF), bit 7

* Direction flag (DF), bit 10

* Overflow flag (OF), bit 11


## Comparisons and Conditional Jumps

If we use the cmp instruction, for example, like below:

    cmp rax, rdx

A subtraction of **RAX** - **RDX** is executed. If the result is zero, the
`zero flag` ZF is set to `1`, otherwise to `0`. If the result is negative,
the `sign flag` SF is set to `1`, otherwise to `0`. The instruction `sub`
(for subtraction) does this as well, but the main difference is that
`cmp` does not alter the operands (**RAX** and **RDX** in our example).

Based on these flags, we can issue a conditional jump instruction. For example:

    cmp rax, 10
    je location_to_jump

The opcode `je` means "jumps if equal".
This code will jump to `location_to_jump` if **RAX** has value 10.
What `je` actually does is to check the ZF flag, and jump if ZF is `1`.
Some other conditional jumps are: `jne` (not equal), `jg` (greater), `jge`
(greater or equal), `jl` (less), `jle` (less or equal).

But there are many more flag-dependent suffixes that can be used for 
conditional jumps and other conditional instructions.
Some more information on this can be found 
[here](https://en.wikibooks.org/wiki/X86_Assembly/Control_Flow).
