seg064		segment	byte public 'CODE' use16
		assume cs:seg064
		;org 8
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_29B88	proc far		; CODE XREF: sub_29C6B+140p

var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	[bp+arg_4]
		push	di
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	ax, [di+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_29BB3
		mov	eax, [di+61h]
		jmp	short loc_29BB7
; ���������������������������������������������������������������������������

loc_29BB3:				; CODE XREF: sub_29B88+23j
		mov	eax, [di+71h]

loc_29BB7:				; CODE XREF: sub_29B88+29j
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_29BC5
		jmp	loc_29C67
; ���������������������������������������������������������������������������

loc_29BC5:				; CODE XREF: sub_29B88+38j
		cmp	byte ptr [si+3Bh], 0
		jz	short loc_29BEB
		cmp	dword ptr [si+36h], 0
		jz	short loc_29BEB
		push	0
		mov	al, [si+3Ah]
		push	ax
		mov	ax, si
		add	ax, 36h	; '6'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_29BEB:				; CODE XREF: sub_29B88+41j
					; sub_29B88+48j
		mov	dword ptr [si+36h], 0
		mov	byte ptr [si+3Bh], 0
		mov	dword ptr [si+3Ch], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		push	1
		push	0
		push	3
		push	large [bp+var_8]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		mov	eax, [bp+var_C]
		mov	[si+36h], eax
		mov	byte ptr [si+3Ah], 3
		mov	byte ptr [si+3Bh], 1
		mov	dword ptr [si+3Ch], 0
		mov	eax, [bp+var_8]
		mov	[si+3Ch], eax
		push	0
		mov	al, [si+3Ah]
		push	ax
		push	word ptr [si+38h]
		push	word ptr [si+36h]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+arg_4]
		push	di
		call	IndexedRecordReader_SeekToIndex_3D4DD
		add	sp, 8

loc_29C67:				; CODE XREF: sub_29B88+3Aj
		pop	di
		pop	si
		leave
		retf
sub_29B88	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_29C6B	proc far		; CODE XREF: seg062:02B7P

var_FE		= word ptr -0FEh
var_86		= word ptr -86h
var_25		= dword	ptr -25h
var_21		= dword	ptr -21h
var_19		= word ptr -19h
var_15		= dword	ptr -15h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0FEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_4], 0
		cmp	word ptr [si+34h], 0
		jnz	short loc_29C89
		jmp	loc_29E44
; ���������������������������������������������������������������������������

loc_29C89:				; CODE XREF: sub_29C6B+19j
		push	1
		push	si
		nop
		push	cs
		call	near ptr sub_29E4F
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_29CA5
		mov	al, [si+40h]
		cmp	al, [bp+arg_8]
		jb	short loc_29CA5
		jmp	loc_29E44
; ���������������������������������������������������������������������������

loc_29CA5:				; CODE XREF: sub_29C6B+2Dj
					; sub_29C6B+35j
		mov	[bp+var_6], 0
		jmp	short loc_29CF1
; ���������������������������������������������������������������������������

loc_29CAC:				; CODE XREF: sub_29C6B+8Cj
		mov	ax, [bp+var_6]
		shl	ax, 3
		mov	dx, si
		add	dx, ax
		add	dx, 4
		mov	di, dx
		push	[bp+arg_2]
		push	word ptr [di+2]
		call	CRT_Stricmp
		add	sp, 4
		or	ax, ax
		jnz	short loc_29CEE
		mov	ax, [di+4]
		cmp	ax, [bp+arg_4]
		jnz	short loc_29CEE
		mov	ax, [di+6]
		cmp	ax, [bp+arg_6]
		jle	short loc_29CEE
		mov	ax, [bp+arg_6]
		mov	dx, 0Ah
		imul	dx
		mov	dx, [di]
		add	dx, ax
		mov	[bp+var_4], dx
		jmp	short loc_29CF9
; ���������������������������������������������������������������������������

loc_29CEE:				; CODE XREF: sub_29C6B+60j
					; sub_29C6B+68j ...
		inc	[bp+var_6]

loc_29CF1:				; CODE XREF: sub_29C6B+3Fj
		mov	ax, [si+41h]
		cmp	ax, [bp+var_6]
		jg	short loc_29CAC

loc_29CF9:				; CODE XREF: sub_29C6B+81j
		cmp	[bp+var_4], 0
		jz	short loc_29D02
		jmp	loc_29DD7
; ���������������������������������������������������������������������������

loc_29D02:				; CODE XREF: sub_29C6B+92j
		push	ds
		push	[bp+arg_2]
		call	sub_6734
		add	sp, 4
		or	al, al
		jnz	short loc_29D15
		jmp	loc_29DD7
; ���������������������������������������������������������������������������

loc_29D15:				; CODE XREF: sub_29C6B+A5j
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_86]
		push	ax
		mov	bx, [bp+var_86]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	[bp+arg_4]
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_3D69C
		add	sp, 4
		mov	eax, [bp+var_21]
		mov	[bp+var_A], eax
		mov	ax, [bp+var_19]
		and	ax, 0C0h
		cmp	ax, 0C0h ; '�'
		jnz	short loc_29D5F
		mov	eax, [bp+var_25]
		jmp	short loc_29D63
; ���������������������������������������������������������������������������

loc_29D5F:				; CODE XREF: sub_29C6B+ECj
		mov	eax, [bp+var_15]

loc_29D63:				; CODE XREF: sub_29C6B+F2j
		mov	edx, [bp+var_A]
		add	edx, eax
		mov	[bp+var_E], edx
		mov	eax, [bp+var_A]
		cmp	eax, [bp+var_E]
		jz	short loc_29DC0
		lea	ax, [bp+var_FE]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_3D28A
		add	sp, 2
		push	0
		push	large [bp+var_E]
		push	large [bp+var_A]
		lea	ax, [bp+var_86]
		push	ax
		lea	ax, [bp+var_FE]
		push	ax
		call	StreamReader_ConstructAndBind_3B393
		add	sp, 0Eh
		push	[bp+arg_6]
		lea	ax, [bp+var_FE]
		push	ax
		push	si
		push	cs
		call	near ptr sub_29B88
		add	sp, 6
		push	2
		lea	ax, [bp+var_FE]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_29DC0:				; CODE XREF: sub_29C6B+10Bj
		mov	ax, si
		add	ax, 36h	; '6'
		mov	[bp+var_4], ax
		push	2
		lea	ax, [bp+var_86]
		push	ax
		call	IndexedRecordReader_Destruct_3D240
		add	sp, 4

loc_29DD7:				; CODE XREF: sub_29C6B+94j
					; sub_29C6B+A7j
		cmp	[bp+var_4], 0
		jz	short loc_29E44
		mov	bx, [bp+var_4]
		cmp	dword ptr [bx],	0
		jz	short loc_29E44
		push	0
		mov	bx, [bp+var_4]
		mov	al, [bx+4]
		push	ax
		mov	bx, [bp+var_4]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		cmp	[bp+var_A], 0
		jz	short loc_29E44
		mov	ax, [bp+var_4]
		mov	[si+43h], ax
		mov	bx, [si+34h]
		mov	di, [bx+4]
		push	0FFFFh
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		push	di
		call	sub_30BC4
		add	sp, 8
		push	di
		call	sub_30BD6
		add	sp, 2
		mov	[bp+var_1], 1
		mov	al, [bp+arg_8]
		mov	[si+40h], al
		mov	word ptr [si+49h], 0

loc_29E44:				; CODE XREF: sub_29C6B+1Bj
					; sub_29C6B+37j ...
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_29C6B	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_29E4F	proc far		; CODE XREF: seg062:030FP
					; sub_29C6B+23p

var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		cmp	word ptr [si+34h], 0
		jz	short loc_29E8C
		mov	bx, [si+34h]
		push	word ptr [bx+4]
		call	sub_30BD0
		add	sp, 2
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 2
		jnz	short loc_29E87
		mov	al, [si+40h]
		cmp	al, [bp+arg_2]
		jb	short loc_29E87
		mov	ax, 1
		jmp	short loc_29E89
; ���������������������������������������������������������������������������

loc_29E87:				; CODE XREF: sub_29E4F+29j
					; sub_29E4F+31j
		xor	ax, ax

loc_29E89:				; CODE XREF: sub_29E4F+36j
		mov	[bp+var_1], al

loc_29E8C:				; CODE XREF: sub_29E4F+12j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_29E4F	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		cmp	word ptr [si+34h], 0
		jnz	short loc_29EA9
		jmp	loc_29F49
; ���������������������������������������������������������������������������

loc_29EA9:				; CODE XREF: seg064:0324j
		mov	bx, [si+34h]
		push	word ptr [bx+4]
		call	sub_30BD0
		add	sp, 2
		mov	[bp-2],	ax
		cmp	word ptr [bp-2], 2
		jnz	short loc_29EC3
		jmp	loc_29F49
; ���������������������������������������������������������������������������

loc_29EC3:				; CODE XREF: seg064:033Ej
		cmp	word ptr [si+49h], 0
		jz	short loc_29F06
		mov	bx, [si+34h]
		mov	di, [bx+4]
		push	0FFFFh
		push	0
		mov	bx, [si+43h]
		mov	al, [bx+4]
		push	ax
		mov	bx, [si+43h]
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	sub_30BC4
		add	sp, 8
		push	di
		call	sub_30BD6
		add	sp, 2
		dec	word ptr [si+49h]
		jmp	short loc_29F49
; ���������������������������������������������������������������������������

loc_29F06:				; CODE XREF: seg064:0347j
		mov	word ptr [si+43h], 0
		cmp	byte ptr [si+3Bh], 0
		jz	short loc_29F31
		cmp	dword ptr [si+36h], 0
		jz	short loc_29F31
		push	0
		mov	al, [si+3Ah]
		push	ax
		mov	ax, si
		add	ax, 36h	; '6'
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_29F31:				; CODE XREF: seg064:038Fj seg064:0396j
		mov	dword ptr [si+36h], 0
		mov	byte ptr [si+3Bh], 0
		mov	dword ptr [si+3Ch], 0
		mov	byte ptr [si+40h], 0

loc_29F49:				; CODE XREF: seg064:0326j seg064:0340j ...
		pop	di
		pop	si
		leave
		retf
seg064		ends
