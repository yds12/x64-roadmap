; This is the first program of the registers task. Our job is just to
; use some registers to move data around, and exit.

global _start

section .text

_start:  ; everything until here should be familiar to you now...

  mov rdx, 10   ; move 10 into rdx
  mov rax, rdx  ; move what is in rdx (10) into rax
  mov rbx, rax  ; move the content of rax into rbx
  mov rdi, rbx  ; move the content of rbx into rdi.
                ; rdi happens to be the register that will hold the
                ; exit code of our application.

  ; Exit system call. The exit code will be the value of rdi.
  mov rax, 60
  syscall
