; Makes some logical operations, using XOR and NOT, but also some jumps
; and comparisons.

global asm_func

section .text

asm_func:
  mov al, 01010101b  ; again we set the lowest byte of RAX (AL) 
                     ; using a binary literal
  mov dl, 10101010b  ; same for RDX
  xor al, dl         ; now we do a XOR of both, results go into the 1st operand
  cmp al, 11111111b  ; now we compare the result with that all-1 literal
  je equal           ; if it is equal, we jump

not_equal:           ; if it is not equal, return with 1
  mov rax, 1
  ret

equal:               ; it is equal, so we fall here...
  mov rax, 7
  mov rdx, 111b
  xor rax, rdx       ; RAX = XOR(RAX, RDX)
  not rax            ; RAX = NOT(RAX), this inverts all bits of RAX.
  inc rax            ; increment by one

  jz overflowed      ; Here we use the zero flag in combination with jump:
                     ; jump if the increment resulted in 0.
                     ; I tried to use the overflow flag (OF) here, with
                     ; jo (jump if overflow) but it didn't work somehow.

didnt_overflow:      ; if didn't overflow, return 2
  mov rax, 2
  ret

overflowed:          ; but if it did, return 0xf00d
  mov rax, 0xf00d
  ret
