; Uses shift and rotate operations

global asm_func

section .text

asm_func:
  mov rax, 3
  shl rax, 2   ; The shift left (SHL) instruction shift the bits of the
               ; destination (RAX) to the left by the amount specified by the
               ; source (the second operand).
               ; This works effectively as a multiplication by 2^N, where
               ; N is the second operand.
  cmp rax, 12  ; we check and jump if the result is correct
  je loc1
  mov rax, 0xbaaaad
  ret

loc1:
  mov cl, 3
  mov rax, 25
  shr rax, cl  ; The amount to shift can also be specified by register CL
               ; (and only CL). Here we do a shift right (SHR). We have not
               ; seen division yet, but this works as a division by powers of
               ; 2. (The remainder is lost, but I think you can check the
               ; carry flag for it.)
  cmp rax, 3   ; again we jump if the result is correct (25 / 2^3 = 3)
  je loc2
  mov rax, 0xbaaad
  ret

loc2:
  mov rax, -24
  sar rax, 1   ; for negative numbers, if we want the shift left to preserve
               ; the sign, we must use shift arithmetic right (SAR).
  cmp rax, -12
  je loc3
  mov rax, 0xbaad
  ret

loc3:
  mov rax, 1   ; set RAX to 1
  shl rax, 63  ; shift the 1 bit to the leftmost position
  rol rax, 4   ; Here we use the rotate left (ROL) instruction.
               ; This instruction is similar to SHL but
               ; the bits coming out of the left end go back into the
               ; first (rightmost) bit. So this should change RAX from
               ; 100...000 to 000....001000.
  cmp rax, 8
  je loc4
  mov rax, 0xbad
  ret

loc4:
  mov al, 1    ; now we set AL to 1
  ror al, 1    ; and try to rotate right (ROR). Will the 1 bit rotate to the
               ; leftmost position of RAX or of AL?
  ret
