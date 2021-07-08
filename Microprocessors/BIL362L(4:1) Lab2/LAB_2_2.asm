lcall INITIALIZE_LCD
clr rs1
clr rs0
mov r0, #75H ; test case
mov r3, #34H

lcall MULTIPLY
lcall EXTRACT_DIGITS
lcall WRITE
sjmp $

MULTIPLY:
mov r6, #0
mov r7, #0
mov 15H, r3
MULT_LOOP:
clr C
mov a, r7
add a, r0
mov r7, a
jnc PROCEED
inc r6
PROCEED:
djnz 15H, MULT_LOOP
ret

DIVIDE:
mov r6, #0
mov r7, #0
mov r4, 0
mov r5, 1
clr C
clr 0
mov a, r4
jnz POST_SETUP
setb 0
POST_SETUP:
clr C
mov A, r5
subb A, r3
mov r5, A
jc HANDLE_OVERFLOW
CONTINUE:
mov A, r7
add A, #1
mov r7, A
mov A, r6
addc A, #0
mov r6, A
clr C
ljmp POST_SETUP
HANDLE_OVERFLOW:
clr C
jb 0, FIN_DIVIDE
dec r4
mov A, r4
jz LAST_PROD
ljmp CONTINUE
LAST_PROD:
setb 0
ljmp CONTINUE
FIN_DIVIDE:
ret

WRITE:
mov 15H, #5
mov r0, #10H
NEXT_DIGIT:
mov a, #'0'
add a, @r0
lcall SEND_DATA
inc r0
djnz 15H, NEXT_DIGIT
ret

EXTRACT_DIGITS:
mov a, r6
mov 1AH, a
mov a, r7
mov 1BH, a
;first digit
mov a, 1AH
mov r0, a
mov a, 1BH
mov r1, a
mov r3, #100
lcall DIVIDE
mov a, r6
mov r0, a
mov a, r7
mov r1, a
mov r3, #100
lcall DIVIDE
mov 10H, r7 ; extracted 1st digit
;second digit
mov 15H, #100
LOOP1:
mov 16H, #100
LOOP2:
clr C
mov a, 1BH
subb a, 10H
mov 1BH, a
jnc FORWARD1
dec 1AH
FORWARD1:
djnz 16H, LOOP2
djnz 15H, LOOP1
mov a, 1AH
mov r0, a
mov a, 1BH
mov r1, a
mov r3, #100
lcall DIVIDE
mov a, r6
mov r0, a
mov a, r7
mov r1, a
mov r3, #10
lcall DIVIDE 
mov 11H, r7 ; extracted 2nd digit
;third digit
mov 15H, #10
LOOP3:
mov 16H, #100
LOOP4:
clr C
mov a, 1BH
subb a, 11H
mov 1BH, a
jnc FORWARD2
dec 1AH
FORWARD2:
djnz 16H, LOOP4
djnz 15H, LOOP3
mov a, 1AH
mov r0, a
mov a, 1BH
mov r1, a
mov r3, #100
lcall DIVIDE
mov 12H, r7 ; extracted 3rd digit
;fourth digit
mov 15H, #100
LOOP5:
clr C
mov a, 1BH
subb a, 12H
mov 1BH, a
jnc FORWARD3
dec 1AH
FORWARD3:
djnz 15H, LOOP5
mov a, 1AH
mov r0, a
mov a, 1BH
mov r1, a
mov r3, #10
lcall DIVIDE
mov 13H, r7 ; extracted 4th digit
;fifth digit
mov 15H, #10
LOOP6:
clr C
mov a, 1BH
subb a, 13H
mov 1BH, a
jnc FORWARD4
dec 1AH
FORWARD4:
djnz 15H, LOOP6
mov 14H, 1BH ; extracted 5th digit
ret


INITIALIZE_LCD:
; initialise the display
; see instruction set for details
CLR P1.3	
; function set	
CLR P1.7		
CLR P1.6		
SETB P1.5		
CLR P1.4		; high nibble set
SETB P1.2		
CLR P1.2		; negative edge on E
LCALL DELAY	; wait for BF to clear
SETB P1.2		 
CLR P1.2		; negative edge on E
SETB P1.7		; low nibble set 
SETB P1.2		
CLR P1.2		; negative edge on E
LCALL DELAY	; wait for BF to clear	
CLR P1.7		 
CLR P1.6		
CLR P1.5		
CLR P1.4		; high nibble set
SETB P1.2		
CLR P1.2		; negative edge on E
SETB P1.6		
SETB P1.5		; low nibble set
SETB P1.2		
CLR P1.2		; negative edge on E
LCALL DELAY	; wait for BF to clear
CLR P1.7		
CLR P1.6		
CLR P1.5		
CLR P1.4		; high nibble set
SETB P1.2		 
CLR P1.2		; negative edge on E
SETB P1.7		
SETB P1.6		
SETB P1.5		
SETB P1.4		; low nibble set
SETB P1.2	 
CLR P1.2		; negative edge on E
LCALL DELAY ; wait for BF to clear

DELAY:
PUSH 0
MOV R0, #50
DJNZ R0, $
POP 0
RET

SEND_DATA: ;send the data located at A to LCD
SETB P1.3
NOP
MOV C, ACC.7		 
MOV P1.7, C		 
MOV C, ACC.6		 
MOV P1.6, C		 
MOV C, ACC.5		
MOV P1.5, C		
MOV C, ACC.4		 
MOV P1.4, C	; high nibble set
SETB P1.2		
CLR P1.2		; negative edge on E
MOV C, ACC.3		; 
MOV P1.7, C		; 
MOV C, ACC.2		; 
MOV P1.6, C		; 
MOV C, ACC.1		; 
MOV P1.5, C		; 
MOV C, ACC.0		; 
MOV P1.4, C		; low nibble set
SETB P1.2		; 
CLR P1.2		; negative edge on E
LCALL DELAY		; wait for BF to clear
RET
