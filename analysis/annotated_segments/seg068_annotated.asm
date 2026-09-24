seg068		segment	byte public 'CODE' use16
		assume cs:seg068
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_2F890:				; DATA XREF: seg339:193Eo
		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+6]
		mov	ax, es:[bx+6]

loc_2F89D:				; DATA XREF: seg216:02E6o
		mov	word_72778, ax
		mov	ax, es:[bx+8]
		mov	word_7277A, ax
		mov	ax, es:[bx+18h]
		mov	word_7277E, ax
		mov	ax, es:[bx+1Ah]
		mov	word_72780, ax
		mov	eax, es:[bx+1Ch]
		mov	dword_72782, eax
		mov	eax, es:[bx+20h]

loc_2F8C3:
		mov	dword_72786, eax

loc_2F8C7:
		mov	eax, es:[bx+24h]

loc_2F8CC:
		mov	dword_7278A, eax
		mov	ax, es:[bx+0Ch]
		mov	word_7278E, ax
		mov	ax, es:[bx+0Eh]
		mov	word_72790, ax
		mov	ax, es:[bx+28h]
		mov	word_72794, ax
		mov	ax, es:[bx+2Ah]
		mov	word_72796, ax
		mov	eax, es:[bx+2Ch]
		mov	dword_72798, eax
		mov	eax, es:[bx+30h]
		mov	dword_7279C, eax
		mov	eax, es:[bx+34h]
		mov	dword_727A0, eax
		mov	ax, es:[bx+12h]
		mov	word_727A4, ax
		mov	ax, es:[bx+14h]
		mov	word_727A6, ax
		mov	ax, es:[bx+38h]
		mov	word_727AA, ax
		mov	ax, es:[bx+3Ah]
		mov	word_727AC, ax

loc_2F923:
		mov	eax, es:[bx+3Ch]
		mov	dword_727AE, eax
		mov	eax, es:[bx+40h]

loc_2F931:
		mov	dword_727B2, eax
		mov	eax, es:[bx+44h]

loc_2F93A:
		mov	dword_727B6, eax
		mov	eax, es:[bx+2]
		sar	eax, 8
		mov	[bp-4],	eax
		push	eax
		push	541Ah
		call	Interp_ResolveCached
		add	sp, 6
		push	ax
		push	541Ah
		call	Text_ResolveTruncated
		add	sp, 4
		push	dx
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+48h]
		mov	al, [bx+5]
		mov	ah, 0
		push	ax
		push	0
		mov	bx, [bp+6]
		mov	bx, es:[bx+48h]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+48h]
		push	large dword ptr	[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	56C8h
		push	word_70E60

loc_2F99E:
		call	Mesh_SubdivideRecursive

loc_2F9A3:
		add	sp, 0Eh

locret_2F9A6:
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,77L — teste 3 sommets d'un triangle contre une bounding box (min/max via si+0/4/8/0xC),
; calcule un code de sortie combiné (AND des 4 bits par sommet, façon Cohen-Sutherland) : test
; de rejet rapide 'triangle entièrement hors de la zone visible' (bounding-box reject).
; ==============================================================================================
Render_TriangleBBoxReject	proc far		; CODE XREF: Model_ResetTransformCache+10CP
					; Model_RenderWithSubcomponents+13EP

var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_1], 0Fh
		xor	cx, cx
		jmp	short loc_2FA1E
; ���������������������������������������������������������������������������

loc_2F9BA:				; CODE XREF: Render_TriangleBBoxReject+79j
		mov	ax, cx
		shl	ax, 1
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+1]
		mov	dx, word ptr dword_6EA68+2
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		mov	dl, 0
		les	bx, [bp+var_6]
		mov	eax, es:[bx+11h]
		cmp	eax, [si+8]
		jle	short loc_2F9E6
		or	dl, 4
		jmp	short loc_2F9F6
; ���������������������������������������������������������������������������

loc_2F9E6:				; CODE XREF: Render_TriangleBBoxReject+37j
		les	bx, [bp+var_6]
		mov	eax, es:[bx+11h]
		cmp	eax, [si]
		jge	short loc_2F9F6
		or	dl, 1

loc_2F9F6:				; CODE XREF: Render_TriangleBBoxReject+3Cj
					; Render_TriangleBBoxReject+49j
		les	bx, [bp+var_6]
		mov	eax, es:[bx+15h]
		cmp	eax, [si+4]
		jle	short loc_2FA09
		or	dl, 2
		jmp	short loc_2FA1A
; ���������������������������������������������������������������������������

loc_2FA09:				; CODE XREF: Render_TriangleBBoxReject+5Aj
		les	bx, [bp+var_6]
		mov	eax, es:[bx+15h]
		cmp	eax, [si+0Ch]
		jge	short loc_2FA1A
		or	dl, 8

loc_2FA1A:				; CODE XREF: Render_TriangleBBoxReject+5Fj
					; Render_TriangleBBoxReject+6Dj
		and	[bp+var_1], dl
		inc	cx

loc_2FA1E:				; CODE XREF: Render_TriangleBBoxReject+10j
		cmp	cx, 3
		jl	short loc_2F9BA

loc_2FA23:
		mov	al, [bp+var_1]
		pop	si
		leave

locret_2FA28:
		retf
Render_TriangleBBoxReject	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,78L — calcule le produit vectoriel 2D (aire signée) de 3 points projetés à l'écran,
; divise par 2 : calcul de l'aire signée d'un triangle projeté (test d'orientation/backface en
; espace écran).
; ==============================================================================================
Render_SignedAreaScreen	proc far		; CODE XREF: Render_PolygonPrepCameraSpace+183p
					; Render_PolygonPrepCameraSpace+19Bp ...

var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_2FA2C:
		sub	sp, 20h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	cx, [bp+arg_4]

loc_2FA3A:
		mov	bx, cx
		mov	eax, [bx]
		sub	eax, [si]
		mov	[bp+var_4], eax
		mov	eax, [di]
		sub	eax, [si]
		mov	[bp+var_8], eax
		mov	eax, [bx+4]
		sub	eax, [si+4]
		mov	[bp+var_C], eax
		mov	eax, [di+4]
		sub	eax, [si+4]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_14]
		sub	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		or	eax, eax
		jge	short loc_2FAA8
		neg	eax

loc_2FAA8:				; CODE XREF: Render_SignedAreaScreen+7Aj
		mov	[bp+var_1C], eax

loc_2FAAC:
		mov	eax, [bp+var_1C]

loc_2FAB0:
		sar	eax, 8

loc_2FAB4:
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	[bp+var_20], eax
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
Render_SignedAreaScreen	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,262L — traite les sommets d'un polygone référencés indirectement (segment GS + index),
; calcule des deltas de position relatifs à la caméra : préparation géométrique d'un polygone
; en espace caméra (candidat : étape amont du clipping/rasterisation).
; ==============================================================================================
Render_PolygonPrepCameraSpace	proc far		; CODE XREF: Model_SubmitPolygonGroupA+2BP

var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 54h
		push	si
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+1]
		mov	dx, word ptr dword_6EA68+2
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	dx, [bp+var_4]
		add	dx, 11h
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_3C], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_38], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_34], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+3]
		mov	dx, word ptr dword_6EA68+2
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	dx, [bp+var_4]
		add	dx, 11h
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx

loc_2FB33:
		les	bx, [bp+var_C]

loc_2FB36:
		mov	eax, es:[bx]

loc_2FB3A:
		mov	[bp+var_48], eax

loc_2FB3E:
		mov	eax, es:[bx+4]

loc_2FB43:
		mov	[bp+var_44], eax

loc_2FB47:
		mov	eax, es:[bx+8]
		mov	[bp+var_40], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+5]
		mov	dx, word ptr dword_6EA68+2
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	dx, [bp+var_4]
		add	dx, 11h
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		les	bx, [bp+var_10]
		mov	eax, es:[bx]
		mov	[bp+var_54], eax
		mov	eax, es:[bx+4]
		mov	[bp+var_50], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_48]
		cmp	eax, [bp+var_14]
		jge	short loc_2FBA3
		mov	[bp+var_14], eax

loc_2FBA3:				; CODE XREF: Render_PolygonPrepCameraSpace+D1j
		mov	eax, [bp+var_54]

loc_2FBA7:
		cmp	eax, [bp+var_14]

loc_2FBAB:
		jge	short loc_2FBB1
		mov	[bp+var_14], eax

loc_2FBB1:				; CODE XREF: Render_PolygonPrepCameraSpace:loc_2FBABj
		mov	eax, [bp+var_3C]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_48]
		cmp	eax, [bp+var_18]

loc_2FBC1:
		jle	short loc_2FBC7

loc_2FBC3:
		mov	[bp+var_18], eax

loc_2FBC7:				; CODE XREF: Render_PolygonPrepCameraSpace:loc_2FBC1j
		mov	eax, [bp+var_54]
		cmp	eax, [bp+var_18]
		jle	short loc_2FBD5
		mov	[bp+var_18], eax

loc_2FBD5:				; CODE XREF: Render_PolygonPrepCameraSpace+103j
		mov	eax, [bp+var_38]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_44]
		cmp	eax, [bp+var_1C]
		jge	short loc_2FBEB
		mov	[bp+var_1C], eax

loc_2FBEB:				; CODE XREF: Render_PolygonPrepCameraSpace+119j
		mov	eax, [bp+var_50]
		cmp	eax, [bp+var_1C]
		jge	short loc_2FBF9
		mov	[bp+var_1C], eax

loc_2FBF9:				; CODE XREF: Render_PolygonPrepCameraSpace+127j
		mov	eax, [bp+var_38]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_44]
		cmp	eax, [bp+var_20]
		jle	short loc_2FC0F
		mov	[bp+var_20], eax

loc_2FC0F:				; CODE XREF: Render_PolygonPrepCameraSpace+13Dj
		mov	eax, [bp+var_50]
		cmp	eax, [bp+var_20]
		jle	short loc_2FC1D
		mov	[bp+var_20], eax

loc_2FC1D:				; CODE XREF: Render_PolygonPrepCameraSpace+14Bj
		mov	eax, [si]
		cmp	eax, [bp+var_14]
		jge	short loc_2FC29
		jmp	loc_2FCC3
; ���������������������������������������������������������������������������

loc_2FC29:				; CODE XREF: Render_PolygonPrepCameraSpace+158j
		cmp	eax, [bp+var_18]
		jle	short loc_2FC32

loc_2FC2F:
		jmp	loc_2FCC3
; ���������������������������������������������������������������������������

loc_2FC32:				; CODE XREF: Render_PolygonPrepCameraSpace+161j
		mov	eax, [si+4]

loc_2FC36:
		cmp	eax, [bp+var_1C]
		jge	short loc_2FC3F
		jmp	loc_2FCC3
; ���������������������������������������������������������������������������

loc_2FC3F:				; CODE XREF: Render_PolygonPrepCameraSpace+16Ej
		cmp	eax, [bp+var_20]
		jg	short loc_2FCC3
		lea	ax, [bp+var_48]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	si
		push	cs
		call	near ptr Render_SignedAreaScreen
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_24], eax
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		push	si
		push	cs
		call	near ptr Render_SignedAreaScreen
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_28], eax
		lea	ax, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_54]
		push	ax
		push	si
		push	cs
		call	near ptr Render_SignedAreaScreen
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	[bp+var_2C], eax
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		push	cs
		call	near ptr Render_SignedAreaScreen
		push	dx
		push	ax
		pop	eax

loc_2FCA1:
		add	sp, 6
		mov	[bp+var_30], eax
		mov	eax, [bp+var_24]

loc_2FCAC:
		add	eax, [bp+var_28]

loc_2FCB0:
		add	eax, [bp+var_2C]

loc_2FCB4:
		mov	edx, [bp+var_30]
		inc	edx
		cmp	eax, edx
		jg	short loc_2FCC3
		mov	al, 1
		jmp	short loc_2FCC5
; ���������������������������������������������������������������������������

loc_2FCC3:				; CODE XREF: Render_PolygonPrepCameraSpace+15Aj
					; Render_PolygonPrepCameraSpace:loc_2FC2Fj	...
		mov	al, 0

loc_2FCC5:				; CODE XREF: Render_PolygonPrepCameraSpace+1F5j
		pop	si
		leave
		retf
Render_PolygonPrepCameraSpace	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,236L — pour chaque sommet référencé, calcule une position relative à un point de
; référence (di) divisée par un facteur d'échelle (arg_A) : projection/mise à l'échelle des
; sommets d'un polygone pour le rendu.
; ==============================================================================================
Render_PolygonProjectVertices	proc far		; CODE XREF: Model_SubmitPolygonGroupB+C8P

var_82		= word ptr -82h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= word ptr -28h
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= byte ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 82h

loc_2FCCF:
		push	si
		push	di

loc_2FCD1:
		mov	di, [bp+arg_8]
		lea	si, [bp+var_82]

loc_2FCD8:
		mov	[bp+var_6], 0
		jmp	loc_2FE88
; ���������������������������������������������������������������������������

loc_2FCE0:				; CODE XREF: Render_PolygonProjectVertices+1C6j
		mov	ax, [bp+var_6]
		shl	ax, 1
		les	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, es:[bx+1]
		mov	dx, word ptr dword_6EA68+2
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+11h]
		sub	eax, [di]
		sar	eax, 8
		mov	[bp+var_A], eax
		mov	bx, [bp+arg_A]
		cdq
		idiv	dword ptr [bx]
		mov	[bp+var_A], eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, es:[bx+15h]

loc_2FD1F:
		sub	eax, [di+4]

loc_2FD23:
		sar	eax, 8
		mov	[bp+var_E], eax
		mov	bx, [bp+arg_A]
		cdq

loc_2FD30:
		idiv	dword ptr [bx]
		mov	[bp+var_E], eax
		cmp	[bp+var_A], 800h
		jg	short loc_2FD5F
		cmp	[bp+var_A], 0FFFFF800h
		jl	short loc_2FD5F
		cmp	[bp+var_E], 800h
		jg	short loc_2FD5F
		cmp	[bp+var_E], 0FFFFF800h
		jge	short loc_2FD7C

loc_2FD5F:				; CODE XREF: Render_PolygonProjectVertices+77j
					; Render_PolygonProjectVertices+81j ...
		push	large 0
		push	large [bp+var_E]
		push	large [bp+var_A]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		shl	eax, 8
		jmp	short loc_2FDAE
; ���������������������������������������������������������������������������

loc_2FD7C:				; CODE XREF: Render_PolygonProjectVertices+95j
		mov	eax, [bp+var_A]
		imul	eax, [bp+var_A]
		mov	edx, [bp+var_E]
		imul	edx, [bp+var_E]
		add	eax, edx
		shl	eax, 8
		mov	[bp+var_12], eax
		lea	ax, [bp+var_12]
		push	ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	Math_Sqrt_54BF1
		add	sp, 6
		mov	eax, [bp+var_16]

loc_2FDAE:				; CODE XREF: Render_PolygonProjectVertices+B2j
		mov	[bp+var_12], eax

loc_2FDB2:
		lea	ax, [bp+var_12]
		push	ax
		mov	eax, [bp+var_A]
		mov	[bp+var_1E], eax
		shl	eax, 8
		mov	[bp+var_22], eax
		lea	ax, [bp+var_22]

loc_2FDC9:
		push	ax
		push	ss

loc_2FDCB:
		lea	ax, [bp+var_26]
		push	ax

loc_2FDCF:
		call	Math_ArcSinOfRatio_54A0E

loc_2FDD4:
		add	sp, 8
		mov	eax, [bp+var_26]

loc_2FDDB:
		mov	[bp+var_1A], eax

loc_2FDDF:
		cmp	[bp+var_E], 0

loc_2FDE4:
		jge	short loc_2FDED

loc_2FDE6:
		neg	eax
		mov	[bp+var_1A], eax

loc_2FDED:				; CODE XREF: Render_PolygonProjectVertices:loc_2FDE4j
		mov	ax, [bp+arg_6]
		mov	[bp+var_28], ax
		mov	bx, [bp+var_28]
		mov	eax, [bx]
		add	[bp+var_1A], eax
		lea	ax, [bp+var_1A]
		push	ax
		push	ss
		lea	ax, [bp+var_2C]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		sar	eax, 8

loc_2FE2E:
		mov	[bp+var_A], eax

loc_2FE32:
		lea	ax, [bp+var_1A]
		push	ax
		push	ss

loc_2FE37:
		lea	ax, [bp+var_38]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6

loc_2FE43:
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_38]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		mov	[bp+var_40], eax
		sar	eax, 8
		mov	[bp+var_E], eax
		mov	bx, [bp+arg_C]
		mov	ax, [bx]
		add	ax, word ptr [bp+var_A]
		mov	[si], ax
		mov	ax, [bx+2]
		sub	ax, word ptr [bp+var_E]
		mov	[si+2],	ax
		mov	al, [bp+arg_E]
		mov	ah, 0
		mov	[si+4],	ax
		inc	[bp+var_6]
		add	si, 16h

loc_2FE88:				; CODE XREF: Render_PolygonProjectVertices+15j
		cmp	[bp+var_6], 3
		jge	short loc_2FE91
		jmp	loc_2FCE0
; ���������������������������������������������������������������������������

loc_2FE91:				; CODE XREF: Render_PolygonProjectVertices+1C4j
		push	ss
		lea	ax, [bp+var_82]
		push	ax
		push	3
		push	[bp+arg_4]
		call	Render_PolygonPrimitive_20848
		add	sp, 8
		pop	di
		pop	si
		leave
		retf
Render_PolygonProjectVertices	endp

; ���������������������������������������������������������������������������

loc_2FEA8:				; DATA XREF: seg339:off_71EA2o
		push	bp
		mov	bp, sp
		xor	ax, ax
		mov	word_7254C, ax
		mov	word_7254A, ax
		xor	ax, ax
		mov	word_72550, ax
		mov	word_7254E, ax
		mov	word_72552, 11E8h

loc_2FEC1:
		mov	word_72552, 193Ah
		mov	word_72552, 193Eh

loc_2FECD:
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2FECF:				; DATA XREF: seg339:off_71FB0o
		push	bp

loc_2FED0:
		mov	bp, sp
		push	0

loc_2FED4:
		push	ds

loc_2FED5:
		push	offset word_7254A
		call	VROOMM_StubThunk_6CD76

loc_2FEDD:
		add	sp, 6

loc_2FEE0:
		pop	bp
		retf
seg068		ends
