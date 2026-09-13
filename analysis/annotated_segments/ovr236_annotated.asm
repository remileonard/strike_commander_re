ovr236		segment	para public 'OVERLAY' use16
		assume cs:ovr236
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 171 lignes, NON DÉTAILLÉE — combine Input_GetCalibratedYValue_67499/XValue_67481
; (seg205), TextScroll_ApplyHelperC_671E4 (seg204), Mouse_InitAndRead — lecture combinée
; souris/axes calibrés.
; ==============================================================================================
Input_ReadMouseAndAxes_7AAF0	proc far		; CODE XREF: VROOMM_StubThunk_6AD10J

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_7AAF3:
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_72E6C, 0
		jnz	short loc_7AB04
		jmp	loc_7AC69
; ���������������������������������������������������������������������������

loc_7AB04:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+Fj
		call	Input_GetCalibratedYValue_67499
		sub	ax, word_6E473
		movsx	eax, ax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 5
		jle	short loc_7AB52
		sub	[bp+var_4], 5
		mov	ax, [si+183h]
		mov	[bp+var_6], ax

loc_7AB28:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+75j
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		mov	edx, [bp+var_4]
		imul	edx, eax
		mov	[bp+var_4], edx
		mov	ebx, 5Fh ; '_'
		mov	eax, [bp+var_4]
		cdq
		idiv	ebx
		mov	[bp+var_4], eax
		jmp	short loc_7AB6F
; ���������������������������������������������������������������������������

loc_7AB52:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+2Aj
		cmp	[bp+var_4], 0FFFFFFFBh
		jge	short loc_7AB67
		add	[bp+var_4], 5
		mov	ax, [si+181h]
		mov	[bp+var_8], ax
		jmp	short loc_7AB28
; ���������������������������������������������������������������������������

loc_7AB67:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+67j
		mov	[bp+var_4], 0

loc_7AB6F:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+60j
		call	Input_GetCalibratedXValue_67481
		mov	dx, word_6E471
		sub	dx, ax
		movsx	eax, dx
		mov	[bp+var_C], eax

loc_7AB82:
		cmp	[bp+var_C], 0Ah
		jle	short loc_7ABBF
		sub	[bp+var_C], 0Ah
		mov	ax, [si+187h]
		mov	[bp+var_E], ax

loc_7AB95:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+E2j
		cwd
		xor	ax, dx
		sub	ax, dx
		movsx	eax, ax
		mov	edx, [bp+var_C]
		imul	edx, eax
		mov	[bp+var_C], edx
		mov	ebx, 136h
		mov	eax, [bp+var_C]
		cdq
		idiv	ebx
		mov	[bp+var_C], eax
		jmp	short loc_7ABDC
; ���������������������������������������������������������������������������

loc_7ABBF:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+97j
		cmp	[bp+var_C], 0FFFFFFF6h
		jge	short loc_7ABD4
		add	[bp+var_C], 0Ah
		mov	ax, [si+185h]
		mov	[bp+var_10], ax
		jmp	short loc_7AB95
; ���������������������������������������������������������������������������

loc_7ABD4:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+D4j
		mov	[bp+var_C], 0

loc_7ABDC:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+CDj
		movsx	eax, word ptr [si+191h]
		cmp	eax, [bp+var_4]
		jnz	short loc_7ABEE
		cmp	eax, [bp+var_C]
		jz	short loc_7AC33

loc_7ABEE:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+F6j
		mov	ax, word ptr [bp+var_4]
		mov	[si+189h], ax
		mov	ax, word ptr [bp+var_C]
		mov	[si+18Bh], ax
		cmp	word ptr [si+189h], 0
		jnz	short loc_7AC13
		cmp	word ptr [si+18Bh], 0
		jnz	short loc_7AC13
		push	si
		call	VROOMM_StubThunk_6ACB5
		pop	cx
		jmp	short loc_7AC33
; ���������������������������������������������������������������������������

loc_7AC13:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+111j
					; Input_ReadMouseAndAxes_7AAF0+118j
		mov	byte ptr [si+1BDh], 0
		mov	byte ptr [si+1BEh], 1
		mov	al, [si+1BCh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7AC33
		push	[bp+arg_2]
		push	si
		call	VROOMM_StubThunk_6ACB0
		add	sp, 4

loc_7AC33:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+FCj
					; Input_ReadMouseAndAxes_7AAF0+121j ...
		call	TextScroll_ApplyHelperC_671E4
		cmp	byte_72E48, 1
		jnz	short loc_7AC4B
		cmp	byte_72E49, 1
		jnz	short loc_7AC4B
		mov	ax, 1
		jmp	short loc_7AC4D
; ���������������������������������������������������������������������������

loc_7AC4B:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+14Dj
					; Input_ReadMouseAndAxes_7AAF0+154j
		xor	ax, ax

loc_7AC4D:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+159j
		or	al, al
		jz	short loc_7AC5B
		mov	byte ptr [si+1BDh], 1
		call	Mouse_InitAndRead

loc_7AC5B:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+15Fj
		mov	ax, word ptr [bp+var_4]
		mov	[si+191h], ax
		mov	ax, word ptr [bp+var_C]
		mov	[si+193h], ax

loc_7AC69:				; CODE XREF: Input_ReadMouseAndAxes_7AAF0+11j
		pop	si
		leave
		retf
Input_ReadMouseAndAxes_7AAF0	endp

ovr236		ends
