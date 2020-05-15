; This program will be like a "library". It won't be a standalone executable,
; but will instead contain a function that can be called from other programs.

global asm_func         ; first we declare that my_func will be accessible
                        ; from outside: other programs will be able to call it.

section .text

asm_func:
  mov rax, -1           ; Let's see what happens when we return a 
                        ; negative number. Recall that we defined in the C
                        ; caller that the function will return an unsigned int.
  ret         
