ovr259		segment	para public 'OVERLAY' use16
		assume cs:ovr259
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 176 lignes, NON DÉTAILLÉE — combine allocation et ReadFinalField_64B51 répété.
; ==============================================================================================
UIWidget_LoadFieldsFromIFF_8DB90	proc far		; CODE XREF: VROOMM_StubThunk_6B600J

var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_8DB93:
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]

loc_8DB9B:
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_8DBB4
		push	0DDh ; '�'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_8DBB4
		jmp	loc_8DD37
; ���������������������������������������������������������������������������

loc_8DBB4:				; CODE XREF: UIWidget_LoadFieldsFromIFF_8DB90+10j
					; UIWidget_LoadFieldsFromIFF_8DB90+1Fj
		push	si
		call	VROOMM_StubThunk_6B570
		pop	cx
		mov	word ptr [si], 0E02h
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		push	0
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8DBEF
		jmp	loc_8DC74
; ���������������������������������������������������������������������������

loc_8DBEF:				; CODE XREF: UIWidget_LoadFieldsFromIFF_8DB90+5Aj
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
		mov	[si+25h], ax
		mov	ax, [si+25h]
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
		mov	[si+1Ch], al
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+1Dh], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+27h], ax
		push	di
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		mov	[si+2Bh], ax
		mov	eax, [di+76h]
		mov	[di+65h], eax
		mov	byte ptr [di+6Dh], 0

loc_8DC74:				; CODE XREF: UIWidget_LoadFieldsFromIFF_8DB90+5Cj
		mov	ax, [si+1Dh]
		mov	[si+1Fh], ax
		movsx	eax, word ptr [si+1Fh]
		mov	[bp+var_A], eax
		mov	eax, dword_70489
		imul	eax, [bp+var_A]
		mov	[bp+var_E], eax
		mov	[bp+var_12], eax
		shl	eax, 1

loc_8DC97:
		mov	[bp+var_16], eax
		mov	[bp+var_1A], eax
		sar	eax, 8
		mov	[si+21h], eax
		mov	ax, [si+27h]
		sar	ax, 1
		mov	[si+29h], ax
		mov	ax, [si+2Bh]
		sar	ax, 1
		mov	[si+2Dh], ax
		mov	byte ptr [si+1Bh], 0
		push	0
		push	large 50414853h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8DD31
		mov	eax, [di+72h]
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
		mov	[si+11h], eax
		mov	byte ptr [si+15h], 3
		mov	byte ptr [si+16h], 1
		mov	dword ptr [si+17h], 0
		mov	eax, [bp+var_1E]
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

loc_8DD31:				; CODE XREF: UIWidget_LoadFieldsFromIFF_8DB90+13Ej
		mov	word ptr [si+0DBh], 0

loc_8DD37:				; CODE XREF: UIWidget_LoadFieldsFromIFF_8DB90+21j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
UIWidget_LoadFieldsFromIFF_8DB90	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 170 lignes, NON DÉTAILLÉE — combine Formation_ComputeGeometryHelper_56D43 (seg116)
; et ReadFinalField_64B51 répété.
; ==============================================================================================
UIWidget_LoadFormationFields_8DD3D	proc far		; CODE XREF: VROOMM_StubThunk_6B605J

var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_8DD60
		push	56h ; 'V'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_8DD60
		jmp	loc_8DEB1
; ���������������������������������������������������������������������������

loc_8DD60:				; CODE XREF: UIWidget_LoadFormationFields_8DD3D+10j
					; UIWidget_LoadFormationFields_8DD3D+1Ej
		push	si
		call	VROOMM_StubThunk_6B570
		pop	cx
		mov	word ptr [si], 0DEEh
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+15h], 2
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		mov	ax, si
		add	ax, 1Ch
		mov	ax, si
		add	ax, 20h	; ' '
		mov	ax, si
		add	ax, 24h	; '$'
		mov	ax, si

loc_8DD94:
		add	ax, 2Ah	; '*'

loc_8DD97:
		mov	ax, si

loc_8DD99:
		add	ax, 32h	; '2'
		push	ax
		call	Formation_ComputeGeometryHelper_56D43

loc_8DDA2:
		pop	cx
		push	0

loc_8DDA5:
		push	large 4F464E49h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jnz	short loc_8DDBB
		jmp	loc_8DE3B
; ���������������������������������������������������������������������������

loc_8DDBB:				; CODE XREF: UIWidget_LoadFormationFields_8DD3D+79j
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
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+1Ch], eax
		push	di
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[si+20h], eax
		mov	eax, [si+1Ch]
		mov	[si+24h], eax
		mov	word ptr [si+28h], 1

loc_8DE3B:				; CODE XREF: UIWidget_LoadFormationFields_8DD3D+7Bj
		push	0
		push	large 50414853h
		push	di
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_8DEB1
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

loc_8DE91:
		push	0
		mov	al, [si+15h]
		push	ax

loc_8DE97:
		push	large dword ptr	[si+11h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadDwordFieldB_64AFF
		add	sp, 6

loc_8DEB1:				; CODE XREF: UIWidget_LoadFormationFields_8DD3D+20j
					; UIWidget_LoadFormationFields_8DD3D+111j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
UIWidget_LoadFormationFields_8DD3D	endp

ovr259		ends
