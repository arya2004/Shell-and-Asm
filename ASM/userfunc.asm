    section     .data

msg1 db "Entor no: ";;, 0Ah
msg1_len equ $-msg1
num dq 00h
num_len equ $-num
num1 dq 2Ah
num1_len equ $-num1

%macro print 2
    mov rax, 1
    mov rdi, 1 
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro


            global      _start
            section     .text
_start: 

            print msg1, msg1_len
            mov bl, [num1]
            shr bl, 04h
            cmp bl, 09h
            jbe l1
                add bl, 07h
            l1: add bl, 30h
            mov [num], bl

           
            mov rax, 1
            mov rdi, 1
            mov rsi, num ;;pass num addredd
            mov rdx, num_len
            syscall

            mov rbx, [num1]
            and rbx, 0fh ;;even tho rbx is 64bit
            cmp bl, 09h
            jbe l2
                add bl, 07h
            l2: add bl, 30h
            mov [num], bl

            
            mov rax, 1
            mov rdi, 1
            mov rsi, num ;;pass num addredd
            mov rdx, num_len
            syscall
            

            mov      rax, 60 ;; termination fuction. all three lines
            mov      rdi, 0  ;;
            syscall