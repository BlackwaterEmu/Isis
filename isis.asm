;Dialog:
;drawStr line, 1, 20, character color
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
	call funs:drawBG ; because there is no faster method to clear pixels than overwriting the whole screen
	call funs:i
	drawStr m1, 1, 20, red
	getch
	
	jmp debug
	
	call funs:drawBG
	call funs:i
	drawStr m1c, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:i2
	drawStr m2, 1, 20, dred
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m3, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m3c, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m4, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m5, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m5c, 1, 20, red
	getch
		
	call funs:drawBG
	call funs:i2
	drawStr m6, 1, 20, dred
	getch
	
	call funs:drawBG
	call funs:i2
	drawStr m7, 1, 20, dred
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m8, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:i2
	drawStr m9, 1, 20, dred
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m10, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:o
	drawStr m11, 1, 20, sand
	getch
	
	call funs:drawBG
	call funs:i2
	drawStr m12, 1, 20, dred
	getch
	
	call funs:drawBG
	call funs:i2
	drawStr gag, 1, 20, dred
	getch
	
	call funs:drawBG
	call funs:o
	drawStr m13, 1, 20, sand
	getch
	
	call funs:drawBG
	call funs:o
	drawStr dcap, 1, 20, sand
	getch
	
	call funs:drawBG
	call funs:o
	drawStr dcap2, 1, 20, sand
	getch
	
	call funs:drawBG
	call funs:o
	drawStr dcapc, 1, 20, sand
	getch
	
	cmp al, 20h
	jne lose

	call funs:drawBG
	call funs:o
	drawRectFill dred, 140, 28, 185, 30
	drawStr dcapw, 1, 20, dred
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m14, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:i2
	drawStr m15, 1, 20, dred
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m16, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:i2
	drawStr m17, 1, 20, dred
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m18, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:i2
	drawStr m19, 1, 20, dred
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m20, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m21, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:i2
	drawStr m22, 1, 20, dred
	getch
	
	call funs:drawBG
	drawStr ltb, 1, 20, white
	getch
	
	call funs:drawBG
	call funs:i2
	drawStr m23, 1, 20, dred
	getch
	
	call funs:drawBG
	call funs:k
	drawStr m24, 1, 20, blue
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m25, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:k
	drawStr m26, 1, 20, blue
	getch

	call funs:drawBG
	call funs:k
	drawRectFill dred, 140, 20, 141, 21
	drawRectFill dred, 170, 20, 185, 21
	drawStr m27, 1, 20, red
	getch
	
	call funs:drawBG
	call funs:u
	drawStr m28, 1, 20, dgreen
	getch

debug:

	call funs:shooter
	
wing:
	call funs:gw
	
lose:
	call funs:go

segment text
msg db 'Starting VGA...$'
m1 db 'You think we could be furthering our$' ;36 chars, should be limit of msgs.
m1c db 'good cause?$'
m2 db 'Wut ya mean m8?$'
m3 db 'You know like by donating these dead$'
m3c db 'people', 27h, ' blood.$'
m4 db 'It would be like 5L to a pint.$'
m5 db 'That', 27h,'s over ten times the$'
m5c db 'amount of blood per person.$'
m6 db 'Ye, but if day actually needed blood$'
m7 db 'then they', 27h,'d let homosexs donate.$'
m8 db 'But we don leik gay people.$'
m9 db 'But do ye leik every1 who donate blood?$'
m10 db 'Well, I guess not.$'
m11 db 'mmf...$'
m12 db 'Let', 27h,'s here his dieing words.$'
gag db '[Takes off gag.]$'
m13 db 'oo. ook ooo ee ah ooo!$'
dcap db 'Guess key to kill obama.$'
dcap2 db 'If u wrong ye kill self.$'
dcapc db 'Hint: [spacebar]$'
dcapw db 'Decapitation!$'
m14 db 'They killed Osama, we kill Obama!$'
m15 db 'Wait, I thought he was muslim.$'
m16 db 'Shit! We should', 27h,'ve killed WBC instead.$'
m17 db 'Don', 27h,'t they hate gays too?$'
m18 db 'Yes, but they believe in God.$'
m19 db 'Alah means god.$'
m20 db 'What about Jews?$'
m21 db 'They believe in Alah by your means.$'
m22 db 'I don', 27h,'t know anymore.$'
ltb db '[leave to base]$'
m23 db 'Alright, lights go kill some murkins.$'
m24 db 'Yea!$'
m25 db 'Wait, how old are you?$'
m26 db '11.$'
m27 db 'Sorry kid, this is an 18+ group.$' ;[shoots kid]

;[us soljers break in]
m28 db 'Die.$'

;[gun fight and both sides run out of ammo]

m29 db 'Well fuck.$'

m30 db 'Damn.$'

m31 db 'How am I suppose to shoot them aliens$'

m32 db 'when I get back home? Them jumpin over the border$'

m33 db 'and cutting crop circles, stealin my beer.$'

m34 db 'Wait... you hate immigrants,$'

m35 db 'believe in God, and love guns?$'

m36 db 'If you don', 27h,'t then you', 27h,'re a commie.$'

m37 db 'That', 27h,'s right. I hate fasism too.$'

m38 db 'Why are we fighting again.$'

m39 db 'Cuz, um, Obama.$'

m40 db 'Oh man I hate Obama.$'

m41 db 'Hey! Us too.$'

m42 db 'In fact, we just killed him.$'

m43 db '0boy. How about u guys cum with me$'

m44 db 'to murka and we treat woman like objects?$'

m45 db 'Sounds like a blast. Ha ha ha.$'

gomsg db 'Game Over$'

win db 'Ye Win!$'

segment funs
drawBG:
	drawRectFill sand, 0, 0, 319, 199
	retf
	
i:
	drawRectFill black, 140, 10, 170, 30 ;head
	drawRectFill red, 140, 30, 170, 120 ;body
	drawRectFill red, 130, 30, 140, 90 ;arms
	drawRectFill red, 170, 30, 180, 90
	retf
	
i2:
	drawRectFill black, 140, 10, 170, 30 ;head
	drawRectFill dred, 140, 30, 170, 120 ;body
	drawRectFill dred, 130, 30, 140, 90 ;arms
	drawRectFill dred, 170, 30, 180, 90
	retf
	
o:
	drawRectFill black, 140, 10, 170, 30 ;head
	drawRectFill black, 140, 30, 170, 120 ;body
	drawRectFill black, 130, 30, 140, 90 ;arms
	drawRectFill black, 170, 30, 180, 90
	retf
	
k:
	drawRectFill black, 140, 10, 170, 30 ;head
	drawRectFill blue, 140, 30, 170, 120 ;body
	drawRectFill blue, 130, 30, 140, 90 ;arms
	drawRectFill blue, 170, 30, 180, 90
	retf

u:
	drawRectFill black, 140, 10, 170, 30 ;head
	drawRectFill dgreen, 140, 30, 170, 120 ;body
	drawRectFill dgreen, 130, 30, 140, 90 ;arms
	drawRectFill dgreen, 170, 30, 180, 90
	retf

macro b x, y
{
	drawRectFill black, x, y, x+1, y+1
}

go:
	drawRectFill black, 0, 0, 319, 199
	drawStr gomsg, 7, 37, dred
	getch
	mov ah, 4ch
	int 21h
	
gw:
	drawRectFill black, 0, 0, 319, 199
	drawStr win, 7, 37, dblue
	getch
	mov ah, 4ch
	int 21h
	
shooter:
	call funs:drawBG
	drawRect dgreen, 300, 100, 310, 110 ; change to move to player
	drawRect red, 20, 100, 30, 110 ; change y from input
	getch
	cmp al, 20h
	je gw
	cmp al, 'j'
	je down
	cmp al, 'k'
	je up
	;if b kills u then jmp win, if out of ammo then retf, if b kills i then go
	jmp shooter
	up:
	down:
	jmp shooter
	
exit:
	mov ah, 4ch
	int 21h
