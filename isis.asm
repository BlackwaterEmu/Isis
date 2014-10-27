format MZ
include 'gameLib.asm'
entry main:start
stack 100h

segment main
start:
	mov ax, text
	mov ds, ax
	print msg
	
	startVGA
	call funs:drawBG
	drawStr msg, 1, 1, red, sand
	
	call funs:exit

segment text
msg db 'Starting VGA...$'

segment funs
drawBG:
	drawRectFill sand, 0, 0, 319, 199
	retf

i:
	retf

i2:
	retf

u:
	retf

k:
	retf
	
exit:
	mov ah, 4ch
	int 21h
