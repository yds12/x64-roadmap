global asm_func

section .text

asm_func:
  xor rax, rax
  mov al, 1011b  ; here we use a binary literal to better visualize the
                 ; bitwise AND operation that will be executed. We put it into
                 ; the lowest byte of RAX, which is AL.

  mov dl, 1101b  ; another binary literal, in the lowest byte of RDX.
  and al, dl     ; Execute the bitwise AND. Each bit of AL and DL will be
                 ; ANDed and the result will go in RAX (AL).
  mov dl, 1010b
  or al, dl      ; now we do an OR

  xor rdx, rdx   ; the result must be in RAX, so just to be sure we clear out
                 ; RDX.
  ret
