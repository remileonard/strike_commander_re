seg141		segment	byte public 'CODE' use16
		assume cs:seg141
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue via sub_658. Référencée depuis seg209 (segment distant non encore couvert).
; ==============================================================================================
CachedObject_Allocate_5DA48	proc far		; CODE XREF: seg209:02E2P
					; TextScrollDisplay_FormatAndCache_85ACB+78P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si

loc_5DA4C:				; DATA XREF: seg216:052Eo
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5DA61
		push	20h ; ' '
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5DAA2

loc_5DA61:				; CODE XREF: CachedObject_Allocate_5DA48+9j
		mov	word ptr [si], 3DD4h
		mov	word ptr [si], 3DE0h
		mov	word ptr [si], 3DB4h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	word ptr [si+1Ah], 0

loc_5DAA2:				; CODE XREF: CachedObject_Allocate_5DA48+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
CachedObject_Allocate_5DA48	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_5DAC0
		push	20h ; ' '
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5DB08

loc_5DAC0:				; CODE XREF: seg141:0070j
		mov	word ptr [si], 3DD4h
		mov	word ptr [si], 3DE0h
		mov	word ptr [si], 3DB4h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0

loc_5DAE4:
		mov	dword ptr [si+10h], 0

loc_5DAEC:
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		push	word ptr [bp+8]
		push	si
		nop
		push	cs
		call	near ptr CachedObject_DestructHelper_5DE34
		add	sp, 4

loc_5DB08:				; CODE XREF: seg141:007Ej
		mov	ax, si
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658) et appelle CachedObject_DestructHelper_5DE86. Référencée par
; sub_85ACB.
; ==============================================================================================
CachedObject_ConstructVariantB_5DB0D	proc far		; CODE XREF: TextScrollDisplay_FormatAndCache_85ACB+ACP

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	si

loc_5DB11:
		mov	si, [bp+arg_0]
		or	si, si

loc_5DB16:
		jnz	short loc_5DB26
		push	20h ; ' '
		call	CRT_Malloc16_Retry
		pop	cx

loc_5DB20:
		mov	si, ax

loc_5DB22:
		or	ax, ax
		jz	short loc_5DB77

loc_5DB26:				; CODE XREF: CachedObject_ConstructVariantB_5DB0D:loc_5DB16j
		mov	word ptr [si], 3DD4h
		mov	word ptr [si], 3DE0h

loc_5DB2E:
		mov	word ptr [si], 3DB4h

loc_5DB32:
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2

loc_5DB3E:
		mov	byte ptr [si+0Bh], 0

loc_5DB42:
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		mov	al, [bp+arg_8]
		push	ax
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr CachedObject_DestructHelper_5DE86
		add	sp, 0Ah

loc_5DB77:				; CODE XREF: CachedObject_ConstructVariantB_5DB0D+17j
		mov	ax, si
		pop	si
		pop	bp
		retf
CachedObject_ConstructVariantB_5DB0D	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_5DB98
		push	20h ; ' '
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5DBF8

loc_5DB98:				; CODE XREF: seg141:0148j
		mov	word ptr [si], 3DD4h
		mov	word ptr [si], 3DE0h
		mov	word ptr [si], 3DB4h
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		push	word ptr [bp+8]
		push	si
		nop
		push	cs
		call	near ptr CachedObject_DestructHelper_5DE34
		add	sp, 4
		mov	ax, [bp+0Ah]

loc_5DBE3:
		mov	[bp-2],	ax
		mov	ax, [bp+0Ch]
		mov	[bp-4],	ax

loc_5DBEC:
		mov	ax, [bp-2]

loc_5DBEF:
		mov	[si+2],	ax

loc_5DBF2:
		mov	ax, [bp-4]

loc_5DBF5:
		mov	[si+4],	ax

loc_5DBF8:				; CODE XREF: seg141:0156j
		mov	ax, si
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp

loc_5DBFE:
		mov	bp, sp
		sub	sp, 6
		push	si

loc_5DC04:
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_5DC19
		push	20h ; ' '
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_5DC82

loc_5DC19:				; CODE XREF: seg141:01C9j
		mov	word ptr [si], 3DD4h

loc_5DC1D:
		mov	word ptr [si], 3DE0h

loc_5DC21:
		mov	word ptr [si], 3DB4h

loc_5DC25:
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Ah], 2
		mov	byte ptr [si+0Bh], 0

loc_5DC35:
		mov	dword ptr [si+0Ch], 0

loc_5DC3D:
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		push	word ptr [bp+8]
		push	si
		nop
		push	cs
		call	near ptr CachedObject_DestructHelper_5DE34
		add	sp, 4
		mov	ax, [bp+0Ah]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ch]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[si+2],	ax
		mov	ax, [bp-4]
		mov	[si+4],	ax
		mov	ax, [bp+0Eh]
		mov	[bp-6],	ax
		mov	[si+1Ah], ax

loc_5DC82:				; CODE XREF: seg141:01D7j
		mov	ax, si
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, destructeur : appelle sub_5DD29 puis libère deux blocs (Memory_TypedFree_5C7B6 ×2) et
; l'objet lui-même (sub_338). Référencée depuis seg209.
; ==============================================================================================
CachedObject_Destruct_5DC87	proc far		; CODE XREF: seg209:02F2P
					; TextScrollDisplay_FormatAndCache_85ACB+D0P ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_5DC99
		jmp	loc_5DD25
; ���������������������������������������������������������������������������

loc_5DC99:				; CODE XREF: CachedObject_Destruct_5DC87+Dj
		mov	word ptr [si], 3DB4h
		push	si
		nop
		push	cs
		call	near ptr CachedObject_ReleaseFields_5DD29
		pop	cx
		cmp	byte ptr [si+15h], 0
		jz	short loc_5DCCA
		cmp	dword ptr [si+10h], 0
		jz	short loc_5DCCA
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5DCCA:				; CODE XREF: CachedObject_Destruct_5DC87+21j
					; CachedObject_Destruct_5DC87+28j
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		cmp	byte ptr [si+0Bh], 0
		jz	short loc_5DD04
		cmp	dword ptr [si+6], 0

loc_5DCE9:
		jz	short loc_5DD04
		push	0
		mov	al, [si+0Ah]
		push	ax

loc_5DCF1:
		mov	ax, si
		add	ax, 6
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5DD04:				; CODE XREF: CachedObject_Destruct_5DC87+5Bj
					; CachedObject_Destruct_5DC87:loc_5DCE9j
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0

loc_5DD18:
		test	di, 1

loc_5DD1C:
		jz	short loc_5DD25
		push	si

loc_5DD1F:
		call	CRT_FreeNear_Wrap
		pop	cx

loc_5DD25:				; CODE XREF: CachedObject_Destruct_5DC87+Fj
					; CachedObject_Destruct_5DC87:loc_5DD1Cj
		pop	di
		pop	si
		pop	bp
		retf
CachedObject_Destruct_5DC87	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, libère les champs internes d'un objet mis en cache (Memory_TypedFree_5C7B6 ×2). Appelée
; par CachedObject_Destruct_5DC87.
; ==============================================================================================
CachedObject_ReleaseFields_5DD29	proc far		; CODE XREF: CachedObject_Destruct_5DC87+19p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]

loc_5DD30:
		cmp	byte ptr [si+0Bh], 0

loc_5DD34:
		jz	short loc_5DD56
		cmp	dword ptr [si+6], 0
		jz	short loc_5DD56

loc_5DD3D:
		push	0

loc_5DD3F:
		mov	al, [si+0Ah]
		push	ax

loc_5DD43:
		mov	ax, si
		add	ax, 6
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5DD56:				; CODE XREF: CachedObject_ReleaseFields_5DD29:loc_5DD34j
					; CachedObject_ReleaseFields_5DD29+12j
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		cmp	byte ptr [si+15h], 0
		jz	short loc_5DD90
		cmp	dword ptr [si+10h], 0
		jz	short loc_5DD90
		push	0
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5DD90:				; CODE XREF: CachedObject_ReleaseFields_5DD29+45j
					; CachedObject_ReleaseFields_5DD29+4Cj
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		pop	si
		pop	bp
		retf
CachedObject_ReleaseFields_5DD29	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, cœur de destruction partagé (Memory_TypedFree_5C7B6 ×2). Appelée par
; CachedObject_DestructHelper_5DE34/5DE86.
; ==============================================================================================
CachedObject_DestructCore_5DDA7	proc far		; CODE XREF: CachedObject_DestructHelper_5DE34:loc_5DE41p
					; CachedObject_DestructHelper_5DE86+Cp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+0Bh], 0
		jz	short loc_5DDD4
		cmp	dword ptr [si+6], 0
		jz	short loc_5DDD4
		push	0
		mov	al, [si+0Ah]
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5DDD4:				; CODE XREF: CachedObject_DestructCore_5DDA7+Bj
					; CachedObject_DestructCore_5DDA7+12j
		mov	dword ptr [si+6], 0
		mov	byte ptr [si+0Bh], 0

loc_5DDE0:
		mov	dword ptr [si+0Ch], 0

loc_5DDE8:
		cmp	byte ptr [si+15h], 0
		jz	short loc_5DE0E

loc_5DDEE:
		cmp	dword ptr [si+10h], 0
		jz	short loc_5DE0E

loc_5DDF5:
		push	0

loc_5DDF7:
		mov	al, [si+14h]
		push	ax
		mov	ax, si
		add	ax, 10h
		push	ax

loc_5DE01:
		push	5C44h

loc_5DE04:
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_5DE0E:				; CODE XREF: CachedObject_DestructCore_5DDA7+45j
					; CachedObject_DestructCore_5DDA7+4Cj
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0

loc_5DE1A:
		mov	dword ptr [si+16h], 0

loc_5DE22:
		mov	word ptr [si+2], 0

loc_5DE27:
		mov	word ptr [si+4], 0

loc_5DE2C:
		mov	word ptr [si+1Ah], 0
		pop	si
		pop	bp

locret_5DE33:
		retf
CachedObject_DestructCore_5DDA7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CachedObject_DestructCore_5DDA7. Référencée en interne du segment.
; ==============================================================================================
CachedObject_DestructHelper_5DE34	proc far		; CODE XREF: seg141:00C2p seg141:019Ap ...

var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs

loc_5DE41:
		call	near ptr CachedObject_DestructCore_5DDA7
		pop	cx
		mov	di, [bp+arg_2]
		mov	eax, [di]
		mov	[bp+var_4], eax
		mov	al, [di+4]
		mov	[bp+var_5], al
		mov	eax, [bp+var_4]
		mov	[si+6],	eax
		mov	al, [bp+var_5]
		mov	[si+0Ah], al
		mov	byte ptr [si+0Bh], 0
		mov	dword ptr [si+0Ch], 0
		mov	eax, [di+6]
		mov	[si+0Ch], eax
		mov	di, [bp+arg_2]
		mov	byte ptr [di+5], 0
		mov	byte ptr [si+0Bh], 1
		pop	di
		pop	si
		leave
		retf
CachedObject_DestructHelper_5DE34	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CachedObject_DestructCore_5DDA7. Référencée par
; CachedObject_ConstructVariantB_5DB0D.
; ==============================================================================================
CachedObject_DestructHelper_5DE86	proc far		; CODE XREF: CachedObject_ConstructVariantB_5DB0D+64p

var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr CachedObject_DestructCore_5DDA7
		pop	cx
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	al, [bp+arg_6]
		mov	[bp+var_5], al
		mov	al, [bp+arg_8]
		mov	[bp+var_6], al
		mov	eax, [bp+var_4]
		mov	[si+6],	eax
		mov	al, [bp+var_5]
		mov	[si+0Ah], al
		mov	al, [bp+var_6]
		mov	[si+0Bh], al
		mov	dword ptr [si+0Ch], 0
		pop	si
		leave
		retf
CachedObject_DestructHelper_5DE86	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 131 lignes, NON DÉTAILLÉE — combine Memory_TypedAllocDispatchB_5C832 ×2, sub_625CC,
; sub_5E74E, Memory_TypedFreeWrapper_5C6F3 (seg131). Référencée par sub_5E00C.
; ==============================================================================================
CachedObject_BuildAndTransform_5DEC9	proc far		; CODE XREF: CachedObject_BuildComposite_5E00C+2Ep

var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+6], 0
		jz	short loc_5DEE0
		mov	ax, 1
		jmp	short loc_5DEE2
; ���������������������������������������������������������������������������

loc_5DEE0:				; CODE XREF: CachedObject_BuildAndTransform_5DEC9+10j
		xor	ax, ax

loc_5DEE2:				; CODE XREF: CachedObject_BuildAndTransform_5DEC9+15j
		or	ax, ax
		jnz	short loc_5DEE9

loc_5DEE6:
		jmp	loc_5DFA4
; ���������������������������������������������������������������������������

loc_5DEE9:				; CODE XREF: CachedObject_BuildAndTransform_5DEC9+1Bj
		xor	ax, ax
		mov	[bp+var_4], ax
		mov	[bp+var_2], ax
		push	0

loc_5DEF3:
		mov	al, [si+0Ah]

loc_5DEF6:
		push	ax

loc_5DEF7:
		push	large dword ptr	[si+6]
		push	5C44h

loc_5DEFE:
		call	Memory_TypedAllocDispatchB_5C832

loc_5DF03:
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_625CC
		mov	[bp+var_E], ax
		xor	di, di
		jmp	short loc_5DF58
; ���������������������������������������������������������������������������

loc_5DF14:				; CODE XREF: CachedObject_BuildAndTransform_5DEC9+92j
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	large 0
		push	0
		mov	al, [si+0Ah]
		push	ax

loc_5DF22:
		push	large dword ptr	[si+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	Font_ComputeGlyphBoundingBox_5E74E
		mov	dx, [bp+var_8]
		sub	dx, [bp+var_C]
		inc	dx
		cmp	dx, [bp+var_2]
		jle	short loc_5DF48
		mov	[bp+var_2], dx

loc_5DF48:				; CODE XREF: CachedObject_BuildAndTransform_5DEC9+7Aj
		mov	dx, [bp+var_6]
		sub	dx, [bp+var_A]
		inc	dx
		cmp	dx, [bp+var_4]
		jle	short loc_5DF57
		mov	[bp+var_4], dx

loc_5DF57:				; CODE XREF: CachedObject_BuildAndTransform_5DEC9+89j
		inc	di

loc_5DF58:				; CODE XREF: CachedObject_BuildAndTransform_5DEC9+49j
		cmp	di, [bp+var_E]
		jl	short loc_5DF14
		mov	ax, [bp+var_2]
		imul	[bp+var_4]
		movsx	eax, ax
		mov	[bp+var_12], eax
		push	0
		push	0
		push	2
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[si+10h], eax
		mov	byte ptr [si+14h], 2
		mov	byte ptr [si+15h], 1
		mov	dword ptr [si+16h], 0
		mov	eax, [bp+var_12]
		mov	[si+16h], eax

loc_5DFA4:				; CODE XREF: CachedObject_BuildAndTransform_5DEC9:loc_5DEE6j
		pop	di
		pop	si
		leave
		retf
CachedObject_BuildAndTransform_5DEC9	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[si+1Ah], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedAllocDispatchB_5C832 et sub_61F52. Référencée en interne
; (loc_5DFF4).
; ==============================================================================================
CachedObject_AllocateAndInit_5DFBE	proc far		; CODE XREF: seg141:05C3p
					; TextScrollDisplayB_UpdateObjectState_67F8A+4CP
					; DATA XREF: ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	word ptr [si+1Ah]
		push	0
		mov	al, [si+0Ah]
		push	ax
		push	large dword ptr	[si+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax

loc_5DFDF:
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	word_70E60
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		pop	si
		pop	bp
		retf
CachedObject_AllocateAndInit_5DFBE	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle (DATA XREF seg339) transmettant les champs +2/+4 de l'objet à
; CachedObject_AllocateAndInit_5DFBE.
; ==============================================================================================
CachedObject_Method_InitFromFields_5DFF4:				; DATA XREF: seg339:off_70E64o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	si
		push	cs
		call	near ptr CachedObject_AllocateAndInit_5DFBE
		add	sp, 6
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 85 lignes, NON DÉTAILLÉE — combine Memory_TypedAllocDispatchB_5C832 ×3,
; CachedObject_BuildAndTransform_5DEC9, sub_62BFE. Référencée par sub_67F8A.
; ==============================================================================================
CachedObject_BuildComposite_5E00C	proc far		; CODE XREF: TextScrollDisplayB_UpdateObjectState_67F8A+41P
					; DATA XREF: seg339:off_70E68o

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_5E031:
		cmp	[bp+var_4], 0

loc_5E036:
		jnz	short loc_5E059
		push	si

loc_5E039:
		push	cs
		call	near ptr CachedObject_BuildAndTransform_5DEC9
		pop	cx

loc_5E03E:
		push	0
		mov	al, [si+14h]
		push	ax

loc_5E044:
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah

loc_5E053:
		mov	word ptr [bp+var_4+2], dx

loc_5E056:
		mov	word ptr [bp+var_4], ax

loc_5E059:				; CODE XREF: CachedObject_BuildComposite_5E00C:loc_5E036j
		cmp	[bp+var_4], 0
		jz	short loc_5E09C

loc_5E060:
		push	word ptr [si+1Ah]

loc_5E063:
		push	0

loc_5E065:
		mov	al, [si+0Ah]
		push	ax
		push	large dword ptr	[si+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	large [bp+var_4]
		push	word_70E60
		call	Render_DrawOrMeasureTextVariantB_62BFE
		add	sp, 10h
		mov	ax, [si+2]
		mov	[si+1Ch], ax
		mov	ax, [si+4]
		mov	[si+1Eh], ax

loc_5E09C:				; CODE XREF: CachedObject_BuildComposite_5E00C+52j
		pop	si
		leave
		retf
CachedObject_BuildComposite_5E00C	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle dispatchant successivement 3 appels vtable ([bx+0x18],[bx+4],[bx]).
; ==============================================================================================
CachedObject_Method_CopyAndDispatch_5E09F:				; DATA XREF: seg339:off_70E6Co
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		add	[si+2],	ax
		mov	ax, [bp-4]
		add	[si+4],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, variante de CachedObject_Method_CopyAndDispatch_5E09F (même motif de 3 dispatchs
; vtable).
; ==============================================================================================
CachedObject_Method_CopyAndDispatchB_5E0E0:				; DATA XREF: seg339:3DC4o
		push	bp
		mov	bp, sp

loc_5E0E3:
		sub	sp, 6
		push	si
		mov	si, [bp+6]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	si
		mov	bx, [si]

loc_5E0F3:
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+0Ah]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ch]

loc_5E102:
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		add	[si+2],	ax
		mov	ax, [bp-4]
		add	[si+4],	ax

loc_5E111:
		push	si

loc_5E112:
		mov	bx, [si]
		call	dword ptr [bx+4]

loc_5E117:
		pop	cx

loc_5E118:
		mov	ax, [bp+8]
		mov	[bp-6],	ax

loc_5E11E:
		mov	[si+1Ah], ax
		push	si
		mov	bx, [si]

loc_5E124:
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Memory_TypedAllocDispatchB_5C832 ×2 et sub_625E2. Référencée par sub_67FF8.
; ==============================================================================================
CachedObject_BuildVariant_5E12A	proc far		; CODE XREF: TextScrollDisplayB_UpdateObjectStateB_67FF8+2FP
					; DATA XREF: seg339:3DCCo

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si

loc_5E131:
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+14h]
		push	ax
		push	large dword ptr	[si+10h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		cmp	[bp+var_4], 0
		jz	short loc_5E186

loc_5E156:
		push	word ptr [si+1Ah]
		push	0
		mov	al, [si+0Ah]
		push	ax

loc_5E15F:
		push	large dword ptr	[si+6]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	large [bp+var_4]
		push	word_70E60
		call	Render_DrawOrMeasureTextVariant_625E2
		add	sp, 10h

loc_5E186:				; CODE XREF: CachedObject_BuildVariant_5E12A+2Aj
		pop	si
		leave
		retf
CachedObject_BuildVariant_5E12A	endp

; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle (DATA XREF seg339) : dispatch [bx+0x18], écrit une position (2
; champs) dans l'objet, puis dispatch [bx+4] et [bx].
; ==============================================================================================
CachedObject_Method_SetPositionAndDispatch_5E189:				; DATA XREF: seg339:3DC8o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 6
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[si+2],	ax
		mov	ax, [bp-4]
		mov	[si+4],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle libérant un bloc mis en cache (Memory_TypedFree_5C7B6, tag 5C44h) si
; les indicateurs de validité (+0x14/+0x15/+0x10) le permettent, puis réinitialise les champs.
; ==============================================================================================
CachedObject_Method_ReleaseCache_5E1CA:				; DATA XREF: seg339:off_70E80o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	byte ptr [si+15h], 0
		jz	short loc_5E1F7
		cmp	dword ptr [si+10h], 0
		jz	short loc_5E1F7
		push	0
		mov	al, [si+14h]

loc_5E1E3:
		push	ax
		mov	ax, si

loc_5E1E6:
		add	ax, 10h
		push	ax
		push	5C44h

loc_5E1ED:
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_5E1F5:
		jmp	short $+2

loc_5E1F7:				; CODE XREF: seg141:0795j seg141:079Cj
		mov	dword ptr [si+10h], 0
		mov	byte ptr [si+15h], 0
		mov	dword ptr [si+16h], 0
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle stub transmettant simplement son argument.
; ==============================================================================================
CachedObject_Method_PassThrough_5E20E:				; DATA XREF: seg339:off_70E90o
		push	bp
		mov	bp, sp

loc_5E211:
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle stub identique à CachedObject_Method_PassThrough_5E20E.
; ==============================================================================================
CachedObject_Method_PassThroughB_5E216:				; DATA XREF: seg339:off_70E94o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle : dispatch [bx+4], accumule une position (+2/+4 additionnés), puis
; dispatch [bx].
; ==============================================================================================
CachedObject_Method_AddPositionAndDispatch_5E21E:				; DATA XREF: seg339:off_70E98o
		push	bp
		mov	bp, sp
		sub	sp, 4

loc_5E224:
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx

loc_5E22F:
		mov	ax, [bp+8]

loc_5E232:
		mov	[bp-2],	ax

loc_5E235:
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax

loc_5E23B:
		mov	ax, [bp-2]

loc_5E23E:
		add	[si+2],	ax

loc_5E241:
		mov	ax, [bp-4]

loc_5E244:
		add	[si+4],	ax

loc_5E247:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, méthode virtuelle : écrit une position (2 champs) puis dispatch [bx].
; ==============================================================================================
CachedObject_Method_SetPositionAndDispatchB_5E250:				; DATA XREF: seg339:off_70E9Co
		push	bp
		mov	bp, sp

loc_5E253:
		sub	sp, 4
		push	si
		mov	si, [bp+6]

loc_5E25A:
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		mov	ax, [bp+0Ah]
		mov	[bp-4],	ax
		mov	ax, [bp-2]
		mov	[si+2],	ax
		mov	ax, [bp-4]

loc_5E26F:
		mov	[si+4],	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		pop	si
		leave
		retf
seg141		ends
