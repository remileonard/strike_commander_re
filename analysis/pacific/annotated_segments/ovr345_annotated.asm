ovr345		segment	para public 'OVERLAY' use16
		assume cs:ovr345
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEA50		proc far

var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 2
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	large 20h
		push	ax
		push	dx
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 22h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_C], eax
		les	bx, [bp+var_8]
		mov	es:[bx], eax
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_8]
		add	dx, 4
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_14], eax
		les	bx, [bp+var_10]
		mov	es:[bx], eax
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_8]
		add	dx, 8
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_1C], eax
		les	bx, [bp+var_18]
		mov	es:[bx], eax
		pop	si
		leave
		retf
sub_BEA50		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEAE9		proc far

var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_BEB18
		push	1
		push	0
		push	2
		push	large 32h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_BEB5C

loc_BEB18:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3565h
		mov	word ptr es:[bx], 355Dh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Eh
		push	si
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_BEA50
		add	sp, 6
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Eh
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		les	bx, [bp+var_4]
		mov	es:[bx], eax

loc_BEB5C:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_BEAE9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEB65		proc far

var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_BEB97
		push	1
		push	0
		push	2
		push	large 42h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_BEB97
		jmp	loc_BEC87

loc_BEB97:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3565h
		mov	word ptr es:[bx], 3555h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Eh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 32h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 36h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 3Ah
		mov	ax, word ptr [bp+arg_0]
		add	ax, 3Eh
		push	si
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_BEA50
		add	sp, 6
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Eh
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		les	bx, [bp+var_4]
		mov	es:[bx], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 32h
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_10], eax
		les	bx, [bp+var_C]
		mov	es:[bx], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 36h
		mov	[bp+var_12], ax
		mov	[bp+var_14], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_18], eax
		les	bx, [bp+var_14]
		mov	es:[bx], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 3Ah
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_20], eax
		les	bx, [bp+var_1C]
		mov	es:[bx], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 3Eh
		mov	[bp+var_22], ax
		mov	[bp+var_24], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_28], eax
		les	bx, [bp+var_24]
		mov	es:[bx], eax

loc_BEC87:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_BEB65		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEC90		proc far

var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_BECBF
		push	1
		push	0
		push	2
		push	large 36h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_BED2E

loc_BECBF:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 3565h
		mov	word ptr es:[bx], 354Dh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Eh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 32h
		push	si
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_BEA50
		add	sp, 6
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Eh
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		les	bx, [bp+var_4]
		mov	es:[bx], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 32h
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_10], eax
		les	bx, [bp+var_C]
		mov	es:[bx], eax

loc_BED2E:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_BEC90		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BED37		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf
sub_BED37		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BED4A		proc far

var_E		= dword ptr -0Eh
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	di
		push	cs
		call	near ptr sub_BED37
		pop	cx
		mov	bx, [bp+arg_2]
		mov	eax, [bx+65h]
		mov	[bx+0A8h], eax
		mov	[bp+var_2], 0
		jmp	short loc_BEDB0

loc_BED6E:
		push	[bp+arg_2]
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		cmp	ax, 42h
		jz	short loc_BED90
		cmp	ax, 43h
		jz	short loc_BED9A
		cmp	ax, 53h
		jnz	short loc_BEDA7
		mov	bx, [bp+arg_2]
		add	dword ptr [bx+65h], 30h
		jmp	short loc_BEDA2

loc_BED90:
		mov	bx, [bp+arg_2]
		add	dword ptr [bx+65h], 40h
		jmp	short loc_BEDA2

loc_BED9A:
		mov	bx, [bp+arg_2]
		add	dword ptr [bx+65h], 34h

loc_BEDA2:
		inc	[bp+var_2]
		jmp	short loc_BEDB0

loc_BEDA7:
		push	900Dh
		call	sub_1DDFE
		pop	cx

loc_BEDB0:
		mov	bx, [bp+arg_2]
		test	word ptr [bx+72h], 1
		jz	short loc_BEDCF
		mov	si, [bp+arg_2]
		mov	eax, [si+76h]
		dec	eax
		cmp	[bx+65h], eax
		jnz	short loc_BEDCF
		inc	dword ptr [bx+65h]
		jmp	short loc_BEDCF

loc_BEDCF:
		mov	bx, [bp+arg_2]
		mov	eax, [bx+65h]
		cmp	eax, [bx+76h]
		jl	short loc_BEDE1
		mov	ax, 1
		jmp	short loc_BEDE3

loc_BEDE1:
		xor	ax, ax

loc_BEDE3:
		or	ax, ax
		jz	short loc_BED6E
		mov	bx, [bp+arg_2]
		mov	eax, [bx+0A8h]
		mov	[bx+65h], eax
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		shl	ax, 2
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[di+2], ax
		cmp	word ptr [di+2], 0
		jz	short loc_BEE11
		mov	ax, 1
		jmp	short loc_BEE13

loc_BEE11:
		xor	ax, ax

loc_BEE13:
		or	ax, ax
		jz	short loc_BEE1A
		jmp	loc_BEEBC

loc_BEE1A:
		push	900Eh
		jmp	loc_BEEB6

loc_BEE20:
		mov	[bp+var_8], 0
		push	[bp+arg_2]
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_9], al
		cbw
		cmp	ax, 42h
		jz	short loc_BEE59
		cmp	ax, 43h
		jz	short loc_BEE65
		cmp	ax, 53h
		jnz	short loc_BEE71
		push	[bp+arg_2]
		push	large 0
		push	cs
		call	near ptr sub_BEAE9

loc_BEE4E:
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		jmp	short loc_BEE7A

loc_BEE59:
		push	[bp+arg_2]
		push	large 0
		push	cs
		call	near ptr sub_BEB65
		jmp	short loc_BEE4E

loc_BEE65:
		push	[bp+arg_2]
		push	large 0
		push	cs
		call	near ptr sub_BEC90
		jmp	short loc_BEE4E

loc_BEE71:
		push	900Fh
		call	sub_1DDFE
		pop	cx

loc_BEE7A:
		mov	eax, [bp+var_8]
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 0
		jz	short loc_BEE8E
		mov	ax, 1
		jmp	short loc_BEE90

loc_BEE8E:
		xor	ax, ax

loc_BEE90:
		mov	cx, ax
		or	cx, cx
		jz	short loc_BEEAF
		mov	ax, [di]
		inc	word ptr [di]
		shl	ax, 2
		mov	bx, [di+2]
		add	bx, ax
		mov	ax, word ptr [bp+var_E+2]
		mov	dx, word ptr [bp+var_E]
		mov	[bx+2], ax
		mov	[bx], dx
		jmp	short loc_BEEAF

loc_BEEAF:
		or	cx, cx
		jnz	short loc_BEEBC
		push	9031h

loc_BEEB6:
		call	sub_1DDFE
		pop	cx

loc_BEEBC:
		mov	bx, [bp+arg_2]
		test	word ptr [bx+72h], 1
		jz	short loc_BEEDB
		mov	si, [bp+arg_2]
		mov	eax, [si+76h]
		dec	eax
		cmp	[bx+65h], eax
		jnz	short loc_BEEDB
		inc	dword ptr [bx+65h]
		jmp	short loc_BEEDB

loc_BEEDB:
		mov	bx, [bp+arg_2]
		mov	eax, [bx+65h]
		cmp	eax, [bx+76h]
		jl	short loc_BEEED
		mov	ax, 1
		jmp	short loc_BEEEF

loc_BEEED:
		xor	ax, ax

loc_BEEEF:
		or	ax, ax
		jnz	short loc_BEEF6
		jmp	loc_BEE20

loc_BEEF6:
		pop	di
		pop	si
		leave
		retf
sub_BED4A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ExprSlot_ReleaseArray_A98EC (sub_A98EC de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, parcourt un
; tableau de slots (stride 4 octets, tag 5C44h) et libère chaque entrée
; (Memory_TypedFree_5C7B6), les remet à zéro.
; ==============================================================================================
ExprSlot_ReleaseArray_BEEFA		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_BEF60
		xor	di, di
		jmp	short loc_BEF4A

loc_BEF0E:
		mov	ax, di
		shl	ax, 2
		mov	bx, [si+2]
		add	bx, ax
		mov	ax, [bx+2]
		mov	dx, [bx]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	0
		push	2
		lea	ax, [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	ax, di
		shl	ax, 2
		mov	bx, [si+2]
		add	bx, ax
		mov	word ptr [bx+2], 0
		mov	word ptr [bx], 0
		inc	di

loc_BEF4A:
		cmp	[si], di
		jg	short loc_BEF0E
		push	word ptr [si+2]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+2], 0
		mov	word ptr [si], 0

loc_BEF60:
		pop	di
		pop	si
		leave
		retf
ExprSlot_ReleaseArray_BEEFA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BEF64		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	word ptr [si], 0
		mov	dword ptr [si+2], 0
		mov	ax, [di+72h]
		mov	bx, 9
		xor	dx, dx
		div	bx
		mov	[si], ax
		push	1
		push	0
		push	2
		push	large [di+72h]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+4], dx
		mov	[si+2], ax
		cmp	dword ptr [si+2], 0
		jnz	short loc_BEFB5
		push	9032h
		call	sub_1DDFE
		pop	cx

loc_BEFB5:
		push	large [si+2]
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		mov	eax, [si+2]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	loc_BF057

loc_BEFCF:
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx], 4D414554h
		jnz	short loc_BF052
		mov	al, es:[bx+4]
		cbw
		add	ax, 0FFD0h
		mov	dx, ax
		mov	al, byte_79BF4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BF012
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		push	8
		push	ds
		push	offset aBILLY
		push	large [bp+var_C]
		call	sub_39E1
		add	sp, 0Ah
		les	bx, word ptr [bp+var_C]
		jmp	short loc_BF04D

loc_BF012:
		cmp	dx, 3
		jnb	short loc_BF052
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	ax, dx
		imul	ax, ax, 9
		mov	dx, word_79B8C
		add	dx, ax
		add	dx, 9Fh
		mov	[bp+var_16], ds
		mov	[bp+var_18], dx
		push	8
		push	[bp+var_16]
		push	dx
		push	large [bp+var_14]
		call	sub_39E1
		add	sp, 0Ah
		les	bx, word ptr [bp+var_14]

loc_BF04D:
		mov	byte ptr es:[bx+8], 0

loc_BF052:
		inc	di
		add	word ptr [bp+var_4], 9

loc_BF057:
		cmp	[si], di
		jle	short loc_BF05E
		jmp	loc_BEFCF

loc_BF05E:
		pop	di
		pop	si
		leave
		retf
sub_BEF64		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ExprSlot_ReleaseSingle_A9A44 (sub_A9A44 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; libère un slot (Memory_TypedFree_5C7B6).
; ==============================================================================================
ExprSlot_ReleaseSingle_BF062		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+2], 0
		jz	short loc_BF096
		cmp	word ptr [si], 0
		jz	short loc_BF096
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword ptr [si+2], 0
		mov	word ptr [si], 0

loc_BF096:
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseSingle_BF062		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionScenario_DecodeFieldA_A9B14 (sub_A9B14 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 121 lignes, NON DÉTAILLÉE — combine sub_2EA5, sub_2B6D (décodage), sub_2E3C — probable
; décodage d'un champ compressé/codé du scénario de mission.
; ==============================================================================================
MissionScenario_DecodeFieldA_BF099		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= byte ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		push	large [bp+arg_2]
		call	sub_3B1D
		add	sp, 4
		push	8
		push	3542h
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_4], 0
		les	bx, word ptr [bp+arg_2]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_C]
		jnz	short loc_BF0E7
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_8]
		jnz	short loc_BF0E7
		mov	ax, 1
		jmp	short loc_BF0E9

loc_BF0E7:
		xor	ax, ax

loc_BF0E9:
		or	al, al
		jz	short loc_BF0F5
		mov	ax, [bp+arg_6]
		mov	[bp+var_2], ax
		jmp	short loc_BF156

loc_BF0F5:
		xor	di, di
		jmp	short loc_BF152

loc_BF0F9:
		mov	eax, [bp+arg_2]
		mov	[bp+var_10], eax
		push	8
		push	large [bp+var_10]
		mov	ax, [si+22h]
		mov	dx, di
		imul	dx, dx, 9
		add	ax, dx
		push	word ptr [si+24h]
		push	ax
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_BF126
		mov	ax, 1
		jmp	short loc_BF128

loc_BF126:
		xor	ax, ax

loc_BF128:
		or	al, al
		jz	short loc_BF151
		mov	ax, [bp+arg_6]
		mov	[bp+var_2], ax
		mov	bx, di
		shl	bx, 1
		mov	ax, [bx+si+2]
		cmp	ax, [bp+arg_6]
		jge	short loc_BF145
		mov	bx, di
		shl	bx, 1
		mov	[bp+var_2], ax

loc_BF145:
		mov	bx, di
		shl	bx, 1
		mov	ax, [bp+var_2]
		sub	[bx+si+2], ax
		jmp	short loc_BF156

loc_BF151:
		inc	di

loc_BF152:
		cmp	[si], di
		jg	short loc_BF0F9

loc_BF156:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
MissionScenario_DecodeFieldA_BF099		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionScenario_DecodeFieldB_A9BD8 (sub_A9BD8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 139 lignes, NON DÉTAILLÉE — variante de MissionScenario_DecodeFieldA_A9B14 avec sub_2E74
; additionnel.
; ==============================================================================================
MissionScenario_DecodeFieldB_BF15D		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	di, [bp+arg_0]
		cmp	[bp+arg_6], 0
		jnz	short loc_BF171
		jmp	loc_BF244

loc_BF171:
		push	8
		push	3542h
		lea	ax, word ptr [bp+var_A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_2], 0
		push	large [bp+arg_2]
		call	sub_3B1D
		add	sp, 4
		les	bx, word ptr [bp+arg_2]
		mov	eax, es:[bx]
		cmp	eax, [bp+var_A]
		jnz	short loc_BF1AF
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_6]
		jnz	short loc_BF1AF
		mov	ax, 1
		jmp	short loc_BF1B1

loc_BF1AF:
		xor	ax, ax

loc_BF1B1:
		or	al, al
		jz	short loc_BF1B8
		jmp	loc_BF244

loc_BF1B8:
		xor	si, si
		jmp	short loc_BF1FC

loc_BF1BC:
		mov	eax, [bp+arg_2]
		mov	[bp+var_12], eax
		push	8
		push	large [bp+var_12]
		mov	ax, [di+22h]
		mov	dx, si
		imul	dx, dx, 9
		add	ax, dx
		push	word ptr [di+24h]
		push	ax
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_BF1E9
		mov	ax, 1
		jmp	short loc_BF1EB

loc_BF1E9:
		xor	ax, ax

loc_BF1EB:
		or	al, al
		jz	short loc_BF1FB
		mov	bx, si
		shl	bx, 1
		mov	ax, [bp+arg_6]
		add	[bx+di+2], ax
		jmp	short loc_BF244

loc_BF1FB:
		inc	si

loc_BF1FC:
		cmp	[di], si
		jg	short loc_BF1BC
		cmp	word ptr [di], 10h
		jge	short loc_BF244
		mov	eax, [bp+arg_2]
		mov	[bp+var_E], eax
		push	8
		push	large [bp+var_E]
		mov	ax, [di+22h]
		mov	dx, [di]
		imul	dx, dx, 9
		add	ax, dx
		push	word ptr [di+24h]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		les	bx, [di+22h]
		mov	ax, [di]
		imul	ax, ax, 9
		add	bx, ax
		mov	byte ptr es:[bx+8], 0
		mov	bx, [di]
		shl	bx, 1
		mov	ax, [bp+arg_6]
		mov	[bx+di+2], ax
		inc	word ptr [di]

loc_BF244:
		pop	di
		pop	si
		leave
		retf
MissionScenario_DecodeFieldB_BF15D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionScenario_LoadAndDecodeField_A9CC3 (sub_A9CC3 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 95 lignes, NON DÉTAILLÉE — combine ResourceRecord_SeekAndRead_64743, sub_2AFB5,
; ReadFieldGroupB_64A54, sub_2AFE0, MissionScenario_DecodeFieldB_A9BD8.
; ==============================================================================================
MissionScenario_LoadAndDecodeField_BF248		proc far

var_C		= word ptr -0Ch
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	0
		push	large 534E5057h
		push	[bp+arg_2]
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_BF2E7
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		jmp	short loc_BF2A1

loc_BF276:
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		mov	[bp+var_2], ax
		push	[bp+arg_2]
		lea	ax, [bp+var_C]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		push	[bp+var_2]
		push	ds
		lea	ax, [bp+var_C]
		push	ax
		push	di
		push	cs
		call	near ptr MissionScenario_DecodeFieldB_BF15D
		add	sp, 8

loc_BF2A1:
		mov	bx, [bp+arg_2]
		test	word ptr [bx+72h], 1
		jz	short loc_BF2C0
		mov	si, [bp+arg_2]
		mov	eax, [si+76h]
		dec	eax
		cmp	[bx+65h], eax
		jnz	short loc_BF2C0
		inc	dword ptr [bx+65h]
		jmp	short loc_BF2C0

loc_BF2C0:
		mov	bx, [bp+arg_2]
		mov	eax, [bx+65h]
		cmp	eax, [bx+76h]
		jl	short loc_BF2D2
		mov	ax, 1
		jmp	short loc_BF2D4

loc_BF2D2:
		xor	ax, ax

loc_BF2D4:
		or	ax, ax
		jz	short loc_BF276
		mov	bx, [bp+arg_2]
		mov	eax, [bx+76h]
		mov	[bx+65h], eax
		mov	byte ptr [bx+6Dh], 0

loc_BF2E7:
		pop	di
		pop	si
		leave
		retf
MissionScenario_LoadAndDecodeField_BF248		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ExprSlot_WriteFieldGroup_A9D66 (sub_A9D66 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine ResourceRecord_WriteFieldGroupA_64E50, StreamReader_WriteTyped_6568F (×2, seg195),
; ResourceRecord_WriteFieldWrapper_64FD8 (seg194) — écriture de champs pour le système de
; slots d'expression.
; ==============================================================================================
ExprSlot_WriteFieldGroup_BF2EB		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	large 0
		push	large 534E5057h
		push	di
		call	sub_766B5
		add	sp, 0Ah
		mov	[bp+var_2], 0
		jmp	short loc_BF370

loc_BF312:
		mov	bx, [bp+var_2]
		shl	bx, 1
		cmp	word ptr [bx+si+2], 0
		jz	short loc_BF36D
		mov	bx, [bp+var_2]
		shl	bx, 1
		mov	ax, [bx+si+2]
		mov	[bp+var_4], ax
		push	large [di+65h]
		push	large 2
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	di
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	dword ptr [di+65h], 2
		mov	ax, [si+24h]
		mov	dx, [si+22h]
		mov	bx, [bp+var_2]
		imul	bx, bx, 9
		add	dx, bx
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		push	large [di+65h]
		push	large 8
		push	ax
		push	dx
		push	di
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	dword ptr [di+65h], 8

loc_BF36D:
		inc	[bp+var_2]

loc_BF370:
		mov	ax, [si]
		cmp	ax, [bp+var_2]
		jg	short loc_BF312
		push	di
		call	sub_766D3
		pop	cx
		pop	di
		pop	si
		leave
		retf
ExprSlot_WriteFieldGroup_BF2EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF382		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	0
		mov	ax, [bp+arg_0]
		add	ax, 44h
		push	[bp+arg_2]
		push	ax
		call	sub_39519
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+32h], 0FFh
		mov	dword ptr es:[bx+3Ah], 0
		and	byte ptr es:[bx+39h], 0FEh
		and	byte ptr es:[bx+39h], 0FDh
		and	byte ptr es:[bx+39h], 0FBh
		and	byte ptr es:[bx+39h], 0F7h
		and	byte ptr es:[bx+39h], 0EFh
		and	byte ptr es:[bx+39h], 0DFh
		mov	word ptr es:[bx+56h], 0
		mov	byte ptr es:[bx+58h], 0FFh
		pop	bp
		retf
sub_BF382		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF3D5		proc far

var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_40		= word ptr -40h
var_38		= word ptr -38h
var_30		= word ptr -30h
var_2E		= byte ptr -2Eh
var_2D		= dword ptr -2Dh
var_29		= dword ptr -29h
var_25		= dword ptr -25h
var_21		= word ptr -21h
var_1F		= word ptr -1Fh
var_1D		= byte ptr -1Dh
var_1C		= byte ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4Ah
		push	si
		mov	si, word_79B8C
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_BF382
		add	sp, 4
		push	large 3Eh
		push	ss
		lea	ax, [bp+var_4A]
		push	ax
		push	[bp+arg_4]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	al, byte ptr [bp+var_4A]
		mov	es:[bx+1Bh], al
		push	8
		push	ss
		lea	ax, [bp+var_48]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_39E1
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+8], 0
		push	8
		push	ss
		lea	ax, [bp+var_40]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 9
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+11h], 0
		push	8
		push	ss
		lea	ax, [bp+var_38]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 12h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+1Ah], 0
		push	[bp+var_30]
		mov	ax, si
		add	ax, 1Ah
		push	ax
		call	PtrList_GetAt_54919
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Fh], dx
		mov	es:[bx+1Dh], ax
		mov	al, [bp+var_2E]
		mov	es:[bx+1Ch], al
		mov	eax, [bp+var_2D]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+21h], eax
		mov	eax, [bp+var_29]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	es:[bx+25h], eax
		mov	eax, [bp+var_25]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+29h], eax
		mov	ax, [bp+var_21]
		mov	es:[bx+2Dh], ax
		mov	ax, [bp+var_1F]
		mov	es:[bx+2Fh], ax
		mov	al, [bp+var_1D]
		mov	es:[bx+31h], al
		mov	al, [bp+var_1C]
		mov	es:[bx+32h], al
		mov	ax, [bp+var_1A]
		mov	es:[bx+33h], ax
		mov	ax, [bp+var_18]
		mov	es:[bx+35h], ax
		mov	ax, [bp+var_16]
		mov	es:[bx+37h], ax
		push	[bp+var_14]
		mov	ax, si
		add	ax, 40h
		push	ax
		call	Expr_LookupNamedValue_530A7
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+48h], dx
		mov	es:[bx+46h], ax
		push	[bp+var_12]
		mov	ax, si
		add	ax, 40h
		push	ax
		call	Expr_LookupNamedValue_530A7
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Ch], dx
		mov	es:[bx+4Ah], ax
		push	[bp+var_10]
		mov	ax, si
		add	ax, 40h
		push	ax
		call	Expr_LookupNamedValue_530A7
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+50h], dx
		mov	es:[bx+4Eh], ax
		push	[bp+var_E]
		mov	ax, si
		add	ax, 40h
		push	ax
		call	Expr_LookupNamedValue_530A7
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+54h], dx
		mov	es:[bx+52h], ax
		xor	ax, ax
		mov	es:[bx+40h], ax
		mov	es:[bx+3Eh], ax
		mov	es:[bx+42h], ax
		pop	si
		leave
		retf
sub_BF3D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 9 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionScenario_DispatchDecodeA_A9FD0 (sub_A9FD0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; référencée via jmp depuis des stubs VROOMM (sub_6C3EE/6C3E9), appelle
; MissionScenario_DecodeFieldA_A9B14.
; ==============================================================================================
MissionScenario_DispatchDecodeA_BF56D		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+56h], 0
		jz	short loc_BF5E5
		mov	si, es:[bx+56h]
		mov	eax, [si+5Fh]
		mov	[bp+var_4], eax
		les	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+14h]
		mov	[bp+var_8], eax
		push	word ptr [bp+var_4+2]
		push	bx
		call	sub_74539
		add	sp, 4
		xor	si, si
		jmp	short loc_BF5D0

loc_BF5A6:
		les	bx, word ptr [bp+var_8]
		mov	dx, es:[bx+10h]
		push	dx
		mov	ax, word ptr [bp+var_8]
		add	ax, 4
		push	word ptr [bp+var_8+2]
		push	ax
		push	[bp+arg_4]
		push	cs
		call	near ptr MissionScenario_DecodeFieldA_BF099
		add	sp, 8
		mov	dx, ax
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+10h], dx
		inc	si
		add	word ptr [bp+var_8], 13h

loc_BF5D0:
		les	bx, word ptr [bp+var_4]
		cmp	es:[bx+24h], si
		jg	short loc_BF5A6
		push	word ptr [bp+var_4+2]
		push	bx
		call	sub_74534
		add	sp, 4

loc_BF5E5:
		pop	si
		leave
		retf
MissionScenario_DispatchDecodeA_BF56D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF5E8		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		les	bx, [bp+arg_0]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_BF661
		cmp	word ptr es:[bx+56h], 0
		jz	short loc_BF661
		mov	bx, es:[bx+56h]
		mov	ax, [bx+61h]
		mov	dx, [bx+5Fh]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		xor	si, si
		jmp	short loc_BF636

loc_BF61B:
		les	bx, [bp+var_8]
		push	word ptr es:[bx+13h]
		mov	ax, [bp+var_8]
		add	ax, 1Ah
		push	[bp+var_6]
		push	ax
		push	[bp+arg_4]
		push	cs
		call	near ptr MissionScenario_DecodeFieldB_BF15D
		add	sp, 8

loc_BF636:
		mov	cx, si
		inc	si
		les	bx, [bp+var_4]
		cmp	es:[bx+34h], cx
		jle	short loc_BF653
		mov	dx, es:[bx+2Eh]
		mov	ax, es:[bx+2Ch]
		mov	bx, cx
		imul	bx, bx, 27h
		add	ax, bx
		jmp	short loc_BF657

loc_BF653:
		xor	dx, dx
		xor	ax, ax

loc_BF657:
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		or	ax, dx
		jnz	short loc_BF61B

loc_BF661:
		pop	si
		leave
		retf
sub_BF5E8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionScenario_DispatchWrapper_AA0C7 (sub_AA0C7 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; référencée via jmp depuis un stub VROOMM (sub_6C3D5).
; ==============================================================================================
MissionScenario_DispatchWrapper_BF664		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+56h], 0
		jz	short loc_BF676
		mov	ax, 1
		jmp	short loc_BF678

loc_BF676:
		xor	ax, ax

loc_BF678:
		or	ax, ax
		jz	short loc_BF692
		push	[bp+arg_4]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+56h]
		push	large [bx+5Fh]
		call	sub_74520
		add	sp, 6

loc_BF692:
		pop	bp
		retf
MissionScenario_DispatchWrapper_BF664		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF694		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		mov	dword ptr [si+2], 0
		pop	si
		pop	bp
		retf
sub_BF694		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF6AA		proc far

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
		call	near ptr sub_BF694
		pop	cx
		cmp	dword ptr [di+72h], 0
		jz	short loc_BF724
		push	1
		push	0
		push	2
		push	large [di+72h]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+4], dx
		mov	[si+2], ax
		cmp	dword ptr [si+2], 0
		jnz	short loc_BF6ED
		push	9034h
		call	sub_1DDFE
		pop	cx

loc_BF6ED:
		push	large [si+2]
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		xor	dx, dx
		jmp	short loc_BF71A

loc_BF6FE:
		les	bx, [si+2]
		mov	ax, dx
		inc	dx
		add	bx, ax
		cmp	byte ptr es:[bx], 0
		jnz	short loc_BF710
		inc	word ptr [si]
		jmp	short loc_BF71A

loc_BF710:
		movsx	eax, dx
		cmp	eax, [di+72h]
		jl	short loc_BF6FE

loc_BF71A:
		movsx	eax, dx
		cmp	eax, [di+72h]
		jl	short loc_BF710

loc_BF724:
		pop	di
		pop	si
		pop	bp
		retf
sub_BF6AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF728		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_BF755
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword ptr [si+2], 0
		mov	word ptr [si], 0

loc_BF755:
		pop	si
		pop	bp
		retf
sub_BF728		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF758		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		pop	si
		pop	bp
		retf
sub_BF758		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF76B		proc far

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
		call	near ptr sub_BF758
		pop	cx
		mov	eax, [di+72h]
		mov	ebx, 4
		cdq
		idiv	ebx
		mov	[si], ax
		cmp	word ptr [si], 0
		jz	short loc_BF7BD
		mov	ax, [si]
		shl	ax, 2
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+2], ax
		cmp	word ptr [si+2], 0
		jnz	short loc_BF7B0
		push	9035h
		call	sub_1DDFE
		pop	cx

loc_BF7B0:
		push	ds
		push	word ptr [si+2]
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6

loc_BF7BD:
		pop	di
		pop	si
		pop	bp
		retf
sub_BF76B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Member_ClearAndFree_2F278 (sub_2F278 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à Member_ClearAndFree_5EA03
; (sub_5EA03 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée via vtable et dans des dizaines de segments — libère (sub_338) un
; pointeur membre s'il est posé, puis remet à zéro deux champs (pointeur + taille/longueur).
; Motif « clear/reset » d'un membre géré, PAS un constructeur de sous-objet comme précédemment
; supposé dans plusieurs segments — à garder en tête pour la relecture de ces entrées si
; besoin.
; ==============================================================================================
Member_ClearAndFree_BF7C1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2], 0
		jz	short loc_BF7E0
		push	word ptr [si+2]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+2], 0
		mov	word ptr [si], 0

loc_BF7E0:
		pop	si
		pop	bp
		retf
Member_ClearAndFree_BF7C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF7E3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		mov	dword ptr [si+2], 0
		pop	si
		pop	bp
		retf
sub_BF7E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF7F9		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_BF7E3
		pop	cx
		mov	ax, [di+72h]
		mov	bx, 3Eh
		xor	dx, dx
		div	bx
		mov	[si], ax
		mov	ax, [si]
		imul	ax, ax, 3Eh
		movzx	eax, ax
		cmp	eax, [di+72h]
		jz	short loc_BF831
		push	9036h
		call	sub_1DDFE
		pop	cx

loc_BF831:
		push	1
		push	0
		push	2
		mov	ax, [si]
		imul	ax, ax, 59h
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+4], dx
		mov	[si+2], ax
		cmp	dword ptr [si+2], 0
		jnz	short loc_BF863
		push	9010h
		call	sub_1DDFE
		pop	cx

loc_BF863:
		mov	eax, [si+2]
		mov	[bp+var_4], eax
		mov	[bp+var_6], 0
		jmp	short loc_BF885

loc_BF872:
		push	di
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_BF3D5
		add	sp, 6
		inc	[bp+var_6]
		add	word ptr [bp+var_4], 59h

loc_BF885:
		mov	ax, [si]
		cmp	ax, [bp+var_6]
		jg	short loc_BF872
		pop	di
		pop	si
		leave
		retf
sub_BF7F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF890		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_BF8BD
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword ptr [si+2], 0
		mov	word ptr [si], 0

loc_BF8BD:
		pop	si
		pop	bp
		retf
sub_BF890		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ProgBuffer_ResetState_AA2F4 (sub_AA2F4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, 13 lignes, LUE INTEGRALEMENT (session ordres
; de mission avec Remi). Initialise a zero les deux premiers champs du conteneur PROG : +0x00
; (compteur d'instructions/marqueurs) et +0x06 (taille du chunk, ecrasee juste apres par
; ProgBuffer_ResetAndSetSize_AA307).
; ==============================================================================================
ProgBuffer_ResetState_BF8C0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		mov	word ptr [si+6], 0
		pop	si
		pop	bp
		retf
ProgBuffer_ResetState_BF8C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ProgBuffer_ResetAndSetSize_AA307 (sub_AA307 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, 18 lignes, LUE INTEGRALEMENT. Appelle
; ProgBuffer_ResetState_AA2F4 puis pose +0x06 = taille du chunk PROG (parametre). Etape
; preliminaire de ProgBuffer_LoadRawAndCountMarkers_AA31D.
; ==============================================================================================
ProgBuffer_ResetAndSetSize_BF8D3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr ProgBuffer_ResetState_BF8C0
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si+6], ax
		pop	si
		pop	bp
		retf
ProgBuffer_ResetAndSetSize_BF8D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF8E9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr ProgBuffer_ResetAndSetSize_BF8D3
		add	sp, 4
		push	1
		push	0
		push	2
		push	large [di+72h]
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+4], dx
		mov	[si+2], ax
		cmp	dword ptr [si+2], 0
		jnz	short loc_BF92A
		push	9011h
		call	sub_1DDFE
		pop	cx

loc_BF92A:
		push	large [si+2]
		push	di
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		xor	dx, dx
		jmp	short loc_BF94B

loc_BF93B:
		les	bx, [si+2]
		add	bx, dx
		cmp	byte ptr es:[bx], 0
		jnz	short loc_BF948
		inc	word ptr [si]

loc_BF948:
		add	dx, 2

loc_BF94B:
		movsx	eax, dx
		cmp	eax, [di+72h]
		jl	short loc_BF93B
		pop	di
		pop	si
		pop	bp
		retf
sub_BF8E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF959		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_BF97E
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	word ptr [si], 0

loc_BF97E:
		pop	si
		pop	bp
		retf
sub_BF959		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BF981		proc far

var_18		= word ptr -18h
var_17		= word ptr -17h
var_15		= word ptr -15h
var_13		= word ptr -13h
var_11		= word ptr -11h
var_F		= byte ptr -0Fh
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	ax, [bp+arg_2]
		mov	[si+2], ax
		push	large 18h
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	al, byte ptr [bp+var_18]
		mov	[si], al
		mov	byte ptr [si+1], 0
		push	[bp+var_17]
		mov	ax, [si+2]
		add	ax, 1Ah
		push	ax
		call	PtrList_GetAt_54919
		add	sp, 4
		mov	[si+6], dx
		mov	[si+4], ax
		push	[bp+var_15]
		mov	ax, [si+2]
		add	ax, 40h
		push	ax
		call	Expr_LookupNamedValue_530A7
		add	sp, 4
		mov	[si+0Ah], dx
		mov	[si+8], ax
		push	[bp+var_13]
		mov	ax, [si+2]
		add	ax, 40h
		push	ax
		call	Expr_LookupNamedValue_530A7
		add	sp, 4
		mov	[si+0Eh], dx
		mov	[si+0Ch], ax
		push	[bp+var_11]
		mov	ax, [si+2]
		add	ax, 40h
		push	ax
		call	Expr_LookupNamedValue_530A7
		add	sp, 4
		mov	[si+12h], dx
		mov	[si+10h], ax
		mov	al, [bp+var_F]
		mov	[si+18h], al
		mov	ax, [bp+var_E]
		mov	[si+19h], ax
		mov	eax, [bp+var_C]
		mov	[si+1Bh], eax
		mov	eax, [bp+var_8]
		mov	[si+1Fh], eax
		mov	eax, [bp+var_4]
		mov	[si+23h], eax
		mov	ax, [di+72h]
		add	ax, 0FFE8h
		shr	ax, 1
		mov	[si+14h], ax
		cmp	word ptr [si+14h], 0
		jz	short loc_BFA7C
		mov	ax, [si+14h]
		shl	ax, 1
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[si+16h], ax
		cmp	word ptr [si+16h], 0
		jnz	short loc_BFA62
		push	9012h
		call	sub_1DDFE
		pop	cx

loc_BFA62:
		mov	ax, [si+14h]
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	ds
		push	word ptr [si+16h]
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		jmp	short loc_BFA81

loc_BFA7C:
		mov	word ptr [si+16h], 0

loc_BFA81:
		pop	di
		pop	si
		leave
		retf
sub_BF981		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ExprSlot_ReleaseObjectB_AA49A (sub_AA49A de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, libère l'objet (sub_338).
; ==============================================================================================
ExprSlot_ReleaseObjectB_BFA85		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+14h], 0
		jz	short loc_BFAA5
		mov	word ptr [si+14h], 0
		push	word ptr [si+16h]
		call	sub_3B2
		pop	cx
		mov	word ptr [si+16h], 0

loc_BFAA5:
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseObjectB_BFA85		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionScenario_ResolveMultipleFields_AA4BD (sub_AA4BD
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️
; far, 106 lignes, NON DÉTAILLÉE — appelle Expr_LookupTableEntry85B_52D45 (seg114) en boucle.
; ==============================================================================================
MissionScenario_ResolveMultipleFields_BFAA8		proc far

var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_2], 0
		jmp	loc_BFB46

loc_BFABD:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [si+16h]
		add	bx, ax
		push	word ptr [bx]
		mov	ax, [si+2]
		add	ax, 34h
		push	ax
		call	Expr_LookupTableEntry85B_54612
		add	sp, 4
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jz	short loc_BFB43
		les	bx, word ptr [bp+var_6]
		mov	al, es:[bx+31h]
		cmp	al, [bp+arg_2]
		jnz	short loc_BFB43
		mov	al, es:[bx+39h]
		shl	ax, 0Fh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_BFB12
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jz	short loc_BFB12
		mov	ax, 1
		jmp	short loc_BFB14

loc_BFB12:
		xor	ax, ax

loc_BFB14:
		or	al, al
		jnz	short loc_BFB42
		les	bx, word ptr [bp+var_6]
		mov	al, es:[bx+39h]
		shl	ax, 0Eh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_BFB3C
		mov	al, es:[bx+39h]
		shl	ax, 0Dh
		sar	ax, 0Fh
		or	ax, ax
		jnz	short loc_BFB3C
		mov	ax, 1
		jmp	short loc_BFB3E

loc_BFB3C:
		xor	ax, ax

loc_BFB3E:
		or	al, al
		jz	short loc_BFB43

loc_BFB42:
		inc	di

loc_BFB43:
		inc	[bp+var_2]

loc_BFB46:
		mov	ax, [si+14h]
		cmp	ax, [bp+var_2]
		jle	short loc_BFB51
		jmp	loc_BFABD

loc_BFB51:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
MissionScenario_ResolveMultipleFields_BFAA8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à ExprSlot_Helper7_AA56C
; (sub_AA56C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, aucun appel externe visible (20 lignes).
; ==============================================================================================
ExprSlot_Helper7_BFB57		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		mov	word ptr [si+4], 0
		pop	si
		pop	bp
		retf
ExprSlot_Helper7_BFB57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à ExprSlot_Helper8_AA57F
; (sub_AA57F de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, appelle ExprSlot_Helper7_AA56C.
; ==============================================================================================
ExprSlot_Helper8_BFB6A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr ExprSlot_Helper7_BFB57
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si+4], ax
		pop	si
		pop	bp
		retf
ExprSlot_Helper8_BFB6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFB80		proc far

var_86		= word ptr -86h
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 86h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_2], 0
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr ExprSlot_Helper8_BFB6A
		add	sp, 4
		jmp	short loc_BFBED

loc_BFBA1:
		mov	eax, [di+65h]
		mov	[bp+var_6], eax
		push	di
		call	ResourceRecord_ComputeAlignedBounds_6DC3A
		pop	cx
		cmp	dword ptr [di+6Dh], 454E4353h
		jnz	short loc_BFBBF
		mov	ax, 1
		jmp	short loc_BFBC1

loc_BFBBF:
		xor	ax, ax

loc_BFBC1:
		or	ax, ax
		jz	short loc_BFBE1
		cmp	[bp+var_2], 20h
		jge	short loc_BFBE1
		mov	bx, [bp+var_2]
		shl	bx, 2
		lea	ax, [bp+var_86]
		add	bx, ax
		mov	eax, [bp+var_6]
		mov	[bx], eax
		inc	[bp+var_2]

loc_BFBE1:
		mov	eax, [di+76h]
		mov	[di+65h], eax
		mov	byte ptr [di+6Dh], 0

loc_BFBED:
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_BFBFC
		push	di
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_BFC10

loc_BFBFC:
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_BFC0E
		mov	ax, 1
		jmp	short loc_BFC10

loc_BFC0E:
		xor	ax, ax

loc_BFC10:
		or	ax, ax
		jz	short loc_BFBA1
		push	seg stub345
		push	offset sub_75305
		push	11h
		push	[bp+var_2]
		push	large 270000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[si+2], ax
		cmp	word ptr [si+2], 0
		jnz	short loc_BFC3F
		push	9013h
		call	sub_1DDFE
		pop	cx

loc_BFC3F:
		mov	word ptr [si], 0
		jmp	short loc_BFC76

loc_BFC45:
		mov	bx, [si]
		shl	bx, 2
		lea	ax, [bp+var_86]
		add	bx, ax
		mov	eax, [bx]
		mov	[di+65h], eax
		push	di
		call	ResourceRecord_ComputeAlignedBounds_6DC3A
		pop	cx
		push	di
		push	word ptr [si+4]
		mov	ax, [si]
		imul	ax, ax, 27h
		mov	dx, [si+2]
		add	dx, ax
		push	dx
		push	cs
		call	near ptr sub_BF981
		add	sp, 6
		inc	word ptr [si]

loc_BFC76:
		mov	ax, [si]
		cmp	ax, [bp+var_2]
		jl	short loc_BFC45
		pop	di
		pop	si
		leave
		retf
sub_BFB80		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; MissionScenario_Helper_AA687 (sub_AA687 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle sub_E77 (externe).
; ==============================================================================================
MissionScenario_Helper_BFC81		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_BFCAA
		push	seg stub345
		push	offset sub_75300
		push	large 190000h
		push	27h
		push	word ptr [si+2]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	word ptr [si], 0

loc_BFCAA:
		pop	si
		pop	bp
		retf
MissionScenario_Helper_BFC81		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFCAD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si], 0
		mov	dword ptr [si+2], 0
		pop	si
		pop	bp
		retf
sub_BFCAD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFCC3		proc far

var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		push	si
		push	cs
		call	near ptr sub_BFCAD
		pop	cx
		mov	ax, [di+72h]
		mov	bx, 0Eh
		xor	dx, dx
		div	bx
		mov	[si], ax
		mov	ax, [si]
		imul	ax, ax, 0Eh
		movzx	eax, ax
		cmp	eax, [di+72h]
		jz	short loc_BFCFB
		push	9114h
		call	sub_1DDFE
		pop	cx

loc_BFCFB:
		push	1
		push	0
		push	2
		mov	ax, [si]
		shl	ax, 4
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+4], dx
		mov	[si+2], ax
		cmp	dword ptr [si+2], 0
		jnz	short loc_BFD2D
		push	9014h
		call	sub_1DDFE
		pop	cx

loc_BFD2D:
		mov	eax, [si+2]
		mov	[bp+var_4], eax
		mov	[bp+var_6], 0
		jmp	short loc_BFDA3

loc_BFD3C:
		push	large 0Eh
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		push	[bp+var_20]
		mov	ax, [bp+arg_2]
		add	ax, 1Ah
		push	ax
		call	PtrList_GetAt_54919
		add	sp, 4
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+2], dx
		mov	es:[bx], ax
		mov	eax, [bp+var_1E]
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	es:[bx+4], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_16]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	es:[bx+0Ch], eax
		inc	[bp+var_6]
		add	word ptr [bp+var_4], 10h

loc_BFDA3:
		mov	ax, [si]
		cmp	ax, [bp+var_6]
		jg	short loc_BFD3C
		pop	di
		pop	si
		leave
		retf
sub_BFCC3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BFDAE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_BFDDB
		push	0
		push	2
		mov	ax, si
		add	ax, 2
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword ptr [si+2], 0
		mov	word ptr [si], 0

loc_BFDDB:
		pop	si
		pop	bp
		retf
sub_BFDAE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à ExprSlot_Helper10_AA7D4
; (sub_AA7D4 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, aucun appel externe visible (13 lignes).
; ==============================================================================================
ExprSlot_Helper10_BFDDE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		add	ax, 1Bh
		mov	ax, dx
		pop	bp
		retf
ExprSlot_Helper10_BFDDE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ExprSlot_ReleaseObjectAndFree_AA7E3 (sub_AA7E3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine ExprSlot_ReleaseObjectB_AA49A et
; libération de l'objet (sub_338).
; ==============================================================================================
ExprSlot_ReleaseObjectAndFree_BFDED		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_BFE10
		push	si
		nop
		push	cs
		call	near ptr ExprSlot_ReleaseObjectB_BFA85
		pop	cx
		test	di, 1
		jz	short loc_BFE10
		push	si
		call	sub_3B2
		pop	cx

loc_BFE10:
		pop	di
		pop	si
		pop	bp
		retf
ExprSlot_ReleaseObjectAndFree_BFDED		endp
ovr345		ends
