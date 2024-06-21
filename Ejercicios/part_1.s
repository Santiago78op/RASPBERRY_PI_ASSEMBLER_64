.global _start

.data
x: .asciz "Enter a number: "

.bss
y: .space 11
z: .space 34 

.text
_start:
    mov x0, 1
    ldr x1, =x
    mov x2, 22
    mov x8, 64
    svc 0
    mov x0, 0
    ldr x1, =y
    mov x2, 11
    mov x8, 63
    svc 0
    mov x0, 0
    ldr x1, =y
    mov x2, 10
    mov x3, 0
loop1:
    ldrb w3, [x1]
    cmp w3, 10
    beq endloop1
    sub w3, w3, 48
    uxtb x3, w3
    mul x0, x0, x2
    add x0, x0, x3
    add x1, x1, 1
    b loop1
endloop1:
    mov x1, x3
    mov x8, #93
    svc 0
    ret