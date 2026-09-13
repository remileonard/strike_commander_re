seg152		segment	byte public 'CODE' use16
		assume cs:seg152
		;org 3
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, référencée via vtable et dans des dizaines de segments — libère (sub_338) un pointeur
; membre s'il est posé, puis remet à zéro deux champs (pointeur + taille/longueur). Motif «
; clear/reset » d'un membre géré, PAS un constructeur de sous-objet comme précédemment supposé
; dans plusieurs segments — à garder en tête pour la relecture de ces entrées si besoin.
; ==============================================================================================
Member_ClearAndFree_5EA03	proc far		; CODE XREF: seg128:0171P seg128:01E5P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_5EA07:				; DATA XREF: seg216:off_6A366o
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_5EA17
		push	word ptr [si]
		call	CRT_FreeNear_Wrap
		pop	cx

loc_5EA17:				; CODE XREF: Member_ClearAndFree_5EA03+Aj
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf
Member_ClearAndFree_5EA03	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Member_ClearAndFree_5EA03 puis DisplayCache_GetHeadValue_5D469 (seg137) ×2 et
; alloue (sub_658) — motif complémentaire « clear puis réallouer/copier » un membre géré.
; ==============================================================================================
Member_AllocateAndCopy_5EA23	proc far		; CODE XREF: DisplaySurface_Construct_5E819+19P
					; DisplaySurface_Construct_5E819+53P ...

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
		call	near ptr Member_ClearAndFree_5EA03

loc_5EA33:
		pop	cx

loc_5EA34:
		call	DisplayCache_GetHeadValue_5D469
		cmp	ax, di
		jnb	short loc_5EA44

loc_5EA3D:
		call	DisplayCache_GetHeadValue_5D469
		mov	di, ax

loc_5EA44:				; CODE XREF: Member_AllocateAndCopy_5EA23+18j
		or	di, di
		jbe	short loc_5EA58
		push	di
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si], ax
		mov	bx, [si]
		mov	byte ptr [bx], 0
		jmp	short loc_5EA5C
; ���������������������������������������������������������������������������

loc_5EA58:				; CODE XREF: Member_AllocateAndCopy_5EA23+23j
		mov	word ptr [si], 0

loc_5EA5C:				; CODE XREF: Member_AllocateAndCopy_5EA23+33j
		mov	[si+2],	di
		mov	ax, [si]
		pop	di
		pop	si
		pop	bp
		retf
Member_AllocateAndCopy_5EA23	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible — copie de données brutes entre deux membres (rôle exact
; non détaillé).
; ==============================================================================================
Member_CopyRaw_5EA65	proc far		; CODE XREF: DisplaySurface_Construct_5E819+6CP
					; DisplaySurface_CloneOrResize_5E89E+78P ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_5EAB0
		mov	di, [si]
		mov	dx, [si+2]
		jmp	short loc_5EA7B
; ���������������������������������������������������������������������������

loc_5EA79:				; CODE XREF: Member_CopyRaw_5EA65+19j
		inc	di
		dec	dx

loc_5EA7B:				; CODE XREF: Member_CopyRaw_5EA65+12j
		cmp	byte ptr [di], 0
		jnz	short loc_5EA79
		jmp	short loc_5EA8F
; ���������������������������������������������������������������������������

loc_5EA82:				; CODE XREF: Member_CopyRaw_5EA65+35j
		les	bx, [bp+arg_2]
		mov	al, es:[bx]
		mov	[di], al
		inc	word ptr [bp+arg_2]
		inc	di
		dec	dx

loc_5EA8F:				; CODE XREF: Member_CopyRaw_5EA65+1Bj
		or	dx, dx
		jz	short loc_5EA9C
		les	bx, [bp+arg_2]
		cmp	byte ptr es:[bx], 0
		jnz	short loc_5EA82

loc_5EA9C:				; CODE XREF: Member_CopyRaw_5EA65+2Cj
		or	dx, dx
		jz	short loc_5EAA5
		mov	byte ptr [di], 0
		jmp	short loc_5EAB0
; ���������������������������������������������������������������������������

loc_5EAA5:				; CODE XREF: Member_CopyRaw_5EA65+39j
		mov	ax, [si+2]
		dec	ax
		mov	bx, [si]
		add	bx, ax
		mov	byte ptr [bx], 0

loc_5EAB0:				; CODE XREF: Member_CopyRaw_5EA65+Bj
					; Member_CopyRaw_5EA65+3Ej
		pop	di
		pop	si
		pop	bp
		retf
Member_CopyRaw_5EA65	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, écrit un octet nul en tête du buffer pointé par un membre, s'il est non nul. Référencée
; par DisplaySurface_Construct_5E819 et DisplaySurface_ConstructWithMode_5E9A9 (seg151).
; ==============================================================================================
Member_NullTerminateIfSet_5EAB4	proc far		; CODE XREF: DisplaySurface_Construct_5E819+61P
					; DisplaySurface_ConstructWithMode_5E9A9:loc_5E9D1P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_5EAC5
		mov	bx, [si]
		mov	byte ptr [bx], 0

loc_5EAC5:				; CODE XREF: Member_NullTerminateIfSet_5EAB4+Aj
		pop	si
		pop	bp

locret_5EAC7:
		retf
Member_NullTerminateIfSet_5EAB4	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — constructeur de la classe DisplaySurface :
; réinitialise le mode vidéo global (word_70EA2=0) et alloue un buffer de 0x100 octets (tag
; 3DF2h) via Member_AllocateAndCopy_5EA23.
; ==============================================================================================
DisplaySurfaceClass_Construct_5EAC8:				; DATA XREF: seg339:off_71F32o
		push	bp
		mov	bp, sp

loc_5EACB:
		mov	word_70EA2, 0
		push	100h
		push	3DF2h
		push	cs
		call	near ptr Member_AllocateAndCopy_5EA23
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg339) — destructeur de la classe DisplaySurface :
; libère le buffer (tag 3DF2h) via Member_ClearAndFree_5EA03.
; ==============================================================================================
DisplaySurfaceClass_Destruct_5EAE0:				; DATA XREF: seg339:off_71FECo
		push	bp

loc_5EAE1:
		mov	bp, sp

loc_5EAE3:
		push	3DF2h
		push	cs

loc_5EAE7:
		call	near ptr Member_ClearAndFree_5EA03
		pop	cx
		pop	bp
		retf
seg152		ends
