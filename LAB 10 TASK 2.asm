.model small
.stack 100h
.data
arr db 5 dup(?)     
msg db "Enter 5 numbers:$"
msg2 db 0Dh,0Ah,"Largest number: $"

.code
main:
    mov ax, @data
    mov ds, ax

    ; display input message
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

    ; find maximum
    mov al, arr[0]
    mov si, 1
    mov cx, 4

max_loop:
    cmp arr[si], al
    jle skip
    mov al, arr[si]

skip:
    inc si
    loop max_loop

    ; save result
    mov bl, al

    ; print message
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; print result
    mov al, bl
    add al, 30h
    mov dl, al
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h

end main