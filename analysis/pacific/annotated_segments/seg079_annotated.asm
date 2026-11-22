seg079		segment	para public 'CODE' use16
		assume cs:seg079
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E6h, 14h

loc_30C12:
		db 7, 1Fh, 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30C18		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+16h], 0
		jz	short loc_30C5F
		push	0
		push	2
		mov	ax, si
		add	ax, 18h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword ptr [si+18h], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 1Ch
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		mov	dword ptr [si+1Ch], 0

loc_30C5F:
		pop	si
		pop	bp
		retf
sub_30C18		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Équivalent de TriOverlay_RenderRegion_31BFF de STRIKE.EXE (faces de 38
; octets en mémoire au lieu de 30) : efface les bits 80h/40h des sommets, prend la liste de la
; case 0 de la grille, et pour chaque face : groupe (+24h) ≤ [desc+9], hauteur de visibilité
; du groupe ([desc+2Dh+4g] << 8) > altitude de l'observateur ([arg_2+1Ch]), boîte du groupe
; (sub_2EB67, desc+3Dh+16g) ; puis Render_FacePipeline_2EEB8.
; ==============================================================================================
TriOverlay_RenderRegion_30C62		proc far

var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		cmp	word ptr [si+16h], 0
		jnz	short loc_30C79
		jmp	loc_30D9E

loc_30C79:
		push	0
		mov	al, [si+0Ch]
		push	ax
		push	large [si+8]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		mov	ax, [si+4]
		mov	dx, word_77BF2
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		xor	dx, dx
		jmp	short loc_30CB8

loc_30CA6:
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+10h], 7Fh
		and	byte ptr es:[bx+10h], 0BFh
		inc	dx
		add	[bp+var_4], 1Eh

loc_30CB8:
		cmp	[si+6], dx
		jg	short loc_30CA6
		mov	[bp+var_6], 0
		les	bx, [si+18h]
		mov	ax, [bp+var_6]
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	word ptr [bp+var_A+2], ax
		mov	word ptr [bp+var_A], dx
		cmp	[bp+var_A], 0
		jnz	short loc_30CE4
		jmp	loc_30D9E

loc_30CE4:
		les	bx, word ptr [bp+var_A]
		add	word ptr [bp+var_A], 2
		mov	ax, es:[bx]
		mov	[bp+var_C], ax
		mov	ax, [si+12h]
		mov	dx, word_77BF2
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		xor	si, si
		jmp	loc_30D8D

loc_30D03:
		les	bx, word ptr [bp+var_A]
		mov	ax, es:[bx]
		mov	[bp+var_E], ax
		imul	ax, ax, 26h
		mov	dx, [bp+var_14]
		mov	bx, [bp+var_16]
		add	bx, ax
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], bx
		mov	es, word ptr [bp+var_12+2]
		mov	al, es:[bx+24h]
		mov	ah, 0
		cmp	ax, [di+9]
		jg	short loc_30D88
		mov	al, es:[bx+24h]
		mov	ah, 0
		shl	ax, 2
		mov	bx, ax
		mov	eax, [bx+di+2Dh]
		mov	[bp+var_1A], eax
		shl	eax, 8
		mov	bx, [bp+arg_2]
		cmp	eax, [bx+1Ch]
		jle	short loc_30D50
		mov	ax, 1
		jmp	short loc_30D52

loc_30D50:
		xor	ax, ax

loc_30D52:
		or	al, al
		jz	short loc_30D88
		les	bx, word ptr [bp+var_12]
		mov	al, es:[bx+24h]
		mov	ah, 0
		shl	ax, 4
		mov	dx, di
		add	dx, ax
		add	dx, 3Dh
		push	dx
		push	word ptr [bp+var_12+2]
		push	bx
		call	sub_2EB67
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_30D88
		push	large [bp+var_12]
		call	Render_FacePipeline_2EEB8
		add	sp, 4

loc_30D88:
		inc	si
		add	word ptr [bp+var_A], 2

loc_30D8D:
		cmp	si, [bp+var_C]
		jge	short loc_30D95
		jmp	loc_30D03

loc_30D95:
		mov	dword_77BF0, 0

loc_30D9E:
		pop	di
		pop	si
		leave
		retf
TriOverlay_RenderRegion_30C62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30DA2		proc far

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	ax, [bp+arg_0]
		jmp	short loc_30DFE

loc_30DAE:
		les	bx, [bp+var_6]
		mov	ax, es:[bx]
		mov	[bp+var_A], ax
		imul	ax, ax, 26h
		mov	dx, [bp+var_10]
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	[bp+var_C], dx
		mov	[bp+var_E], bx
		push	[bp+arg_2]
		push	dx
		push	bx
		call	sub_2EC8B
		add	sp, 6
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jz	short loc_30DEB
		mov	dword_77BF0, 0
		mov	al, 1
		jmp	short loc_30E00

loc_30DEB:
		inc	si
		add	[bp+var_6], 2
		cmp	si, [bp+var_8]
		jl	short loc_30DAE
		mov	dword_77BF0, 0

loc_30DFE:
		mov	al, 0

loc_30E00:
		pop	si
		leave
		retf
sub_30DA2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30E03		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_30E03		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30E0B		proc far

var_B2		= dword ptr -0B2h
var_AE		= dword ptr -0AEh
var_AA		= dword ptr -0AAh
var_A6		= dword ptr -0A6h
var_A2		= word ptr -0A2h
var_A0		= word ptr -0A0h
var_9E		= word ptr -9Eh
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= word ptr -96h
var_94		= word ptr -94h
var_92		= word ptr -92h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
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
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
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
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= byte ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 0B2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si], 0
		jnz	short loc_30E1F
		jmp	loc_312A1

loc_30E1F:
		xor	di, di
		jmp	loc_30F04

loc_30E24:
		cmp	[bp+arg_2], 0
		jz	short loc_30E53
		mov	ax, [bp+arg_2]
		add	ax, 14h
		mov	[bp+var_10], ax
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		mov	[bp+var_18], eax
		mov	eax, [bx+4]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_14]
		jmp	short loc_30E77

loc_30E53:
		mov	ax, [bp+arg_8]
		mov	[bp+var_1A], ax
		mov	bx, [bp+var_1A]
		mov	eax, [bx]
		mov	[bp+var_22], eax
		mov	eax, [bx+4]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_1E]

loc_30E77:
		mov	[bp+var_A], eax
		mov	bx, di
		shl	bx, 2
		mov	eax, [bx+si+1Dh]
		mov	[bp+var_26], eax
		shl	eax, 8
		sub	[bp+var_E], eax
		mov	bx, di
		shl	bx, 2
		mov	eax, [bx+si+1Dh]
		mov	[bp+var_2A], eax
		shl	eax, 8
		add	[bp+var_A], eax
		mov	bx, di
		shl	bx, 4
		mov	eax, [bp+var_E]
		mov	[bx+si+3Dh], eax
		mov	bx, di
		shl	bx, 4
		mov	eax, [bp+var_A]
		mov	[bx+si+41h], eax
		mov	bx, di
		shl	bx, 2
		mov	eax, [bx+si+0Dh]
		mov	[bp+var_2E], eax
		shl	eax, 8
		add	[bp+var_E], eax
		mov	bx, di
		shl	bx, 2
		mov	eax, [bx+si+0Dh]
		mov	[bp+var_32], eax
		shl	eax, 8
		sub	[bp+var_A], eax
		mov	bx, di
		shl	bx, 4
		mov	eax, [bp+var_E]
		mov	[bx+si+45h], eax
		mov	bx, di
		shl	bx, 4
		mov	eax, [bp+var_A]
		mov	[bx+si+49h], eax
		inc	di

loc_30F04:
		cmp	[si+0Bh], di
		jle	short loc_30F0C
		jmp	loc_30E24

loc_30F0C:
		mov	ax, word_7977C
		mov	[bp+var_4A], ax
		mov	di, si
		add	di, 3Dh
		mov	eax, [di]
		mov	[bp+var_3A], eax
		mov	eax, [di+4]
		mov	[bp+var_36], eax
		mov	bx, [si+1]
		mov	eax, [bx+86h]
		mov	[bp+var_4E], eax
		shl	eax, 8
		add	[bp+var_3A], eax
		mov	eax, [bx+86h]
		mov	[bp+var_52], eax
		shl	eax, 8
		sub	eax, [bp+var_36]
		mov	[bp+var_56], eax
		mov	[bp+var_5A], eax
		mov	[bp+var_36], eax
		mov	di, si
		add	di, 45h
		mov	eax, [di]
		mov	[bp+var_42], eax
		mov	eax, [di+4]
		mov	[bp+var_3E], eax
		mov	eax, [bx+86h]
		mov	[bp+var_5E], eax
		shl	eax, 8
		add	[bp+var_42], eax
		mov	eax, [bx+86h]
		mov	[bp+var_62], eax
		shl	eax, 8
		sub	eax, [bp+var_3E]
		mov	[bp+var_66], eax
		mov	[bp+var_6A], eax
		mov	[bp+var_3E], eax
		mov	eax, [si+5]
		mov	[bp+var_6E], eax
		shl	eax, 8
		mov	[bp+var_72], eax
		mov	eax, [bp+var_3A]
		mov	edx, eax
		mov	ecx, [bp+var_72]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_36]
		mov	edx, eax
		mov	ecx, [bp+var_72]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_36], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_76], eax
		mov	eax, [si+5]
		mov	[bp+var_7E], eax
		shl	eax, 8
		mov	[bp+var_82], eax
		mov	eax, [bp+var_42]
		mov	edx, eax
		mov	ecx, [bp+var_82]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_42], eax
		mov	eax, [bp+var_3E]
		mov	edx, eax
		mov	ecx, [bp+var_82]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_86], eax
		mov	ax, word ptr [bp+var_3A+1]
		mov	[bp+var_90], ax
		mov	ax, word ptr [bp+var_36+1]
		mov	[bp+var_92], ax
		mov	ax, [bp+var_90]
		mov	[bp+var_8E], ax
		mov	ax, [bp+var_92]
		mov	[bp+var_8C], ax
		mov	ax, word ptr [bp+var_42+1]
		mov	[bp+var_98], ax
		mov	ax, word ptr [bp+var_3E+1]
		mov	[bp+var_9A], ax
		mov	ax, [bp+var_98]
		mov	[bp+var_96], ax
		mov	ax, [bp+var_9A]
		mov	[bp+var_94], ax
		mov	ax, [bp+var_8C]
		mov	[bp+var_46], ax
		jmp	loc_31295

loc_3108C:
		mov	ax, [bp+var_8E]
		mov	[bp+var_44], ax
		jmp	loc_31286

loc_31096:
		cmp	[bp+var_44], 0
		jge	short loc_310A0
		xor	di, di
		jmp	short loc_310B1

loc_310A0:
		mov	ax, [si+3]
		cmp	ax, [bp+var_44]
		jg	short loc_310AE
		mov	di, [si+3]
		dec	di
		jmp	short loc_310B1

loc_310AE:
		mov	di, [bp+var_44]

loc_310B1:
		cmp	[bp+var_46], 0
		jge	short loc_310BE
		mov	[bp+var_48], 0
		jmp	short loc_310CF

loc_310BE:
		mov	ax, [si+3]
		cmp	ax, [bp+var_46]
		jg	short loc_310C9
		dec	ax
		jmp	short loc_310CC

loc_310C9:
		mov	ax, [bp+var_46]

loc_310CC:
		mov	[bp+var_48], ax

loc_310CF:
		mov	bx, [si+1]
		mov	ax, [bx+5]
		mov	dx, [bx+3]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	ax, [bp+var_48]
		imul	word ptr [si+3]
		add	ax, di
		shl	ax, 1
		add	[bp+var_4], ax
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx], 0
		jz	short loc_31104
		mov	ax, [bp+var_4A]
		mov	[bp+var_9C], ax
		mov	bx, es:[bx]
		mov	[bx+2], ax
		jmp	loc_31207

loc_31104:
		mov	ax, [si+1]
		add	ax, 0Bh
		mov	[bp+var_9E], ax
		mov	ax, [bp+var_48]
		imul	word ptr [si+3]
		add	ax, di
		mov	[bp+var_A0], ax
		mov	ax, [bp+var_4A]
		mov	[bp+var_A2], ax
		push	20h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_31132
		jmp	loc_311F0

loc_31132:
		mov	word ptr [di], 145Ch
		mov	word ptr [di], 146Ch
		add	ax, 4
		mov	word ptr [bp+var_A6+2], ds
		mov	word ptr [bp+var_A6], ax
		cmp	[bp+var_A6], 0
		jz	short loc_31153
		mov	dx, word ptr [bp+var_A6+2]
		jmp	short loc_31166

loc_31153:
		push	large 2
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+var_A6+2], dx
		mov	word ptr [bp+var_A6], ax

loc_31166:
		or	ax, dx
		jz	short loc_3116C
		jmp	short loc_3116C

loc_3116C:
		mov	dword ptr [di+8], 0
		mov	byte ptr [di+0Ch], 2
		mov	byte ptr [di+0Dh], 0
		mov	dword ptr [di+0Eh], 0
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_AA+2], ds
		mov	word ptr [bp+var_AA], ax
		cmp	[bp+var_AA], 0
		jz	short loc_3119F
		mov	dx, word ptr [bp+var_AA+2]
		jmp	short loc_311B2

loc_3119F:
		push	large 2
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+var_AA+2], dx
		mov	word ptr [bp+var_AA], ax

loc_311B2:
		or	ax, dx
		jz	short loc_311B8
		jmp	short loc_311B8

loc_311B8:
		mov	word ptr [di+6], 0
		mov	word ptr [di+14h], 0
		mov	word ptr [di+16h], 0
		mov	dword ptr [di+18h], 0
		mov	dword ptr [di+1Ch], 0
		push	[bp+var_A2]
		push	[bp+var_A0]
		push	[bp+var_9E]
		push	di
		call	sub_73F00
		add	sp, 8
		mov	ax, di
		jmp	short loc_311F2

loc_311F0:
		mov	ax, di

loc_311F2:
		les	bx, [bp+var_4]
		mov	es:[bx], ax
		push	[bp+var_2]
		push	bx
		push	658Ch
		call	sub_321AD
		add	sp, 6

loc_31207:
		mov	ax, [bp+arg_12]
		or	ax, ax
		jz	short loc_3121A
		cmp	ax, 1
		jz	short loc_3122D
		cmp	ax, 2
		jz	short loc_3124A
		jmp	short loc_31283

loc_3121A:
		push	si
		push	[bp+arg_2]
		les	bx, [bp+var_4]
		push	word ptr es:[bx]
		push	cs
		call	near ptr TriOverlay_RenderRegion_30C62
		add	sp, 6
		jmp	short loc_31283

loc_3122D:
		push	[bp+arg_8]
		les	bx, [bp+var_4]
		push	word ptr es:[bx]
		push	cs
		call	near ptr sub_30DA2
		add	sp, 4
		mov	[bp+var_5], al
		cmp	[bp+var_5], 0
		jz	short loc_31283
		mov	al, 1
		jmp	short loc_312A1

loc_3124A:
		mov	al, [bp+arg_10]
		push	ax
		mov	bx, [bp+arg_E]
		mov	eax, [bx]
		mov	[bp+var_AE], eax
		shl	eax, 8
		mov	[bp+var_B2], eax
		lea	ax, word ptr [bp+var_B2]
		push	ax
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		les	bx, [bp+var_4]
		push	word ptr es:[bx]
		push	cs
		call	near ptr sub_30E03
		add	sp, 10h

loc_31283:
		inc	[bp+var_44]

loc_31286:
		mov	ax, [bp+var_44]
		cmp	ax, [bp+var_96]
		jg	short loc_31292
		jmp	loc_31096

loc_31292:
		inc	[bp+var_46]

loc_31295:
		mov	ax, [bp+var_46]
		cmp	ax, [bp+var_94]
		jg	short loc_312A1
		jmp	loc_3108C

loc_312A1:
		pop	di
		pop	si
		leave
		retf
sub_30E0B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_312A5		proc far

var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_34], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_30], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_2C], eax
		mov	[bp+var_10], 0
		mov	[bp+var_12], 0
		mov	[bp+var_16], 0
		mov	[bp+var_14], 0
		mov	ax, [bp+arg_2]
		mov	[bp+var_18], ax
		push	0
		push	0
		mov	[bp+var_1C], 0
		lea	ax, word ptr [bp+var_1C]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		mov	[bp+var_20], 0
		lea	ax, word ptr [bp+var_20]
		push	ax
		lea	ax, word ptr [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_10]
		push	ax
		push	[bp+var_12]
		push	[bp+var_18]
		push	si
		push	cs
		call	near ptr sub_30E0B
		add	sp, 14h
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	large dword_7CC9E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		mov	ax, word_77BF2
		mov	dx, word_7CC9C
		mov	[bp+var_22], ax
		mov	[bp+var_24], dx
		xor	di, di
		jmp	short loc_31373

loc_31361:
		les	bx, [bp+var_24]
		and	byte ptr es:[bx+10h], 7Fh
		and	byte ptr es:[bx+10h], 0BFh
		add	[bp+var_24], 1Eh
		inc	di

loc_31373:
		cmp	di, 3Ch
		jl	short loc_31361
		mov	dword_77BF0, 0
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	large dword_7CC9E
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	word_77BF2, dx
		mov	word ptr dword_77BF0, ax
		mov	ax, word_77BF2
		mov	dx, word_7CC9A
		mov	word ptr [bp+var_28+2], ax
		mov	word ptr [bp+var_28], dx
		xor	di, di
		jmp	short loc_31403

loc_313AF:
		cmp	byte ptr [di+6578h], 0
		jz	short loc_313BA
		dec	byte ptr [di+6578h]

loc_313BA:
		les	bx, word ptr [bp+var_28]
		cmp	dword ptr es:[bx+14h], 0
		jz	short loc_313FE
		mov	al, [di+6578h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_313FE
		mov	al, es:[bx+24h]
		mov	ah, 0
		shl	ax, 4
		mov	dx, si
		add	dx, ax
		add	dx, 3Dh
		push	dx
		push	word ptr [bp+var_28+2]
		push	bx
		call	sub_2EB67
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_313FE
		push	large [bp+var_28]
		call	Render_FacePipeline_2EEB8
		add	sp, 4

loc_313FE:
		add	word ptr [bp+var_28], 26h
		inc	di

loc_31403:
		cmp	di, 14h
		jl	short loc_313AF
		mov	dword_77BF0, 0
		pop	di
		pop	si
		leave
		retf
sub_312A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Model_RenderStatic (sub_32490 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,72L — variante
; simplifiée orchestrant sub_31E87 avec position par défaut (0,0,0) : rendu d'un modèle 3D
; statique (sans sous-composants mobiles).
; ==============================================================================================
Model_RenderStatic		proc far

var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		mov	dx, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	[bp+var_6], 0
		mov	eax, [bp+var_6]
		mov	[bp+var_2C], eax
		mov	[bp+var_A], 0
		mov	eax, [bp+var_A]
		mov	[bp+var_28], eax
		mov	[bp+var_E], 0
		mov	eax, [bp+var_E]
		mov	[bp+var_24], eax
		mov	[bp+var_12], 0
		mov	[bp+var_14], 0
		mov	[bp+var_18], 0
		mov	[bp+var_16], 0
		push	1
		push	0
		mov	[bp+var_1C], 0
		lea	ax, word ptr [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		mov	[bp+var_20], 0
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	[bp+arg_2]
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	[bp+var_14]
		push	[bp+var_2]
		push	dx
		push	cs
		call	near ptr sub_30E0B
		add	sp, 14h
		or	al, al
		jz	short loc_314A7
		mov	al, 1
		jmp	short loc_314A9

loc_314A7:
		mov	al, 0

loc_314A9:
		leave
		retf
Model_RenderStatic		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Model_RenderAtPosition
; (sub_32526 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,36L — wrapper vers sub_31E87 avec position fixe insérée : wrapper de rendu de
; modèle 3D à une position donnée.
; ==============================================================================================
Model_RenderAtPosition		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= byte ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	dx, [bp+arg_0]
		mov	[bp+var_2], 0
		push	2
		mov	al, [bp+arg_E]
		push	ax
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+var_2]
		push	dx
		push	cs
		call	near ptr sub_30E0B
		add	sp, 14h
		leave
		retf
Model_RenderAtPosition		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_314DE		proc far
		push	bp
		mov	bp, sp
		mov	dword_7CC9E, 0
		mov	byte_7CCA2, 2
		mov	byte_7CCA3, 0
		mov	dword_7CCA4, 0
		pop	bp
		retf
sub_314DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_314FF		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7CCA3, 0
		jz	short loc_31527
		cmp	dword_7CC9E, 0
		jz	short loc_31527
		push	0
		mov	al, byte_7CCA2
		push	ax
		push	656Eh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_31527

loc_31527:
		mov	dword_7CC9E, 0
		mov	byte_7CCA3, 0
		mov	dword_7CCA4, 0
		pop	bp
		retf
sub_314FF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31540		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_315AB
		mov	word ptr [si], 146Ch
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		cmp	byte ptr [si+0Dh], 0
		jz	short loc_3157F
		cmp	dword ptr [si+8], 0
		jz	short loc_3157F
		push	0
		mov	al, [si+0Ch]
		push	ax
		mov	ax, si
		add	ax, 8
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_3157F

loc_3157F:
		mov	dword ptr [si+8], 0
		mov	byte ptr [si+0Dh], 0
		mov	dword ptr [si+0Eh], 0
		push	0
		push	si
		call	sub_320B9
		add	sp, 4
sub_31540		endp

; START OF FUNCTION CHUNK FOR sub_31540
		db 0F7h, 0C7h
; END OF FUNCTION CHUNK FOR sub_31540
seg079		ends
