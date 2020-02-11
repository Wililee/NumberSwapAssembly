extern print_int, print_string, print_char, print_nl, read_char

%macro  saveregs 0
	push	rbx
	push	rcx
	push	rdx
	push	r12
	push	r13
	push	r14
	push	r15
	push	rdi
	push	rsi
%endmacro

%macro  restoregs 0
	pop	rsi
	pop	rdi
	pop	r15
	pop	r14
	pop	r13
	pop	r12
	pop	rdx
	pop	rcx
	pop	rbx
%endmacro

%macro	exit 0
	mov	rax, 60                 ; system call for exit
	xor	rdi, rdi                ; exit code 0
	syscall                       ; invoke operating system to exit
%endmacro

