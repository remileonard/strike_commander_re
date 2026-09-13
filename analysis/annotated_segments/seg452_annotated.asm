seg452		segment	para public 'OVERLAY' use16
		assume cs:seg452
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 129 lignes, NON DÉTAILLÉE — combine Memory_TypedFreeWrapperC_5C6F3 (seg131),
; sub_6BA60/6BA65, ResourceRecord_SeekAndRead_64743, ReadFieldGroupC_64A7E (×2, seg193),
; PlayerComponent_ComputeSteppedRange_A6A52.
; ==============================================================================================
PlayerComponent_LoadAndComputeRange_A6900	proc far		; CODE XREF: VROOMM_StubThunk_6CCA5J

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_A6903:
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_A6935
		push	1
		push	0
		push	2
		push	large 0AEh ; '�'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_A6935
		jmp	loc_A6A49
; ���������������������������������������������������������������������������

loc_A6935:				; CODE XREF: PlayerComponent_LoadAndComputeRange_A6900+Fj
					; PlayerComponent_LoadAndComputeRange_A6900+30j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 1588h
		mov	word ptr es:[bx], 15C4h
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 2
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		mov	dword ptr es:[bx+12h], 0
		mov	byte ptr es:[bx+16h], 2
		mov	byte ptr es:[bx+17h], 0

loc_A6971:
		mov	dword ptr es:[bx+18h], 0
		mov	dword ptr es:[bx+1Ch], 0
		mov	byte ptr es:[bx+20h], 2
		mov	byte ptr es:[bx+21h], 0

loc_A698D:
		mov	dword ptr es:[bx+22h], 0
		xor	ax, ax
		mov	es:[bx+88h], ax
		mov	es:[bx+86h], ax
		xor	ax, ax
		mov	es:[bx+8Ch], ax
		mov	es:[bx+8Ah], ax
		push	word ptr [bp+arg_0+2]
		push	bx
		call	VROOMM_StubThunk_6BA60
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 32EAh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 9Eh	; '�'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0A2h ; '�'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0A6h ; '�'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0AAh ; '�'
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6BA65
		add	sp, 6
		push	0
		push	large 48544E4Ch
		push	si

loc_A6A00:
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A6A40
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_8], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr PlayerComponent_ComputeSteppedRange_A6A52
		add	sp, 8
		jmp	short loc_A6A49
; ���������������������������������������������������������������������������

loc_A6A40:				; CODE XREF: PlayerComponent_LoadAndComputeRange_A6900+10Aj
		push	0B001h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_A6A49:				; CODE XREF: PlayerComponent_LoadAndComputeRange_A6900+32j
					; PlayerComponent_LoadAndComputeRange_A6900+13Ej
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
PlayerComponent_LoadAndComputeRange_A6900	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, calcule un intervalle (delta = fin-début) et le stocke à 3 échelles (brut, /4, /40)
; dans les champs +0x9E/+0xA2/+0xA6/+0xAA — probable initialisation de paliers
; d'interpolation/animation.
; ==============================================================================================
PlayerComponent_ComputeSteppedRange_A6A52	proc far		; CODE XREF: VROOMM_StubThunk_6CCA0J PlayerComponent_LoadAndComputeRange_A6900+138p

var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	dx, [bp+arg_4]
		mov	si, [bp+arg_6]
		mov	di, dx
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		mov	es:[bx+9Eh], eax
		mov	di, dx
		mov	eax, [di]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]

loc_A6A83:
		mov	es:[bx+0A6h], eax
		mov	di, dx
		mov	eax, [si]
		sub	eax, [di]
		mov	[bp+var_10], eax
		mov	[bp+var_14], eax
		mov	[bp+var_C], eax
		mov	ebx, 4
		cdq
		idiv	ebx
		mov	[bp+var_C], eax
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+0A2h], eax
		mov	eax, [bp+var_C]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	bx, word ptr [bp+arg_0]
		mov	es:[bx+0AAh], eax
		pop	di
		pop	si
		leave
		retf
PlayerComponent_ComputeSteppedRange_A6A52	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle PlayerComponent_LoadListAndCompute_A6B09.
; ==============================================================================================
PlayerComponent_ComputeSteppedRangeWrapper_A6AE9	proc far		; CODE XREF: VROOMM_StubThunk_6CCAAJ

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_4]
		push	large [bp+arg_0]
		push	large 0
		nop
		push	cs
		call	near ptr PlayerComponent_LoadListAndCompute_A6B09
		add	sp, 0Ah
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		leave
		retf
PlayerComponent_ComputeSteppedRangeWrapper_A6AE9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedFreeWrapperC_5C6F3 et sub_6BB55.
; ==============================================================================================
PlayerComponent_LoadListAndCompute_A6B09	proc far		; CODE XREF: VROOMM_StubThunk_6CCAFJ PlayerComponent_ComputeSteppedRangeWrapper_A6AE9+12p

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_0], 0
		jnz	short loc_A6B3A
		push	1
		push	0
		push	2
		push	large 0B5h ; '�'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_A6B3A
		jmp	loc_A6BCF
; ���������������������������������������������������������������������������

loc_A6B3A:				; CODE XREF: PlayerComponent_LoadListAndCompute_A6B09+Bj
					; PlayerComponent_LoadListAndCompute_A6B09+2Cj
		push	[bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6BB55
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 32BEh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0A0h ; '�'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0A4h ; '�'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0A8h ; '�'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0ADh ; '�'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0B1h ; '�'
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+9Eh]

loc_A6B84:
		les	bx, [bp+arg_0]
		mov	es:[bx+0A0h], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0AAh]
		les	bx, [bp+arg_0]
		mov	es:[bx+0B1h], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0A6h]
		les	bx, [bp+arg_0]
		mov	es:[bx+0A8h], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0A2h]
		les	bx, [bp+arg_0]
		mov	es:[bx+0A4h], eax
		and	byte ptr es:[bx+9Fh], 0FEh
		mov	byte ptr es:[bx+0ACh], 5

loc_A6BCF:				; CODE XREF: PlayerComponent_LoadListAndCompute_A6B09+2Ej
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
PlayerComponent_LoadListAndCompute_A6B09	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_3C942 (initialisation de classe de base).
; ==============================================================================================
PlayerComponent_InitBaseClassMinimal_A6BD7	proc far		; CODE XREF: VROOMM_StubThunk_6CCB4J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	[bp+arg_4]
		push	large [bp+arg_0]
		call	IFF_LoadAngleParam
		add	sp, 6
		pop	bp
		retf
PlayerComponent_InitBaseClassMinimal_A6BD7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise une classe de base (sub_3C9BC), appelle
; PlayerComponent_SubHelperAJ_A6C4A, enregistre dans un conteneur (sub_6C00E).
; ==============================================================================================
PlayerComponentVariantAI_ConstructAndInit_A6BFB	proc far		; CODE XREF: VROOMM_StubThunk_6CCB9J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	51h ; 'Q'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A6C34
		push	ax
		call	WorldObject_BaseConstruct
		pop	cx
		mov	word ptr [si], 3232h
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr PlayerComponent_SubHelperAJ_A6C4A
		add	sp, 6
		mov	ax, si
		jmp	short loc_A6C36
; ���������������������������������������������������������������������������

loc_A6C34:				; CODE XREF: PlayerComponentVariantAI_ConstructAndInit_A6BFB+1Bj
		mov	ax, si

loc_A6C36:				; CODE XREF: PlayerComponentVariantAI_ConstructAndInit_A6BFB+37j
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		mov	ax, si
		pop	si
		leave
		retf
PlayerComponentVariantAI_ConstructAndInit_A6BFB	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_37C89, Matrix_BuildFromAngle_56D72 (seg116) et sub_4F20B.
; ==============================================================================================
PlayerComponent_SubHelperAJ_A6C4A	proc far		; CODE XREF: VROOMM_StubThunk_6CCBEJ PlayerComponentVariantAI_ConstructAndInit_A6BFB+2Fp

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		call	Debris_BodyAttachToSubpart
		add	sp, 6
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		mov	byte ptr [si+50h], 0
		or	byte ptr [si+4], 10h
		les	bx, [bp+var_4]
		mov	al, es:[bx+35h]
		mov	[si+50h], al
		push	si
		call	Config_IdentityAccessor
		pop	cx
		pop	si
		leave
		retf
PlayerComponent_SubHelperAJ_A6C4A	endp

seg452		ends
