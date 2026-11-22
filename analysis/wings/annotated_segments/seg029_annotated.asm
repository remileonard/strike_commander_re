seg029		segment	para public 'CODE' use16
		assume cs:seg029
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16E11		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_16E65
		mov	word ptr [si], 1613h
		jmp	short loc_16E37

loc_16E29:
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6

loc_16E37:
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_16E29
		mov	word ptr [si], 492h
		push	si
		call	sub_4870F
		pop	cx
		test	di, 1
		jz	short loc_16E65
		push	si
		call	sub_33B
		pop	cx

loc_16E65:
		pop	di
		pop	si
		leave
		retf
sub_16E11		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16E69		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+15h], 3
		jnz	short loc_16E8D
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_16E93

loc_16E8D:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_16E93:
		push	dx
		push	ax
		call	sub_4A3E2
		mov	[si+20h], ax
		cmp	word ptr [si+20h], 1
		jle	short loc_16EAE
		mov	byte ptr [si+1Dh], 1
		mov	word ptr [si+1Bh], 1
		jmp	short loc_16EB2

loc_16EAE:
		mov	byte ptr [si+1Dh], 0

loc_16EB2:
		mov	byte ptr [si+2Ch], 0
		mov	byte ptr [si+1Eh], 0
		mov	ax, [si+20h]
		mov	[si+24h], ax
		mov	[si+22h], ax
		mov	word ptr [si+26h], 0
		mov	word ptr [si+2Ah], 0
		mov	word ptr [si+28h], 0
		mov	byte ptr [si+2Eh], 0FFh
		mov	byte ptr [si+2Dh], 0
		pop	si
		pop	bp
		retf
sub_16E69		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16EDD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+16h], 0
		jz	short loc_16F0A
		cmp	dword ptr [si+11h], 0
		jz	short loc_16F0A
		push	0
		mov	al, [si+15h]
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_16F0A

loc_16F0A:
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		pop	si
		pop	bp
		retf
sub_16EDD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; TalkingHead_SetBaseFrame_CE08B (sub_CE08B de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions,
; 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; TalkingHead_SetBaseFrame_9D32 (sub_9D32 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Image de base +2118 et image
; affichée +2124 = arg_2.
; ==============================================================================================
TalkingHead_SetBaseFrame_16F21		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+1Dh], 0
		mov	ax, [bp+arg_2]
		mov	[si+1Bh], ax
		pop	si
		pop	bp
		retf
TalkingHead_SetBaseFrame_16F21		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16F35		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+22h], ax
		mov	ax, [bp+arg_4]
		mov	[si+24h], ax
		pop	si
		pop	bp
		retf
sub_16F35		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16F4B		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		mov	ax, [si+1Bh]
		cmp	ax, [si+24h]
		jnz	short loc_16FB6
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	0
		cmp	byte ptr [si+15h], 3
		jnz	short loc_16F9C
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_16FA2

loc_16F9C:
		mov	dx, [si+13h]
		mov	ax, [si+11h]

loc_16FA2:
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_5DD42
		call	sub_4A194
		add	sp, 0Ch

loc_16FB6:
		push	si
		call	Layer_DrawAtOwnPos_461CC
		pop	cx
		pop	si
		leave
		retf
sub_16F4B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16FC0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+2Ch], 1
		pop	si
		pop	bp
		retf
sub_16FC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16FCE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+2Ch], 0
		pop	si
		pop	bp
		retf
sub_16FCE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_16FDC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+1Dh], 0
		jnz	short loc_16FEC
		jmp	loc_1707A

loc_16FEC:
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_1701D
		mov	ax, [si+1Bh]
		cmp	ax, [si+22h]
		jb	short loc_16FFF
		cmp	ax, [si+24h]
		jbe	short loc_17007

loc_16FFF:
		mov	ax, [si+22h]
		mov	[si+1Bh], ax
		jmp	short loc_17012

loc_17007:
		mov	ax, [si+1Bh]
		cmp	ax, [si+24h]
		jz	short loc_17012
		inc	word ptr [si+1Bh]

loc_17012:
		mov	word ptr [si+28h], 0
		mov	byte ptr [si+2Ch], 0
		jmp	short loc_1707A

loc_1701D:
		cmp	word ptr [si+2Ah], 0
		jz	short loc_17061
		mov	ax, [si+1Bh]
		cmp	ax, [si+22h]
		ja	short loc_1704C
		mov	ax, [si+28h]
		shl	ax, 1
		mov	bx, [si+26h]
		add	bx, ax
		mov	ax, [bx]
		mov	[si+1Bh], ax
		inc	word ptr [si+28h]
		mov	ax, [si+28h]
		cmp	ax, [si+2Ah]
		jl	short loc_1707A
		mov	word ptr [si+28h], 0
		jmp	short loc_1707A

loc_1704C:
		inc	word ptr [si+1Bh]
		mov	ax, [si+1Bh]
		cmp	ax, [si+20h]
		jb	short loc_1707A
		mov	bx, [si+26h]
		mov	ax, [bx]
		mov	[si+1Bh], ax
		jmp	short loc_1707A

loc_17061:
		inc	word ptr [si+1Bh]
		mov	ax, [si+22h]
		inc	ax
		cmp	ax, [si+1Bh]
		jz	short loc_17075
		mov	ax, [si+1Bh]
		cmp	ax, [si+20h]
		jb	short loc_1707A

loc_17075:
		mov	word ptr [si+1Bh], 1

loc_1707A:
		push	si
		call	sub_45BE9
		pop	cx
		pop	si
		pop	bp
		retf
sub_16FDC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17084		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_8]
		or	si, si
		jnz	short loc_170A7
		push	3Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_170A7
		jmp	loc_17138

loc_170A7:
		push	[bp+arg_6]
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		call	LayerGroup_Construct_45C22
		add	sp, 8
		mov	word ptr [si], 981h
		mov	word ptr [si+0Ah], 9A1h
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si+21h], 0
		mov	byte ptr [si+2Ch], 0
		mov	word ptr [si+39h], 492h
		xor	ax, ax
		mov	[si+3Dh], ax
		mov	[si+3Bh], ax
		mov	word ptr [si+39h], 1613h
		mov	word ptr [si+23h], 0
		mov	word ptr [si+25h], 0
		mov	word ptr [si+27h], 13Fh
		mov	word ptr [si+29h], 0C7h
		push	0
		mov	ax, si
		add	ax, 1Fh
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 1Fh
		push	ax
		push	0
		call	Widget_ApplyStyleAndAllocate_48C4D
		add	sp, 6
		mov	[si+2Dh], ax
		mov	[bp+var_2], di
		mov	bx, [si+2Dh]
		mov	ax, [bp+var_2]
		mov	[bx+14h], ax
		mov	word ptr [si+37h], 0
		mov	byte ptr [si+30h], 0
		mov	byte ptr [si+31h], 0
		mov	byte ptr [si+32h], 0FFh

loc_17138:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_17084		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1713E		proc far

var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di]
		mov	[bp+var_A], ax
		mov	ax, [di+2]
		mov	[bp+var_8], ax
		mov	ax, [di+4]
		mov	[bp+var_6], ax
		mov	ax, [di+6]
		mov	[bp+var_4], ax
		mov	al, [bp+arg_4]
		mov	[bp+var_B], al
		mov	ax, [bp+arg_6]
		mov	[bp+var_E], ax
		push	16h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_171ED
		mov	ax, [bp+var_A]
		mov	[bp+var_16], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_12], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_10], ax
		mov	word ptr [di], 0A2Dh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 15C7h
		mov	ax, di
		add	ax, 6
		push	ds
		push	ax
		lea	ax, [bp+var_16]
		push	ss
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy
		push	[bp+var_E]
		call	CRT_Strdup
		pop	cx
		mov	[di+4], ax
		mov	word ptr [di+0Eh], 0A2Dh
		mov	word ptr [di+10h], 0
		mov	word ptr [di+0Eh], 15A3h
		mov	word ptr [di], 15CBh
		mov	word ptr [di+0Eh], 15EFh
		mov	byte ptr [di+15h], 0
		mov	word ptr [di+12h], 0
		mov	al, [bp+var_B]
		mov	[di+14h], al
		mov	ax, di
		jmp	short loc_171EF

loc_171ED:
		mov	ax, di

loc_171EF:
		mov	dx, ax
		or	dx, dx
		jz	short loc_171FA
		add	ax, 0Eh
		jmp	short loc_171FC

loc_171FA:
		mov	ax, dx

loc_171FC:
		mov	[bp+var_2], ax
		push	ax
		mov	ax, si
		add	ax, 39h
		push	ax
		call	LinkedListB_InsertAtTail_48623
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_1713E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17212		proc far

var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_A], ax
		mov	al, [bp+arg_A]
		mov	[bp+var_B], al
		mov	ax, [bp+arg_C]
		mov	[bp+var_E], ax
		push	1Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_172AE
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[di], eax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[di+4], eax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[di+8], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		mov	[di+0Ch], eax
		mov	word ptr [di+10h], 0A2Dh
		mov	word ptr [di+12h], 0
		mov	word ptr [di+10h], 15A3h
		mov	word ptr [di+18h], 155Bh
		mov	word ptr [di+10h], 157Fh
		mov	byte ptr [di+17h], 0
		mov	word ptr [di+14h], 0
		push	[bp+var_E]
		call	CRT_Strdup
		pop	cx
		mov	[di+1Ah], ax
		mov	al, [bp+var_B]
		mov	[di+16h], al
		mov	ax, di
		jmp	short loc_172B0

loc_172AE:
		mov	ax, di

loc_172B0:
		mov	dx, ax
		or	dx, dx
		jz	short loc_172BB
		add	ax, 10h
		jmp	short loc_172BD

loc_172BB:
		mov	ax, dx

loc_172BD:
		mov	[bp+var_2], ax
		push	ax
		mov	ax, si
		add	ax, 39h
		push	ax
		call	LinkedListB_InsertAtTail_48623
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_17212		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_172D3		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_172F7

loc_172E4:
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		cmp	al, [bp+arg_4]
		jnz	short loc_172F7
		mov	ax, [bp+arg_2]
		mov	[bx+4], ax
		jmp	short loc_1731B

loc_172F7:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 39h
		push	ax
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_172E4
		push	0
		push	word_5B254
		call	sub_9D78
		add	sp, 4

loc_1731B:
		pop	si
		leave
		retf
sub_172D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1731E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di]
		mov	[si+33h], ax
		mov	bx, [bp+arg_4]
		mov	ax, [bx]
		mov	[si+35h], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_1731E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1733A		proc far

var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_606D8
		mov	[bp+var_1], 0
		mov	word ptr [si+37h], 0
		mov	[bp+var_4], 0
		jmp	short loc_17384

loc_17359:
		push	word ptr [si+35h]
		push	word ptr [si+33h]
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 6
		or	al, al
		jz	short loc_17384
		mov	bx, [bp+var_4]
		cmp	byte ptr [bx+7], 0
		jz	short loc_17384
		mov	[bp+var_1], 1
		mov	ax, [bp+var_4]
		mov	[si+37h], ax

loc_17384:
		lea	ax, [bp+var_4]
		push	ax
		mov	ax, si
		add	ax, 39h
		push	ax
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_17359
		cmp	[bp+var_1], 0
		jz	short loc_173BD
		push	word ptr [si+37h]
		push	si
		nop
		push	cs
		call	near ptr sub_1741B
		add	sp, 4
		or	di, di
		jz	short loc_173D2
		call	TextScrollDisplayB_ApplyHelperD_571DE
		mov	word_606D8, 0
		jmp	short loc_173CD

loc_173BD:
		cmp	di, 1
		jz	short loc_173D2
		call	TextScrollDisplayB_ApplyHelperD_571DE
		mov	word_606D8, 1

loc_173CD:
		call	TextScrollDisplayB_ApplyHelperC_571A4

loc_173D2:
		pop	di
		pop	si
		leave
		retf
sub_1733A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_173D6		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, word_5E7CC
		mov	[bp+var_2], ax
		mov	ax, word_5E7CE
		mov	[bp+var_4], ax
		mov	ax, [si+33h]
		cmp	ax, [bp+var_2]
		jnz	short loc_173FC
		mov	ax, [si+35h]
		cmp	ax, [bp+var_4]
		jz	short loc_17416

loc_173FC:
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_2]
		push	ax
		push	si
		push	cs
		call	near ptr sub_1731E
		add	sp, 6
		push	si
		push	cs
		call	near ptr sub_1733A
		pop	cx
		mov	al, 1
		jmp	short loc_17418

loc_17416:
		mov	al, 0

loc_17418:
		pop	si
		leave
		retf
sub_173D6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1741B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0AFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+0Ch]
		pop	cx
		push	ax
		push	2
		push	154Dh
		push	word ptr [si+2Dh]
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah
		pop	di
		pop	si
		pop	bp
		retf
sub_1741B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17445		proc far

var_24		= word ptr -24h
var_21		= byte ptr -21h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		call	sub_1F377
		mov	byte ptr [bp+var_8], 0
		mov	[bp+var_D], 0
		mov	[bp+var_10], 0
		push	0
		push	word_5DD44
		call	TextScrollDisplayB_ApplyHelperA_57104
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_571A4
		mov	dword ptr [si+19h], 0
		mov	eax, dword_5E7D3
		mov	[si+15h], eax
		push	si
		push	cs
		call	near ptr sub_173D6
		pop	cx

loc_1748E:
		push	0
		call	sub_1F7CA
		pop	cx
		mov	eax, [si+15h]
		add	eax, [si+19h]
		cmp	eax, dword_5E7D3
		ja	short loc_174AA
		mov	ax, 1
		jmp	short loc_174AC

loc_174AA:
		xor	ax, ax

loc_174AC:
		or	al, al
		jnz	short loc_174B3
		jmp	loc_1768F

loc_174B3:
		mov	ax, si
		add	ax, 1Fh
		mov	[bp+var_16], ax
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	sub_469A5
		add	sp, 4
		movzx	eax, word ptr [si+10h]
		mov	[bp+var_1A], eax
		mov	[si+19h], eax
		mov	eax, dword_5E7D3
		mov	[si+15h], eax
		mov	[bp+var_1C], 0
		jmp	short loc_174FB

loc_174E4:
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_1C]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_174FB:
		lea	ax, [bp+var_1C]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_48578
		add	sp, 4
		or	ax, ax
		jnz	short loc_174E4
		mov	[bp+var_1E], 0
		mov	[bp+var_20], 0
		jmp	short loc_17596

loc_1751D:
		mov	bx, [bp+var_1E]
		cmp	byte ptr [bx+7], 0
		jz	short loc_17596
		mov	ax, [si+37h]
		cmp	ax, [bp+var_1E]
		jnz	short loc_17564
		cmp	word ptr [bx+4], 0
		jz	short loc_17553
		push	word ptr [bx+4]
		push	cs
		call	near ptr sub_16FC0
		pop	cx
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_1E]
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_17553:
		push	[bp+var_1E]
		mov	bx, [bp+var_1E]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx
		mov	[bp+var_20], ax
		jmp	short loc_17581

loc_17564:
		mov	bx, [bp+var_1E]
		cmp	word ptr [bx+4], 0
		jz	short loc_17581
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_17581:
		mov	bx, [bp+var_1E]
		cmp	word ptr [bx+4], 0
		jz	short loc_17596
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx

loc_17596:
		lea	ax, [bp+var_1E]
		push	ax
		mov	ax, si
		add	ax, 39h
		push	ax
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jz	short loc_175AF
		jmp	loc_1751D

loc_175AF:
		cmp	[bp+var_20], 0
		jz	short loc_175CB
		push	0AFh
		push	[bp+var_20]
		push	2
		push	1554h
		push	word ptr [si+2Dh]
		call	Widget_RenderComplexLayoutWrapper_4923E
		add	sp, 0Ah

loc_175CB:
		or	di, di
		jz	short loc_175E2
		push	0
		push	word ptr [di]
		mov	al, [di+2]
		push	ax
		push	di
		call	Palette_Upload_46BA1
		add	sp, 8
		xor	di, di

loc_175E2:
		push	word_5DD42
		call	sub_57317
		pop	cx
		push	word_5DD42
		push	word ptr [si+13h]
		call	UI_ApplyEncodingHelper_47B38
		add	sp, 4
		push	0
		mov	ax, si
		add	ax, 1Fh
		push	ax
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	word_5DD42
		call	sub_57329
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1762B
		push	si
		push	cs
		call	near ptr sub_1733A
		pop	cx

loc_1762B:
		cmp	[bp+var_D], 0
		jz	short loc_17685
		cmp	word ptr [si+37h], 0
		jz	short loc_17685
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	al, [bx+2Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_17685
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	ax, [bx+20h]
		dec	ax
		cmp	ax, [bp+var_10]
		jnz	short loc_17673
		call	TextScrollDisplayB_ApplyHelperD_571DE
		mov	bx, [si+37h]
		mov	al, [bx+6]
		mov	[bp+var_21], al
		lea	ax, [bp+var_14]
		push	ax
		call	sub_469CB
		pop	cx
		mov	al, [bp+var_21]

loc_17670:
		jmp	loc_17803

loc_17673:
		inc	[bp+var_10]
		mov	ax, [bp+var_10]
		mov	[bp+var_24], ax
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	[bx+1Bh], ax

loc_17685:
		lea	ax, [bp+var_14]
		push	ax
		call	sub_469CB
		pop	cx

loc_1768F:
		lea	ax, [bp+var_8]
		push	ax
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte ptr [bp+var_8], 0
		jnz	short loc_176C1
		lea	ax, [bp+var_8]
		push	ax
		call	sub_19B6B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_176C1
		lea	ax, word ptr [bp+var_C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_19979
		add	sp, 4
		jmp	short loc_176C1

loc_176C1:
		cmp	byte ptr [bp+var_8], 0
		jnz	short loc_176CA
		jmp	loc_17771

loc_176CA:
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jz	short loc_176D6
		jmp	loc_17771

loc_176D6:
		mov	al, byte ptr [bp+var_8]
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_176EB
		cmp	ax, 3
		jnz	short loc_176E8
		jmp	loc_17769

loc_176E8:
		jmp	loc_17771

loc_176EB:
		push	si
		push	cs
		call	near ptr sub_173D6
		pop	cx
		cmp	byte ptr [bp+var_8+1], 2
		jnz	short loc_176FC
		mov	ax, 1
		jmp	short loc_176FE

loc_176FC:
		xor	ax, ax

loc_176FE:
		mov	[si+30h], al
		cmp	word ptr [si+37h], 0
		jz	short loc_17769
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	al, [bx+2Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_17769
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	al, [bx+2Eh]
		mov	[bp+var_11], al
		mov	bx, [si+37h]
		cmp	word ptr [bx+4], 0
		jz	short loc_17749
		mov	bx, [bx+4]
		cmp	byte ptr [bx+1Eh], 0
		jz	short loc_17749
		mov	[bp+var_D], 1
		cmp	[bp+var_11], 0FFh
		jz	short loc_17769
		mov	ah, 0
		push	ax
		call	Music_RequestTune_3D174
		pop	cx
		jmp	short loc_17769

loc_17749:
		call	TextScrollDisplayB_ApplyHelperD_571DE
		cmp	[bp+var_11], 0FFh
		jnz	short loc_17757
		jmp	loc_177EE

loc_17757:
		mov	al, [bp+var_11]
		mov	ah, 0
		push	ax
		call	Music_RequestTune_3D174
		pop	cx
		jmp	loc_177EE
		jmp	loc_177EE

loc_17769:
		push	si
		push	cs
		call	near ptr sub_173D6
		pop	cx
		or	al, al

loc_17771:
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_1777A
		jmp	loc_1748E

loc_1777A:
		mov	al, byte ptr [bp+var_C]
		mov	ah, 0
		cmp	ax, 2
		jnz	short loc_177F7
		push	large [bp+var_C]
		push	si
		nop
		push	cs
		call	near ptr sub_17807
		add	sp, 6
		mov	[bp+var_11], al
		mov	ah, 0
		cmp	ax, 0Ah
		jz	short loc_177A2
		cmp	ax, 0Bh
		jz	short loc_177BE
		jmp	short loc_177F7

loc_177A2:
		push	si
		nop
		push	cs
		call	near ptr sub_178B9
		pop	cx
		call	sub_1F377
		push	si
		push	cs
		call	near ptr sub_173D6
		pop	cx
		mov	byte ptr [bp+var_C], 0
		mov	byte ptr [bp+var_8], 0
		jmp	short loc_177F7

loc_177BE:
		test	byte ptr [bp+var_C+3], 0C0h
		jz	short loc_177C9
		mov	ax, 1
		jmp	short loc_177CB

loc_177C9:
		xor	ax, ax

loc_177CB:
		or	al, al
		jz	short loc_177D5
		mov	byte ptr [si+30h], 1
		jmp	short loc_177D9

loc_177D5:
		mov	byte ptr [si+30h], 0

loc_177D9:
		cmp	word ptr [si+37h], 0
		jz	short loc_177F7
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	al, [bx+2Dh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_177F7

loc_177EE:
		mov	bx, [si+37h]
		mov	al, [bx+6]
		jmp	loc_17670

loc_177F7:
		mov	ax, 0C00h
		int	21h
		mov	byte ptr [bp+var_C], 0
		jmp	loc_1748E

loc_17803:
		pop	di
		pop	si
		leave
		retf
sub_17445		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17807		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_3		= byte ptr  9
arg_5		= byte ptr  0Bh

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_0]
		mov	al, [bp+arg_3]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	cx, 9
		mov	bx, offset word_17895

loc_1781E:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_2]
		jz	short loc_1782D
		add	bx, 2
		loop	short loc_1781E
		jmp	short loc_17862

loc_1782D:
		jmp	word ptr cs:[bx+12h] ; switch jump

loc_17831:
		mov	al, 1
		jmp	short loc_17893

loc_17835:
		mov	al, 2
		jmp	short loc_17893

loc_17839:
		mov	al, 3
		jmp	short loc_17893

loc_1783D:
		mov	al, 4
		jmp	short loc_17893

loc_17841:
		mov	al, 0Ah
		jmp	short loc_17893

loc_17845:
		mov	al, 0Bh
		jmp	short loc_17893

loc_17849:
		mov	al, 0Ch
		jmp	short loc_17893

loc_1784D:
		test	[bp+arg_5], 0C0h
		jz	short loc_17858
		mov	ax, 1
		jmp	short loc_1785A

loc_17858:
		xor	ax, ax

loc_1785A:
		or	al, al
		jz	short loc_17862
		mov	al, 0FFh
		jmp	short loc_17893

loc_17862:
		cmp	byte_605C0, 1
		jz	short loc_17870
		cmp	byte_605CC, 1
		jnz	short loc_17875

loc_17870:
		mov	ax, 1
		jmp	short loc_17877

loc_17875:
		xor	ax, ax

loc_17877:
		or	al, al
		jz	short loc_17888
		mov	al, [bp+arg_3]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+4B6Ah]
		jmp	short loc_17893

loc_17888:
		mov	al, [bp+arg_3]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+4AEAh]

loc_17893:
		leave
		retf
sub_17807		endp

; START OF FUNCTION CHUNK FOR sub_17807
word_17895	dw 0Fh
		dw 18h
		dw 1Ch
		dw 2Dh
		dw 48h
		dw 4Bh
		dw 4Dh
		dw 50h
		dw 54h
off_178A7	dw offset loc_17841
		dw offset loc_17849
		dw offset loc_17845
		dw offset loc_1784D
		dw offset loc_17831
		dw offset loc_1783D
		dw offset loc_17835
		dw offset loc_17839
		dw offset loc_17845
; END OF FUNCTION CHUNK FOR sub_17807

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_178B9		proc far

var_44		= word ptr -44h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_28		= word ptr -28h
var_24		= word ptr -24h
var_20		= word ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 44h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_C], 0
		cmp	word ptr [si+37h], 0
		jnz	short loc_178E2
		mov	ax, si
		add	ax, 37h
		push	ax
		mov	ax, si
		add	ax, 39h
		push	ax
		call	LinkedList_Helper_4874D
		add	sp, 4

loc_178E2:
		cmp	word ptr [si+37h], 0
		jz	short loc_1790E

loc_178E8:
		mov	ax, si
		add	ax, 37h
		push	ax
		mov	ax, si
		add	ax, 39h
		push	ax
		call	LinkedList_Helper_4874D
		add	sp, 4
		cmp	word ptr [si+37h], 0
		jz	short loc_1790E
		mov	bx, [si+37h]
		mov	al, [bx+7]
		mov	ah, 0
		or	ax, ax
		jz	short loc_178E8

loc_1790E:
		cmp	word ptr [si+37h], 0
		jnz	short loc_17943

loc_17914:
		mov	ax, si
		add	ax, 37h
		push	ax
		mov	ax, si
		add	ax, 39h
		push	ax
		call	LinkedList_Helper_4874D
		add	sp, 4
		cmp	word ptr [si+37h], 0
		jz	short loc_1793A
		mov	bx, [si+37h]
		mov	al, [bx+7]
		mov	ah, 0
		or	ax, ax
		jz	short loc_17914

loc_1793A:
		cmp	word ptr [si+37h], 0
		jnz	short loc_17943
		jmp	loc_17A6A

loc_17943:
		push	word ptr [si+37h]
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		mov	bx, [si+37h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	ax, [bp+var_20]
		mov	[bp+var_E], ax
		push	word ptr [si+37h]
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		mov	bx, [si+37h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+var_24]
		mov	[bp+var_10], ax
		push	word ptr [si+37h]
		push	ss
		lea	ax, [bp+var_28]
		push	ax
		mov	bx, [si+37h]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 6
		mov	ax, [bp+var_28]
		mov	[bp+var_12], ax
		push	word ptr [si+37h]
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		mov	bx, [si+37h]
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		add	sp, 6
		mov	ax, [bp+var_2C]
		mov	[bp+var_14], ax
		push	word ptr [si+37h]
		push	ss
		lea	ax, [bp+var_30]
		push	ax
		mov	bx, [si+37h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 6
		mov	ax, [bp+var_2E]
		mov	[bp+var_16], ax
		push	word ptr [si+37h]
		push	ss
		lea	ax, [bp+var_34]
		push	ax
		mov	bx, [si+37h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+var_32]
		mov	[bp+var_18], ax
		push	word ptr [si+37h]
		push	ss
		lea	ax, [bp+var_38]
		push	ax
		mov	bx, [si+37h]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 6
		mov	ax, [bp+var_36]
		mov	[bp+var_1A], ax
		push	word ptr [si+37h]
		push	ss
		lea	ax, [bp+var_3C]
		push	ax
		mov	bx, [si+37h]
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		add	sp, 6
		mov	ax, [bp+var_3A]
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_E]
		add	ax, [bp+var_14]
		add	ax, [bp+var_10]
		add	ax, [bp+var_12]
		shr	ax, 2
		mov	[bp+var_2], ax
		mov	ax, [bp+var_16]
		add	ax, [bp+var_1C]
		add	ax, [bp+var_18]
		add	ax, [bp+var_1A]
		shr	ax, 2
		mov	[bp+var_4], ax
		mov	si, [bp+var_2]
		shl	si, 1
		mov	di, [bp+var_4]
		mov	[bp+var_3E], si
		mov	[bp+var_40], di
		mov	ax, [bp+var_3E]
		mov	[bp+var_A], ax
		mov	ax, [bp+var_40]
		mov	[bp+var_8], ax
		push	di
		push	si
		call	TextScrollDisplay_RegisterEntries_55F34
		add	sp, 4
		mov	[bp+var_42], si
		mov	[bp+var_44], di
		push	[bp+var_44]
		push	[bp+var_42]
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_57148
		add	sp, 8

loc_17A6A:
		pop	di
		pop	si
		leave
		retf
sub_178B9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17A6E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_17AC6
		mov	word ptr [si+18h], 155Bh
		mov	word ptr [si+10h], 157Fh
		cmp	word ptr [si+14h], 0
		jz	short loc_17AB0
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	word ptr [si+14h], 0
		jz	short loc_17AB0
		push	3
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_17AB0

loc_17AB0:
		push	word ptr [si+1Ah]
		call	sub_45058
		pop	cx
		test	di, 1
		jz	short loc_17AC6
		push	si
		call	sub_33B
		pop	cx

loc_17AC6:
		pop	di
		pop	si
		pop	bp
		retf
sub_17A6E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17ACA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Ah]
		pop	si
		pop	bp
		retf
sub_17ACA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17AD7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+1Ah], ax
		pop	si
		pop	bp
		retf
sub_17AD7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObjects_AddToList_54C32 (sub_54C32 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObjects_AddToList_5334D (sub_5334D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; ajoute l'objet passé en argument (arg_2) à la liste de tag 0x59C3 via
; List_AppendIfNonNull_21F8D. Appelée par AIAircraft_SpawnAndConditionalLoadProfile_53363 pour
; l'objet qu'elle vient de créer. Anciennement Expr_Node_RegisterListener (aucun rapport avec
; un écouteur Expr_VM dans ce corps).
; ==============================================================================================
WorldObjects_AddToList_17AE7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		push	ax
		call	sub_1F232
		add	sp, 4
		pop	bp
		retf
WorldObjects_AddToList_17AE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17AFB		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	dx, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		lea	ax, [bp+var_8]
		push	ax
		push	dx
		call	sub_1F232
		add	sp, 4
		leave
		retf
sub_17AFB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17B2B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_4]
		mov	si, dx
		mov	ax, [si]
		mov	bx, [bp+arg_0]
		mov	[bx], ax
		mov	ax, [si+2]
		mov	[bx+2], ax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_17B2B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17B4A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_4]
		mov	si, dx
		add	si, 4
		mov	ax, [si]
		mov	bx, [bp+arg_0]
		mov	[bx], ax
		mov	ax, [si+2]
		mov	[bx+2], ax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_17B4A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17B6C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_4]
		mov	si, dx
		add	si, 8
		mov	ax, [si]
		mov	bx, [bp+arg_0]
		mov	[bx], ax
		mov	ax, [si+2]
		mov	[bx+2], ax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_17B6C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17B8E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_4]
		mov	si, dx
		add	si, 0Ch
		mov	ax, [si]
		mov	bx, [bp+arg_0]
		mov	[bx], ax
		mov	ax, [si+2]
		mov	[bx+2], ax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		pop	bp
		retf
sub_17B8E		endp

; ----------------------------------------------------------------------

sub_17BB0		proc far
		mov	bx, sp
		add	word ptr ss:[bx+8], 0FFF0h
		nop
		nop
		jmp	sub_17B8E
sub_17BB0		endp

; ----------------------------------------------------------------------

sub_17BBC		proc far
		mov	bx, sp
		add	word ptr ss:[bx+8], 0FFF0h
		nop
		nop
		jmp	sub_17B6C
sub_17BBC		endp

; ----------------------------------------------------------------------

sub_17BC8		proc far
		mov	bx, sp
		add	word ptr ss:[bx+8], 0FFF0h
		nop
		nop
		jmp	sub_17B4A
sub_17BC8		endp

; ----------------------------------------------------------------------

sub_17BD4		proc far
		mov	bx, sp
		add	word ptr ss:[bx+8], 0FFF0h
		nop
		nop
		jmp	sub_17B2B
sub_17BD4		endp

; ----------------------------------------------------------------------

sub_17BE0		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_17AD7
sub_17BE0		endp

; ----------------------------------------------------------------------

sub_17BEC		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_17ACA
sub_17BEC		endp

; ----------------------------------------------------------------------

sub_17BF8		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_17AFB
sub_17BF8		endp

; ----------------------------------------------------------------------

sub_17C04		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	WorldObjects_AddToList_17AE7
sub_17C04		endp

; ----------------------------------------------------------------------

sub_17C10		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_17A6E
sub_17C10		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17C1C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_17C3A
		mov	word ptr [si], 15A3h
		test	ax, 1
		jz	short loc_17C3A
		push	si
		call	sub_33B
		pop	cx

loc_17C3A:
		pop	si
		pop	bp
		retf
sub_17C1C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ReleaseListEntry_63455 (sub_63455 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à HUDSymbol_ReleaseListEntry_85DCA (sub_85DCA de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle LinkedListB_Helper_5F66B (seg159).
; ==============================================================================================
HUDSymbol_ReleaseListEntry_17C3D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_17C66
		mov	word ptr [si], 15C7h
		push	word ptr [si+4]
		call	sub_45058
		pop	cx
		test	di, 1
		jz	short loc_17C66
		push	si
		call	sub_33B
		pop	cx

loc_17C66:
		pop	di
		pop	si
		pop	bp
		retf
HUDSymbol_ReleaseListEntry_17C3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17C6A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_17CC5
		mov	word ptr [si], 15CBh
		mov	word ptr [si+0Eh], 15EFh
		cmp	word ptr [si+12h], 0
		jz	short loc_17CAB
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	word ptr [si+12h], 0
		jz	short loc_17CAB
		push	3
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_17CAB

loc_17CAB:
		mov	word ptr [si], 15C7h
		push	word ptr [si+4]
		call	sub_45058
		pop	cx
		test	di, 1
		jz	short loc_17CC5
		push	si
		call	sub_33B
		pop	cx

loc_17CC5:
		pop	di
		pop	si
		pop	bp
		retf
sub_17C6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17CC9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	dx, [di]
		mov	cx, [di+2]
		cmp	[si+0Ah], dx
		jl	short loc_17CE3
		cmp	[si+6], dx
		jle	short loc_17CE7

loc_17CE3:
		mov	dl, 0
		jmp	short loc_17CE9

loc_17CE7:
		mov	dl, 1

loc_17CE9:
		or	dl, dl
		jz	short loc_17CFF
		cmp	[si+0Ch], cx
		jle	short loc_17CFB
		cmp	[si+8], cx
		jge	short loc_17CFB
		mov	dl, 1
		jmp	short loc_17CFF

loc_17CFB:
		mov	dl, 0
		jmp	short loc_17CFF

loc_17CFF:
		mov	al, dl
		pop	di
		pop	si
		pop	bp
		retf
sub_17CC9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17D05		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		cmp	[si+0Ah], dx
		jl	short loc_17D1C
		cmp	[si+6], dx
		jle	short loc_17D20

loc_17D1C:
		mov	dl, 0
		jmp	short loc_17D22

loc_17D20:
		mov	dl, 1

loc_17D22:
		or	dl, dl
		jz	short loc_17D38
		cmp	[si+0Ch], cx
		jle	short loc_17D34
		cmp	[si+8], cx
		jge	short loc_17D34
		mov	dl, 1
		jmp	short loc_17D38

loc_17D34:
		mov	dl, 0
		jmp	short loc_17D38

loc_17D38:
		mov	al, dl
		pop	si
		pop	bp
		retf
sub_17D05		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17D3D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		pop	si
		pop	bp
		retf
sub_17D3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17D4A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+4], ax
		pop	si
		pop	bp
		retf
sub_17D4A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17D5A		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	ax, [si+6]
		mov	[bp+var_6], ax
		mov	ax, [si+8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_2], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bp+var_4]
		mov	[bx], ax
		mov	ax, [bp+var_2]
		mov	[bx+2], ax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_17D5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17D93		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	ax, [si+0Ah]
		mov	[bp+var_6], ax
		mov	ax, [si+8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_2], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bp+var_4]
		mov	[bx], ax
		mov	ax, [bp+var_2]
		mov	[bx+2], ax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_17D93		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17DCC		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	ax, [si+0Ah]
		mov	[bp+var_6], ax
		mov	ax, [si+8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_2], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bp+var_4]
		mov	[bx], ax
		mov	ax, [bp+var_2]
		mov	[bx+2], ax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_17DCC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_17E05		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	ax, [si+0Ah]
		mov	[bp+var_6], ax
		mov	ax, [si+0Ch]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_2], ax
		mov	bx, [bp+arg_0]
		mov	ax, [bp+var_4]
		mov	[bx], ax
		mov	ax, [bp+var_2]
		mov	[bx+2], ax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_17E05		endp

; ----------------------------------------------------------------------

sub_17E3E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+8], 0FFF2h
		nop
		nop
		jmp	sub_17E05
sub_17E3E		endp

; ----------------------------------------------------------------------

sub_17E4A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+8], 0FFF2h
		nop
		nop
		jmp	sub_17DCC
sub_17E4A		endp

; ----------------------------------------------------------------------

sub_17E56		proc far
		mov	bx, sp
		add	word ptr ss:[bx+8], 0FFF2h
		nop
		nop
		jmp	sub_17D93
sub_17E56		endp

; ----------------------------------------------------------------------

sub_17E62		proc far
		mov	bx, sp
		add	word ptr ss:[bx+8], 0FFF2h
		nop
		nop
		jmp	sub_17D5A
sub_17E62		endp

; ----------------------------------------------------------------------

sub_17E6E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
		jmp	sub_17D4A
sub_17E6E		endp

; ----------------------------------------------------------------------

sub_17E7A		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
		jmp	sub_17D3D
sub_17E7A		endp

; ----------------------------------------------------------------------

sub_17E86		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
		jmp	sub_17D05
sub_17E86		endp

; ----------------------------------------------------------------------

sub_17E92		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
		jmp	sub_17CC9
sub_17E92		endp

; ----------------------------------------------------------------------

sub_17E9E		proc far
		mov	bx, sp
sub_17E9E		endp
seg029		ends
