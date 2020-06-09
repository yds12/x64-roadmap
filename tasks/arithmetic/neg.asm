; This program uses the neg instruction to obtain the negative of a number.
;

global asm_func

section .text
asm_func:
  mov rax, 42
  neg rax
  ret
