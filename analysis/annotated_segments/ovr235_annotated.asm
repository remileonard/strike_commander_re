ovr235		segment	para public 'OVERLAY' use16
		assume cs:ovr235
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 174 lignes, NON DÉTAILLÉE — appelle un thunk VROOMM voisin — probable traitement
; d'une frame d'entrée (clavier/joystick/souris).
; ==============================================================================================
Input_ProcessFrame_7A9E0	proc far		; CODE XREF: VROOMM_StubThunk_6ACE0J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp

loc_7A9E1:
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dl, 0
		cmp	byte_72E10, 1
		jnz	short loc_7A9F4
		mov	al, 1

loc_7A9F2:
		jmp	short loc_7A9F6
; ���������������������������������������������������������������������������

loc_7A9F4:				; CODE XREF: Input_ProcessFrame_7A9E0+Ej
		mov	al, 0

loc_7A9F6:				; CODE XREF: Input_ProcessFrame_7A9E0:loc_7A9F2j
		or	al, al
		jz	short loc_7AA16
		cmp	word ptr [si+18Dh], 0
		jge	short loc_7AA09
		mov	word ptr [si+18Dh], 0
		jmp	short loc_7AA14
; ���������������������������������������������������������������������������

loc_7AA09:				; CODE XREF: Input_ProcessFrame_7A9E0+1Fj
		cmp	word ptr [si+18Dh], 10h
		jge	short loc_7AA14
		inc	word ptr [si+18Dh]

loc_7AA14:				; CODE XREF: Input_ProcessFrame_7A9E0+27j
					; Input_ProcessFrame_7A9E0+2Ej
		mov	dl, 1

loc_7AA16:				; CODE XREF: Input_ProcessFrame_7A9E0+18j
		cmp	byte_72E18, 1
		jnz	short loc_7AA21
		mov	al, 1
		jmp	short loc_7AA23
; ���������������������������������������������������������������������������

loc_7AA21:				; CODE XREF: Input_ProcessFrame_7A9E0+3Bj
		mov	al, 0

loc_7AA23:				; CODE XREF: Input_ProcessFrame_7A9E0+3Fj
		or	al, al
		jz	short loc_7AA43
		cmp	word ptr [si+18Dh], 0
		jle	short loc_7AA36
		mov	word ptr [si+18Dh], 0
		jmp	short loc_7AA41
; ���������������������������������������������������������������������������

loc_7AA36:				; CODE XREF: Input_ProcessFrame_7A9E0+4Cj
		cmp	word ptr [si+18Dh], 0FFF0h
		jle	short loc_7AA41
		dec	word ptr [si+18Dh]

loc_7AA41:				; CODE XREF: Input_ProcessFrame_7A9E0+54j
					; Input_ProcessFrame_7A9E0+5Bj
		mov	dl, 1

loc_7AA43:				; CODE XREF: Input_ProcessFrame_7A9E0+45j
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7AA51
		mov	word ptr [si+18Dh], 0

loc_7AA51:				; CODE XREF: Input_ProcessFrame_7A9E0+69j
		mov	dl, 0
		cmp	byte_72E15, 1
		jnz	short loc_7AA5E
		mov	al, 1
		jmp	short loc_7AA60
; ���������������������������������������������������������������������������

loc_7AA5E:				; CODE XREF: Input_ProcessFrame_7A9E0+78j
		mov	al, 0

loc_7AA60:				; CODE XREF: Input_ProcessFrame_7A9E0+7Cj
		or	al, al
		jz	short loc_7AA80
		cmp	word ptr [si+18Fh], 0
		jge	short loc_7AA73
		mov	word ptr [si+18Fh], 0

loc_7AA71:
		jmp	short loc_7AA7E
; ���������������������������������������������������������������������������

loc_7AA73:				; CODE XREF: Input_ProcessFrame_7A9E0+89j
		cmp	word ptr [si+18Fh], 10h
		jge	short loc_7AA7E
		inc	word ptr [si+18Fh]

loc_7AA7E:				; CODE XREF: Input_ProcessFrame_7A9E0:loc_7AA71j
					; Input_ProcessFrame_7A9E0+98j
		mov	dl, 1

loc_7AA80:				; CODE XREF: Input_ProcessFrame_7A9E0+82j
		cmp	byte_72E13, 1
		jnz	short loc_7AA8B
		mov	al, 1
		jmp	short loc_7AA8D
; ���������������������������������������������������������������������������

loc_7AA8B:				; CODE XREF: Input_ProcessFrame_7A9E0+A5j
		mov	al, 0

loc_7AA8D:				; CODE XREF: Input_ProcessFrame_7A9E0+A9j
		or	al, al
		jz	short loc_7AAAD
		cmp	word ptr [si+18Fh], 0
		jle	short loc_7AAA0
		mov	word ptr [si+18Fh], 0
		jmp	short loc_7AAAB
; ���������������������������������������������������������������������������

loc_7AAA0:				; CODE XREF: Input_ProcessFrame_7A9E0+B6j
		cmp	word ptr [si+18Fh], 0FFF0h
		jle	short loc_7AAAB
		dec	word ptr [si+18Fh]

loc_7AAAB:				; CODE XREF: Input_ProcessFrame_7A9E0+BEj
					; Input_ProcessFrame_7A9E0+C5j
		mov	dl, 1

loc_7AAAD:				; CODE XREF: Input_ProcessFrame_7A9E0+AFj
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7AABB
		mov	word ptr [si+18Fh], 0

loc_7AABB:				; CODE XREF: Input_ProcessFrame_7A9E0+D3j
		cmp	byte_72E14, 1
		jnz	short loc_7AAC6
		mov	al, 1
		jmp	short loc_7AAC8
; ���������������������������������������������������������������������������

loc_7AAC6:				; CODE XREF: Input_ProcessFrame_7A9E0+E0j
		mov	al, 0

loc_7AAC8:				; CODE XREF: Input_ProcessFrame_7A9E0+E4j
		or	al, al
		jz	short loc_7AAD1
		mov	byte ptr [si+1BDh], 1

loc_7AAD1:				; CODE XREF: Input_ProcessFrame_7A9E0+EAj
		push	[bp+arg_2]
		push	word ptr [si+18Fh]
		push	word ptr [si+18Dh]
		push	si
		call	VROOMM_StubThunk_6ACBA

loc_7AAE2:
		add	sp, 8
		pop	si

loc_7AAE6:
		pop	bp

locret_7AAE7:
		retf
Input_ProcessFrame_7A9E0	endp

ovr235		ends
