; BIOS boots from the address 0x7C00
; org tells the assembler where we excpect the code to be loaded
org 0x7C00
bits 16


main:
    hlt

.halt:
    jmp .halt

; BIOS expects the boot sector to end with 0x55AA
times 510-($-$$) db 0 ; fills bootsector with zeros till Byte 510
dw 0AA55h ; bootsector signature