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
	call funs:drawBG ; because there is no faster method to clear pixels than overwriting the whole screen
	call funs:i
	drawStr m1, 1, 20, red, black
	getch
	
	call funs:drawBG
	call funs:i
	drawStr m1c, 1, 20, red, black
	getch
	
	call funs:exit

segment text
msg db 'Starting VGA...$'
m1 db 'You think we could be furthering our$' ;36 chars, should be limit of msgs.
m1c db 'good cause?$'

m2 db 'Wut ya mean m8?$'

m3 db 'You know like by donating these dead$'
m3c db 'peoples blood.$'

m4 db 'It would be like 5L to a pint.$'
m5 db 'That', 27h,'s over ten times the$'
m5c db 'amount of blood per person.$'
m6 db 'Ye, but if people actually needed blood$'
m7 db 'then they', 27h,'d let homosexuals donate.$'
m8 db 'But we don', 27h,'t like gay people.$'
m9 db 'But do you like everyone who donates blood?'
m10 db 'Well, I guess not.$'
m11 db 'mmf...$'
m12 db 'Let', 27h,'s here his dieing words.$'
;scene where obama's gag is taken off
m13 db 'oo. ook ooo ee ah ooo.$'
;[Obama is laid onto a table and player must decapitate him.]
m14 db 'They killed Osama, we kill Obama!$'
m15 db 'Wait, I thought he was muslim.$'
m16 db 'Shit! We should', 27h,'ve killed WBC instead.$'
m17 db 'Don', 27h,'t they hate gay people too?$'
m18 db 'Yes, but they believe in God.$'
m19 db 'Alah means god.$'
m20 db 'What about Jews?$'
m21 db 'They only believe in Alah by your means.$'
m22 db 'I don', 27h,'t know anymore.'
;[leave to base]
m23 db 'Alright, lights go kill some murkins.$'
m24 db 'Yea!$'
m25 db 'Wait, how old are you?$'
m26 db '11.$'
m27 db 'Sorry kid, this is an 18+ group.$' 
;[shoots kid]
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
m43 db 'Oh boy. How about you guys come with me$'
m44 db 'to murka and we treat woman like objects?$'
m45 db 'Sounds like a blast. Ha ha ha.$'

segment funs
drawBG:
	drawRectFill sand, 0, 0, 319, 199
	retf
	
decapSim:
	;draw stuff
	getch
	cmp al, 20 ;space
	jne go
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
	
k:
	drawRectFill black, 140, 10, 170, 30 ;head
	drawRectFill blue, 140, 30, 170, 120 ;body
	drawRectFill blue, 130, 30, 140, 90 ;arms
	drawRectFill blue, 170, 30, 180, 90
	retf

u:
	drawRectFill black, 140, 10, 170, 30 ;head
	drawRectFill green, 140, 30, 170, 120 ;body
	drawRectFill green, 130, 30, 140, 90 ;arms
	drawRectFill green, 170, 30, 180, 90
	retf

go:
	;draw game over screen
	mov ah, 4ch
	int 21h
	
exit:
	mov ah, 4ch
	int 21h
