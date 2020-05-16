; Makes a simple signed multiplication

global asm_func

section .text

asm_func:
  mov rax, -18
  mov rdx, 7
  imul rdx       ; Similarly to mul.asm, we can make the multiplication with
                 ; just one explicit operand.
                 ; The multiplication is RAX times the
                 ; operand (here: RDX), and the result goes into RDX:RAX.

                 ; Our caller.c program only takes a 64-bit return, so it
                 ; would only read RAX, but that is enough in this case,
                 ; as RDX will only contain 1s.
                 ; If we uncomment the lines below:
                 ;
                 ; mov rax, rdx
                 ; ret
                 ;
                 ; we can check that RDX indeed just has 1s.
                 ; this happens because of how negative numbers are represented
                 ; in binary: by taking the "two's complement" of its
                 ; positive counterpart. To obtain the two's complement of
                 ; a binary number, just invert all its bits and sum 1 to the
                 ; final result.

  mov rcx, 0
  mov rcx, rax   ; stores the result in RCX

  mov rax, -1
  mov rdx, -2
  imul rax, rdx  ; Differently from mul, imul can take two operands explicitly.
                 ; In this format, however, the results go to the destination
                 ; operand (the first operand, here RAX) and is truncated:
                 ; the result should be a 128-bit integer, but only the lower
                 ; 64 bits will appear in RAX. RDX is not altered here at all.

  imul rax, 4    ; RAX = RAX x 4    
  imul rcx, rax  ; RCX = (-18 x 7) x ((-1 x -2) x 4)
  mov rax, rcx   ; move the result to RAX so we can return it.
  ret

  ret
