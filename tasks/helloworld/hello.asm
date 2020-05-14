; This is a hello world program in assembly.

global _start       ; this makes _start known externally

section .text       ; section of our program that holds instructions

_start:             ; the starting point of our program
  mov rax, 1        ; puts 1 into register rax
  mov rdi, 1        ; puts 1 into register rdi
  mov rsi, helloMsg ; puts the address pointed by helloMsg into rsi
  mov rdx, 13       ; 13 is the size of our message in bytes, put this into rdx

  syscall           ; Execute the system call. Remember that the type of
                    ; system call is determined by rax, in this case it has
                    ; a 1, which means a syscall for write. The content of
                    ; rdi is the file descriptor, in this case 1 means stdout,
                    ; the standard output. The system call takes the address
                    ; in rsi as the beginning of the text to write, and
                    ; the value in rdx as the number of bytes to be written.
                    ; The four mov instructions were just setting the
                    ; "parameters" for the system call.

  mov rax, 60       ; We are going to do another system call: 60 for exit
  xor rdi, rdi      ; This is a faster way (in terms of performance) 
                    ; of zeroing rdi: to make a XOR with itself. The zero will
                    ; be the exit code.
  syscall           ; Perform the system call.

section .data       ; This is the section used to reserve memory for our
                    ; program.
  helloMsg: db "Hello, world", 10     ; helloMsg will be replaced by a memory
                                      ; address, and when we use it we will
                                      ; be referring to this address.
                    ; db is a 8-bit (or byte) "type".
                    ; Then we write our string between double quotation marks,
                    ; each character taking up 1 byte, and we put the byte
                    ; 10 in the end. 10 is the newline character. Note that
                    ; we could have written this whole string as a sequence of
                    ; comma-separated numbers, each number representing the
                    ; ASCII code of the character.
