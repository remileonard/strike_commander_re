seg070		segment	byte public 'CODE' use16
		assume cs:seg070
		;org 5
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_31BB5:				; DATA XREF: seg339:off_6EA26o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+16h], 0
		jz	short loc_31BFC
		push	0
		push	2
		mov	ax, si
		add	ax, 18h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword ptr [si+18h], 0
		push	0
		push	2
		mov	ax, si
		add	ax, 1Ch
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		mov	dword ptr [si+1Ch], 0

loc_31BFC:				; CODE XREF: seg070:0010j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,159L — nettoie les flags de cache de transformation (+0x10, bits 0x80/0x40) sur tous les
; sommets d'un modèle, résout le nom du modèle (sub_5C832), parcourt les listes de polygones
; (+0x18) : réinitialisation du cache de transformation d'un modèle 3D avant un nouveau rendu.
; ==============================================================================================
Model_ResetTransformCache	proc far		; CODE XREF: Model_RenderMain+41Ap

var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
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
		jnz	short loc_31C16
		jmp	loc_31D3B
; ���������������������������������������������������������������������������

loc_31C16:				; CODE XREF: Model_ResetTransformCache+12j
		push	0
		mov	al, [si+0Ch]
		push	ax
		push	large dword ptr	[si+8]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		mov	ax, [si+4]
		mov	dx, word ptr dword_6EA68+2
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		xor	dx, dx
		jmp	short loc_31C55
; ���������������������������������������������������������������������������

loc_31C43:				; CODE XREF: Model_ResetTransformCache+59j
		les	bx, [bp+var_4]
		and	byte ptr es:[bx+10h], 7Fh
		and	byte ptr es:[bx+10h], 0BFh
		inc	dx
		add	word ptr [bp+var_4], 1Eh

loc_31C55:				; CODE XREF: Model_ResetTransformCache+42j
		cmp	[si+6],	dx
		jg	short loc_31C43
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
		jnz	short loc_31C81
		jmp	loc_31D3B
; ���������������������������������������������������������������������������

loc_31C81:				; CODE XREF: Model_ResetTransformCache+7Dj
		les	bx, [bp+var_A]
		add	word ptr [bp+var_A], 2
		mov	ax, es:[bx]

loc_31C8B:
		mov	[bp+var_C], ax
		mov	ax, [si+12h]
		mov	dx, word ptr dword_6EA68+2
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		xor	si, si
		jmp	loc_31D2A
; ���������������������������������������������������������������������������

loc_31CA0:				; CODE XREF: Model_ResetTransformCache+130j
		les	bx, [bp+var_A]
		mov	ax, es:[bx]
		mov	[bp+var_E], ax
		imul	ax, 1Eh
		mov	dx, [bp+var_14]
		mov	bx, [bp+var_16]
		add	bx, ax
		mov	word ptr [bp+var_12+2],	dx
		mov	word ptr [bp+var_12], bx
		mov	es, word ptr [bp+var_12+2]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		cmp	ax, [di+9]
		jg	short loc_31D25
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		shl	ax, 2
		mov	bx, ax
		mov	eax, [bx+di+2Dh]
		mov	[bp+var_1A], eax
		shl	eax, 8
		mov	bx, [bp+arg_2]
		cmp	eax, [bx+1Ch]
		jle	short loc_31CED
		mov	ax, 1
		jmp	short loc_31CEF
; ���������������������������������������������������������������������������

loc_31CED:				; CODE XREF: Model_ResetTransformCache+E7j
		xor	ax, ax

loc_31CEF:				; CODE XREF: Model_ResetTransformCache+ECj
		or	al, al
		jz	short loc_31D25
		les	bx, [bp+var_12]
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		shl	ax, 4
		mov	dx, di
		add	dx, ax
		add	dx, 3Dh	; '='
		push	dx
		push	word ptr [bp+var_12+2]
		push	bx
		call	Render_TriangleBBoxReject
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_31D25
		push	large [bp+var_12]
		call	Render_ObjectPipelineMain
		add	sp, 4

loc_31D25:				; CODE XREF: Model_ResetTransformCache+C7j
					; Model_ResetTransformCache+F2j ...
		inc	si
		add	word ptr [bp+var_A], 2

loc_31D2A:				; CODE XREF: Model_ResetTransformCache+9Ej
		cmp	si, [bp+var_C]
		jge	short loc_31D32
		jmp	loc_31CA0
; ���������������������������������������������������������������������������

loc_31D32:				; CODE XREF: Model_ResetTransformCache+12Ej
		mov	dword_6EA68, 0

loc_31D3B:				; CODE XREF: Model_ResetTransformCache+14j
					; Model_ResetTransformCache+7Fj
		pop	di
		pop	si
		leave
		retf
Model_ResetTransformCache	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,56L — parcourt une liste d'indices de polygones et appelle sub_2FACC (préparation
; géométrique) pour chacun : soumission des polygones d'un sous-groupe de modèle au pipeline
; de préparation géométrique.
; ==============================================================================================
Model_SubmitPolygonGroupA	proc far		; CODE XREF: Model_RenderMain+42Cp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	ax, [bp+arg_0]
		jmp	short loc_31D9B
; ���������������������������������������������������������������������������

loc_31D4B:				; CODE XREF: Model_SubmitPolygonGroupA+51j
		les	bx, [bp-6]
		mov	ax, es:[bx]
		mov	[bp-0Ah], ax
		imul	ax, 1Eh
		mov	dx, [bp-10h]
		mov	bx, [bp-12h]
		add	bx, ax
		mov	[bp-0Ch], dx
		mov	[bp-0Eh], bx
		push	word ptr [bp+8]
		push	dx
		push	bx
		call	Render_PolygonPrepCameraSpace
		add	sp, 6
		mov	[bp-1],	al
		cmp	byte ptr [bp-1], 0
		jz	short loc_31D88

loc_31D7B:
		mov	dword_6EA68, 0
		mov	al, 1
		jmp	short loc_31D9D
; ���������������������������������������������������������������������������

loc_31D88:				; CODE XREF: Model_SubmitPolygonGroupA+3Aj
		inc	si

loc_31D89:
		add	word ptr [bp-6], 2
		cmp	si, [bp-8]
		jl	short loc_31D4B

loc_31D92:
		mov	dword_6EA68, 0

loc_31D9B:				; CODE XREF: Model_SubmitPolygonGroupA+Aj
		mov	al, 0

loc_31D9D:				; CODE XREF: Model_SubmitPolygonGroupA+47j
		pop	si
		leave
		retf
Model_SubmitPolygonGroupA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,120L — variante de sub_31D3F itérant une structure de sous-maillage différente
; (+0x12/+0x18) : soumission des polygones d'un second type de sous-groupe de modèle.
; ==============================================================================================
Model_SubmitPolygonGroupB	proc far		; CODE XREF: Model_RenderMain+472p

var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= byte ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+16h], 0
		jnz	short loc_31DB4
		jmp	loc_31E83
; ���������������������������������������������������������������������������

loc_31DB4:				; CODE XREF: Model_SubmitPolygonGroupB+Fj
		mov	[bp+var_2], 0
		push	0
		mov	al, [si+0Ch]
		push	ax
		push	large dword ptr	[si+8]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		les	bx, [si+18h]
		mov	ax, [bp+var_2]
		shl	ax, 2
		add	bx, ax
		mov	ax, es:[bx+2]
		mov	dx, es:[bx]
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		cmp	[bp+var_6], 0
		jnz	short loc_31DF7
		jmp	loc_31E83
; ���������������������������������������������������������������������������

loc_31DF7:				; CODE XREF: Model_SubmitPolygonGroupB+52j
		les	bx, [bp+var_6]
		add	word ptr [bp+var_6], 2
		mov	ax, es:[bx]
		mov	[bp+var_8], ax
		mov	ax, [si+12h]
		mov	dx, word ptr dword_6EA68+2
		mov	[bp+var_10], dx
		mov	[bp+var_12], ax
		xor	di, di
		jmp	short loc_31E75
; ���������������������������������������������������������������������������

loc_31E15:				; CODE XREF: Model_SubmitPolygonGroupB+D8j
		les	bx, [bp+var_6]
		mov	ax, es:[bx]
		mov	[bp+var_A], ax
		imul	ax, 1Eh
		mov	dx, [bp+var_10]
		mov	bx, [bp+var_12]
		add	bx, ax
		mov	[bp+var_C], dx
		mov	[bp+var_E], bx
		mov	al, [bp+arg_E]
		push	ax
		push	[bp+arg_A]
		mov	bx, [bp+arg_C]
		mov	eax, [bx]
		sar	eax, 8
		mov	[bp+var_16], eax
		lea	ax, [bp+var_16]
		push	ax
		mov	si, [bp+arg_6]
		mov	eax, [si]
		mov	[bp+var_1E], eax
		mov	eax, [si+4]
		mov	[bp+var_1A], eax
		lea	ax, [bp+var_1E]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	dx
		push	[bp+var_E]
		call	Render_PolygonProjectVertices
		add	sp, 10h
		inc	di
		add	word ptr [bp+var_6], 2

loc_31E75:				; CODE XREF: Model_SubmitPolygonGroupB+73j
		cmp	di, [bp+var_8]
		jl	short loc_31E15
		mov	dword_6EA68, 0

loc_31E83:				; CODE XREF: Model_SubmitPolygonGroupB+11j
					; Model_SubmitPolygonGroupB+54j
		pop	di

loc_31E84:
		pop	si
		leave

locret_31E86:
		retf
Model_SubmitPolygonGroupB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,611L — grosse fonction du même cluster (buffer local >0xB2, nombreux arguments), appelée
; par sub_32321/sub_32490/sub_32526 : candidat pour la fonction principale de rendu d'un
; modèle 3D complet (orchestration des sous-groupes de polygones), à approfondir. || Appelle
; sub_6BD30 -> TRI_ParseOverlayGeometry_99120 (ovr291) : c'est par ce chemin que la geometrie
; des overlays .TRI (pistes) est lue et rendue.
; ==============================================================================================
Model_RenderMain	proc far		; CODE XREF: Model_RenderWithSubcomponents+88p
					; Model_RenderStatic+84p ...

var_B2		= dword	ptr -0B2h
var_AE		= dword	ptr -0AEh
var_AA		= dword	ptr -0AAh
var_A6		= dword	ptr -0A6h
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
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_5		= byte ptr -5
var_4		= dword	ptr -4
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

loc_31E88:
		mov	bp, sp

loc_31E8A:
		sub	sp, 0B2h

loc_31E8E:
		push	si
		push	di

loc_31E90:
		mov	si, [bp+arg_0]

loc_31E93:
		cmp	byte ptr [si], 0

loc_31E96:
		jnz	short loc_31E9B
		jmp	loc_3231D
; ���������������������������������������������������������������������������

loc_31E9B:				; CODE XREF: Model_RenderMain:loc_31E96j
		xor	di, di
		jmp	loc_31F80
; ���������������������������������������������������������������������������

loc_31EA0:				; CODE XREF: Model_RenderMain:loc_31F85j
		cmp	[bp+arg_2], 0
		jz	short loc_31ECF

loc_31EA6:
		mov	ax, [bp+arg_2]
		add	ax, 14h

loc_31EAC:
		mov	[bp+var_10], ax

loc_31EAF:
		mov	bx, [bp+var_10]

loc_31EB2:
		mov	eax, [bx]

loc_31EB5:
		mov	[bp+var_18], eax
		mov	eax, [bx+4]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_14]
		jmp	short loc_31EF3
; ���������������������������������������������������������������������������

loc_31ECF:				; CODE XREF: Model_RenderMain+1Dj
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

loc_31EF3:				; CODE XREF: Model_RenderMain+46j
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

loc_31F23:
		shl	bx, 4

loc_31F26:
		mov	eax, [bp+var_E]

loc_31F2A:
		mov	[bx+si+3Dh], eax
		mov	bx, di

loc_31F30:
		shl	bx, 4

loc_31F33:
		mov	eax, [bp+var_A]

loc_31F37:
		mov	[bx+si+41h], eax
		mov	bx, di
		shl	bx, 2

loc_31F40:
		mov	eax, [bx+si+0Dh]

loc_31F44:
		mov	[bp+var_2E], eax
		shl	eax, 8

loc_31F4C:
		add	[bp+var_E], eax

loc_31F50:
		mov	bx, di

loc_31F52:
		shl	bx, 2

loc_31F55:
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

loc_31F80:				; CODE XREF: Model_RenderMain+16j
		cmp	[si+0Bh], di
		jle	short loc_31F88

loc_31F85:
		jmp	loc_31EA0
; ���������������������������������������������������������������������������

loc_31F88:				; CODE XREF: Model_RenderMain+FCj
		mov	ax, word_70466
		mov	[bp+var_4A], ax
		mov	di, si
		add	di, 3Dh	; '='
		mov	eax, [di]
		mov	[bp+var_3A], eax
		mov	eax, [di+4]
		mov	[bp+var_36], eax
		mov	bx, [si+1]

loc_31FA5:
		mov	eax, [bx+86h]
		mov	[bp+var_4E], eax

loc_31FAE:
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
		add	di, 45h	; 'E'
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

loc_32025:
		mov	eax, [bp+var_3A]
		mov	edx, eax

loc_3202C:
		mov	ecx, [bp+var_72]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_36]
		mov	edx, eax

loc_32046:
		mov	ecx, [bp+var_72]
		sar	edx, 18h

loc_3204E:
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

loc_32081:
		mov	ecx, [bp+var_82]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx

loc_32091:
		mov	[bp+var_42], eax
		mov	eax, [bp+var_3E]
		mov	edx, eax
		mov	ecx, [bp+var_82]

loc_320A1:
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx

loc_320AC:
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
		jmp	loc_32311
; ���������������������������������������������������������������������������

loc_32108:				; CODE XREF: Model_RenderMain+493j
		mov	ax, [bp+var_8E]
		mov	[bp+var_44], ax
		jmp	loc_32302
; ���������������������������������������������������������������������������

loc_32112:				; CODE XREF: Model_RenderMain+484j
		cmp	[bp+var_44], 0
		jge	short loc_3211C
		xor	di, di
		jmp	short loc_3212D
; ���������������������������������������������������������������������������

loc_3211C:				; CODE XREF: Model_RenderMain+28Fj
		mov	ax, [si+3]
		cmp	ax, [bp+var_44]

loc_32122:
		jg	short loc_3212A
		mov	di, [si+3]
		dec	di
		jmp	short loc_3212D
; ���������������������������������������������������������������������������

loc_3212A:				; CODE XREF: Model_RenderMain:loc_32122j
		mov	di, [bp+var_44]

loc_3212D:				; CODE XREF: Model_RenderMain+293j
					; Model_RenderMain+2A1j
		cmp	[bp+var_46], 0
		jge	short loc_3213A
		mov	[bp+var_48], 0
		jmp	short loc_3214B
; ���������������������������������������������������������������������������

loc_3213A:				; CODE XREF: Model_RenderMain+2AAj
		mov	ax, [si+3]
		cmp	ax, [bp+var_46]
		jg	short loc_32145
		dec	ax

loc_32143:
		jmp	short loc_32148
; ���������������������������������������������������������������������������

loc_32145:				; CODE XREF: Model_RenderMain+2B9j
		mov	ax, [bp+var_46]

loc_32148:				; CODE XREF: Model_RenderMain:loc_32143j
		mov	[bp+var_48], ax

loc_3214B:				; CODE XREF: Model_RenderMain+2B1j
		mov	bx, [si+1]
		mov	ax, [bx+5]
		mov	dx, [bx+3]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		mov	ax, [bp+var_48]
		imul	word ptr [si+3]
		add	ax, di
		shl	ax, 1
		add	word ptr [bp+var_4], ax
		les	bx, [bp+var_4]
		cmp	word ptr es:[bx], 0
		jz	short loc_32180
		mov	ax, [bp+var_4A]
		mov	[bp+var_9C], ax
		mov	bx, es:[bx]
		mov	[bx+2],	ax
		jmp	loc_32283
; ���������������������������������������������������������������������������

loc_32180:				; CODE XREF: Model_RenderMain+2E7j
		mov	ax, [si+1]

loc_32183:
		add	ax, 0Bh
		mov	[bp+var_9E], ax
		mov	ax, [bp+var_48]
		imul	word ptr [si+3]
		add	ax, di

loc_32192:
		mov	[bp+var_A0], ax
		mov	ax, [bp+var_4A]
		mov	[bp+var_A2], ax
		push	20h ; ' '
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax

loc_321A9:
		jnz	short loc_321AE
		jmp	loc_3226C
; ���������������������������������������������������������������������������

loc_321AE:				; CODE XREF: Model_RenderMain:loc_321A9j
		mov	word ptr [di], 1966h
		mov	word ptr [di], 1976h
		add	ax, 4
		mov	word ptr [bp+var_A6+2],	ds
		mov	word ptr [bp+var_A6], ax
		cmp	[bp+var_A6], 0
		jz	short loc_321CF
		mov	dx, word ptr [bp+var_A6+2]
		jmp	short loc_321E2
; ���������������������������������������������������������������������������

loc_321CF:				; CODE XREF: Model_RenderMain+340j
		push	large 2
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+var_A6+2],	dx
		mov	word ptr [bp+var_A6], ax

loc_321E2:				; CODE XREF: Model_RenderMain+346j
		or	ax, dx
		jz	short loc_321E8
		jmp	short $+2

loc_321E8:				; CODE XREF: Model_RenderMain+35Dj
		mov	dword ptr [di+8], 0
		mov	byte ptr [di+0Ch], 2
		mov	byte ptr [di+0Dh], 0
		mov	dword ptr [di+0Eh], 0
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_AA+2],	ds
		mov	word ptr [bp+var_AA], ax
		cmp	[bp+var_AA], 0
		jz	short loc_3221B
		mov	dx, word ptr [bp+var_AA+2]
		jmp	short loc_3222E
; ���������������������������������������������������������������������������

loc_3221B:				; CODE XREF: Model_RenderMain+38Cj
		push	large 2
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+var_AA+2],	dx

loc_3222A:
		mov	word ptr [bp+var_AA], ax

loc_3222E:				; CODE XREF: Model_RenderMain+392j
		or	ax, dx
		jz	short loc_32234
		jmp	short $+2

loc_32234:				; CODE XREF: Model_RenderMain+3A9j
		mov	word ptr [di+6], 0
		mov	word ptr [di+14h], 0
		mov	word ptr [di+16h], 0

loc_32243:
		mov	dword ptr [di+18h], 0
		mov	dword ptr [di+1Ch], 0
		push	[bp+var_A2]
		push	[bp+var_A0]
		push	[bp+var_9E]
		push	di
		call	VROOMM_StubThunk_6BD30
		add	sp, 8
		mov	ax, di
		jmp	short loc_3226E
; ���������������������������������������������������������������������������

loc_3226C:				; CODE XREF: Model_RenderMain+324j
		mov	ax, di

loc_3226E:				; CODE XREF: Model_RenderMain+3E3j
		les	bx, [bp+var_4]
		mov	es:[bx], ax
		push	word ptr [bp+var_4+2]
		push	bx
		push	5510h
		call	TerrainTile_CacheEntryConstruct
		add	sp, 6

loc_32283:				; CODE XREF: Model_RenderMain+2F6j
		mov	ax, [bp+arg_12]
		or	ax, ax

loc_32288:
		jz	short loc_32296
		cmp	ax, 1

loc_3228D:
		jz	short loc_322A9
		cmp	ax, 2
		jz	short loc_322C6
		jmp	short loc_322FF
; ���������������������������������������������������������������������������

loc_32296:				; CODE XREF: Model_RenderMain:loc_32288j
		push	si
		push	[bp+arg_2]
		les	bx, [bp+var_4]
		push	word ptr es:[bx]
		push	cs
		call	near ptr Model_ResetTransformCache

loc_322A4:
		add	sp, 6

loc_322A7:
		jmp	short loc_322FF
; ���������������������������������������������������������������������������

loc_322A9:				; CODE XREF: Model_RenderMain:loc_3228Dj
		push	[bp+arg_8]
		les	bx, [bp+var_4]
		push	word ptr es:[bx]

loc_322B2:
		push	cs
		call	near ptr Model_SubmitPolygonGroupA

loc_322B6:
		add	sp, 4
		mov	[bp+var_5], al
		cmp	[bp+var_5], 0
		jz	short loc_322FF
		mov	al, 1
		jmp	short loc_3231D
; ���������������������������������������������������������������������������

loc_322C6:				; CODE XREF: Model_RenderMain+40Bj
		mov	al, [bp+arg_10]
		push	ax
		mov	bx, [bp+arg_E]
		mov	eax, [bx]
		mov	[bp+var_AE], eax
		shl	eax, 8
		mov	[bp+var_B2], eax
		lea	ax, [bp+var_B2]
		push	ax
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		les	bx, [bp+var_4]
		push	word ptr es:[bx]
		push	cs
		call	near ptr Model_SubmitPolygonGroupB
		add	sp, 10h

loc_322FF:				; CODE XREF: Model_RenderMain+40Dj
					; Model_RenderMain:loc_322A7j	...
		inc	[bp+var_44]

loc_32302:				; CODE XREF: Model_RenderMain+288j
		mov	ax, [bp+var_44]
		cmp	ax, [bp+var_96]
		jg	short loc_3230E
		jmp	loc_32112
; ���������������������������������������������������������������������������

loc_3230E:				; CODE XREF: Model_RenderMain+482j
		inc	[bp+var_46]

loc_32311:				; CODE XREF: Model_RenderMain+27Ej
		mov	ax, [bp+var_46]
		cmp	ax, [bp+var_94]
		jg	short loc_3231D
		jmp	loc_32108
; ���������������������������������������������������������������������������

loc_3231D:				; CODE XREF: Model_RenderMain+11j
					; Model_RenderMain+43Dj ...
		pop	di
		pop	si
		leave
		retf
Model_RenderMain	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,181L — orchestre le rendu d'un modèle (boucle sur des sous-composants), appelle
; sub_31E87 : rendu d'un modèle 3D avec sous-composants (probable modèle d'avion avec pièces
; mobiles).
; ==============================================================================================
Model_RenderWithSubcomponents	proc far		; CODE XREF: Terrain_UpdateLODPerFrame+1F9P

var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_32324:
		sub	sp, 34h
		push	si

loc_32328:
		push	di

loc_32329:
		mov	si, [bp+arg_0]

loc_3232C:
		mov	[bp+var_4], 0

loc_32334:
		mov	eax, [bp+var_4]
		mov	[bp+var_34], eax
		mov	[bp+var_8], 0

loc_32344:
		mov	eax, [bp+var_8]

loc_32348:
		mov	[bp+var_30], eax

loc_3234C:
		mov	[bp+var_C], 0

loc_32354:
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
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		mov	[bp+var_20], 0
		lea	ax, [bp+var_20]
		push	ax
		lea	ax, [bp+var_34]
		push	ax
		lea	ax, [bp+var_10]
		push	ax

loc_323A1:
		push	[bp+var_12]
		push	[bp+var_18]

loc_323A7:
		push	si
		push	cs
		call	near ptr Model_RenderMain
		add	sp, 14h
		push	0
		mov	al, byte_725A6
		push	ax
		push	large [dword_725A2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		mov	ax, word ptr dword_6EA68+2
		mov	dx, word_725A0
		mov	word ptr [bp+var_24+2],	ax
		mov	word ptr [bp+var_24], dx
		xor	di, di
		jmp	short loc_323EF
; ���������������������������������������������������������������������������

loc_323DD:				; CODE XREF: Model_RenderWithSubcomponents+D1j
		les	bx, [bp+var_24]
		and	byte ptr es:[bx+10h], 7Fh
		and	byte ptr es:[bx+10h], 0BFh
		add	word ptr [bp+var_24], 1Eh
		inc	di

loc_323EF:				; CODE XREF: Model_RenderWithSubcomponents+BAj
		cmp	di, 3Ch	; '<'
		jl	short loc_323DD
		mov	dword_6EA68, 0
		push	0
		mov	al, byte_725A6
		push	ax
		push	large [dword_725A2]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr dword_6EA68+2,	dx
		mov	word ptr dword_6EA68, ax
		mov	ax, word ptr dword_6EA68+2
		mov	dx, word_7259E

loc_32421:
		mov	word ptr [bp+var_28+2],	ax
		mov	word ptr [bp+var_28], dx

loc_32427:
		xor	di, di
		jmp	short loc_3247E
; ���������������������������������������������������������������������������

loc_3242B:				; CODE XREF: Model_RenderWithSubcomponents+160j
		cmp	byte ptr [di+54FCh], 0
		jz	short loc_32436
		dec	byte ptr [di+54FCh]

loc_32436:				; CODE XREF: Model_RenderWithSubcomponents+10Fj
		les	bx, [bp+var_28]
		cmp	word ptr es:[bx+14h], 0
		jz	short loc_32479

loc_32440:
		mov	al, [di+54FCh]
		mov	ah, 0

loc_32446:
		or	ax, ax
		jnz	short loc_32479
		mov	al, es:[bx+1Ch]
		mov	ah, 0
		shl	ax, 4
		mov	dx, si
		add	dx, ax
		add	dx, 3Dh	; '='
		push	dx
		push	word ptr [bp+var_28+2]
		push	bx
		call	Render_TriangleBBoxReject
		add	sp, 6
		mov	ah, 0
		or	ax, ax
		jnz	short loc_32479
		push	large [bp+var_28]
		call	Render_ObjectPipelineMain
		add	sp, 4

loc_32479:				; CODE XREF: Model_RenderWithSubcomponents+11Dj
					; Model_RenderWithSubcomponents+127j ...
		add	word ptr [bp+var_28], 1Eh
		inc	di

loc_3247E:				; CODE XREF: Model_RenderWithSubcomponents+108j
		cmp	di, 14h
		jl	short loc_3242B
		mov	dword_6EA68, 0
		pop	di
		pop	si
		leave
		retf
Model_RenderWithSubcomponents	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,72L — variante simplifiée orchestrant sub_31E87 avec position par défaut (0,0,0) : rendu
; d'un modèle 3D statique (sans sous-composants mobiles).
; ==============================================================================================
Model_RenderStatic	proc far		; CODE XREF: seg077:0640P

var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		mov	dx, [bp+arg_0]
		mov	[bp+var_2], 0

loc_3249E:
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
		lea	ax, [bp+var_1C]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		mov	[bp+var_20], 0
		lea	ax, [bp+var_20]
		push	ax
		push	[bp+arg_2]
		lea	ax, [bp+var_12]
		push	ax
		push	[bp+var_14]
		push	[bp+var_2]
		push	dx
		push	cs
		call	near ptr Model_RenderMain
		add	sp, 14h
		or	al, al
		jz	short loc_32522
		mov	al, 1

loc_32520:
		jmp	short locret_32524
; ���������������������������������������������������������������������������

loc_32522:				; CODE XREF: Model_RenderStatic+8Cj
		mov	al, 0

locret_32524:				; CODE XREF: Model_RenderStatic:loc_32520j
		leave
		retf
Model_RenderStatic	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,36L — wrapper vers sub_31E87 avec position fixe insérée : wrapper de rendu de modèle 3D
; à une position donnée.
; ==============================================================================================
Model_RenderAtPosition	proc far		; CODE XREF: Terrain_ProcessAdjacentPatches+BBP

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

loc_32540:
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+var_2]
		push	dx
		push	cs
		call	near ptr Model_RenderMain
		add	sp, 14h
		leave
		retf
Model_RenderAtPosition	endp

; ���������������������������������������������������������������������������

loc_32559:				; DATA XREF: seg339:4DF8o
		push	bp
		mov	bp, sp
		mov	dword_725A2, 0
		mov	byte_725A6, 2
		mov	byte_725A7, 0
		mov	dword_725A8, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3257A:				; DATA XREF: seg339:4F06o
		push	bp
		mov	bp, sp

loc_3257D:
		cmp	byte_725A7, 0

loc_32582:
		jz	short loc_325A2

loc_32584:
		cmp	dword_725A2, 0
		jz	short loc_325A2
		push	0
		mov	al, byte_725A6
		push	ax
		push	54F2h
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_325A2:				; CODE XREF: seg070:loc_32582j
					; seg070:09DAj
		mov	dword_725A2, 0
		mov	byte_725A7, 0

loc_325B0:
		mov	dword_725A8, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_325BB:				; DATA XREF: seg339:197Ao
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_32626
		mov	word ptr [si], 1976h
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		cmp	byte ptr [si+0Dh], 0
		jz	short loc_325FA
		cmp	dword ptr [si+8], 0
		jz	short loc_325FA
		push	0
		mov	al, [si+0Ch]
		push	ax
		mov	ax, si
		add	ax, 8
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_325FA:				; CODE XREF: seg070:0A28j seg070:0A2Fj
		mov	dword ptr [si+8], 0
		mov	byte ptr [si+0Dh], 0
		mov	dword ptr [si+0Eh], 0
		push	0
		push	si
		call	TerrainTile_DestructSimple
		add	sp, 4
		test	di, 1
		jz	short loc_32626
		push	si

loc_32620:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_32626:				; CODE XREF: seg070:0A18j seg070:0A6Dj
		pop	di
		pop	si
		pop	bp
		retf
seg070		ends
