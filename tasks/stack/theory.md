## The Stack

Every process, as we saw [earlier](../data/theory.md), has an area of memory
called *the stack*. It grows towards lower addresses, as can be seen in that
picture.

The stack is controlled by one register called *the stack pointer*, or
**RSP**. If we try to do the following:

    mov rax, [rsp]

the top element of the stack is copied to **RAX**, assuming that there is 
a 64-bit element on the top of the stack. If we know the sizes of other
elements that come previously on the stack, we can access them by using
offsets (in bytes). For example, assuming again that there is a 64-bit
element on top, and a 16-bit element before it, we could access this second
element by:

    mov ax, [rsp + 8]

We passed the offset of 8, which is the size of the top element.
We can also allocate space on the stack (usually done for local variables)
by subtracting from **RSP**:

    sub rsp, 8
    mov [rsp], 50

Above, we allocated 8 bytes of space on the stack and put a value of `50`
there. See `sp.asm`.

Of course, the most common way of using the stack is by the `push` and `pop`
instructions (see `push_pop.asm`):

    push rax  ; pushes the value of RAX onto the stack
    pop rax   ; pops the value that is in the top of the stack off to RAX

Only 16-bit and 64-bit registers can be pushed and popped. The same hold for
immediates and values from memory, but of course you can use the size
keywords `word` and `qword` to "cast" these values into 16 and 64 bits,
respectively.
