ovr242		segment	para public 'OVERLAY' use16
		assume cs:ovr242
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 21 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Input_ProcessFrame_7A9E0 (sub_7A9E0 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 174 lignes,
; NON DÉTAILLÉE — appelle un thunk VROOMM voisin — probable traitement d'une frame d'entrée
; (clavier/joystick/souris).
; ==============================================================================================
Input_ProcessFrame_8A5F0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dl, 0
		cmp	byte_7D358, 1
		jnz	short loc_8A604
		mov	al, 1
		jmp	short loc_8A606

loc_8A604:
		mov	al, 0

loc_8A606:
		or	al, al
		jz	short loc_8A626
		cmp	word ptr [si+14Ch], 0
		jge	short loc_8A619
		mov	word ptr [si+14Ch], 0
		jmp	short loc_8A624

loc_8A619:
		cmp	word ptr [si+14Ch], 10h
		jge	short loc_8A624
		inc	word ptr [si+14Ch]

loc_8A624:
		mov	dl, 1

loc_8A626:
		cmp	byte_7D360, 1
		jnz	short loc_8A631
		mov	al, 1
		jmp	short loc_8A633

loc_8A631:
		mov	al, 0

loc_8A633:
		or	al, al
		jz	short loc_8A653
		cmp	word ptr [si+14Ch], 0
		jle	short loc_8A646
		mov	word ptr [si+14Ch], 0
		jmp	short loc_8A651

loc_8A646:
		cmp	word ptr [si+14Ch], 0FFF0h
		jle	short loc_8A651
		dec	word ptr [si+14Ch]

loc_8A651:
		mov	dl, 1

loc_8A653:
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8A661
		mov	word ptr [si+14Ch], 0

loc_8A661:
		mov	dl, 0
		cmp	byte_7D35D, 1
		jnz	short loc_8A66E
		mov	al, 1
		jmp	short loc_8A670

loc_8A66E:
		mov	al, 0

loc_8A670:
		or	al, al
		jz	short loc_8A690
		cmp	word ptr [si+14Eh], 0
		jge	short loc_8A683
		mov	word ptr [si+14Eh], 0
		jmp	short loc_8A68E

loc_8A683:
		cmp	word ptr [si+14Eh], 10h
		jge	short loc_8A68E
		inc	word ptr [si+14Eh]

loc_8A68E:
		mov	dl, 1

loc_8A690:
		cmp	byte_7D35B, 1
		jnz	short loc_8A69B
		mov	al, 1
		jmp	short loc_8A69D

loc_8A69B:
		mov	al, 0

loc_8A69D:
		or	al, al
		jz	short loc_8A6BD
		cmp	word ptr [si+14Eh], 0
		jle	short loc_8A6B0
		mov	word ptr [si+14Eh], 0
		jmp	short loc_8A6BB

loc_8A6B0:
		cmp	word ptr [si+14Eh], 0FFF0h
		jle	short loc_8A6BB
		dec	word ptr [si+14Eh]

loc_8A6BB:
		mov	dl, 1

loc_8A6BD:
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8A6CB
		mov	word ptr [si+14Eh], 0

loc_8A6CB:
		cmp	byte_7D35C, 1
		jnz	short loc_8A6D6
		mov	al, 1
		jmp	short loc_8A6D8

loc_8A6D6:
		mov	al, 0

loc_8A6D8:
		or	al, al
		jz	short loc_8A6E1
		mov	byte ptr [si+17Ch], 1

loc_8A6E1:
		push	[bp+arg_2]
		push	word ptr [si+14Eh]
		push	word ptr [si+14Ch]
		push	si
		call	sub_16738
		add	sp, 8
		pop	si
		pop	bp
		retf
Input_ProcessFrame_8A5F0		endp
ovr242		ends
