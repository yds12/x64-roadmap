; A file to be included using nasm's include directive.
; Note that in this case we don't have to declare the functions as global.
;

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
