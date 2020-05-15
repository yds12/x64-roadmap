; This program makes a subtraction and returns.
; As you will see, it is identical to add.asm except for one instruction.

global asm_func

section .text

asm_func:
  mov rcx, 10
  mov rdx, 5
  sub rcx, rdx      ; subtracts the value in RDX from RCX, and puts 
                    ; the result in RCX.
  mov rax, rcx      ; copy the result to RAX so we can see it as the program
                    ; return value
  ret
