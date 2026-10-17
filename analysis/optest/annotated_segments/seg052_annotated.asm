seg052		segment	byte public 'CODE' use16
		assume cs:seg052
		;org 0Ah
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_21E2A:				; DATA XREF: dseg:3380o
		push	bp
		mov	bp, sp
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_21E33	proc far		; CODE XREF: sub_C2BC0+21AP
					; sub_C2BC0+2BBP

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_443B1, cl
		push	si
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		call	sub_429DA
		add	sp, 6
		push	0
		push	large 4E474C41h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_21E80
		push	si
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+23h], al
		jmp	short loc_21E88
; ���������������������������������������������������������������������������

loc_21E80:				; CODE XREF: sub_21E33+39j
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+23h], 0

loc_21E88:				; CODE XREF: sub_21E33+4Bj
		pop	si
		pop	bp
		retf
sub_21E33	endp

; ���������������������������������������������������������������������������

loc_21E8B:				; DATA XREF: dseg:337Co
		push	bp
		mov	bp, sp
		push	si
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	0
		nop
		push	cs
		call	near ptr sub_21F29
		add	sp, 6
		mov	si, ax
		push	si
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		call	sub_429E9
		add	sp, 6
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_21ED3
		push	51h ; 'Q'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_21F21

loc_21ED3:				; CODE XREF: seg052:00A1j
		mov	word ptr [si], 3340h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 32B4h
		push	si
		call	Debris_BodyReset
		add	sp, 2
		mov	word ptr [si], 338Ch
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	sub_25718
		add	sp, 2
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Matrix_BuildFromAngle_2574E
		add	sp, 2
		mov	byte ptr [si+50h], 0
		or	byte ptr [si+4], 10h

loc_21F21:				; CODE XREF: seg052:00B1j
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_21F29	proc far		; CODE XREF: seg051:041EP seg052:0079p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_21F47
		push	51h ; 'Q'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_21FB6

loc_21F47:				; CODE XREF: sub_21F29+Cj
		mov	word ptr [si], 3340h
		mov	dword ptr [si+6], 0
		mov	word ptr [si+2], 0
		mov	byte ptr [si+4], 0
		mov	byte ptr [si+5], 0
		mov	word ptr [si], 32B4h
		push	si
		call	Debris_BodyReset
		add	sp, 2
		mov	word ptr [si], 338Ch
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	sub_25718
		add	sp, 2
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	word ptr [bp+var_4+2]
		push	word ptr [bp+var_4]
		push	si
		call	sub_210C0
		add	sp, 6
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Matrix_BuildFromAngle_2574E
		add	sp, 2
		mov	byte ptr [si+50h], 0
		or	byte ptr [si+4], 10h
		les	bx, [bp+var_4]
		mov	al, es:[bx+23h]
		mov	[si+50h], al

loc_21FB6:				; CODE XREF: sub_21F29+1Cj
		mov	ax, si
		pop	si
		leave
		retf
sub_21F29	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_21FBE:				; DATA XREF: dseg:33A4o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_21FEB
		mov	word ptr [si], 338Ch
		push	0
		push	si
		call	sub_4299A
		add	sp, 4
		test	di, 1
		jz	short loc_21FEB
		push	si
		call	sub_308
		add	sp, 2

loc_21FEB:				; CODE XREF: seg052:01ABj seg052:01C0j
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21FEF:				; DATA XREF: dseg:33C0o
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	al, 1
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_21FFB:				; DATA XREF: dseg:33A0o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		call	sub_211F1
		add	sp, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2200E:				; DATA XREF: dseg:33B8o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		push	word ptr [bp+8]
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	Matrix_BuildFullOrientation_26047
		add	sp, 8
		push	si
		call	sub_211F1
		add	sp, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_22038:				; DATA XREF: dseg:33BCo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+8]
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	WorldObject_BuildOrientationMatrix_2589B
		add	sp, 4
		push	si
		call	sub_211F1
		add	sp, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2205C:				; DATA XREF: dseg:33C8o
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	ax, dx
		add	ax, 2Ch	; ','
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2206B:				; DATA XREF: dseg:3404o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+26h], 0
		jz	short loc_22089
		push	si
		mov	bx, [si]
		call	dword ptr [bx+74h]
		add	sp, 2
		mov	ax, [si+26h]
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_22091
; ���������������������������������������������������������������������������

loc_22089:				; CODE XREF: seg052:0256j
		mov	ax, si
		add	ax, 2Ch	; ','
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_22091:				; CODE XREF: seg052:0267j
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_22094:				; DATA XREF: dseg:33F8o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		push	word ptr [bp+8]
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_220B6:				; DATA XREF: dseg:33FCo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		push	word ptr [bp+8]
		call	Matrix_LocalToWorld_27393
		add	sp, 4
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_220D8:				; DATA XREF: dseg:33CCo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [bp+8]
		mov	ax, si
		add	ax, 2Ch	; ','
		push	ax
		call	sub_2581F
		add	sp, 4
		push	si
		call	sub_211F1
		add	sp, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_220FC:				; DATA XREF: dseg:339Co
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		call	sub_214D3
		add	sp, 2
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_22112:				; DATA XREF: dseg:3400o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		cmp	word ptr [si+26h], 0
		jz	short loc_22166
		mov	bx, [si+26h]
		mov	al, [bx+30h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_22166
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		add	sp, 2
		push	ax
		push	word ptr [si+26h]
		call	sub_2581F
		add	sp, 4
		push	word ptr [si+24h]
		mov	bx, [si+24h]
		mov	bx, [bx]
		call	dword ptr [bx+78h]
		add	sp, 2
		push	ax
		push	word ptr [si+26h]
		call	sub_26253
		add	sp, 4
		mov	bx, [si+26h]
		or	byte ptr [bx+30h], 2

loc_22166:				; CODE XREF: seg052:02FDj seg052:030Ej
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_22169:				; DATA XREF: dseg:33A8o
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_22171:				; DATA XREF: dseg:33F0o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	di
		push	di
		call	sub_2621D
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_2218A:				; DATA XREF: dseg:33F4o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	di
		push	di
		call	sub_26253
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
seg052		ends
