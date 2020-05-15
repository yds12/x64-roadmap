; Makes a simple unsigned multiplication

global asm_func

section .text

asm_func:
  mov rax, 13
  mov rdx, 3
  mul rdx      ; The mul instruction is for multiplication of unsigned
               ; integers. It assumes the first operand of the 
               ; multiplication is RAX. The result, which can be larger
               ; than 64-bit, comes in RDX:RAX, which is to say that
               ; the higher 64 bits come in RDX and the lower ones in RAX.
               ; For this small multiplication, we only need RAX.
               ; Our C caller also is expeting a 64-bit unsigned int, so if
               ; the result is actually using RDX, we won't be able to see
               ; anything there.
  ret
