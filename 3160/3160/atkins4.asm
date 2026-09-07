; file name:	atkins4.asm
; adding two byte size numbers

section .data
	num1	db		0x05
	num2	db		0xFD
	
	num3	db		0xFA
	num4	db		0xFB
	
	num5	db		0x48
	num6	db		0x64
	
	num7	db		0xE9
	num8	db		0x8C


section .text
global _start

_start:
		mov al, [num1]	;	AL
		mov ah,	[num2]	;	AH
		add al, ah		;	AL

		mov bl, [num3]  ;	AL
		mov bh, [num4]	;	AH
		add bl, bh		;	AL

		mov cl, [num5]	;	CL
		mov ch,	[num6]	;	CH
		add cl, ch		;	Cl

		mov dl, [num7]	;	DL
		mov dh, [num8]	;	DH
		add dl, dh		l	DL

		mov rax, 60
		mov rdi, 0		
		syscall