; A program that manipulates a global "variable" declared in the BSS section.
; Run with:
;
;    $ ./run data var_bss
;

section .bss
  global_var: resd 1         ; a 32-bit variable

section .text
global _start

_start:
  mov [rel global_var], dword 10   ; puts 10 into the variable

  mov eax, [rel global_var]  ; loads the variable in EAX

  mov edi, 5
  add edi, eax               ; EDI (RDI) now has 5 + 10

  mov dword [rel global_var], 20    ; we can also specify the size in
                                    ; the destination operand

  mov eax, dword [rel global_var]   ; we can specify the size here, but it
                                    ; is not necessary
  add edi, eax

mov rax, 60                  ; exits, exit code in RDI
syscall
