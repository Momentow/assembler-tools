bits 64
default rel
global  main

extern  scanf
extern  printf

section .data
	input_f db '%s', 0
	output_f db '%s', 0xA, 0

section .bss
	input_str resb 1024
	output_str resb 1024

section .text
	main:
		sub rsp, 8

		lea rsi, [input_str]
		lea rdi, [input_f]
		mov dl, 0
		call scanf

		lea rsi, [input_str]
		lea rdi, [output_str]

	; copy loop
	copy_loop:
		mov dl, [rsi]
		mov [rdi], dl
		cmp dl, 0
		je finish

		inc rsi
		inc rdi
		jmp copy_loop

	; print the result
	finish:
		lea rsi, [output_str]
		lea rdi, [output_f]
		mov dl, 0
		call printf

		; exit
		add rsp, 8
		sub rax, rax
		ret