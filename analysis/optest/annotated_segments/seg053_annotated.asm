seg053		segment	byte public 'CODE' use16
		assume cs:seg053
		;org 3
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si

loc_221AA:				; DATA XREF: seg170:026Eo
		mov	si, [bp+6]
		mov	ax, [bp+8]
		shl	ax, 2
		mov	[bp-2],	ax
		push	1
		push	0
		push	2
		movzx	eax, word ptr [bp-2]
		push	eax
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	[si+4],	dx
		mov	[si+2],	ax
		cmp	dword ptr [si+2], 0
		jnz	short loc_221E6
		push	0C017h
		call	sub_30D3
		add	sp, 2

loc_221E6:				; CODE XREF: seg053:0039j
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_221E9	proc far		; CODE XREF: sub_C39F6+DP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr sub_2233E
		add	sp, 2
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		mov	dword ptr [si+2], 0
		pop	si
		pop	bp
		retf
sub_221E9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_22219	proc far		; CODE XREF: seg053:0218p seg053:0268p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	word ptr [di], 0C8h ; '�'
		jge	short loc_22242
		les	bx, [di+2]
		mov	ax, [di]
		inc	word ptr [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, [bp+arg_4]
		mov	dx, [bp+arg_2]
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		jmp	short loc_2224D
; ���������������������������������������������������������������������������

loc_22242:				; CODE XREF: sub_22219+Cj
		push	0C018h
		call	sub_30D3
		add	sp, 2

loc_2224D:				; CODE XREF: sub_22219+27j
		pop	di
		pop	si
		pop	bp
		retf
sub_22219	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_22251	proc far		; CODE XREF: sub_C2650+61P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_2], 0
		cmp	[bp+arg_2], 0
		jz	short loc_222C0
		xor	cx, cx
		jmp	short loc_222BC
; ���������������������������������������������������������������������������

loc_2226B:				; CODE XREF: sub_22251+6Dj
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	ax, es:[bx]
		cmp	ax, [bp+arg_2]
		jnz	short loc_222BB
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0
		les	bx, [di+2]
		dec	word ptr [di]
		mov	ax, [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		les	bx, [di+2]
		mov	si, cx
		shl	si, 2
		add	bx, si
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		inc	[bp+var_2]
		jmp	short loc_222BC
; ���������������������������������������������������������������������������

loc_222BB:				; CODE XREF: sub_22251+2Dj
		inc	cx

loc_222BC:				; CODE XREF: sub_22251+18j
					; sub_22251+68j
		cmp	[di], cx
		jg	short loc_2226B

loc_222C0:				; CODE XREF: sub_22251+14j
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_22251	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_222CB	proc far		; CODE XREF: WeakRef_InvalidateIfSet+12p
					; WeakRef_InvalidateFar+16p

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_0]
		xor	cx, cx
		jmp	short loc_22330
; ���������������������������������������������������������������������������

loc_222D7:				; CODE XREF: sub_222CB+67j
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		cmp	ax, [bp+arg_4]
		jnz	short loc_2232F
		cmp	dx, [bp+arg_2]
		jnz	short loc_2232F
		les	bx, [di+2]
		mov	ax, cx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0
		les	bx, [di+2]
		dec	word ptr [di]
		mov	ax, [di]
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		les	bx, [di+2]
		mov	si, cx
		shl	si, 2
		add	bx, si
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		mov	ax, 1
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2232F:				; CODE XREF: sub_222CB+20j
					; sub_222CB+25j
		inc	cx

loc_22330:				; CODE XREF: sub_222CB+Aj
		cmp	[di], cx
		jg	short loc_222D7
		xor	ax, ax
		pop	di
		pop	si
		pop	bp
		retf
sub_222CB	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2233E	proc far		; CODE XREF: sub_221E9+Ap

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_2236F
; ���������������������������������������������������������������������������

loc_22349:				; CODE XREF: sub_2233E+33j
		les	bx, [si+2]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_2236E
		les	bx, [si+2]
		mov	ax, dx
		shl	ax, 2
		add	bx, ax
		les	bx, es:[bx]
		mov	word ptr es:[bx], 0

loc_2236E:				; CODE XREF: sub_2233E+1Cj
		inc	dx

loc_2236F:				; CODE XREF: sub_2233E+9j
		cmp	[si], dx
		jg	short loc_22349
		mov	word ptr [si], 0
		pop	si
		pop	bp
		retf
sub_2233E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeakRef_InvalidateIfSet (sub_3A3EC de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,23L — si le
; champ référencé est non nul, l'invalide via sub_3A343 : wrapper d'invalidation
; conditionnelle d'une référence faible.
; ==============================================================================================
WeakRef_InvalidateIfSet	proc far		; CODE XREF: seg053:0206p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_22396
		push	ds
		push	si
		push	6363h
		push	cs
		call	near ptr sub_222CB
		add	sp, 6
		mov	word ptr [si], 0

loc_22396:				; CODE XREF: WeakRef_InvalidateIfSet+Aj
		pop	si
		pop	bp
		retf
WeakRef_InvalidateIfSet	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	si
		push	cs
		call	near ptr WeakRef_InvalidateIfSet
		add	sp, 2
		mov	[si], di
		or	di, di
		jz	short loc_223BE
		push	ds
		push	si
		push	6363h
		push	cs
		call	near ptr sub_22219
		add	sp, 6

loc_223BE:				; CODE XREF: seg053:0210j
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WeakRef_InvalidateFar (sub_3A432 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,20L — invalide
; une référence 32-bit existante si non nulle (appelle sub_3A343) : désenregistrement d'une
; référence faible far avant réassignation (utilisé par SetReference).
; ==============================================================================================
WeakRef_InvalidateFar	proc far		; CODE XREF: seg053:024Ep

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 0
		jz	short loc_223DE
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	6363h
		push	cs
		call	near ptr sub_222CB
		add	sp, 6

loc_223DE:				; CODE XREF: WeakRef_InvalidateFar+Aj
		pop	bp
		retf
WeakRef_InvalidateFar	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+0Ah]
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	cs
		call	near ptr WeakRef_InvalidateFar
		add	sp, 4
		les	bx, [bp+6]
		mov	es:[bx], si
		or	si, si
		jz	short loc_2240E
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	6363h
		push	cs
		call	near ptr sub_22219
		add	sp, 6

loc_2240E:				; CODE XREF: seg053:025Cj
		pop	si
		pop	bp
		retf
seg053		ends
