First we make a program similar to the `hello.asm` but now we can
understand better what is happening, in `print_data.asm`.


## Introducing Data Types

Then we show some of the data types in `types.asm`. The types define basically
the size of the data they contain. They are: `byte` (8 bits or 1 byte),
`word` (16 bits or 2 bytes), double word or `dword` (32 bits or 4 bytes) and
quad word or `qword` (64 bits or 8 bytes). To define data using these types,
we use the keywords `db`, `dw`, `dd` and `dq`, respectively.


## Addressing Modes

An address in memory can be referred to using the following components:

    [base_register + index_register * scale_factor + displacement]

For example:

    mov rax, [rbx + rdx * 4 + my_var + 12]

Here, **RBX** is the base register, **RDX** is the index register,
`4` is the scale factor (can be only 1, 2, 4, 8 or 16), and `my_var + 12`
is the displacement. The displacement is just a number, and in this case
`nasm` will calculate for us the sum of `my_var` and `12` and put the result 
in the instruction.

In `ret4bytes.asm`, we see how to use some displacement in 
addressing to access different parts of the `.data` section. If we 
use `[my_data]` to access what is in the beginning of address given 
by `my_data`, we can use `[my_data + X]` to access what is `X` bytes 
after that initial position, where `X` is a number literal.

Then in `ret_words.asm` we use a combination of base register, index register
and scale factor to access data.


## RIP-Relative Addressing and Position-Independent Code (PIC)

We use in most cases the keyword `rel` before referring to a data address,
to avoid linking problems as explained [here](theory.md).


## Reserving Space for Uninitialized Data

The `.data` section is where we store "global variables" and "constants"
that are known beforehand. There is also a section called `.bss` where we
can just "declare" that we need some space for later use in the program.
This is done via the *nasm* directives (so, not real instructions): `resb`
(reserve byte, for data in bytes), `resw` (for data in words, or 2 bytes each),
`resd` (4 bytes) and `resq` (8 bytes). For example, if we want to reserve
space for an array of 32-bit integers with 10 elements, we do:

    .bss
    my_array: resd 10

There is also a section for *read-only* data called `.rodata`, where you 
cannot write. It is a good place to store constants.
