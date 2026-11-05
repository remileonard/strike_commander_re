seg064		segment	para public 'CODE' use16
		assume cs:seg064
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_263D0		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_263D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_263D5		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+0Eh]
		mov	[bp+var_4], eax
		mov	eax, es:[bx+24h]
		mov	[bp+var_8], eax
		mov	eax, es:[bx+3Ah]
		mov	[bp+var_C], eax
		cmp	eax, [bp+var_8]
		jle	short loc_26417
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax

loc_26417:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_4]
		jle	short loc_26439
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_8], eax

loc_26439:
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_8]
		jle	short loc_2644F
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax

loc_2644F:
		leave
		retf
sub_263D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26451		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	[bp+var_6], 5D02h
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 10h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	ax, es
		mov	fs, ax
		mov	dx, 3
		mov	di, [bp+var_6]
		mov	bx, si
		les	si, fs:[bx]

loc_2647F:
		mov	ax, es:[si+18h]
		shl	eax, 10h
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		shl	eax, 10h
		mov	[di+4], eax
		mov	ax, [bp+arg_4]
		shl	eax, 10h
		mov	[di+8], eax
		mov	eax, es:[si+1Ch]
		shl	eax, 8
		mov	[di+18h], eax
		mov	eax, es:[si+20h]
		shl	eax, 8
		mov	[di+1Ch], eax
		mov	eax, es:[si+24h]
		shl	eax, 8
		mov	[di+20h], eax
		add	di, 24h
		add	bx, 4
		mov	si, fs:[bx]
		dec	dx
		jnz	short loc_2647F
		pop	di
		pop	si
		leave
		retf
sub_26451		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_264D8		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_1], al
		mov	bx, [bp+arg_0]
		mov	al, es:[bx+1Dh]
		mov	[bp+var_2], al
		mov	[bp+var_8], 5D02h
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 10h
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		les	si, [bp+var_6]
		mov	ax, es
		mov	fs, ax
		mov	dx, 3
		mov	di, [bp+var_8]
		mov	bx, si
		les	si, fs:[bx]

loc_26528:
		mov	ax, es:[si+18h]
		shl	eax, 10h
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		shl	eax, 10h
		mov	[di+4], eax
		sub	eax, eax
		mov	al, es:[si+28h]
		mul	[bp+var_2]
		add	ah, [bp+var_1]
		shl	eax, 8
		mov	[di+8], eax
		mov	eax, es:[si+1Ch]
		shl	eax, 8
		mov	[di+18h], eax
		mov	eax, es:[si+20h]
		shl	eax, 8
		mov	[di+1Ch], eax
		mov	eax, es:[si+24h]
		shl	eax, 8
		mov	[di+20h], eax
		add	di, 24h
		add	bx, 4
		mov	si, fs:[bx]
		dec	dx
		jnz	short loc_26528
		pop	di
		pop	si
		leave
		retf
sub_264D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2658B		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	al, es:[bx+2Ch]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_1], al
		mov	bx, [bp+arg_0]
		mov	al, es:[bx+2Dh]
		mov	[bp+var_2], al
		mov	[bp+var_8], 5D02h
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 10h
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		les	si, [bp+var_6]
		mov	ax, es
		mov	fs, ax
		mov	dx, 3
		mov	di, [bp+var_8]
		mov	bx, si
		les	si, fs:[bx]

loc_265DB:
		mov	ax, es:[si+18h]
		shl	eax, 10h
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		shl	eax, 10h
		mov	[di+4], eax
		sub	eax, eax
		mov	al, es:[si+28h]
		mul	[bp+var_2]
		add	ah, [bp+var_1]
		shl	eax, 8
		mov	[di+8], eax
		mov	eax, es:[si+1Ch]
		shl	eax, 8
		mov	[di+18h], eax
		mov	eax, es:[si+20h]
		shl	eax, 8
		mov	[di+1Ch], eax
		mov	eax, es:[si+24h]
		shl	eax, 8
		mov	[di+20h], eax
		add	di, 24h
		add	bx, 4
		mov	si, fs:[bx]
		dec	dx
		jnz	short loc_265DB
		pop	di
		pop	si
		leave
		retf
sub_2658B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2663E		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 20h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	bx, [bp+var_4]
		movzx	eax, word ptr es:[bx]
		mov	dword_7C43E, eax
		movzx	eax, word ptr es:[bx+2]
		mov	dword_7C442, eax
		mov	eax, dword_7C43E
		shl	eax, 10h
		mov	dword_7C43E, eax
		mov	eax, dword_7C442
		shl	eax, 10h
		mov	dword_7C442, eax
		movzx	eax, word ptr es:[bx+4]
		mov	dword_7C462, eax
		movzx	eax, word ptr es:[bx+6]
		mov	dword_7C466, eax
		mov	eax, dword_7C462
		shl	eax, 10h
		mov	dword_7C462, eax
		mov	eax, dword_7C466
		shl	eax, 10h
		mov	dword_7C466, eax
		movzx	eax, word ptr es:[bx+8]
		mov	dword_7C486, eax
		movzx	eax, word ptr es:[bx+0Ah]
		mov	dword_7C48A, eax
		mov	eax, dword_7C486
		shl	eax, 10h
		mov	dword_7C486, eax
		mov	eax, dword_7C48A
		shl	eax, 10h
		mov	dword_7C48A, eax
		leave
		retf
sub_2663E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_266DB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, [bp+arg_2]
		mov	al, es:[bx+4]
		push	ax
		les	bx, [bp+arg_6]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	si
		call	sub_69F22
		add	sp, 0Ch
		les	bx, [bp+arg_6]
		mov	al, es:[bx+4]
		push	ax
		les	bx, [bp+arg_A]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		les	bx, [bp+arg_6]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	si
		call	sub_69F22
		add	sp, 0Ch
		les	bx, [bp+arg_A]
		mov	al, es:[bx+4]
		push	ax
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	si
		call	sub_69F22
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
sub_266DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 22 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Face_ComputeNormal_2931E (sub_2931E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-16
; (rendu des objets, OBJECT_RENDER.md). NORMALE DE FACE (ex-Mesh_ComputeEdgeVectors) : a = V0
; − V2, b = V0 − V1 (sommets +19h/+1Dh/+21h), N = a × b (Vector_CrossProduct3D_550B7)
; normalisée → +1/+5/+9.
; ==============================================================================================
Face_ComputeNormal_26751		proc far

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
		sub	sp, 30h
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		sub	eax, es:[bx]
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		sub	eax, es:[bx+4]
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		sub	eax, es:[bx+8]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		sub	eax, es:[bx]
		mov	[bp+var_18], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		sub	eax, es:[bx+4]
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		sub	eax, es:[bx+8]
		mov	[bp+var_10], eax
		lea	ax, word ptr [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_30]
		push	ax
		call	Vector_CrossProduct3D_56EF2
		add	sp, 8
		mov	eax, [bp+var_30]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Vector_Normalize3D_57796
		pop	cx
		les	bx, [bp+arg_0]
		mov	ax, word ptr [bp+var_24]
		mov	es:[bx+4], ax
		mov	ax, word ptr [bp+var_20]
		mov	es:[bx+6], ax
		mov	ax, word ptr [bp+var_1C]
		mov	es:[bx+8], ax
		leave
		retf
Face_ComputeNormal_26751		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2684C		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		add	eax, es:[bx]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		add	eax, es:[bx]
		mov	ebx, 3
		cdq
		idiv	ebx
		mov	[bp+var_C], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		add	eax, es:[bx+4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		add	eax, es:[bx+4]
		mov	ebx, 3
		cdq
		idiv	ebx
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		add	eax, es:[bx+8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		add	eax, es:[bx+8]
		mov	ebx, 3
		cdq
		idiv	ebx
		mov	[bp+var_4], eax
		mov	eax, [bp+var_C]
		sar	eax, 1
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ah], ax
		mov	eax, [bp+var_8]
		sar	eax, 1
		mov	es:[bx+0Ch], ax
		mov	eax, [bp+var_4]
		sar	eax, 1
		mov	es:[bx+0Eh], ax
		leave
		retf
sub_2684C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2690E		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		les	bx, word ptr [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+10h], eax
		mov	eax, [bp+arg_8]
		mov	es:[bx+14h], eax
		mov	eax, [bp+arg_C]
		mov	es:[bx+18h], eax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr Face_ComputeNormal_26751
		add	sp, 4
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2684C
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		movsx	eax, word ptr es:[bx+4]
		les	bx, es:[bx+10h]
		add	es:[bx+0Ch], eax
		les	bx, word ptr [bp+arg_0]
		movsx	eax, word ptr es:[bx+6]
		les	bx, es:[bx+10h]
		add	es:[bx+10h], eax
		les	bx, word ptr [bp+arg_0]
		movsx	eax, word ptr es:[bx+8]
		les	bx, es:[bx+10h]
		add	es:[bx+14h], eax
		les	bx, word ptr [bp+arg_0]
		movsx	eax, word ptr es:[bx+4]
		les	bx, es:[bx+14h]
		add	es:[bx+0Ch], eax
		les	bx, word ptr [bp+arg_0]
		movsx	eax, word ptr es:[bx+6]
		les	bx, es:[bx+14h]
		add	es:[bx+10h], eax
		les	bx, word ptr [bp+arg_0]
		movsx	eax, word ptr es:[bx+8]
		les	bx, es:[bx+14h]
		add	es:[bx+14h], eax
		les	bx, word ptr [bp+arg_0]
		movsx	eax, word ptr es:[bx+4]
		les	bx, es:[bx+18h]
		add	es:[bx+0Ch], eax
		les	bx, word ptr [bp+arg_0]
		movsx	eax, word ptr es:[bx+6]
		les	bx, es:[bx+18h]
		add	es:[bx+10h], eax
		les	bx, word ptr [bp+arg_0]
		movsx	eax, word ptr es:[bx+8]
		les	bx, es:[bx+18h]
		add	es:[bx+14h], eax
		pop	bp
		retf
sub_2690E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_269E9		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_269E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_269EE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	al, es:[bx+29h]
		shr	ax, 3
		and	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	dl, es:[bx+29h]
		shr	dx, 3
		and	dx, 1
		and	al, dl
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	dl, es:[bx+29h]
		shr	dx, 3
		and	dx, 1
		and	al, dl
		pop	bp
		retf
sub_269EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26A2A		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	eax, es:[bx+20h]
		mov	[bp+var_4], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	eax, es:[bx+20h]
		mov	[bp+var_8], eax
		cmp	eax, [bp+var_4]
		jle	short loc_26A5C
		mov	[bp+var_4], eax
		jmp	short loc_26A5C

loc_26A5C:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	eax, es:[bx+20h]
		mov	[bp+var_C], eax
		cmp	eax, [bp+var_4]
		jle	short loc_26A78
		mov	[bp+var_4], eax
		jmp	short loc_26A78

loc_26A78:
		mov	eax, [bp+var_4]
		mov	dword_7CB28, eax
		sar	eax, 8
		shld	edx, eax, 10h
		leave
		retf
sub_26A2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26A8B		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_26A8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26A90		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_26A90		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26A97		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+10h]
		xor	dx, dx
		sub	ax, [bp+arg_4]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 2Ah
		cdq
		idiv	ebx
		imul	ax, ax, 2Ah
		mov	dx, [bp+arg_A]
		mov	bx, [bp+arg_8]
		add	bx, ax
		mov	si, [bp+arg_0]
		mov	es:[si+12h], dx
		mov	es:[si+10h], bx
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+14h]
		xor	dx, dx
		sub	ax, [bp+arg_4]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 2Ah
		cdq
		idiv	ebx
		imul	ax, ax, 2Ah
		mov	dx, [bp+arg_A]
		mov	bx, [bp+arg_8]
		add	bx, ax
		mov	es:[si+16h], dx
		mov	es:[si+14h], bx
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+18h]
		xor	dx, dx
		sub	ax, [bp+arg_4]
		sbb	dx, 0
		push	dx
		push	ax
		pop	eax
		mov	ebx, 2Ah
		cdq
		idiv	ebx
		imul	ax, ax, 2Ah
		mov	dx, [bp+arg_A]
		mov	bx, [bp+arg_8]
		add	bx, ax
		mov	es:[si+1Ah], dx
		mov	es:[si+18h], bx
		pop	si
		pop	bp
		retf
sub_26A97		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26B34		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_0], 0
		jnz	short loc_26B56
		push	60h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_26B56
		jmp	loc_26BED

loc_26B56:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 33Ch
		mov	eax, dword_7CB28
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+2], eax
		mov	dword ptr es:[bx+14h], 3
		xor	cx, cx
		jmp	short loc_26BC8

loc_26B81:
		mov	ax, cx
		shl	ax, 2
		les	bx, [bp+arg_4]
		add	bx, ax
		les	bx, es:[bx+10h]
		movsx	eax, word ptr es:[bx+18h]
		mov	dx, cx
		imul	dx, dx, 18h
		les	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	es:[bx+18h], eax
		mov	ax, cx
		shl	ax, 2
		les	bx, [bp+arg_4]
		add	bx, ax
		les	bx, es:[bx+10h]
		movsx	eax, word ptr es:[bx+1Ah]
		mov	dx, cx
		imul	dx, dx, 18h
		les	bx, word ptr [bp+arg_0]
		add	bx, dx
		mov	es:[bx+1Ch], eax
		inc	cx

loc_26BC8:
		cmp	cx, 3
		jl	short loc_26B81
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], eax

loc_26BED:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_26B34		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à FaceType0_Setup_29732 (sub_29732 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-16
; (rendu des objets, OBJECT_RENDER.md). Préparation des faces de type 0, 1 et 5 :
; Face_SetupGeometry_294C0 puis couleur (octet 4) → +26h. Ex-Mesh_FaceSetupSolidColor.
; ==============================================================================================
FaceType0_Setup_26BF5		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h

		push	bp
		mov	bp, sp
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2690E
		add	sp, 14h
		les	bx, word ptr [bp+arg_10]
		mov	al, es:[bx+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], al
		pop	bp
		retf
FaceType0_Setup_26BF5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26C23		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_26C23		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26C28		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_26C28		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26C2F		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	word_77957, 0
		jz	short loc_26CB7
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_26451
		add	sp, 6
		push	large 600003h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_26CE0
		les	bx, word ptr [bp+var_4]
		mov	dword ptr es:[bx+10h], 1
		mov	word ptr es:[bx+6], 1
		mov	eax, dword_7CB28
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_4]
		add	ax, 18h
		push	word ptr [bp+var_4+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+8], eax
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_26CE4

loc_26CB7:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_26CE6
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_26CE0
		cmp	[bp+var_4], 0
		jnz	short loc_26CE4

loc_26CE0:
		xor	dx, dx
		xor	ax, ax

loc_26CE4:
		leave
		retf
sub_26C2F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26CE6		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_26D0A
		push	60h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_26D0A
		jmp	loc_26DE4

loc_26D0A:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 33Ch
		mov	word ptr es:[bx], 340h
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		mov	[bp+var_2], ax
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+10h], 1
		mov	eax, [bp+arg_4]
		mov	[bp+var_6], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 10h
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	esi, eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	cx, word ptr [bp+arg_0]
		add	cx, 18h
		push	ax
		push	cx
		pop	ecx
		mov	ebx, dword_7CB28
		push	ds
		lds	di, word ptr [bp+arg_0]
		sub	eax, eax
		mov	ax, 3
		mov	[di+14h], eax
		mov	ax, 1
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_A]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 3

loc_26D9F:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_26DDD
		cmp	ax, 140h
		jge	short loc_26DDD
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_26DDD
		cmp	ax, 0C8h
		jge	short loc_26DDD
		mov	[di+4], eax
		mov	ax, [bp+var_2]
		shl	eax, 10h
		mov	[di+8], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_26D9F
		pop	ds
		jmp	short loc_26DE4

loc_26DDD:
		pop	ds
		mov	word_77921, 1

loc_26DE4:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_26CE6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26DEE		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_26DEE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à FaceType1_Setup_29837
; (sub_29837 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-16 (rendu des objets, OBJECT_RENDER.md). Préparation des faces de
; types 1 et 5 (et tout type hors 0..9) : appelle FaceType0_Setup_29732. Ex-
; Mesh_FaceSetupSolidColorWrap.
; ==============================================================================================
FaceType1_Setup_26DF3		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h

		push	bp
		mov	bp, sp
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr FaceType0_Setup_26BF5
		add	sp, 14h
		pop	bp
		retf
FaceType1_Setup_26DF3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26E13		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_26E13		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26E1A		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	word_77957, 0
		jz	short loc_26EA2
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_26451
		add	sp, 6
		push	large 600003h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_26ECB
		les	bx, word ptr [bp+var_4]
		mov	word ptr es:[bx+6], 2
		mov	eax, dword_7CB28
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	es:[bx+2], eax
		mov	dword ptr es:[bx+10h], 1
		push	2
		mov	ax, word ptr [bp+var_4]
		add	ax, 18h
		push	word ptr [bp+var_4+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+8], eax
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_26ECF

loc_26EA2:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_26ED1
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_26ECB
		cmp	[bp+var_4], 0
		jnz	short loc_26ECF

loc_26ECB:
		xor	dx, dx
		xor	ax, ax

loc_26ECF:
		leave
		retf
sub_26E1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26ED1		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_26EF5
		push	60h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_26EF5
		jmp	loc_26FD4

loc_26EF5:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 33Ch
		mov	word ptr es:[bx], 340h
		mov	word ptr es:[bx], 344h
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		mov	[bp+var_2], ax
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+10h], 1
		mov	eax, [bp+arg_4]
		mov	[bp+var_6], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 10h
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	esi, eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	cx, word ptr [bp+arg_0]
		add	cx, 18h
		push	ax
		push	cx
		pop	ecx
		mov	ebx, dword_7CB28
		push	ds
		lds	di, word ptr [bp+arg_0]
		sub	eax, eax
		mov	ax, 3
		mov	[di+14h], eax
		mov	ax, 2
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_A]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 3

loc_26F8F:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_26FCD
		cmp	ax, 140h
		jge	short loc_26FCD
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_26FCD
		cmp	ax, 0C8h
		jge	short loc_26FCD
		mov	[di+4], eax
		mov	ax, [bp+var_2]
		shl	eax, 10h
		mov	[di+8], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_26F8F
		pop	ds
		jmp	short loc_26FD4

loc_26FCD:
		pop	ds
		mov	word_77921, 1

loc_26FD4:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_26ED1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26FDE		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_26FDE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à FaceType2_Setup_298F5 (sub_298F5 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-16
; (rendu des objets, OBJECT_RENDER.md). Préparation des faces de type 2 (translucides) :
; Face_SetupGeometry_294C0 ; octet 4 (signé) < 0 → +26h = 0, sinon +26h = table de 256 o n°
; octet 4 dans dword_72528 (base + n × 256). Ex-Mesh_FaceSetupTexturedColor.
; ==============================================================================================
FaceType2_Setup_26FE3		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h

		push	bp
		mov	bp, sp
		push	si
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2690E
		add	sp, 14h
		les	bx, word ptr [bp+arg_10]
		mov	al, es:[bx+1]
		cbw
		mov	si, ax
		or	si, si
		jge	short loc_27016
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_27033

loc_27016:
		push	0
		mov	al, byte_7CC70
		push	ax
		push	large dword_7CC6C
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	bx, si
		shl	bx, 8
		add	ax, bx

loc_27033:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], dx
		mov	es:[bx+1Ch], ax
		pop	si
		pop	bp
		retf
FaceType2_Setup_26FE3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27041		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_27041		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27046		proc far
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
sub_27046		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2704D		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	word_77957, 0
		jnz	short loc_2705D
		jmp	loc_270F1

loc_2705D:
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_26451
		add	sp, 6
		push	large 600003h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_27088
		jmp	loc_2711A

loc_27088:
		les	bx, word ptr [bp+var_4]
		mov	word ptr es:[bx+6], 3
		mov	eax, dword_7CB28
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	es:[bx+2], eax
		mov	dword ptr es:[bx+10h], 1
		push	2
		mov	ax, word ptr [bp+var_4]
		add	ax, 18h
		push	word ptr [bp+var_4+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+8], eax
		push	2
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+1Ch]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+0Ch], eax
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_2711E

loc_270F1:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_27120
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_2711A
		cmp	[bp+var_4], 0
		jnz	short loc_2711E

loc_2711A:
		xor	dx, dx
		xor	ax, ax

loc_2711E:
		leave
		retf
sub_2704D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27120		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_27144
		push	60h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_27144
		jmp	loc_27222

loc_27144:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 33Ch
		mov	word ptr es:[bx], 120Bh
		push	2
		les	bx, word ptr [bp+arg_4]
		push	large es:[bx+1Ch]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], eax
		mov	dword ptr es:[bx+10h], 1
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 10h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	esi, eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	cx, word ptr [bp+arg_0]
		add	cx, 18h
		push	ax
		push	cx
		pop	ecx
		mov	ebx, dword_7CB28
		push	ds
		lds	di, word ptr [bp+arg_0]
		sub	eax, eax
		mov	ax, 3
		mov	[di+14h], eax
		mov	ax, 3
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_8]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 3

loc_271E8:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_2721B
		cmp	ax, 140h
		jge	short loc_2721B
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_2721B
		cmp	ax, 0C8h
		jge	short loc_2721B
		mov	[di+4], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_271E8
		pop	ds
		jmp	short loc_27222

loc_2721B:
		pop	ds
		mov	word_77921, 1

loc_27222:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_27120		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2722C		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2722C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27231		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	al, [bp+arg_4]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 3
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		push	[bp+var_2]
		push	64DEh
		call	Table_LookupByRange_2DEC8
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_2727A
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_27281

loc_2727A:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_27281:
		cmp	dx, 0FFFFh
		jnz	short loc_27297
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_4]
		mov	es:[bx+2], al
		and	byte ptr es:[bx+6], 0FBh
		jmp	short loc_272A3

loc_27297:
		les	bx, [bp+arg_0]
		mov	es:[bx+2], dl
		or	byte ptr es:[bx+6], 4

loc_272A3:
		leave
		retf
sub_27231		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_272A5		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_8]
		les	bx, [bp+arg_4]
		movsx	eax, word ptr es:[bx+4]
		mov	[bp+var_C], eax
		movsx	eax, word ptr es:[bx+6]
		mov	[bp+var_8], eax
		movsx	eax, word ptr es:[bx+8]
		mov	[bp+var_4], eax
		mov	al, es:[bx+2]
		and	ax, 1
		or	al, al
		jnz	short loc_272DE
		jmp	loc_273C5

loc_272DE:
		les	bx, es:[bx+14h]
		mov	ax, es:[bx+18h]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+10h]
		sub	ax, es:[bx+18h]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+18h]
		mov	dx, es:[bx+1Ah]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+14h]
		sub	dx, es:[bx+1Ah]
		imul	dx
		push	ax
		mov	ax, es:[bx+1Ah]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+10h]
		sub	ax, es:[bx+1Ah]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+18h]
		mov	dx, es:[bx+18h]
		les	bx, [bp+arg_4]
		les	bx, es:[bx+14h]
		sub	dx, es:[bx+18h]
		imul	dx
		pop	dx
		sub	dx, ax
		jge	short loc_2733A
		mov	al, 1
		jmp	short loc_2733C

loc_2733A:
		mov	al, 0

loc_2733C:
		mov	dl, al
		or	dl, dl
		jz	short loc_27391
		les	bx, [bp+arg_0]
		mov	al, es:[bx+6]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_27361
		mov	al, es:[bx+6]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_27391

loc_27361:
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+6], 1
		or	byte ptr es:[bx+6], 2
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Utility_Helper_57812
		pop	cx

loc_27378:
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	si
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], al
		jmp	short loc_273F3

loc_27391:
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_273F3
		les	bx, [bp+arg_0]
		mov	al, es:[bx+6]
		and	ax, 1
		or	al, al
		jnz	short loc_273B6
		mov	al, es:[bx+6]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_273F3

loc_273B6:
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+6], 0FEh
		or	byte ptr es:[bx+6], 2
		jmp	short loc_27378

loc_273C5:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+6]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_273F3
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	si
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], al
		or	byte ptr es:[bx+6], 2

loc_273F3:
		pop	si
		leave
		retf
sub_272A5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_273F6		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h

		push	bp
		mov	bp, sp
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2690E
		add	sp, 14h
		les	bx, word ptr [bp+arg_10]
		mov	al, es:[bx+1]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Ch
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_27231
		add	sp, 6
		pop	bp
		retf
sub_273F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2742F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+22h], 0FDh
		pop	bp
		retf
sub_2742F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2743C		proc far
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
sub_2743C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27443		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	large [bp+arg_0]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Ch
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_272A5
		add	sp, 0Ah
		pop	bp
		retf
sub_27443		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27460		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+22h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_274B7
		push	large 0
		mov	al, es:[bx+20h]
		mov	ah, 0
		push	ax
		push	64DEh
		call	Palette_ShadeTableFor_2DE20
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_274A4
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+1Eh]
		jmp	short loc_274DD

loc_274A4:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		les	bx, word ptr [bp+var_4]
		add	bx, ax
		mov	al, es:[bx]
		jmp	short loc_274DD

loc_274B7:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+1Fh]
		mov	ah, 0
		push	ax
		push	large 0
		mov	al, es:[bx+20h]
		mov	ah, 0
		push	ax
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		push	ax
		push	64DEh
		call	sub_2E656
		add	sp, 0Ch

loc_274DD:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+21h], al
		cmp	word_77957, 0
		jz	short loc_27566
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+21h]
		mov	ah, 0
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_26451
		add	sp, 6
		push	large 600003h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_2758F
		les	bx, word ptr [bp+var_8]
		mov	dword ptr es:[bx+10h], 1
		mov	word ptr es:[bx+6], 5
		mov	eax, dword_7CB28
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_8]
		add	ax, 18h
		push	word ptr [bp+var_8+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+8], eax
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]
		jmp	short loc_27593

loc_27566:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_27595
		add	sp, 8
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	word_77921, 0
		jnz	short loc_2758F
		cmp	[bp+var_8], 0
		jnz	short loc_27593

loc_2758F:
		xor	dx, dx
		xor	ax, ax

loc_27593:
		leave
		retf
sub_27460		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27595		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_275B9
		push	60h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_275B9
		jmp	loc_2769D

loc_275B9:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 33Ch
		mov	word ptr es:[bx], 340h
		mov	word ptr es:[bx], 344h
		mov	word ptr es:[bx], 1207h
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+21h]
		mov	ah, 0
		mov	[bp+var_2], ax
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+10h], 1
		mov	eax, [bp+arg_4]
		mov	[bp+var_6], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 10h
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	esi, eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	cx, word ptr [bp+arg_0]
		add	cx, 18h
		push	ax
		push	cx
		pop	ecx
		mov	ebx, dword_7CB28
		push	ds
		lds	di, word ptr [bp+arg_0]
		sub	eax, eax
		mov	ax, 3
		mov	[di+14h], eax
		mov	ax, 5
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_A]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 3

loc_27658:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_27696
		cmp	ax, 140h
		jge	short loc_27696
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_27696
		cmp	ax, 0C8h
		jge	short loc_27696
		mov	[di+4], eax
		mov	ax, [bp+var_2]
		shl	eax, 10h
		mov	[di+8], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_27658
		pop	ds
		jmp	short loc_2769D

loc_27696:
		pop	ds
		mov	word_77921, 1

loc_2769D:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_27595		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_276A7		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_276A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_276AC		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	al, [bp+arg_4]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 1Dh
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		push	[bp+var_2]
		push	64DEh
		call	Table_LookupByRange_2DEC8
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_276F5
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_276FC

loc_276F5:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_276FC:
		cmp	dx, 0FFFFh
		jnz	short loc_2770B
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+1Ch], 0
		jmp	short loc_27712

loc_2770B:
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ch], dl

loc_27712:
		leave
		retf
sub_276AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27714		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h

		push	bp
		mov	bp, sp
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2690E
		add	sp, 14h
		les	bx, word ptr [bp+arg_10]
		mov	al, es:[bx+1]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_276AC
		add	sp, 6
		pop	bp
		retf
sub_27714		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27747		proc far

var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	[bp+var_2], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_277BE
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+12h]
		mov	dx, es:[bx+10h]
		add	dx, 0Ch
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		les	si, [bp+var_6]
		mov	eax, es:[si]
		mov	[bp+var_1E], eax
		mov	eax, es:[si+4]
		mov	[bp+var_1A], eax
		mov	eax, es:[si+8]
		mov	[bp+var_16], eax
		lea	ax, word ptr [bp+var_1E]
		push	ax
		push	[bp+var_2]
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_277BE

loc_277BE:
		mov	[bp+var_8], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2782A
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		add	dx, 0Ch
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	si, [bp+var_C]
		mov	eax, es:[si]
		mov	[bp+var_2A], eax
		mov	eax, es:[si+4]
		mov	[bp+var_26], eax
		mov	eax, es:[si+8]
		mov	[bp+var_22], eax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	[bp+var_8]
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_2782A

loc_2782A:
		mov	[bp+var_E], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_27896
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Ah]
		mov	dx, es:[bx+18h]
		add	dx, 0Ch
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		les	si, [bp+var_12]
		mov	eax, es:[si]
		mov	[bp+var_36], eax
		mov	eax, es:[si+4]
		mov	[bp+var_32], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2E], eax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	[bp+var_E]
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_27896

loc_27896:
		pop	di
		pop	si
		leave
		retf
sub_27747		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2789A		proc far
		push	bp
		mov	bp, sp
		mov	al, 5
		pop	bp
		retf
sub_2789A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_278A1		proc far

var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		cmp	word_77957, 0
		jnz	short loc_278B1
		jmp	loc_27938

loc_278B1:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_264D8
		add	sp, 4
		push	large 600003h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	[bp+var_6], 0
		jnz	short loc_278DA
		jmp	loc_27961

loc_278DA:
		les	bx, word ptr [bp+var_6]
		mov	dword ptr es:[bx+10h], 1
		cmp	byte_7CAF9, 0
		jz	short loc_278F1
		mov	al, 6
		jmp	short loc_278F3

loc_278F1:
		mov	al, 5

loc_278F3:
		mov	ah, 0
		mov	[bp+var_2], ax
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+6], ax
		mov	eax, dword_7CB28
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_6]
		add	ax, 18h
		push	word ptr [bp+var_6+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_6]
		mov	es:[bx+8], eax
		mov	dx, word ptr [bp+var_6+2]
		mov	ax, word ptr [bp+var_6]
		jmp	short loc_27965

loc_27938:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_27967
		add	sp, 8
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		cmp	word_77921, 0
		jnz	short loc_27961
		cmp	[bp+var_6], 0
		jnz	short loc_27965

loc_27961:
		xor	dx, dx
		xor	ax, ax

loc_27965:
		leave
		retf
sub_278A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27967		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_2798B
		push	60h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2798B
		jmp	loc_27A9B

loc_2798B:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 33Ch
		mov	word ptr es:[bx], 1203h
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+1Ch]
		mov	[bp+var_3], al
		mov	al, es:[bx+1Dh]
		mov	[bp+var_4], al
		mov	al, [bp+var_3]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_5], al
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+10h], 1
		cmp	byte_7CAF9, 0
		jz	short loc_279D9
		mov	al, 6
		jmp	short loc_279DB

loc_279D9:
		mov	al, 5

loc_279DB:
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	eax, [bp+arg_4]
		mov	[bp+var_A], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 10h
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	esi, eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	cx, word ptr [bp+arg_0]
		add	cx, 18h
		push	ax
		push	cx
		pop	ecx
		mov	ebx, dword_7CB28
		push	ds
		lds	di, word ptr [bp+arg_0]
		sub	eax, eax
		mov	ax, 3
		mov	[di+14h], eax
		mov	ax, [bp+var_2]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_E]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 3

loc_27A4B:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_27A95
		cmp	ax, 140h
		jge	short loc_27A95
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_27A95
		cmp	ax, 0C8h
		jge	short loc_27A95
		mov	[di+4], eax
		sub	eax, eax
		mov	ah, es:[si+28h]
		mov	al, [bp+var_4]
		mul	ah
		add	ah, [bp+var_5]
		shl	eax, 8
		mov	[di+8], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_27A4B
		pop	ds
		jmp	short loc_27A9B

loc_27A95:
		mov	word_77921, 1

loc_27A9B:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_27967		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27AA5		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_27AA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27AAA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+1Eh]
		mov	ax, es:[bx+1Ch]
		pop	bp
		retf
sub_27AAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27ABA		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+1Ch], eax
		pop	bp
		retf
sub_27ABA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27ACB		proc far
		push	bp
		mov	bp, sp
		mov	al, 6
		pop	bp
		retf
sub_27ACB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27AD2		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	word_77957, 0
		jnz	short loc_27AE2
		jmp	loc_27B76

loc_27AE2:
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_26451
		add	sp, 6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2663E
		add	sp, 4
		push	large 600003h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_27B18
		jmp	loc_27B9F

loc_27B18:
		les	bx, word ptr [bp+var_4]
		mov	word ptr es:[bx+6], 7
		mov	eax, dword_7CB28
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_4]
		add	ax, 18h
		push	word ptr [bp+var_4+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+8], eax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+10h], eax
		mov	dword ptr es:[bx+0Ch], 0
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_27BA3

loc_27B76:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_27BA5
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_27B9F
		cmp	[bp+var_4], 0
		jnz	short loc_27BA3

loc_27B9F:
		xor	dx, dx
		xor	ax, ax

loc_27BA3:
		leave
		retf
sub_27AD2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27BA5		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_27BC9
		push	60h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_27BC9
		jmp	loc_27CCC

loc_27BC9:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 33Ch
		mov	word ptr es:[bx], 11FFh
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 20h
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	eax, [bp+arg_4]
		mov	[bp+var_8], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 10h
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	esi, eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	cx, word ptr [bp+arg_0]
		add	cx, 18h
		push	ax
		push	cx
		pop	ecx
		mov	ebx, dword_7CB28
		push	ds
		lds	di, word ptr [bp+arg_0]
		sub	eax, eax
		mov	ax, 3
		mov	[di+14h], eax
		mov	ax, 7
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_C]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 3
		push	es
		sub	edx, edx
		les	dx, [bp+var_4]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_27C74:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_27CC5
		cmp	ax, 140h
		jge	short loc_27CC5
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_27CC5
		cmp	ax, 0C8h
		jge	short loc_27CC5
		mov	[di+4], eax
		mov	ax, fs:[edx]
		shl	eax, 10h
		mov	[di+0Ch], eax
		add	dx, 2
		mov	ax, fs:[edx]
		shl	eax, 10h
		mov	[di+10h], eax
		add	dx, 2
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_27C74
		pop	ds
		jmp	short loc_27CCC

loc_27CC5:
		pop	ds
		mov	word_77921, 1

loc_27CCC:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_27BA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27CD6		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_27CD6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27CDB		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h

		push	bp
		mov	bp, sp
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2690E
		add	sp, 14h
		les	bx, word ptr [bp+arg_10]
		mov	al, es:[bx+1]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Ch
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_27231
		add	sp, 6
		pop	bp
		retf
sub_27CDB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27D14		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	large [bp+arg_0]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Ch
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_272A5
		add	sp, 0Ah
		pop	bp
		retf
sub_27D14		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27D31		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+32h], 0FDh
		pop	bp
		retf
sub_27D31		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27D3E		proc far
		push	bp
		mov	bp, sp
		mov	al, 7
		pop	bp
		retf
sub_27D3E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27D45		proc far

var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+32h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_27D9C
		push	large 0
		mov	al, es:[bx+30h]
		mov	ah, 0
		push	ax
		push	64DEh
		call	Palette_ShadeTableFor_2DE20
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_27D89
		les	bx, word ptr [bp+arg_0]
		mov	dl, es:[bx+2Eh]
		jmp	short loc_27DC4

loc_27D89:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+2Eh]
		mov	ah, 0
		les	bx, word ptr [bp+var_4]
		add	bx, ax
		mov	dl, es:[bx]
		jmp	short loc_27DC4

loc_27D9C:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+2Fh]
		mov	ah, 0
		push	ax
		push	large 0
		mov	al, es:[bx+30h]
		mov	ah, 0
		push	ax
		mov	al, es:[bx+2Eh]
		mov	ah, 0
		push	ax
		push	64DEh
		call	sub_2E656
		add	sp, 0Ch
		mov	dl, al

loc_27DC4:
		cmp	word_77957, 0
		jnz	short loc_27DCE
		jmp	loc_27E75

loc_27DCE:
		mov	al, dl
		mov	ah, 0
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_26451
		add	sp, 6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2663E
		add	sp, 4
		push	large 600003h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_8], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jnz	short loc_27E07
		jmp	loc_27E9F

loc_27E07:
		cmp	byte_7CAFA, 0
		jz	short loc_27E12
		mov	al, 8
		jmp	short loc_27E14

loc_27E12:
		mov	al, 5

loc_27E14:
		mov	ah, 0
		mov	word ptr [bp+var_8+2], ax
		les	bx, word ptr [bp+var_A]
		mov	es:[bx+6], ax
		mov	eax, dword_7CB28
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_A]
		add	ax, 18h
		push	word ptr [bp+var_8]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_A]
		mov	es:[bx+8], eax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+var_A]
		mov	es:[bx+10h], eax
		mov	dword ptr es:[bx+0Ch], 0
		mov	dx, word ptr [bp+var_8]
		mov	ax, word ptr [bp+var_A]
		jmp	short loc_27EA3

loc_27E75:
		mov	word_77921, 0
		push	dx
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_27EA5
		add	sp, 0Ah
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	word_77921, 0
		jnz	short loc_27E9F
		cmp	[bp+var_8], 0
		jnz	short loc_27EA3

loc_27E9F:
		xor	dx, dx
		xor	ax, ax

loc_27EA3:
		leave
		retf
sub_27D45		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_27EA5		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_27EC9
		push	60h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_27EC9
		jmp	loc_27FF6

loc_27EC9:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 33Ch
		mov	word ptr es:[bx], 11FFh
		mov	word ptr es:[bx], 11FBh
		mov	al, [bp+arg_8]
		mov	ah, 0
		mov	[bp+var_2], ax
		cmp	byte_7CAFA, 0
		jz	short loc_27EF3
		mov	al, 8
		jmp	short loc_27EF5

loc_27EF3:
		mov	al, 5

loc_27EF5:
		mov	ah, 0
		mov	[bp+var_4], ax
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 20h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		mov	eax, [bp+arg_4]
		mov	[bp+var_C], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 10h
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	esi, eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	cx, word ptr [bp+arg_0]
		add	cx, 18h
		push	ax
		push	cx
		pop	ecx
		mov	ebx, dword_7CB28
		push	ds
		lds	di, word ptr [bp+arg_0]
		sub	eax, eax
		mov	ax, 3
		mov	[di+14h], eax
		mov	ax, [bp+var_4]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_10]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 3
		push	es
		sub	edx, edx
		les	dx, [bp+var_8]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_27F93:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_27FEF
		cmp	ax, 140h
		jge	short loc_27FEF
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_27FEF
		cmp	ax, 0C8h
		jge	short loc_27FEF
		mov	[di+4], eax
		mov	ax, [bp+var_2]
		shl	eax, 10h
		mov	[di+8], eax
		mov	ax, fs:[edx]
		shl	eax, 10h
		mov	[di+0Ch], eax
		add	dx, 2
		mov	ax, fs:[edx]
		shl	eax, 10h
		mov	[di+10h], eax
		add	dx, 2
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_27F93
		pop	ds
		jmp	short loc_27FF6

loc_27FEF:
		pop	ds
		mov	word_77921, 1

loc_27FF6:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_27EA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28000		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_28000		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_28005		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		mov	al, [bp+arg_4]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 2Dh
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		push	[bp+var_2]
		push	64DEh
		call	Table_LookupByRange_2DEC8
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_2804E
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_28055

loc_2804E:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_28055:
		cmp	dx, 0FFFFh
		jnz	short loc_28064
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+2Ch], 0
		jmp	short loc_2806B

loc_28064:
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ch], dl

loc_2806B:
		leave
		retf
sub_28005		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2806D		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h

		push	bp
		mov	bp, sp
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2690E
		add	sp, 14h
		les	bx, word ptr [bp+arg_10]
		mov	al, es:[bx+1]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_28005
		add	sp, 6
		pop	bp
		retf
sub_2806D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_280A0		proc far

var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	[bp+var_2], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_28117
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+12h]
		mov	dx, es:[bx+10h]
		add	dx, 0Ch
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		les	si, [bp+var_6]
		mov	eax, es:[si]
		mov	[bp+var_1E], eax
		mov	eax, es:[si+4]
		mov	[bp+var_1A], eax
		mov	eax, es:[si+8]
		mov	[bp+var_16], eax
		lea	ax, word ptr [bp+var_1E]
		push	ax
		push	[bp+var_2]
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_28117

loc_28117:
		mov	[bp+var_8], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_28183
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		add	dx, 0Ch
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	si, [bp+var_C]
		mov	eax, es:[si]
		mov	[bp+var_2A], eax
		mov	eax, es:[si+4]
		mov	[bp+var_26], eax
		mov	eax, es:[si+8]
		mov	[bp+var_22], eax
		lea	ax, word ptr [bp+var_2A]
		push	ax
		push	[bp+var_8]
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_28183

loc_28183:
		mov	[bp+var_E], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_281EF
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Ah]
		mov	dx, es:[bx+18h]
		add	dx, 0Ch
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		les	si, [bp+var_12]
		mov	eax, es:[si]
		mov	[bp+var_36], eax
		mov	eax, es:[si+4]
		mov	[bp+var_32], eax
		mov	eax, es:[si+8]
		mov	[bp+var_2E], eax
		lea	ax, word ptr [bp+var_36]
		push	ax
		push	[bp+var_E]
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_281EF

loc_281EF:
		pop	di
		pop	si
		leave
		retf
sub_280A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_281F3		proc far
		push	bp
		mov	bp, sp
		mov	al, 8
		pop	bp
		retf
sub_281F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_281FA		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	word_77957, 0
		jnz	short loc_2820A
		jmp	loc_282C1

loc_2820A:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2658B
		add	sp, 4
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2663E
		add	sp, 4
		push	large 600003h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_2823E
		jmp	loc_282EA

loc_2823E:
		cmp	byte_7CAF9, 0
		jz	short loc_28254
		cmp	byte_7CAFA, 0
		jz	short loc_28250
		mov	al, 9

loc_2824E:
		jmp	short loc_28261

loc_28250:
		mov	al, 6
		jmp	short loc_28261

loc_28254:
		cmp	byte_7CAFA, 0
		jz	short loc_2825F
		mov	al, 8
		jmp	short loc_2824E

loc_2825F:
		mov	al, 5

loc_28261:
		mov	ah, 0
		mov	dx, ax
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+6], dx
		mov	eax, dword_7CB28
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_4]
		add	ax, 18h
		push	word ptr [bp+var_4+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+8], eax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+10h], eax
		mov	dword ptr es:[bx+0Ch], 0
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_282EE

loc_282C1:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_282F0
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_282EA
		cmp	[bp+var_4], 0
		jnz	short loc_282EE

loc_282EA:
		xor	dx, dx
		xor	ax, ax

loc_282EE:
		leave
		retf
sub_281FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_282F0		proc far

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_28314
		push	60h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_28314
		jmp	loc_28480

loc_28314:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 33Ch
		mov	word ptr es:[bx], 11FFh
		mov	word ptr es:[bx], 11F7h
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+2Ch]
		mov	[bp+var_1], al
		mov	al, es:[bx+2Dh]
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_3], al
		cmp	byte_7CAF9, 0
		jz	short loc_28366
		cmp	byte_7CAFA, 0
		jz	short loc_28362
		mov	al, 9

loc_28360:
		jmp	short loc_28373

loc_28362:
		mov	al, 6
		jmp	short loc_28373

loc_28366:
		cmp	byte_7CAFA, 0
		jz	short loc_28371
		mov	al, 8
		jmp	short loc_28360

loc_28371:
		mov	al, 5

loc_28373:
		mov	ah, 0
		mov	[bp+var_6], ax
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 20h
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		mov	eax, [bp+arg_4]
		mov	[bp+var_E], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 10h
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	esi, eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	cx, word ptr [bp+arg_0]
		add	cx, 18h
		push	ax
		push	cx
		pop	ecx
		mov	ebx, dword_7CB28
		push	ds
		lds	di, word ptr [bp+arg_0]
		sub	eax, eax
		mov	ax, 3
		mov	[di+14h], eax
		mov	ax, [bp+var_6]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_12]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 3
		push	es
		sub	edx, edx
		les	dx, [bp+var_A]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_28411:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_28479
		cmp	ax, 140h
		jge	short loc_28479
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_28479
		cmp	ax, 0C8h
		jge	short loc_28479
		mov	[di+4], eax
		sub	eax, eax
		mov	ah, es:[si+28h]
		mov	al, [bp+var_2]
		mul	ah
		add	ah, [bp+var_3]
		shl	eax, 8
		mov	[di+8], eax
		mov	ax, fs:[edx]
		shl	eax, 10h
		mov	[di+0Ch], eax
		add	dx, 2
		mov	ax, fs:[edx]
		shl	eax, 10h
		mov	[di+10h], eax
		add	dx, 2
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_28411
		pop	ds
		jmp	short loc_28480

loc_28479:
		pop	ds
		mov	word_77921, 1

loc_28480:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_282F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2848A		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2848A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2848F		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	large [bp+arg_0]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Ch
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_272A5
		add	sp, 0Ah
		pop	bp
		retf
sub_2848F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_284AC		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_284AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_284B1		proc far
		push	bp
		mov	bp, sp
		mov	al, 9
		pop	bp
		retf
sub_284B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_284B8		proc far

var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		cmp	word_77957, 0
		jnz	short loc_284C8
		jmp	loc_285A2

loc_284C8:
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_26451
		add	sp, 6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2663E
		add	sp, 4
		push	large 600003h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_284FE
		jmp	loc_285CB

loc_284FE:
		cmp	byte_7CAFA, 0
		jz	short loc_28509
		mov	al, 0Ah
		jmp	short loc_2850B

loc_28509:
		mov	al, 5

loc_2850B:
		mov	ah, 0
		mov	[bp+var_6], ax
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+6], ax
		mov	eax, dword_7CB28
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_4]
		add	ax, 18h
		push	word ptr [bp+var_4+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+8], eax
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+10h], eax
		push	large 0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+34h]
		mov	ah, 0
		push	ax
		push	64DEh
		call	Palette_ShadeTableFor_2DE20
		add	sp, 8
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		cmp	[bp+var_E], 0
		jz	short loc_285CB
		push	2
		push	large [bp+var_E]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+0Ch], eax
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_285CF

loc_285A2:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	sub_285D1
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_285CB
		cmp	[bp+var_4], 0
		jnz	short loc_285CF

loc_285CB:
		xor	dx, dx
		xor	ax, ax

loc_285CF:
		leave
		retf
sub_284B8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_285D1		proc near

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_2		= dword ptr  6
arg_6		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		cmp	[bp+arg_2], 0
		jnz	short loc_285F5
		push	60h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_2+2], dx
		mov	word ptr [bp+arg_2], ax
		or	ax, dx
		jnz	short loc_285F5
		jmp	loc_2875C

loc_285F5:
		les	bx, word ptr [bp+arg_2]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 33Ch
		mov	word ptr es:[bx], 11FFh
		mov	word ptr es:[bx], 11F3h
		push	large 0
		les	bx, word ptr [bp+arg_6]
		mov	al, es:[bx+34h]
		mov	ah, 0
		push	ax
		push	64DEh
		call	Palette_ShadeTableFor_2DE20
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_2863F
		les	bx, word ptr [bp+arg_2]
		mov	dword ptr es:[bx+0Ch], 0
		jmp	short loc_28659

loc_2863F:
		push	2
		push	large [bp+var_4]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+0Ch], eax

loc_28659:
		cmp	byte_7CAFA, 0
		jz	short loc_28664
		mov	al, 0Ah
		jmp	short loc_28666

loc_28664:
		mov	al, 5

loc_28666:
		mov	ah, 0
		mov	[bp+var_6], ax
		les	bx, word ptr [bp+arg_6]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_6+2]
		mov	dx, word ptr [bp+arg_6]
		add	dx, 20h
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		mov	eax, [bp+arg_6]
		mov	[bp+var_E], eax
		mov	ax, word ptr [bp+arg_6+2]
		mov	dx, word ptr [bp+arg_6]
		add	dx, 10h
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		push	2
		mov	ax, word ptr [bp+arg_2]
		add	ax, 18h
		push	word ptr [bp+arg_2+2]
		push	ax
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	esi, eax
		mov	ax, word ptr [bp+arg_2+2]
		mov	cx, word ptr [bp+arg_2]
		add	cx, 18h
		push	ax
		push	cx
		pop	ecx
		mov	ebx, dword_7CB28
		push	ds
		lds	di, word ptr [bp+arg_2]
		sub	eax, eax
		mov	ax, 3
		mov	[di+14h], eax
		mov	ax, [bp+var_6]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_12]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 3
		push	es
		sub	edx, edx
		les	dx, [bp+var_A]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_28704:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_28755
		cmp	ax, 140h
		jge	short loc_28755
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_28755
		cmp	ax, 0C8h
		jge	short loc_28755
		mov	[di+4], eax
		mov	ax, fs:[edx]
		shl	eax, 10h
		mov	[di+0Ch], eax
		add	dx, 2
		mov	ax, fs:[edx]
		shl	eax, 10h
		mov	[di+10h], eax
		add	dx, 2
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_28704
		pop	ds
		jmp	short loc_2875C

loc_28755:
		pop	ds
		mov	word_77921, 1

loc_2875C:
		mov	dx, word ptr [bp+arg_2+2]
sub_285D1		endp

; START OF FUNCTION CHUNK FOR sub_285D1
		db 8Bh
; END OF FUNCTION CHUNK FOR sub_285D1
seg064		ends
