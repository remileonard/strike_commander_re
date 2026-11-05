ovr364		segment	para public 'OVERLAY' use16
		assume cs:ovr364
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CA3E0		proc far

var_FE		= word ptr -0FEh
var_A1		= dword ptr -0A1h
var_9D		= dword ptr -9Dh
var_99		= dword ptr -99h
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0FEh
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+4EEh], 0FEh
		jnz	short loc_CA3F5
		jmp	loc_CA533

loc_CA3F5:
		cmp	byte ptr [si+4EEh], 0BEh
		jbe	short loc_CA405
		push	0FE36h
		call	sub_1DDFE
		pop	cx

loc_CA405:
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aGameflow_1
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		mov	ax, si
		add	ax, 3F0h
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		mov	ax, si
		add	ax, 3F0h
		mov	[bp+var_2], ax
		lea	ax, [bp+var_FE]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_FE], 508h
		mov	[bp+var_9D], 100h
		mov	[bp+var_A1], 0
		mov	[bp+var_FE], 520h
		push	1
		push	[bp+var_2]
		lea	ax, [bp+var_FE]
		push	ax
		mov	bx, [bp+var_FE]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 54534C4Dh
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_CA49C
		push	0FE34h
		call	sub_1DDFE
		pop	cx

loc_CA49C:
		push	0
		push	large 41544144h
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_CA4BE
		push	0FE35h
		call	sub_1DDFE
		pop	cx

loc_CA4BE:
		mov	al, [si+4EEh]
		mov	ah, 0
		shl	ax, 3
		movsx	eax, ax
		mov	edx, [bp+var_99]
		add	edx, eax
		mov	[bp+var_6], edx
		mov	eax, [bp+var_6]
		mov	[bp+var_99], eax
		push	large 8
		push	ds
		mov	ax, si
		add	ax, 7BAh
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	byte ptr [si+7C2h], 0
		mov	ax, si
		add	ax, 7BAh
		push	ax
		call	CRT_Strupr_30EF
		pop	cx
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		mov	[bp+var_FE], 520h
		lea	ax, [bp+var_FE]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_FE]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4

loc_CA533:
		pop	si
		leave
		retf
sub_CA3E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CA536		proc far

var_F8		= word ptr -0F8h
var_9B		= dword ptr -9Bh
var_97		= dword ptr -97h
var_50		= word ptr -50h
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	51h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	41h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	1
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_F8], 508h
		mov	[bp+var_97], 100h
		mov	[bp+var_9B], 0
		mov	[bp+var_F8], 520h
		push	1
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		mov	bx, [bp+var_F8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 4E525453h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_CA5F7
		push	0
		push	large [bp+arg_0]
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_CA5F7
		push	ds
		push	[bp+arg_4]
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_ReadDwordFieldB_6DB78
		add	sp, 6
		jmp	short loc_CA600

loc_CA5F7:
		push	0FEEDh
		call	sub_1DDFE
		pop	cx

loc_CA600:
		mov	[bp+var_F8], 520h
		lea	ax, [bp+var_F8]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_F8]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		mov	al, 1
		leave
		retf
sub_CA536		endp
ovr364		ends
