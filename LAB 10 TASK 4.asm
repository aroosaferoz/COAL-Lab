.model small
.stack 100h
.data
arr db 5 dup(?)     
msg db "Enter 5 numbers:$"
msg2 db 0Dh,0Ah,"Even numbers count: $"

.code
main:
    mov ax, @data
    mov ds, ax

    ; input message
    lea dx, msg
    mov ah, 09h
    int 21h

    mov si, 0
    mov cx, 5

input_loop:
    mov ah, 01h
    int 21h
    sub al, 30h
    mov arr[si], al
    inc si
    loop input_loop

    ; count even numbers
    mov si, 0
    mov cx, 5
    mov bl, 0        ; counter

even_loop:
    mov al, arr[si]
    and al, 1        ; check even/odd
    jnz skip
    inc bl           ; if even

skip:
    inc si
    loop even_loop

    ; print message
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; print result
    add bl, 30h
    mov dl, bl
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h

end main