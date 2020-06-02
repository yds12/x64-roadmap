; This program uses a "variable" from the BSS section and tries to increment 
; it.

section .bss
  incvar: resd 1

section .text
global _start
_start:
  mov [rel incvar], dword 3  ; since we have a memory and an immediate operands
                             ; we have to tell nasm what is the size

  inc dword [rel incvar]     ; the same here, we don't have a register to
                             ; let nasm know the size of the operation

  mov edi, [rel incvar]      ; exits with the variable value
  mov eax, 60
  syscall
