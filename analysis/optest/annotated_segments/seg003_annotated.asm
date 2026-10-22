seg003		segment	byte public 'CODE' use16
		assume cs:seg003
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_43D8	proc far		; CODE XREF: Conv_Construct_59B67+8AP
					; sub_59C24+8AP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+1Ch], 0
		mov	word ptr [si+6], 0
		xor	dx, dx
		jmp	short loc_43F7
; ���������������������������������������������������������������������������

loc_43ED:				; CODE XREF: sub_43D8+22j
		mov	bx, dx
		shl	bx, 1
		mov	word ptr [bx+si+8], 0
		inc	dx

loc_43F7:				; CODE XREF: sub_43D8+13j
		cmp	dx, 0Ah
		jl	short loc_43ED
		pop	si
		pop	bp
		retf
sub_43D8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_43FF	proc far		; CODE XREF: sub_59CDE+26P
					; sub_5D047+14P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		call	sub_2FEE0
		add	sp, 2
		xor	di, di
		jmp	short loc_442D
; ���������������������������������������������������������������������������

loc_4414:				; CODE XREF: sub_43FF+31j
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+si+8]
		call	Heap_FreeAndCoalesce_2C3FC
		add	sp, 2
		mov	bx, di
		shl	bx, 1
		mov	word ptr [bx+si+8], 0
		inc	di

loc_442D:				; CODE XREF: sub_43FF+13j
		cmp	di, 0Ah
		jl	short loc_4414
		pop	di
		pop	si
		pop	bp
		retf
sub_43FF	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_4436	proc far		; CODE XREF: sub_449C+14p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		mov	word ptr [si+1Ch], 0
		mov	[bp+var_4], 0
		jmp	short loc_4480
; ���������������������������������������������������������������������������

loc_4455:				; CODE XREF: sub_4436+59j
		push	di
		mov	bx, [bp+var_4]
		push	word ptr [bx+0Eh]
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_4480
		mov	bx, [bp+var_4]
		mov	ax, [bx+10h]
		cmp	ax, [bp+arg_4]
		jnz	short loc_4480
		mov	ax, [bp+var_4]
		mov	[si+1Ch], ax
		mov	[bp+var_2], 1
		jmp	short loc_4491
; ���������������������������������������������������������������������������

loc_4480:				; CODE XREF: sub_4436+1Dj sub_4436+30j ...
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	sub_2FF1E
		add	sp, 4
		or	ax, ax
		jnz	short loc_4455

loc_4491:				; CODE XREF: sub_4436+48j
		mov	al, byte ptr [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_4436	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_449C	proc far		; CODE XREF: sub_5A225+1C4P
					; ConvData_LoadBackground_5A4E6+260P ...

var_B4		= word ptr -0B4h
var_53		= dword	ptr -53h
var_47		= word ptr -47h
var_43		= dword	ptr -43h
var_3C		= word ptr -3Ch
var_3A		= dword	ptr -3Ah
var_35		= byte ptr -35h
var_34		= dword	ptr -34h
var_2F		= byte ptr -2Fh
var_2E		= word ptr -2Eh
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0B4h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_4436
		add	sp, 6
		or	al, al
		jz	short loc_44E9
		mov	ax, [si+1Ch]
		cmp	ax, [si+2]
		jz	short loc_44DC
		push	0
		push	word ptr [si+1Ch]
		push	si
		call	LinkedListB_FindByKey_2FE79
		add	sp, 6
		push	word ptr [si+1Ch]
		push	si
		call	sub_2FDCC
		add	sp, 4

loc_44DC:				; CODE XREF: sub_449C+24j
		mov	ax, [si+1Ch]
		add	ax, 4
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	loc_48E0
; ���������������������������������������������������������������������������

loc_44E9:				; CODE XREF: sub_449C+1Cj
		cmp	word ptr [si+6], 0Ah
		jl	short loc_44F2
		jmp	loc_48D3
; ���������������������������������������������������������������������������

loc_44F2:				; CODE XREF: sub_449C+51j
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	short loc_4525
; ���������������������������������������������������������������������������

loc_44FE:				; CODE XREF: sub_449C+8Fj
		mov	bx, [bp+var_4]
		shl	bx, 1
		push	word ptr [bx+si+8]
		push	[bp+arg_2]
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_4522
		mov	bx, [bp+var_4]
		shl	bx, 1
		mov	ax, [bx+si+8]
		mov	[bp+var_2], ax
		jmp	short loc_452D
; ���������������������������������������������������������������������������

loc_4522:				; CODE XREF: sub_449C+77j
		inc	[bp+var_4]

loc_4525:				; CODE XREF: sub_449C+60j
		mov	ax, [si+6]
		cmp	ax, [bp+var_4]
		jg	short loc_44FE

loc_452D:				; CODE XREF: sub_449C+84j
		cmp	[bp+var_2], 0
		jnz	short loc_454C
		push	[bp+arg_2]
		call	CRT_Strdup
		add	sp, 2
		mov	bx, [si+6]
		shl	bx, 1
		mov	[bx+si+8], ax
		mov	[bp+var_2], ax
		inc	word ptr [si+6]

loc_454C:				; CODE XREF: sub_449C+95j
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_8], ax
		push	12h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_A], ax
		or	ax, ax
		jz	short loc_45BA
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 5CEh
		mov	bx, [bp+var_A]
		mov	word ptr [bx+2], 0
		mov	bx, [bp+var_A]
		mov	word ptr [bx], 1277h
		mov	bx, [bp+var_A]
		mov	dword ptr [bx+4], 0
		mov	bx, [bp+var_A]
		mov	byte ptr [bx+8], 2
		mov	bx, [bp+var_A]
		mov	byte ptr [bx+9], 0
		mov	bx, [bp+var_A]
		mov	dword ptr [bx+0Ah], 0
		mov	bx, [bp+var_A]
		mov	ax, [bp+var_6]
		mov	[bx+0Eh], ax
		mov	bx, [bp+var_A]
		mov	ax, [bp+var_8]
		mov	[bx+10h], ax
		mov	ax, [bp+var_A]
		jmp	short loc_45BD
; ���������������������������������������������������������������������������

loc_45BA:				; CODE XREF: sub_449C+CBj
		mov	ax, [bp+var_A]

loc_45BD:				; CODE XREF: sub_449C+11Cj
		mov	di, ax
		push	di
		push	si
		call	sub_2FDCC
		add	sp, 4
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_3D2BA
		add	sp, 6
		push	[bp+arg_4]
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	ax, [bp+var_47]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_45FC
		mov	eax, [bp+var_53]
		jmp	short loc_4600
; ���������������������������������������������������������������������������

loc_45FC:				; CODE XREF: sub_449C+158j
		mov	eax, [bp+var_43]

loc_4600:				; CODE XREF: sub_449C+15Ej
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 0
		jnz	short loc_460E
		jmp	loc_48A4
; ���������������������������������������������������������������������������

loc_460E:				; CODE XREF: sub_449C+16Dj
		mov	[bp+var_11], 1
		cmp	[bp+var_E], 0FFFCh
		jle	short loc_4620
		mov	[bp+var_11], 0

loc_4620:				; CODE XREF: sub_449C+17Ej
		push	0
		push	3
		push	661Ah
		call	Memory_TypedAllocDispatchC_2B95B
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[bp+var_16], eax
		push	0
		push	2
		push	661Ah
		call	Memory_TypedAllocDispatchC_2B95B
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 6
		mov	[bp+var_1A], eax
		cmp	[bp+var_11], 0
		jnz	short loc_4661
		jmp	loc_4713
; ���������������������������������������������������������������������������

loc_4661:				; CODE XREF: sub_449C+1C0j
		mov	eax, [bp+var_E]
		cmp	eax, [bp+var_16]
		jl	short loc_466E
		jmp	loc_4713
; ���������������������������������������������������������������������������

loc_466E:				; CODE XREF: sub_449C+1CDj
		mov	eax, [bp+var_E]
		mov	[bp+var_1E], eax
		push	0
		push	0
		push	3
		push	large [bp+var_1E]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_22+2],	dx
		mov	word ptr [bp+var_22], ax
		mov	eax, [bp+var_22]
		mov	[di+4],	eax
		mov	byte ptr [di+8], 3
		mov	byte ptr [di+9], 1
		mov	dword ptr [di+0Ah], 0
		mov	eax, [bp+var_1E]
		mov	[di+0Ah], eax
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_4713
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8
		mov	ax, di
		add	ax, 4
		mov	[bp+var_24], ax
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		mov	ax, [bp+var_24]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_4713:				; CODE XREF: sub_449C+1C2j
					; sub_449C+1CFj ...
		mov	eax, [bp+var_E]
		cmp	eax, [bp+var_1A]
		jl	short loc_4720
		jmp	loc_47C5
; ���������������������������������������������������������������������������

loc_4720:				; CODE XREF: sub_449C+27Fj
		mov	eax, [bp+var_E]
		mov	[bp+var_28], eax
		push	0
		push	0
		push	2
		push	large [bp+var_28]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_2C+2],	dx
		mov	word ptr [bp+var_2C], ax
		mov	eax, [bp+var_2C]
		mov	[di+4],	eax
		mov	byte ptr [di+8], 2
		mov	byte ptr [di+9], 1
		mov	dword ptr [di+0Ah], 0
		mov	eax, [bp+var_28]
		mov	[di+0Ah], eax
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_47C5
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8
		mov	ax, di
		add	ax, 4
		mov	[bp+var_2E], ax
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		mov	ax, [bp+var_2E]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_47C5:				; CODE XREF: sub_449C+281j
					; sub_449C+2E0j
		mov	[bp+var_2F], 2
		cmp	[bp+var_11], 0
		jz	short loc_47D3
		mov	[bp+var_2F], 3

loc_47D3:				; CODE XREF: sub_449C+331j
		mov	al, [bp+var_2F]
		push	ax
		push	large [bp+var_E]
		push	si
		nop
		push	cs
		call	near ptr sub_48E4
		add	sp, 8
		mov	eax, [bp+var_E]
		mov	[bp+var_34], eax
		mov	al, [bp+var_2F]
		mov	[bp+var_35], al
		push	1
		push	0
		mov	al, [bp+var_35]
		push	ax
		push	large [bp+var_34]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_3A+2],	dx
		mov	word ptr [bp+var_3A], ax
		mov	eax, [bp+var_3A]
		mov	[di+4],	eax
		mov	al, [bp+var_35]
		mov	[di+8],	al
		mov	byte ptr [di+9], 1
		mov	dword ptr [di+0Ah], 0
		mov	eax, [bp+var_34]
		mov	[di+0Ah], eax
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		or	ax, dx
		jz	short loc_4895
		push	0
		mov	al, [di+8]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8
		mov	ax, di
		add	ax, 4
		mov	[bp+var_3C], ax
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		mov	ax, [bp+var_3C]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_48A2
; ���������������������������������������������������������������������������

loc_4895:				; CODE XREF: sub_449C+3AEj
		push	0
		push	1268h
		call	sub_310B
		add	sp, 4

loc_48A2:				; CODE XREF: sub_449C+3F7j
		jmp	short loc_48C2
; ���������������������������������������������������������������������������

loc_48A4:				; CODE XREF: sub_449C+16Fj
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_10], ax
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		mov	ax, [bp+var_10]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_48C2:				; CODE XREF: sub_449C:loc_48A2j
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4
		jmp	short loc_48E0
; ���������������������������������������������������������������������������

loc_48D3:				; CODE XREF: sub_449C+53j
		push	1
		push	1268h
		call	sub_310B
		add	sp, 4

loc_48E0:				; CODE XREF: sub_449C+4Aj
					; sub_449C+435j
		pop	di
		pop	si
		leave
		retf
sub_449C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_48E4	proc far		; CODE XREF: sub_449C+342p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		jmp	short loc_4938
; ���������������������������������������������������������������������������

loc_48F8:				; CODE XREF: sub_48E4+59j
		cmp	word ptr [si+4], 0
		jz	short loc_492B
		push	0
		push	word ptr [si+4]
		push	si
		call	LinkedListB_FindAndDispatch_2FE19
		add	sp, 6
		push	0
		push	0
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		jmp	short loc_4938
; ���������������������������������������������������������������������������

loc_492B:				; CODE XREF: sub_48E4+18j
		push	2
		push	1268h
		call	sub_310B
		add	sp, 4

loc_4938:				; CODE XREF: sub_48E4+12j sub_48E4+45j
		cmp	[bp+var_4], 0
		jz	short loc_48F8
		push	0
		mov	al, [bp+arg_6]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		pop	si
		leave
		retf
sub_48E4	endp

; ���������������������������������������������������������������������������

loc_4957:				; DATA XREF: dseg:1277o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_49B8
		mov	word ptr [si], 1277h
		mov	word ptr [si+0Eh], 0
		cmp	byte ptr [si+9], 0
		jz	short loc_4995
		cmp	dword ptr [si+4], 0
		jz	short loc_4995
		push	0
		mov	al, [si+8]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_4995:				; CODE XREF: seg003:05A3j seg003:05AAj
		mov	dword ptr [si+4], 0
		mov	byte ptr [si+9], 0
		mov	dword ptr [si+0Ah], 0
		test	di, 1
		jz	short loc_49B8
		push	si
		call	sub_308
		add	sp, 2

loc_49B8:				; CODE XREF: seg003:0594j seg003:05DDj
		pop	di
		pop	si
		pop	bp
		retf
seg003		ends
