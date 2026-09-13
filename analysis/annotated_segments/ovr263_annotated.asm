ovr263		segment	para public 'OVERLAY' use16
		assume cs:ovr263
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 274 lignes, NON DÉTAILLÉE — combine allocation et ReadFinalField_64B51 répété.
; ==============================================================================================
AITargeting_LoadFieldsFromIFF_8E860	proc far		; CODE XREF: VROOMM_StubThunk_6B6D0J

var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_8E883
		push	3Eh ; '>'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_8E883
		jmp	loc_8EAE2
; ���������������������������������������������������������������������������

loc_8E883:				; CODE XREF: AITargeting_LoadFieldsFromIFF_8E860+10j
					; AITargeting_LoadFieldsFromIFF_8E860+1Ej
		push	si
		call	VROOMM_StubThunk_6B570
		pop	cx
		mov	word ptr [si], 0F2Ch
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0

loc_8E89E:
		mov	dword ptr [si+17h], 0
		mov	ax, si
		add	ax, 1Eh
		mov	ax, si
		add	ax, 2Ch	; ','
		mov	ax, si
		add	ax, 30h	; '0'
		mov	ax, si
		add	ax, 34h	; '4'
		mov	dword ptr [si+3Ah], 0
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8E8EA
		jmp	loc_8EA6C
; ���������������������������������������������������������������������������

loc_8E8EA:				; CODE XREF: AITargeting_LoadFieldsFromIFF_8E860+85j
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+6],	al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+7],	al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+3],	al
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	[si+0Dh], eax
		mov	eax, [si+0Dh]
		mov	[si+9],	eax
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+8],	al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+1Bh], al
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+1Eh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+20h], ax
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+22h], ax
		push	1
		push	0
		push	2
		mov	ax, [si+22h]
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+26h], dx
		mov	[si+24h], ax
		mov	[bp+var_10], 0
		jmp	short loc_8E9B5
; ���������������������������������������������������������������������������

loc_8E987:				; CODE XREF: AITargeting_LoadFieldsFromIFF_8E860+15Bj
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [si+24h]
		mov	dx, [bp+var_10]
		shl	dx, 2
		add	bx, dx
		mov	es:[bx], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [si+24h]
		mov	dx, [bp+var_10]
		shl	dx, 2
		add	bx, dx
		mov	es:[bx+2], ax
		inc	[bp+var_10]

loc_8E9B5:				; CODE XREF: AITargeting_LoadFieldsFromIFF_8E860+125j
		mov	ax, [si+22h]
		cmp	ax, [bp+var_10]
		jg	short loc_8E987
		push	1
		push	0
		push	2
		shl	ax, 2
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+2Ah], dx
		mov	[si+28h], ax
		mov	[bp+var_10], 0
		jmp	short loc_8EA12
; ���������������������������������������������������������������������������

loc_8E9E4:				; CODE XREF: AITargeting_LoadFieldsFromIFF_8E860+1B8j
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [si+28h]
		mov	dx, [bp+var_10]
		shl	dx, 2
		add	bx, dx
		mov	es:[bx], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [si+28h]
		mov	dx, [bp+var_10]
		shl	dx, 2
		add	bx, dx
		mov	es:[bx+2], ax
		inc	[bp+var_10]

loc_8EA12:				; CODE XREF: AITargeting_LoadFieldsFromIFF_8E860+182j
		mov	ax, [si+22h]
		cmp	ax, [bp+var_10]
		jg	short loc_8E9E4
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+2Ch], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+2Eh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+38h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+30h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+32h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+34h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+36h], ax
		mov	eax, [di+76h]
		mov	[di+65h], eax
		mov	byte ptr [di+6Dh], 0

loc_8EA6C:				; CODE XREF: AITargeting_LoadFieldsFromIFF_8E860+87j
		push	0
		push	large 50414853h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8EAE2
		mov	eax, [di+72h]
		mov	[bp+var_A], eax
		push	1
		push	0
		push	3
		push	eax

loc_8EA91:
		push	5C44h

loc_8EA94:
		call	Memory_TypedFreeWrapper_5C6F3

loc_8EA99:
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx

loc_8EA9F:
		mov	word ptr [bp+var_E], ax

loc_8EAA2:
		mov	eax, [bp+var_E]
		mov	[si+11h], eax
		mov	byte ptr [si+15h], 3
		mov	byte ptr [si+16h], 1
		mov	dword ptr [si+17h], 0
		mov	eax, [bp+var_A]
		mov	[si+17h], eax
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_8EAE2:				; CODE XREF: AITargeting_LoadFieldsFromIFF_8E860+20j
					; AITargeting_LoadFieldsFromIFF_8E860+21Fj
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
AITargeting_LoadFieldsFromIFF_8E860	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 195 lignes, NON DÉTAILLÉE — variante de AITargeting_LoadFieldsFromIFF_8E860.
; ==============================================================================================
AITargeting_LoadFieldsFromIFFB_8EAE8	proc far		; CODE XREF: VROOMM_StubThunk_6B6D5J

var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_8EB0B
		push	2Fh ; '/'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_8EB0B
		jmp	loc_8ECAC
; ���������������������������������������������������������������������������

loc_8EB0B:				; CODE XREF: AITargeting_LoadFieldsFromIFFB_8EAE8+10j
					; AITargeting_LoadFieldsFromIFFB_8EAE8+1Ej
		push	si
		call	VROOMM_StubThunk_6B570
		pop	cx
		mov	word ptr [si], 0F18h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	ax, si
		add	ax, 27h	; '''
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		mov	word ptr [si+21h], 0
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8EB60
		jmp	loc_8EC36
; ���������������������������������������������������������������������������

loc_8EB60:				; CODE XREF: AITargeting_LoadFieldsFromIFFB_8EAE8+73j
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+6],	al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+7],	al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+3],	al
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8

loc_8EB91:
		mov	[bp+var_6], eax
		mov	[si+0Dh], eax
		mov	eax, [si+0Dh]
		mov	[si+9],	eax
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+8],	al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+1Bh], al
		push	di
		call	ResourceRecord_ReadFinalField_64B51
		pop	cx
		mov	[si+1Ch], al
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+1Fh], ax
		push	1
		push	0
		push	2
		mov	ax, [si+1Fh]
		imul	ax, 9
		movzx	eax, ax
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	[si+25h], dx
		mov	[si+23h], ax
		mov	[bp+var_10], 0
		jmp	short loc_8EC0E
; ���������������������������������������������������������������������������

loc_8EBF3:				; CODE XREF: AITargeting_LoadFieldsFromIFFB_8EAE8+12Cj
		push	di
		mov	ax, [si+23h]
		mov	dx, [bp+var_10]
		imul	dx, 9
		add	ax, dx
		push	word ptr [si+25h]
		push	ax
		call	String_ConstructFromFarPtrLen
		add	sp, 6
		inc	[bp+var_10]

loc_8EC0E:				; CODE XREF: AITargeting_LoadFieldsFromIFFB_8EAE8+109j
		mov	ax, [si+1Fh]
		cmp	ax, [bp+var_10]
		jg	short loc_8EBF3
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+27h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+29h], ax
		mov	eax, [di+76h]
		mov	[di+65h], eax
		mov	byte ptr [di+6Dh], 0

loc_8EC36:				; CODE XREF: AITargeting_LoadFieldsFromIFFB_8EAE8+75j
		push	0
		push	large 50414853h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8ECAC
		mov	eax, [di+72h]
		mov	[bp+var_A], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	[si+11h], eax
		mov	byte ptr [si+15h], 3
		mov	byte ptr [si+16h], 1
		mov	dword ptr [si+17h], 0
		mov	eax, [bp+var_A]
		mov	[si+17h], eax
		push	0
		mov	al, [si+15h]

loc_8EC91:
		push	ax
		push	large dword ptr	[si+11h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax

loc_8ECA3:
		push	di

loc_8ECA4:
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_8ECAC:				; CODE XREF: AITargeting_LoadFieldsFromIFFB_8EAE8+20j
					; AITargeting_LoadFieldsFromIFFB_8EAE8+161j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
AITargeting_LoadFieldsFromIFFB_8EAE8	endp

ovr263		ends
