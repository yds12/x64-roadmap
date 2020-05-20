; In this program we use a base register and an index register times a
; scale factor for addressing memory.

section .data
  a_byte: dw 0x0f, 0x0e, 0x0d, 0x0c

section .text
global asm_func
asm_func:
  lea rbx, [rel a_byte]     ; The LEA instruction loads an address calculated
                            ; between the brackets into a register

  xor rax, rax              ; We clear RAX to use as return value.
  xor rdx, rdx              ; We clear RDX to use as index register in 
                            ; addressing operations.

  mov ax, [rbx + rdx * 2]   ; Here we use our base+index*scale addressing mode
                            ; the base register (RBX here) holds the initial
                            ; address of our data a_byte.
                            ; The index register (RDX here) holds the current
                            ; position we are reading (0 for now).
                            ; The scale factor (2) is the size of each chunk
                            ; of data. We declared the data as words, so
                            ; 2 bytes.

  inc rdx                   ; Now we increment our index (to go to the next
                            ; data item).

  shl rax, 16               ; And we shift the 16 bits of data to the left
                            ; so we can write again in AX.


; Now we just repeat the process for the next elements:

  mov ax, [rbx + rdx * 2]
  inc rdx
  shl rax, 16
  mov ax, [rbx + rdx * 2]
  inc rdx
  shl rax, 16
  mov ax, [rbx + rdx * 2]

  ret                       ; the return will be in RAX
