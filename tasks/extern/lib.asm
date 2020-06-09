; A library that will generate an object file to be linked with another asm
; object. The other program can call the functions here to print and to exit.
;

global say_hello             ; expose the functions to the "external world"
global exit                  ; so the linker can find them

section .data
  hello: db "Hello", 10
  LEN equ $-hello

section .text
say_hello:
  mov rax, 1                 ; syscall write
  mov rdi, 1                 ; filedescriptor: stdout
  lea rsi, [rel hello]       ; address of the hello string
  mov rdx, LEN               ; how many bytes to write
  syscall

exit:
  mov rax, 60                ; syscall exit
  xor rdi, rdi               ; exit code = 0
  syscall
