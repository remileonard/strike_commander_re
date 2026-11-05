seg113		segment	para public 'CODE' use16
		assume cs:seg113
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_47BC3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	word ptr [di], 0
		jnz	short loc_47BD4

loc_47BD0:
		mov	al, 0
		jmp	short loc_47BFA

loc_47BD4:
		xor	cx, cx
		jmp	short loc_47BF3

loc_47BD8:
		mov	ax, cx
		shl	ax, 1
		mov	bx, [di]
		add	bx, ax
		mov	dx, [bp+arg_2]
		inc	dx
		mov	ax, cx
		imul	dx
		mov	si, [di]
		mov	dx, [si]
		add	dx, ax
		cmp	[bx], dx
		jnz	short loc_47BD0
		inc	cx

loc_47BF3:
		cmp	cx, [bp+arg_4]
		jb	short loc_47BD8
		mov	al, 1

loc_47BFA:
		pop	di
		pop	si
		pop	bp
		retf
sub_47BC3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; TextFormat_RebuildLinearTable_5E66E (sub_5E66E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, réalloue (libère l'ancienne via sub_338,
; alloue la nouvelle via sub_658) et remplit une table avec une progression arithmétique
; (valeur = index×pas + décalage). Référencée par TextFormat_ResolveStyleEntry_5E4C8 (seg143)
; — génère une table d'index de style/attribut de texte.
; ==============================================================================================
TextFormat_RebuildLinearTable_47BFE		proc far

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
		jz	short loc_47C16
		push	word ptr [si]
		call	sub_33B
		pop	cx

loc_47C16:
		mov	ax, di
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si], ax
		cmp	word ptr [si], 0
		jz	short loc_47C49
		xor	cx, cx
		jmp	short loc_47C41

loc_47C2C:
		mov	ax, cx
		shl	ax, 1
		mov	bx, [si]
		add	bx, ax
		mov	ax, cx
		imul	[bp+arg_2]
		mov	dx, [bp+arg_6]
		add	dx, ax
		mov	[bx], dx
		inc	cx

loc_47C41:
		cmp	cx, di
		jb	short loc_47C2C
		mov	al, 1
		jmp	short loc_47C4B

loc_47C49:
		mov	al, 0

loc_47C4B:
		pop	di
		pop	si
		pop	bp
		retf
TextFormat_RebuildLinearTable_47BFE		endp

; START OF FUNCTION CHUNK FOR TextFormat_RebuildLinearTable_47BFE
		db 0
; END OF FUNCTION CHUNK FOR TextFormat_RebuildLinearTable_47BFE
seg113		ends
