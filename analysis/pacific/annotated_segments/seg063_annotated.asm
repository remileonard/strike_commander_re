seg063		segment	para public 'CODE' use16
		assume cs:seg063
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 3, 0D8h, 26h, 8Ah, 17h

loc_23F25:
		db 8Ah, 0C2h, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23F29		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_23F29		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23F2E		proc far

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
		mov	dx, 4
		mov	di, [bp+var_6]
		mov	bx, si
		les	si, fs:[bx]

loc_23F5C:
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
		jnz	short loc_23F5C
		pop	di
		pop	si
		leave
		retf
sub_23F2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23FB5		proc far

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
		mov	al, es:[bx+20h]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_1], al
		mov	bx, [bp+arg_0]
		mov	al, es:[bx+21h]
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
		mov	dx, 4
		mov	di, [bp+var_8]
		mov	bx, si
		les	si, fs:[bx]

loc_24005:
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
		jnz	short loc_24005
		pop	di
		pop	si
		leave
		retf
sub_23FB5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24068		proc far

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
		mov	al, es:[bx+34h]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_1], al
		mov	bx, [bp+arg_0]
		mov	al, es:[bx+35h]
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
		mov	dx, 4
		mov	di, [bp+var_8]
		mov	bx, si
		les	si, fs:[bx]

loc_240B8:
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
		jnz	short loc_240B8
		pop	di
		pop	si
		leave
		retf
sub_24068		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2411B		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		add	dx, 24h
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
		movzx	eax, word ptr es:[bx+0Ch]
		mov	dword_7C4AA, eax
		movzx	eax, word ptr es:[bx+0Eh]
		mov	dword_7C4AE, eax
		mov	eax, dword_7C4AA
		shl	eax, 10h
		mov	dword_7C4AA, eax
		mov	eax, dword_7C4AE
		shl	eax, 10h
		mov	dword_7C4AE, eax
		leave
		retf
sub_2411B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_241E4		proc far

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
		jle	short loc_24226
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax

loc_24226:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_4]
		jle	short loc_24248
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_8], eax

loc_24248:
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_8]
		jle	short loc_2425E
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax

loc_2425E:
		leave
		retf
sub_241E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24260		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h
arg_E		= word ptr  14h

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
		les	bx, [bp+arg_E]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		les	bx, [bp+arg_A]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	si
		call	sub_69F22
		add	sp, 0Ch
		les	bx, [bp+arg_E]
		mov	al, es:[bx+4]
		push	ax
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		les	bx, [bp+arg_E]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	si
		call	sub_69F22
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
sub_24260		endp

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
Face_ComputeNormal_242FE		proc far

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
Face_ComputeNormal_242FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_243F9		proc far

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
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ch]
		add	eax, es:[bx]
		mov	ebx, 4
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
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ch]
		add	eax, es:[bx+4]
		mov	ebx, 4
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
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ch]
		add	eax, es:[bx+8]
		mov	ebx, 4
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
sub_243F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_244DE		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h

		push	bp
		mov	bp, sp
		les	bx, word ptr [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+10h], eax
		mov	eax, [bp+arg_8]
		mov	es:[bx+14h], eax
		mov	eax, [bp+arg_C]
		mov	es:[bx+18h], eax
		mov	eax, [bp+arg_10]
		mov	es:[bx+1Ch], eax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr Face_ComputeNormal_242FE
		add	sp, 4
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_243F9
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
		les	bx, word ptr [bp+arg_0]
		movsx	eax, word ptr es:[bx+4]
		les	bx, es:[bx+1Ch]
		add	es:[bx+0Ch], eax
		les	bx, word ptr [bp+arg_0]
		movsx	eax, word ptr es:[bx+6]
		les	bx, es:[bx+1Ch]
		add	es:[bx+10h], eax
		les	bx, word ptr [bp+arg_0]
		movsx	eax, word ptr es:[bx+8]
		les	bx, es:[bx+1Ch]
		add	es:[bx+14h], eax
		pop	bp
		retf
sub_244DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_245F8		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_245F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_245FD		proc far

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
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ch]
		mov	dl, es:[bx+29h]
		shr	dx, 3
		and	dx, 1
		and	al, dl
		pop	bp
		retf
sub_245FD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2464C		proc far

var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
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
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 60h
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+12h]
		mov	dx, es:[bx+10h]
		add	dx, 1Ch
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_3C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_38], eax
		mov	eax, es:[si+8]
		mov	[bp+var_34], eax
		lea	di, word ptr [bp+var_3C]
		add	di, 4
		mov	es, [bp+arg_2]
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		add	dx, 1Ch
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	[bp+var_48], eax
		mov	eax, es:[si+4]
		mov	[bp+var_44], eax
		mov	eax, es:[si+8]
		mov	[bp+var_40], eax
		lea	si, word ptr [bp+var_48]
		add	si, 4
		mov	eax, [di]
		add	eax, [si]
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	es, [bp+arg_2]
		mov	ax, es:[bx+1Ah]
		mov	dx, es:[bx+18h]
		add	dx, 1Ch
		mov	[bp+var_12], ax
		mov	[bp+var_14], dx
		les	si, [bp+var_14]
		mov	eax, es:[si]
		mov	[bp+var_54], eax
		mov	eax, es:[si+4]
		mov	[bp+var_50], eax
		mov	eax, es:[si+8]
		mov	[bp+var_4C], eax
		lea	si, word ptr [bp+var_54]
		add	si, 4
		mov	eax, [bp+var_10]
		add	eax, [si]
		mov	[bp+var_18], eax
		mov	[bp+var_1C], eax
		mov	es, [bp+arg_2]
		mov	ax, es:[bx+1Eh]
		mov	dx, es:[bx+1Ch]
		add	dx, 1Ch
		mov	[bp+var_1E], ax
		mov	[bp+var_20], dx
		les	si, [bp+var_20]
		mov	eax, es:[si]
		mov	[bp+var_60], eax
		mov	eax, es:[si+4]
		mov	[bp+var_5C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_58], eax
		lea	si, word ptr [bp+var_60]
		add	si, 4
		mov	eax, [bp+var_1C]
		add	eax, [si]
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	ebx, 4
		cdq
		idiv	ebx
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		mov	dword_7CB28, eax
		sar	eax, 8
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
sub_2464C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24780		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_24780		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24785		proc far
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
sub_24785		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2478C		proc far

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
		mov	bx, [bp+arg_0]
		mov	ax, es:[bx+1Ch]
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
		mov	es:[si+1Eh], dx
		mov	es:[si+1Ch], bx
		pop	si
		pop	bp
		retf
sub_2478C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2485A		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_0], 0
		jnz	short loc_2487C
		push	78h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2487C
		jmp	loc_24913

loc_2487C:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 32Ch
		mov	eax, dword_7CB28
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+2], eax
		mov	dword ptr es:[bx+14h], 4
		xor	cx, cx
		jmp	short loc_248EE

loc_248A7:
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

loc_248EE:
		cmp	cx, 4
		jl	short loc_248A7
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

loc_24913:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_2485A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2491B		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h
arg_14		= dword ptr  1Ah

		push	bp
		mov	bp, sp
		push	large [bp+arg_14]
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_244DE
		add	sp, 18h
		les	bx, word ptr [bp+arg_14]
		mov	al, es:[bx+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+20h], al
		pop	bp
		retf
sub_2491B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2494D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+20h]
		mov	es:[bx+21h], al
		pop	bp
		retf
sub_2494D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2495D		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_2495D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24964		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	word_77957, 0
		jz	short loc_249EC
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+21h]
		mov	ah, 0
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_23F2E
		add	sp, 6
		push	large 780004h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_24A15
		les	bx, word ptr [bp+var_4]
		mov	word ptr es:[bx+6], 0Ch
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
		jmp	short loc_24A19

loc_249EC:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_24A1B
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_24A15
		cmp	[bp+var_4], 0
		jnz	short loc_24A19

loc_24A15:
		xor	dx, dx
		xor	ax, ax

loc_24A19:
		leave
		retf
sub_24964		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24A1B		proc far

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
		jnz	short loc_24A3F
		push	78h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_24A3F
		jmp	loc_24B19

loc_24A3F:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 32Ch
		mov	word ptr es:[bx], 330h
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+20h]
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
		mov	ax, 4
		mov	[di+14h], eax
		mov	ax, 0Ch
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_A]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 4

loc_24AD4:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_24B12
		cmp	ax, 140h
		jge	short loc_24B12
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_24B12
		cmp	ax, 0C8h
		jge	short loc_24B12
		mov	[di+4], eax
		mov	ax, [bp+var_2]
		shl	eax, 10h
		mov	[di+8], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_24AD4
		pop	ds
		jmp	short loc_24B19

loc_24B12:
		pop	ds
		mov	word_77921, 1

loc_24B19:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_24A1B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24B23		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_24B23		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24B28		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h
arg_14		= dword ptr  1Ah

		push	bp
		mov	bp, sp
		push	large [bp+arg_14]
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2491B
		add	sp, 18h
		pop	bp
		retf
sub_24B28		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24B4C		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_24B4C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24B53		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	word_77957, 0
		jz	short loc_24BDB
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+21h]
		mov	ah, 0
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_23F2E
		add	sp, 6
		push	large 780004h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_24C04
		les	bx, word ptr [bp+var_4]
		mov	word ptr es:[bx+6], 0Dh
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
		jmp	short loc_24C08

loc_24BDB:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_24C0A
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_24C04
		cmp	[bp+var_4], 0
		jnz	short loc_24C08

loc_24C04:
		xor	dx, dx
		xor	ax, ax

loc_24C08:
		leave
		retf
sub_24B53		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24C0A		proc far

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
		jnz	short loc_24C2E
		push	78h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_24C2E
		jmp	loc_24D0D

loc_24C2E:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 32Ch
		mov	word ptr es:[bx], 330h
		mov	word ptr es:[bx], 334h
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+20h]
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
		mov	ax, 4
		mov	[di+14h], eax
		mov	ax, 0Dh
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_A]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 4

loc_24CC8:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_24D06
		cmp	ax, 140h
		jge	short loc_24D06
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_24D06
		cmp	ax, 0C8h
		jge	short loc_24D06
		mov	[di+4], eax
		mov	ax, [bp+var_2]
		shl	eax, 10h
		mov	[di+8], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_24CC8
		pop	ds
		jmp	short loc_24D0D

loc_24D06:
		pop	ds
		mov	word_77921, 1

loc_24D0D:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_24C0A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24D17		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_24D17		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24D1C		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h
arg_14		= dword ptr  1Ah

		push	bp
		mov	bp, sp
		push	si
		push	large [bp+arg_14]
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_244DE
		add	sp, 18h
		les	bx, word ptr [bp+arg_14]
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	si, ax
		or	si, si
		jge	short loc_24D54
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_24D71

loc_24D54:
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

loc_24D71:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+22h], dx
		mov	es:[bx+20h], ax
		pop	si
		pop	bp
		retf
sub_24D1C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24D7F		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_24D7F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24D84		proc far
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
sub_24D84		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24D8B		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	word_77957, 0
		jnz	short loc_24D9B
		jmp	loc_24E2F

loc_24D9B:
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_23F2E
		add	sp, 6
		push	large 780004h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_24DC6
		jmp	loc_24E58

loc_24DC6:
		les	bx, word ptr [bp+var_4]
		mov	word ptr es:[bx+6], 0Eh
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
		mov	dword ptr es:[bx+10h], 1
		push	2
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+20h]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+0Ch], eax
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_24E5C

loc_24E2F:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_24E5E
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_24E58
		cmp	[bp+var_4], 0
		jnz	short loc_24E5C

loc_24E58:
		xor	dx, dx
		xor	ax, ax

loc_24E5C:
		leave
		retf
sub_24D8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24E5E		proc far

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
		jnz	short loc_24E82
		push	78h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_24E82
		jmp	loc_24F60

loc_24E82:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 32Ch
		mov	word ptr es:[bx], 11E9h
		push	2
		les	bx, word ptr [bp+arg_4]
		push	large es:[bx+20h]
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
		mov	ax, 4
		mov	[di+14h], eax
		mov	ax, 0Eh
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_8]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 4

loc_24F26:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_24F59
		cmp	ax, 140h
		jge	short loc_24F59
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_24F59
		cmp	ax, 0C8h
		jge	short loc_24F59
		mov	[di+4], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_24F26
		pop	ds
		jmp	short loc_24F60

loc_24F59:
		pop	ds
		mov	word_77921, 1

loc_24F60:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_24E5E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24F6A		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_24F6A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24F6F		proc far

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
		jz	short loc_24FB8
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_24FBF

loc_24FB8:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_24FBF:
		cmp	dx, 0FFFFh
		jnz	short loc_24FD5
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_4]
		mov	es:[bx+2], al
		and	byte ptr es:[bx+7], 0FBh
		jmp	short loc_24FE1

loc_24FD5:
		les	bx, [bp+arg_0]
		mov	es:[bx+2], dl
		or	byte ptr es:[bx+7], 4

loc_24FE1:
		leave
		retf
sub_24F6F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_24FE3		proc far

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
		jnz	short loc_2501C
		jmp	loc_25103

loc_2501C:
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
		jge	short loc_25078
		mov	al, 1
		jmp	short loc_2507A

loc_25078:
		mov	al, 0

loc_2507A:
		mov	dl, al
		or	dl, dl
		jz	short loc_250CF
		les	bx, [bp+arg_0]
		mov	al, es:[bx+7]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_2509F
		mov	al, es:[bx+7]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_250CF

loc_2509F:
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+7], 1
		or	byte ptr es:[bx+7], 2
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Utility_Helper_57812
		pop	cx

loc_250B6:
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	si
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+6], al
		jmp	short loc_25131

loc_250CF:
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_25131
		les	bx, [bp+arg_0]
		mov	al, es:[bx+7]
		and	ax, 1
		or	al, al
		jnz	short loc_250F4
		mov	al, es:[bx+7]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_25131

loc_250F4:
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+7], 0FEh
		or	byte ptr es:[bx+7], 2
		jmp	short loc_250B6

loc_25103:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+7]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_25131
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	si
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+6], al
		or	byte ptr es:[bx+7], 2

loc_25131:
		pop	si
		leave
		retf
sub_24FE3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25134		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h
arg_14		= dword ptr  1Ah

		push	bp
		mov	bp, sp
		push	large [bp+arg_14]
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_244DE
		add	sp, 18h
		les	bx, word ptr [bp+arg_14]
		mov	al, es:[bx+1]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 20h
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_24F6F
		add	sp, 6
		pop	bp
		retf
sub_25134		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25171		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+27h], 0FDh
		pop	bp
		retf
sub_25171		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2517E		proc far
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
sub_2517E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25185		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	large [bp+arg_0]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 20h
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_24FE3
		add	sp, 0Ah
		pop	bp
		retf
sub_25185		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_251A2		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+27h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_251F9
		push	large 0
		mov	al, es:[bx+26h]
		mov	ah, 0
		push	ax
		push	64DEh
		call	Palette_ShadeTableFor_2DE20
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_251E6
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+22h]
		jmp	short loc_2521F

loc_251E6:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+22h]
		mov	ah, 0
		les	bx, word ptr [bp+var_4]
		add	bx, ax
		mov	al, es:[bx]
		jmp	short loc_2521F

loc_251F9:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+23h]
		mov	ah, 0
		push	ax
		push	large 0
		mov	al, es:[bx+26h]
		mov	ah, 0
		push	ax
		mov	al, es:[bx+22h]
		mov	ah, 0
		push	ax
		push	64DEh
		call	sub_2E656
		add	sp, 0Ch

loc_2521F:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+25h], al
		cmp	word_77957, 0
		jz	short loc_252A8
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+25h]
		mov	ah, 0
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_23F2E
		add	sp, 6
		push	large 780004h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_252D1
		les	bx, word ptr [bp+var_8]
		mov	word ptr es:[bx+6], 10h
		mov	dword ptr es:[bx+10h], 1
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
		jmp	short loc_252D5

loc_252A8:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_252D7
		add	sp, 8
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	word_77921, 0
		jnz	short loc_252D1
		cmp	[bp+var_8], 0
		jnz	short loc_252D5

loc_252D1:
		xor	dx, dx
		xor	ax, ax

loc_252D5:
		leave
		retf
sub_251A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_252D7		proc far

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
		jnz	short loc_252FB
		push	78h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_252FB
		jmp	loc_253DF

loc_252FB:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 32Ch
		mov	word ptr es:[bx], 330h
		mov	word ptr es:[bx], 334h
		mov	word ptr es:[bx], 11E5h
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+25h]
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
		mov	ax, 4
		mov	[di+14h], eax
		mov	ax, 10h
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_A]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 4

loc_2539A:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_253D8
		cmp	ax, 140h
		jge	short loc_253D8
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_253D8
		cmp	ax, 0C8h
		jge	short loc_253D8
		mov	[di+4], eax
		mov	ax, [bp+var_2]
		shl	eax, 10h
		mov	[di+8], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_2539A
		pop	ds
		jmp	short loc_253DF

loc_253D8:
		pop	ds
		mov	word_77921, 1

loc_253DF:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_252D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_253E9		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_253E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_253EE		proc far

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
		add	dx, 21h
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		push	[bp+var_2]
		push	64DEh
		call	Table_LookupByRange_2DEC8
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_25437
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_2543E

loc_25437:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_2543E:
		cmp	dx, 0FFFFh
		jnz	short loc_2544D
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+20h], 0
		jmp	short loc_25454

loc_2544D:
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], dl

loc_25454:
		leave
		retf
sub_253EE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25456		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h
arg_14		= dword ptr  1Ah

		push	bp
		mov	bp, sp
		push	large [bp+arg_14]
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_244DE
		add	sp, 18h
		les	bx, word ptr [bp+arg_14]
		mov	al, es:[bx+1]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_253EE
		add	sp, 6
		pop	bp
		retf
sub_25456		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2548D		proc far

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
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
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
		sub	sp, 48h
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
		jnz	short loc_25504
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+12h]
		mov	dx, es:[bx+10h]
		add	dx, 0Ch
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		les	si, [bp+var_6]
		mov	eax, es:[si]
		mov	[bp+var_24], eax
		mov	eax, es:[si+4]
		mov	[bp+var_20], eax
		mov	eax, es:[si+8]
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	[bp+var_2]
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_25504

loc_25504:
		mov	[bp+var_8], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_25570
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		add	dx, 0Ch
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	si, [bp+var_C]
		mov	eax, es:[si]
		mov	[bp+var_30], eax
		mov	eax, es:[si+4]
		mov	[bp+var_2C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_28], eax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	[bp+var_8]
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_25570

loc_25570:
		mov	[bp+var_E], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_255DC
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Ah]
		mov	dx, es:[bx+18h]
		add	dx, 0Ch
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		les	si, [bp+var_12]
		mov	eax, es:[si]
		mov	[bp+var_3C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_38], eax
		mov	eax, es:[si+8]
		mov	[bp+var_34], eax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	[bp+var_E]
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_255DC

loc_255DC:
		mov	[bp+var_14], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ch]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_25648
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1Eh]
		mov	dx, es:[bx+1Ch]
		add	dx, 0Ch
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	si, [bp+var_18]
		mov	eax, es:[si]
		mov	[bp+var_48], eax
		mov	eax, es:[si+4]
		mov	[bp+var_44], eax
		mov	eax, es:[si+8]
		mov	[bp+var_40], eax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	[bp+var_14]
		push	6882h
		call	LightSet_FaceIntensity_29A1E
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ch]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_25648

loc_25648:
		pop	di
		pop	si
		leave
		retf
sub_2548D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2564C		proc far
		push	bp
		mov	bp, sp
		mov	al, 5
		pop	bp
		retf
sub_2564C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25653		proc far

var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		cmp	word_77957, 0
		jnz	short loc_25663
		jmp	loc_256E7

loc_25663:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_23FB5
		add	sp, 4
		push	large 780004h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_2568C
		jmp	loc_25710

loc_2568C:
		cmp	byte_7CAF9, 0
		jz	short loc_25697
		mov	al, 11h
		jmp	short loc_25699

loc_25697:
		mov	al, 10h

loc_25699:
		mov	ah, 0
		mov	[bp+var_6], ax
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+6], ax
		mov	dword ptr es:[bx+10h], 1
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
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_25714

loc_256E7:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_25716
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_25710
		cmp	[bp+var_4], 0
		jnz	short loc_25714

loc_25710:
		xor	dx, dx
		xor	ax, ax

loc_25714:
		leave
		retf
sub_25653		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25716		proc far

var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_2573A
		push	78h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2573A
		jmp	loc_2584B

loc_2573A:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 32Ch
		mov	word ptr es:[bx], 11E1h
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+20h]
		mov	[bp+var_1], al
		mov	al, es:[bx+21h]
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_3], al
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+10h], 1
		cmp	byte_7CAF9, 0
		jz	short loc_25788
		mov	al, 11h
		jmp	short loc_2578A

loc_25788:
		mov	al, 10h

loc_2578A:
		mov	ah, 0
		mov	[bp+var_6], ax
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
		mov	ax, 4
		mov	[di+14h], eax
		mov	ax, [bp+var_6]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_E]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 4

loc_257FA:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_25844
		cmp	ax, 140h
		jge	short loc_25844
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_25844
		cmp	ax, 0C8h
		jge	short loc_25844
		mov	[di+4], eax
		sub	eax, eax
		mov	ah, es:[si+28h]
		mov	al, [bp+var_2]
		mul	ah
		add	ah, [bp+var_3]
		shl	eax, 8
		mov	[di+8], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_257FA
		pop	ds
		jmp	short loc_2584B

loc_25844:
		pop	ds
		mov	word_77921, 1

loc_2584B:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_25716		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25855		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_25855		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2585A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+22h]
		mov	ax, es:[bx+20h]
		pop	bp
		retf
sub_2585A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2586A		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+20h], eax
		pop	bp
		retf
sub_2586A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2587B		proc far
		push	bp
		mov	bp, sp
		mov	al, 6
		pop	bp
		retf
sub_2587B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25882		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	word_77957, 0
		jnz	short loc_25892
		jmp	loc_25926

loc_25892:
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_23F2E
		add	sp, 6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2411B
		add	sp, 4
		push	large 780004h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_258C8
		jmp	loc_2594F

loc_258C8:
		les	bx, word ptr [bp+var_4]
		mov	word ptr es:[bx+6], 12h
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
		les	bx, es:[bx+20h]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+10h], eax
		mov	dword ptr es:[bx+0Ch], 0
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_25953

loc_25926:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_25955
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_2594F
		cmp	[bp+var_4], 0
		jnz	short loc_25953

loc_2594F:
		xor	dx, dx
		xor	ax, ax

loc_25953:
		leave
		retf
sub_25882		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25955		proc far

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
		jnz	short loc_25979
		push	78h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_25979
		jmp	loc_25A7C

loc_25979:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 32Ch
		mov	word ptr es:[bx], 11DDh
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 24h
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
		mov	ax, 4
		mov	[di+14h], eax
		mov	ax, 12h
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_C]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 4
		push	es
		sub	edx, edx
		les	dx, [bp+var_4]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_25A24:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_25A75
		cmp	ax, 140h
		jge	short loc_25A75
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_25A75
		cmp	ax, 0C8h
		jge	short loc_25A75
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
		jnz	short loc_25A24
		pop	ds
		jmp	short loc_25A7C

loc_25A75:
		pop	ds
		mov	word_77921, 1

loc_25A7C:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_25955		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25A86		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_25A86		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25A8B		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h
arg_14		= dword ptr  1Ah

		push	bp
		mov	bp, sp
		push	large [bp+arg_14]
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_244DE
		add	sp, 18h
		les	bx, word ptr [bp+arg_14]
		mov	al, es:[bx+1]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 34h
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_24F6F
		add	sp, 6
		pop	bp
		retf
sub_25A8B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25AC8		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	large [bp+arg_0]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 34h
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_24FE3
		add	sp, 0Ah
		pop	bp
		retf
sub_25AC8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25AE5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+3Bh], 0FDh
		pop	bp
		retf
sub_25AE5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25AF2		proc far
		push	bp
		mov	bp, sp
		mov	al, 7
		pop	bp
		retf
sub_25AF2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25AF9		proc far

var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+3Bh]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_25B50
		push	large 0
		mov	al, es:[bx+3Ah]
		mov	ah, 0
		push	ax
		push	64DEh
		call	Palette_ShadeTableFor_2DE20
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_25B3D
		les	bx, word ptr [bp+arg_0]
		mov	dl, es:[bx+36h]
		jmp	short loc_25B78

loc_25B3D:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+36h]
		mov	ah, 0
		les	bx, word ptr [bp+var_4]
		add	bx, ax
		mov	dl, es:[bx]
		jmp	short loc_25B78

loc_25B50:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+37h]
		mov	ah, 0
		push	ax
		push	large 0
		mov	al, es:[bx+3Ah]
		mov	ah, 0
		push	ax
		mov	al, es:[bx+36h]
		mov	ah, 0
		push	ax
		push	64DEh
		call	sub_2E656
		add	sp, 0Ch
		mov	dl, al

loc_25B78:
		cmp	word_77957, 0
		jnz	short loc_25B82
		jmp	loc_25C29

loc_25B82:
		mov	al, dl
		mov	ah, 0
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_23F2E
		add	sp, 6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2411B
		add	sp, 4
		push	large 780004h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_25BBB
		jmp	loc_25C53

loc_25BBB:
		cmp	byte_7CAFA, 0
		jz	short loc_25BC6
		mov	al, 13h
		jmp	short loc_25BC8

loc_25BC6:
		mov	al, 10h

loc_25BC8:
		mov	ah, 0
		mov	[bp+var_A], ax
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+6], ax
		mov	eax, dword_7CB28
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
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
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+10h], eax
		mov	dword ptr es:[bx+0Ch], 0
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]
		jmp	short loc_25C57

loc_25C29:
		mov	word_77921, 0
		push	dx
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_25C59
		add	sp, 0Ah
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	word_77921, 0
		jnz	short loc_25C53
		cmp	[bp+var_8], 0
		jnz	short loc_25C57

loc_25C53:
		xor	dx, dx
		xor	ax, ax

loc_25C57:
		leave
		retf
sub_25AF9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25C59		proc far

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
		jnz	short loc_25C7D
		push	78h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_25C7D
		jmp	loc_25DAA

loc_25C7D:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 32Ch
		mov	word ptr es:[bx], 11DDh
		mov	word ptr es:[bx], 11D9h
		mov	al, [bp+arg_8]
		mov	ah, 0
		mov	[bp+var_2], ax
		cmp	byte_7CAFA, 0
		jz	short loc_25CA7
		mov	al, 13h
		jmp	short loc_25CA9

loc_25CA7:
		mov	al, 10h

loc_25CA9:
		mov	ah, 0
		mov	[bp+var_4], ax
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 24h
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
		mov	ax, 4
		mov	[di+14h], eax
		mov	ax, [bp+var_4]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_10]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 4
		push	es
		sub	edx, edx
		les	dx, [bp+var_8]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_25D47:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_25DA3
		cmp	ax, 140h
		jge	short loc_25DA3
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_25DA3
		cmp	ax, 0C8h
		jge	short loc_25DA3
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
		jnz	short loc_25D47
		pop	ds
		jmp	short loc_25DAA

loc_25DA3:
		pop	ds
		mov	word_77921, 1

loc_25DAA:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_25C59		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25DB4		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_25DB4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25DB9		proc far

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
		add	dx, 35h
		mov	[bp+var_4], ax
		mov	[bp+var_6], dx
		push	[bp+var_2]
		push	64DEh
		call	Table_LookupByRange_2DEC8
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_25E02
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_25E09

loc_25E02:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_25E09:
		cmp	dx, 0FFFFh
		jnz	short loc_25E18
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+34h], 0
		jmp	short loc_25E1F

loc_25E18:
		les	bx, [bp+arg_0]
		mov	es:[bx+34h], dl

loc_25E1F:
		leave
		retf
sub_25DB9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25E21		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= dword ptr  16h
arg_14		= dword ptr  1Ah

		push	bp
		mov	bp, sp
		push	large [bp+arg_14]
		push	large [bp+arg_10]
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_244DE
		add	sp, 18h
		les	bx, word ptr [bp+arg_14]
		mov	al, es:[bx+1]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_25DB9
		add	sp, 6
		pop	bp
		retf
sub_25E21		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25E58		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_25E58		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25E5D		proc far
		push	bp
		mov	bp, sp
		mov	al, 8
		pop	bp
		retf
sub_25E5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25E64		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	word_77957, 0
		jnz	short loc_25E74
		jmp	loc_25F2B

loc_25E74:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_24068
		add	sp, 4
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2411B
		add	sp, 4
		push	large 780004h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_25EA8
		jmp	loc_25F54

loc_25EA8:
		cmp	byte_7CAF9, 0
		jz	short loc_25EBE
		cmp	byte_7CAFA, 0
		jz	short loc_25EBA
		mov	al, 14h

loc_25EB8:
		jmp	short loc_25ECB

loc_25EBA:
		mov	al, 11h
		jmp	short loc_25ECB

loc_25EBE:
		cmp	byte_7CAFA, 0
		jz	short loc_25EC9
		mov	al, 13h
		jmp	short loc_25EB8

loc_25EC9:
		mov	al, 10h

loc_25ECB:
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
		les	bx, es:[bx+20h]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+10h], eax
		mov	dword ptr es:[bx+0Ch], 0
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_25F58

loc_25F2B:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_25F5A
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_25F54
		cmp	[bp+var_4], 0
		jnz	short loc_25F58

loc_25F54:
		xor	dx, dx
		xor	ax, ax

loc_25F58:
		leave
		retf
sub_25E64		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_25F5A		proc far

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
		jnz	short loc_25F7E
		push	78h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_25F7E
		jmp	loc_260EA

loc_25F7E:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 32Ch
		mov	word ptr es:[bx], 11DDh
		mov	word ptr es:[bx], 11D5h
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+34h]
		mov	[bp+var_1], al
		mov	al, es:[bx+35h]
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_7CC68
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_3], al
		cmp	byte_7CAF9, 0
		jz	short loc_25FD0
		cmp	byte_7CAFA, 0
		jz	short loc_25FCC
		mov	al, 14h

loc_25FCA:
		jmp	short loc_25FDD

loc_25FCC:
		mov	al, 11h
		jmp	short loc_25FDD

loc_25FD0:
		cmp	byte_7CAFA, 0
		jz	short loc_25FDB
		mov	al, 13h
		jmp	short loc_25FCA

loc_25FDB:
		mov	al, 10h

loc_25FDD:
		mov	ah, 0
		mov	[bp+var_6], ax
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 24h
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
		mov	ax, 4
		mov	[di+14h], eax
		mov	ax, [bp+var_6]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_12]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 4
		push	es
		sub	edx, edx
		les	dx, [bp+var_A]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_2607B:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_260E3
		cmp	ax, 140h
		jge	short loc_260E3
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_260E3
		cmp	ax, 0C8h
		jge	short loc_260E3
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
		jnz	short loc_2607B
		pop	ds
		jmp	short loc_260EA

loc_260E3:
		pop	ds
		mov	word_77921, 1

loc_260EA:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_25F5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_260F4		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_260F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_260F9		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	large [bp+arg_0]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 34h
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_24FE3
		add	sp, 0Ah
		pop	bp
		retf
sub_260F9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26116		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_26116		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2611B		proc far
		push	bp
		mov	bp, sp
		mov	al, 9
		pop	bp
		retf
sub_2611B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_26122		proc far

var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		cmp	word_77957, 0
		jnz	short loc_26132
		jmp	loc_2620C

loc_26132:
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_23F2E
		add	sp, 6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2411B
		add	sp, 4
		push	large 780004h
		call	sub_6972
		add	sp, 4
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_26168
		jmp	loc_26235

loc_26168:
		cmp	byte_7CAFA, 0
		jz	short loc_26173
		mov	al, 15h
		jmp	short loc_26175

loc_26173:
		mov	al, 10h

loc_26175:
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
		les	bx, es:[bx+20h]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+var_4]
		mov	es:[bx+10h], eax
		push	large 0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+3Ah]
		mov	ah, 0
		push	ax
		push	64DEh
		call	Palette_ShadeTableFor_2DE20
		add	sp, 8
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		cmp	[bp+var_E], 0
		jz	short loc_26235
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
		jmp	short loc_26239

loc_2620C:
		mov	word_77921, 0
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_2623B
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	word_77921, 0
		jnz	short loc_26235
		cmp	[bp+var_4], 0
		jnz	short loc_26239

loc_26235:
		xor	dx, dx
		xor	ax, ax

loc_26239:
		leave
		retf
sub_26122		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2623B		proc far

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_2625F
		push	78h
		call	sub_293D4
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2625F
		jmp	loc_263C6

loc_2625F:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 338h
		mov	word ptr es:[bx], 32Ch
		mov	word ptr es:[bx], 11DDh
		mov	word ptr es:[bx], 11D1h
		push	large 0
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+3Ah]
		mov	ah, 0
		push	ax
		push	64DEh
		call	Palette_ShadeTableFor_2DE20
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_262A9
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+0Ch], 0
		jmp	short loc_262C3

loc_262A9:
		push	2
		push	large [bp+var_4]
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], eax

loc_262C3:
		cmp	byte_7CAFA, 0
		jz	short loc_262CE
		mov	al, 15h
		jmp	short loc_262D0

loc_262CE:
		mov	al, 10h

loc_262D0:
		mov	ah, 0
		mov	[bp+var_6], ax
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 24h
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
		mov	ax, 4
		mov	[di+14h], eax
		mov	ax, [bp+var_6]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_12]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 4
		push	es
		sub	edx, edx
		les	dx, [bp+var_A]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_2636E:
		sub	eax, eax
		mov	ax, es:[si+18h]
		or	ax, ax
		js	short loc_263BF
		cmp	ax, 140h
		jge	short loc_263BF
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		or	ax, ax
		js	short loc_263BF
		cmp	ax, 0C8h
		jge	short loc_263BF
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
		jnz	short loc_2636E
		pop	ds
		jmp	short loc_263C6

loc_263BF:
		pop	ds
		mov	word_77921, 1

loc_263C6:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2623B		endp
seg063		ends
