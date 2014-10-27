include 'loops.asm'

sand equ 06h
green equ 0ah
red equ 0ch
black equ 0

macro startVGA
{
	mov ah, 00 ;Set graphics mode
	mov al, 13h ;320x200, VGA mode 256-color
	int 10h
}

;t is in hundreths of seconds.
macro sleep t
{
	xor ah, ah
	int 1ah
	mov bx, t
	.until dx > bx
		xor ah, ah
		int 1ah
	.endu	
}

macro drawPix color, x, y
{
	mov al, color ;ex:0ah=Lime, see "color help" in cmd
	mov cx, x ;Column (0-319)
	mov dx, y ;Row (0-199)
		
	mov ah, 0ch ;Write graphics pixel
	mov bh, 0 ;Page number
	int 10h
}

macro drawLine color, x, y, x1, y1
{
;	(y1 - y)/(x1 - x) = slope
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
	mov dh, x
	mov dl, y
	mov al, char ;ex:41h=A
	mov bh, bgcolor ;ex:0=Black
	mov bl, color ;ex:4=Red
	
	mov ah, 02 ;Set cursor position
	mov bh, 0 ;Page number (0 in graphics modes)
	int 10h
		
	mov ah, 09; write char
	mov cx, 1 ;Number of times to write character
	int 10h
}

macro drawStr msg, x, y, color, bgcolor
{
	mov cx, 0
	mov si, msg
	.until al='$'
		lodsb
		add cx, 1
	.endu
	
	mov dh, x
	mov dl, y
	mov si, msg
	
	.until cx=1
		lodsb
		push cx
		drawChar al, dh, dl, color, bgcolor
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
top:
	add cx, 1
	drawPix color, cx, dx
	cmp cx, x1
	jne top
	
left:
	mov cx, x
	add dx, 1
	drawPix color, cx, dx
	cmp dx, y1
	jne left
	mov dx, y
	
right:
	mov cx, x1
	add dx, 1
	drawPix color, cx, dx
	cmp dx, y1
	jne right
	mov cx, x
	
bottom:
	add cx, 1
	drawPix color, cx, dx
	cmp cx, x1
	jne bottom
}

macro drawRectFill color, x, y, x1, y1
{
	mov cx, x
	mov dx, y
xloop:
	add cx, 1
	drawPix color, cx, dx
	cmp cx, x1
	jne xloop
	
	mov cx, x
	add dx, 1
	cmp dx, y1
	jne xloop
}

macro drawCurve
{

}

macro drawCurveFill
{

}

macro drawModel file
{

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

macro playSound
{

}
