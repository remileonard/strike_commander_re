seg100		segment	para public 'CODE' use16
		assume cs:seg100
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 83h, 0C4h, 4

loc_3F963:
		db 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3F966		proc far

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
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_A		= word ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 86h
		push	si
		push	di
		mov	si, [bp+arg_A]
		mov	di, [bp+arg_C]
		mov	[bp+var_E], di
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		shl	eax, 1
		mov	[bp+var_12], eax
		mov	[bp+var_16], eax
		mov	[bp+var_8], eax
		mov	eax, dword_7942B
		neg	eax
		mov	[bp+var_1A], eax
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [bp+var_1E]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_8], eax
		cmp	word ptr [bp+var_8+1], 0
		jle	short loc_3F9D3
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_22]
		push	ax
		call	Math_Sqrt_56A1E
		add	sp, 6
		mov	eax, [bp+var_22]
		jmp	short loc_3F9DF

loc_3F9D3:
		mov	[bp+var_26], 0
		mov	eax, [bp+var_26]

loc_3F9DF:
		mov	[bp+var_4], eax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_62]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_62]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_5A]
		mov	[bp+var_4E], eax
		add	si, 12h
		mov	eax, [bp+var_56]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_52]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_4E]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_66], eax
		mov	eax, [si]
		add	eax, [bp+var_6E]
		mov	[bp+var_7A], eax
		mov	eax, [si+4]
		add	eax, [bp+var_6A]
		mov	[bp+var_76], eax
		mov	eax, [si+8]
		add	eax, [bp+var_66]
		mov	[bp+var_72], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_7E]
		mov	[bp+var_42], eax
		mov	si, di
		mov	eax, [si]
		sub	[bp+var_42], eax
		mov	si, [bp+arg_0]
		or	si, si
		jz	short loc_3FAE3
		mov	ax, si
		jmp	short loc_3FAED

loc_3FAE3:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax

loc_3FAED:
		or	ax, ax
		jz	short loc_3FB0C
		mov	eax, [bp+var_4A]
		mov	[si], eax
		mov	eax, [bp+var_46]
		mov	[si+4], eax
		mov	eax, [bp+var_42]
		mov	[si+8], eax
		mov	ax, si
		jmp	short loc_3FB0E

loc_3FB0C:
		mov	ax, si

loc_3FB0E:
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_3F966		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3FB18		proc far

var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4Ch
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_6]
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+67h], 0
		jnz	short loc_3FB33
		jmp	loc_3FC86

loc_3FB33:
		or	di, di
		jnz	short loc_3FB3A
		jmp	loc_3FC86

loc_3FB3A:
		or	si, si
		jnz	short loc_3FB41
		jmp	loc_3FC86

loc_3FB41:
		push	si
		push	ss
		lea	ax, word ptr [bp+var_34]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	large [bp+var_2C]
		push	large [bp+var_30]
		push	large [bp+var_34]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	[bp+var_C], eax
		mov	[bp+var_4], eax
		add	di, 12h
		mov	ax, si
		add	ax, 12h
		mov	[bp+var_E], ax
		mov	eax, [di]
		mov	bx, [bp+var_E]
		sub	eax, [bx]
		mov	[bp+var_40], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_3C], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_38], eax
		push	eax
		push	large [bp+var_3C]
		push	large [bp+var_40]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_16], eax
		mov	[bp+var_12], eax
		cmp	[bp+var_4], 0
		jz	short loc_3FBCD
		mov	ax, 1
		jmp	short loc_3FBCF

loc_3FBCD:
		xor	ax, ax

loc_3FBCF:
		or	al, al
		jz	short loc_3FBED
		mov	eax, [bp+var_12]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_4], eax

loc_3FBED:
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+6Ah]
		mov	[bp+var_20], ax
		movsx	eax, [bp+var_20]
		shl	eax, 8
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1A], eax
		lea	ax, word ptr [bp+var_1A]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_24]
		mov	[bp+var_1A], eax
		lea	ax, word ptr [bp+var_40]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_4C], eax
		mov	eax, [si+4]
		mov	[bp+var_48], eax
		mov	eax, [si+8]
		mov	[bp+var_44], eax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	Math_DotProduct3D_56E96
		add	sp, 8
		mov	eax, [bp+var_28]
		cmp	eax, [bp+var_1A]
		jle	short loc_3FC82
		mov	ax, 1
		jmp	short loc_3FC84

loc_3FC82:
		xor	ax, ax

loc_3FC84:
		jmp	short loc_3FC88

loc_3FC86:
		mov	al, 0

loc_3FC88:
		pop	di
		pop	si
		leave
		retf
sub_3FB18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3FC8C		proc far
		push	bp
		mov	bp, sp
		mov	al, 9
		pop	bp
		retf
sub_3FC8C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3FC93		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_3FCDB
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1DC4h
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_40242
		add	sp, 6
		test	si, 1
		jz	short loc_3FCDB
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_3FCDB:
		pop	si
		leave
		retf
sub_3FC93		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3FCDE		proc far

var_48		= dword ptr -48h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
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
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		push	di
		mov	di, [bp+arg_4]
		dec	word ptr [di+64h]
		jg	short loc_3FCF1
		jmp	loc_3FE73

loc_3FCF1:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+1Bh]
		mov	[bp+var_4], eax
		push	1
		push	1
		push	large [bp+var_4]
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	si, ax
		or	si, si
		jnz	short loc_3FD19
		jmp	loc_3FDF6

loc_3FD19:
		mov	dx, di
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	[si+12h], eax
		mov	eax, [bx+4]
		mov	[si+16h], eax
		mov	eax, [bx+8]
		mov	[si+1Ah], eax
		push	64h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Bh]
		push	word ptr es:[bx+0Ah]
		sub	sp, 4
		mov	ax, es:[bx+8]
		mov	[bp+var_6], ax
		movsx	eax, [bp+var_6]
		shl	eax, 8
		mov	[bp+var_48], eax
		push	si
		call	sub_4BD5F
		add	sp, 0Ah
		push	di
		mov	bx, [di]
		call	dword ptr [bx+38h]
		pop	cx
		mov	[bp+var_8], ax
		push	ax
		mov	ax, si
		add	ax, 5Bh
		push	ax
		call	SetReference16
		add	sp, 4
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	eax, [si+12h]
		mov	bx, word_7CEF9
		sub	eax, [bx+14h]
		mov	[bp+var_3C], eax
		mov	eax, [si+16h]
		sub	eax, [bx+18h]
		mov	[bp+var_38], eax
		mov	eax, [si+1Ah]
		sub	eax, [bx+1Ch]
		mov	[bp+var_34], eax
		push	eax
		push	large [bp+var_38]
		push	large [bp+var_3C]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		sar	eax, 8
		mov	[bp+var_1C], eax
		push	0
		push	eax
		push	2
		call	sub_5EB62
		add	sp, 8
		push	si
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4

loc_3FDF6:
		push	8
		push	ds
		push	offset aTERRAIN
		mov	bx, [bp+arg_6]
		push	large [bx+6]
		call	CRT_MemFamily_Extra7
		add	sp, 0Ah
		or	ax, ax
		jnz	short loc_3FE14
		mov	ax, 1
		jmp	short loc_3FE16

loc_3FE14:
		xor	ax, ax

loc_3FE16:
		or	al, al
		jz	short loc_3FE6F
		push	0
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_30], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_2C], eax
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	[bp+var_28], eax
		lea	ax, word ptr [bp+var_30]
		push	ax
		mov	ax, di
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	eax, [bp+var_18]
		mov	[di+1Ah], eax

loc_3FE6F:
		mov	al, 0
		jmp	short loc_3FE75

loc_3FE73:
		mov	al, 1

loc_3FE75:
		pop	di
		pop	si
		leave
		retf
sub_3FCDE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3FE79		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 9
		pop	bp
		retf
sub_3FE79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldWrapper_3C848 (sub_3C848 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_WriteFieldWrapper_64FD8 (sub_64FD8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe appelant sub_6501E. Référencée par sub_A8F22.
; ==============================================================================================
ResourceRecord_WriteFieldWrapper_3FE83		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr sub_3FF40
		pop	cx
		pop	bp
		retf
ResourceRecord_WriteFieldWrapper_3FE83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3FE92		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3FEBD
		mov	word ptr [si], 248Ah
		push	0
		push	si
		call	sub_402B6
		add	sp, 4
		test	di, 1
		jz	short loc_3FEBD
		push	si
		call	sub_3B2
		pop	cx

loc_3FEBD:
		pop	di
		pop	si
		pop	bp
		retf
sub_3FE92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3FEC1		proc far

var_32		= word ptr -32h
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	ss
		lea	ax, word ptr [bp+var_E]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		push	3
		push	large 100h
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	sub_57677
		add	sp, 8
		lea	ax, word ptr [bp+var_E]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_2], ax
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		mov	eax, [bp+var_E]
		mov	[bp+var_26], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_6]
		mov	[bp+var_1E], eax
		lea	ax, [bp+var_32]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_59429
		pop	cx
		lea	ax, [bp+var_32]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4
		pop	si
		leave
		retf
sub_3FEC1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3FF40		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+5Eh], 0
		jz	short loc_3FF53
		mov	byte ptr [si+5Eh], 0
		jmp	short loc_3FF86

loc_3FF53:
		mov	ax, si
		add	ax, 5Fh
		push	ax
		call	Timer_Tick_506DD
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3FF6B
		or	byte ptr [si+2], 2
		jmp	short loc_3FF6F

loc_3FF6B:
		and	byte ptr [si+2], 0FDh

loc_3FF6F:
		push	si
		push	cs
		call	near ptr sub_3FEC1
		pop	cx
		push	si
		call	sub_3C21D
		pop	cx
		mov	ah, 0
		or	ax, ax
sub_3FF40		endp
seg100		ends
