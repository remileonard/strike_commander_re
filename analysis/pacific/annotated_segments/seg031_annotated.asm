seg031		segment	para public 'CODE' use16
		assume cs:seg031
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_160F0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+89h]
		pop	si
		pop	bp
		retf
sub_160F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_160FE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jz	short loc_1617F
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_16169
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_1616B

loc_16169:
		mov	al, 1Ch

loc_1616B:
		cmp	al, 6
		jnz	short loc_1617F
		mov	bx, [si+89h]
		push	large [bx+5Fh]
		call	sub_3E140
		add	sp, 4

loc_1617F:
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_1618E
		mov	ax, 1
		jmp	short loc_16190

loc_1618E:
		xor	ax, ax

loc_16190:
		pop	di
		pop	si
		pop	bp
		retf
sub_160FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16194		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_16194		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_RenderGraphWrapper_83B85 (sub_83B85 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle UIScreen_RenderGraphVGA_509EE (seg113).
; ==============================================================================================
HUDSymbol_RenderGraphWrapper_1619E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_519BE
		pop	cx
		cmp	word ptr [si+89h], 0
		jz	short loc_161C7
		mov	bx, [si+89h]
		cmp	byte ptr [bx+3], 0
		jz	short loc_161C7
		push	si
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 4

loc_161C7:
		pop	si
		pop	bp
		retf
HUDSymbol_RenderGraphWrapper_1619E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_161CA		proc far

var_B6		= dword ptr -0B6h
var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= word ptr -3Ah
var_38		= dword ptr -38h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B6h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jnz	short loc_161E0
		jmp	loc_16679

loc_161E0:
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_4A], eax
		mov	eax, [di+4]
		mov	[bp+var_46], eax
		mov	eax, [di+8]
		mov	[bp+var_42], eax
		mov	ax, si
		add	ax, 8Bh
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	eax, [si+0AFh]
		neg	eax
		mov	[bp+var_4], eax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4A]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_46]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_42]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	word ptr [si+89h]
		push	si
		call	sub_2CADA
		add	sp, 6
		mov	di, [si+89h]
		add	di, 12h
		mov	eax, [di]
		add	[bp+var_4A], eax
		mov	eax, [di+4]
		add	[bp+var_46], eax
		mov	eax, [di+8]
		add	[bp+var_42], eax
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_4A]
		sub	eax, [di]
		mov	[bp+var_62], eax
		mov	eax, [bp+var_46]
		sub	eax, [di+4]
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_42]
		sub	eax, [di+8]
		mov	[bp+var_5A], eax
		mov	eax, [bp+var_62]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_4E], eax
		push	eax
		push	large [bp+var_52]
		push	large [bp+var_56]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	eax, [si+0B3h]
		cmp	eax, [bp+var_10]
		jge	short loc_16305
		mov	ax, 1
		jmp	short loc_16307

loc_16305:
		xor	ax, ax

loc_16307:
		or	al, al
		jz	short loc_16373
		mov	ax, si
		add	ax, 0B3h
		push	ax
		lea	ax, word ptr [bp+var_56]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4
		mov	eax, [bp+var_4A]
		sub	eax, [bp+var_56]
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_46]
		sub	eax, [bp+var_52]
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_42]
		sub	eax, [bp+var_4E]
		mov	[bp+var_66], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_76], eax
		mov	eax, [bp+var_66]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_7A]
		mov	[si+14h], eax
		mov	eax, [bp+var_76]
		mov	[si+18h], eax
		mov	eax, [bp+var_72]
		mov	[si+1Ch], eax
		jmp	short loc_1638B

loc_16373:
		mov	eax, [bp+var_56]
		add	[si+14h], eax
		mov	eax, [bp+var_52]
		add	[si+18h], eax
		mov	eax, [bp+var_4E]
		add	[si+1Ch], eax

loc_1638B:
		mov	di, [si+89h]
		add	di, 12h
		mov	cx, si
		add	cx, 14h
		mov	eax, [di]
		mov	bx, cx
		sub	eax, [bx]
		mov	[bp+var_92], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_8E], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_7E], eax
		mov	di, si
		add	di, 2Ch
		push	eax
		push	large [bp+var_82]
		push	large [bp+var_86]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	eax, [di]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_AA]
		add	eax, [bp+var_86]
		mov	[bp+var_B6], eax
		mov	eax, [bp+var_A6]
		add	eax, [bp+var_82]
		mov	[bp+var_B2], eax
		mov	eax, [bp+var_A2]
		add	eax, [bp+var_7E]
		mov	[bp+var_AE], eax
		mov	eax, [bp+var_B6]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_B2]
		mov	[bp+var_9A], eax
		mov	eax, [bp+var_AE]
		mov	[bp+var_96], eax
		lea	ax, word ptr [bp+var_9E]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		push	2
		push	0
		call	sub_5235
		add	sp, 4
		or	al, al
		jnz	short loc_164DE
		jmp	loc_16602

loc_164DE:
		push	0
		call	sub_5292
		pop	cx
		neg	ax
		sar	ax, 1
		mov	di, ax
		push	0
		call	sub_52A1
		pop	cx
		sar	ax, 1
		mov	[bp+var_32], ax
		or	di, di
		jz	short loc_16573
		or	di, di
		jle	short loc_16527
		cmp	dword ptr [si+9Bh], 0
		jl	short loc_1650E
		mov	ax, 1
		jmp	short loc_16510

loc_1650E:
		xor	ax, ax

loc_16510:
		or	al, al
		jz	short loc_16527
		cmp	dword ptr [si+8Bh], 0
		jg	short loc_16521
		mov	ax, 1
		jmp	short loc_16523

loc_16521:
		xor	ax, ax

loc_16523:
		or	al, al
		jnz	short loc_16551

loc_16527:
		or	di, di
		jge	short loc_16573
		cmp	dword ptr [si+9Bh], 0
		jg	short loc_16538
		mov	ax, 1
		jmp	short loc_1653A

loc_16538:
		xor	ax, ax

loc_1653A:
		or	al, al
		jz	short loc_16573
		cmp	dword ptr [si+8Bh], 0
		jl	short loc_1654B
		mov	ax, 1
		jmp	short loc_1654D

loc_1654B:
		xor	ax, ax

loc_1654D:
		or	al, al
		jz	short loc_16573

loc_16551:
		mov	[bp+var_34], di
		movsx	eax, [bp+var_34]
		shl	eax, 8
		mov	[bp+var_38], eax
		lea	ax, word ptr [bp+var_38]
		push	ax
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	Matrix_BuildAxisZ_59085
		add	sp, 4

loc_16573:
		cmp	[bp+var_32], 0
		jz	short loc_165F6
		cmp	[bp+var_32], 0
		jle	short loc_165A5
		cmp	dword ptr [si+9Bh], 0
		jl	short loc_1658C
		mov	ax, 1
		jmp	short loc_1658E

loc_1658C:
		xor	ax, ax

loc_1658E:
		or	al, al
		jz	short loc_165A5
		cmp	dword ptr [si+0ABh], 0
		jl	short loc_1659F
		mov	ax, 1
		jmp	short loc_165A1

loc_1659F:
		xor	ax, ax

loc_165A1:
		or	al, al
		jnz	short loc_165D1

loc_165A5:
		cmp	[bp+var_32], 0
		jge	short loc_165F6
		cmp	dword ptr [si+9Bh], 0
		jg	short loc_165B8
		mov	ax, 1
		jmp	short loc_165BA

loc_165B8:
		xor	ax, ax

loc_165BA:
		or	al, al
		jz	short loc_165F6
		cmp	dword ptr [si+0ABh], 0
		jg	short loc_165CB
		mov	ax, 1
		jmp	short loc_165CD

loc_165CB:
		xor	ax, ax

loc_165CD:
		or	al, al
		jz	short loc_165F6

loc_165D1:
		mov	ax, [bp+var_32]
		mov	[bp+var_3A], ax
		movsx	eax, [bp+var_3A]
		shl	eax, 8
		mov	[bp+var_3E], eax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	Matrix_BuildAxisX_58C8C
		add	sp, 4

loc_165F6:
		mov	ax, si
		add	ax, 8Bh
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx

loc_16602:
		cmp	byte_7D32B, 1
		jnz	short loc_1660D
		mov	al, 1
		jmp	short loc_1660F

loc_1660D:
		mov	al, 0

loc_1660F:
		or	al, al
		jz	short loc_1663A
		mov	eax, dword_7975E
		add	[si+0AFh], eax
		mov	eax, [si+0AFh]
		cmp	eax, [si+0B3h]
		jle	short loc_1662D
		mov	ax, 1
		jmp	short loc_1662F

loc_1662D:
		xor	ax, ax

loc_1662F:
		or	al, al
		jz	short loc_16675
		mov	eax, [si+0B3h]
		jmp	short loc_16670

loc_1663A:
		cmp	byte_7D32A, 1
		jnz	short loc_16645
		mov	al, 1
		jmp	short loc_16647

loc_16645:
		mov	al, 0

loc_16647:
		or	al, al
		jz	short loc_16675
		mov	eax, dword_7975E
		sub	[si+0AFh], eax
		mov	eax, [si+0AFh]
		cmp	eax, [si+0B7h]
		jge	short loc_16665
		mov	ax, 1
		jmp	short loc_16667

loc_16665:
		xor	ax, ax

loc_16667:
		or	al, al
		jz	short loc_16675
		mov	eax, [si+0B7h]

loc_16670:
		mov	[si+0AFh], eax

loc_16675:
		mov	al, 1
		jmp	short loc_1667B

loc_16679:
		mov	al, 0

loc_1667B:
		pop	di
		pop	si
		leave
		retf
sub_161CA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1667F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 3
		pop	bp
		retf
sub_1667F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16689		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jz	short loc_166AC
		cmp	word ptr [si+5Ch], 0
		jz	short loc_166AC
		push	si
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4

loc_166AC:
		mov	al, 1
		pop	si
		pop	bp
		retf
sub_16689		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_166B1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 4
		pop	bp
		retf
sub_166B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_166BB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+89h], 0
		jz	short loc_16719
		push	word ptr [si+89h]
		mov	bx, [si+89h]
		mov	bx, [bx]
		call	dword ptr [bx+7Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		push	word ptr [si+89h]
		call	Debris_ResolveForceBuffer
		pop	cx
		mov	di, ax
		mov	eax, [di]
		mov	[si+14h], eax
		mov	eax, [di+4]
		mov	[si+18h], eax
		mov	eax, [di+8]
		mov	[si+1Ch], eax
		push	si
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4

loc_16719:
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_16728
		mov	ax, 1
		jmp	short loc_1672A

loc_16728:
		xor	ax, ax

loc_1672A:
		pop	di
		pop	si
		pop	bp
		retf
sub_166BB		endp

; ----------------------------------------------------------------------

sub_1672E		proc far
		push	bp
sub_1672E		endp

; START OF FUNCTION CHUNK FOR sub_1672E
		db 8Bh
; END OF FUNCTION CHUNK FOR sub_1672E
seg031		ends
