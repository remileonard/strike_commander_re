seg145		segment	byte public 'CODE' use16
		assume cs:seg145
		;org 3
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
		push	bp

loc_5E634:
		mov	bp, sp
		push	si
		push	di

loc_5E638:
		mov	di, [bp+6]

; ==============================================================================================
; far, référencée via vtable (DATA XREF seg216) — vérifie qu'une table de mots correspond à
; une progression arithmétique (pas = arg+1).
; ==============================================================================================
TextFormat_ValidateLinearTable_5E63B:				; DATA XREF: seg216:054Eo
		cmp	word ptr [di], 0
		jnz	short loc_5E644

loc_5E640:				; CODE XREF: seg145:0030j
		mov	al, 0

loc_5E642:
		jmp	short loc_5E66A
; ���������������������������������������������������������������������������

loc_5E644:				; CODE XREF: seg145:000Ej
		xor	cx, cx

loc_5E646:
		jmp	short loc_5E663
; ���������������������������������������������������������������������������

loc_5E648:				; CODE XREF: seg145:0036j
		mov	ax, cx
		shl	ax, 1
		mov	bx, [di]
		add	bx, ax

loc_5E650:
		mov	dx, [bp+8]
		inc	dx
		mov	ax, cx
		imul	dx
		mov	si, [di]
		mov	dx, [si]
		add	dx, ax
		cmp	[bx], dx
		jnz	short loc_5E640
		inc	cx

loc_5E663:				; CODE XREF: seg145:loc_5E646j
		cmp	cx, [bp+0Ah]
		jb	short loc_5E648
		mov	al, 1

loc_5E66A:				; CODE XREF: seg145:loc_5E642j
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, réalloue (libère l'ancienne via sub_338, alloue la nouvelle via sub_658) et remplit une
; table avec une progression arithmétique (valeur = index×pas + décalage). Référencée par
; TextFormat_ResolveStyleEntry_5E4C8 (seg143) — génère une table d'index de style/attribut de
; texte.
; ==============================================================================================
TextFormat_RebuildLinearTable_5E66E	proc far		; CODE XREF: TextFormat_ResolveStyleEntry_5E4C8+3FP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		cmp	word ptr [si], 0
		jz	short loc_5E686
		push	word ptr [si]
		call	CRT_FreeNear_Wrap
		pop	cx

loc_5E686:				; CODE XREF: TextFormat_RebuildLinearTable_5E66E+Ej
		mov	ax, di
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si], ax
		cmp	word ptr [si], 0
		jz	short loc_5E6B9
		xor	cx, cx
		jmp	short loc_5E6B1
; ���������������������������������������������������������������������������

loc_5E69C:				; CODE XREF: TextFormat_RebuildLinearTable_5E66E+45j
		mov	ax, cx
		shl	ax, 1
		mov	bx, [si]
		add	bx, ax
		mov	ax, cx
		imul	[bp+arg_2]
		mov	dx, [bp+arg_6]
		add	dx, ax
		mov	[bx], dx

loc_5E6B0:
		inc	cx

loc_5E6B1:				; CODE XREF: TextFormat_RebuildLinearTable_5E66E+2Cj
		cmp	cx, di
		jb	short loc_5E69C
		mov	al, 1
		jmp	short loc_5E6BB
; ���������������������������������������������������������������������������

loc_5E6B9:				; CODE XREF: TextFormat_RebuildLinearTable_5E66E+28j
		mov	al, 0

loc_5E6BB:				; CODE XREF: TextFormat_RebuildLinearTable_5E66E+49j
		pop	di
		pop	si
		pop	bp
		retf
TextFormat_RebuildLinearTable_5E66E	endp

seg145		ends
