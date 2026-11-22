seg068		segment	byte public 'CODE' use16
		assume cs:seg068
		;org 0Dh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedResourceB_Method_ReadDefault_5C2BF (sub_5C2BF de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, méthode virtuelle appelant
; sub_5D90E avec argument nul. Classe apparentée au cluster PagedMemory (seg127-128), mais
; avec un jeu de fonctions différent (sub_5Dxxx) — probable type de ressource distinct
; (audio/image ?).
; ==============================================================================================
PagedResourceB_Method_ReadDefault_2B3AD	proc far		; CODE XREF: PagedResourceB_Construct_2B43D+6Dp
		push	bp
		mov	bp, sp
		push	large 0
		call	PagedResourceB_Read_2C9FC
		add	sp, 4
		pop	bp
		retf
PagedResourceB_Method_ReadDefault_2B3AD	endp

; ���������������������������������������������������������������������������

loc_2B3BD:				; DATA XREF: dseg:3BBCo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	large 1
		push	large dword ptr	[bp+8]
		call	PagedResourceB_Write_2C643
		add	sp, 8
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B3D4:				; DATA XREF: dseg:3BC0o
		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+6]
		mov	si, [bp+8]
		cmp	dword ptr [si],	0
		jz	short loc_2B3F4
		push	word ptr [si+2]
		call	PagedResourceB_Release_2C71D
		pop	cx
		mov	dword ptr [si],	0

loc_2B3F4:				; CODE XREF: seg068:0042j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B3F7:				; DATA XREF: dseg:3BC4o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		push	word ptr [bp+10h]
		push	large dword ptr	[bp+0Ch]
		push	large dword ptr	[bp+8]
		call	CRT_MemFamily_Extra1
		add	sp, 0Ah
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B412:				; DATA XREF: dseg:3BCCo
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		call	PagedResourceB_Init_2CA48
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B41F:				; DATA XREF: dseg:3BD4o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	ax, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, byte_46BAE
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B435:				; DATA XREF: dseg:3BB8o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedResourceB_Construct_5C34F (sub_5C34F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; constructeur : alloue (sub_658), appelle sub_5F460 puis
; PagedResourceB_Method_ReadDefault_5C2BF. Référencée par sub_5C9D3.
; ==============================================================================================
PagedResourceB_Construct_2B43D	proc far		; CODE XREF: Memory_AllocatorTableConstructor_2BAC1+68P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2B456
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_2B4B2

loc_2B456:				; CODE XREF: PagedResourceB_Construct_2B43D+9j
		mov	word ptr [si], 13A4h
		mov	ax, word_4703A
		mov	[si+2],	ax
		mov	word_4703A, si
		mov	word ptr [si+4], 3B55h
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+8], seg seg001
		mov	word ptr [si+6], 3Bh ; ';'
		mov	word ptr [si], 3B5Dh
		mov	word ptr [si+4], 3B85h
		mov	word ptr [si], 3BB8h
		mov	word ptr [si+4], 3BE0h
		cmp	byte_46BAE, 0
		jz	short loc_2B4A9
		push	3B8Fh
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrame_2FCD5
		add	sp, 4
		jmp	short loc_2B4AD
; ���������������������������������������������������������������������������

loc_2B4A9:				; CODE XREF: PagedResourceB_Construct_2B43D+57j
		push	cs
		call	near ptr PagedResourceB_Method_ReadDefault_2B3AD

loc_2B4AD:				; CODE XREF: PagedResourceB_Construct_2B43D+6Aj
		mov	byte_46BAE, 1

loc_2B4B2:				; CODE XREF: PagedResourceB_Construct_2B43D+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
PagedResourceB_Construct_2B43D	endp

; ���������������������������������������������������������������������������

loc_2B4B7:				; CODE XREF: seg068:0177j
					; DATA XREF: dseg:3BDCo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_2B4E8
		mov	word ptr [si], 3BB8h
		mov	word ptr [si+4], 3BE0h
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Member_ClearAndFree_2F278
		pop	cx
		test	di, 1
		jz	short loc_2B4E8
		push	si
		call	sub_308
		pop	cx

loc_2B4E8:				; CODE XREF: seg068:0124j seg068:013Fj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B4EC:				; DATA XREF: dseg:3BC8o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	dx, [bp+0Ah]
		mov	ax, [bp+8]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B4FA:				; DATA XREF: dseg:3BD0o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		xor	ax, ax
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B504:				; DATA XREF: dseg:3BD8o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		mov	al, 2
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2B50E:				; DATA XREF: dseg:3BE4o
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	loc_2B4B7
seg068		ends
