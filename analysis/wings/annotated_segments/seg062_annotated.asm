seg062		segment	para public 'CODE' use16
		assume cs:seg062
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0E9h, 47h, 0FCh

loc_2B433:
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B437		proc far

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
		mov	[bp+var_6], 583Ah
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

loc_2B465:
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
		jnz	short loc_2B465
		pop	di
		pop	si
		leave
		retf
sub_2B437		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B4BE		proc far

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
		mov	dword_5F566, eax
		movzx	eax, word ptr es:[bx+2]
		mov	dword_5F56A, eax
		mov	eax, dword_5F566
		shl	eax, 10h
		mov	dword_5F566, eax
		mov	eax, dword_5F56A
		shl	eax, 10h
		mov	dword_5F56A, eax
		movzx	eax, word ptr es:[bx+4]
		mov	dword_5F58A, eax
		movzx	eax, word ptr es:[bx+6]
		mov	dword_5F58E, eax
		mov	eax, dword_5F58A
		shl	eax, 10h
		mov	dword_5F58A, eax
		mov	eax, dword_5F58E
		shl	eax, 10h
		mov	dword_5F58E, eax
		movzx	eax, word ptr es:[bx+8]
		mov	dword_5F5AE, eax
		movzx	eax, word ptr es:[bx+0Ah]
		mov	dword_5F5B2, eax
		mov	eax, dword_5F5AE
		shl	eax, 10h
		mov	dword_5F5AE, eax
		mov	eax, dword_5F5B2
		shl	eax, 10h
		mov	dword_5F5B2, eax
		movzx	eax, word ptr es:[bx+0Ch]
		mov	dword_5F5D2, eax
		movzx	eax, word ptr es:[bx+0Eh]
		mov	dword_5F5D6, eax
		mov	eax, dword_5F5D2
		shl	eax, 10h
		mov	dword_5F5D2, eax
		mov	eax, dword_5F5D6
		shl	eax, 10h
		mov	dword_5F5D6, eax
		leave
		retf
sub_2B4BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B587		proc far

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
		jle	short loc_2B5C9
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax

loc_2B5C9:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_4]
		jle	short loc_2B5EB
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_8], eax

loc_2B5EB:
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_8]
		jle	short loc_2B601
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax

loc_2B601:
		leave
		retf
sub_2B587		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B603		proc far

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
		call	sub_49BA2
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
		call	sub_49BA2
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
		call	sub_49BA2
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
		call	sub_49BA2
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
sub_2B603		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Face_ComputeNormal_242FE (sub_242FE de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 22 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Face_ComputeNormal_2931E (sub_2931E de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, LUE 2026-10-16 (rendu des objets, OBJECT_RENDER.md).
; NORMALE DE FACE (ex-Mesh_ComputeEdgeVectors) : a = V0 − V2, b = V0 − V1 (sommets
; +19h/+1Dh/+21h), N = a × b (Vector_CrossProduct3D_550B7) normalisée → +1/+5/+9.
; ==============================================================================================
Face_ComputeNormal_2B6A1		proc far

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
		call	Vector_CrossProduct3D_39859
		add	sp, 8
		mov	eax, [bp+var_30]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_24]
		push	ax
		call	Vector_Normalize3D_3A15D
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
Face_ComputeNormal_2B6A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B79C		proc far

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
sub_2B79C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B881		proc far

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
		call	near ptr Face_ComputeNormal_2B6A1
		add	sp, 4
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2B79C
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
sub_2B881		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B99B		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2B99B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B9A0		proc far

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
sub_2B9A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2B9EF		proc far

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
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 44h
		push	si
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+12h]
		mov	dx, es:[bx+10h]
		add	dx, 1Ch
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_20], eax
		mov	eax, es:[si+4]
		mov	[bp+var_1C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_1C]
		mov	es, [bp+arg_2]
		mov	dx, es:[bx+16h]
		mov	bx, es:[bx+14h]
		add	bx, 1Ch
		mov	[bp+var_6], dx
		mov	[bp+var_8], bx
		les	si, [bp+var_8]
		mov	edx, es:[si]
		mov	[bp+var_2C], edx
		mov	edx, es:[si+4]
		mov	[bp+var_28], edx
		mov	edx, es:[si+8]
		mov	[bp+var_24], edx
		add	eax, [bp+var_28]
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+1Ah]
		mov	bx, es:[bx+18h]
		add	bx, 1Ch
		mov	[bp+var_A], dx
		mov	[bp+var_C], bx
		les	si, [bp+var_C]
		mov	edx, es:[si]
		mov	[bp+var_38], edx
		mov	edx, es:[si+4]
		mov	[bp+var_34], edx
		mov	edx, es:[si+8]
		mov	[bp+var_30], edx
		add	eax, [bp+var_34]
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+1Eh]
		mov	bx, es:[bx+1Ch]
		add	bx, 1Ch
		mov	[bp+var_E], dx
		mov	[bp+var_10], bx
		les	si, [bp+var_10]
		mov	edx, es:[si]
		mov	[bp+var_44], edx
		mov	edx, es:[si+4]
		mov	[bp+var_40], edx
		mov	edx, es:[si+8]
		mov	[bp+var_3C], edx
		add	eax, [bp+var_40]
		mov	[bp+var_14], eax
		sar	eax, 2
		mov	dword_60054, eax
		sar	eax, 8
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_2B9EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BAE2		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2BAE2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BAE7		proc far
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
sub_2BAE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BAEE		proc far

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
sub_2BAEE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BBBC		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_0], 0
		jnz	short loc_2BBDE
		push	78h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2BBDE
		jmp	loc_2BC75

loc_2BBDE:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 64Ch
		mov	eax, dword_60054
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+2], eax
		mov	dword ptr es:[bx+14h], 4
		xor	cx, cx
		jmp	short loc_2BC50

loc_2BC09:
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

loc_2BC50:
		cmp	cx, 4
		jl	short loc_2BC09
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], eax

loc_2BC75:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_2BBBC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BC7D		proc far

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
		call	near ptr sub_2B881
		add	sp, 18h
		les	bx, word ptr [bp+arg_14]
		mov	al, es:[bx+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+20h], al
		pop	bp
		retf
sub_2BC7D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BCAF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+20h]
		mov	es:[bx+21h], al
		pop	bp
		retf
sub_2BCAF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BCBF		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_2BCBF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BCC6		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_4], 0
		cmp	word_5C345, 0
		jz	short loc_2BD56
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+21h]
		mov	ah, 0
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_2B437
		add	sp, 6
		push	large 780004h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_2BD6B
		les	bx, word ptr [bp+var_8]
		mov	word ptr es:[bx+6], 0Ch
		mov	eax, dword_60054
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+2], eax
		mov	dword ptr es:[bx+10h], 1
		push	2
		mov	ax, word ptr [bp+var_8]
		add	ax, 18h
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		jmp	short loc_2BD6B

loc_2BD56:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_2BD73
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2BD6B:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_2BCC6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BD73		proc far

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
		jnz	short loc_2BD97
		push	78h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2BD97
		jmp	loc_2BE56

loc_2BD97:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 64Ch
		mov	word ptr es:[bx], 650h
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
		call	sub_42A76
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
		mov	ebx, dword_60054
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

loc_2BE2C:
		sub	eax, eax
		mov	ax, es:[si+18h]
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		mov	[di+4], eax
		mov	ax, [bp+var_2]
		shl	eax, 10h
		mov	[di+8], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_2BE2C
		pop	ds

loc_2BE56:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2BD73		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BE60		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2BE60		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BE65		proc far

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
		call	near ptr sub_2BC7D
		add	sp, 18h
		pop	bp
		retf
sub_2BE65		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BE89		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_2BE89		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BE90		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_4], 0
		cmp	word_5C345, 0
		jz	short loc_2BF20
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+21h]
		mov	ah, 0
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_2B437
		add	sp, 6
		push	large 780004h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_2BF35
		les	bx, word ptr [bp+var_8]
		mov	word ptr es:[bx+6], 0Dh
		mov	eax, dword_60054
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+2], eax
		mov	dword ptr es:[bx+10h], 1
		push	2
		mov	ax, word ptr [bp+var_8]
		add	ax, 18h
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		jmp	short loc_2BF35

loc_2BF20:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_2BF3D
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2BF35:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_2BE90		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2BF3D		proc far

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
		jnz	short loc_2BF61
		push	78h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2BF61
		jmp	loc_2C025

loc_2BF61:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 64Ch
		mov	word ptr es:[bx], 650h
		mov	word ptr es:[bx], 654h
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
		call	sub_42A76
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
		mov	ebx, dword_60054
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

loc_2BFFB:
		sub	eax, eax
		mov	ax, es:[si+18h]
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		mov	[di+4], eax
		mov	ax, [bp+var_2]
		shl	eax, 10h
		mov	[di+8], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_2BFFB
		pop	ds

loc_2C025:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2BF3D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C02F		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2C02F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C034		proc far

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
		call	near ptr sub_2B881
		add	sp, 18h
		les	bx, word ptr [bp+arg_14]
		mov	al, es:[bx+1]
		mov	ah, 0
		mov	si, ax
		or	si, si
		jge	short loc_2C06C
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_2C09A

loc_2C06C:
		cmp	byte_60160, 3
		jnz	short loc_2C08B
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_2C093

loc_2C08B:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_2C093:
		mov	bx, si
		shl	bx, 8
		add	ax, bx

loc_2C09A:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+22h], dx
		mov	es:[bx+20h], ax
		pop	si
		pop	bp
		retf
sub_2C034		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C0A8		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2C0A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C0AD		proc far
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
sub_2C0AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C0B4		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_4], 0
		cmp	word_5C345, 0
		jnz	short loc_2C0CC
		jmp	loc_2C15D

loc_2C0CC:
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2B437
		add	sp, 6
		push	large 780004h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_2C172
		les	bx, word ptr [bp+var_8]
		mov	word ptr es:[bx+6], 0Eh
		mov	eax, dword_60054
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_8]
		add	ax, 18h
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+8], eax
		mov	dword ptr es:[bx+10h], 1
		push	2
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+20h]
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		jmp	short loc_2C172

loc_2C15D:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_2C17A
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2C172:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_2C0B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C17A		proc far

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
		jnz	short loc_2C19E
		push	78h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2C19E
		jmp	loc_2C261

loc_2C19E:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 64Ch
		mov	word ptr es:[bx], 25DBh
		push	2
		les	bx, word ptr [bp+arg_4]
		push	large es:[bx+20h]
		call	sub_42A76
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
		call	sub_42A76
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
		mov	ebx, dword_60054
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

loc_2C242:
		sub	eax, eax
		mov	ax, es:[si+18h]
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		mov	[di+4], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_2C242
		pop	ds

loc_2C261:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2C17A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C26B		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2C26B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C270		proc far

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
		push	63DEh
		call	Table_LookupByRange_3513A
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_2C2B9
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_2C2C0

loc_2C2B9:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_2C2C0:
		cmp	dx, 0FFFFh
		jnz	short loc_2C2D6
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_4]
		mov	es:[bx+2], al
		and	byte ptr es:[bx+7], 0FBh
		jmp	short loc_2C2E2

loc_2C2D6:
		les	bx, [bp+arg_0]
		mov	es:[bx+2], dl
		or	byte ptr es:[bx+7], 4

loc_2C2E2:
		leave
		retf
sub_2C270		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C2E4		proc far

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
		jnz	short loc_2C31D
		jmp	loc_2C404

loc_2C31D:
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
		jge	short loc_2C379
		mov	al, 1
		jmp	short loc_2C37B

loc_2C379:
		mov	al, 0

loc_2C37B:
		mov	dl, al
		or	dl, dl
		jz	short loc_2C3D0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+7]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_2C3A0
		mov	al, es:[bx+7]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C3D0

loc_2C3A0:
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+7], 1
		or	byte ptr es:[bx+7], 2
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Utility_Helper_3A1D9
		pop	cx

loc_2C3B7:
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	si
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+6], al
		jmp	short loc_2C432

loc_2C3D0:
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C432
		les	bx, [bp+arg_0]
		mov	al, es:[bx+7]
		and	ax, 1
		or	al, al
		jnz	short loc_2C3F5
		mov	al, es:[bx+7]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C432

loc_2C3F5:
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+7], 0FEh
		or	byte ptr es:[bx+7], 2
		jmp	short loc_2C3B7

loc_2C404:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+7]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C432
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	si
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+6], al
		or	byte ptr es:[bx+7], 2

loc_2C432:
		pop	si
		leave
		retf
sub_2C2E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C435		proc far

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
		call	near ptr sub_2B881
		add	sp, 18h
		les	bx, word ptr [bp+arg_14]
		mov	al, es:[bx+1]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 20h
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_2C270
		add	sp, 6
		pop	bp
		retf
sub_2C435		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C472		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+27h], 0FDh
		pop	bp
		retf
sub_2C472		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C47F		proc far
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
sub_2C47F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C486		proc far

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
		call	near ptr sub_2C2E4
		add	sp, 0Ah
		pop	bp
		retf
sub_2C486		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C4A3		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		mov	[bp+var_4], 0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+27h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C509
		mov	eax, dword_60054
		sar	eax, 8
		push	eax
		mov	al, es:[bx+26h]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35A84
		add	sp, 8
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_2C4F6
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+22h]
		jmp	short loc_2C536

loc_2C4F6:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+22h]
		mov	ah, 0
		les	bx, word ptr [bp+var_8]
		add	bx, ax
		mov	al, es:[bx]
		jmp	short loc_2C536

loc_2C509:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+23h]
		mov	ah, 0
		push	ax
		mov	eax, dword_60054
		sar	eax, 8
		push	eax
		mov	al, es:[bx+26h]
		mov	ah, 0
		push	ax
		mov	al, es:[bx+22h]
		mov	ah, 0
		push	ax
		push	63DEh
		call	Palette_ShadeIndexWithFog_35C7C
		add	sp, 0Ch

loc_2C536:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+25h], al
		cmp	word_5C345, 0
		jz	short loc_2C5BF
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+25h]
		mov	ah, 0
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_2B437
		add	sp, 6
		push	large 780004h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_2C5D4
		les	bx, word ptr [bp+var_C]
		mov	word ptr es:[bx+6], 10h
		mov	dword ptr es:[bx+10h], 1
		mov	eax, dword_60054
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_C]
		add	ax, 18h
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_C]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		jmp	short loc_2C5D4

loc_2C5BF:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_2C5DC
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2C5D4:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_2C4A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C5DC		proc far

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
		jnz	short loc_2C600
		push	78h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2C600
		jmp	loc_2C6C9

loc_2C600:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 64Ch
		mov	word ptr es:[bx], 650h
		mov	word ptr es:[bx], 654h
		mov	word ptr es:[bx], 25D7h
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
		call	sub_42A76
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
		mov	ebx, dword_60054
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

loc_2C69F:
		sub	eax, eax
		mov	ax, es:[si+18h]
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		mov	[di+4], eax
		mov	ax, [bp+var_2]
		shl	eax, 10h
		mov	[di+8], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_2C69F
		pop	ds

loc_2C6C9:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2C5DC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C6D3		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2C6D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C6D8		proc far

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
		push	63DEh
		call	Table_LookupByRange_3513A
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_2C721
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_2C728

loc_2C721:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_2C728:
		cmp	dx, 0FFFFh
		jnz	short loc_2C737
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+20h], 0
		jmp	short loc_2C73E

loc_2C737:
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], dl

loc_2C73E:
		leave
		retf
sub_2C6D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C740		proc far

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
		call	near ptr sub_2B881
		add	sp, 18h
		les	bx, word ptr [bp+arg_14]
		mov	al, es:[bx+1]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2C6D8
		add	sp, 6
		pop	bp
		retf
sub_2C740		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C777		proc far

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
		jnz	short loc_2C7EE
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_2C7EE

loc_2C7EE:
		mov	[bp+var_8], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C85A
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_2C85A

loc_2C85A:
		mov	[bp+var_E], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C8C6
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_2C8C6

loc_2C8C6:
		mov	[bp+var_14], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ch]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2C932
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ch]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_2C932

loc_2C932:
		pop	di
		pop	si
		leave
		retf
sub_2C777		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C936		proc far
		push	bp
		mov	bp, sp
		mov	al, 5
		pop	bp
		retf
sub_2C936		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2C93D		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	[bp+var_4], 0
		cmp	word_5C345, 0
		jnz	short loc_2C957
		jmp	loc_2CA64

loc_2C957:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+20h]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_5], al
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+21h]
		mov	[bp+var_6], al
		mov	[bp+var_C], 583Ah
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 10h
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		les	si, [bp+var_A]
		mov	ax, es
		mov	fs, ax
		mov	dx, 4
		mov	di, [bp+var_C]
		mov	bx, si
		les	si, fs:[bx]

loc_2C99F:
		mov	ax, es:[si+18h]
		shl	eax, 10h
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		shl	eax, 10h
		mov	[di+4], eax
		sub	eax, eax
		mov	al, es:[si+28h]
		mul	[bp+var_6]
		add	ah, [bp+var_5]
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
		jnz	short loc_2C99F
		push	large 780004h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		cmp	[bp+var_10], 0
		jz	short loc_2CA79
		les	bx, word ptr [bp+var_10]
		mov	word ptr es:[bx+6], 11h
		mov	dword ptr es:[bx+10h], 1
		mov	eax, dword_60054
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_10]
		add	ax, 18h
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_10]
		mov	es:[bx+8], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		jmp	short loc_2CA79

loc_2CA64:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_2CA83
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2CA79:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	di
		pop	si
		leave
		retf
sub_2C93D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CA83		proc far

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_2CAA7
		push	78h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2CAA7
		jmp	loc_2CB8B

loc_2CAA7:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 64Ch
		mov	word ptr es:[bx], 25D3h
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+20h]
		mov	[bp+var_1], al
		mov	al, es:[bx+21h]
		mov	[bp+var_2], al
		mov	al, [bp+var_1]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_3], al
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+10h], 1
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
		call	sub_42A76
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
		mov	ebx, dword_60054
		push	ds
		lds	di, word ptr [bp+arg_0]
		sub	eax, eax
		mov	ax, 4
		mov	[di+14h], eax
		mov	ax, 11h
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_C]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 4

loc_2CB55:
		sub	eax, eax
		mov	ax, es:[si+18h]
		mov	[di], eax
		mov	ax, es:[si+1Ah]
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
		jnz	short loc_2CB55
		pop	ds

loc_2CB8B:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2CA83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CB95		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2CB95		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CB9A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+22h]
		mov	ax, es:[bx+20h]
		pop	bp
		retf
sub_2CB9A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CBAA		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+20h], eax
		pop	bp
		retf
sub_2CBAA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CBBB		proc far
		push	bp
		mov	bp, sp
		mov	al, 6
		pop	bp
		retf
sub_2CBBB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CBC2		proc far

var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		mov	[bp+var_4], 0
		cmp	word_5C345, 0
		jnz	short loc_2CBDA
		jmp	loc_2CCA9

loc_2CBDA:
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2B437
		add	sp, 6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2B4BE
		add	sp, 4
		push	large 780004h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_2CC10
		jmp	loc_2CCBE

loc_2CC10:
		les	bx, word ptr [bp+var_8]
		mov	word ptr es:[bx+6], 12h
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+10h], eax
		mov	eax, dword_60054
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_8]
		add	ax, 18h
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+8], eax
		mov	eax, dword_60054
		sar	eax, 8
		mov	[bp+var_14], eax
		push	eax
		push	63DEh
		call	Palette_FogTableIndex_35E32
		add	sp, 6
		push	ax
		push	63DEh
		call	sub_350A8
		add	sp, 4
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		push	2
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		jmp	short loc_2CCBE

loc_2CCA9:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_2CCC6
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2CCBE:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_2CBC2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CCC6		proc far

var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_2CCEA
		push	78h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2CCEA
		jmp	loc_2CE1B

loc_2CCEA:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 64Ch
		mov	word ptr es:[bx], 25CFh
		mov	eax, dword_60054
		sar	eax, 8
		mov	[bp+var_8], eax
		push	eax
		push	63DEh
		call	Palette_FogTableIndex_35E32
		add	sp, 6
		push	ax
		push	63DEh
		call	sub_350A8
		add	sp, 4
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	2
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], eax
		mov	[bp+var_A], 12h
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 24h
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		mov	eax, [bp+arg_4]
		mov	[bp+var_12], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 10h
		mov	[bp+var_14], ax
		mov	[bp+var_16], dx
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_42A76
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
		mov	ebx, dword_60054
		push	ds
		lds	di, word ptr [bp+arg_0]
		sub	eax, eax
		mov	ax, 4
		mov	[di+14h], eax
		mov	ax, [bp+var_A]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_16]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 4
		push	es
		sub	edx, edx
		les	dx, [bp+var_E]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_2CDDE:
		sub	eax, eax
		mov	ax, es:[si+18h]
		mov	[di], eax
		mov	ax, es:[si+1Ah]
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
		jnz	short loc_2CDDE
		pop	ds

loc_2CE1B:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2CCC6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CE25		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2CE25		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CE2A		proc far

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
		call	near ptr sub_2B881
		add	sp, 18h
		les	bx, word ptr [bp+arg_14]
		mov	al, es:[bx+1]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 34h
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_2C270
		add	sp, 6
		pop	bp
		retf
sub_2CE2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CE67		proc far

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
		call	near ptr sub_2C2E4
		add	sp, 0Ah
		pop	bp
		retf
sub_2CE67		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CE84		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+3Bh], 0FDh
		pop	bp
		retf
sub_2CE84		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CE91		proc far
		push	bp
		mov	bp, sp
		mov	al, 7
		pop	bp
		retf
sub_2CE91		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2CE98		proc far

var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		mov	[bp+var_4], 0
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+3Bh]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2CEFE
		mov	eax, dword_60054
		sar	eax, 8
		push	eax
		mov	al, es:[bx+3Ah]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35A84
		add	sp, 8
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_2CEEB
		les	bx, word ptr [bp+arg_0]
		mov	dl, es:[bx+36h]
		jmp	short loc_2CF2D

loc_2CEEB:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+36h]
		mov	ah, 0
		les	bx, word ptr [bp+var_8]
		add	bx, ax
		mov	dl, es:[bx]
		jmp	short loc_2CF2D

loc_2CEFE:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+37h]
		mov	ah, 0
		push	ax
		mov	eax, dword_60054
		sar	eax, 8
		push	eax
		mov	al, es:[bx+3Ah]
		mov	ah, 0
		push	ax
		mov	al, es:[bx+36h]
		mov	ah, 0
		push	ax
		push	63DEh
		call	Palette_ShadeIndexWithFog_35C7C
		add	sp, 0Ch
		mov	dl, al

loc_2CF2D:
		cmp	word_5C345, 0
		jnz	short loc_2CF37
		jmp	loc_2D009

loc_2CF37:
		mov	al, dl
		mov	ah, 0
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2B437
		add	sp, 6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2B4BE
		add	sp, 4
		push	large 780004h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_2CF70
		jmp	loc_2D01F

loc_2CF70:
		les	bx, word ptr [bp+var_C]
		mov	word ptr es:[bx+6], 13h
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+var_C]
		mov	es:[bx+10h], eax
		mov	eax, dword_60054
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_C]
		add	ax, 18h
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_C]
		mov	es:[bx+8], eax
		mov	eax, dword_60054
		sar	eax, 8
		mov	[bp+var_18], eax
		push	eax
		push	63DEh
		call	Palette_FogTableIndex_35E32
		add	sp, 6
		push	ax
		push	63DEh
		call	sub_350A8
		add	sp, 4
		mov	[bp+var_12], dx
		mov	[bp+var_14], ax
		push	2
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_C]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_4], eax
		jmp	short loc_2D01F

loc_2D009:
		push	dx
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_2D027
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2D01F:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_2CE98		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D027		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_2D04B
		push	78h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2D04B
		jmp	loc_2D194

loc_2D04B:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 64Ch
		mov	word ptr es:[bx], 25CFh
		mov	word ptr es:[bx], 25CBh
		mov	eax, dword_60054
		sar	eax, 8
		mov	[bp+var_8], eax
		push	eax
		push	63DEh
		call	Palette_FogTableIndex_35E32
		add	sp, 6
		push	ax
		push	63DEh
		call	sub_350A8
		add	sp, 4
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	2
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], eax
		mov	al, [bp+arg_8]
		mov	ah, 0
		mov	[bp+var_A], ax
		mov	[bp+var_C], 13h
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 24h
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		mov	eax, [bp+arg_4]
		mov	[bp+var_14], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 10h
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_42A76
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
		mov	ebx, dword_60054
		push	ds
		lds	di, word ptr [bp+arg_0]
		sub	eax, eax
		mov	ax, 4
		mov	[di+14h], eax
		mov	ax, [bp+var_C]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_18]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 4
		push	es
		sub	edx, edx
		les	dx, [bp+var_10]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_2D14C:
		sub	eax, eax
		mov	ax, es:[si+18h]
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		mov	[di+4], eax
		mov	ax, [bp+var_A]
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
		jnz	short loc_2D14C
		pop	ds

loc_2D194:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2D027		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D19E		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2D19E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D1A3		proc far

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
		push	63DEh
		call	Table_LookupByRange_3513A
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_2D1EC
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_2D1F3

loc_2D1EC:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_2D1F3:
		cmp	dx, 0FFFFh
		jnz	short loc_2D202
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+34h], 0
		jmp	short loc_2D209

loc_2D202:
		les	bx, [bp+arg_0]
		mov	es:[bx+34h], dl

loc_2D209:
		leave
		retf
sub_2D1A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D20B		proc far

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
		call	near ptr sub_2B881
		add	sp, 18h
		les	bx, word ptr [bp+arg_14]
		mov	al, es:[bx+1]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2D1A3
		add	sp, 6
		pop	bp
		retf
sub_2D20B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D242		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2D242		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D247		proc far
		push	bp
		mov	bp, sp
		mov	al, 8
		pop	bp
		retf
sub_2D247		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D24E		proc far

var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	[bp+var_4], 0
		cmp	word_5C345, 0
		jnz	short loc_2D268
		jmp	loc_2D3D1

loc_2D268:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+34h]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_5], al
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+35h]
		mov	[bp+var_6], al
		mov	[bp+var_C], 583Ah
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 10h
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		les	si, [bp+var_A]
		mov	ax, es
		mov	fs, ax
		mov	dx, 4
		mov	di, [bp+var_C]
		mov	bx, si
		les	si, fs:[bx]

loc_2D2B0:
		mov	ax, es:[si+18h]
		shl	eax, 10h
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		shl	eax, 10h
		mov	[di+4], eax
		sub	eax, eax
		mov	al, es:[si+28h]
		mul	[bp+var_6]
		add	ah, [bp+var_5]
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
		jnz	short loc_2D2B0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2B4BE
		add	sp, 4
		push	large 780004h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		cmp	[bp+var_10], 0
		jnz	short loc_2D338
		jmp	loc_2D3E6

loc_2D338:
		les	bx, word ptr [bp+var_10]
		mov	word ptr es:[bx+6], 14h
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+var_10]
		mov	es:[bx+10h], eax
		mov	eax, dword_60054
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_10]
		add	ax, 18h
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_10]
		mov	es:[bx+8], eax
		mov	eax, dword_60054
		sar	eax, 8
		mov	[bp+var_1C], eax
		push	eax
		push	63DEh
		call	Palette_FogTableIndex_35E32
		add	sp, 6
		push	ax
		push	63DEh
		call	sub_350A8
		add	sp, 4
		mov	[bp+var_16], dx
		mov	[bp+var_18], ax
		push	2
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_10]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_4], eax
		jmp	short loc_2D3E6

loc_2D3D1:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_2D3F0
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2D3E6:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	di
		pop	si
		leave
		retf
sub_2D24E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D3F0		proc far

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_2D414
		push	78h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2D414
		jmp	loc_2D586

loc_2D414:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 64Ch
		mov	word ptr es:[bx], 25CFh
		mov	word ptr es:[bx], 25C7h
		mov	eax, dword_60054
		sar	eax, 8
		mov	[bp+var_8], eax
		push	eax
		push	63DEh
		call	Palette_FogTableIndex_35E32
		add	sp, 6
		push	ax
		push	63DEh
		call	sub_350A8
		add	sp, 4
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	2
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], eax
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+34h]
		mov	[bp+var_9], al
		mov	al, es:[bx+35h]
		mov	[bp+var_A], al
		mov	al, [bp+var_9]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_B], al
		mov	[bp+var_E], 14h
		mov	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 24h
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		mov	eax, [bp+arg_4]
		mov	[bp+var_16], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 10h
		mov	[bp+var_18], ax
		mov	[bp+var_1A], dx
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_42A76
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
		mov	ebx, dword_60054
		push	ds
		lds	di, word ptr [bp+arg_0]
		sub	eax, eax
		mov	ax, 4
		mov	[di+14h], eax
		mov	ax, [bp+var_E]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_1A]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 4
		push	es
		sub	edx, edx
		les	dx, [bp+var_12]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_2D532:
		sub	eax, eax
		mov	ax, es:[si+18h]
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		mov	[di+4], eax
		sub	eax, eax
		mov	ah, es:[si+28h]
		mov	al, [bp+var_A]
		mul	ah
		add	ah, [bp+var_B]
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
		jnz	short loc_2D532
		pop	ds

loc_2D586:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2D3F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D590		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2D590		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D595		proc far

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
		call	near ptr sub_2C2E4
		add	sp, 0Ah
		pop	bp
		retf
sub_2D595		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D5B2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+3Bh], 0FDh
		pop	bp
		retf
sub_2D5B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D5BF		proc far
		push	bp
		mov	bp, sp
		mov	al, 9
		pop	bp
		retf
sub_2D5BF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D5C6		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		mov	[bp+var_4], 0
		cmp	word_5C345, 0
		jnz	short loc_2D5DE
		jmp	loc_2D6A7

loc_2D5DE:
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2B437
		add	sp, 6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2B4BE
		add	sp, 4
		push	large 780004h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_2D614
		jmp	loc_2D6BC

loc_2D614:
		les	bx, word ptr [bp+var_8]
		mov	word ptr es:[bx+6], 15h
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+10h], eax
		mov	eax, dword_60054
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_8]
		add	ax, 18h
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+8], eax
		mov	eax, dword_60054
		sar	eax, 8
		push	eax
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+3Ah]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35A84
		add	sp, 8
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		push	2
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		jmp	short loc_2D6BC

loc_2D6A7:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_2D6C4
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2D6BC:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_2D5C6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D6C4		proc far

var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		cmp	[bp+arg_0], 0
		jnz	short loc_2D6E8
		push	78h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2D6E8
		jmp	loc_2D81F

loc_2D6E8:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 64Ch
		mov	word ptr es:[bx], 25CFh
		mov	word ptr es:[bx], 25C3h
		mov	eax, dword_60054
		sar	eax, 8
		push	eax
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+3Ah]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35A84
		add	sp, 8
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		push	2
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], eax
		mov	[bp+var_6], 15h
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx+9]
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
		call	sub_42A76
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
		mov	ebx, dword_60054
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

loc_2D7DB:
		sub	eax, eax
		mov	ax, es:[si+18h]
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		mov	[di+4], eax
		sub	eax, eax
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
		jnz	short loc_2D7DB
		pop	ds

loc_2D81F:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2D6C4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D829		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2D829		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D82E		proc far

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
		push	63DEh
		call	Table_LookupByRange_3513A
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_2D877
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_2D87E

loc_2D877:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_2D87E:
		cmp	dx, 0FFFFh
		jnz	short loc_2D88D
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+34h], 0
		jmp	short loc_2D894

loc_2D88D:
		les	bx, [bp+arg_0]
		mov	es:[bx+34h], dl

loc_2D894:
		leave
		retf
sub_2D82E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D896		proc far

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
		call	near ptr sub_2B881
		add	sp, 18h
		les	bx, word ptr [bp+arg_14]
		mov	al, es:[bx+1]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2D82E
		add	sp, 6
		pop	bp
		retf
sub_2D896		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2D8CD		proc far

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
		jnz	short loc_2D944
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_2D944

loc_2D944:
		mov	[bp+var_8], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2D9B0
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_2D9B0

loc_2D9B0:
		mov	[bp+var_E], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2DA1C
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_2DA1C

loc_2DA1C:
		mov	[bp+var_14], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ch]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2DA88
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+1Ch]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_2DA88

loc_2DA88:
		pop	di
		pop	si
		leave
		retf
sub_2D8CD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DA8C		proc far

var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 40h
		push	si
		push	di
		mov	[bp+var_4], 0
		cmp	word_5C345, 0
		jnz	short loc_2DAA6
		jmp	loc_2DEDC

loc_2DAA6:
		mov	di, word_60150
		shl	di, 1
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_8], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 10h
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	bx, [bp+var_C]
		add	[bp+var_C], 4
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		mov	si, 583Ah
		les	bx, [bp+var_10]
		movsx	eax, word ptr es:[bx+18h]
		mov	[bp+var_14], eax
		shl	eax, 10h
		mov	[si], eax
		movsx	eax, word ptr es:[bx+1Ah]
		mov	[bp+var_14], eax
		shl	eax, 10h
		mov	[si+4], eax
		mov	ax, [bp+var_E]
		add	dx, 20h
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		sar	eax, 8
		push	eax
		les	bx, [bp+var_10]
		mov	al, es:[bx+28h]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35F8C
		add	sp, 8
		movsx	eax, ax
		mov	[bp+var_14], eax
		movsx	eax, word_60150
		add	[bp+var_14], eax
		movsx	eax, di
		cmp	eax, [bp+var_14]
		jnz	short loc_2DB57
		dec	[bp+var_14]

loc_2DB57:
		mov	eax, [bp+var_14]
		shl	eax, 10h
		mov	[si+8], eax
		les	bx, [bp+var_10]
		mov	eax, es:[bx+1Ch]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[si+18h], eax
		mov	eax, es:[bx+20h]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[si+1Ch], eax
		mov	eax, es:[bx+24h]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[si+20h], eax
		les	bx, [bp+var_C]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		add	[bp+var_C], 4
		add	si, 24h
		les	bx, [bp+var_10]
		movsx	eax, word ptr es:[bx+18h]
		mov	[bp+var_14], eax
		shl	eax, 10h
		mov	[si], eax
		movsx	eax, word ptr es:[bx+1Ah]
		mov	[bp+var_14], eax
		shl	eax, 10h
		mov	[si+4], eax
		mov	ax, [bp+var_E]
		add	dx, 20h
		mov	[bp+var_1E], ax
		mov	[bp+var_20], dx
		les	bx, [bp+var_20]
		mov	eax, es:[bx]
		mov	[bp+var_24], eax
		sar	eax, 8
		push	eax
		les	bx, [bp+var_10]
		mov	al, es:[bx+28h]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35F8C
		add	sp, 8
		movsx	eax, ax
		mov	[bp+var_14], eax
		movsx	eax, word_60150
		add	[bp+var_14], eax
		movsx	eax, di
		cmp	eax, [bp+var_14]
		jnz	short loc_2DC28
		dec	[bp+var_14]

loc_2DC28:
		mov	eax, [bp+var_14]
		shl	eax, 10h
		mov	[si+8], eax
		les	bx, [bp+var_10]
		mov	eax, es:[bx+1Ch]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[si+18h], eax
		mov	eax, es:[bx+20h]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[si+1Ch], eax
		mov	eax, es:[bx+24h]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[si+20h], eax
		les	bx, [bp+var_C]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		add	[bp+var_C], 4
		add	si, 24h
		les	bx, [bp+var_10]
		movsx	eax, word ptr es:[bx+18h]
		mov	[bp+var_14], eax
		shl	eax, 10h
		mov	[si], eax
		movsx	eax, word ptr es:[bx+1Ah]
		mov	[bp+var_14], eax
		shl	eax, 10h
		mov	[si+4], eax
		mov	ax, [bp+var_E]
		add	dx, 20h
		mov	[bp+var_26], ax
		mov	[bp+var_28], dx
		les	bx, [bp+var_28]
		mov	eax, es:[bx]
		mov	[bp+var_2C], eax
		sar	eax, 8
		push	eax
		les	bx, [bp+var_10]
		mov	al, es:[bx+28h]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35F8C
		add	sp, 8
		movsx	eax, ax
		mov	[bp+var_14], eax
		movsx	eax, word_60150
		add	[bp+var_14], eax
		movsx	eax, di
		cmp	eax, [bp+var_14]
		jnz	short loc_2DCF9
		dec	[bp+var_14]

loc_2DCF9:
		mov	eax, [bp+var_14]
		shl	eax, 10h
		mov	[si+8], eax
		les	bx, [bp+var_10]
		mov	eax, es:[bx+1Ch]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[si+18h], eax
		mov	eax, es:[bx+20h]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[si+1Ch], eax
		mov	eax, es:[bx+24h]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[si+20h], eax
		les	bx, [bp+var_C]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		add	si, 24h
		les	bx, [bp+var_10]
		movsx	eax, word ptr es:[bx+18h]
		mov	[bp+var_14], eax
		shl	eax, 10h
		mov	[si], eax
		movsx	eax, word ptr es:[bx+1Ah]
		mov	[bp+var_14], eax
		shl	eax, 10h
		mov	[si+4], eax
		mov	ax, [bp+var_E]
		add	dx, 20h
		mov	[bp+var_2E], ax
		mov	[bp+var_30], dx
		les	bx, [bp+var_30]
		mov	eax, es:[bx]
		mov	[bp+var_34], eax
		sar	eax, 8
		push	eax
		les	bx, [bp+var_10]
		mov	al, es:[bx+28h]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35F8C
		add	sp, 8
		movsx	eax, ax
		mov	[bp+var_14], eax
		movsx	eax, word_60150
		add	[bp+var_14], eax
		movsx	eax, di
		cmp	eax, [bp+var_14]
		jnz	short loc_2DDC6
		dec	[bp+var_14]

loc_2DDC6:
		mov	eax, [bp+var_14]
		shl	eax, 10h
		mov	[si+8], eax
		les	bx, [bp+var_10]
		mov	eax, es:[bx+1Ch]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[si+18h], eax
		mov	eax, es:[bx+20h]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[si+1Ch], eax
		mov	eax, es:[bx+24h]
		mov	[bp+var_14], eax
		shl	eax, 8
		mov	[si+20h], eax
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_38], eax
		sub	eax, [bp+var_8]
		add	dword_5F910, eax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_2B4BE
		add	sp, 4
		push	large 780004h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_3C+2], dx
		mov	word ptr [bp+var_3C], ax
		cmp	[bp+var_3C], 0
		jnz	short loc_2DE47
		jmp	loc_2DEF1

loc_2DE47:
		les	bx, word ptr [bp+var_3C]
		mov	word ptr es:[bx+6], 16h
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+var_3C]
		mov	es:[bx+10h], eax
		mov	eax, dword_60054
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_3C]
		add	ax, 18h
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_3C]
		mov	es:[bx+8], eax
		push	2
		cmp	byte_60160, 3
		jnz	short loc_2DEB4
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_2DEBC

loc_2DEB4:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_2DEBC:
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_3C]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_4], eax
		jmp	short loc_2DEF1

loc_2DEDC:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_2DF07
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_2DEF1:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	di
		pop	si
		leave
		retf
sub_2DA8C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DEFB		proc far
		push	bp
		mov	bp, sp
		mov	al, 0Ah
		pop	bp
		retf
sub_2DEFB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DF02		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_2DF02		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2DF07		proc far

var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= dword ptr -24h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= dword ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 40h
		push	si
		cmp	[bp+arg_0], 0
		jnz	short loc_2DF2A
		push	78h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_2DF2A
		jmp	loc_2E3A6

loc_2DF2A:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 64Ch
		mov	word ptr es:[bx], 25CFh
		mov	word ptr es:[bx], 25BFh
		mov	si, word_60150
		shl	si, 1
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 10h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		add	[bp+var_8], 4
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 18h
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	bx, [bp+var_C]
		movsx	eax, word ptr es:[bx+18h]
		les	bx, [bp+var_10]
		mov	es:[bx], eax
		les	bx, [bp+var_C]
		movsx	eax, word ptr es:[bx+1Ah]
		les	bx, [bp+var_10]
		mov	es:[bx+4], eax
		mov	ax, [bp+var_A]
		mov	dx, [bp+var_C]
		add	dx, 20h
		mov	[bp+var_16], ax
		mov	[bp+var_18], dx
		les	bx, [bp+var_18]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		sar	eax, 8
		push	eax
		les	bx, [bp+var_C]
		mov	al, es:[bx+28h]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35F8C
		add	sp, 8
		movsx	eax, ax
		mov	[bp+var_14], eax
		movsx	eax, word_60150
		add	[bp+var_14], eax
		movsx	eax, si
		cmp	eax, [bp+var_14]
		jnz	short loc_2DFFC
		dec	[bp+var_14]

loc_2DFFC:
		mov	eax, [bp+var_14]
		shl	eax, 10h
		les	bx, [bp+var_10]
		mov	es:[bx+8], eax
		les	bx, [bp+var_8]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		add	[bp+var_8], 4
		add	[bp+var_10], 18h
		les	bx, [bp+var_C]
		movsx	eax, word ptr es:[bx+18h]
		les	bx, [bp+var_10]
		mov	es:[bx], eax
		les	bx, [bp+var_C]
		movsx	eax, word ptr es:[bx+1Ah]
		les	bx, [bp+var_10]
		mov	es:[bx+4], eax
		mov	ax, [bp+var_A]
		add	dx, 20h
		mov	[bp+var_1E], ax
		mov	[bp+var_20], dx
		les	bx, [bp+var_20]
		mov	eax, es:[bx]
		mov	[bp+var_24], eax
		sar	eax, 8
		push	eax
		les	bx, [bp+var_C]
		mov	al, es:[bx+28h]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35F8C
		add	sp, 8
		movsx	eax, ax
		mov	[bp+var_14], eax
		movsx	eax, word_60150
		add	[bp+var_14], eax
		movsx	eax, si
		cmp	eax, [bp+var_14]
		jnz	short loc_2E097
		dec	[bp+var_14]

loc_2E097:
		mov	eax, [bp+var_14]
		shl	eax, 10h
		les	bx, [bp+var_10]
		mov	es:[bx+8], eax
		les	bx, [bp+var_8]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		add	[bp+var_8], 4
		add	[bp+var_10], 18h
		les	bx, [bp+var_C]
		movsx	eax, word ptr es:[bx+18h]
		les	bx, [bp+var_10]
		mov	es:[bx], eax
		les	bx, [bp+var_C]
		movsx	eax, word ptr es:[bx+1Ah]
		les	bx, [bp+var_10]
		mov	es:[bx+4], eax
		mov	ax, [bp+var_A]
		add	dx, 20h
		mov	[bp+var_26], ax
		mov	[bp+var_28], dx
		les	bx, [bp+var_28]
		mov	eax, es:[bx]
		mov	[bp+var_2C], eax
		sar	eax, 8
		push	eax
		les	bx, [bp+var_C]
		mov	al, es:[bx+28h]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35F8C
		add	sp, 8
		movsx	eax, ax
		mov	[bp+var_14], eax
		movsx	eax, word_60150
		add	[bp+var_14], eax
		movsx	eax, si
		cmp	eax, [bp+var_14]
		jnz	short loc_2E132
		dec	[bp+var_14]

loc_2E132:
		mov	eax, [bp+var_14]
		shl	eax, 10h
		les	bx, [bp+var_10]
		mov	es:[bx+8], eax
		les	bx, [bp+var_8]
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		add	[bp+var_10], 18h
		les	bx, [bp+var_C]
		movsx	eax, word ptr es:[bx+18h]
		les	bx, [bp+var_10]
		mov	es:[bx], eax
		les	bx, [bp+var_C]
		movsx	eax, word ptr es:[bx+1Ah]
		les	bx, [bp+var_10]
		mov	es:[bx+4], eax
		mov	ax, [bp+var_A]
		add	dx, 20h
		mov	[bp+var_2E], ax
		mov	[bp+var_30], dx
		les	bx, [bp+var_30]
		mov	eax, es:[bx]
		mov	[bp+var_34], eax
		sar	eax, 8
		push	eax
		les	bx, [bp+var_C]
		mov	al, es:[bx+28h]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35F8C
		add	sp, 8
		movsx	eax, ax
		mov	[bp+var_14], eax
		movsx	eax, word_60150
		add	[bp+var_14], eax
		movsx	eax, si
		cmp	eax, [bp+var_14]
		jnz	short loc_2E1C9
		dec	[bp+var_14]

loc_2E1C9:
		mov	eax, [bp+var_14]
		shl	eax, 10h
		les	bx, [bp+var_10]
		mov	es:[bx+8], eax
		mov	ax, [bp+arg_6]
		mov	dx, [bp+arg_4]
		add	dx, 24h
		mov	[bp+var_36], ax
		mov	[bp+var_38], dx
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 18h
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	bx, [bp+var_38]
		movzx	eax, word ptr es:[bx]
		les	bx, [bp+var_10]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+var_38]
		movzx	eax, word ptr es:[bx+2]
		les	bx, [bp+var_10]
		mov	es:[bx+10h], eax
		mov	eax, es:[bx+0Ch]
		shl	eax, 10h
		mov	es:[bx+0Ch], eax
		mov	eax, es:[bx+10h]
		shl	eax, 10h
		mov	es:[bx+10h], eax
		add	[bp+var_10], 18h
		les	bx, [bp+var_38]
		movzx	eax, word ptr es:[bx+4]
		les	bx, [bp+var_10]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+var_38]
		movzx	eax, word ptr es:[bx+6]
		les	bx, [bp+var_10]
		mov	es:[bx+10h], eax
		mov	eax, es:[bx+0Ch]
		shl	eax, 10h
		mov	es:[bx+0Ch], eax
		mov	eax, es:[bx+10h]
		shl	eax, 10h
		mov	es:[bx+10h], eax
		add	[bp+var_10], 18h
		les	bx, [bp+var_38]
		movzx	eax, word ptr es:[bx+8]
		les	bx, [bp+var_10]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+var_38]
		movzx	eax, word ptr es:[bx+0Ah]
		les	bx, [bp+var_10]
		mov	es:[bx+10h], eax
		mov	eax, es:[bx+0Ch]
		shl	eax, 10h
		mov	es:[bx+0Ch], eax
		mov	eax, es:[bx+10h]
		shl	eax, 10h
		mov	es:[bx+10h], eax
		add	[bp+var_10], 18h
		les	bx, [bp+var_38]
		movzx	eax, word ptr es:[bx+0Ch]
		les	bx, [bp+var_10]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+var_38]
		movzx	eax, word ptr es:[bx+0Eh]
		les	bx, [bp+var_10]
		mov	es:[bx+10h], eax
		mov	eax, es:[bx+0Ch]
		shl	eax, 10h
		mov	es:[bx+0Ch], eax
		mov	eax, es:[bx+10h]
		shl	eax, 10h
		mov	es:[bx+10h], eax
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_3C], eax
		sub	eax, [bp+var_4]
		add	dword_5F910, eax
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+6], 16h
		les	bx, [bp+arg_4]
		les	bx, es:[bx+20h]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	dword ptr es:[bx+14h], 4
		mov	eax, dword_60054
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 18h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8], eax
		push	2
		cmp	byte_60160, 3
		jnz	short loc_2E388
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_2E390

loc_2E388:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_2E390:
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+0Ch], eax

loc_2E3A6:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_2DF07		endp

; ----------------------------------------------------------------------

sub_2E3AF		proc far
		push	bp
sub_2E3AF		endp
seg062		ends
