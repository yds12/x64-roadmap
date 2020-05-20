; When this program is executed like this, we get the following error:
;
;   /usr/bin/ld: bin/problem.o: relocation R_X86_64_32S against `.data' can 
;   not be used when making a PIE object; recompile with -fPIC
;   /usr/bin/ld: final link failed: Nonrepresentable section on output
;   collect2: error: ld returned 1 exit status

section .data
  a_byte: db 1

section .text
global asm_func
asm_func:
  xor rax, rax
  mov al, [a_byte]  ; write [rel a_byte] instead of [a_byte] and it works!
  ret
