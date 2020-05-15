; This program makes an addition and returns.
; Remember to call it using the caller.c program (or the caller_c script).

global asm_func

section .text

asm_func:
  mov rcx, 10
  mov rdx, 5
  add rcx, rdx      ; adds RDX to RCX, and puts the result in RCX.
  mov rax, rcx      ; copy the result to RAX so we can see it as the program
                    ; return value
  ret
