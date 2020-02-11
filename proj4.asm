%include "simple_io.inc"

global asm_main

SECTION .data
error1: db "incorrect number of command line arguments", 10, 0
error2: db "incorrect length of the argument", 10, 0
error3: db "incorrect first letter of the argument (should be 3 or 5 or 9)", 10, 0
error4: db "incorrect second letter of the argument (should be a lower case letter)", 10 ,0

SECTION .bss


SECTION .text


display_shape:
        enter 0,0
        saveregs

        mov rax, [rbp + 24]
        call print_int

        mov al, [rbp + 32]
        call print_char
        call print_nl


        ;convert to size / 2
        mov edx, dword 0
        mov eax, r12d ;the location of the number
        mov ebx, dword 2
        div ebx ; reult in eax

        mov rbx, qword 0
        LOOP1: ;goes for the first half
                cmp rbx, qword [eax]    ;repeats the number of times given
                ja LOOP1_END
                mov r15, qword 0 ;set number of spaces to r15
                sub r15, qword [rbx]

                mov r10, qword [eax];set number of characters needed to r10
                sub r10, qword [rbx]
                inc rbx

                ;jmp display_line
                jmp LOOP1

        mov rbx, qword 0
        LOOP1_END: ;goes for the 2nd half
                cmp rbx, qword [eax]
                ja asm_main_end

                mov r15, qword[eax] ;set number of spaces
                sub r15, qword[rbx]
                ;set number of characters needed
                mov r10, qword[eax]
                sub r10, qword[rbx]

                inc rbx


                ;jmp display_line
                jmp LOOP1_END



display_line:
                mov r14, qword 0
                LOOP_SPACE:;prints '  '
                        cmp r14, r15;compares to number of spaces
                        jae LOOP_CHAR
                        mov al, ' '
                        call print_char
                        inc r14
                        jmp LOOP_SPACE

                mov r14, qword 0
                LOOP_CHAR:;2nd loop to print characters
                        cmp r14, r10 ;compares to number of characters
                        jae LOOP1
                        mov al, [rbp+32]
                        call print_char
                        inc r14
                        jmp LOOP_CHAR





asm_main:
        enter 0,0
        saveregs

        ;checks command line args n stuff
        ;argc should be 2
        cmp rdi, qword 2
        jne error_msg1
        ;argv[1]'s first charcter should be 1 digit
        mov rbx, qword [rsi + 8]
        mov r12, qword 0
        mov r12b, byte [rbx]


        try3:
                cmp r12b, '3';3
                jne try5
                jmp try_second_letter
        try5:
                cmp r12b, '5';5
                jne try7
                jmp try_second_letter
        try7:
                cmp r12b, '7'; 7
                jne try9
                jmp try_second_letter
        try9:
                cmp r12b, '9'; 9
                jne error_msg3
                jmp try_second_letter

        try_second_letter:

                mov r13b, byte[rbx + 1] ;second byte of argv[1]
                cmp r13b, 'z'
                ja error_msg4
                cmp r13b, 'a'
                jb error_msg4
        ;second digit of argv[1] should be a character that is lowercase
        ;then display_shape is called

        sub r12b, '0';turn it into a number
        push r13
        push r12 ;r12  is the number
        sub rsp, 8

        call display_shape
        add rsp, 24
        jmp asm_main_end

error_msg1:
        mov rax, error1
        call print_string
        call print_nl
        jmp asm_main_end

error_msg2:
        mov rax, error2
        call print_string
        call print_nl
        jmp asm_main_end

error_msg3:
        mov rax, error3
        call print_string
        call print_nl
        jmp asm_main_end

error_msg4:
        mov rax, error4
        call print_string
        call print_nl
        jmp asm_main_end


asm_main_end:
        restoregs
        leave
        ret
