seg059		segment	para public 'CODE' use16
		assume cs:seg059
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE EN PARTIE 2026-11-11 (construction du quadrilatère). (image de l'instrument, objet
; du cockpit, point du 3SPC, largeur, hauteur) : coin 0 = position de l'objet du cockpit
; (+12h) + point tourné par sa matrice (sub_5A629) ; coin 1 = coin 0 + (largeur, 0, 0) tourné
; ; coin 2 = coin 0 + (largeur, 0, −hauteur) ; coin 3 = coin 0 + (0, 0, −hauteur) : rectangle
; dans le plan vertical de l'avion, la largeur le long de l'envergure, la hauteur vers le bas.
; 15 instruments au plus par image (compteur word_777AA, erreur D00Fh). La suite (envoi au
; dessin) n'est pas lue.
; ==============================================================================================
CockpitInstrument_PlaceQuadIn3D_237B0		proc far

var_156		= dword ptr -156h
var_152		= dword ptr -152h
var_14E		= dword ptr -14Eh
var_146		= dword ptr -146h
var_142		= dword ptr -142h
var_13E		= dword ptr -13Eh
var_13A		= dword ptr -13Ah
var_136		= dword ptr -136h
var_132		= dword ptr -132h
var_12E		= dword ptr -12Eh
var_12A		= dword ptr -12Ah
var_126		= dword ptr -126h
var_122		= dword ptr -122h
var_11E		= dword ptr -11Eh
var_11A		= dword ptr -11Ah
var_116		= word ptr -116h
var_F6		= dword ptr -0F6h
var_F2		= word ptr -0F2h
var_E2		= dword ptr -0E2h
var_DE		= dword ptr -0DEh
var_DA		= dword ptr -0DAh
var_B9		= word ptr -0B9h
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 146h
		push	si
		push	di
		mov	si, [bp+arg_2]
		push	seg seg059
		push	offset sub_23D3E
		push	5
		push	large 4
		push	2Ah
		push	ss
		lea	ax, word ptr [bp+var_E2]
		push	ax
		call	sub_149D
		add	sp, 10h
		mov	[bp+var_116], 107Ch
		push	ss
		lea	ax, [bp+var_116]
		push	ax
		call	sub_23ED5
		add	sp, 4
		mov	[bp+var_116], 10A4h
		mov	[bp+var_116], 10CCh
		mov	[bp+var_F6], 0
		movzx	eax, word_7977C
		cmp	eax, dword_7CB24
		jle	short loc_23817
		mov	dword_7CB24, eax
		mov	word_777AA, 0

loc_23817:
		mov	byte_778FC, 0
		xor	di, di
		jmp	short loc_23876

loc_23820:
		mov	bx, di
		imul	bx, bx, 2Ah
		lea	ax, word ptr [bp+var_DA]
		add	bx, ax
		xor	eax, eax
		mov	ss:[bx], eax
		mov	bx, di
		imul	bx, bx, 2Ah
		lea	dx, word ptr [bp+var_DE]
		add	bx, dx
		mov	ss:[bx], eax
		mov	bx, di
		imul	bx, bx, 2Ah
		lea	dx, word ptr [bp+var_E2]
		add	bx, dx
		mov	ss:[bx], eax
		mov	bx, di
		imul	bx, bx, 2Ah
		lea	ax, [bp+var_B9]
		add	bx, ax
		and	byte ptr ss:[bx], 0FDh
		mov	bx, di
		imul	bx, bx, 2Ah
		add	bx, ax
		and	byte ptr ss:[bx], 0FBh
		mov	bx, di
		imul	bx, bx, 2Ah
		add	bx, ax
		and	byte ptr ss:[bx], 0F7h
		inc	di

loc_23876:
		cmp	di, 4
		jl	short loc_23820
		mov	ax, word_777AA
		imul	ax, ax, 0Eh
		mov	dx, word_7CB22
		mov	bx, word_7CB20
		add	bx, ax
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], bx
		inc	word_777AA
		cmp	word_777AA, 0Fh
		jnz	short loc_238A5
		push	0D00Fh
		call	sub_1DDFE
		pop	cx

loc_238A5:
		push	[bp+arg_4]
		mov	bx, [bp+arg_4]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_6], ax
		mov	di, [bp+arg_4]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_122], eax
		mov	eax, [di+4]
		mov	[bp+var_11E], eax
		mov	eax, [di+8]
		mov	[bp+var_11A], eax
		mov	di, [bp+arg_6]
		mov	eax, [di]
		mov	[bp+var_12E], eax
		mov	eax, [di+4]
		mov	[bp+var_12A], eax
		mov	eax, [di+8]
		mov	[bp+var_126], eax
		push	[bp+var_6]
		lea	ax, word ptr [bp+var_12E]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, [bp+var_12E]
		add	[bp+var_122], eax
		mov	eax, [bp+var_12A]
		add	[bp+var_11E], eax
		mov	eax, [bp+var_126]
		add	[bp+var_11A], eax
		mov	eax, [bp+var_122]
		mov	[bp+var_E2], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_DE], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_DA], eax
		mov	eax, [bp+var_122]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_122]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_122]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_5C], eax
		mov	[bp+var_A], 0
		sub	sp, 4
		mov	eax, [bp+var_A]
		mov	[bp+var_14E], eax
		sub	sp, 4
		mov	[bp+var_152], eax
		sub	sp, 4
		mov	eax, [bp+arg_8]
		mov	[bp+var_156], eax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		call	Utility_Helper_57C2E
		add	sp, 0Eh
		push	[bp+var_6]
		lea	ax, word ptr [bp+var_13A]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, [bp+var_B8]
		add	eax, [bp+var_13A]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_B4]
		add	eax, [bp+var_136]
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_B0]
		add	eax, [bp+var_132]
		mov	[bp+var_B0], eax
		sub	sp, 4
		mov	eax, [bp+arg_C]
		neg	eax
		mov	[bp+var_E], eax
		mov	[bp+var_14E], eax
		sub	sp, 4
		mov	eax, [bp+var_A]
		mov	[bp+var_152], eax
		sub	sp, 4
		mov	eax, [bp+arg_8]
		mov	[bp+var_156], eax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		call	Utility_Helper_57C2E
		add	sp, 0Eh
		push	[bp+var_6]
		lea	ax, word ptr [bp+var_13A]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, [bp+var_8E]
		add	eax, [bp+var_13A]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8A]
		add	eax, [bp+var_136]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_86]
		add	eax, [bp+var_132]
		mov	[bp+var_86], eax
		sub	sp, 4
		mov	eax, [bp+arg_C]
		neg	eax
		mov	[bp+var_12], eax
		mov	[bp+var_14E], eax
		sub	sp, 4
		mov	eax, [bp+var_A]
		mov	[bp+var_152], eax
		sub	sp, 4
		mov	[bp+var_156], eax
		lea	ax, word ptr [bp+var_13A]
		push	ax
		call	Utility_Helper_57C2E
		add	sp, 0Eh
		push	[bp+var_6]
		lea	ax, word ptr [bp+var_13A]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	eax, [bp+var_64]
		add	eax, [bp+var_13A]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_60]
		add	eax, [bp+var_136]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_5C]
		add	eax, [bp+var_132]
		mov	[bp+var_5C], eax
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_64]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_8E]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_B8]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_E2]
		push	ax
		push	ss
		lea	ax, [bp+var_116]
		push	ax
		call	sub_244DE
		add	sp, 18h
		lea	ax, [bp+var_F2]
		mov	[bp+var_1E], ss
		mov	[bp+var_20], ax
		les	bx, [bp+var_20]
		mov	word ptr es:[bx], 0
		mov	word ptr es:[bx+2], 0
		mov	ax, [si+8]
		sub	ax, [si+4]
		mov	es:[bx+4], ax
		mov	word ptr es:[bx+6], 0
		mov	ax, [si+8]
		sub	ax, [si+4]
		mov	es:[bx+8], ax
		mov	ax, [si+0Ah]
		sub	ax, [si+6]
		mov	es:[bx+0Ah], ax
		mov	word ptr es:[bx+0Ch], 0
		mov	ax, [si+0Ah]
		sub	ax, [si+6]
		mov	es:[bx+0Eh], ax
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+8], ax
		mov	ax, [si+0Ah]
		sub	ax, [si+6]
		inc	ax
		mov	es:[bx+0Ah], ax
		mov	di, es:[bx+0Ah]
		mov	ax, es:[bx+8]
		mov	[bp+var_22], ax
		push	2
		push	word ptr [si]
		mov	bx, [si+2]
		push	word ptr [bx]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_2A], eax
		les	bx, word ptr [bp+var_4]
		cmp	dword ptr es:[bx+4], 0
		jz	short loc_23BA7
		jmp	loc_23C56

loc_23BA7:
		push	1
		push	0
		push	2
		mov	ax, di
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_26+2], dx
		mov	word ptr [bp+var_26], ax
		push	0
		push	2
		push	word ptr [bp+var_26+2]
		push	ax
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_34], dx
		mov	[bp+var_36], ax
		mov	[bp+var_3A], 0
		jmp	short loc_23C13

loc_23BEC:
		movzx	eax, [bp+var_22]
		mov	edx, [bp+var_3A]
		imul	edx, eax
		mov	eax, [bp+var_2A]
		add	eax, edx
		mov	dx, word ptr [bp+var_3A]
		shl	dx, 2
		les	bx, [bp+var_36]
		add	bx, dx
		mov	es:[bx], eax
		inc	[bp+var_3A]

loc_23C13:
		movzx	eax, di
		cmp	eax, [bp+var_3A]
		jg	short loc_23BEC
		push	2
		push	large [bp+var_26]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+4], eax
		push	2
		mov	ax, word ptr [bp+var_4]
		add	ax, 4
		push	word ptr [bp+var_4+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx], eax

loc_23C56:
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_116]
		push	ax
		call	sub_2586A
		add	sp, 8
		mov	si, [bp+arg_4]
		add	si, 12h
		mov	eax, [si]
		sub	eax, dword_7CA18
		mov	[bp+var_146], eax
		mov	eax, [si+4]
		sub	eax, dword_7CA1C
		mov	[bp+var_142], eax
		mov	eax, [si+8]
		sub	eax, dword_7CA20
		mov	[bp+var_13E], eax
		push	[bp+var_6]
		lea	ax, word ptr [bp+var_146]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		lea	ax, word ptr [bp+var_146]
		push	ax
		push	ss
		lea	ax, [bp+var_116]
		push	ax
		mov	bx, [bp+var_116]
		call	dword ptr [bx+20h]
		add	sp, 6
		xor	di, di
		jmp	short loc_23CD6

loc_23CC0:
		mov	ax, di
		imul	ax, ax, 2Ah
		lea	dx, word ptr [bp+var_E2]
		add	ax, dx
		push	ss
		push	ax
		call	sub_288FB
		add	sp, 4
		inc	di

loc_23CD6:
		cmp	di, 4
		jl	short loc_23CC0
		push	ss
		lea	ax, [bp+var_116]
		push	ax
		call	sub_25882
		add	sp, 4
		mov	word ptr [bp+var_2E+2], dx
		mov	word ptr [bp+var_2E], ax
		cmp	[bp+var_2E], 0
		jz	short loc_23D3A
		les	bx, word ptr [bp+var_2E]
		mov	dword ptr es:[bx+2], 1
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	ax, word_7CBC8
		shl	ax, 2
		mov	dx, word_7CBDC
		sub	dx, 100h
		cmp	ax, dx
		jbe	short loc_23D21
		mov	ax, 1
		jmp	short loc_23D23

loc_23D21:
		xor	ax, ax

loc_23D23:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_23D3A
		push	large [bp+var_32]
		push	6496h
		call	sub_293E7
		add	sp, 6
		jmp	short loc_23D3A

loc_23D3A:
		pop	di
		pop	si
		leave
		retf
CockpitInstrument_PlaceQuadIn3D_237B0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23D3E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		add	ax, 0Ch
		mov	ax, [bp+arg_0]
		add	ax, 18h
		mov	ax, [bp+arg_0]
		add	ax, 1Ch
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_23D3E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23D5B		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_23D5B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23D60		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		add	ax, 24h
		push	[bp+arg_2]
		push	ax
		lea	ax, [bp+arg_4]
sub_23D60		endp
seg059		ends
