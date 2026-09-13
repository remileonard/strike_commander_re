ovr304		segment	para public 'OVERLAY' use16
		assume cs:ovr304
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ReadFieldGroupC_64A7E et gestion d'erreur (41 lignes).
; ==============================================================================================
Debris_LoadFieldGroupC_9C810	proc far		; CODE XREF: VROOMM_StubThunk_6C080J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C1C0
		add	sp, 6
		push	0
		push	large 41544144h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_9C84E
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+37h], eax
		jmp	short loc_9C857
; ���������������������������������������������������������������������������

loc_9C84E:				; CODE XREF: Debris_LoadFieldGroupC_9C810+27j
		push	0C005h
		call	VROOMM_StubThunk_6B70F
		pop	cx

loc_9C857:				; CODE XREF: Debris_LoadFieldGroupC_9C810+3Cj
		pop	si
		pop	bp
		retf
Debris_LoadFieldGroupC_9C810	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine allocation, Debris_BodyReset, Camera_MarkRecalc — réinitialisation d'un corps
; de débris avec notification de recalcul caméra.
; ==============================================================================================
Debris_ResetBodyAndMarkCamera_9C85A	proc far		; CODE XREF: VROOMM_StubThunk_6C085J

var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	34h ; '4'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9C8D1
		mov	word ptr [si], 10E4h

loc_9C87B:
		mov	dword ptr [si+6], 0

loc_9C883:
		mov	word ptr [si+2], 0

loc_9C888:
		mov	byte ptr [si+4], 0

loc_9C88C:
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 1ADCh
		push	ax
		call	Debris_BodyReset
		pop	cx
		mov	word ptr [si+2Ch], 0
		mov	word ptr [si], 1BDEh
		push	si
		call	Camera_MarkRecalc
		pop	cx
		mov	word ptr [si], 1C6Ah

loc_9C8AF:
		mov	dword ptr [si+2Eh], 0

loc_9C8B7:
		mov	word ptr [si+32h], 0

loc_9C8BC:
		push	large [bp+var_4]
		push	si
		nop
		push	cs

loc_9C8C3:
		call	near ptr Camera_AttachSubcomponentWrapper_9C90B
		add	sp, 6
		inc	word_70472
		mov	ax, si
		jmp	short loc_9C8D3
; ���������������������������������������������������������������������������

loc_9C8D1:				; CODE XREF: Debris_ResetBodyAndMarkCamera_9C85A+1Bj
		mov	ax, si

loc_9C8D3:				; CODE XREF: Debris_ResetBodyAndMarkCamera_9C85A+75j
		mov	si, ax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Bh	; '+'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		mov	eax, [bp+var_8]
		mov	[si+6],	eax
		push	si
		les	bx, [bp+arg_0]

loc_9C8F0:
		push	word ptr es:[bx+35h]
		mov	bx, es:[bx+35h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_A], ax
		mov	[si+2Ch], ax
		mov	ax, si
		pop	si
		leave
		retf
Debris_ResetBodyAndMarkCamera_9C85A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle Camera_AttachSubcomponent.
; ==============================================================================================
Camera_AttachSubcomponentWrapper_9C90B	proc far		; CODE XREF: VROOMM_StubThunk_6C08AJ
					; Debris_ResetBodyAndMarkCamera_9C85A:loc_9C8C3p

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	Camera_AttachSubcomponent
		add	sp, 6
		les	bx, [si+0Eh]
		mov	ax, es:[bx+37h]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[si+2Eh], eax
		or	byte ptr [si+4], 1
		pop	si
		leave
		retf
Camera_AttachSubcomponentWrapper_9C90B	endp

ovr304		ends
