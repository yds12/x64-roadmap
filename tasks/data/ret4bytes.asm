; In this program we use addressing from a memory location plus a displacement
; to get specific portions of data from the .data section.
global asm_func

section .data
  a_byte db 0x0f, 0x0e, 0x0d, 0x0c

section .text
asm_func:
  mov rax, -1
  mov al, [rel a_byte]      ; retrieves the data from a_byte (1 byte of it,
                            ; since the destination operand (AL) is a 8-bit
                            ; register).
  shl rax, 8
  mov al, [rel a_byte + 1]  ; now we do the same but from address a_byte
                            ; plus 1 byte. That gives us the second element
                            ; following a_byte (0x0e), since we used
                            ; db to declare the data, which means that each
                            ; item has 1 byte.
  shl rax, 8
  mov al, [rel a_byte + 2]  ; now we get the third element (0x0d)
  shl rax, 8
  mov al, [rel a_byte + 3]  ; and the 4th.
  ret
