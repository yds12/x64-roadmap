First we make a program similar to the `hello.asm` but now we can
understand better what is happening, in `print_data.asm`.

Then we show some of the data types in `types.asm`. The types define basically
the size of the data they contain. They are: `byte` (8 bits or 1 byte),
`word` (16 bits or 2 bytes), double word or `dword` (32 bits or 4 bytes) and
quad word or `qword` (64 bits or 8 bytes). To define data using these types,
we use the keywords `db`, `dw`, `dd` and `dq`, respectively.

Next, in `ret4bytes.asm`, we see how to use some displacement in 
addressing to access different
parts of the `.data` section. If we use `[my_data]` to access what is in
the beginning of address given by `my_data`, we can use
`[my_data + X]` to access what is `X` bytes after that initial position, 
where `X` is a number literal.
