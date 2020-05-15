; This program makes an increment operation (adds 1).

global asm_func

section .text

asm_func:
  xor rax, rax   ; clears out RAX register (same as mov rax, 0)
  inc rax        ; increments RAX (same as add rax, 1)
  inc rax        ; again
  inc rax        ; and once more
  ret
