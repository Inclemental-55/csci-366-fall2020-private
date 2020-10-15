        global    find_max
        section   .text
find_max:
        ;; rdi has the array in it
        ;; rsi has the length in it
        mov rax, [rdi]
loop:
        cmp rax,[rdi]
        cmovl rax,[rdi]
        dec rsi
        add rdi,8
        cmp rsi,0
        jg loop
        ret

        ;;MOV - move
        ;;AND/OR/XOR/NOT - bitwise operations
        ;;ADD/SUB/MUL/DIV - math
        ;;CMP - compare
        ;;JMP - unconditional jump
        ;;JE/JNE/etc - conditional jumps
        ;;CALL/RET - call/return
        ;; PUSH/POP - stack manipulation purpose but some instructions will mutate


        ;;rdx,rsi,rdi - general purpose
        ;;r8 - 15 - general purpose
        ;;rax - return value register
        ;;rsp - stack pointer register
        ;;rbp - base pointer register
        ;;rcx - general