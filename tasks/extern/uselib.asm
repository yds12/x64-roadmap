; This is a nasm program that is linked with another nasm program (a library).
; To build and execute, type:
;
;    $ nasm -felf64 tasks/extern/uselib.asm -o bin/uselib.asm
;    $ nasm -felf64 tasks/extern/lib.asm -o bin/lib.asm
;    $ ld bin/uselib.o bin/lib.o -o bin/uselib
;    $ bin/uselib
;

extern say_hello             ; External functions: they are in the library.
extern exit                  ; We need to declare functions that are in other
                             ; objects as extern, otherwise the assembler will
                             ; say there are undefined references to them.

section .text
global _start
_start:
  call say_hello             ; call the external functions
  call exit
