; In this program we will explore the different "data types" in assembly,
; which are more like "data sizes".

; The section .data will be loaded in memory together with our program,
; statically. This is a place where we can create constants that will be
; available during the program execution. They are not like constants
; defined via assembler directives such as:
;
;    my_constant equ 10
;
; Those are just preprocessed before the assembling of our program. The data
; in the .data section will be in the executable binary (you can check with
; objdump).

; We will use 4 types: byte (defined with db = define byte), word
; (defined with dw), double word or dword (dd) and quad word or qword (dq).
; They can hold 8, 16, 32 and 64 bits, respectively.

section .data
  a_byte: db 1       ; a byte called a_byte with content = 1
  a_word: dw 700     ; a word called a_word with content = 700
  a_dword: dd 80000
  a_qword: dq 9_000_000_000  ; we can use underscores to improve readability

section .text
global asm_func
asm_func:
  xor rax, rax

  mov al, [rel a_byte]  ; Here we load a_byte into the 8-bit lower portion
                        ; of RAX (AL). The square brackets are used to
                        ; get what is in the address pointed to by a_byte.
                        ; The rel keyword makes the address relative instead of
                        ; absolute. We will see more on this later.
  xor rdx, rdx
  mov dx, [rel a_word]
  add rax, rdx
  xor rcx, rcx
  mov ecx, [rel a_dword]
  add rax, rcx
  mov rdx, [rel a_qword]
  add rax, rdx
  ret
