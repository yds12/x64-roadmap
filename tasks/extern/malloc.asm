; This program will call functions from the C library (glibc), in this case
; malloc and exit.
; Build with:
;
;     $ nasm -felf64 tasks/extern/malloc.asm -o bin/malloc.o
;     $ ld bin/malloc.o -lc -I /lib64/ld-linux-x86-64.so.2 -o bin/malloc
;
; The -lc option tells ld to link with the C library, and the -I option is
; telling ld to use /lib64/ld-linux-x86-64.so.2 as the dynamic linker.
;

extern exit                  ; We declare these functions as extern to
extern malloc                ; let nasm know that they are somewhere else.
                             ; The linker will do the job of finding them.

section .data
  ; 10 is "\n" and 0 is the C-string terminator
  msg: db "Hello from x-%d asm!", 10, 0   

section .text
global _start

_start:
  mov rdi, 8                 ; The first argument in the x64 calling 
                             ; conventions is RDI. We will call malloc with
                             ; argument 8 (to allocate 8 bytes).

  call malloc                ; calls malloc from the C library

  mov [rax], dword 1         ; malloc returns the address of the allocated
                             ; memory in RAX. We store a int32 in the first
                             ; position

  mov [rax + 4], dword 2     ; and another int32 at the second position

  mov edx, dword [rax]       ; now we put the first value in EDX
  add edx, dword [rax + 4]   ; and sum with the second

  mov rdi, rdx               ; call C library's exit with EDX's value as
  call exit                  ; exit code

