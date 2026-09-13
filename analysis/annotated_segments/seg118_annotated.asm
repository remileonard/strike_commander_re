seg118		segment	byte public 'CODE' use16
		assume cs:seg118
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 123 lignes, NON DÉTAILLÉE — référencée par sub_2AE7C. Construit une table de 16
; entrées via des pointeurs fs:/lfs et un index à 4 bits (masque 0Fh) extrait par décalage
; variable — probable table de hachage/dispatch pour un parseur ou une table de symboles.
; Candidat pour lecture approfondie si le contexte de sub_2AE7C le justifie.
; ==============================================================================================
Parser_BuildHashIndex_588E8	proc far		; CODE XREF: Widget_RefreshTextConditional+29P

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
		mov	di, [bp+arg_0]
		mov	[bp+var_22], 0

loc_588F9:				; CODE XREF: Parser_BuildHashIndex_588E8+C0j
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

loc_58914:				; CODE XREF: Parser_BuildHashIndex_588E8+7Cj
		lfs	bx, [si]
		push	bx
		mov	eax, fs:[bx+2]
		mov	cl, [bp+var_22]
		shr	eax, cl

loc_58923:
		and	ax, 0Fh

loc_58926:
		lea	bx, [bp+var_20]
		add	bx, ax

loc_5892B:
		add	bx, ax

loc_5892D:				; CODE XREF: Parser_BuildHashIndex_588E8+55j
					; Parser_BuildHashIndex_588E8+5Cj
		mov	dx, ss:[bx]

loc_58930:
		cmp	dx, 400h

loc_58934:
		jl	short loc_58946

loc_58936:
		add	bx, 2
		inc	al
		cmp	al, 10h
		jl	short loc_5892D
		sub	al, 10h
		sub	bx, 20h	; ' '
		jmp	short loc_5892D
; ���������������������������������������������������������������������������

loc_58946:				; CODE XREF: Parser_BuildHashIndex_588E8:loc_58934j
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
		jnz	short loc_58914
		lds	si, ss:[di+4]
		mov	es, word ptr ss:[di+arg_2+2]
		mov	cx, 0Fh

loc_58971:				; CODE XREF: Parser_BuildHashIndex_588E8+B4j
		mov	dx, 0FFFFh
		jmp	short loc_5898E
; ���������������������������������������������������������������������������

loc_58976:				; CODE XREF: Parser_BuildHashIndex_588E8+B1j
		mov	bx, cx
		shl	bx, 0Ah
		add	bx, dx
		shl	bx, 2
		add	bx, word ptr ss:[di+arg_2]
		mov	eax, es:[bx]
		mov	[si], eax
		add	si, 4

loc_5898E:				; CODE XREF: Parser_BuildHashIndex_588E8+8Cj
		inc	dx
		lea	bx, [bp+var_20]
		add	bx, cx
		add	bx, cx
		cmp	ss:[bx], dx
		jnz	short loc_58976
		dec	cx
		jns	short loc_58971
		add	[bp+var_22], 4
		cmp	[bp+var_22], 20h ; ' '
		jge	short loc_589AB
		jmp	loc_588F9
; ���������������������������������������������������������������������������

loc_589AB:				; CODE XREF: Parser_BuildHashIndex_588E8+BEj
		pop	fs
		pop	ds
		pop	di
		pop	si

locret_589B0:
		leave
		retf
Parser_BuildHashIndex_588E8	endp

seg118		ends
