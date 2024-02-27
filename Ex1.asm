org  0x100               ; Indicate that this is a .COM program
section .data
    a db 4               ; Define a = 4
    b db 6               ; Define b = 6
    c db 2               ; Define c = 2
    resultMsg db 'Result: $' ; Define a string for outputting the result

section .text
_start:
    mov al, [b]          ; Load b into al
    sub al, [c]          ; Subtract c from al
    add al, [a]          ; Add a to al

    ; Convert the result to an ASCII character (for single-digit numbers)
    add al, 30h          ; Convert the number to an ASCII character

    ; Output the result
    mov ah, 09h          ; DOS function for outputting a string
    lea dx, resultMsg    ; Set DX to the address of resultMsg
    int 21h              ; Call DOS interrupt

    ; Output the number
    mov dl, al           ; Place the result in dl for output
    mov ah, 02h          ; DOS function for outputting a character
    int 21h              ; Call DOS interrupt

    ; End the program
    mov ax, 4c00h        ; DOS function to end the program
    int 21h              ; Call DOS interrupt
