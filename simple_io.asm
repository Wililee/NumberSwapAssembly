global print_int, print_string, print_char, read_char, print_nl, exit
extern printf, puts, putchar, getchar

section .data
  ffformat1: db  "%ld",0
  ffformat2: db  "%s",0

section .text
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  print_int:
	enter 	0,0
	push	rax
	push	rbx
	push	rcx
	push	rdx
	push	r12
	push	r13
	push	r14
	push	r15
	push	rdi
	push	rsi

        mov     rdi, ffformat1          ; set 1st parameter (format)
        mov     rsi, rax                ; set 2nd parameter (number)
        mov     rax, qword 0            ; because printf is varargs
        call    printf                  ; printf(format,number)

        pop	rsi
        pop	rdi
        pop	r15
        pop	r14
        pop	r13
        pop	r12
        pop	rdx
        pop	rcx
        pop	rbx
        pop	rax
        leave
        ret
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  print_string:
	enter 	0,0
	push	rax
	push	rbx
	push	rcx
	push	rdx
	push	r12
	push	r13
	push	r14
	push	r15
	push	rdi
	push	rsi

        mov     rdi, ffformat2          ; set 1st parameter (format)
        mov     rsi, rax                ; set 2nd parameter (string address)
        mov     rax, qword 0            ; because printf is varargs
        call    printf                  ; printf(format,string)

        pop	rsi
        pop	rdi
        pop	r15
        pop	r14
        pop	r13
        pop	r12
        pop	rdx
        pop	rcx
        pop	rbx
        pop	rax
        leave
        ret
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  print_char:
	enter	0,0
	push	rax
	push	rbx
	push	rcx
	push	rdx
	push	r12
	push	r13
	push	r14
	push	r15
	push	rdi
	push	rsi

        mov	rdi,rax
        call	putchar

        pop	rsi
        pop	rdi
        pop	r15
        pop	r14
        pop	r13
        pop	r12
        pop	rdx
        pop	rcx
        pop	rbx
        pop	rax
	leave
        ret
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  print_nl:
	enter	0,0
	push	rax
	push	rbx
	push	rcx
	push	rdx
	push	r12
	push	r13
	push	r14
	push	r15
	push	rdi
	push	rsi

        mov	rdi,qword 10
        call	putchar

        pop	rsi
        pop	rdi
        pop	r15
        pop	r14
        pop	r13
        pop	r12
        pop	rdx
        pop	rcx
        pop	rbx
        pop	rax
	leave
        ret
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  read_char:
	enter	0,0
        push	rbx
        push	rcx
        push	rdx
        push	rdi
        push	rsi

        call	getchar  ; returns in rax

        pop	rsi
        pop	rdi
        pop	rdx
        pop	rcx
        pop	rbx

	leave
        ret
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
