; $$$$$$$$$$$$$$$ Z77 ASM LIBRARY $$$$$$$$$$$$$$$$ 
; *************** SUNGOD SOFTWARE **************** 
; ??????????????????? IF.INC ????????????????????? 

!NOT equ 0 

; jump if condition to l (or !NOT if 1) 

macro JIF l, [c] { 
common 
local s 
define s 0 
macro J O,A,C,B, [X] \{ 
match =0 X, s c \\{ 
  O A, B ; opcode o1, o2 
  if !NOT eq 0 
    j\#C l 
  else 
    jN\#C l 
  end if 
  define s 1 
\\} 
\} 
J cmp,a,LE,b, a<==b    ; a<=b 
J cmp,a,GE,b, a>==b    ; a>=b 
J cmp,a,L,b, a<b       ; a<b 
J cmp,a,G,b, a>b       ; a>b 
J cmp,a,E,b, a==b      ; a=b 
J cmp,a,NE,b, a =not b ; a not b (unequal) 
J test,a,NE,b, a&b     ; a&b 
J or,a,NE,b, a|b       ; a|b 
J cmp,a,E,0, =not a    ; not a (=0) 
J cmp,a,NE,0, a        ; a (not 0) 
if s eq 0 
ERROR: 'Invalid expression' 
end if 
purge J 
} 

; jump if NOT condition to l 

macro JIFN l, [c] { 
common 
!NOT equ 1 
JIF l, c 
!NOT equ 0 ; restore default 
} 

; HL IF/ELSE 

macro .if.begin { 
local ..start, ..else, ..end 
?IF equ 
?START equ ..start 
?ELSE equ ..else 
?END equ ..end 
?START: 
} 

macro .if [c] { 
common 
.if.begin 
JIFN ?ELSE, c ; if false, jmp to end 
} 

macro .if.n [c] { 
common 
.if.begin 
JIF ?ELSE, c 
} 

macro .else { 
jmp ?END 
?ELSE: 
restore ?IF 
?IF equ , 
} 

macro .else.if [c] { 
common 
jmp ?END 
?ELSE: 
restore ?ELSE 
local ..else 
?ELSE equ ..else 
JIFN ?ELSE, c 
} 

macro .end { 
if ?IF eq 
?ELSE: 
end if 
?END: 
restore ?IF, ?START, ?ELSE, ?END 
} 

jNE equ jne 
jNNE equ je 
jNG equ jng 
jNL equ jnl 

; $$$$$$$$$$$$$$$ Z77 ASM LIBRARY $$$$$$$$$$$$$$$$ 
; *************** SUNGOD SOFTWARE **************** 
; ?????????????????? LOOP.INC ???????????????????? 

; .loop i=x to n 
; .endl 

; .while a<b 
; .endw 

; .until a=b 
; .endu 

; .continue 
; .break 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

macro .loop [c] { 
local ..start, ..end 
?START equ ..start 
?END equ ..end 
define ?s 0 
match i==x =to n, c \{ 
define ?s 1 
?INDEX equ i 
push x ; let i=x 
pop i 
?START: 
mov ecx, i 
cmp ecx, n 
jge ?END 
\} 
if ?s eq 0 
ERROR: 'Incorrect loop syntax' 
end if 
} 

macro .endl { 
inc ?INDEX    ; i++ 
jmp ?START    ; continue 
?END: 
restore ?START, ?END, ?INDEX 
} 

macro .while [c] { 
common 
.if c 
} 

macro .endw { 
jmp ?START 
.end 
} 

macro .until [c] { 
common 
.if.n c 
} 

.endu fix .endw 

macro .continue { jmp ?START } 
macro .break { jmp ?END }
; jump if NOT condition to l 

macro JIFN l, [c] { 
common 
!NOT equ 1 
JIF l, c 
!NOT equ 0 ; restore default 
}
