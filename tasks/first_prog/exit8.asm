; Similar to first, exits with another exit code.

global _start

section .text

_start:
  mov rax, 60
  mov rdi, 8   ; Here we exit with 8.
  syscall
