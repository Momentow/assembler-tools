bits 64
default rel
global  main
extern scanf
extern printf

section .data
    інпут_формат db '%d', 0
    аутпут_формат db '%d ', 0
    фініш_формат db 0xA, 0

section .bss
    array resd 100

section .text
    ; start
    main:
        sub     rsp, 8
        mov     r15d, 0

    ; input of array
    input_loop:
        lea     esi, [array + r15d*4]
        lea     rdi, [інпут_формат]
        xor     rax, rax
        call    scanf

        inc     r15d
        cmp     eax, 1
        je     input_loop
        dec     r15d
        xor     ecx, ecx

    ; outer bubblesort loop
    first_loop:
        mov     ebx, r15d
        dec     ebx
        jmp     second_loop

    first_loop_continue:
        inc     ecx
        cmp     ecx, r15d
        jl      first_loop
        jmp     output_loop_prepare

    ; replace two numbers
    replace:
        mov     r14d, [array + ebx*4 - 4]
        mov     [array + ebx*4 - 4], edx
        mov     [array + ebx*4], r14d
        jmp     second_loop_continue

    ; inner bubblesort loop
    second_loop:
        cmp     ebx, ecx
        jle     first_loop_continue
        mov     edx, [array + ebx*4]
        cmp     edx, [array + ebx*4 - 4]
        jl      replace

    second_loop_continue:
        dec     ebx
        jmp     second_loop

    output_loop_prepare:
        mov     r14d, 0

    output_loop:
        mov     esi, [array + r14d*4]
        lea     rdi, [аутпут_формат
]
        xor     eax, eax
        call    printf
        inc     r14d
        cmp     r14d, r15d
        jl      output_loop

        ; small prettyfier
        mov     esi, 0
        lea     rdi, [фініш_формат]
        xor     eax, eax
        call    printf

        ; exit
        add     rsp, 8
        xor     rax, rax
        ret