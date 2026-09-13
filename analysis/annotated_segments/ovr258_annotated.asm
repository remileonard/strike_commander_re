ovr258		segment	para public 'OVERLAY' use16
		assume cs:ovr258
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (CRT_Malloc16_Retry, 41 lignes).
; ==============================================================================================
UIWidget_Allocate_8D210	proc far		; CODE XREF: VROOMM_StubThunk_6B570J

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_8D22C
		push	11h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_8D261

loc_8D22C:				; CODE XREF: UIWidget_Allocate_8D210+Cj
		mov	word ptr [si], 0DD6h
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	[si+0Dh], eax

loc_8D240:
		mov	eax, [si+0Dh]
		mov	[si+9],	eax
		mov	byte ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+3], 0FFh
		mov	byte ptr [si+6], 0
		mov	byte ptr [si+7], 0FFh
		mov	byte ptr [si+8], 1

loc_8D261:				; CODE XREF: UIWidget_Allocate_8D210+1Aj
		mov	ax, si
		pop	si
		leave
		retf
UIWidget_Allocate_8D210	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (16 lignes).
; ==============================================================================================
UIWidget_Helper_8D266	proc far		; CODE XREF: VROOMM_StubThunk_6B57AJ UIWidget_Helper3_8D3C3+19p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+2], 1

loc_8D271:
		mov	dword ptr [si+9], 0
		pop	si
		pop	bp
		retf
UIWidget_Helper_8D266	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (10 lignes).
; ==============================================================================================
UIWidget_Helper2_8D27C	proc far		; CODE XREF: VROOMM_StubThunk_6B575J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
UIWidget_Helper2_8D27C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle List_FindActiveByCode.
; ==============================================================================================
UIWidget_FindActiveByCode_8D284	proc far		; CODE XREF: VROOMM_StubThunk_6B57FJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [si+4]

loc_8D28F:
		mov	byte ptr [si+2], 0

loc_8D293:
		push	word ptr [si+4]
		nop

loc_8D297:
		push	cs

loc_8D298:
		call	near ptr UIWidget_Helper7_8D61F
		pop	cx

loc_8D29C:
		mov	word ptr [si+4], 0

loc_8D2A1:
		cmp	byte ptr [di+38h], 52h ; 'R'

loc_8D2A5:
		jnz	short loc_8D2C5
		push	4Ch ; 'L'
		push	word_6DE62
		call	List_FindActiveByCode
		add	sp, 4
		mov	dx, ax
		or	dx, dx
		jz	short loc_8D2C5
		push	ax
		push	di
		nop
		push	cs
		call	near ptr UIWidget_Helper3_8D3C3
		add	sp, 4

loc_8D2C5:				; CODE XREF: UIWidget_FindActiveByCode_8D284:loc_8D2A5j
					; UIWidget_FindActiveByCode_8D284+35j
		pop	di
		pop	si
		pop	bp
		retf
UIWidget_FindActiveByCode_8D284	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Widget_Method_Dispatch8_6083F/DispatchC_60861 (seg163).
; ==============================================================================================
UIWidget_DispatchLayout_8D2C9	proc far		; CODE XREF: VROOMM_StubThunk_6B58EJ UIWidget_ConstructStyled_8D323+4Fp

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [si+37h], 0FFh
		mov	word ptr [si+39h], 0
		mov	di, word_6E341
		mov	word ptr [di+10h], 1
		mov	word ptr [di+12h], 0
		mov	word ptr [di+14h], 3
		mov	ax, word_6E341
		mov	[bp+var_2], ax
		mov	[si+14h], ax
		mov	byte ptr [si+45h], 0D9h	; '�'
		mov	byte ptr [si+46h], 0DCh	; '�'
		mov	byte ptr [si+47h], 0DFh	; '�'
		mov	al, [si+46h]
		push	ax
		push	si
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		mov	al, [si+45h]
		push	ax
		push	si
		call	Widget_Method_DispatchC_60861
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
UIWidget_DispatchLayout_8D2C9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue et applique un style (Widget_ApplyStyleAndAllocate_607E1, seg163).
; ==============================================================================================
UIWidget_ConstructStyled_8D323	proc far		; CODE XREF: VROOMM_StubThunk_6B584J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_8D33C
		push	48h ; 'H'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_8D376

loc_8D33C:				; CODE XREF: UIWidget_ConstructStyled_8D323+9j
		push	0

loc_8D33E:
		push	word_70E60
		push	si
		call	Widget_ApplyStyleAndAllocate_607E1
		add	sp, 6
		mov	word ptr [si], 0DB6h

loc_8D34F:
		mov	word ptr [si+1Bh], 0

loc_8D354:
		mov	word ptr [si+1Dh], 0
		mov	byte ptr [si+28h], 0
		mov	word ptr [si+29h], 0
		mov	word ptr [si+2Bh], 0
		mov	byte ptr [si+36h], 0
		mov	ax, si
		add	ax, 3Bh	; ';'
		push	si
		push	cs
		call	near ptr UIWidget_DispatchLayout_8D2C9
		pop	cx

loc_8D376:				; CODE XREF: UIWidget_ConstructStyled_8D323+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
UIWidget_ConstructStyled_8D323	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère 3 listes de style (TextFormat_ReleaseStyleList_5E526 ×3, seg143).
; ==============================================================================================
UIWidget_ReleaseStyles_8D37B	proc far		; CODE XREF: VROOMM_StubThunk_6B589J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_8D3BF
		mov	word ptr [si], 0DB6h
		mov	ax, si

loc_8D390:
		add	ax, 29h	; ')'
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		mov	ax, si
		add	ax, 1Bh
		push	ax

loc_8D3A0:
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		test	di, 1
		jz	short loc_8D3BF
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_8D3BF:				; CODE XREF: UIWidget_ReleaseStyles_8D37B+Dj
					; UIWidget_ReleaseStyles_8D37B+3Bj
		pop	di
		pop	si
		pop	bp
		retf
UIWidget_ReleaseStyles_8D37B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (34 lignes).
; ==============================================================================================
UIWidget_Helper3_8D3C3	proc far		; CODE XREF: VROOMM_StubThunk_6B5B1J UIWidget_FindActiveByCode_8D284+3Bp

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	byte ptr [si+37h], 1
		mov	ax, [di+43h]
		mov	[si+43h], ax
		push	word ptr [si+43h]
		push	cs
		call	near ptr UIWidget_Helper_8D266
		pop	cx
		mov	bx, [si+43h]
		mov	[bx+4],	si
		mov	ax, si
		add	ax, 29h	; ')'
		push	ax
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		mov	byte ptr [di+37h], 0
		mov	word ptr [di+43h], 0
		pop	di
		pop	si
		pop	bp
		retf
UIWidget_Helper3_8D3C3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, applique deux styles (TextFormat_ApplyStyleAttributeB_5E329 ×2, seg143).
; ==============================================================================================
UIWidget_ApplyDualStyleB_8D401	proc far		; CODE XREF: VROOMM_StubThunk_6B5A7J UIWidget_LoadDefinitionFromIFF_8D66C+21Cp

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h
arg_14		= word ptr  1Ah
arg_16		= word ptr  1Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	ax, [bp+arg_2]
		mov	[si+19h], ax
		mov	ax, [bp+arg_4]
		mov	[si+39h], ax
		mov	al, [bp+arg_6]
		mov	[si+38h], al
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	[bp+arg_A]
		push	[bp+arg_8]
		push	si
		nop
		push	cs
		call	near ptr UIWidget_Helper4_8D495
		add	sp, 0Ah

loc_8D442:
		push	[bp+arg_16]

loc_8D445:
		push	[bp+arg_14]

loc_8D448:
		push	[bp+arg_12]
		push	[bp+arg_10]

loc_8D44E:
		push	si
		nop
		push	cs

loc_8D451:
		call	near ptr UIWidget_Helper5_8D52E
		add	sp, 0Ah
		mov	ax, [si+19h]
		add	ax, 10h
		push	ax
		mov	ax, si
		add	ax, 1Bh
		push	ax
		call	TextFormat_ApplyStyleAttributeB_5E329
		add	sp, 4
		mov	ax, [si+19h]
		add	ax, 2
		push	ax
		mov	ax, si
		add	ax, 29h	; ')'
		push	ax
		call	TextFormat_ApplyStyleAttributeB_5E329
		add	sp, 4
		mov	ax, word_6E341
		mov	[bp+var_2], ax
		mov	[si+14h], ax
		mov	byte ptr [si+16h], 4

loc_8D48E:
		mov	byte ptr [si+37h], 0
		pop	si
		leave
		retf
UIWidget_ApplyDualStyleB_8D401	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (82 lignes).
; ==============================================================================================
UIWidget_Helper4_8D495	proc far		; CODE XREF: VROOMM_StubThunk_6B593J UIWidget_ApplyDualStyleB_8D401+3Bp

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
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]

loc_8D4A3:
		mov	cx, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	[bp+var_2], dx
		mov	[bp+var_4], cx
		mov	ax, dx
		add	ax, di
		dec	ax
		mov	[bp+var_6], ax
		mov	ax, cx
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+1Fh], ax
		mov	ax, [bp+var_4]
		mov	[si+21h], ax
		mov	ax, [bp+var_6]
		mov	[si+23h], ax
		mov	ax, [bp+var_8]
		mov	[si+25h], ax
		mov	[bp+var_A], dx
		mov	[bp+var_C], cx
		mov	ax, dx
		add	ax, di
		dec	ax
		mov	[bp+var_E], ax
		mov	ax, cx
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_10], ax
		mov	ax, [bp+var_A]
		mov	[si+2Dh], ax
		mov	ax, [bp+var_C]
		mov	[si+2Fh], ax
		mov	ax, [bp+var_E]
		mov	[si+31h], ax
		mov	ax, [bp+var_10]
		mov	[si+33h], ax
		mov	ax, di
		dec	ax
		mov	[bp+var_12], ax
		mov	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_14], ax
		mov	word ptr [si+3Bh], 0
		mov	word ptr [si+3Dh], 0
		mov	ax, [bp+var_12]
		mov	[si+3Fh], ax
		mov	ax, [bp+var_14]
		mov	[si+41h], ax
		pop	di
		pop	si
		leave
		retf
UIWidget_Helper4_8D495	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (44 lignes).
; ==============================================================================================
UIWidget_Helper5_8D52E	proc far		; CODE XREF: VROOMM_StubThunk_6B598J
					; UIWidget_ApplyDualStyleB_8D401:loc_8D451p

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	cx, [bp+arg_4]
		add	dx, [si+2Dh]
		add	cx, [si+2Fh]
		mov	[bp+var_2], dx
		mov	[bp+var_4], cx
		mov	ax, dx
		add	ax, [bp+arg_6]
		dec	ax
		mov	[bp+var_6], ax
		mov	ax, cx
		add	ax, [bp+arg_8]
		dec	ax
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+3Bh], ax
		mov	ax, [bp+var_4]
		mov	[si+3Dh], ax
		mov	ax, [bp+var_6]
		mov	[si+3Fh], ax
		mov	ax, [bp+var_8]
		mov	[si+41h], ax
		pop	si
		leave
		retf
UIWidget_Helper5_8D52E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine styles de texte et Widget_ComputeAndStoreBounds_60883 (seg163).
; ==============================================================================================
UIWidget_ApplyStyleAndBounds_8D577	proc far		; CODE XREF: VROOMM_StubThunk_6B59DJ UIWidget_Helper8_8DB1A+1Fp

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+37h], 0
		jnz	short loc_8D5FC
		mov	byte ptr [si+37h], 1
		mov	ax, [si+19h]
		add	ax, 10h
		push	ax
		mov	ax, si

loc_8D594:
		add	ax, 1Bh

loc_8D597:
		push	ax

loc_8D598:
		call	TextFormat_ApplyStyleAttributeB_5E329

loc_8D59D:
		add	sp, 4
		mov	ax, [si+19h]

loc_8D5A3:
		add	ax, 2
		push	ax
		mov	ax, si
		add	ax, 29h	; ')'
		push	ax
		call	TextFormat_ApplyStyleAttributeB_5E329
		add	sp, 4
		mov	ax, si
		add	ax, 29h	; ')'
		mov	[bp+var_2], ax
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		push	word ptr [si+41h]
		push	word ptr [si+3Fh]
		push	word ptr [si+3Dh]
		push	word ptr [si+3Bh]
		push	si
		call	Widget_ComputeAndStoreBounds_60883
		add	sp, 0Ah
		mov	ax, [bp+arg_2]
		mov	[si+43h], ax
		mov	bx, [si+43h]
		mov	[bx+4],	si
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+4]
		pop	cx
		mov	bx, [si+19h]
		mov	byte ptr [bx+21Fh], 1

loc_8D5FC:				; CODE XREF: UIWidget_ApplyStyleAndBounds_8D577+Ej
		pop	si
		leave
		retf
UIWidget_ApplyStyleAndBounds_8D577	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (20 lignes).
; ==============================================================================================
UIWidget_Helper6_8D5FF	proc far		; CODE XREF: VROOMM_StubThunk_6B5ACJ UIWidget_Helper7_8D61F+17p	...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+37h], 0
		jz	short loc_8D61C
		mov	bx, [si+43h]
		mov	byte ptr [bx+2], 0
		mov	word ptr [si+43h], 0
		mov	byte ptr [si+37h], 0

loc_8D61C:				; CODE XREF: UIWidget_Helper6_8D5FF+Bj
		pop	si
		pop	bp
		retf
UIWidget_Helper6_8D5FF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (23 lignes).
; ==============================================================================================
UIWidget_Helper7_8D61F	proc far		; CODE XREF: VROOMM_StubThunk_6B5A2J
					; UIWidget_FindActiveByCode_8D284:loc_8D298p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+37h], 0
		jz	short loc_8D63A
		mov	bx, [si+19h]
		mov	byte ptr [bx+21Fh], 1
		push	si
		push	cs
		call	near ptr UIWidget_Helper6_8D5FF
		pop	cx

loc_8D63A:				; CODE XREF: UIWidget_Helper7_8D61F+Bj
		pop	si
		pop	bp
		retf
UIWidget_Helper7_8D61F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CRT_FreeNear_Wrap.
; ==============================================================================================
UIWidget_ReleaseFree_8D63D	proc far		; CODE XREF: VROOMM_StubThunk_6B5BBJ UIWidget_LoadDefinitionFromIFF_8D66C+27Bp ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	dx, dx
		jz	short loc_8D669
		cmp	word ptr [si+0C2h], 8
		jge	short loc_8D662

loc_8D652:
		mov	bx, [si+0C2h]
		inc	word ptr [si+0C2h]
		shl	bx, 1
		mov	[bx+si+0B2h], dx
		jmp	short loc_8D669
; ���������������������������������������������������������������������������

loc_8D662:				; CODE XREF: UIWidget_ReleaseFree_8D63D+13j
		push	dx
		call	CRT_FreeNear_Wrap
		pop	cx

loc_8D669:				; CODE XREF: UIWidget_ReleaseFree_8D63D+Cj
					; UIWidget_ReleaseFree_8D63D+23j
		pop	si
		pop	bp
		retf
UIWidget_ReleaseFree_8D63D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 394 lignes, NON DÉTAILLÉE — lit une douzaine de champs IFF (ReadFinalField_64B51
; répété) — chargement de définition de widget.
; ==============================================================================================
UIWidget_LoadDefinitionFromIFF_8D66C	proc far		; CODE XREF: VROOMM_StubThunk_6B5C0J

var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	word_6DE62, si
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	ax, [bp+arg_2]
		mov	[si+0C4h], ax
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8D6D7
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+0C6h], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+0C7h], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+0C8h], al
		mov	eax, [di+76h]
		mov	[di+65h], eax
		mov	byte ptr [di+6Dh], 0

loc_8D6D7:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+3Cj
		push	0
		push	large 50414853h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8D6EF
		jmp	loc_8D814
; ���������������������������������������������������������������������������

loc_8D6EF:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+7Ej
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_2], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_4], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_6], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_8], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_A], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_C], ax
		mov	[bp+var_16], 0
		mov	byte ptr [bp+var_12], 2
		mov	byte ptr [bp+var_12+1],	0
		mov	[bp+var_12+2], 0

loc_8D743:
		mov	eax, [di+72h]
		mov	[bp+var_1A], eax
		mov	eax, [di+65h]
		mov	edx, [di+69h]
		add	edx, 8
		sub	eax, edx
		sub	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_22+2],	dx
		mov	word ptr [bp+var_22], ax
		mov	eax, [bp+var_22]
		mov	[bp+var_16], eax
		mov	byte ptr [bp+var_12], 3
		mov	byte ptr [bp+var_12+1],	1
		mov	[bp+var_12+2], 0
		mov	eax, [bp+var_1E]
		mov	[bp+var_12+2], eax
		push	large [bp+var_1A]

loc_8D7A3:
		push	0
		mov	al, byte ptr [bp+var_12]
		push	ax
		push	large [bp+var_16]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		lea	ax, [bp+var_16]
		push	ax
		push	si
		call	CachedObject_DestructHelper_5DE34
		add	sp, 4
		mov	eax, [di+76h]
		mov	[di+65h], eax
		mov	byte ptr [di+6Dh], 0
		cmp	byte ptr [bp+var_12+1],	0
		jz	short loc_8D800
		cmp	[bp+var_16], 0
		jz	short loc_8D800
		push	0
		mov	al, byte ptr [bp+var_12]
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_8D800:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+174j
					; UIWidget_LoadDefinitionFromIFF_8D66C+17Bj
		mov	[bp+var_16], 0
		mov	byte ptr [bp+var_12+1],	0
		mov	[bp+var_12+2], 0

loc_8D814:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+80j
		push	0
		push	large 544F5053h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8D82C
		jmp	loc_8D8AC
; ���������������������������������������������������������������������������

loc_8D82C:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+1BBj
		mov	eax, [di+72h]
		mov	ebx, 5
		cdq
		idiv	ebx
		mov	word ptr [bp+var_16+2],	ax
		mov	word ptr [bp+var_16], 0

loc_8D843:
		jmp	short loc_8D891
; ���������������������������������������������������������������������������

loc_8D845:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+232j
		push	large 5
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		push	[bp+var_C]
		push	[bp+var_A]
		push	[bp+var_8]
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	large [bp+var_12+1]
		mov	al, byte ptr [bp+var_12]
		push	ax
		push	si
		push	[bp+arg_2]
		mov	ax, [si+0B0h]
		inc	word ptr [si+0B0h]
		imul	ax, 48h
		mov	dx, si
		add	dx, ax
		add	dx, 20h	; ' '
		push	dx
		push	cs
		call	near ptr UIWidget_ApplyDualStyleB_8D401
		add	sp, 18h
		inc	word ptr [bp+var_16]

loc_8D891:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C:loc_8D843j
		mov	ax, word ptr [bp+var_16]

loc_8D894:
		cmp	ax, word ptr [bp+var_16+2]
		jge	short loc_8D8A0
		cmp	word ptr [si+0B0h], 2
		jl	short loc_8D845

loc_8D8A0:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+22Bj
		mov	eax, [di+76h]
		mov	[di+65h], eax
		mov	byte ptr [di+6Dh], 0

loc_8D8AC:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+1BDj
		push	0
		push	large 5344464Dh
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_8D8C4
		jmp	loc_8D9EB
; ���������������������������������������������������������������������������

loc_8D8C4:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+253j
		push	0
		push	large 4D4D4F43h
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_8D8F4
		push	di
		push	0
		call	VROOMM_StubThunk_6B250
		add	sp, 4
		push	ax
		push	si
		push	cs
		call	near ptr UIWidget_ReleaseFree_8D63D
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_8D8F4:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+26Bj
		push	0
		push	large 44524141h
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_8D924
		push	di
		push	0
		call	VROOMM_StubThunk_6B600
		add	sp, 4
		push	ax
		push	si
		push	cs
		call	near ptr UIWidget_ReleaseFree_8D63D
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_8D924:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+29Bj
		push	0
		push	large 44524741h
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_8D954
		push	di
		push	0
		call	VROOMM_StubThunk_6B605
		add	sp, 4
		push	ax
		push	si
		push	cs
		call	near ptr UIWidget_ReleaseFree_8D63D
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_8D954:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+2CBj
		push	0
		push	large 50414557h
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_8D984
		push	di
		push	0
		call	VROOMM_StubThunk_6B6D0
		add	sp, 4
		push	ax
		push	si
		push	cs
		call	near ptr UIWidget_ReleaseFree_8D63D
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_8D984:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+2FBj
		push	0
		push	large 474D4144h
		push	di
		call	ResourceRecord_SeekAndReadB_647B2

loc_8D992:
		add	sp, 8

loc_8D995:
		or	ax, ax
		jz	short loc_8D9B4
		push	di
		push	0

loc_8D99C:
		call	VROOMM_StubThunk_6B6D5

loc_8D9A1:
		add	sp, 4

loc_8D9A4:
		push	ax
		push	si
		push	cs

loc_8D9A7:
		call	near ptr UIWidget_ReleaseFree_8D63D
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_8D9B4:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+32Bj
		push	0
		push	large 4D414347h
		push	di
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jz	short loc_8D9E4
		push	di
		push	0
		call	VROOMM_StubThunk_6B16F
		add	sp, 4
		push	ax
		push	si
		push	cs
		call	near ptr UIWidget_ReleaseFree_8D63D
		add	sp, 4
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_8D9E4:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+35Bj
		push	di
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_8D9EB:				; CODE XREF: UIWidget_LoadDefinitionFromIFF_8D66C+255j
		pop	di
		pop	si
		leave
		retf
UIWidget_LoadDefinitionFromIFF_8D66C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine CRT_Doprnt_Core (formatage), CachedObject_Destruct_5DC87 (seg141).
; ==============================================================================================
UIWidget_ReleaseAndDestruct_8D9EF	proc far		; CODE XREF: VROOMM_StubThunk_6B5B6J

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
		jz	short loc_8DA5D
		mov	[bp+var_2], 0
		jmp	short loc_8DA1A
; ���������������������������������������������������������������������������

loc_8DA08:				; CODE XREF: UIWidget_ReleaseAndDestruct_8D9EF+32j
		mov	bx, [bp+var_2]
		shl	bx, 1
		push	word ptr [bx+si+0B2h]
		call	CRT_FreeNear_Wrap
		pop	cx
		inc	[bp+var_2]

loc_8DA1A:				; CODE XREF: UIWidget_ReleaseAndDestruct_8D9EF+17j
		mov	ax, [si+0C2h]
		cmp	ax, [bp+var_2]
		jg	short loc_8DA08
		mov	word_6DE62, 0
		push	seg stub258
		push	offset VROOMM_StubThunk_6B589
		push	large 10002h
		push	48h ; 'H'
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	2
		push	si
		call	CachedObject_Destruct_5DC87
		add	sp, 4
		test	di, 1
		jz	short loc_8DA5D
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_8DA5D:				; CODE XREF: UIWidget_ReleaseAndDestruct_8D9EF+10j
					; UIWidget_ReleaseAndDestruct_8D9EF+65j
		pop	di
		pop	si
		leave
		retf
UIWidget_ReleaseAndDestruct_8D9EF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, gestion d'erreur (thunk voisin, 122 lignes).
; ==============================================================================================
UIWidget_ErrorCheckWrapper_8DA61	proc far		; CODE XREF: VROOMM_StubThunk_6B5C5J UIWidget_Helper8_8DB1A+13p

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, 0FFFFh
		mov	[bp+arg_2], 52h	; 'R'
		xor	cx, cx
		jmp	short loc_8DA8F
; ���������������������������������������������������������������������������

loc_8DA74:				; CODE XREF: UIWidget_ErrorCheckWrapper_8DA61+32j
		mov	bx, cx
		imul	bx, 48h
		mov	al, [bx+si+58h]
		cmp	al, [bp+arg_2]
		jnz	short loc_8DA8E
		mov	bx, cx
		imul	bx, 48h
		cmp	byte ptr [bx+si+57h], 0
		jnz	short loc_8DA8E
		mov	dx, cx

loc_8DA8E:				; CODE XREF: UIWidget_ErrorCheckWrapper_8DA61+1Ej
					; UIWidget_ErrorCheckWrapper_8DA61+29j
		inc	cx

loc_8DA8F:				; CODE XREF: UIWidget_ErrorCheckWrapper_8DA61+11j
		cmp	[si+0B0h], cx
		jg	short loc_8DA74

loc_8DA95:
		cmp	dx, 0FFFFh
		jnz	short loc_8DAB2
		xor	cx, cx
		jmp	short loc_8DAAC
; ���������������������������������������������������������������������������

loc_8DA9E:				; CODE XREF: UIWidget_ErrorCheckWrapper_8DA61+4Fj
		mov	bx, cx
		imul	bx, 48h
		cmp	byte ptr [bx+si+57h], 0
		jnz	short loc_8DAAB
		mov	dx, cx

loc_8DAAB:				; CODE XREF: UIWidget_ErrorCheckWrapper_8DA61+46j
		inc	cx

loc_8DAAC:				; CODE XREF: UIWidget_ErrorCheckWrapper_8DA61+3Bj
		cmp	[si+0B0h], cx
		jg	short loc_8DA9E

loc_8DAB2:				; CODE XREF: UIWidget_ErrorCheckWrapper_8DA61+37j
		cmp	word ptr [si+0B0h], 0
		jz	short loc_8DAF2
		cmp	dx, 0FFFFh
		jnz	short loc_8DAF2
		mov	di, word_6DE64
		inc	di
		jmp	short loc_8DAEC
; ���������������������������������������������������������������������������

loc_8DAC5:				; CODE XREF: UIWidget_ErrorCheckWrapper_8DA61+8Fj
		cmp	[si+0B0h], di
		jle	short loc_8DAE1
		mov	ax, di
		imul	ax, 48h
		mov	dx, si
		add	dx, ax
		add	dx, 20h	; ' '
		push	dx
		push	cs
		call	near ptr UIWidget_Helper6_8D5FF
		pop	cx
		mov	dx, di
		jmp	short loc_8DAF2
; ���������������������������������������������������������������������������

loc_8DAE1:				; CODE XREF: UIWidget_ErrorCheckWrapper_8DA61+68j
		inc	di
		mov	ax, di
		cmp	ax, [si+0B0h]
		jl	short loc_8DAEC
		xor	di, di

loc_8DAEC:				; CODE XREF: UIWidget_ErrorCheckWrapper_8DA61+62j
					; UIWidget_ErrorCheckWrapper_8DA61+87j
		cmp	di, word_6DE64
		jnz	short loc_8DAC5

loc_8DAF2:				; CODE XREF: UIWidget_ErrorCheckWrapper_8DA61+56j
					; UIWidget_ErrorCheckWrapper_8DA61+5Bj ...
		mov	word_6DE64, dx
		cmp	dx, 0FFFFh
		jnz	short loc_8DB08
		push	700Ch
		call	VROOMM_StubThunk_6B70F
		pop	cx
		xor	ax, ax
		jmp	short loc_8DB16
; ���������������������������������������������������������������������������

loc_8DB08:				; CODE XREF: UIWidget_ErrorCheckWrapper_8DA61+98j
		mov	ax, dx
		imul	ax, 48h
		push	ax
		mov	ax, si
		pop	dx
		add	ax, dx
		add	ax, 20h	; ' '

loc_8DB16:				; CODE XREF: UIWidget_ErrorCheckWrapper_8DA61+A5j
		pop	di
		pop	si
		pop	bp
		retf
UIWidget_ErrorCheckWrapper_8DA61	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (28 lignes).
; ==============================================================================================
UIWidget_Helper8_8DB1A	proc far		; CODE XREF: VROOMM_StubThunk_6B5CAJ

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	dx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	al, [si+3]
		push	ax
		push	dx
		push	cs
		call	near ptr UIWidget_ErrorCheckWrapper_8DA61
		add	sp, 4
		mov	[bp+var_2], ax
		push	si
		push	ax
		push	cs
		call	near ptr UIWidget_ApplyStyleAndBounds_8D577
		add	sp, 4
		pop	si
		leave
		retf
UIWidget_Helper8_8DB1A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (46 lignes).
; ==============================================================================================
UIWidget_Helper9_8DB42	proc far		; CODE XREF: VROOMM_StubThunk_6B5CFJ

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		xor	dx, dx
		jmp	short loc_8DB67
; ���������������������������������������������������������������������������

loc_8DB4D:				; CODE XREF: UIWidget_Helper9_8DB42+29j
		mov	bx, dx
		shl	bx, 1
		mov	bx, [bx+si+0B2h]
		mov	word ptr [bx+4], 0
		mov	bx, dx
		shl	bx, 1
		mov	bx, [bx+si+0B2h]
		mov	byte ptr [bx+2], 0
		inc	dx

loc_8DB67:				; CODE XREF: UIWidget_Helper9_8DB42+9j
		cmp	[si+0C2h], dx
		jg	short loc_8DB4D
		xor	dx, dx
		jmp	short loc_8DB85
; ���������������������������������������������������������������������������

loc_8DB71:				; CODE XREF: UIWidget_Helper9_8DB42+47j
		mov	bx, dx
		imul	bx, 48h
		mov	word ptr [bx+si+63h], 0
		mov	bx, dx
		imul	bx, 48h
		mov	byte ptr [bx+si+57h], 0
		inc	dx

loc_8DB85:				; CODE XREF: UIWidget_Helper9_8DB42+2Dj
		cmp	[si+0B0h], dx
		jg	short loc_8DB71
		pop	si
		pop	bp
		retf
UIWidget_Helper9_8DB42	endp

ovr258		ends
