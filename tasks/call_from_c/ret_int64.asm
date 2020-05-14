; This program will be like a "library". It won't be a standalone executable,
; but will instead contain a function that can be called from other programs.

global asm_func         ; first we declare that my_func will be accessible
                        ; from outside: other programs will be able to call it.

section .text

asm_func:
  mov rax, 10000000000  ; 10 billion (doesn't fit in a 32-bit int)
  ret                   ; returns control to the caller (more on this later...)
