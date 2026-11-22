seg070		segment	para public 'CODE' use16
		assume cs:seg070
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_305A0		proc far

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
		jle	short loc_305E2
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_C], eax

loc_305E2:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+var_4]
		jle	short loc_30604
		mov	eax, [bp+var_4]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_8], eax

loc_30604:
		mov	eax, [bp+var_C]
		cmp	eax, [bp+var_8]
		jle	short loc_3061A
		mov	eax, [bp+var_8]
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax

loc_3061A:
		leave
		retf
sub_305A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3061C		proc far

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
		mov	dx, 3
		mov	di, [bp+var_6]
		mov	bx, si
		les	si, fs:[bx]

loc_3064A:
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
		jnz	short loc_3064A
		pop	di
		pop	si
		leave
		retf
sub_3061C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_306A3		proc far

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
		leave
		retf
sub_306A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30740		proc far

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
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		les	bx, [bp+arg_2]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	si
		call	sub_49BA2
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
sub_30740		endp

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
Face_ComputeNormal_307B6		proc far

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
Face_ComputeNormal_307B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_308B1		proc far

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
sub_308B1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30973		proc far

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
		call	near ptr Face_ComputeNormal_307B6
		add	sp, 4
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_308B1
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
sub_30973		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30A4E		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_30A4E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30A53		proc far

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
sub_30A53		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30A8F		proc far

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
		sub	sp, 34h
		push	si
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+12h]
		mov	dx, es:[bx+10h]
		add	dx, 1Ch
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_1C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_18], eax
		mov	eax, es:[si+8]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_18]
		mov	es, [bp+arg_2]
		mov	dx, es:[bx+16h]
		mov	bx, es:[bx+14h]
		add	bx, 1Ch
		mov	[bp+var_6], dx
		mov	[bp+var_8], bx
		les	si, [bp+var_8]
		mov	edx, es:[si]
		mov	[bp+var_28], edx
		mov	edx, es:[si+4]
		mov	[bp+var_24], edx
		mov	edx, es:[si+8]
		mov	[bp+var_20], edx
		add	eax, [bp+var_24]
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+1Ah]
		mov	bx, es:[bx+18h]
		add	bx, 1Ch
		mov	[bp+var_A], dx
		mov	[bp+var_C], bx
		les	si, [bp+var_C]
		mov	edx, es:[si]
		mov	[bp+var_34], edx
		mov	edx, es:[si+4]
		mov	[bp+var_30], edx
		mov	edx, es:[si+8]
		mov	[bp+var_2C], edx
		add	eax, [bp+var_30]
		mov	[bp+var_10], eax
		sar	eax, 2
		mov	edx, [bp+var_10]
		sar	edx, 3
		add	eax, edx
		mov	edx, [bp+var_10]
		sar	edx, 4
		sub	eax, edx
		mov	dword_60054, eax
		sar	eax, 8
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_30A8F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30B63		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_30B63		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30B68		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_30B68		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30B6F		proc far

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
sub_30B6F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30C0C		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_0], 0
		jnz	short loc_30C2E
		push	60h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_30C2E
		jmp	loc_30CC5

loc_30C2E:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 65Ch
		mov	eax, dword_60054
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	es:[bx+2], eax
		mov	dword ptr es:[bx+14h], 3
		xor	cx, cx
		jmp	short loc_30CA0

loc_30C59:
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

loc_30CA0:
		cmp	cx, 3
		jl	short loc_30C59
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

loc_30CC5:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
sub_30C0C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à FaceType0_Setup_26BF5
; (sub_26BF5 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à FaceType0_Setup_29732
; (sub_29732 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, LUE 2026-10-16 (rendu des objets, OBJECT_RENDER.md). Préparation des faces de
; type 0, 1 et 5 : Face_SetupGeometry_294C0 puis couleur (octet 4) → +26h. Ex-
; Mesh_FaceSetupSolidColor.
; ==============================================================================================
FaceType0_Setup_30CCD		proc far

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
		call	near ptr sub_30973
		add	sp, 14h
		les	bx, word ptr [bp+arg_10]
		mov	al, es:[bx+1]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Ch], al
		pop	bp
		retf
FaceType0_Setup_30CCD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30CFB		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_30CFB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30D00		proc far
		push	bp
		mov	bp, sp
		mov	al, 0
		pop	bp
		retf
sub_30D00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30D07		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_4], 0
		cmp	word_5C345, 0
		jz	short loc_30D97
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_3061C
		add	sp, 6
		push	large 600003h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_30DAC
		les	bx, word ptr [bp+var_8]
		mov	dword ptr es:[bx+10h], 1
		mov	word ptr es:[bx+6], 1
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
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		jmp	short loc_30DAC

loc_30D97:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_30DB4
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_30DAC:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_30D07		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30DB4		proc far

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
		jnz	short loc_30DD8
		push	60h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_30DD8
		jmp	loc_30E97

loc_30DD8:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 65Ch
		mov	word ptr es:[bx], 660h
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

loc_30E6D:
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
		jnz	short loc_30E6D
		pop	ds

loc_30E97:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_30DB4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30EA1		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_30EA1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à FaceType1_Setup_26DF3
; (sub_26DF3 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; FaceType1_Setup_29837 (sub_29837 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, LUE 2026-10-16 (rendu des objets, OBJECT_RENDER.md).
; Préparation des faces de types 1 et 5 (et tout type hors 0..9) : appelle
; FaceType0_Setup_29732. Ex-Mesh_FaceSetupSolidColorWrap.
; ==============================================================================================
FaceType1_Setup_30EA6		proc far

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
		call	near ptr FaceType0_Setup_30CCD
		add	sp, 14h
		pop	bp
		retf
FaceType1_Setup_30EA6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30EC6		proc far
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
sub_30EC6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30ECD		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_4], 0
		cmp	word_5C345, 0
		jz	short loc_30F5D
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_3061C
		add	sp, 6
		push	large 600003h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_30F72
		les	bx, word ptr [bp+var_8]
		mov	word ptr es:[bx+6], 2
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
		jmp	short loc_30F72

loc_30F5D:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_30F7A
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_30F72:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_30ECD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30F7A		proc far

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
		jnz	short loc_30F9E
		push	60h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_30F9E
		jmp	loc_31062

loc_30F9E:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 65Ch
		mov	word ptr es:[bx], 660h
		mov	word ptr es:[bx], 664h
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

loc_31038:
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
		jnz	short loc_31038
		pop	ds

loc_31062:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_30F7A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3106C		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3106C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31071		proc far

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
		call	near ptr sub_30973
		add	sp, 14h
		les	bx, word ptr [bp+arg_10]
		mov	al, es:[bx+1]
		cbw
		mov	si, ax
		or	si, si
		jge	short loc_310A4
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_310D2

loc_310A4:
		cmp	byte_60160, 3
		jnz	short loc_310C3
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_310CB

loc_310C3:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_310CB:
		mov	bx, si
		shl	bx, 8
		add	ax, bx

loc_310D2:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+1Eh], dx
		mov	es:[bx+1Ch], ax
		pop	si
		pop	bp
		retf
sub_31071		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_310E0		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_310E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_310E5		proc far
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
sub_310E5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_310EC		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	[bp+var_4], 0
		cmp	word_5C345, 0
		jnz	short loc_31104
		jmp	loc_31195

loc_31104:
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_3061C
		add	sp, 6
		push	large 600003h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jz	short loc_311AA
		les	bx, word ptr [bp+var_8]
		mov	word ptr es:[bx+6], 3
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
		push	2
		les	bx, word ptr [bp+arg_0]
		push	large es:[bx+1Ch]
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_8]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		jmp	short loc_311AA

loc_31195:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_311B2
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_311AA:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_310EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_311B2		proc far

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
		jnz	short loc_311D6
		push	60h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_311D6
		jmp	loc_31299

loc_311D6:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 65Ch
		mov	word ptr es:[bx], 2655h
		push	2
		les	bx, word ptr [bp+arg_4]
		push	large es:[bx+1Ch]
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

loc_3127A:
		sub	eax, eax
		mov	ax, es:[si+18h]
		mov	[di], eax
		mov	ax, es:[si+1Ah]
		mov	[di+4], eax
		add	di, 18h
		add	bx, 4
		mov	si, es:[bx]
		dec	cx
		jnz	short loc_3127A
		pop	ds

loc_31299:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_311B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_312A3		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_312A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_312A8		proc far

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
		jz	short loc_312F1
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_312F8

loc_312F1:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_312F8:
		cmp	dx, 0FFFFh
		jnz	short loc_3130E
		les	bx, [bp+arg_0]
		mov	al, [bp+arg_4]
		mov	es:[bx+2], al
		and	byte ptr es:[bx+6], 0FBh
		jmp	short loc_3131A

loc_3130E:
		les	bx, [bp+arg_0]
		mov	es:[bx+2], dl
		or	byte ptr es:[bx+6], 4

loc_3131A:
		leave
		retf
sub_312A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3131C		proc far

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
		jnz	short loc_31355
		jmp	loc_3143C

loc_31355:
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
		jge	short loc_313B1
		mov	al, 1
		jmp	short loc_313B3

loc_313B1:
		mov	al, 0

loc_313B3:
		mov	dl, al
		or	dl, dl
		jz	short loc_31408
		les	bx, [bp+arg_0]
		mov	al, es:[bx+6]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_313D8
		mov	al, es:[bx+6]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_31408

loc_313D8:
		les	bx, [bp+arg_0]
		or	byte ptr es:[bx+6], 1
		or	byte ptr es:[bx+6], 2
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Utility_Helper_3A1D9
		pop	cx

loc_313EF:
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	si
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], al
		jmp	short loc_3146A

loc_31408:
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3146A
		les	bx, [bp+arg_0]
		mov	al, es:[bx+6]
		and	ax, 1
		or	al, al
		jnz	short loc_3142D
		mov	al, es:[bx+6]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3146A

loc_3142D:
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+6], 0FEh
		or	byte ptr es:[bx+6], 2
		jmp	short loc_313EF

loc_3143C:
		les	bx, [bp+arg_0]
		mov	al, es:[bx+6]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3146A
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	si
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+4], al
		or	byte ptr es:[bx+6], 2

loc_3146A:
		pop	si
		leave
		retf
sub_3131C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3146D		proc far

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
		call	near ptr sub_30973
		add	sp, 14h
		les	bx, word ptr [bp+arg_10]
		mov	al, es:[bx+1]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Ch
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_312A8
		add	sp, 6
		pop	bp
		retf
sub_3146D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_314A6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+22h], 0FDh
		pop	bp
		retf
sub_314A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_314B3		proc far
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
sub_314B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_314BA		proc far

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
		call	near ptr sub_3131C
		add	sp, 0Ah
		pop	bp
		retf
sub_314BA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_314D7		proc far

var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+22h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_31535
		mov	eax, dword_60054
		sar	eax, 8
		push	eax
		mov	al, es:[bx+20h]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35A84
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jnz	short loc_31522
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+1Eh]
		jmp	short loc_31562

loc_31522:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		les	bx, word ptr [bp+var_4]
		add	bx, ax
		mov	al, es:[bx]
		jmp	short loc_31562

loc_31535:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+1Fh]
		mov	ah, 0
		push	ax
		mov	eax, dword_60054
		sar	eax, 8
		push	eax
		mov	al, es:[bx+20h]
		mov	ah, 0
		push	ax
		mov	al, es:[bx+1Eh]
		mov	ah, 0
		push	ax
		push	63DEh
		call	Palette_ShadeIndexWithFog_35C7C
		add	sp, 0Ch

loc_31562:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+21h], al
		mov	[bp+var_8], 0
		cmp	word_5C345, 0
		jz	short loc_315F3
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+21h]
		mov	ah, 0
		push	ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_3061C
		add	sp, 6
		push	large 600003h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jz	short loc_31608
		les	bx, word ptr [bp+var_C]
		mov	dword ptr es:[bx+10h], 1
		mov	word ptr es:[bx+6], 5
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
		mov	[bp+var_8], eax
		jmp	short loc_31608

loc_315F3:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_31610
		add	sp, 8
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax

loc_31608:
		mov	dx, word ptr [bp+var_8+2]
		mov	ax, word ptr [bp+var_8]
		leave
		retf
sub_314D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31610		proc far

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
		jnz	short loc_31634
		push	60h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_31634
		jmp	loc_316FD

loc_31634:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 65Ch
		mov	word ptr es:[bx], 660h
		mov	word ptr es:[bx], 664h
		mov	word ptr es:[bx], 2651h
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

loc_316D3:
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
		jnz	short loc_316D3
		pop	ds

loc_316FD:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_31610		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31707		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_31707		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3170C		proc far

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
		push	63DEh
		call	Table_LookupByRange_3513A
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_31755
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_3175C

loc_31755:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_3175C:
		cmp	dx, 0FFFFh
		jnz	short loc_3176B
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+1Ch], 0
		jmp	short loc_31772

loc_3176B:
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ch], dl

loc_31772:
		leave
		retf
sub_3170C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31774		proc far

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
		call	near ptr sub_30973
		add	sp, 14h
		les	bx, word ptr [bp+arg_10]
		mov	al, es:[bx+1]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_3170C
		add	sp, 6
		pop	bp
		retf
sub_31774		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_317A7		proc far

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
		jnz	short loc_3181E
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_3181E

loc_3181E:
		mov	[bp+var_8], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3188A
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_3188A

loc_3188A:
		mov	[bp+var_E], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_318F6
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_318F6

loc_318F6:
		pop	di
		pop	si
		leave
		retf
sub_317A7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_318FA		proc far
		push	bp
		mov	bp, sp
		mov	al, 5
		pop	bp
		retf
sub_318FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31901		proc far

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
		jnz	short loc_3191B
		jmp	loc_31A28

loc_3191B:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_5], al
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+1Dh]
		mov	[bp+var_6], al
		mov	[bp+var_8], 583Ah
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 10h
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		les	si, [bp+var_C]
		mov	ax, es
		mov	fs, ax
		mov	dx, 3
		mov	di, [bp+var_8]
		mov	bx, si
		les	si, fs:[bx]

loc_31963:
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
		jnz	short loc_31963
		push	large 600003h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		cmp	[bp+var_10], 0
		jz	short loc_31A3D
		les	bx, word ptr [bp+var_10]
		mov	dword ptr es:[bx+10h], 1
		mov	word ptr es:[bx+6], 6
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
		jmp	short loc_31A3D

loc_31A28:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_31A47
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_31A3D:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	di
		pop	si
		leave
		retf
sub_31901		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31A47		proc far

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
		jnz	short loc_31A6B
		push	60h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_31A6B
		jmp	loc_31B4F

loc_31A6B:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 65Ch
		mov	word ptr es:[bx], 264Dh
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+1Ch]
		mov	[bp+var_1], al
		mov	al, es:[bx+1Dh]
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
		mov	ax, 3
		mov	[di+14h], eax
		mov	ax, 6
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_C]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 3

loc_31B19:
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
		jnz	short loc_31B19
		pop	ds

loc_31B4F:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_31A47		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31B59		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_31B59		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31B5E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+1Eh]
		mov	ax, es:[bx+1Ch]
		pop	bp
		retf
sub_31B5E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31B6E		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+1Ch], eax
		pop	bp
		retf
sub_31B6E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31B7F		proc far
		push	bp
		mov	bp, sp
		mov	al, 6
		pop	bp
		retf
sub_31B7F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31B86		proc far

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
		jnz	short loc_31B9E
		jmp	loc_31C6D

loc_31B9E:
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_3061C
		add	sp, 6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_306A3
		add	sp, 4
		push	large 600003h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_31BD4
		jmp	loc_31C82

loc_31BD4:
		les	bx, word ptr [bp+var_8]
		mov	word ptr es:[bx+6], 7
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+1Ch]
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
		jmp	short loc_31C82

loc_31C6D:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_31C8A
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_31C82:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_31B86		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31C8A		proc far

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
		jnz	short loc_31CAE
		push	60h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_31CAE
		jmp	loc_31DDF

loc_31CAE:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 65Ch
		mov	word ptr es:[bx], 2649h
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
		mov	[bp+var_A], 7
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 20h
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
		mov	ax, 3
		mov	[di+14h], eax
		mov	ax, [bp+var_A]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_16]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 3
		push	es
		sub	edx, edx
		les	dx, [bp+var_E]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_31DA2:
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
		jnz	short loc_31DA2
		pop	ds

loc_31DDF:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_31C8A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31DE9		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_31DE9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31DEE		proc far

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
		call	near ptr sub_30973
		add	sp, 14h
		les	bx, word ptr [bp+arg_10]
		mov	al, es:[bx+1]
		push	ax
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2Ch
		push	word ptr [bp+arg_0+2]
		push	ax
		push	cs
		call	near ptr sub_312A8
		add	sp, 6
		pop	bp
		retf
sub_31DEE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31E27		proc far

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
		call	near ptr sub_3131C
		add	sp, 0Ah
		pop	bp
		retf
sub_31E27		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31E44		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+32h], 0FDh
		pop	bp
		retf
sub_31E44		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31E51		proc far
		push	bp
		mov	bp, sp
		mov	al, 7
		pop	bp
		retf
sub_31E51		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31E58		proc far

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
		mov	al, es:[bx+32h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_31EBE
		mov	eax, dword_60054
		sar	eax, 8
		push	eax
		mov	al, es:[bx+30h]
		mov	ah, 0
		push	ax
		push	63DEh
		call	sub_35A84
		add	sp, 8
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_31EAB
		les	bx, word ptr [bp+arg_0]
		mov	dl, es:[bx+2Eh]
		jmp	short loc_31EED

loc_31EAB:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+2Eh]
		mov	ah, 0
		les	bx, word ptr [bp+var_8]
		add	bx, ax
		mov	dl, es:[bx]
		jmp	short loc_31EED

loc_31EBE:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+2Fh]
		mov	ah, 0
		push	ax
		mov	eax, dword_60054
		sar	eax, 8
		push	eax
		mov	al, es:[bx+30h]
		mov	ah, 0
		push	ax
		mov	al, es:[bx+2Eh]
		mov	ah, 0
		push	ax
		push	63DEh
		call	Palette_ShadeIndexWithFog_35C7C
		add	sp, 0Ch
		mov	dl, al

loc_31EED:
		cmp	word_5C345, 0
		jnz	short loc_31EF7
		jmp	loc_31FC9

loc_31EF7:
		mov	al, dl
		mov	ah, 0
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_3061C
		add	sp, 6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_306A3
		add	sp, 4
		push	large 600003h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		cmp	[bp+var_C], 0
		jnz	short loc_31F30
		jmp	loc_31FDF

loc_31F30:
		les	bx, word ptr [bp+var_C]
		mov	word ptr es:[bx+6], 8
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+1Ch]
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
		jmp	short loc_31FDF

loc_31FC9:
		push	dx
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_31FE7
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_31FDF:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_31E58		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31FE7		proc far

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
		jnz	short loc_3200B
		push	60h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_3200B
		jmp	loc_32154

loc_3200B:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 65Ch
		mov	word ptr es:[bx], 2649h
		mov	word ptr es:[bx], 2645h
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
		mov	[bp+var_C], 8
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 20h
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
		mov	ax, 3
		mov	[di+14h], eax
		mov	ax, [bp+var_C]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_18]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 3
		push	es
		sub	edx, edx
		les	dx, [bp+var_10]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_3210C:
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
		jnz	short loc_3210C
		pop	ds

loc_32154:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_31FE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3215E		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3215E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32163		proc far

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
		push	63DEh
		call	Table_LookupByRange_3513A
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_321AC
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_321B3

loc_321AC:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_321B3:
		cmp	dx, 0FFFFh
		jnz	short loc_321C2
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+2Ch], 0
		jmp	short loc_321C9

loc_321C2:
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ch], dl

loc_321C9:
		leave
		retf
sub_32163		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_321CB		proc far

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
		call	near ptr sub_30973
		add	sp, 14h
		les	bx, word ptr [bp+arg_10]
		mov	al, es:[bx+1]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_32163
		add	sp, 6
		pop	bp
		retf
sub_321CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_321FE		proc far

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
		jnz	short loc_32275
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_32275

loc_32275:
		mov	[bp+var_8], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_322E1
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_322E1

loc_322E1:
		mov	[bp+var_E], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3234D
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_3234D

loc_3234D:
		pop	di
		pop	si
		leave
		retf
sub_321FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32351		proc far
		push	bp
		mov	bp, sp
		mov	al, 8
		pop	bp
		retf
sub_32351		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32358		proc far

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
		jnz	short loc_32372
		jmp	loc_324DB

loc_32372:
		les	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+2Ch]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_5], al
		mov	bx, word ptr [bp+arg_0]
		mov	al, es:[bx+2Dh]
		mov	[bp+var_6], al
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 10h
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		mov	[bp+var_C], 583Ah
		les	si, [bp+var_A]
		mov	ax, es
		mov	fs, ax
		mov	dx, 3
		mov	di, [bp+var_C]
		mov	bx, si
		les	si, fs:[bx]

loc_323BA:
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
		jnz	short loc_323BA
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_306A3
		add	sp, 4
		push	large 600003h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_10+2], dx
		mov	word ptr [bp+var_10], ax
		cmp	[bp+var_10], 0
		jnz	short loc_32442
		jmp	loc_324F0

loc_32442:
		les	bx, word ptr [bp+var_10]
		mov	word ptr es:[bx+6], 9
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+1Ch]
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
		jmp	short loc_324F0

loc_324DB:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_324FA
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_324F0:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	di
		pop	si
		leave
		retf
sub_32358		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_324FA		proc far

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
		jnz	short loc_3251E
		push	60h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_3251E
		jmp	loc_32690

loc_3251E:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 65Ch
		mov	word ptr es:[bx], 2649h
		mov	word ptr es:[bx], 2641h
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
		mov	al, es:[bx+2Ch]
		mov	[bp+var_9], al
		mov	al, es:[bx+2Dh]
		mov	[bp+var_A], al
		mov	al, [bp+var_9]
		mov	ah, 0
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, [bx+6]
		mov	[bp+var_B], al
		mov	[bp+var_E], 9
		mov	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		add	dx, 20h
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
		mov	ax, 3
		mov	[di+14h], eax
		mov	ax, [bp+var_E]
		mov	[di+6], ax
		mov	[di+2], ebx
		mov	[di+8], esi
		les	bx, [bp+var_1A]
		mov	si, es:[bx]
		mov	di, cx
		mov	cx, 3
		push	es
		sub	edx, edx
		les	dx, [bp+var_12]
		mov	ax, es
		mov	fs, ax
		pop	es

loc_3263C:
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
		jnz	short loc_3263C
		pop	ds

loc_32690:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_324FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3269A		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_3269A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3269F		proc far

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
		call	near ptr sub_3131C
		add	sp, 0Ah
		pop	bp
		retf
sub_3269F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_326BC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		and	byte ptr es:[bx+32h], 0FDh
		pop	bp
		retf
sub_326BC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_326C9		proc far
		push	bp
		mov	bp, sp
		mov	al, 9
		pop	bp
		retf
sub_326C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_326D0		proc far

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
		jnz	short loc_326E8
		jmp	loc_327B1

loc_326E8:
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_3061C
		add	sp, 6
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_306A3
		add	sp, 4
		push	large 600003h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		cmp	[bp+var_8], 0
		jnz	short loc_3271E
		jmp	loc_327C6

loc_3271E:
		les	bx, word ptr [bp+var_8]
		mov	word ptr es:[bx+6], 0Ah
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+1Ch]
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
		mov	al, es:[bx+30h]
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
		jmp	short loc_327C6

loc_327B1:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr sub_327CE
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_327C6:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		leave
		retf
sub_326D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_327CE		proc far

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
		jnz	short loc_327F2
		push	60h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_327F2
		jmp	loc_32929

loc_327F2:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 65Ch
		mov	word ptr es:[bx], 2649h
		mov	word ptr es:[bx], 263Dh
		mov	eax, dword_60054
		sar	eax, 8
		push	eax
		les	bx, word ptr [bp+arg_4]
		mov	al, es:[bx+30h]
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
		mov	[bp+var_6], 0Ah
		les	bx, word ptr [bp+arg_4]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx+9]
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

loc_328E5:
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
		jnz	short loc_328E5
		pop	ds

loc_32929:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_327CE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32933		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_32933		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32938		proc far

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
		push	63DEh
		call	Table_LookupByRange_3513A
		add	sp, 4
		mov	dx, ax
		cmp	dx, 0FFFFh
		jz	short loc_32981
		imul	ax, ax, 0Fh
		mov	bx, word_60158
		add	bx, ax
		mov	al, byte ptr [bp+var_2]
		sub	al, [bx+6]
		les	bx, [bp+var_6]
		mov	es:[bx], al
		jmp	short loc_32988

loc_32981:
		les	bx, [bp+var_6]
		mov	byte ptr es:[bx], 0

loc_32988:
		cmp	dx, 0FFFFh
		jnz	short loc_32997
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+2Ch], 0
		jmp	short loc_3299E

loc_32997:
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ch], dl

loc_3299E:
		leave
		retf
sub_32938		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_329A0		proc far

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
		call	near ptr sub_30973
		add	sp, 14h
		les	bx, word ptr [bp+arg_10]
		mov	al, es:[bx+1]
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_32938
		add	sp, 6
		pop	bp
		retf
sub_329A0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_329D3		proc far

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
		jnz	short loc_32A4A
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+10h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_32A4A

loc_32A4A:
		mov	[bp+var_8], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_32AB6
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+14h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_32AB6

loc_32AB6:
		mov	[bp+var_E], di
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	al, es:[bx+29h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_32B22
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
		push	6567h
		call	LightSet_FaceIntensity_34411
		add	sp, 6
		les	bx, [bp+arg_0]
		les	bx, es:[bx+18h]
		mov	es:[bx+28h], al
		or	byte ptr es:[bx+29h], 1
		jmp	short loc_32B22

loc_32B22:
		pop	di
		pop	si
		leave
		retf
sub_329D3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32B26		proc far

var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
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
		sub	sp, 38h
		push	si
		push	di
		mov	[bp+var_4], 0
		cmp	word_5C345, 0
		jnz	short loc_32B40
		jmp	loc_32EA5

loc_32B40:
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
		jnz	short loc_32BF1
		dec	[bp+var_14]

loc_32BF1:
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
		jnz	short loc_32CC2
		dec	[bp+var_14]

loc_32CC2:
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
		jnz	short loc_32D8F
		dec	[bp+var_14]

loc_32D8F:
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
		mov	[bp+var_30], eax
		sub	eax, [bp+var_8]
		add	dword_5F910, eax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_306A3
		add	sp, 4
		push	large 600003h
		call	sub_790E
		add	sp, 4
		mov	word ptr [bp+var_34+2], dx
		mov	word ptr [bp+var_34], ax
		cmp	[bp+var_34], 0
		jnz	short loc_32E10
		jmp	loc_32EBA

loc_32E10:
		les	bx, word ptr [bp+var_34]
		mov	word ptr es:[bx+6], 0Bh
		les	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+var_34]
		mov	es:[bx+10h], eax
		mov	eax, dword_60054
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+var_34]
		add	ax, 18h
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_34]
		mov	es:[bx+8], eax
		push	2
		cmp	byte_60160, 3
		jnz	short loc_32E7D
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_32E85

loc_32E7D:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_32E85:
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+var_34]
		mov	es:[bx+0Ch], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_4], eax
		jmp	short loc_32EBA

loc_32EA5:
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	sub_32ECB
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_32EBA:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	di
		pop	si
		leave
		retf
sub_32B26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32EC4		proc far
		push	bp
		mov	bp, sp
		mov	al, 0Ah
		pop	bp
		retf
sub_32EC4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32ECB		proc near

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
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_2		= dword ptr  6
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 38h
		push	si
		cmp	[bp+arg_2], 0
		jnz	short loc_32EEE
		push	60h
		call	sub_33F26
		pop	cx
		mov	word ptr [bp+arg_2+2], dx
		mov	word ptr [bp+arg_2], ax
		or	ax, dx
		jnz	short loc_32EEE
		jmp	loc_3328D

loc_32EEE:
		les	bx, word ptr [bp+arg_2]
		mov	word ptr es:[bx], 658h
		mov	word ptr es:[bx], 65Ch
		mov	word ptr es:[bx], 2649h
		mov	word ptr es:[bx], 2639h
		mov	si, word_60150
		shl	si, 1
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax
		mov	ax, [bp+arg_8]
		mov	dx, [bp+arg_6]
		add	dx, 10h
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		add	[bp+var_8], 4
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	[bp+var_A], ax
		mov	[bp+var_C], dx
		mov	ax, word ptr [bp+arg_2+2]
		mov	dx, word ptr [bp+arg_2]
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
		jnz	short loc_32FC0
		dec	[bp+var_14]

loc_32FC0:
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
		jnz	short loc_3305B
		dec	[bp+var_14]

loc_3305B:
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
		jnz	short loc_330F2
		dec	[bp+var_14]

loc_330F2:
		mov	eax, [bp+var_14]
		shl	eax, 10h
		les	bx, [bp+var_10]
		mov	es:[bx+8], eax
		mov	ax, [bp+arg_8]
		mov	dx, [bp+arg_6]
		add	dx, 20h
		mov	[bp+var_2E], ax
		mov	[bp+var_30], dx
		mov	ax, word ptr [bp+arg_2+2]
		mov	dx, word ptr [bp+arg_2]
		add	dx, 18h
		mov	[bp+var_E], ax
		mov	[bp+var_10], dx
		les	bx, [bp+var_30]
		movzx	eax, word ptr es:[bx]
		les	bx, [bp+var_10]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+var_30]
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
		les	bx, [bp+var_30]
		movzx	eax, word ptr es:[bx+4]
		les	bx, [bp+var_10]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+var_30]
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
		les	bx, [bp+var_30]
		movzx	eax, word ptr es:[bx+8]
		les	bx, [bp+var_10]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+var_30]
		movzx	eax, word ptr es:[bx+0Ah]
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
		mov	[bp+var_34], eax
		sub	eax, [bp+var_4]
		add	dword_5F910, eax
		les	bx, word ptr [bp+arg_2]
		mov	word ptr es:[bx+6], 0Bh
		les	bx, [bp+arg_6]
		les	bx, es:[bx+1Ch]
		mov	eax, es:[bx+9]
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+10h], eax
		mov	dword ptr es:[bx+14h], 3
		mov	eax, dword_60054
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	es:[bx+2], eax
		push	2
		mov	ax, word ptr [bp+arg_2]
		add	ax, 18h
		push	word ptr [bp+arg_2+2]
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+8], eax
		push	2
		cmp	byte_60160, 3
		jnz	short loc_3326F
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_33277

loc_3326F:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_33277:
		push	dx
		push	ax
		call	sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		les	bx, word ptr [bp+arg_2]
		mov	es:[bx+0Ch], eax

loc_3328D:
		mov	dx, word ptr [bp+arg_2+2]
sub_32ECB		endp
seg070		ends
