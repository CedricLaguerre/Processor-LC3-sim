.ORIG x0000
		
		AND R0,R0,0 	;mise a 0 de R0
		LEA R2,chaine	; Chargement dans R2 de l'adresse de la chaîne
		JSR strlen 		;Appel de la sous-routine
		LEA R1,testJMP	;Charge L'adresse de tesJMP dans R1
		JMP R1			;Saut a d'instruction à l'adresse testJMP
		ADD R0,R0,-5	;Instruction si JMP fail
		NOP				;
testJMP:ADD R6,R6,8	
	
			AND R0,R0,0	; mise a 0 de R0
			AND R1,R1,0	; mise a 0 de R1
			LD  R0, cons1   ; load cons1
			LD  R1, cons2   ; load cons2
			NOT R1, R1      ; complement a 1 de cons2
			ADD R1, R1, #1  ; complement a 2 de cons2
			ADD R0, R0, R1  ; R0 = a + (-b)
			
;testSetReset: 	AND R0,R0,0; mise a 0 de R0
;				SET R0,R0,15;
;				RESET R0,R0, 15;
		
		AND R3,R3,0	;mise a O de R3
		LEA R5,testSTR	;Charge dans R2 l'adresse de testSTR
		JSRR R5		;Appel de la sous-routine
		JSR testLDI
		ADD R3,R3,1
		BRp fin
		ADD R3,R3,1	
testLDI:LEA R0,cons4 ; charge dans R0 l'adresse de cons4
		ST R0,cons5 ; stocke dans cons5 le contenu de R0 (cons5=@cons4)
		LDI R1,cons5 ; 
		ADD R0,R1,0
		RET
testSTR:LD R0,cons1 ; R0 = 7
		ADD R0,R0,8 ; R0 = 15
		LEA R1,cons1 ; charge dans R1 l'adresse de cons1
		STR R0,R1,2 ; Stocke dans le contenu R0 , R1(adresse de cons1)+2
		AND R0,R0,0 ; mise a 0 de R0
		LD R0,cons3 ; R0 = 15
		RET
fin:	NOP
		
strlen:	AND R3,R3,0     ; Mise à 0 du compteur : c = 0
loop:	LDR R4,R2,0     ; Chargement dans R4 du caractère pointé par R2
		BRz fini        ; Test de fin de chaîne
		ADD R2,R2,1		; Incrémentation du pointeur : p++
		ADD R3,R3,1     ; Incrémentation du compteur : c++
		BR loop
fini:	ADD R2,R3,0		; R2 = R3
		RET				; Retour par JMP R7
		
		
chaine:	.STRINGZ "Soutenance"
cons1:	.FILL 7
cons2:	.FILL 4
cons3:  .FILL 10	
cons4:	.FILL 14
cons5:	.FILL 15	
.END