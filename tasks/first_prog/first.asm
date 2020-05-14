; Comments in assembly are started by semicolons.

global _start       ; this makes it possible for the label _start
                    ; to be found outside our executable. This allows the
                    ; operating system to call it.

section .text       ; this section is where the code lives

_start:             ; this is the entry point of our program. It will be
                    ; translated into a memory address.
  mov rax, 60       ; here we move 60 into register rax
  mov rdi, 0        ; here we move 0 into register rdi
  syscall           ; here we make a system call: the OS will take control.
                    ; the type of system call is determined by the content of
                    ; the register rax, in this case 60, which means exit.
                    ; So our program will exit here. The exit code is
                    ; determined by the content of rdi, in this case 0,
                    ; which means our program terminated with success.
