global asm_func

section .text

asm_func:
  mov rcx, 8
  mov rdx, 9
  sub rcx, rdx    ; the result of 8 - 9 goes into RCX
  mov rax, rcx    ; copy to RAX so we return the result
  ret
