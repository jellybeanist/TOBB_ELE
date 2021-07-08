;Bubble sort algorithm for 8051
;Get 16 byte data from ROM adress 200H and sort and store it in RAM from 40H
;For (i=0;i++;i<16)
;	For (j=0;j++;j<(16-i))
;		{
;		read(2 bytes)
;		if byte1>byte2
;			change byte1, byte2
;		}
ORG 200H
DATA1: DB '1n2b21m4atZA9BFW'

ORG 0H
;Here we read the data from ROM and store it in the RAM
MOV R0, #16
MOV R1, #40H
MOV DPTR, #DATA1
Here:
	MOV A, #0H
	MOVC A, @A+DPTR
	MOV @R1, A
	INC R1
	INC DPTR
DJNZ R0, Here

MOV R0, #0FH ;Loop1 counter
LOOP1:
	MOV R1, #40H ;Set the value of the RAM address to 40H
	MOV A, R0
	MOV R2,A ;R2 is the counter for LOOP2
	LOOP2:
	 	MOV A, @R1
	 	INC R1 ;Increament R1
	 	MOV R3,A ;Move the first value to R4
	 	MOV A, @R1 ;Move the second value to A 
	 	CLR C
	 	SUBB A, R3 ; A = Second Value - first Value
	 	JNC LOOP2End

	 	SwapNUM:
	 		MOV A, @R1 ; Store second value in accumulator
	 		XCH A,R3 ; Change the value stored in A (Second value) with R4 (first value)
	 		MOV @R1, A ; First value is at the place of second value
	 		DEC R1
	 		MOV A, R3
	 		MOV @R1, A ; Store the value in RAM
	 		INC R1
	 LOOP2End: 
	 	DJNZ R2, LOOP2
LOOP1END:
	DJNZ R0, LOOP1
END
	 	


