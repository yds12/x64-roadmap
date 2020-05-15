; Makes a simple signed multiplication

global asm_func

section .text

asm_func:
  mov rax, -18
  mov rdx, 7
  imul rdx     ; Similarly to mul.asm, the multiplication is RAX times the
               ; operand (here: RDX), and the result goes into RDX:RAX.
  ret
