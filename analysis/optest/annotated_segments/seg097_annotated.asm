seg097		segment	byte public 'CODE' use16
		assume cs:seg097
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Member_ClearAndFree_5EA03 (sub_5EA03 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, référencée via vtable et dans des dizaines de segments
; — libère (sub_338) un pointeur membre s'il est posé, puis remet à zéro deux champs (pointeur
; + taille/longueur). Motif « clear/reset » d'un membre géré, PAS un constructeur de sous-
; objet comme précédemment supposé dans plusieurs segments — à garder en tête pour la
; relecture de ces entrées si besoin.
; ==============================================================================================
Member_ClearAndFree_2F278	proc far		; CODE XREF: sub_5803+71EP
					; seg067:016FP	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_2F27C:				; DATA XREF: seg170:03DEo
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_2F28C
		push	word ptr [si]
		call	sub_308
		pop	cx

loc_2F28C:				; CODE XREF: Member_ClearAndFree_2F278+Aj
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf
Member_ClearAndFree_2F278	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Member_AllocateAndCopy_5EA23 (sub_5EA23 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle Member_ClearAndFree_5EA03 puis
; DisplayCache_GetHeadValue_5D469 (seg137) ×2 et alloue (sub_658) — motif complémentaire «
; clear puis réallouer/copier » un membre géré.
; ==============================================================================================
Member_AllocateAndCopy_2F298	proc far		; CODE XREF: DisplaySurface_Construct_2F08E+19P
					; DisplaySurface_Construct_2F08E+53P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr Member_ClearAndFree_2F278
		pop	cx
		call	DisplayCache_GetHeadValue_2C557
		cmp	ax, di
		jnb	short loc_2F2B9
		call	DisplayCache_GetHeadValue_2C557
		mov	di, ax

loc_2F2B9:				; CODE XREF: Member_AllocateAndCopy_2F298+18j
		or	di, di
		jbe	short loc_2F2CD
		push	di
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si], ax
		mov	bx, [si]
		mov	byte ptr [bx], 0
		jmp	short loc_2F2D1
; ���������������������������������������������������������������������������

loc_2F2CD:				; CODE XREF: Member_AllocateAndCopy_2F298+23j
		mov	word ptr [si], 0

loc_2F2D1:				; CODE XREF: Member_AllocateAndCopy_2F298+33j
		mov	[si+2],	di
		mov	ax, [si]
		pop	di
		pop	si
		pop	bp
		retf
Member_AllocateAndCopy_2F298	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Member_CopyRaw_5EA65
; (sub_5EA65 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, aucun appel externe visible — copie de données brutes entre deux membres (rôle
; exact non détaillé).
; ==============================================================================================
Member_CopyRaw_2F2DA	proc far		; CODE XREF: DisplaySurface_Construct_2F08E+6CP
					; DisplaySurface_CloneOrResize_2F113+78P ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_2F325
		mov	di, [si]
		mov	dx, [si+2]
		jmp	short loc_2F2F0
; ���������������������������������������������������������������������������

loc_2F2EE:				; CODE XREF: Member_CopyRaw_2F2DA+19j
		inc	di
		dec	dx

loc_2F2F0:				; CODE XREF: Member_CopyRaw_2F2DA+12j
		cmp	byte ptr [di], 0
		jnz	short loc_2F2EE
		jmp	short loc_2F304
; ���������������������������������������������������������������������������

loc_2F2F7:				; CODE XREF: Member_CopyRaw_2F2DA+35j
		les	bx, [bp+arg_2]
		mov	al, es:[bx]
		mov	[di], al
		inc	word ptr [bp+arg_2]
		inc	di
		dec	dx

loc_2F304:				; CODE XREF: Member_CopyRaw_2F2DA+1Bj
		or	dx, dx
		jz	short loc_2F311
		les	bx, [bp+arg_2]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_2F2F7

loc_2F311:				; CODE XREF: Member_CopyRaw_2F2DA+2Cj
		or	dx, dx
		jz	short loc_2F31A
		mov	byte ptr [di], 0
		jmp	short loc_2F325
; ���������������������������������������������������������������������������

loc_2F31A:				; CODE XREF: Member_CopyRaw_2F2DA+39j
		mov	ax, [si+2]
		dec	ax
		mov	bx, [si]
		add	bx, ax
		mov	byte ptr [bx], 0

loc_2F325:				; CODE XREF: Member_CopyRaw_2F2DA+Bj
					; Member_CopyRaw_2F2DA+3Ej
		pop	di
		pop	si
		pop	bp
		retf
Member_CopyRaw_2F2DA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Member_NullTerminateIfSet_5EAB4 (sub_5EAB4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, écrit un octet nul en tête du buffer pointé
; par un membre, s'il est non nul. Référencée par DisplaySurface_Construct_5E819 et
; DisplaySurface_ConstructWithMode_5E9A9 (seg151).
; ==============================================================================================
Member_NullTerminateIfSet_2F329	proc far		; CODE XREF: DisplaySurface_Construct_2F08E+61P
					; DisplaySurface_ConstructWithMode_2F21E+28P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_2F33A
		mov	bx, [si]
		mov	byte ptr [bx], 0

loc_2F33A:				; CODE XREF: Member_NullTerminateIfSet_2F329+Aj
		pop	si
		pop	bp
		retf
Member_NullTerminateIfSet_2F329	endp

; ���������������������������������������������������������������������������

loc_2F33D:				; DATA XREF: dseg:5940o
		push	bp
		mov	bp, sp
		mov	word_47034, 0
		push	100h
		push	4014h
		push	cs
		call	near ptr Member_AllocateAndCopy_2F298
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2F355:				; DATA XREF: dseg:59DCo
		push	bp
		mov	bp, sp
		push	4014h
		push	cs
		call	near ptr Member_ClearAndFree_2F278
		pop	cx
		pop	bp
		retf
seg097		ends
