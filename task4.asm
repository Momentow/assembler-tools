bits 64
default rel
global main
extern scanf
extern printf

section .data
    input_format db '%lf', 0
    output_format db 'sqrt(%f) => %f', 0xA, 0
    step dq 0.125
    current dq 0

section .bss
    стоп resq 1

section .text
    main:
        sub rsp, 24

        lea rsi, [стоп]
        lea rdi, [input_format]
        mov dl, 0
        call scanf

        movlpd xmm4, [step]
        movlpd xmm5, [стоп]

    loop_:
        sqrtsd xmm1, [current]
        movlpd xmm0, [current]

        ; print the result
        lea rdi, [output_format]
        mov dl, 2
        call printf

        movlpd xmm3, [current]
        addsd xmm3, xmm4
        movlpd  [current], xmm3

        ucomisd xmm3, xmm5
        jbe loop_

        ; exit
        add rsp, 24
        xor rax, rax
        ret