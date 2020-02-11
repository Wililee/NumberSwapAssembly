%include "simple_io.inc"

global asm_main
extern rperm

section .data

        array: dq 1,2,3,4,5,6,7,8
        prompt1: db "enter a,b to swap", 10,0
        prompt2: db "enter 0 to terminate: ",0
        prompt3: db "error 3",

        a1: db "First Input not 1 to 8",0,10
        a2: db "Bad input (a,b) ",0,10
        a3: db "Second Input not 1 to 8",0,10
        ; 10 Spaces

spaces: db "          ",0

        ; Dot msg's
Dot8: db "..+------+",0
Dot7: db "..+-----+.",0
Dot6: db "...+----+.",0
Dot5: db "...+---+..",0
Dot4: db "....+--+..",0
Dot3: db "....+-+...",0
Dot2: db ".....++...",0
Dot1: db ".....+....",0

; +      +  msg's
Plus8: db "  +      +",0
Plus7: db "  +     + ",0
Plus6: db "   +    + ",0
Plus5: db "   +   +  ",0
Plus4: db "    +  +  ",0
Plus3: db "    + +   ",0
Plus2: db "     ++   ",0
Plus1: db "     +    ",0

; +------+ msg's
Dash8: db "  +------+",0
Dash7: db "  +-----+ ",0
Dash6: db "   +----+ ",0
Dash5: db "   +---+  ",0
Dash4: db "    +--+  ",0
Dash3: db "    +-+   ",0
Dash2: db "     ++   ",0
Dash1: db "     +    ",0

;number w/ spaces
S8:    db "     8    ",0
S7:    db "     7    ",0
S6:    db "     6    ",0
S5:    db "     5    ",0
S4:    db "     4    ",0
S3:    db "     3    ",0
S2:    db "     2    ",0
S1:    db "     1    ",0


section .bss
        ;array: resq 8

section .text

display:
        enter 0,0
        saveregs

        mov rbx, qword 9 ;line by line

;creates 8 lines
create_line:
        call print_nl
        sub rbx, qword 1

        mov rcx, qword 0

        ;displays bottom line
        cmp rbx, qword 1
        je bottom_line

;displays other lines
;goes to add2line

add2line:

        cmp qword[array + rcx], qword 8
        je part8
        cmp qword[array + rcx], qword 7
        je part7
        cmp qword[array + rcx], qword 6
        je part6
        cmp qword[array + rcx], qword 5
        je part5
        cmp qword[array + rcx], qword 4
        je part4
        cmp qword[array + rcx], qword 3
        je part3
        cmp qword[array + rcx], qword 2
        je part2
        cmp qword[array + rcx], qword 1
        je part1
        jmp prompt

        part8:
                cmp rbx, qword 8
                je d_8
                mov rax, Plus8
                call print_string
                jmp add2line_end
                ;if not equal then draws the lines

                        d_8:
                                mov rax, Dash8
                                call print_string
                                jmp add2line_end

        part7:
                cmp rbx, qword 7
                je d_7 ;draws dashes if equal
                ;if above space
                cmp rbx, qword 7
                ja draw_spaces
                ;if below then pluses
                mov rax, Plus7
                call print_string
                jmp add2line_end
                        d_7:
                                mov rax, Dash7
                                call print_string
                jmp add2line_end

        part6:
                cmp rbx, qword 6
                je d_6 ;draws dashes if equal
                ;if above space
                cmp rbx, qword 6
                ja draw_spaces
                ;if below then pluses
                mov rax, Plus6
                call print_string
                jmp add2line_end
                        d_6:
                                mov rax, Dash6
                                call print_string
                jmp add2line_end

        part5:
                cmp rbx, qword 5
                je d_5 ;draws dashes if equal
                ;if above space
                cmp rbx, qword 5
                ja draw_spaces
                ;if below then pluses
                mov rax, Plus5
                call print_string
                jmp add2line_end
                        d_5:
                                mov rax, Dash5
                                call print_string
                jmp add2line_end

        part4:
                cmp rbx, qword 4
                je d_4
                cmp rbx, qword 4
                ja draw_spaces
                mov rax, Plus4
                call print_string
                jmp add2line_end
                        d_4:
                                mov rax, Dash4
                                call print_string
                jmp add2line_end

        part3:
                cmp rbx, qword 3
                je d_3
                cmp rbx, qword 3
                ja draw_spaces
                mov rax, Plus3
                call print_string
                jmp add2line_end
                        d_3:
                                mov rax, Dash3
                                call print_string
                jmp add2line_end

        part2:
                cmp rbx, qword 2
                je d_2
                cmp rbx, qword 2
                ja draw_spaces
                mov rax, Plus2
                call print_string
                jmp add2line_end
                        d_2:
                                mov rax, Dash2
                                call print_string
                jmp add2line_end


        part1:
                cmp rbx, qword 1
                je d_1
                cmp rbx, qword 1
                ja draw_spaces
                mov rax, Plus1
                call print_string
                jmp add2line_end
                        d_1:
                                mov rax, Dash1
                                call print_string
                jmp add2line_end

        draw_spaces:
                mov rax, spaces
                call print_string
                jmp add2line_end

add2line_end:

        cmp rcx, qword 56
        jae create_line

        add rcx, qword 8
        jmp add2line


;creates bottom line
bottom_line:

        b_8:
                cmp qword[array + rcx], qword 8
                jne b_7
                mov rax, Dot8
                call print_string
        b_7:
                cmp qword[array + rcx], qword 7
                jne b_6
                mov rax, Dot7
                call print_string
        b_6:
                cmp qword[array + rcx], qword 6
                jne b_5
                mov rax, Dot6
                call print_string
        b_5:
                cmp qword[array + rcx], qword 5
                jne b_4
                mov rax, Dot5
                call print_string
        b_4:
                cmp qword[array + rcx], qword 4
                jne b_3
                mov rax, Dot4
                call print_string
        b_3:
                cmp qword[array + rcx], qword 3
                jne b_2
                mov rax, Dot3
                call print_string
        b_2:
                cmp qword[array + rcx], qword 2
                jne b_1
                mov rax, Dot2
                call print_string
        b_1:
                cmp qword[array + rcx], qword 1
                jne bottom_line_end
                mov rax, Dot1
                call print_string

bottom_line_end:
        cmp rcx, qword 56
        jae disp_num_start
        add rcx, qword 8
        jmp bottom_line

disp_num_start:
        mov rcx, qword 0
        call print_nl
disp_num:
        n8:
                cmp qword[array + rcx], qword 8
                jne n7
                mov rax, S8
                call print_string
        n7:
                cmp qword[array + rcx], qword 7
                jne n6
                mov rax, S7
                call print_string
        n6:
                cmp qword[array + rcx], qword 6
                jne n5
                mov rax, S6
                call print_string
        n5:
                cmp qword[array + rcx], qword 5
                jne n4
                mov rax, S5
                call print_string
        n4:
                cmp qword[array + rcx], qword 4
                jne n3
                mov rax, S4
                call print_string
        n3:
                cmp qword[array + rcx], qword 3
                jne n2
                mov rax, S3
                call print_string
        n2:
                cmp qword[array + rcx], qword 2
                jne n1
                mov rax, S2
                call print_string
        n1:
                cmp qword[array + rcx], qword 1
                jne disp_num_end
                mov rax, S1
                call print_string

disp_num_end:
        cmp rcx, qword 56
        jae prompt
        add rcx, qword 8
        jmp disp_num

restoregs
leave
ret

asm_main:
        enter   0,0
        saveregs

        mov     rdi, array     ;1st param for rperm
        mov     rsi, qword 8   ;2nd param for rperm

        call rperm
        call display
        ;; now the array 'array' is randomly initialzed

prompt:
        call print_nl
        mov rax, prompt1
        call print_string
        mov rax, prompt2
        call print_string

read:
        call read_char
        cmp al, '0'
        je asm_main_end

        cmp al, '1'
        jb error1
        cmp al, '8'
        ja error1

        mov r12, 0
        mov r12b, al
        sub r12b, '0'

        call read_char
        cmp al, ','
        jne error2


        call read_char
        cmp al, '0'
        je asm_main_end

        cmp al, '1'
        jb error3
        cmp al, '8'
        ja error3

        mov r13, 0
        mov r13b, al
        sub r13b, '0'

        call read_char
        cmp al, 10
        jne error2

        mov r14, array;;r14 is pointing to begining of array
Swap:
LOOP1:
        cmp [r14], r12
        je LOOP2
        add r14, 8
        jmp LOOP1
LOOP2:
        mov r15, array
LOOP3:
        cmp [r15], r13
        je LOOP4
        add r15, 8
        jmp LOOP3
LOOP4:
        mov [r14], r13
        mov [r15], r12                          ;r12 is first digit   r13 is second digit

After_Swap:


        push r14
        push array
        sub rsp, 8
        call clear_buf
        call display

        add rsp, 24
        restoregs
        leave
        ret


clear_buf:
        enter 0,0
        saveregs
c1:
        cmp al,10
        je c2
        call read_char
        jmp c1
c2:
        restoregs
        leave
        ret

error1:
        call print_nl
        mov rax, a1
        call print_string
        call clear_buf
        jmp prompt

error2:
        call print_nl
        mov rax, a2
        call print_string
        call clear_buf
        jmp prompt

error3:
        call print_nl
        mov rax, a3
        call print_string
        call clear_buf
        jmp prompt

asm_main_end:
        exit
        restoregs
        leave
        ret
