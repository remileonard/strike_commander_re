seg146		segment	byte public 'CODE' use16
		assume cs:seg146
		;org 3
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; FileStream_Method_Read_64353 (sub_64353 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée via vtable (DATA XREF seg339) —
; méthode « Read » de FileStream : délègue à File_ReadOrDelegateToPaged_630E7 (seg185) avec le
; handle interne (+2). Appelée par FileStream_ReadRaw_63747 (seg189).
; ==============================================================================================
FileStream_Method_Read_3BBC3	proc far		; CODE XREF: FileStream_ReadRaw_3AFB7+1BP
					; DATA XREF: dseg:48CCo

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0FFFFFFFFh
		cmp	word ptr [si+2], 0
		jz	short loc_3BBF7
		push	word ptr [si+2]
		push	large [bp+arg_6]
		push	large [bp+arg_A]
		push	large [bp+arg_2]
		call	File_ReadOrDelegateToPaged_3A957
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax

loc_3BBF7:				; CODE XREF: FileStream_Method_Read_3BBC3+16j
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
FileStream_Method_Read_3BBC3	endp

; ���������������������������������������������������������������������������

loc_3BC03:				; DATA XREF: dseg:48B0o dseg:48D0o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	dword ptr [bp-4], 0FFFFFFFFh
		cmp	word ptr [si+2], 0
		jz	short loc_3BC3B
		push	word ptr [si+2]
		push	large dword ptr	[bp+0Ch]
		push	large dword ptr	[bp+10h]
		push	large dword ptr	[bp+8]
		call	File_WriteOrDelegateToPaged_3AA53
		or	ax, dx
		jz	short loc_3BC3B
		mov	eax, [bp+10h]
		mov	[bp-4],	eax

loc_3BC3B:				; CODE XREF: seg146:0059j seg146:0071j
		mov	eax, [bp-4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3BC47:				; DATA XREF: dseg:48B4o dseg:48D4o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	dword ptr [bp-4], 0FFFFFFFFh
		cmp	word ptr [si+2], 0
		jz	short loc_3BC77
		push	word ptr [si+2]
		push	large dword ptr	[bp+8]
		mov	al, [bp+0Ch]
		push	ax
		call	File_SeekWithRetry_3ACF2
		push	dx
		push	ax
		pop	eax
		mov	[bp-4],	eax

loc_3BC77:				; CODE XREF: seg146:009Dj
		mov	eax, [bp-4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; FileStream_Method_Open_64413 (sub_64413 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée via vtable — méthode « Open » de
; FileStream : File_CreateWithRetry_630BA (seg184) ou File_OpenWithRetry_63434 (seg186) selon
; le mode. Appelée par le thunk FileStream_Method_OpenAndInit_63616 (seg189).
; ==============================================================================================
FileStream_Method_Open_3BC83	proc far		; CODE XREF: seg143:0085P
					; DATA XREF: dseg:48D8o

var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	cx, [bp+arg_4]
		mov	dl, 0
		cmp	word ptr [si+2], 0
		jnz	short loc_3BCDD
		or	cl, cl
		jnz	short loc_3BCA8
		push	ds
		push	ax
		call	File_CreateWithRetry_3A92A
		jmp	short loc_3BCC0
; ���������������������������������������������������������������������������

loc_3BCA8:				; CODE XREF: FileStream_Method_Open_3BC83+1Aj
		mov	[bp+var_2], 2
		cmp	cl, 1
		jnz	short loc_3BCB5
		mov	[bp+var_2], 0

loc_3BCB5:				; CODE XREF: FileStream_Method_Open_3BC83+2Cj
		push	ds
		push	ax
		mov	al, [bp+var_2]
		push	ax
		call	File_OpenWithRetry_3ACA4

loc_3BCC0:				; CODE XREF: FileStream_Method_Open_3BC83+23j
		mov	[si+2],	ax
		cmp	word ptr [si+2], 0FFFFh
		jz	short loc_3BCCE
		mov	ax, 1
		jmp	short loc_3BCD0
; ���������������������������������������������������������������������������

loc_3BCCE:				; CODE XREF: FileStream_Method_Open_3BC83+44j
		xor	ax, ax

loc_3BCD0:				; CODE XREF: FileStream_Method_Open_3BC83+49j
		mov	dl, al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3BCDD
		mov	word ptr [si+2], 0

loc_3BCDD:				; CODE XREF: FileStream_Method_Open_3BC83+16j
					; FileStream_Method_Open_3BC83+53j
		mov	al, dl
		pop	si
		leave
		retf
FileStream_Method_Open_3BC83	endp

; ���������������������������������������������������������������������������

loc_3BCE2:				; DATA XREF: dseg:48BCo dseg:48DCo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+2], 0
		jz	short loc_3BCFC
		push	word ptr [si+2]
		call	File_CloseWithRetry_3ACD3
		mov	word ptr [si+2], 0

loc_3BCFC:				; CODE XREF: seg146:012Dj
		mov	ax, [si+2]
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3BD07:				; DATA XREF: dseg:48C0o dseg:48E0o
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+6]
		mov	dword ptr [bp-8], 0
		cmp	word ptr [si+2], 0
		jz	short loc_3BD57
		push	word ptr [si+2]
		push	large 0
		push	0
		call	File_SeekWithRetry_3ACF2
		push	dx
		push	ax
		pop	eax
		mov	[bp-4],	eax
		push	word ptr [si+2]
		push	large 0
		push	2
		call	File_SeekWithRetry_3ACF2
		push	dx
		push	ax
		pop	eax
		mov	[bp-8],	eax
		push	word ptr [si+2]
		push	large dword ptr	[bp-4]
		push	0
		call	File_SeekWithRetry_3ACF2

loc_3BD57:				; CODE XREF: seg146:015Dj
		mov	eax, [bp-8]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3BD63:				; DATA XREF: dseg:48E4o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	1
		push	large 0
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
seg146		ends
