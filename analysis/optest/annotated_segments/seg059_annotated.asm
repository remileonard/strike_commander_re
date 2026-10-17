seg059		segment	byte public 'CODE' use16
		assume cs:seg059
		;org 4
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Parser_BuildHashIndex_588E8 (sub_588E8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 123 lignes, NON DÉTAILLÉE — référencée par
; sub_2AE7C. Construit une table de 16 entrées via des pointeurs fs:/lfs et un index à 4 bits
; (masque 0Fh) extrait par décalage variable — probable table de hachage/dispatch pour un
; parseur ou une table de symboles. Candidat pour lecture approfondie si le contexte de
; sub_2AE7C le justifie.
; ==============================================================================================
Parser_BuildHashIndex_27454	proc far		; CODE XREF: sub_1D569+2BP

var_26		= word ptr -26h
var_22		= byte ptr -22h
var_20		= word ptr -20h
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		enter	26h, 0
		push	si
		push	di
		push	ds
		push	fs
		cld

loc_2745E:				; DATA XREF: seg170:029Eo
		mov	di, [bp+arg_0]
		mov	[bp+var_22], 0

loc_27465:				; CODE XREF: Parser_BuildHashIndex_27454+C0j
		mov	si, di
		push	ss
		pop	es
		lea	di, [bp+var_20]
		xor	ax, ax
		mov	cx, 10h
		rep stosw
		mov	di, si
		mov	ax, ss:[di+2]
		mov	[bp+var_26], ax
		lds	si, ss:[di+4]

loc_27480:				; CODE XREF: Parser_BuildHashIndex_27454+7Cj
		lfs	bx, [si]
		push	bx
		mov	eax, fs:[bx+2]
		mov	cl, [bp+var_22]
		shr	eax, cl
		and	ax, 0Fh
		lea	bx, [bp+var_20]
		add	bx, ax
		add	bx, ax

loc_27499:				; CODE XREF: Parser_BuildHashIndex_27454+55j
					; Parser_BuildHashIndex_27454+5Cj
		mov	dx, ss:[bx]
		cmp	dx, 400h
		jl	short loc_274B2
		add	bx, 2
		inc	al
		cmp	al, 10h
		jl	short loc_27499
		sub	al, 10h
		sub	bx, 20h	; ' '
		jmp	short loc_27499
; ���������������������������������������������������������������������������

loc_274B2:				; CODE XREF: Parser_BuildHashIndex_27454+4Cj
		shl	al, 2
		add	dh, al
		inc	word ptr ss:[bx]
		shl	dx, 2
		les	bx, ss:[di+arg_2]
		add	bx, dx
		pop	word ptr es:[bx]
		mov	word ptr es:[bx+2], fs
		add	si, 4
		dec	[bp+var_26]
		jnz	short loc_27480
		lds	si, ss:[di+4]
		mov	es, word ptr ss:[di+arg_2+2]
		mov	cx, 0Fh

loc_274DD:				; CODE XREF: Parser_BuildHashIndex_27454+B4j
		mov	dx, 0FFFFh
		jmp	short loc_274FA
; ���������������������������������������������������������������������������

loc_274E2:				; CODE XREF: Parser_BuildHashIndex_27454+B1j
		mov	bx, cx
		shl	bx, 0Ah
		add	bx, dx
		shl	bx, 2
		add	bx, word ptr ss:[di+arg_2]
		mov	eax, es:[bx]
		mov	[si], eax
		add	si, 4

loc_274FA:				; CODE XREF: Parser_BuildHashIndex_27454+8Cj
		inc	dx
		lea	bx, [bp+var_20]
		add	bx, cx
		add	bx, cx
		cmp	ss:[bx], dx
		jnz	short loc_274E2
		dec	cx
		jns	short loc_274DD
		add	[bp+var_22], 4
		cmp	[bp+var_22], 20h ; ' '
		jge	short loc_27517
		jmp	loc_27465
; ���������������������������������������������������������������������������

loc_27517:				; CODE XREF: Parser_BuildHashIndex_27454+BEj
		pop	fs
		pop	ds
		pop	di
		pop	si
		leave
		retf
Parser_BuildHashIndex_27454	endp

seg059		ends
