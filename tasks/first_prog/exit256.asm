; Similar to first, but tries to exit with a larger exit code.

global _start

section .text

_start:
  mov rax, 60
  mov rdi, 256   ; Here we try to exit with 256. Try also -1 and 255.
  syscall
