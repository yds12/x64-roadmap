; A simple demonstration of a conditional jump.

global asm_func

section .text

asm_func:
  mov rax, 10
  mov rdx, 5
  mov rbx, 7
  sub rax, rdx
  cmp rax, rbx         ; compares RAX and RBX

  jg rax_greater       ; jump if RAX is greater than RBX (i.e. don't jump)
  jng rax_not_greater  ; jump if RAX is not greater than RBX (indeed the case)


rax_greater:           ; not executed
  mov rax, 1
  ret                  ; return would be 1


rax_not_greater:       ; the jump falls here
  mov rax, 0           ; set RAX as 0
  cmp rax, 1           ; compares RAX with 1
  je not_executed      ; jump if equal (not the case)
  ret                  ; so we return, and the return value is 0 (in RAX)


not_executed:
  mov rax, 1000
  ret                  ; would return with 1000
