; A program that writes data in the bss section.
; Run with:
;
;    $ ./run data bss
;

section .bss
  big_space: resb 80         ; reserve 80 bytes

section .text

global _start

_start:
  lea rbx, [rel big_space]   ; keeps the initial memory position at RBX
                             ; the LEA instruction (load effective address)
                             ; is a handy way of calculating an address and
                             ; load it into a register. If we replace LEA
                             ; by MOV here, what will be put in RBX is the
                             ; value contained in big_space (in this case,
                             ; nothing, result: segmentation fault).
  mov [rbx], byte 'H'
  mov [rbx + 1], byte 'e'
  mov [rbx + 2], byte 'l'
  mov [rbx + 3], byte 'l'
  mov [rbx + 4], byte 'o'
  mov [rbx + 5], byte 10     ; newline


; Now we make a syscall to write the buffer we have set:

  mov rax, 1                 ; syscall write
  mov rdi, 1                 ; file descriptor: stdout
  mov rsi, rbx               ; address of buffer to RSI
  mov rdx, 6                 ; number of bytes to write
  syscall


; But our buffer has 80 bytes of space, so we try writing something more

  mov [rbx + 50], byte 'W'   ; not the most beautiful code...
  mov [rbx + 51], byte 'r'
  mov [rbx + 52], byte 'i'
  mov [rbx + 53], byte 't'
  mov [rbx + 54], byte 'e'
  mov [rbx + 55], byte ' '
  mov [rbx + 56], byte 'b'
  mov [rbx + 57], byte 'u'
  mov [rbx + 58], byte 'f'
  mov [rbx + 59], byte 'f'
  mov [rbx + 60], byte 'e'
  mov [rbx + 61], byte 'r'
  mov [rbx + 62], byte 10
  mov rax, 1                 ; and write it again
  mov rdi, 1
  lea rsi, [rbx + 50]
  mov rdx, 13
  syscall


; Exits

  mov rax, 60                ; syscall exit
  xor rdi, rdi               ; exit code 0
  syscall
