seg116		segment	para public 'CODE' use16
		assume cs:seg116
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BAD1		proc far

var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	sub_741CF
		add	sp, 6
		push	0
		push	large 54414445h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_4BB19
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Bh], ax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		jmp	short loc_4BB2E

loc_4BB19:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+4Bh], 28h
		mov	[bp+var_4], 2800h
		mov	eax, [bp+var_4]

loc_4BB2E:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Dh], eax
		push	0
		push	large 52435254h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_4BB4E
		jmp	loc_4BBF5

loc_4BB4E:
		mov	eax, [si+72h]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+51h], ax
		push	1
		push	0
		push	2
		mov	ax, es:[bx+51h]
		imul	ax, ax, 0Bh
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+55h], dx
		mov	es:[bx+53h], ax
		mov	eax, es:[bx+53h]
		mov	[bp+var_8], eax
		xor	di, di
		jmp	short loc_4BBEA

loc_4BB9A:
		push	large 0Ah
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		lea	ax, [bp+var_10]
		mov	word ptr [bp+var_16+2], ds
		mov	word ptr [bp+var_16], ax
		les	bx, word ptr [bp+var_8]
		mov	ax, [bp+var_12]
		mov	es:[bx], ax
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		push	8
		push	large [bp+var_1A]
		mov	ax, word ptr [bp+var_8]
		add	ax, 2
		push	word ptr [bp+var_8+2]
		push	ax
		call	sub_39E1
		add	sp, 0Ah
		les	bx, word ptr [bp+var_8]
		mov	byte ptr es:[bx+0Ah], 0
		inc	di
		add	word ptr [bp+var_8], 0Bh

loc_4BBEA:
		les	bx, word ptr [bp+arg_0]
		cmp	es:[bx+51h], di
		jg	short loc_4BB9A
		jmp	short loc_4BC07

loc_4BBF5:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+51h], 0
		mov	dword ptr es:[bx+53h], 0

loc_4BC07:
		pop	di
		pop	si
		leave
		retf
sub_4BAD1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BC0B		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		xor	di, di
		call	DisplayCache_ComputeChecksum_65BFD
		movzx	eax, ax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 640h
		jge	short loc_4BC2F
		jmp	loc_4BCB2

loc_4BC2F:
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	5Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4BC66
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si], 2DD0h
		mov	word ptr [si+5Bh], 0
		push	large [bp+var_8]
		push	si
		nop
		push	cs
		call	near ptr Explosion_AttachToSource_4BD3C
		add	sp, 6
		mov	ax, si
		jmp	short loc_4BC68

loc_4BC66:
		mov	ax, si

loc_4BC68:
		mov	si, ax
		mov	di, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 4Dh
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		mov	[bp+var_C], eax
		mov	[bp+var_14], eax
		mov	[si+52h], eax
		les	bx, word ptr [bp+arg_0]
		mov	ax, es:[bx+4Bh]
		mov	[bp+var_16], ax
		mov	[si+56h], ax
		mov	ax, es:[bx+49h]
		mov	[bp+var_18], ax
		mov	[si+58h], ax

loc_4BCB2:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_4BC0B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BCB8		proc far
		push	bp
		mov	bp, sp
		mov	al, 0Fh
		pop	bp
		retf
sub_4BCB8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BCBF		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_4BD2B
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1D74h
		cmp	dword ptr es:[bx+53h], 0
		jz	short loc_4BCFC
		push	0
		push	2
		mov	eax, es:[bx+53h]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_4BCFC:
		push	0
		push	large [bp+arg_0]
		call	sub_741D9
		add	sp, 6
		test	si, 1
		jz	short loc_4BD2B
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_4BD2B:
		pop	si
		leave
		retf
sub_4BCBF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BD2E		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_4BD2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BD35		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_4BD35		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Explosion_AttachToSource_4BDDA (sub_4BDDA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; ATTACHE UNE EXPLOSION À L'OBJET QUI LA PRODUIT (ex-Camera_InitAttachWithModeFlags, aucun
; rapport avec une caméra) : instance +0x59 = 1, bits 0 et 2 de +4, puis
; Debris_BodyAttachToSubpart(instance, source). Appelée par Explosion_SpawnInstance_4BCF4.
; ==============================================================================================
Explosion_AttachToSource_4BD3C		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+5Ah], 1
		or	byte ptr [si+2], 1
		or	byte ptr [si+2], 4
		push	large [bp+arg_2]
		push	si
		call	sub_36985
		add	sp, 6
		pop	si
		pop	bp
		retf
Explosion_AttachToSource_4BD3C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BD5F		proc far

var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_8]
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+24h]
		add	sp, 4
		mov	[bp+var_2], al
		cmp	[bp+var_2], 5
		jz	short loc_4BD8C
		cmp	[bp+var_2], 3
		jnz	short loc_4BD99

loc_4BD8C:
		mov	ax, word ptr [bp+arg_2+1]
		mov	[bp+var_4], ax
		les	bx, [si+0Ah]
		mov	es:[bx+0Dh], ax

loc_4BD99:
		mov	eax, [bp+arg_2]
		mov	[si+52h], eax
		mov	ax, [bp+arg_6]
		mov	[si+56h], ax
		cmp	di, 64h
		jz	short loc_4BDAF
		mov	[si+58h], di

loc_4BDAF:
		pop	di
		pop	si
		leave
		retf
sub_4BD5F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BDB3		proc far

var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 58h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 12h
		mov	ax, [bp+arg_2]
		add	ax, 12h
		mov	[bp+var_6], ax
		mov	eax, [di]
		mov	bx, [bp+var_6]
		sub	eax, [bx]
		mov	[bp+var_58], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_54], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_44], eax
		push	eax
		push	large [bp+var_48]
		push	large [bp+var_4C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		or	eax, eax
		jge	short loc_4BE33
		neg	eax

loc_4BE33:
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_16], eax
		mov	[bp+var_A], eax
		push	[bp+arg_2]
		mov	bx, [bp+arg_2]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		cmp	[bp+var_1A], 0
		jz	short loc_4BE7E
		les	bx, word ptr [bp+var_1A]
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		add	dx, 10h
		mov	[bp+var_1C], ax
		mov	[bp+var_1E], dx
		les	bx, [bp+var_1E]
		mov	eax, es:[bx]
		mov	[bp+var_22], eax
		sub	[bp+var_A], eax

loc_4BE7E:
		cmp	[bp+var_A], 0
		jge	short loc_4BE8A
		mov	ax, 1
		jmp	short loc_4BE8C

loc_4BE8A:
		xor	ax, ax

loc_4BE8C:
		or	al, al
		jz	short loc_4BEA0
		mov	[bp+var_26], 0
		mov	eax, [bp+var_26]
		mov	[bp+var_A], eax

loc_4BEA0:
		mov	eax, [si+52h]
		cmp	eax, [bp+var_A]
		jle	short loc_4BEAF
		mov	ax, 1
		jmp	short loc_4BEB1

loc_4BEAF:
		xor	ax, ax

loc_4BEB1:
		or	al, al
		jz	short loc_4BEED
		mov	eax, [si+52h]
		sub	eax, [bp+var_A]
		mov	[bp+var_2A], eax
		mov	[bp+var_2E], eax
		mov	di, si
		add	di, 52h
		mov	eax, [bp+var_2E]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_36], eax
		jmp	short loc_4BEF9

loc_4BEED:
		mov	[bp+var_3A], 0
		mov	eax, [bp+var_3A]

loc_4BEF9:
		mov	[bp+var_4], eax
		mov	ax, [si+56h]
		mov	[bp+var_3C], ax
		movsx	eax, [bp+var_3C]
		shl	eax, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	ax, word ptr [bp+var_4+1]
		pop	di
		pop	si
		leave
		retf
sub_4BDB3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BF2B		proc far

var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= byte ptr -18h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+5Ah], 0
		jnz	short loc_4BF3F
		jmp	loc_4BFDD

loc_4BF3F:
		les	bx, [si+0Eh]
		mov	ax, es:[bx+55h]
		mov	dx, es:[bx+53h]
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	ax, es:[bx+51h]
		mov	[bp+var_A], ax
		cmp	[bp+var_8], 0
		jz	short loc_4BFD7
		imul	ax, ax, 0Bh
		mov	dx, word ptr [bp+var_8+2]
		mov	bx, word ptr [bp+var_8]
		add	bx, ax
		mov	[bp+var_2], dx
		mov	[bp+var_4], bx

loc_4BF6F:
		sub	[bp+var_4], 0Bh
		push	si
		les	bx, [bp+var_4]
		push	word ptr es:[bx]
		sub	sp, 0Ah
		mov	ax, [bp+var_2]
		mov	dx, [bp+var_4]
		add	dx, 2
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		les	bx, [bp+var_E]
		mov	eax, es:[bx]
		mov	[bp+var_20], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_1C], eax
		mov	[bp+var_18], 0
		sub	sp, 0Ch
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_2C], eax
		mov	eax, [di+4]
		mov	[bp+var_28], eax
		mov	eax, [di+8]
		mov	[bp+var_24], eax
		push	word_79799
		call	sub_4FFA2
		add	sp, 1Ch
		mov	ax, [bp+var_4]
		cmp	ax, word ptr [bp+var_8]
		ja	short loc_4BF6F

loc_4BFD7:
		mov	byte ptr [si+5Ah], 0
		jmp	short loc_4BFE1

loc_4BFDD:
		and	byte ptr [si+2], 0FDh

loc_4BFE1:
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_4BFFA
		push	large [si+0Ah]
		les	bx, [si+0Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_4BFFC

loc_4BFFA:
		mov	al, 1

loc_4BFFC:
		pop	di
		pop	si
		leave
		retf
sub_4BF2B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C000		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+5Bh]
		pop	si
		pop	bp
		retf
sub_4C000		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C00D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0Fh
		pop	bp
		retf
sub_4C00D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C017		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4C04E
		mov	word ptr [si], 2DD0h
		mov	ax, si
		add	ax, 5Bh
		push	ax
		call	WeakRef_InvalidateIfSet
		pop	cx
		push	0
		push	si
		call	sub_3B2B9
		add	sp, 4
		test	di, 1
		jz	short loc_4C04E
		push	si
		call	sub_3B2
		pop	cx

loc_4C04E:
		pop	di
		pop	si
sub_4C017		endp
seg116		ends
