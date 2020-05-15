; This program makes some decrements and returns.

global asm_func

section .text

asm_func:
  xor rax, rax  ; zeroes RAX
  inc rax       ; increments RAX 4 times
  inc rax
  inc rax
  inc rax
  dec rax       ; decrements RAX 2 times
  dec rax
  ret
