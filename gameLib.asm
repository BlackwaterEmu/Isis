include 'loops.asm'

blue equ 99
dblue equ 1
sand equ 06
green equ 0ah
dgreen equ 2
red equ 0ch
dred equ 4
black equ 0
white equ 0fh

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
	
macro drawChar char, x, y, color
{
	mov dh, y
	mov dl, x
	mov al, char ;ex:41h=A
	mov bl, color ;ex:4=Red
	
	mov ah, 02 ;Set cursor position
	xor bh, bh ;Page number (0 in graphics modes)
	int 10h
		
	mov ah, 09; write char
	mov cx, 1 ;Number of times to write character
	int 10h
}

macro drawStr msg, x, y, color
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
		drawChar al, dl, dh, color
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

