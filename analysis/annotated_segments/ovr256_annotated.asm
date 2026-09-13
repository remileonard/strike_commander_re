ovr256		segment	para public 'OVERLAY' use16
		assume cs:ovr256
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocateur typé, UI_ResetSublist, CRT_Fmemcpy.
; ==============================================================================================
UISublist_ResetAndCopy_8C930	proc far		; CODE XREF: VROOMM_StubThunk_6B4D0J UISublist_Helper_8CA28+4Dp

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= dword	ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_0], 0
		jnz	short loc_8C95B
		push	1
		push	0
		push	2
		push	large 1Eh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_8C9B2

loc_8C95B:				; CODE XREF: UISublist_ResetAndCopy_8C930+Bj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0D4Eh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 2
		mov	ax, word ptr [bp+arg_0]
		add	ax, 6
		push	word ptr [bp+arg_0+2]
		push	bx
		call	UI_ResetSublist
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]

loc_8C982:
		mov	es:[bx+12h], eax
		mov	ax, [bp+arg_8]
		mov	word ptr [bp+var_4], ax
		mov	ax, [bp+arg_A]
		mov	word ptr [bp+var_4+2], ax

loc_8C993:
		mov	eax, [bp+var_4]

loc_8C997:
		mov	es:[bx+2], eax

loc_8C99C:
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0Ah

loc_8C9A2:
		push	word ptr [bp+arg_0+2]
		push	ax
		push	large [bp+arg_C]
		mov	cx, 8

loc_8C9AD:
		call	CRT_Fmemcpy

loc_8C9B2:				; CODE XREF: UISublist_ResetAndCopy_8C930+29j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		leave
		retf
UISublist_ResetAndCopy_8C930	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocateur typé et UI_ResetSublist.
; ==============================================================================================
UISublist_Reset_8C9BA	proc far		; CODE XREF: VROOMM_StubThunk_6B4E9J

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_8C9E2
		push	1
		push	0
		push	2
		push	large 2Ah ; '*'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_8CA20

loc_8C9E2:				; CODE XREF: UISublist_Reset_8C9BA+8j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0D4Eh
		push	word ptr [bp+arg_0+2]
		push	bx
		call	UI_ResetSublist
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0D46h
		mov	dword ptr es:[bx+1Eh], 0
		mov	byte ptr es:[bx+22h], 2
		mov	byte ptr es:[bx+23h], 0
		mov	dword ptr es:[bx+24h], 0
		mov	word ptr es:[bx+28h], 0

loc_8CA20:				; CODE XREF: UISublist_Reset_8C9BA+26j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
UISublist_Reset_8C9BA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFreeWrapper_5C6F3 (82 lignes).
; ==============================================================================================
UISublist_Helper_8CA28	proc far		; CODE XREF: VROOMM_StubThunk_6B4EEJ UISublist_ReleaseAndCount_8CD2C+3Fp	...

var_14		= word ptr -14h
var_12		= word ptr -12h
var_A		= dword	ptr -0Ah
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= word ptr  12h
arg_E		= dword	ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		cmp	[bp+arg_0], 0
		jnz	short loc_8CA57
		push	1
		push	0
		push	2
		push	large 2Ah ; '*'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8CA57
		jmp	loc_8CAF0
; ���������������������������������������������������������������������������

loc_8CA57:				; CODE XREF: UISublist_Helper_8CA28+Cj
					; UISublist_Helper_8CA28+2Aj
		push	large [bp+arg_E]
		sub	sp, 4
		mov	si, [bp+arg_C]
		mov	ax, [si]
		mov	[bp+var_14], ax
		mov	ax, [si+2]
		mov	[bp+var_12], ax
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr UISublist_ResetAndCopy_8C930
		add	sp, 10h
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0D46h
		mov	dword ptr es:[bx+1Eh], 0
		mov	byte ptr es:[bx+22h], 2
		mov	byte ptr es:[bx+23h], 0
		mov	dword ptr es:[bx+24h], 0
		les	bx, [bp+arg_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		mov	al, es:[bx+4]
		mov	[bp+var_5], al

loc_8CAB1:
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	es:[bx+1Eh], eax
		mov	al, [bp+var_5]
		mov	es:[bx+22h], al
		mov	byte ptr es:[bx+23h], 0
		mov	dword ptr es:[bx+24h], 0
		mov	eax, [bp+arg_8]
		mov	[bp+var_A], eax
		les	bx, [bp+var_A]
		mov	byte ptr es:[bx+5], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+23h], 1
		mov	word ptr es:[bx+28h], 0

loc_8CAF0:				; CODE XREF: UISublist_Helper_8CA28+2Cj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
UISublist_Helper_8CA28	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère 3 blocs typés (Memory_TypedFree_5C7B6 ×3).
; ==============================================================================================
UISublist_ReleaseTriple_8CAF9	proc far		; CODE XREF: VROOMM_StubThunk_6B4E4J

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_8CB0E
		jmp	loc_8CBAC
; ���������������������������������������������������������������������������

loc_8CB0E:				; CODE XREF: UISublist_ReleaseTriple_8CAF9+10j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0D4Eh
		mov	eax, es:[bx+1Ah]
		mov	[bp+var_4], eax
		xor	di, di
		jmp	short loc_8CB5A
; ���������������������������������������������������������������������������

loc_8CB23:				; CODE XREF: UISublist_ReleaseTriple_8CAF9+68j
		les	bx, [bp+var_4]
		cmp	dword ptr es:[bx], 0
		jz	short loc_8CB4A
		mov	eax, es:[bx]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, [bp+var_8]
		push	ax
		push	5C44h

loc_8CB40:
		call	Memory_TypedFree_5C7B6

loc_8CB45:
		add	sp, 8
		jmp	short $+2

loc_8CB4A:				; CODE XREF: UISublist_ReleaseTriple_8CAF9+32j
		les	bx, [bp+var_4]
		mov	dword ptr es:[bx], 0
		inc	di
		add	word ptr [bp+var_4], 4

loc_8CB5A:				; CODE XREF: UISublist_ReleaseTriple_8CAF9+28j
		les	bx, [bp+arg_0]
		cmp	es:[bx+18h], di
		jg	short loc_8CB23
		push	0
		push	2
		mov	eax, es:[bx+1Ah]
		mov	[bp+var_C], eax

loc_8CB70:
		lea	ax, [bp+var_C]

loc_8CB73:
		push	ax
		push	5C44h

loc_8CB77:
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_8CB7F:
		les	bx, [bp+arg_0]

loc_8CB82:
		mov	dword ptr es:[bx+1Ah], 0
		test	si, 1
		jz	short loc_8CBAC
		mov	eax, [bp+arg_0]
		mov	[bp+var_10], eax
		push	0
		push	2
		lea	ax, [bp+var_10]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_8CBAC:				; CODE XREF: UISublist_ReleaseTriple_8CAF9+12j
					; UISublist_ReleaseTriple_8CAF9+96j
		pop	di
		pop	si
		leave
		retf
UISublist_ReleaseTriple_8CAF9	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 136 lignes, NON DÉTAILLÉE — combine String_ConstructFromPtr (répété) et
; Memory_TypedFreeWrapper_5C6F3.
; ==============================================================================================
UISublist_ConstructStrings_8CBB0	proc far		; CODE XREF: VROOMM_StubThunk_6B4DAJ

var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 14h
		mov	dx, [bp+arg_4]
		mov	bx, [bp+arg_6]
		mov	al, [bp+arg_8]
		mov	ah, 0
		or	ax, ax
		jz	short loc_8CBD2
		cmp	ax, 1
		jz	short loc_8CBE8
		cmp	ax, 2
		jz	short loc_8CC3C
		jmp	loc_8CC8E
; ���������������������������������������������������������������������������

loc_8CBD2:				; CODE XREF: UISublist_ConstructStrings_8CBB0+13j
		push	bx
		push	dx
		push	large 0
		call	String_ConstructFromPtr
		add	sp, 8
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		jmp	loc_8CC8E
; ���������������������������������������������������������������������������

loc_8CBE8:				; CODE XREF: UISublist_ConstructStrings_8CBB0+18j
		mov	[bp+var_6], dx
		mov	[bp+var_8], bx
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		or	ax, dx
		jz	short loc_8CC2E
		push	[bp+var_8]
		push	[bp+var_6]
		push	dx
		push	word ptr [bp+var_C]
		call	String_ConstructFromPtr
		add	sp, 8
		les	bx, [bp+var_C]
		mov	word ptr es:[bx], 0D36h
		mov	dx, word ptr [bp+var_C+2]
		mov	ax, word ptr [bp+var_C]
		jmp	short loc_8CC34
; ���������������������������������������������������������������������������

loc_8CC2E:				; CODE XREF: UISublist_ConstructStrings_8CBB0+5Aj
		mov	dx, word ptr [bp+var_C+2]
		mov	ax, word ptr [bp+var_C]

loc_8CC34:				; CODE XREF: UISublist_ConstructStrings_8CBB0+7Cj
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		jmp	short loc_8CC8E
; ���������������������������������������������������������������������������

loc_8CC3C:				; CODE XREF: UISublist_ConstructStrings_8CBB0+1Dj
		mov	[bp+var_E], dx
		mov	[bp+var_10], bx
		push	1
		push	0
		push	2
		push	large 1Bh
		push	5C44h

loc_8CC4E:
		call	Memory_TypedFreeWrapper_5C6F3

loc_8CC53:
		add	sp, 0Ch

loc_8CC56:
		mov	word ptr [bp+var_14+2],	dx
		mov	word ptr [bp+var_14], ax
		or	ax, dx
		jz	short loc_8CC82
		push	[bp+var_10]
		push	[bp+var_E]
		push	dx
		push	word ptr [bp+var_14]
		call	String_ConstructFromPtr

loc_8CC6F:
		add	sp, 8
		les	bx, [bp+var_14]
		mov	word ptr es:[bx], 0D26h
		mov	dx, word ptr [bp+var_14+2]
		mov	ax, word ptr [bp+var_14]
		jmp	short loc_8CC88
; ���������������������������������������������������������������������������

loc_8CC82:				; CODE XREF: UISublist_ConstructStrings_8CBB0+AEj
		mov	dx, word ptr [bp+var_14+2]
		mov	ax, word ptr [bp+var_14]

loc_8CC88:				; CODE XREF: UISublist_ConstructStrings_8CBB0+D0j
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_8CC8E:				; CODE XREF: UISublist_ConstructStrings_8CBB0+1Fj
					; UISublist_ConstructStrings_8CBB0+35j ...
		push	large [bp+var_4]

loc_8CC92:
		push	large [bp+arg_0]

loc_8CC96:
		nop
		push	cs
		call	near ptr UISublist_Helper2_8CCA0
		add	sp, 8
		leave
		retf
UISublist_ConstructStrings_8CBB0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (50 lignes).
; ==============================================================================================
UISublist_Helper2_8CCA0	proc far		; CODE XREF: VROOMM_StubThunk_6B4DFJ UISublist_ConstructStrings_8CBB0+E8p

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp

loc_8CCA1:
		mov	bp, sp

loc_8CCA3:
		push	si
		les	bx, [bp+arg_0]

loc_8CCA7:
		cmp	word ptr es:[bx+16h], 0
		jle	short loc_8CCE3

loc_8CCAE:
		cmp	[bp+arg_4], 0

loc_8CCB3:
		jz	short loc_8CCE3
		les	bx, es:[bx+1Ah]
		push	es
		les	si, [bp+arg_0]
		mov	ax, es:[si+18h]
		shl	ax, 2
		add	bx, ax
		mov	ax, word ptr [bp+arg_4+2]
		mov	dx, word ptr [bp+arg_4]
		pop	es
		mov	es:[bx+2], ax
		mov	es:[bx], dx
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+18h]
		dec	word ptr es:[bx+16h]
		mov	al, 1
		jmp	short loc_8CCE5
; ���������������������������������������������������������������������������

loc_8CCE3:				; CODE XREF: UISublist_Helper2_8CCA0+Cj
					; UISublist_Helper2_8CCA0:loc_8CCB3j
		mov	al, 0

loc_8CCE5:				; CODE XREF: UISublist_Helper2_8CCA0+41j
		pop	si
		pop	bp
		retf
UISublist_Helper2_8CCA0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFreeWrapper_5C6F3 (29 lignes).
; ==============================================================================================
UISublist_ReleaseSimple_8CCE8	proc far		; CODE XREF: VROOMM_StubThunk_6B4D5J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+18h], 0
		mov	es:[bx+16h], dx
		push	1
		push	0
		push	2
		mov	ax, dx
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ch], dx
		mov	es:[bx+1Ah], ax
		mov	dx, es:[bx+1Ch]
		mov	ax, es:[bx+1Ah]
		pop	bp
		retf
UISublist_ReleaseSimple_8CCE8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocateurs typés et Struct_GetElementCountMinusOne_625CC (seg176).
; ==============================================================================================
UISublist_ReleaseAndCount_8CD2C	proc far		; CODE XREF: VROOMM_StubThunk_6B4F3J

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= word ptr  12h
arg_E		= dword	ptr  14h

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_8CD57
		push	1
		push	0
		push	2
		push	large 32h ; '2'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3

loc_8CD47:
		add	sp, 0Ch

loc_8CD4A:
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx

loc_8CD52:
		jnz	short loc_8CD57
		jmp	loc_8CDDC
; ���������������������������������������������������������������������������

loc_8CD57:				; CODE XREF: UISublist_ReleaseAndCount_8CD2C+8j
					; UISublist_ReleaseAndCount_8CD2C:loc_8CD52j
		push	large [bp+arg_E]
		push	[bp+arg_C]
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr UISublist_Helper_8CA28
		add	sp, 12h

loc_8CD71:
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0D1Eh
		mov	word ptr es:[bx+2Ah], 0
		push	0

loc_8CD81:
		les	bx, [bp+arg_8]

loc_8CD84:
		mov	al, es:[bx+4]
		push	ax
		push	large dword ptr	es:[bx]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_625CC

loc_8CD9F:
		les	bx, [bp+arg_0]

loc_8CDA2:
		mov	es:[bx+30h], ax
		push	1

loc_8CDA8:
		push	0
		push	2
		mov	ax, es:[bx+30h]
		shl	ax, 1
		shl	ax, 1
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		les	bx, [bp+arg_0]
		mov	es:[bx+2Eh], dx
		mov	es:[bx+2Ch], ax
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr UISublist_Helper3_8CDE4
		add	sp, 4

loc_8CDDC:				; CODE XREF: UISublist_ReleaseAndCount_8CD2C+28j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
UISublist_ReleaseAndCount_8CD2C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (28 lignes).
; ==============================================================================================
UISublist_Helper3_8CDE4	proc far		; CODE XREF: VROOMM_StubThunk_6B4F8J UISublist_ReleaseAndCount_8CD2C+AAp

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		xor	dx, dx
		jmp	short loc_8CDFE
; ���������������������������������������������������������������������������

loc_8CDEB:				; CODE XREF: UISublist_Helper3_8CDE4+25j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+2Ch]
		mov	ax, dx
		shl	ax, 1
		add	bx, ax
		mov	word ptr es:[bx], 0
		inc	dx

loc_8CDFE:				; CODE XREF: UISublist_Helper3_8CDE4+5j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+30h]
		shl	ax, 1
		cmp	ax, dx
		jg	short loc_8CDEB
		pop	bp
		retf
UISublist_Helper3_8CDE4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFreeWrapper_5C6F3 (59 lignes).
; ==============================================================================================
UISublist_ReleaseSimpleB_8CE0D	proc far		; CODE XREF: VROOMM_StubThunk_6B4FDJ UISublist_ReleaseSimpleC_8CEB2+48p

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= word ptr  12h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_8CE35
		push	1
		push	0
		push	2
		push	large 3Ch ; '<'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_8CE6A

loc_8CE35:				; CODE XREF: UISublist_ReleaseSimpleB_8CE0D+8j
		push	large [bp+arg_10]
		lea	ax, [bp+arg_C]
		push	ax
		push	large [bp+arg_8]

loc_8CE41:
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr UISublist_Helper_8CA28

loc_8CE4D:
		add	sp, 12h

loc_8CE50:
		les	bx, [bp+arg_0]

loc_8CE53:
		mov	word ptr es:[bx], 0D12h
		mov	ax, word ptr [bp+arg_0]
		add	ax, 38h	; '8'
		push	word ptr [bp+arg_0+2]
		push	bx
		nop
		push	cs
		call	near ptr UISublist_Helper4_8CE72
		add	sp, 4

loc_8CE6A:				; CODE XREF: UISublist_ReleaseSimpleB_8CE0D+26j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
UISublist_ReleaseSimpleB_8CE0D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (34 lignes).
; ==============================================================================================
UISublist_Helper4_8CE72	proc far		; CODE XREF: VROOMM_StubThunk_6B502J UISublist_ReleaseSimpleB_8CE0D+57p

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp

loc_8CE73:
		mov	bp, sp

loc_8CE75:
		sub	sp, 4

loc_8CE78:
		les	bx, [bp+arg_0]

loc_8CE7B:
		mov	dword ptr es:[bx+2Ah], 0
		mov	dword ptr es:[bx+2Eh], 0
		mov	word ptr es:[bx+32h], 0

loc_8CE93:
		mov	[bp+var_4], 0

loc_8CE9B:
		mov	eax, [bp+var_4]

loc_8CE9F:
		mov	es:[bx+38h], eax
		mov	word ptr es:[bx+36h], 0
		mov	word ptr es:[bx+34h], 0
		leave
		retf
UISublist_Helper4_8CE72	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Memory_TypedFreeWrapper_5C6F3 (51 lignes).
; ==============================================================================================
UISublist_ReleaseSimpleC_8CEB2	proc far		; CODE XREF: VROOMM_StubThunk_6B507J

var_8		= word ptr -8
var_6		= word ptr -6
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= dword	ptr  0Eh
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= dword	ptr  16h

		push	bp

loc_8CEB3:
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_8CEDA
		push	1
		push	0
		push	2
		push	large 3Ch ; '<'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_8CF08

loc_8CEDA:				; CODE XREF: UISublist_ReleaseSimpleC_8CEB2+8j
		push	large [bp+arg_10]
		sub	sp, 4
		mov	ax, [bp+arg_C]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_E]
		mov	[bp+var_6], ax
		push	large [bp+arg_8]
		push	large [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr UISublist_ReleaseSimpleB_8CE0D
		add	sp, 14h
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0D06h

loc_8CF08:				; CODE XREF: UISublist_ReleaseSimpleC_8CEB2+26j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
UISublist_ReleaseSimpleC_8CEB2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocateur typé et UI_ResetSublist.
; ==============================================================================================
UISublist_ResetB_8CF10	proc far		; CODE XREF: VROOMM_StubThunk_6B50CJ

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= byte ptr  16h
arg_12		= byte ptr  18h

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+arg_8]
		cmp	[bp+arg_0], 0
		jnz	short loc_8CF40
		push	1
		push	0
		push	2
		push	large 28h ; '('
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8CF40
		jmp	loc_8CFC5
; ���������������������������������������������������������������������������

loc_8CF40:				; CODE XREF: UISublist_ResetB_8CF10+Dj
					; UISublist_ResetB_8CF10+2Bj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0D4Eh
		push	word ptr [bp+arg_0+2]
		push	bx
		call	UI_ResetSublist

loc_8CF51:
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0CFEh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Eh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 22h	; '"'
		mov	word ptr es:[bx+16h], 0
		mov	word ptr es:[bx+18h], 0
		mov	dword ptr es:[bx+1Ah], 0
		mov	ax, [di]
		mov	es:[bx+6], ax
		mov	es:[bx+2], ax
		mov	si, [bp+arg_A]
		mov	ax, [si]
		mov	es:[bx+8], ax

loc_8CF90:
		mov	es:[bx+4], ax
		mov	si, [bp+arg_C]
		mov	ax, [si]
		mov	es:[bx+22h], ax

loc_8CF9D:
		mov	es:[bx+1Eh], ax
		mov	si, [bp+arg_E]

loc_8CFA4:
		mov	ax, [si]

loc_8CFA6:
		mov	es:[bx+24h], ax
		mov	es:[bx+20h], ax

loc_8CFAE:
		mov	al, [bp+arg_12]

loc_8CFB1:
		mov	es:[bx+26h], al
		mov	al, [bp+arg_10]
		mov	es:[bx+27h], al
		mov	eax, [bp+arg_4]
		mov	es:[bx+12h], eax

loc_8CFC5:				; CODE XREF: UISublist_ResetB_8CF10+2Dj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		pop	bp
		retf
UISublist_ResetB_8CF10	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocateur typé et UI_ResetSublist.
; ==============================================================================================
UISublist_ResetC_8CFCF	proc far		; CODE XREF: VROOMM_StubThunk_6B511J

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= byte ptr  12h
arg_E		= byte ptr  14h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		cmp	[bp+arg_0], 0
		jnz	short loc_8CFFE
		push	1
		push	0
		push	2
		push	large 28h ; '('
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jnz	short loc_8CFFE
		jmp	loc_8D08A
; ���������������������������������������������������������������������������

loc_8CFFE:				; CODE XREF: UISublist_ResetC_8CFCF+Cj
					; UISublist_ResetC_8CFCF+2Aj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0D4Eh
		push	word ptr [bp+arg_0+2]
		push	bx
		call	UI_ResetSublist
		add	sp, 4
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0CFEh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Eh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 22h	; '"'
		mov	word ptr es:[bx+16h], 0
		mov	word ptr es:[bx+18h], 0
		mov	dword ptr es:[bx+1Ah], 0
		mov	si, [bp+arg_8]
		mov	ax, [si]
		mov	word ptr [bp+var_4], ax
		mov	ax, [si+2]
		mov	word ptr [bp+var_4+2], ax
		mov	eax, [bp+var_4]
		mov	es:[bx+6], eax
		mov	es:[bx+2], eax
		mov	si, [bp+arg_A]
		mov	ax, [si]
		mov	word ptr [bp+var_8], ax
		mov	ax, [si+2]
		mov	word ptr [bp+var_8+2], ax
		mov	eax, [bp+var_8]
		mov	es:[bx+22h], eax
		mov	es:[bx+1Eh], eax
		mov	al, [bp+arg_E]
		mov	es:[bx+26h], al
		mov	al, [bp+arg_C]
		mov	es:[bx+27h], al

loc_8D081:
		mov	eax, [bp+arg_4]
		mov	es:[bx+12h], eax

loc_8D08A:				; CODE XREF: UISublist_ResetC_8CFCF+2Cj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
UISublist_ResetC_8CFCF	endp

ovr256		ends
