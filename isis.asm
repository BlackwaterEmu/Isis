;Dialog:
;drawStr line, 1, 20, character color, black
;character colors:
;i = red, i2 = dred, k = blue, u = green
;

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

	getch
	
	call funs:exit

segment text
msg db 'Starting VGA...$'
msg1 db 'Ye$'

segment funs
drawBG:
	drawRectFill sand, 0, 0, 319, 199
	retf
	
exit:
	mov ah, 4ch
	int 21h
