At this point you should be able to build and run ours programs easily
using, in the cases where we want to see the returned value (which is most
cases), the `caller_c` script:

    $ caller_c arithmetic add
    DEC: 15
    HEX: f
    BIN: 0000000000000000000000000000000000000000000000000000000000001111

Here in `add.asm` we made an addition, now in `sub.asm` we do a subtraction:

    $ caller_c arithmetic sub
    DEC: 5
    HEX: 5
    BIN: 0000000000000000000000000000000000000000000000000000000000000101

And one that gives a negative result (`sub_neg.asm`):

    $ caller_c arithmetic sub_neg
    DEC: 18446744073709551615
    HEX: ffffffffffffffff
    BIN: 1111111111111111111111111111111111111111111111111111111111111111

The result of `sub_neg.asm` is `-1`, which, as we saw 
[before](../call_from_c/ret_neg), is represented as a bunch of ones.

To run the increment (`inc.asm`), decrement (`dec.asm`), multiplication
(`mul.asm`) and signed multiplication (`imul.asm`) programs, the 
instructions are similar. Division is a bit more complicated so we will only
see it later.
