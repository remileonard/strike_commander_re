seg056		segment	byte public 'CODE' use16
		assume cs:seg056
		;org 3
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_22DD3	proc far		; CODE XREF: sub_22E2A+Fp sub_22E6C+Fp ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp

loc_22DD6:				; DATA XREF: seg170:0286o
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_4], eax
		jmp	short loc_22DEE
; ���������������������������������������������������������������������������

loc_22DE6:				; CODE XREF: sub_22DD3+23j
		add	[bp+var_4], 16800h

loc_22DEE:				; CODE XREF: sub_22DD3+11j
		cmp	[bp+var_4], 0FFFF4C00h
		jl	short loc_22DE6
		jmp	short loc_22E02
; ���������������������������������������������������������������������������

loc_22DFA:				; CODE XREF: sub_22DD3+37j
		sub	[bp+var_4], 16800h

loc_22E02:				; CODE XREF: sub_22DD3+25j
		cmp	[bp+var_4], 0B400h
		jg	short loc_22DFA
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_8]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_22DD3	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_22E2A	proc far		; CODE XREF: seg049:0ACDP seg049:0E16P ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	[bp+arg_4]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr sub_22DD3
		add	sp, 6
		push	large [bp+var_8]
		call	Math_CosRaw_26C11
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
sub_22E2A	endp

; ���������������������������������������������������������������������������
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_22E6C	proc far		; CODE XREF: seg029:0559P
					; sub_258D8+6AP ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	[bp+arg_4]
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr sub_22DD3
		add	sp, 6
		push	large [bp+var_8]
		call	sub_26BCB
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
sub_22E6C	endp

; ���������������������������������������������������������������������������
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_22EAE	proc far		; CODE XREF: sub_C157F+94P

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	[bp+arg_4]
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_22DD3
		add	sp, 6
		mov	[bp+var_8], 0
		mov	eax, [bp+var_4]
		or	eax, eax
		jge	short loc_22ED7
		neg	eax

loc_22ED7:				; CODE XREF: sub_22EAE+24j
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		cmp	[bp+var_10], 5A00h
		jnz	short loc_22EF2
		mov	ax, 1
		jmp	short loc_22EF4
; ���������������������������������������������������������������������������

loc_22EF2:				; CODE XREF: sub_22EAE+3Dj
		xor	ax, ax

loc_22EF4:				; CODE XREF: sub_22EAE+42j
		or	al, al
		jz	short loc_22F21
		cmp	[bp+var_4], 0
		jle	short loc_22F04
		mov	ax, 1
		jmp	short loc_22F06
; ���������������������������������������������������������������������������

loc_22F04:				; CODE XREF: sub_22EAE+4Fj
		xor	ax, ax

loc_22F06:				; CODE XREF: sub_22EAE+54j
		or	al, al
		jz	short loc_22F14
		mov	eax, dword_4667A
		mov	[bp+var_8], eax
		jmp	short loc_22F1F
; ���������������������������������������������������������������������������

loc_22F14:				; CODE XREF: sub_22EAE+5Aj
		mov	eax, dword_4667A
		neg	eax
		mov	[bp+var_8], eax

loc_22F1F:				; CODE XREF: sub_22EAE+64j
		jmp	short loc_22F3A
; ���������������������������������������������������������������������������

loc_22F21:				; CODE XREF: sub_22EAE+48j
		push	large [bp+var_4]
		call	Math_Tan_Raw_26C57
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_8], eax

loc_22F3A:				; CODE XREF: sub_22EAE:loc_22F1Fj
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_8]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		leave
		retf
sub_22EAE	endp

; ���������������������������������������������������������������������������
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_22F4E	proc far		; CODE XREF: sub_23030+60p
					; seg057:2E97P	...

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
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		mov	di, si
		mov	eax, [di]
		or	eax, eax
		jge	short loc_22F6E
		neg	eax

loc_22F6E:				; CODE XREF: sub_22F4E+1Bj
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 100h
		jg	short loc_22F89
		mov	ax, 1
		jmp	short loc_22F8B
; ���������������������������������������������������������������������������

loc_22F89:				; CODE XREF: sub_22F4E+34j
		xor	ax, ax

loc_22F8B:				; CODE XREF: sub_22F4E+39j
		or	al, al
		jz	short loc_22FA7
		push	large dword ptr	[si]
		call	Math_AcosRaw_26D4D
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax

loc_22FA7:				; CODE XREF: sub_22F4E+3Fj
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_22F4E	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_22FBF	proc far		; CODE XREF: sub_230B6+60p

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
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		mov	di, si
		mov	eax, [di]
		or	eax, eax
		jge	short loc_22FDF
		neg	eax

loc_22FDF:				; CODE XREF: sub_22FBF+1Bj
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 100h
		jg	short loc_22FFA
		mov	ax, 1
		jmp	short loc_22FFC
; ���������������������������������������������������������������������������

loc_22FFA:				; CODE XREF: sub_22FBF+34j
		xor	ax, ax

loc_22FFC:				; CODE XREF: sub_22FBF+39j
		or	al, al
		jz	short loc_23018
		push	large dword ptr	[si]
		call	Math_AsinRaw_26D0A
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax

loc_23018:				; CODE XREF: sub_22FBF+3Fj
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_22FBF	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_23030	proc far		; CODE XREF: sub_23A1A+C6P
					; sub_23B1A+169P ...

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_6]
		mov	[bp+var_4], 0
		cmp	dword ptr [si],	0
		jnz	short loc_23060
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_23060:				; CODE XREF: sub_23030+1Aj
		mov	[bp+var_6], si
		mov	eax, [di]
		mov	edx, eax
		mov	bx, [bp+var_6]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		lea	ax, [bp+var_E]
		push	ax
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_22F4E
		add	sp, 6
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_23030	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_230B6	proc far		; CODE XREF: sub_23A1A+A7P
					; sub_23B1A+D4P ...

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	si, [bp+arg_6]
		mov	[bp+var_4], 0
		cmp	dword ptr [si],	0
		jnz	short loc_230E6
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_230E6:				; CODE XREF: sub_230B6+1Aj
		mov	[bp+var_6], si
		mov	eax, [di]
		mov	edx, eax
		mov	bx, [bp+var_6]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A], eax
		mov	eax, [bp+var_A]
		mov	[bp+var_E], eax
		lea	ax, [bp+var_E]
		push	ax
		push	ss
		lea	ax, [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_22FBF
		add	sp, 6
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_230B6	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2313C	proc far		; CODE XREF: seg057:0F8FP
					; sub_C157F+144P ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		push	large dword ptr	[si]
		call	sub_26D8D
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_2313C	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		mov	ax, [si+2]
		sar	ax, 0Fh
		or	al, al
		jz	short loc_23191
		mov	ax, 0FFA6h
		jmp	short loc_23194
; ���������������������������������������������������������������������������

loc_23191:				; CODE XREF: seg056:03BAj
		mov	ax, 5Ah	; 'Z'

loc_23194:				; CODE XREF: seg056:03BFj
		mov	[bp-6],	ax
		movsx	eax, word ptr [bp-6]
		shl	eax, 8
		mov	[bp-4],	eax
		mov	eax, [si]
		sar	eax, 10h
		mov	[bp-0Eh], eax
		mov	eax, [bp-0Eh]
		mov	[bp-0Ah], eax
		mov	eax, [di]
		sar	eax, 10h
		mov	[bp-16h], eax
		mov	eax, [bp-16h]
		mov	[bp-12h], eax
		cmp	dword ptr [bp-0Ah], 0FFFFFFFFh
		jnz	short loc_231D9
		mov	dword ptr [bp-0Ah], 0

loc_231D9:				; CODE XREF: seg056:03FFj
		cmp	dword ptr [bp-12h], 0FFFFFFFFh
		jnz	short loc_231E8
		mov	dword ptr [bp-12h], 0

loc_231E8:				; CODE XREF: seg056:040Ej
		cmp	dword ptr [bp-0Ah], 0
		jz	short loc_231F4
		mov	ax, 1
		jmp	short loc_231F6
; ���������������������������������������������������������������������������

loc_231F4:				; CODE XREF: seg056:041Dj
		xor	ax, ax

loc_231F6:				; CODE XREF: seg056:0422j
		or	al, al
		jz	short loc_23220
		cmp	dword ptr [bp-12h], 0
		jnz	short loc_23206
		mov	ax, 1
		jmp	short loc_23208
; ���������������������������������������������������������������������������

loc_23206:				; CODE XREF: seg056:042Fj
		xor	ax, ax

loc_23208:				; CODE XREF: seg056:0434j
		or	al, al
		jz	short loc_23220
		mov	bx, [bp+6]
		mov	eax, [bp-4]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_23220:				; CODE XREF: seg056:0428j seg056:043Aj
		cmp	dword ptr [di],	0
		jz	short loc_2322B
		mov	ax, 1
		jmp	short loc_2322D
; ���������������������������������������������������������������������������

loc_2322B:				; CODE XREF: seg056:0454j
		xor	ax, ax

loc_2322D:				; CODE XREF: seg056:0459j
		or	al, al
		jz	short loc_23270
		mov	[bp-1Ch], di
		mov	eax, [si]
		mov	edx, eax
		mov	bx, [bp-1Ch]
		mov	ecx, [bx]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-20h], eax
		mov	eax, [bp-20h]
		mov	[bp-1Ah], eax
		push	large dword ptr	[bp-1Ah]
		call	sub_26D8D
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp-4],	eax

loc_23270:				; CODE XREF: seg056:045Fj
		mov	bx, [bp+6]
		mov	eax, [bp-4]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_23288	proc far		; CODE XREF: sub_2364D+C7P
					; sub_24763+A1P

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		cmp	dword ptr [si],	0
		jge	short loc_232AA
		mov	[bp+var_4], 0B505h
		jmp	short loc_232C2
; ���������������������������������������������������������������������������

loc_232AA:				; CODE XREF: sub_23288+16j
		push	large dword ptr	[si]
		call	Math_Sqrt_Raw_26E59
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_4], eax

loc_232C2:				; CODE XREF: sub_23288+20j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_23288	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		mov	di, si
		mov	eax, [si]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-8],	eax
		mov	bx, [bp-4]
		mov	eax, [bp-8]
		mov	[bx], eax
		les	bx, [bp-4]
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		mov	bx, [bp+0Eh]
		push	large dword ptr	[bx]
		push	large dword ptr	[di]
		push	large dword ptr	[si]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-4],	eax
		mov	bx, [bp+6]
		mov	eax, [bp-4]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	word ptr [si+1]
		push	3666h
		call	CRT_Msg_NullPtrAssign
		add	sp, 4
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_23379	proc far		; CODE XREF: seg057:1177P seg057:118CP ...

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_2339B
		push	14h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_2339B
		jmp	loc_234C8
; ���������������������������������������������������������������������������

loc_2339B:				; CODE XREF: sub_23379+Dj
					; sub_23379+1Dj
		mov	di, si
		mov	bx, [bp+arg_2]
		cmp	dword ptr [bx],	0
		jl	short loc_233C6
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		and	eax, 0FFh
		mov	[bp+var_8], eax
		jmp	short loc_23400
; ���������������������������������������������������������������������������

loc_233C6:				; CODE XREF: sub_23379+2Bj
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		neg	eax
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_233ED
		mov	byte ptr [di], 2Dh ; '-'
		inc	di

loc_233ED:				; CODE XREF: sub_23379+6Ej
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		neg	eax
		and	eax, 0FFh
		mov	[bp+var_8], eax

loc_23400:				; CODE XREF: sub_23379+4Bj
		mov	ax, word_4667E
		mov	[bp+var_12], ax
		mov	ax, word_46680
		mov	[bp+var_10], ax
		mov	ax, word_46682
		mov	[bp+var_E], ax
		mov	ax, word_46684
		mov	[bp+var_C], ax
		cmp	[bp+arg_4], 3
		jle	short loc_23423
		mov	[bp+arg_4], 3

loc_23423:				; CODE XREF: sub_23379+A3j
		mov	bx, [bp+arg_4]
		shl	bx, 1
		lea	ax, [bp+var_12]
		add	bx, ax
		movsx	eax, word ptr [bx]
		mov	edx, [bp+var_8]
		imul	edx, eax
		mov	[bp+var_8], edx
		mov	eax, [bp+var_8]
		sar	eax, 8
		mov	[bp+var_8], eax
		mov	ax, word ptr [bp+var_8]
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_4]
		dec	ax
		mov	[bp+var_14], ax
		mov	[bp+var_16], 1
		jmp	short loc_23460
; ���������������������������������������������������������������������������

loc_2345D:				; CODE XREF: sub_23379+FFj
		dec	[bp+var_14]

loc_23460:				; CODE XREF: sub_23379+E2j
		cmp	[bp+var_14], 0
		jle	short loc_2347A
		mov	bx, [bp+var_16]
		inc	[bp+var_16]
		shl	bx, 1
		lea	ax, [bp+var_12]
		add	bx, ax
		mov	ax, [bx]
		cmp	ax, [bp+var_A]
		jle	short loc_2345D

loc_2347A:				; CODE XREF: sub_23379+EBj
		push	large [bp+var_4]
		push	3669h
		push	di
		call	CRT_Msg_Sprintf1
		add	sp, 8
		cmp	[bp+arg_4], 0
		jz	short loc_234C8
		jmp	short loc_23493
; ���������������������������������������������������������������������������

loc_23492:				; CODE XREF: sub_23379+11Dj
		inc	di

loc_23493:				; CODE XREF: sub_23379+117j
		cmp	byte ptr [di], 0
		jnz	short loc_23492
		mov	byte ptr [di], 2Eh ; '.'
		mov	[bp+var_18], 1
		jmp	short loc_234AB
; ���������������������������������������������������������������������������

loc_234A2:				; CODE XREF: sub_23379+138j
		mov	bx, [bp+var_18]
		mov	byte ptr [bx+di], 30h ;	'0'
		inc	[bp+var_18]

loc_234AB:				; CODE XREF: sub_23379+127j
		mov	ax, [bp+var_18]
		cmp	ax, [bp+var_14]
		jle	short loc_234A2
		push	[bp+var_A]
		push	366Dh
		mov	ax, di
		add	ax, [bp+var_14]
		inc	ax
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6

loc_234C8:				; CODE XREF: sub_23379+1Fj
					; sub_23379+115j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_23379	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_234D2	proc far		; CODE XREF: seg057:0036P seg057:0045P ...

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_2], ax
		mov	dx, [bp+var_2]
		mov	[bp+var_4], dx
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, [bp+var_4]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		leave
		retf
sub_234D2	endp

; ���������������������������������������������������������������������������
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp-2],	ax
		mov	dx, [bp-2]
		shl	dx, 1
		mov	[bp-4],	dx
		call	CRT_Rand
		movsx	eax, ax
		movsx	edx, word ptr [bp-4]
		imul	eax, edx
		mov	ebx, 8000h
		cdq
		idiv	ebx
		sub	ax, [bp-2]
		leave
		retf
; ���������������������������������������������������������������������������
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp-2],	ax
		call	CRT_Rand
		movsx	eax, ax
		imul	eax, 64h
		mov	ebx, 8000h
		cdq
		idiv	ebx
		mov	[bp-4],	ax
		mov	dx, [bp-4]
		cmp	dx, [bp-2]
		jge	short loc_23569
		mov	al, 1
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short locret_2356D
; ���������������������������������������������������������������������������

loc_23569:				; CODE XREF: seg056:0791j
		mov	al, 0
		leave
		retf
; ���������������������������������������������������������������������������

locret_2356D:				; CODE XREF: seg056:0797j
		leave
		retf
; ���������������������������������������������������������������������������

loc_2356F:				; DATA XREF: dseg:5922o
		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	dword ptr [bp-4], 394Bh
		mov	eax, [bp-4]
		mov	dword_4666E, eax
		mov	dword ptr [bp-8], 4
		mov	eax, [bp-8]
		mov	dword_46672, eax
		mov	dword ptr [bp-0Ch], 1
		mov	eax, [bp-0Ch]
		mov	dword_46676, eax
		mov	dword_4667A, 7FFFFF00h
		leave
		retf
seg056		ends
