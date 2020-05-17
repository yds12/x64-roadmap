; In this program we will do something similar to what we have done before
; with the "hello world" program, but now we are able to fully understand
; what is happening.
;
; This should be executed with the run script (i.e. we should make a
; standalone executable with ld, not a program called from C linked via gcc).


global _start

SYSCALL_WRITE equ 1  ; These are directives to the assembler. We are just
STDOUT equ 1         ; defining SYSCALL_WRITE = 1 and STDOUT = 1
                     ; This is done in pre-processing before the actual
                     ; assembling process.


section .data:
  some_bytes: db 'O', 10, 'K', 10
  LEN equ $ - some_bytes  ; Another NASM directive, here $ means the current
                          ; position. So LEN is the difference between the
                          ; current position and some_bytes, that is,
                          ; the size of the data starting in the label
                          ; some_bytes.


; Now that we have set up all the data we need, our program will just do
; a system call to write the data to STDOUT, passing the data and the
; length (in bytes) to write.

section .text:
_start:
  mov rax, SYSCALL_WRITE  ; type of syscall goes in RAX
  mov rdi, STDOUT         ; file descriptor goes in RDI
  mov rsi, some_bytes     ; content to write goes in RSI
  mov rdx, LEN            ; length goes in RDX
  syscall

  mov rax, 60             ; now we invoke the syscall for exit with code 0
  xor rdi, rdi
  syscall
