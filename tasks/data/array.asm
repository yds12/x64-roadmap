; This program creates an array in section bss, populating it with some
; values, and then sums all the values in the array.

LEN equ 10                   ; assembler directive, defines LEN as 10

section .bss                 ; section for uninitialized data
  an_array: resd LEN         ; defines an_array as 10 (=LEN) dwords

section .text

global asm_func

asm_func:
  lea rbx, [rel an_array]    ; loads the address of an_array into RBX
  xor rcx, rcx               ; RCX will be our counter
  xor rax, rax               ; RAX will be used to create values for an_array

; The loop below will populate all 10 elements of an_array with values
; from RAX

loop:
  mov al, cl
  shl al, 1                  ; AL = CL * 2

  mov dword [rbx + rcx * 4], eax    ; Here we copy data from EAX to the
                                    ; address of an_array[i], where i is
                                    ; given by RCX. We have to use the scale
                                    ; factor of 4 because an_array has
                                    ; 4-byte (dword) elements.

  inc cl                     ; increment counter
  cmp cl, LEN-1              ; checks if we reached the end of the array
  jnz loop                   ; if not, loop back


; In the following section we do another loop, this time to sum up all
; elements of an_array

  xor rax, rax               ; RAX will hold the sum
  xor rcx, rcx               ; counter
sum:
  add eax, dword [rbx + rcx * 4]    ; EAX += an_array[i], where RCX = i

  inc cl                     ; increment counter
  cmp cl, LEN-1              ; check end of array
  jnz sum
  ret
