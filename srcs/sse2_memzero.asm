[BITS 32]
segment .text

GLOBAL _sse2_memzero
_sse2_memzero:
    push ebp
    mov ebp, esp

    push edi
    push ebx

    mov edi, [ebp + 8]      ; dest
    mov ebx, [ebp + 12]     ; count
    shr ebx, 7              ; divide by 128 (8 * 128bit registers)

    xorpd xmm0, xmm0
    xorpd xmm1, xmm1
    xorpd xmm2, xmm2
    xorpd xmm3, xmm3
    xorpd xmm4, xmm4
    xorpd xmm5, xmm5
    xorpd xmm6, xmm6
    xorpd xmm7, xmm7

.memzero_loop_copy:
    movntdq [EDI], xmm0      ; move data from registers to dest
    movntdq [EDI + 16], xmm1
    movntdq [EDI + 32], xmm2
    movntdq [EDI + 48], xmm3
    movntdq [EDI + 64], xmm4
    movntdq [EDI + 80], xmm5
    movntdq [EDI + 96], xmm6
    movntdq [EDI + 112], xmm7

    add edi, 128
    dec ebx

    jnz .memzero_loop_copy            ; loop please

    pop ebx
    pop edi

    pop ebp
    ret
