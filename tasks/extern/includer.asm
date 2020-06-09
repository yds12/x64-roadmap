; A program that uses nasm include directive. Note that in this case we don't
; need to declare the functions as extern. Nasm will include the code of
; the other file here, as if they are just one file.
; Apparently it is also okay to have a .text section in both files.
;
; To build and run:
;
;    $ nasm -felf64 tasks/extern/includer.asm -o bin/includer.o
;    $ ld bin/includer.o -o bin/includer
;    $ bin/includer
;
; Note that you don't need to mention the other file to nasm, it is already
; dealt with during pre-processing of the include macro. A single object is
; created for both asm files.
;

; The path is relative to the working directory (where nasm is called, in this
; case we will call it from the project root directory).
%include "tasks/extern/include.asm"

global _start

section .text
_start:
  call say_hello
  call exit
