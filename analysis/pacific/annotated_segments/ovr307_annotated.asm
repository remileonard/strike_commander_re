ovr307		segment	para public 'OVERLAY' use16
		assume cs:ovr307
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_ADA30		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+82h], 0
		mov	dword ptr es:[bx+7Eh], 0
		push	si
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_743B0
		add	sp, 6
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 61h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_74269
		add	sp, 6
		push	0
		push	large 54504B43h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_ADAB0
		push	24h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_ADA8F
		jmp	short loc_ADA91

loc_ADA8F:
		mov	ax, dx

loc_ADA91:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8Ah], ds
		mov	es:[bx+88h], ax
		push	large 24h
		push	large es:[bx+88h]
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah

loc_ADAB0:
		push	0
		push	large 54504354h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_ADAF8
		push	34h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax
		jz	short loc_ADAD5
		jmp	short loc_ADAD7

loc_ADAD5:
		mov	ax, dx

loc_ADAD7:
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+8Eh], ds
		mov	es:[bx+8Ch], ax
		push	large 34h
		push	large es:[bx+8Ch]
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		jmp	short loc_ADB05

loc_ADAF8:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+8Ch], 0

loc_ADB05:
		push	0
		push	large 43454A45h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_ADB37
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 6Fh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_294DB
		add	sp, 6
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+6Dh], 1
		jmp	short loc_ADB3F

loc_ADB37:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+6Dh], 0

loc_ADB3F:
		push	0
		push	large 464E494Ah
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_ADB57
		jmp	loc_ADBD7

loc_ADB57:
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+66h], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+67h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+69h], ax
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+65h], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+78h], ax
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Ch], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+7Ah], ax
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Bh], al
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+7Ch], ax
		jmp	short loc_ADBFA

loc_ADBD7:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+66h], 0
		mov	byte ptr es:[bx+65h], 2
		mov	word ptr es:[bx+78h], 5
		mov	byte ptr es:[bx+6Ch], 0
		mov	byte ptr es:[bx+6Bh], 6
		mov	word ptr es:[bx+7Ch], 1Eh

loc_ADBFA:
		push	0
		push	large 52414547h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_ADC1C
		push	si
		push	large [bp+arg_0]
		call	sub_3D430
		add	sp, 6

loc_ADC1C:
		push	0
		push	large 414B4142h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_ADC44
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 90h
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_294DB
		add	sp, 6

loc_ADC44:
		pop	si
		pop	bp
		retf
sub_ADA30		endp
ovr307		ends
