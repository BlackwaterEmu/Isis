include 'loops.asm'

blue equ 99
sand equ 06h
green equ 0ah
red equ 0ch
dred equ 4
black equ 0

macro startVGA
{
	xor ah, ah ;Set graphics mode
	mov al, 13h ;320x200, VGA mode 256-color
	int 10h
}

macro getch
{
	mov ah, 07h
	int 21h
}

macro drawPix color, x, y
{
	mov al, color ;ex:0ah=Lime, see "color help" in cmd
	mov cx, x ;Column (0-319)
	mov dx, y ;Row (0-199)
		
	mov ah, 0ch ;Write graphics pixel
	xor bh, bh ;Page number
	int 10h
}

macro drawLine color, x, y, x1, y1
{
;find some way to approximate to ints
;	(y1 - y)/(x1 - x) = slope
;	if slope == 0:
;		vertdraw color, x, y, y1
;	if slope > 1:
;		j = 1
;    		while j <= slope*n:
;        plotPixel n, (slope*(n-1)) + j
;        ++j
;if slope < -1:
;    j = -1
;    while j >= slope*n:
;        plotPixel n, (slope*(n-1)) + j
;        j--
;n = x
;while n <= x1:
;    plotPixel n, slope*n
;    ++n
}
	
macro drawChar char, x, y, color, bgcolor
{
	mov dh, y
	mov dl, x
	mov al, char ;ex:41h=A
	mov bh, bgcolor ;ex:0=Black
	mov bl, color ;ex:4=Red
	
	mov ah, 02 ;Set cursor position
	xor bh, bh ;Page number (0 in graphics modes)
	int 10h
		
	mov ah, 09; write char
	mov cx, 1 ;Number of times to write character
	int 10h
}

macro drawStr msg, x, y, color, bgcolor
{
	xor cx, cx
	mov si, msg
	.until al='$'
		lodsb
		add cx, 1
	.endu
	
	mov dh, y
	mov dl, x
	mov si, msg
	
	.until cx=1
		lodsb
		push cx
		drawChar al, dl, dh, color, bgcolor
		pop cx
		add dl, 1
		sub cx, 1
	.endu
}

macro print msg
{
	mov dx, msg
	mov ah, 9h
	int 21h
}
	
macro drawTri
{

}

macro drawTriFill
{

}
	
macro drawRect color, x, y, x1, y1
{
	mov cx, x
	mov dx, y
	
.until cx=x1
	add cx, 1
	drawPix color, cx, dx
.endu
	
.until dx=y1
	mov cx, x
	add dx, 1
	drawPix color, cx, dx
.endu
	mov dx, y
	
.until dx=y1
	mov cx, x1
	add dx, 1
	drawPix color, cx, dx
.endu
	mov cx, x
	
.until cx=x1
	add cx, 1
	drawPix color, cx, dx
.endu
}

macro drawRectFill color, x, y, x1, y1
{
	mov cx, x
	mov dx, y

.until dx=y1
.until cx=x1
	add cx, 1
	drawPix color, cx, dx
.endu
	
	mov cx, x
	add dx, 1
.endu
}

macro makeHost
{

}

macro sendHostData
{

}

macro recvHostData
{

}

macro makeClient
{

}

macro sendClientData
{

}

macro recvClientData
{

}
