; This program uses the stack to push and pop some values and registers.

section .text

global asm_func

asm_func:
  mov ax, 0xffbb             ; we can push 16-bit values
  push ax
  mov rax, 10_000_000_000    ; 64-bit values (default)
  push rax
  push word 300              ; also immediates (literal values)

  pop ax                     ; and pop them back
  pop rax
  xor rax, rax               ; we clear RAX
  pop ax                     ; and its final value should be the first
                             ; popped element
  ret
