seg057		segment	byte public 'CODE' use16
		assume cs:seg057
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
		push	bp
		mov	bp, sp

loc_235B3:				; DATA XREF: seg170:028Eo
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	ax, [di]
		add	ax, [si]
		mov	[si], ax
		mov	ax, [di+2]
		sub	ax, [si+2]
		mov	[si+2],	ax
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+6]
		mov	ax, [si]
		shl	ax, 1
		call	sub_234D2
		sub	ax, [si]
		mov	[bp-2],	ax
		mov	ax, [si+2]
		shl	ax, 1
		call	sub_234D2
		sub	ax, [si+2]
		mov	[bp-4],	ax
		mov	ax, [si+4]
		shl	ax, 1
		call	sub_234D2
		sub	ax, [si+4]
		mov	[bp-6],	ax
		or	di, di
		jz	short loc_23618
		mov	ax, di
		jmp	short loc_23624
; ���������������������������������������������������������������������������

loc_23618:				; CODE XREF: seg057:0062j
		push	6
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_23624:				; CODE XREF: seg057:0066j
		or	ax, ax
		jz	short loc_2363D
		mov	ax, [bp-2]
		mov	[di], ax
		mov	ax, [bp-4]
		mov	[di+2],	ax
		mov	ax, [bp-6]
		mov	[di+4],	ax
		mov	ax, di
		jmp	short loc_2363F
; ���������������������������������������������������������������������������

loc_2363D:				; CODE XREF: seg057:0076j
		mov	ax, di

loc_2363F:				; CODE XREF: seg057:008Bj
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

sub_2364D	proc far		; CODE XREF: sub_23A1A+71p
					; sub_23B1A+52p ...

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+arg_4]
		mov	al, 0
		mov	[bp+var_2], al
		mov	[bp+var_1], al
		mov	eax, [si]
		or	eax, eax
		jge	short loc_2366A
		neg	eax

loc_2366A:				; CODE XREF: sub_2364D+18j
		mov	[bp+var_12], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_2367A
		neg	eax

loc_2367A:				; CODE XREF: sub_2364D+28j
		mov	[bp+var_E], eax
		mov	eax, [si+8]
		or	eax, eax
		jge	short loc_2368A
		neg	eax

loc_2368A:				; CODE XREF: sub_2364D+38j
		mov	[bp+var_A], eax
		push	1
		push	large 10h
		lea	ax, [bp+var_12]
		push	ax
		nop
		push	cs
		call	near ptr sub_23F52
		add	sp, 8
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_236BF
		push	1
		push	large 400h
		lea	ax, [bp+var_12]
		push	ax
		nop
		push	cs
		call	near ptr sub_2403D
		add	sp, 8
		mov	[bp+var_2], al

loc_236BF:				; CODE XREF: sub_2364D+59j
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_12]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_E]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_A]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A], eax
		mov	eax, [bp+var_E]
		add	[bp+var_12], eax
		mov	eax, [bp+var_A]
		add	[bp+var_12], eax
		lea	ax, [bp+var_12]
		push	ax
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		call	sub_23288
		add	sp, 6
		cmp	[bp+var_1], 0
		jz	short loc_23732
		mov	cl, [bp+var_1]
		mov	eax, [bp+var_6]
		sar	eax, cl
		mov	[bp+var_6], eax
		jmp	short loc_23746
; ���������������������������������������������������������������������������

loc_23732:				; CODE XREF: sub_2364D+D3j
		cmp	[bp+var_2], 0
		jz	short loc_23746
		mov	cl, [bp+var_2]
		mov	eax, [bp+var_6]
		shl	eax, cl
		mov	[bp+var_6], eax

loc_23746:				; CODE XREF: sub_2364D+E3j
					; sub_2364D+E9j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_6]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_2364D	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Math_DotProduct3D_5505B
; (sub_5505B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, 47L, LUE (2026-09-24). PRODUIT SCALAIRE de deux vecteurs 3x i32 24.8 : (a0*b0 +
; a1*b1 + a2*b2) en 64 bits (imul / add / adc), puis shrd 8 -> resultat 24.8 ecrit dans
; *arg_0. Ex-'Targeting_ComputeGeometryHelperA'. Utilise par Targeting_AcquireBestThreat,
; Aircraft_ComputeSeekerSignature_3E2F1 (aspect arriere), Targeting_SelectAndPrioritize et le
; cluster matrice/rotation.
; ==============================================================================================
Math_DotProduct3D_2375C	proc far		; CODE XREF: seg039:04DAP seg049:0CB0P ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [si]
		mov	edx, [di]
		imul	edx
		mov	ebx, eax
		mov	ecx, edx
		mov	eax, [si+4]
		mov	edx, [di+4]
		imul	edx
		add	ebx, eax
		adc	ecx, edx
		mov	eax, [si+8]
		mov	edx, [di+8]
		imul	edx
		add	eax, ebx
		adc	edx, ecx
		shrd	eax, edx, 8
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
Math_DotProduct3D_2375C	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_237BC	proc far		; CODE XREF: sub_1B679+B7P
					; sub_26077+17p ...

var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [si+4]
		mov	edx, [di+8]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [si+8]
		mov	edx, [di+4]
		imul	edx
		shrd	eax, edx, 8
		sub	ecx, eax
		mov	[bp+var_E], ecx
		mov	eax, [si+8]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [si]
		mov	edx, [di+8]
		imul	edx
		shrd	eax, edx, 8
		sub	ecx, eax
		mov	[bp+var_A], ecx
		mov	eax, [si]
		mov	edx, [di+4]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [si+4]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		sub	ecx, eax
		mov	[bp+var_6], ecx
		mov	ax, [bp+arg_0]
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jz	short loc_23855
		mov	ax, [bp+var_2]
		jmp	short loc_23862
; ���������������������������������������������������������������������������

loc_23855:				; CODE XREF: sub_237BC+92j
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_2], ax

loc_23862:				; CODE XREF: sub_237BC+97j
		or	ax, ax
		jz	short loc_2388B
		mov	bx, [bp+var_2]
		mov	eax, [bp+var_E]
		mov	[bx], eax
		mov	bx, [bp+var_2]
		mov	eax, [bp+var_A]
		mov	[bx+4],	eax
		mov	bx, [bp+var_2]
		mov	eax, [bp+var_6]
		mov	[bx+8],	eax
		mov	ax, [bp+var_2]
		jmp	short loc_2388E
; ���������������������������������������������������������������������������

loc_2388B:				; CODE XREF: sub_237BC+A8j
		mov	ax, [bp+var_2]

loc_2388E:				; CODE XREF: sub_237BC+CDj
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_237BC	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2389C	proc far		; CODE XREF: seg057:03F5p

var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [di]
		mov	[bp+var_2C], eax
		mov	eax, [di+4]
		mov	[bp+var_28], eax
		mov	eax, [di+8]
		mov	[bp+var_24], eax
		lea	ax, [bp+var_2C]
		push	ax
		nop
		push	cs
		call	near ptr Vector_Normalize3D_241B4
		add	sp, 2
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		lea	ax, [bp+var_2C]
		push	ax
		push	si
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp+var_2C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_28]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_24]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		cmp	word ptr [bp+var_4], 0
		jz	short loc_23945
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_23952
; ���������������������������������������������������������������������������

loc_23945:				; CODE XREF: sub_2389C+A2j
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_4], ax

loc_23952:				; CODE XREF: sub_2389C+A7j
		or	ax, ax
		jz	short loc_23978
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_10]
		mov	[bx], eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_18]
		mov	[bx+4],	eax
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_20]
		mov	[bx+8],	eax
		jmp	short $+2

loc_23978:				; CODE XREF: sub_2389C+B8j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2389C	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		mov	di, si
		push	word ptr [bp+0Ch]
		push	si
		push	ss
		lea	ax, [bp-10h]
		push	ax
		push	cs
		call	near ptr sub_2389C
		add	sp, 8
		mov	eax, [di]
		sub	eax, [bp-10h]
		mov	[bp-1Ch], eax
		mov	eax, [di+4]
		sub	eax, [bp-0Ch]
		mov	[bp-18h], eax
		mov	eax, [di+8]
		sub	eax, [bp-8]
		mov	[bp-14h], eax
		cmp	word ptr [bp-4], 0
		jz	short loc_239D9
		mov	ax, [bp-4]
		jmp	short loc_239E6
; ���������������������������������������������������������������������������

loc_239D9:				; CODE XREF: seg057:0422j
		push	0Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp-4],	ax

loc_239E6:				; CODE XREF: seg057:0427j
		or	ax, ax
		jz	short loc_23A0C
		mov	bx, [bp-4]
		mov	eax, [bp-1Ch]
		mov	[bx], eax
		mov	bx, [bp-4]
		mov	eax, [bp-18h]
		mov	[bx+4],	eax
		mov	bx, [bp-4]
		mov	eax, [bp-14h]
		mov	[bx+8],	eax
		jmp	short $+2

loc_23A0C:				; CODE XREF: seg057:0438j
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

sub_23A1A	proc far		; CODE XREF: seg057:31A7p

var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, si
		mov	eax, [di]
		mov	[bp+var_30], eax
		mov	eax, [di+4]
		mov	[bp+var_2C], eax
		mov	eax, [di+8]
		mov	[bp+var_28], eax
		push	large 3E8h
		lea	ax, [bp+var_30]
		push	ax
		nop
		push	cs
		call	near ptr Math_VectorLengthUnscaled_2410A
		add	sp, 6
		mov	eax, [bp+var_30]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_C]
		push	ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		nop
		push	cs
		call	near ptr sub_24763
		add	sp, 6
		mov	eax, [bp+var_28]
		or	eax, eax
		jge	short loc_23A7D
		neg	eax

loc_23A7D:				; CODE XREF: sub_23A1A+5Ej
		mov	[bp+var_14], eax
		lea	ax, [bp+var_30]
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	cs
		call	near ptr sub_2364D
		add	sp, 6
		cmp	[bp+var_18], 0
		jnz	short loc_23AAA
		mov	[bp+var_1C], 2D000h
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		jmp	short loc_23B02
; ���������������������������������������������������������������������������

loc_23AAA:				; CODE XREF: sub_23A1A+7Cj
		mov	eax, [bp+var_10]
		cmp	eax, [bp+var_14]
		jle	short loc_23AD3
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_28]
		push	ax
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	sub_230B6
		add	sp, 8
		mov	eax, [bp+var_20]
		mov	[bp+var_4], eax
		jmp	short loc_23B02
; ���������������������������������������������������������������������������

loc_23AD3:				; CODE XREF: sub_23A1A+98j
		lea	ax, [bp+var_18]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		push	ss
		lea	ax, [bp+var_24]
		push	ax
		call	sub_23030
		add	sp, 8
		mov	eax, [bp+var_24]
		mov	[bp+var_4], eax
		cmp	[bp+var_28], 0
		jge	short loc_23B02
		mov	eax, [bp+var_4]
		neg	eax
		mov	[bp+var_4], eax

loc_23B02:				; CODE XREF: sub_23A1A+8Ej
					; sub_23A1A+B7j ...
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_23A1A	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_23B1A	proc far		; CODE XREF: seg057:3317p

var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4Ah
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_6], si
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4A], eax
		mov	bx, [bp+var_6]
		mov	eax, [bx+4]
		mov	[bp+var_46], eax
		mov	bx, [bp+var_6]
		mov	eax, [bx+8]
		mov	[bp+var_42], eax
		push	large 3E8h
		lea	ax, [bp+var_4A]
		push	ax
		nop
		push	cs
		call	near ptr Math_VectorLengthUnscaled_2410A
		add	sp, 6
		mov	[bp+var_42], 0
		lea	ax, [bp+var_4A]
		push	ax
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	cs
		call	near ptr sub_2364D
		add	sp, 6
		mov	eax, [si]
		or	eax, eax
		jge	short loc_23B7D
		neg	eax

loc_23B7D:				; CODE XREF: sub_23B1A+5Ej
		mov	[bp+var_E], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_23B8D
		neg	eax

loc_23B8D:				; CODE XREF: sub_23B1A+6Ej
		mov	[bp+var_12], eax
		cmp	[bp+var_A], 0
		jnz	short loc_23BCD
		mov	di, [bp+arg_0]
		or	di, di
		jz	short loc_23BA3
		mov	ax, di
		jmp	short loc_23BAF
; ���������������������������������������������������������������������������

loc_23BA3:				; CODE XREF: sub_23B1A+83j
		push	4
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_23BAF:				; CODE XREF: sub_23B1A+87j
		or	ax, ax
		jz	short loc_23BBE
		mov	dword ptr [di],	2D000h
		mov	ax, di
		jmp	short loc_23BC0
; ���������������������������������������������������������������������������

loc_23BBE:				; CODE XREF: sub_23B1A+97j
		mov	ax, di

loc_23BC0:				; CODE XREF: sub_23B1A+A2j
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	loc_23CC5
; ���������������������������������������������������������������������������

loc_23BCD:				; CODE XREF: sub_23B1A+7Cj
		mov	eax, [bp+var_12]
		cmp	eax, [bp+var_E]
		jge	short loc_23BDA
		jmp	loc_23C70
; ���������������������������������������������������������������������������

loc_23BDA:				; CODE XREF: sub_23B1A+BBj
		cmp	dword ptr [si+4], 0
		jl	short loc_23C00
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	sub_230B6
		add	sp, 8
		mov	eax, [bp+var_16]
		mov	[bp+var_4], eax
		jmp	short loc_23C6E
; ���������������������������������������������������������������������������

loc_23C00:				; CODE XREF: sub_23B1A+C5j
		cmp	dword ptr [si],	0
		jl	short loc_23C3B
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		push	ss
		lea	ax, [bp+var_1A]
		push	ax
		call	sub_230B6
		add	sp, 8
		mov	eax, 0B400h
		sub	eax, [bp+var_1A]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_4], eax
		jmp	short loc_23C6E
; ���������������������������������������������������������������������������

loc_23C3B:				; CODE XREF: sub_23B1A+EAj
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_4A]
		push	ax
		push	ss
		lea	ax, [bp+var_26]
		push	ax
		call	sub_230B6
		add	sp, 8
		mov	eax, 0FFFF4C00h
		sub	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_4], eax

loc_23C6E:				; CODE XREF: sub_23B1A+E4j
					; sub_23B1A+11Fj
		jmp	short loc_23CC5
; ���������������������������������������������������������������������������

loc_23C70:				; CODE XREF: sub_23B1A+BDj
		cmp	dword ptr [si],	0
		jl	short loc_23C95
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	ss
		lea	ax, [bp+var_32]
		push	ax
		call	sub_23030
		add	sp, 8
		mov	eax, [bp+var_32]
		mov	[bp+var_4], eax
		jmp	short loc_23CC5
; ���������������������������������������������������������������������������

loc_23C95:				; CODE XREF: sub_23B1A+15Aj
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_46]
		push	ax
		push	ss
		lea	ax, [bp+var_36]
		push	ax
		call	sub_23030
		add	sp, 8
		mov	eax, [bp+var_36]
		neg	eax
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_4], eax

loc_23CC5:				; CODE XREF: sub_23B1A+B0j
					; sub_23B1A:loc_23C6Ej	...
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_23B1A	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_23CDD	proc far		; CODE XREF: sub_13040+1D4P
					; sub_13040+1F4P ...

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, si
		add	ax, 4
		mov	[bp+var_6], ax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		mov	eax, [di]
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		push	large [bp+var_A]
		call	sub_26BCB
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_A], eax
		push	large [bp+var_E]
		call	Math_CosRaw_26C11
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_E], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	eax, [si+8]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		add	[si+4],	eax
		mov	eax, [si+8]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8],	eax
		mov	eax, [bp+var_4]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		sub	[si+8],	eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_23CDD	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	[bp-6],	si
		mov	bx, [bp-6]
		mov	eax, [bx]
		mov	[bp-4],	eax
		mov	eax, [di]
		mov	[bp-0Eh], eax
		mov	[bp-0Ah], eax
		push	large dword ptr	[bp-0Ah]
		call	sub_26BCB
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp-0Ah], eax
		push	large dword ptr	[bp-0Eh]
		call	Math_CosRaw_26C11
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp-0Eh], eax
		mov	eax, [si]
		mov	edx, [bp-0Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+8]
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		mov	edx, [bp-0Ah]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		sub	[si], eax
		mov	eax, [si+8]
		mov	edx, [bp-0Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8],	eax
		mov	eax, [bp-4]
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		mov	edx, [bp-0Ah]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		add	[si+8],	eax
		mov	ax, si
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

sub_23E83	proc far		; CODE XREF: sub_13040+160P
					; sub_13040+180P ...

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_6], si
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		mov	eax, [di]
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		push	large [bp+var_A]
		call	sub_26BCB
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_A], eax
		push	large [bp+var_E]
		call	Math_CosRaw_26C11
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 4
		mov	[bp+var_E], eax
		mov	eax, [si]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		add	[si], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	eax, [bp+var_4]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		sub	[si+4],	eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_23E83	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_23F52	proc far		; CODE XREF: sub_2364D+4Cp
					; Vector_Normalize3D_241B4+11p ...

var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		mov	si, [bp+arg_0]
		mov	dl, [bp+arg_6]
		mov	eax, [si]
		or	eax, eax
		jge	short loc_23F6A
		neg	eax

loc_23F6A:				; CODE XREF: sub_23F52+13j
		mov	[bp+var_E], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_23F7A
		neg	eax

loc_23F7A:				; CODE XREF: sub_23F52+23j
		mov	[bp+var_A], eax
		mov	eax, [si+8]
		or	eax, eax
		jge	short loc_23F8A
		neg	eax

loc_23F8A:				; CODE XREF: sub_23F52+33j
		mov	[bp+var_6], eax
		mov	eax, [bp+var_E]
		or	eax, [bp+var_A]
		or	eax, [bp+var_6]
		jnz	short loc_23FA1
		mov	ax, 1
		jmp	short loc_23FA3
; ���������������������������������������������������������������������������

loc_23FA1:				; CODE XREF: sub_23F52+48j
		xor	ax, ax

loc_23FA3:				; CODE XREF: sub_23F52+4Dj
		or	al, al
		jz	short loc_23FAC
		mov	al, 0
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_23FAC:				; CODE XREF: sub_23F52+53j
		mov	[bp+var_1], 0
		jmp	short loc_23FDC
; ���������������������������������������������������������������������������

loc_23FB2:				; CODE XREF: sub_23F52+B2j
		mov	cl, dl
		mov	eax, [bp+var_E]
		shl	eax, cl
		mov	[bp+var_E], eax
		mov	cl, dl
		mov	eax, [bp+var_A]
		shl	eax, cl
		mov	[bp+var_A], eax
		mov	cl, dl
		mov	eax, [bp+var_6]
		shl	eax, cl
		mov	[bp+var_6], eax
		add	[bp+var_1], dl

loc_23FDC:				; CODE XREF: sub_23F52+5Ej
		mov	eax, [bp+arg_2]
		shl	eax, 8
		cmp	eax, [bp+var_E]
		jle	short loc_24006
		mov	eax, [bp+arg_2]
		shl	eax, 8
		cmp	eax, [bp+var_A]
		jle	short loc_24006
		mov	eax, [bp+arg_2]
		shl	eax, 8
		cmp	eax, [bp+var_6]
		jg	short loc_23FB2

loc_24006:				; CODE XREF: sub_23F52+96j
					; sub_23F52+A4j
		cmp	[bp+var_1], 0
		jz	short loc_24034
		mov	eax, [si]
		mov	cl, [bp+var_1]
		shl	eax, cl
		mov	[si], eax
		mov	eax, [si+4]
		mov	cl, [bp+var_1]
		shl	eax, cl
		mov	[si+4],	eax
		mov	eax, [si+8]
		mov	cl, [bp+var_1]
		shl	eax, cl
		mov	[si+8],	eax

loc_24034:				; CODE XREF: sub_23F52+B8j
		mov	al, [bp+var_1]
		pop	si
		leave
		retf
sub_23F52	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2403D	proc far		; CODE XREF: sub_2364D+69p
					; Math_VectorLengthUnscaled_2410A+Fp	...

var_D		= byte ptr -0Dh
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		mov	si, [bp+arg_0]
		mov	dl, [bp+arg_6]
		mov	eax, [si]
		or	eax, eax
		jge	short loc_24055
		neg	eax

loc_24055:				; CODE XREF: sub_2403D+13j
		mov	[bp+var_4], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_24065
		neg	eax

loc_24065:				; CODE XREF: sub_2403D+23j
		mov	[bp+var_8], eax
		mov	eax, [si+8]
		or	eax, eax
		jge	short loc_24075
		neg	eax

loc_24075:				; CODE XREF: sub_2403D+33j
		mov	[bp+var_C], eax
		mov	[bp+var_D], 0
		jmp	short loc_240A9
; ���������������������������������������������������������������������������

loc_2407F:				; CODE XREF: sub_2403D+78j
					; sub_2403D+86j ...
		mov	cl, dl
		mov	eax, [bp+var_4]
		sar	eax, cl
		mov	[bp+var_4], eax
		mov	cl, dl
		mov	eax, [bp+var_8]
		sar	eax, cl
		mov	[bp+var_8], eax
		mov	cl, dl
		mov	eax, [bp+var_C]
		sar	eax, cl
		mov	[bp+var_C], eax
		add	[bp+var_D], dl

loc_240A9:				; CODE XREF: sub_2403D+40j
		mov	eax, [bp+arg_2]
		shl	eax, 8
		cmp	eax, [bp+var_4]
		jl	short loc_2407F
		mov	eax, [bp+arg_2]
		shl	eax, 8
		cmp	eax, [bp+var_8]
		jl	short loc_2407F
		mov	eax, [bp+arg_2]
		shl	eax, 8
		cmp	eax, [bp+var_C]
		jl	short loc_2407F
		cmp	[bp+var_D], 0
		jz	short loc_24101
		mov	eax, [si]
		mov	cl, [bp+var_D]
		sar	eax, cl
		mov	[si], eax
		mov	eax, [si+4]
		mov	cl, [bp+var_D]
		sar	eax, cl
		mov	[si+4],	eax
		mov	eax, [si+8]
		mov	cl, [bp+var_D]
		sar	eax, cl
		mov	[si+8],	eax

loc_24101:				; CODE XREF: sub_2403D+9Aj
		mov	al, [bp+var_D]
		pop	si
		leave
		retf
sub_2403D	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Math_VectorLengthUnscaled_55920 (sub_55920 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, variante simplifiée de calcul de longueur
; vectorielle (référencée par sub_552E1).
; ==============================================================================================
Math_VectorLengthUnscaled_2410A	proc far		; CODE XREF: sub_23A1A+30p
					; sub_23B1A+3Ap ...

arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	3
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_2403D
		add	sp, 8
		mov	ax, si
		pop	si
		pop	bp
		retf
Math_VectorLengthUnscaled_2410A	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_24127	proc far		; CODE XREF: sub_1D687+4BP
					; sub_1D6E3+39P ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	large dword ptr	[si+8]
		push	large dword ptr	[si+4]
		push	large dword ptr	[si]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_241AC
		mov	eax, [si]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+4],	eax
		mov	eax, [si+8]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+8],	eax

loc_241AC:				; CODE XREF: sub_24127+37j
		mov	ax, si
		pop	si
		leave
		retf
sub_24127	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Vector_Normalize3D_559BB (sub_559BB de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, seg116 L1587-1640. Nom hérité 'TransformHelperB' FAUX :
; c'est une NORMALISATION 3D (pas une rotation).
; Math_VectorLength_ShiftDownIfLarge_55793(si,0x10,1) (mise à l'échelle si grand) ;
; Math_VectorLength3D_Scaled_54F57(si) -> longueur ; puis si[0]/=len, si[4]/=len, si[8]/=len
; -> vecteur unitaire (24.8, norme = 0x100). Utilisé par le cluster matrice
; (Matrix_ApplyToVectorX/Y/Z, 3x chacun = orthonormalisation) et par
; Aero_ComputeDragWithFeedback (direction de traînée).
; ==============================================================================================
Vector_Normalize3D_241B4	proc far		; CODE XREF: seg039:0D2EP
					; sub_1B679+DBP ...

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	large 10h
		push	si
		push	cs
		call	near ptr sub_23F52
		add	sp, 8
		push	si
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_2364D
		add	sp, 6
		cmp	[bp+var_4], 0
		jz	short loc_2422B
		mov	eax, [si]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+4],	eax
		mov	eax, [si+8]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+8],	eax

loc_2422B:				; CODE XREF: Vector_Normalize3D_241B4+29j
		mov	ax, si
		pop	si
		leave
		retf
Vector_Normalize3D_241B4	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Utility_Helper_55A37
; (sub_55A37 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée par sub_29A7D (rôle exact non détaillé, hors cluster identifié).
; ==============================================================================================
Utility_Helper_24233	proc far		; CODE XREF: sub_1BED0+F2P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		neg	eax
		mov	[si], eax
		mov	eax, [si+4]
		neg	eax
		mov	[si+4],	eax
		mov	eax, [si+8]
		neg	eax
		mov	[si+8],	eax
		mov	ax, si
		pop	si
		pop	bp
		retf
Utility_Helper_24233	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ecx, [bp+8]
		mov	eax, [si]
		imul	ecx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
		imul	ecx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	eax, [si+8]
		imul	ecx
		shrd	eax, edx, 8
		mov	[si+8],	eax
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	si
		push	cs
		call	near ptr sub_24127
		add	sp, 2
		cmp	dword ptr [di],	100h
		jz	short loc_24305
		mov	[bp-2],	di
		mov	eax, [si]
		mov	bx, [bp-2]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	[bp-4],	di
		mov	eax, [si+4]
		mov	bx, [bp-4]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	[bp-6],	di
		mov	eax, [si+8]
		mov	bx, [bp-6]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8],	eax

loc_24305:				; CODE XREF: seg057:0D0Aj
		mov	ax, si
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

sub_2430F	proc far		; CODE XREF: seg057:3343p

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 100h
		push	si
		push	cs
		call	near ptr Math_VectorLengthUnscaled_2410A
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_2430F	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2432A	proc far		; CODE XREF: sub_8867+1C9P
					; seg029:04DCP	...

var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

; FUNCTION CHUNK AT 0E9B SIZE 00000004 BYTES

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_2], si
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_24], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[bp+var_20], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+8]
		mov	[bp+var_1C], eax
		mov	ax, [bp+arg_6]
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[bp+var_30], eax
		mov	bx, [bp+var_4]
		mov	eax, [bx+4]
		mov	[bp+var_2C], eax
		mov	bx, [bp+var_4]
		mov	eax, [bx+8]
		mov	[bp+var_28], eax
		push	large 3E8h
		lea	ax, [bp+var_24]
		push	ax
		push	cs
		call	near ptr Math_VectorLengthUnscaled_2410A
		add	sp, 6
		push	large 3E8h
		lea	ax, [bp+var_30]
		push	ax
		push	cs
		call	near ptr Math_VectorLengthUnscaled_2410A
		add	sp, 6
		lea	ax, [bp+var_24]
		push	ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr sub_2364D
		add	sp, 6
		lea	ax, [bp+var_30]
		push	ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		push	cs
		call	near ptr sub_2364D
		add	sp, 6
		mov	eax, [bp+var_C]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_8], eax
		cmp	[bp+var_8], 0
		jnz	short loc_24417
		mov	di, [bp+arg_0]
		or	di, di
		jz	short loc_243EE
		mov	ax, di
		jmp	short loc_243FA
; ���������������������������������������������������������������������������

loc_243EE:				; CODE XREF: sub_2432A+BEj
		push	4
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_243FA:				; CODE XREF: sub_2432A+C2j
		or	ax, ax
		jz	short loc_24409
		mov	dword ptr [di],	0
		mov	ax, di
		jmp	short loc_2440B
; ���������������������������������������������������������������������������

loc_24409:				; CODE XREF: sub_2432A+D2j
		mov	ax, di

loc_2440B:				; CODE XREF: sub_2432A+DDj
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		jmp	short loc_2444B
; ���������������������������������������������������������������������������

loc_24417:				; CODE XREF: sub_2432A+B7j
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		lea	ax, [bp+var_24]
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_2375C
		add	sp, 8
		lea	ax, [bp+var_18]
		push	ax
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_23030
		add	sp, 8
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2432A	endp

; ���������������������������������������������������������������������������
; START	OF FUNCTION CHUNK FOR sub_2432A

loc_2444B:				; CODE XREF: sub_2432A+EBj
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK	FOR sub_2432A
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		mov	di, si
		mov	ax, [bp+0Ch]
		mov	[bp-6],	ax
		mov	eax, [di]
		mov	bx, [bp-6]
		sub	eax, [bx]
		mov	[bp-16h], eax
		mov	eax, [di+4]
		mov	bx, [bp-6]
		sub	eax, [bx+4]
		mov	[bp-12h], eax
		mov	eax, [di+8]
		mov	bx, [bp-6]
		sub	eax, [bx+8]
		mov	[bp-0Eh], eax
		mov	eax, [bp-16h]
		mov	[bp-22h], eax
		mov	eax, [bp-12h]
		mov	[bp-1Eh], eax
		mov	eax, [bp-0Eh]
		mov	[bp-1Ah], eax
		push	large dword ptr	[bp-1Ah]
		push	large dword ptr	[bp-1Eh]
		push	large dword ptr	[bp-22h]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-0Ah], eax
		mov	bx, [bp-4]
		mov	eax, [bp-0Ah]
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
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+0Ah]
		cmp	dword ptr [si+4], 0
		jz	short loc_24551
		mov	ax, si
		add	ax, 4
		mov	di, ax
		mov	eax, [si+8]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		neg	eax
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		mov	[bp-14h], eax
		lea	ax, [bp-14h]
		push	ax
		push	ss
		lea	ax, [bp-18h]
		push	ax
		call	sub_2313C
		add	sp, 6
		mov	eax, [bp-18h]
		mov	[bp-4],	eax
		jmp	short loc_2458B
; ���������������������������������������������������������������������������

loc_24551:				; CODE XREF: seg057:0F49j
		cmp	dword ptr [si+8], 0
		jle	short loc_2456A
		mov	dword ptr [bp-1Ch], 0FFFFA600h
		mov	eax, [bp-1Ch]
		mov	[bp-4],	eax
		jmp	short loc_2458B
; ���������������������������������������������������������������������������

loc_2456A:				; CODE XREF: seg057:0FA6j
		cmp	dword ptr [si+8], 0
		jge	short loc_24583
		mov	dword ptr [bp-20h], 5A00h
		mov	eax, [bp-20h]
		mov	[bp-4],	eax
		jmp	short loc_2458B
; ���������������������������������������������������������������������������

loc_24583:				; CODE XREF: seg057:0FBFj
		mov	dword ptr [bp-4], 0

loc_2458B:				; CODE XREF: seg057:0F9Fj seg057:0FB8j ...
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
		sub	sp, 1Ch
		push	si
		mov	si, [bp+0Ah]
		push	large dword ptr	[si+8]
		push	large dword ptr	[si+4]
		push	large dword ptr	[si]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		mov	[bp-8],	eax
		cmp	dword ptr [bp-8], 0
		jle	short loc_24615
		lea	ax, [bp-8]
		push	ax
		mov	eax, [si]
		neg	eax
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	[bp-18h], eax
		lea	ax, [bp-18h]
		push	ax
		push	ss
		lea	ax, [bp-1Ch]
		push	ax
		call	sub_230B6
		add	sp, 8
		mov	eax, [bp-1Ch]
		mov	[bp-4],	eax
		jmp	short loc_2461D
; ���������������������������������������������������������������������������

loc_24615:				; CODE XREF: seg057:1032j
		mov	dword ptr [bp-4], 0

loc_2461D:				; CODE XREF: seg057:1063j
		mov	bx, [bp+6]
		mov	eax, [bp-4]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+6]
		mov	ax, [bp+8]
		mov	[bp-2],	ax
		movsx	eax, word ptr [bp-2]
		shl	eax, 8
		mov	[bp-6],	eax
		mov	eax, [bp-6]
		mov	[si], eax
		mov	ax, [bp+0Ah]
		mov	[bp-8],	ax
		movsx	eax, word ptr [bp-8]
		shl	eax, 8
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		mov	[si+4],	eax
		mov	ax, [bp+0Ch]
		mov	[bp-0Eh], ax
		movsx	eax, word ptr [bp-0Eh]
		shl	eax, 8
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		mov	[si+8],	eax
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_24690	proc far		; CODE XREF: sub_C1213+73P

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si], eax
		mov	eax, [bp+arg_6]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[si+4],	eax
		mov	eax, [bp+arg_A]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[si+8],	eax
		pop	si
		leave
		retf
sub_24690	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Utility_Helper_55E65
; (sub_55E65 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, référencée par sub_2B0F2 (rôle exact non détaillé).
; ==============================================================================================
Utility_Helper_246F0	proc far		; CODE XREF: sub_1D687+39P

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[si], eax
		mov	eax, [bp+arg_6]
		mov	[si+4],	eax
		mov	eax, [bp+arg_A]
		mov	[si+8],	eax
		pop	si
		pop	bp
		retf
Utility_Helper_246F0	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 3Ch
		push	si
		mov	si, [bp+6]
		push	3
		mov	ax, si
		add	ax, 8
		push	ax
		lea	ax, [bp-14h]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 4
		push	ax
		lea	ax, [bp-28h]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	3
		push	si
		lea	ax, [bp-3Ch]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	36A0h
		call	CRT_Msg_NullPtrAssign
		add	sp, 8
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_24763	proc far		; CODE XREF: sub_23A1A+51p
					; UI_ComputeScaledVectorHelper_24AFE+47p

var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		mov	si, [bp+arg_4]
		mov	al, 0
		mov	[bp+var_2], al
		mov	[bp+var_1], al
		mov	eax, [si]
		or	eax, eax
		jge	short loc_24780
		neg	eax

loc_24780:				; CODE XREF: sub_24763+18j
		mov	[bp+var_12], eax
		mov	eax, [si+4]
		or	eax, eax
		jge	short loc_24790
		neg	eax

loc_24790:				; CODE XREF: sub_24763+28j
		mov	[bp+var_E], eax
		mov	[bp+var_A], 0
		push	1
		push	large 10h
		lea	ax, [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_23F52
		add	sp, 8
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_247CB
		push	1
		push	large 400h
		lea	ax, [bp+var_12]
		push	ax
		push	cs
		call	near ptr sub_2403D
		add	sp, 8
		mov	[bp+var_2], al

loc_247CB:				; CODE XREF: sub_24763+50j
		mov	eax, [bp+var_12]
		mov	edx, [bp+var_12]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_E]
		mov	edx, [bp+var_E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		add	[bp+var_12], eax
		lea	ax, [bp+var_12]
		push	ax
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		call	sub_23288
		add	sp, 6
		cmp	[bp+var_1], 0
		jz	short loc_24822
		mov	cl, [bp+var_1]
		mov	eax, [bp+var_6]
		sar	eax, cl
		mov	[bp+var_6], eax
		jmp	short loc_24836
; ���������������������������������������������������������������������������

loc_24822:				; CODE XREF: sub_24763+ADj
		cmp	[bp+var_2], 0
		jz	short loc_24836
		mov	cl, [bp+var_2]
		mov	eax, [bp+var_6]
		shl	eax, cl
		mov	[bp+var_6], eax

loc_24836:				; CODE XREF: sub_24763+BDj
					; sub_24763+C3j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+var_6]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_24763	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	si
		push	di
		mov	si, [bp+6]
		mov	dword ptr [bp-4], 100h
		mov	di, si
		mov	eax, [di]
		or	eax, eax
		jge	short loc_2486C
		neg	eax

loc_2486C:				; CODE XREF: seg057:12B7j
		mov	[bp-0Ch], eax
		mov	eax, [bp-0Ch]
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		sar	eax, 8
		mov	[bp-8],	eax
		mov	ax, si
		add	ax, 4
		mov	[bp-16h], ax
		mov	bx, [bp-16h]
		mov	eax, [bx]
		or	eax, eax
		jge	short loc_2489A
		neg	eax

loc_2489A:				; CODE XREF: seg057:12E5j
		mov	[bp-1Ah], eax
		mov	eax, [bp-1Ah]
		mov	[bp-1Eh], eax
		mov	eax, [bp-1Eh]
		sar	eax, 8
		mov	[bp-14h], eax
		xor	dx, dx
		jmp	short loc_248D1
; ���������������������������������������������������������������������������

loc_248B6:				; CODE XREF: seg057:1329j seg057:1333j
		mov	eax, [bp-8]
		sar	eax, 3
		mov	[bp-8],	eax
		mov	eax, [bp-14h]
		sar	eax, 3
		mov	[bp-14h], eax
		add	dx, 3

loc_248D1:				; CODE XREF: seg057:1304j
		mov	eax, [bp-8]
		cmp	eax, [bp-4]
		jg	short loc_248B6
		mov	eax, [bp-14h]
		cmp	eax, [bp-4]
		jg	short loc_248B6
		or	dx, dx
		jz	short loc_24901
		mov	eax, [si]
		mov	cl, dl
		sar	eax, cl
		mov	[si], eax
		mov	eax, [si+4]
		mov	cl, dl
		sar	eax, cl
		mov	[si+4],	eax

loc_24901:				; CODE XREF: seg057:1337j
		mov	ax, si
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

sub_2490B	proc far		; CODE XREF: seg057:146Ep

var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2Ch
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	ax, [bp+arg_6]
		mov	[bp+var_A], ax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		mov	[bp+var_8], eax
		mov	ax, [bp+var_A]
		add	ax, 4
		mov	[bp+var_C], ax
		mov	bx, [bp+var_C]
		mov	eax, [bx]
		mov	[bp+var_4], eax
		lea	ax, [bp+var_8]
		push	ax
		nop
		push	cs
		call	near ptr UI_ComputeScaledVectorHelper_24AFE
		add	sp, 2
		mov	eax, [bp+arg_0]
		mov	[bp+var_10], eax
		mov	di, si
		mov	eax, [di]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		add	eax, [bp+var_14]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_8]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_4]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		cmp	word ptr [bp+var_10], 0
		jz	short loc_249C9
		mov	ax, word ptr [bp+var_10]
		jmp	short loc_249D6
; ���������������������������������������������������������������������������

loc_249C9:				; CODE XREF: sub_2490B+B7j
		push	8
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	word ptr [bp+var_10], ax

loc_249D6:				; CODE XREF: sub_2490B+BCj
		or	ax, ax
		jz	short loc_249F1
		mov	bx, word ptr [bp+var_10]
		mov	eax, [bp+var_24]
		mov	[bx], eax
		mov	bx, word ptr [bp+var_10]
		mov	eax, [bp+var_2C]
		mov	[bx+4],	eax
		jmp	short $+2

loc_249F1:				; CODE XREF: sub_2490B+CDj
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
sub_2490B	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		mov	di, si
		push	word ptr [bp+0Ch]
		push	si
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		push	cs
		call	near ptr sub_2490B
		add	sp, 8
		mov	eax, [di]
		sub	eax, [bp-0Ch]
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		mov	[bp-14h], eax
		mov	eax, [di+4]
		sub	eax, [bp-8]
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		cmp	word ptr [bp-4], 0
		jz	short loc_24A56
		mov	ax, [bp-4]
		jmp	short loc_24A63
; ���������������������������������������������������������������������������

loc_24A56:				; CODE XREF: seg057:149Fj
		push	8
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp-4],	ax

loc_24A63:				; CODE XREF: seg057:14A4j
		or	ax, ax
		jz	short loc_24A7E
		mov	bx, [bp-4]
		mov	eax, [bp-14h]
		mov	[bx], eax
		mov	bx, [bp-4]
		mov	eax, [bp-1Ch]
		mov	[bx+4],	eax
		jmp	short $+2

loc_24A7E:				; CODE XREF: seg057:14B5j
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

sub_24A8C	proc far		; CODE XREF: seg057:160Fp

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	large 0
		push	large dword ptr	[si+4]
		push	large dword ptr	[si]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jz	short loc_24AF6
		mov	eax, [si]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+4],	eax

loc_24AF6:				; CODE XREF: sub_24A8C+36j
		mov	ax, si
		pop	si
		leave
		retf
sub_24A8C	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; UI_ComputeScaledVectorHelper_56215 (sub_56215 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée depuis seg027/seg089 (audio 3D),
; combine Math_VectorLength_ShiftDownIfLarge_55793 et
; Math_VectorLength3D_Scaled_Variant_55ED8.
; ==============================================================================================
UI_ComputeScaledVectorHelper_24AFE	proc far		; CODE XREF: sub_2490B+34p

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si]
		mov	[bp+var_10], eax
		mov	eax, [si+4]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 0
		push	1
		push	large 10h
		lea	ax, [bp+var_10]
		push	ax
		push	cs
		call	near ptr sub_23F52
		add	sp, 8
		mov	eax, [bp+var_10]
		mov	[si], eax
		mov	eax, [bp+var_C]
		mov	[si+4],	eax
		push	si
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	cs
		call	near ptr sub_24763
		add	sp, 6
		cmp	[bp+var_4], 0
		jz	short loc_24B84
		mov	eax, [si]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, eax
		mov	ecx, [bp+var_4]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[si+4],	eax

loc_24B84:				; CODE XREF: UI_ComputeScaledVectorHelper_24AFE+52j
		mov	ax, si
		pop	si
		leave
		retf
UI_ComputeScaledVectorHelper_24AFE	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	eax, [si]
		neg	eax
		mov	[si], eax
		mov	eax, [si+4]
		neg	eax
		mov	[si+4],	eax
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
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	si
		push	cs
		call	near ptr sub_24A8C
		add	sp, 2
		mov	[bp-2],	di
		mov	eax, [si]
		mov	bx, [bp-2]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	[bp-4],	di
		mov	eax, [si+4]
		mov	bx, [bp-4]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	ax, si
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
		sub	sp, 28h
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		push	large 0
		push	large dword ptr	[si+4]
		push	large dword ptr	[si]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-8],	eax
		mov	eax, [bp-8]
		mov	[bp-0Ch], eax
		push	large 0
		push	large dword ptr	[di+4]
		push	large dword ptr	[di]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		mov	[bp-14h], eax
		mov	eax, [bp-0Ch]
		mov	edx, [bp-14h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		mov	[bp-4],	eax
		cmp	dword ptr [bp-4], 0
		jnz	short loc_24C94
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
		jmp	short loc_24CFC
; ���������������������������������������������������������������������������

loc_24C94:				; CODE XREF: seg057:16CCj
		lea	ax, [bp-4]
		push	ax
		mov	[bp-1Ah], si
		mov	[bp-1Ch], di
		mov	bx, [bp-1Ah]
		mov	eax, [bx]
		mov	bx, [bp-1Ch]
		mov	edx, [bx]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-20h], eax
		mov	bx, [bp-1Ah]
		mov	eax, [bx+4]
		mov	bx, [bp-1Ch]
		mov	edx, [bx+4]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-24h], eax
		add	eax, [bp-20h]
		mov	[bp-20h], eax
		mov	eax, [bp-20h]
		mov	[bp-28h], eax
		lea	ax, [bp-28h]
		push	ax
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		call	sub_23030
		add	sp, 8
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_24CFC:				; CODE XREF: seg057:16E2j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		mov	di, si
		mov	ax, [bp+0Ch]
		mov	[bp-6],	ax
		mov	eax, [di]
		mov	bx, [bp-6]
		sub	eax, [bx]
		mov	[bp-0Ah], eax
		mov	eax, [bp-0Ah]
		mov	[bp-0Eh], eax
		mov	ax, [bp-6]
		add	ax, 4
		mov	[bp-10h], ax
		mov	eax, [di+4]
		mov	bx, [bp-10h]
		sub	eax, [bx]
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	[bp-18h], eax
		mov	eax, [bp-0Eh]
		mov	[bp-20h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		push	large 0
		push	large dword ptr	[bp-1Ch]
		push	large dword ptr	[bp-20h]
		call	Math_VectorLength3D_Raw_26DF9
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp-24h], eax
		mov	bx, [bp-4]
		mov	eax, [bp-24h]
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
		sub	sp, 28h
		push	si
		mov	si, [bp+6]
		push	3
		mov	ax, si
		add	ax, 4
		push	ax
		lea	ax, [bp-14h]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	3
		push	si
		lea	ax, [bp-28h]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	36ABh
		call	CRT_Msg_NullPtrAssign
		add	sp, 6
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Damage_ComputeHelperA_5647A (sub_5647A de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée par Damage_SimulationTick
; (sub_2BF6C, seg060) — helper de calcul de dommages (rôle exact non détaillé).
; ==============================================================================================
Damage_ComputeHelperA_24DD7	proc far		; CODE XREF: seg039:0B78P

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		mov	[si+28h], eax
		mov	[si+14h], eax
		mov	[si], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+2Ch], eax
		mov	[si+24h], eax
		mov	[si+20h], eax
		mov	[si+1Ch], eax
		mov	[si+18h], eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	[si+4],	eax
		pop	si
		leave
		retf
Damage_ComputeHelperA_24DD7	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_24E2B	proc far		; CODE XREF: seg039:0BD9P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	si
		call	Math_VectorTransformByMatrix3x3_26FE1
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_24E2B	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		mov	dx, [bp+0Ah]
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+0Ch]
		mov	[si+4],	eax
		mov	eax, [di+18h]
		mov	[si+8],	eax
		mov	bx, dx
		mov	eax, [bx]
		mov	[si+0Ch], eax
		mov	eax, [di+4]
		mov	[si+10h], eax
		mov	eax, [di+10h]
		mov	[si+14h], eax
		mov	eax, [di+1Ch]
		mov	[si+18h], eax
		mov	bx, dx
		mov	eax, [bx+4]
		mov	[si+1Ch], eax
		mov	eax, [di+8]
		mov	[si+20h], eax
		mov	eax, [di+14h]
		mov	[si+24h], eax
		mov	eax, [di+20h]
		mov	[si+28h], eax
		mov	bx, dx
		mov	eax, [bx+8]
		mov	[si+2Ch], eax
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_24EBC	proc far		; CODE XREF: seg039:0BBDP

arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+14h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+24h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+4]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+4],	eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+8]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+18h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+28h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+8],	eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+4]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+8]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+2Ch]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_2]
		add	eax, es:[bx+0Ch]
		mov	[si+0Ch], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+10h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+14h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+18h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+10h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+10h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+4]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+14h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+14h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+18h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+24h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+14h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+10h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+8]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+14h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+18h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+18h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+28h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+18h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+10h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+14h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+18h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+2Ch]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_2]
		add	eax, es:[bx+1Ch]
		mov	[si+1Ch], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+20h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+24h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+20h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+20h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+4]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+24h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+14h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+24h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+24h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+20h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+8]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+24h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+18h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+28h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		mov	[si+28h], eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+20h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+24h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		les	bx, [bp+arg_2]
		mov	eax, es:[bx+28h]
		les	bx, [bp+arg_6]
		mov	edx, es:[bx+2Ch]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+arg_2]
		add	eax, es:[bx+2Ch]
		mov	[si+2Ch], eax
		pop	si
		pop	bp
		retf
sub_24EBC	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+0Ah]
		mov	si, [bp+0Ch]
		mov	eax, [di]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+4]
		mov	edx, [si+4]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+8]
		mov	edx, [si+8]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+6]
		mov	es:[bx], eax
		mov	eax, [di]
		mov	edx, [si+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+4]
		mov	edx, [si+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+8]
		mov	edx, [si+14h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+6]
		mov	es:[bx+10h], eax
		mov	eax, [di]
		mov	edx, [si+18h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+4]
		mov	edx, [si+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+8]
		mov	edx, [si+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+6]
		mov	es:[bx+20h], eax
		mov	eax, [di+0Ch]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+10h]
		mov	edx, [si+4]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+14h]
		mov	edx, [si+8]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+6]
		mov	es:[bx+4], eax
		mov	eax, [di+0Ch]
		mov	edx, [si+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+10h]
		mov	edx, [si+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+14h]
		mov	edx, [si+14h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+6]
		mov	es:[bx+14h], eax
		mov	eax, [di+0Ch]
		mov	edx, [si+18h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+10h]
		mov	edx, [si+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+14h]
		mov	edx, [si+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+6]
		mov	es:[bx+24h], eax
		mov	eax, [di+18h]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+1Ch]
		mov	edx, [si+4]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+20h]
		mov	edx, [si+8]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+6]
		mov	es:[bx+8], eax
		mov	eax, [di+18h]
		mov	edx, [si+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+1Ch]
		mov	edx, [si+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+20h]
		mov	edx, [si+14h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+6]
		mov	es:[bx+18h], eax
		mov	eax, [di+18h]
		mov	edx, [si+18h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	eax, [di+1Ch]
		mov	edx, [si+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	eax, [di+20h]
		mov	edx, [si+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+6]
		mov	es:[bx+28h], eax
		mov	bx, [bp+0Eh]
		mov	eax, [bx]
		mov	edx, [si]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	bx, [bp+0Eh]
		mov	eax, [bx+4]
		mov	edx, [si+4]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	bx, [bp+0Eh]
		mov	eax, [bx+8]
		mov	edx, [si+8]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+6]
		mov	es:[bx+0Ch], eax
		mov	bx, [bp+0Eh]
		mov	eax, [bx]
		mov	edx, [si+0Ch]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	bx, [bp+0Eh]
		mov	eax, [bx+4]
		mov	edx, [si+10h]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	bx, [bp+0Eh]
		mov	eax, [bx+8]
		mov	edx, [si+14h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+6]
		mov	es:[bx+1Ch], eax
		mov	bx, [bp+0Eh]
		mov	eax, [bx]
		mov	edx, [si+18h]
		imul	edx
		shrd	eax, edx, 8
		mov	ecx, eax
		mov	bx, [bp+0Eh]
		mov	eax, [bx+4]
		mov	edx, [si+1Ch]
		imul	edx
		shrd	eax, edx, 8
		add	ecx, eax
		mov	bx, [bp+0Eh]
		mov	eax, [bx+8]
		mov	edx, [si+20h]
		imul	edx
		shrd	eax, edx, 8
		add	eax, ecx
		les	bx, [bp+6]
		mov	es:[bx+2Ch], eax
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_255FD	proc far		; CODE XREF: sub_1A667+2FP

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		mov	eax, [si+0Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		mov	eax, [si+18h]
		les	bx, [bp+arg_0]
		mov	es:[bx+8], eax
		mov	eax, [di]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		mov	eax, [si+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], eax
		mov	eax, [si+10h]
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], eax
		mov	eax, [si+1Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], eax
		mov	eax, [di+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ch], eax
		mov	eax, [si+8]
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], eax
		mov	eax, [si+14h]
		les	bx, [bp+arg_0]
		mov	es:[bx+24h], eax
		mov	eax, [si+20h]
		les	bx, [bp+arg_0]
		mov	es:[bx+28h], eax
		mov	eax, [di+8]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ch], eax
		pop	di
		pop	si
		pop	bp
		retf
sub_255FD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_25699	proc far		; CODE XREF: seg057:35C6p
					; sub_C658C+D3P ...

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	[bp+var_4], 100h
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		mov	es:[bx+28h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+14h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Ch], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+24h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+20h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+1Ch], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+18h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+10h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+8], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+4], eax
		leave
		retf
sub_25699	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_25718	proc far		; CODE XREF: seg027:0177P seg029:14E7P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_25733
		push	24h ; '$'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_25746

loc_25733:				; CODE XREF: sub_25718+9j
		mov	ax, si
		add	ax, 0Ch
		mov	ax, si
		add	ax, 18h
		push	si
		nop
		push	cs
		call	near ptr Matrix_BuildFromAngle_2574E
		add	sp, 2

loc_25746:				; CODE XREF: sub_25718+19j
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_25718	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Matrix_BuildFromAngle_56D72 (sub_56D72 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée par seg015 (UI cockpit) — probable
; construction de matrice de rotation à partir d'un angle.
; ==============================================================================================
Matrix_BuildFromAngle_2574E	proc far		; CODE XREF: sub_1220C+200P
					; sub_13040+143P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, dword_46690
		mov	[si], eax
		mov	eax, dword_46694
		mov	[si+4],	eax
		mov	eax, dword_46698
		mov	[si+8],	eax
		mov	eax, dword_4669C
		mov	[si+0Ch], eax
		mov	eax, dword_466A0
		mov	[si+10h], eax
		mov	eax, dword_466A4
		mov	[si+14h], eax
		mov	eax, dword_466A8
		mov	[si+18h], eax
		mov	eax, dword_466AC
		mov	[si+1Ch], eax
		mov	eax, dword_466B0
		mov	[si+20h], eax
		mov	ax, si
		pop	si
		pop	bp
		retf
Matrix_BuildFromAngle_2574E	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_257C3
		push	24h ; '$'
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_25815

loc_257C3:				; CODE XREF: seg057:2201j
		mov	ax, si
		add	ax, 0Ch
		mov	ax, si
		add	ax, 18h
		mov	di, [bp+8]
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4],	eax
		mov	eax, [di+8]
		mov	[si+8],	eax
		mov	ax, [bp+0Ah]
		mov	[bp-2],	ax
		mov	bx, [bp-2]
		mov	eax, [bx]
		mov	[si+0Ch], eax
		mov	bx, [bp-2]
		mov	eax, [bx+4]
		mov	[si+10h], eax
		mov	bx, [bp-2]
		mov	eax, [bx+8]
		mov	[si+14h], eax
		push	si
		nop
		push	cs
		call	near ptr sub_26101
		add	sp, 2

loc_25815:				; CODE XREF: seg057:2211j
		mov	ax, si
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

sub_2581F	proc far		; CODE XREF: seg039:042CP seg039:0482P ...

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	di, dx
		mov	eax, [di]
		mov	[si], eax
		mov	eax, [di+4]
		mov	[si+4],	eax
		mov	eax, [di+8]
		mov	[si+8],	eax
		mov	ax, dx
		add	ax, 0Ch
		mov	cx, ax
		mov	bx, cx
		mov	eax, [bx]
		mov	[si+0Ch], eax
		mov	bx, cx
		mov	eax, [bx+4]
		mov	[si+10h], eax
		mov	bx, cx
		mov	eax, [bx+8]
		mov	[si+14h], eax
		mov	ax, dx
		add	ax, 18h
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[si+18h], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[si+1Ch], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+8]
		mov	[si+20h], eax
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_2581F	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; WorldObject_BuildOrientationMatrix_56E8A (sub_56E8A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, seg116 L3964-4003 (relu
; 2026-09-05). Variante 'tableau' de Matrix_BuildFullOrientation_575B2 : arg_0 = matrice
; cible, arg_2 = ptr vers 3 dword angles consecutifs. Appelle
; Matrix_BuildAxisX_ApplyToObject_574B3(m, ptr+0), _AxisY_57508(m, ptr+4), _AxisZ_5755D(m,
; ptr+8) : composition INCREMENTALE des 3 rotations d'axe (seuil 0.21875 deg) sur la matrice.
; Appelee par la methode vtable WorldObject_ComposeOrientationAngleArray_3CB0B (matrice a
; objet+0x2C), par Camera_ChaseComputeMain (seg085, angles depuis dword_707F8/FC/70800 ou
; [obj+0x51]->vtable[0x24]), et par le cluster de manoeuvre IA ovr232. C'est le mecanisme
; generique de rotation d'objet.
; ==============================================================================================
WorldObject_BuildOrientationMatrix_2589B	proc far		; CODE XREF: seg052:0228P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_25F1E
		add	sp, 4
		mov	ax, di
		add	ax, 4
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_25F81
		add	sp, 4
		mov	ax, di
		add	ax, 8
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_25FE4
		add	sp, 4
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
WorldObject_BuildOrientationMatrix_2589B	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_258D8	proc far		; CODE XREF: sub_25F1E+11p

var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		or	eax, eax
		jge	short loc_258F1
		neg	eax

loc_258F1:				; CODE XREF: sub_258D8+14j
		mov	[bp+var_C], eax
		mov	[bp+var_10], 38h ; '8'
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		sar	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_25922
		jmp	loc_25AEE
; ���������������������������������������������������������������������������

loc_25922:				; CODE XREF: sub_258D8+45j
		push	[bp+arg_2]
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_22E2A
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	[bp+arg_2]
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	sub_22E6C
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_8], eax
		mov	ax, si
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_46], eax
		mov	eax, [di+4]
		mov	[bp+var_42], eax
		mov	eax, [di+8]
		mov	[bp+var_3E], eax
		mov	eax, [si+0Ch]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+0Ch], eax
		mov	ax, si
		add	ax, 0Ch
		mov	eax, [si+10h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+10h], eax
		mov	ax, si
		add	ax, 10h
		mov	eax, [si+14h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+14h], eax
		mov	ax, si
		add	ax, 14h
		mov	ax, si
		add	ax, 18h
		mov	[bp+var_22], ax
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+4]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+8]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_52]
		add	[si+0Ch], eax
		mov	eax, [bp+var_4E]
		add	[si+10h], eax
		mov	eax, [bp+var_4A]
		add	[si+14h], eax
		mov	eax, [si+18h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+18h], eax
		mov	ax, si
		add	ax, 18h
		mov	eax, [si+1Ch]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+1Ch], eax
		mov	ax, si
		add	ax, 1Ch
		mov	eax, [si+20h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+20h], eax
		mov	ax, si
		add	ax, 20h	; ' '
		mov	eax, [bp+var_46]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_42]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_3E]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_46]
		sub	[si+18h], eax
		mov	eax, [bp+var_42]
		sub	[si+1Ch], eax
		mov	eax, [bp+var_3E]
		sub	[si+20h], eax

loc_25AEE:				; CODE XREF: sub_258D8+47j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_258D8	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_25AF8	proc far		; CODE XREF: sub_25F81+11p

var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		or	eax, eax
		jge	short loc_25B11
		neg	eax

loc_25B11:				; CODE XREF: sub_25AF8+14j
		mov	[bp+var_C], eax
		mov	[bp+var_10], 38h ; '8'
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		sar	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_25B42
		jmp	loc_25D01
; ���������������������������������������������������������������������������

loc_25B42:				; CODE XREF: sub_25AF8+45j
		push	[bp+arg_2]
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_22E2A
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	[bp+arg_2]
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	sub_22E6C
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_8], eax
		mov	di, si
		mov	eax, [di]
		mov	[bp+var_46], eax
		mov	eax, [di+4]
		mov	[bp+var_42], eax
		mov	eax, [di+8]
		mov	[bp+var_3E], eax
		mov	eax, [si]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	ax, si
		add	ax, 4
		mov	eax, [si+8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8],	eax
		mov	ax, si
		add	ax, 8
		mov	ax, si
		add	ax, 18h
		mov	[bp+var_22], ax
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+4]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+8]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_52]
		sub	[si], eax
		mov	eax, [bp+var_4E]
		sub	[si+4],	eax
		mov	eax, [bp+var_4A]
		sub	[si+8],	eax
		mov	eax, [si+18h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+18h], eax
		mov	ax, si
		add	ax, 18h
		mov	eax, [si+1Ch]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+1Ch], eax
		mov	ax, si
		add	ax, 1Ch
		mov	eax, [si+20h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+20h], eax
		mov	ax, si
		add	ax, 20h	; ' '
		mov	eax, [bp+var_46]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_42]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_3E]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_46]
		add	[si+18h], eax
		mov	eax, [bp+var_42]
		add	[si+1Ch], eax
		mov	eax, [bp+var_3E]
		add	[si+20h], eax

loc_25D01:				; CODE XREF: sub_25AF8+47j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_25AF8	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_25D0B	proc far		; CODE XREF: sub_25FE4+11p

var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		or	eax, eax
		jge	short loc_25D24
		neg	eax

loc_25D24:				; CODE XREF: sub_25D0B+14j
		mov	[bp+var_C], eax
		mov	[bp+var_10], 38h ; '8'
		mov	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		sar	eax, 8
		cmp	eax, [bp+var_C]
		jle	short loc_25D55
		jmp	loc_25F14
; ���������������������������������������������������������������������������

loc_25D55:				; CODE XREF: sub_25D0B+45j
		push	[bp+arg_2]
		push	ss
		lea	ax, [bp+var_1C]
		push	ax
		call	sub_22E2A
		add	sp, 6
		mov	eax, [bp+var_1C]
		mov	[bp+var_4], eax
		push	[bp+arg_2]
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	sub_22E6C
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_8], eax
		mov	di, si
		mov	eax, [di]
		mov	[bp+var_46], eax
		mov	eax, [di+4]
		mov	[bp+var_42], eax
		mov	eax, [di+8]
		mov	[bp+var_3E], eax
		mov	eax, [si]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si], eax
		mov	eax, [si+4]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+4],	eax
		mov	ax, si
		add	ax, 4
		mov	eax, [si+8]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+8],	eax
		mov	ax, si
		add	ax, 8
		mov	ax, si
		add	ax, 0Ch
		mov	[bp+var_22], ax
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_2A], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+4]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_2E]
		mov	[bp+var_32], eax
		mov	bx, [bp+var_22]
		mov	eax, [bx+8]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_52]
		add	[si], eax
		mov	eax, [bp+var_4E]
		add	[si+4],	eax
		mov	eax, [bp+var_4A]
		add	[si+8],	eax
		mov	eax, [si+0Ch]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+0Ch], eax
		mov	ax, si
		add	ax, 0Ch
		mov	eax, [si+10h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+10h], eax
		mov	ax, si
		add	ax, 10h
		mov	eax, [si+14h]
		mov	edx, [bp+var_4]
		imul	edx
		shrd	eax, edx, 8
		mov	[si+14h], eax
		mov	ax, si
		add	ax, 14h
		mov	eax, [bp+var_46]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_42]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_3E]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_46]
		sub	[si+0Ch], eax
		mov	eax, [bp+var_42]
		sub	[si+10h], eax
		mov	eax, [bp+var_3E]
		sub	[si+14h], eax

loc_25F14:				; CODE XREF: sub_25D0B+47j
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_25D0B	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_25F1E	proc far		; CODE XREF: WorldObject_BuildOrientationMatrix_2589B+Fp Matrix_BuildFullOrientation_26047+Cp

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr sub_258D8
		add	sp, 4
		mov	eax, [di]
		or	eax, eax
		jge	short loc_25F40
		neg	eax

loc_25F40:				; CODE XREF: sub_25F1E+1Dj
		mov	[bp+var_4], eax
		mov	[bp+var_8], 38h	; '8'
		mov	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		sar	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_25F77
		push	si
		nop
		push	cs
		call	near ptr sub_26077
		add	sp, 2

loc_25F77:				; CODE XREF: sub_25F1E+4Ej
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_25F1E	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_25F81	proc far		; CODE XREF: WorldObject_BuildOrientationMatrix_2589B+1Ep
					; Matrix_BuildFullOrientation_26047+17p

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr sub_25AF8
		add	sp, 4
		mov	eax, [di]
		or	eax, eax
		jge	short loc_25FA3
		neg	eax

loc_25FA3:				; CODE XREF: sub_25F81+1Dj
		mov	[bp+var_4], eax
		mov	[bp+var_8], 38h	; '8'
		mov	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		sar	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_25FDA
		push	si
		nop
		push	cs
		call	near ptr sub_26101
		add	sp, 2

loc_25FDA:				; CODE XREF: sub_25F81+4Ej
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_25F81	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_25FE4	proc far		; CODE XREF: WorldObject_BuildOrientationMatrix_2589B+2Dp
					; Matrix_BuildFullOrientation_26047+22p

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		push	cs
		call	near ptr sub_25D0B
		add	sp, 4
		mov	eax, [di]
		or	eax, eax
		jge	short loc_26006
		neg	eax

loc_26006:				; CODE XREF: sub_25FE4+1Dj
		mov	[bp+var_4], eax
		mov	[bp+var_8], 38h	; '8'
		mov	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		sar	eax, 8
		cmp	eax, [bp+var_4]
		jge	short loc_2603D
		push	si
		nop
		push	cs
		call	near ptr sub_2618F
		add	sp, 2

loc_2603D:				; CODE XREF: sub_25FE4+4Ej
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_25FE4	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Matrix_BuildFullOrientation_575B2 (sub_575B2 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, seg116 L4776-4807 (relu 2026-09-05). Compose
; une matrice d'orientation 3D COMPLETE : Matrix_BuildAxisX_ApplyToObject_574B3(m, &ax) puis
; _AxisY_57508(m, &ay) puis _AxisZ_5755D(m, &az). Chaque _ApplyToObject lit l'angle en *ptr,
; et si |angle| >= 0x38 brut (= 56/256 = 0.21875 deg) appelle Matrix_BuildAxisX/Y/Z_56EC3 qui
; applique une rotation INCREMENTALE en place sur les lignes de la matrice cible (composition,
; pas reconstruction from-scratch). Utilisee via les methodes vtable
; WorldObject_ComposeOrientation3Angles_3CAE3 (matrice a objet+0x2C). C'est le chemin par
; lequel les vitesses angulaires de la physique tournent l'objet du monde chaque frame. Aussi
; ref. par Widget_AnchorTo3DPosition, sub_2C9F3, seg084.
; ==============================================================================================
Matrix_BuildFullOrientation_26047	proc far		; CODE XREF: seg052:0204P
					; sub_C1213+59P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_25F1E
		add	sp, 4
		push	[bp+arg_4]
		push	si
		push	cs
		call	near ptr sub_25F81
		add	sp, 4
		push	[bp+arg_6]
		push	si
		push	cs
		call	near ptr sub_25FE4
		add	sp, 4
		mov	ax, si
		pop	si
		pop	bp
		retf
Matrix_BuildFullOrientation_26047	endp

; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_26077	proc far		; CODE XREF: sub_25F1E+53p

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	si
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr sub_237BC
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si+18h], eax
		mov	eax, [bp+var_8]
		mov	[si+1Ch], eax
		mov	eax, [bp+var_4]
		mov	[si+20h], eax
		push	si
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	cs
		call	near ptr sub_237BC
		add	sp, 8
		mov	eax, [bp+var_18]
		mov	[si+0Ch], eax
		mov	eax, [bp+var_14]
		mov	[si+10h], eax
		mov	eax, [bp+var_10]
		mov	[si+14h], eax
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_241B4
		add	sp, 2
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_241B4
		add	sp, 2
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_241B4
		add	sp, 2
		mov	ax, si
		pop	si
		leave
		retf
sub_26077	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_26101	proc far		; CODE XREF: sub_13040+1B7P
					; sub_13040+22BP ...

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	si
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr sub_237BC
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si+18h], eax
		mov	eax, [bp+var_8]
		mov	[si+1Ch], eax
		mov	eax, [bp+var_4]
		mov	[si+20h], eax
		mov	ax, si
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	cs
		call	near ptr sub_237BC
		add	sp, 8
		mov	eax, [bp+var_18]
		mov	[si], eax
		mov	eax, [bp+var_14]
		mov	[si+4],	eax
		mov	eax, [bp+var_10]
		mov	[si+8],	eax
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_241B4
		add	sp, 2
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_241B4
		add	sp, 2
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_241B4
		add	sp, 2
		mov	ax, si
		pop	si
		leave
		retf
sub_26101	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2618F	proc far		; CODE XREF: sub_25FE4+53p

var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		push	cs
		call	near ptr sub_237BC
		add	sp, 8
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	eax, [bp+var_8]
		mov	[si+4],	eax
		mov	eax, [bp+var_4]
		mov	[si+8],	eax
		push	si
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp+var_18]
		push	ax
		push	cs
		call	near ptr sub_237BC
		add	sp, 8
		mov	eax, [bp+var_18]
		mov	[si+0Ch], eax
		mov	eax, [bp+var_14]
		mov	[si+10h], eax
		mov	eax, [bp+var_10]
		mov	[si+14h], eax
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_241B4
		add	sp, 2
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_241B4
		add	sp, 2
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_241B4
		add	sp, 2
		mov	ax, si
		pop	si
		leave
		retf
sub_2618F	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2621D	proc far		; CODE XREF: seg052:035EP
					; sub_C2FD0+46P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_26101
		add	sp, 2
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_2621D	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_26253	proc far		; CODE XREF: seg052:0337P seg052:0377P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	si
		call	Matrix_LocalToWorld_27393
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 0Ch
		push	ax
		call	Matrix_LocalToWorld_27393
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_26101
		add	sp, 2
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_26253	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0B4h
		push	si
		mov	si, [bp+6]
		push	3
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		lea	ax, [bp-14h]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 1Ch
		push	ax
		lea	ax, [bp-28h]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 18h
		push	ax
		lea	ax, [bp-3Ch]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 14h
		push	ax
		lea	ax, [bp-50h]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 10h
		push	ax
		lea	ax, [bp-64h]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 0Ch
		push	ax
		lea	ax, [bp-78h]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 8
		push	ax
		lea	ax, [bp-8Ch]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	3
		mov	ax, si
		add	ax, 4
		push	ax
		lea	ax, [bp-0A0h]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	3
		push	si
		lea	ax, [bp-0B4h]
		push	ax
		call	sub_23379
		add	sp, 6
		push	ax
		push	36B3h
		call	CRT_Msg_NullPtrAssign
		add	sp, 14h
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_2635D	proc far		; CODE XREF: seg057:2EBCp seg057:301Bp ...

var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_8]
		cmp	dword ptr [si],	0
		jl	short loc_2638B
		mov	eax, 16800h
		sub	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+arg_4], eax

loc_2638B:				; CODE XREF: sub_2635D+Ej
		mov	cx, word ptr [bp+arg_4+1]
		cmp	cx, 168h
		jl	short loc_263B5
		mov	ax, cx
		mov	bx, 168h
		cwd
		idiv	bx
		mov	cx, ax
		mov	ax, cx
		mov	dx, 168h
		imul	dx
		mov	[bp+var_A], ax
		movsx	eax, [bp+var_A]
		shl	eax, 8
		sub	[bp+arg_4], eax

loc_263B5:				; CODE XREF: sub_2635D+35j
		cmp	[bp+arg_4], 0B400h
		jle	short loc_263C7
		sub	[bp+arg_4], 16800h

loc_263C7:				; CODE XREF: sub_2635D+60j
		mov	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	[bx], eax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	si
		leave
		retf
sub_2635D	endp

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
		mov	ax, di
		add	ax, 0Ch
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp-8]
		mov	[bp-20h], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp-0Ch]
		mov	[bp-1Ch], eax
		mov	dword ptr [bp-18h], 0
		lea	ax, [bp-20h]
		push	ax
		push	cs
		call	near ptr sub_24127
		add	sp, 2
		lea	ax, [bp-1Ch]
		push	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	sub_22F4E
		add	sp, 6
		mov	eax, [bp-10h]
		mov	[bp-4],	eax
		lea	ax, [bp-20h]
		push	ax
		sub	sp, 4
		mov	eax, [bp-4]
		mov	[bp-2Ah], eax
		push	ss
		lea	ax, [bp-14h]
		push	ax
		push	cs
		call	near ptr sub_2635D
		add	sp, 0Ah
		mov	eax, [bp-14h]
		mov	[bp-4],	eax
		mov	eax, [bp-4]
		neg	eax
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
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		push	di
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp-8]
		mov	[bp-1Ch], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp-0Ch]
		mov	[bp-18h], eax
		mov	dword ptr [bp-14h], 0
		lea	ax, [bp-1Ch]
		push	ax
		push	cs
		call	near ptr sub_24127
		add	sp, 2
		lea	ax, [bp-18h]
		push	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	sub_22F4E
		add	sp, 6
		mov	eax, [bp-10h]
		mov	[bp-4],	eax
		cmp	dword ptr [bp-1Ch], 0
		jge	short loc_26524
		mov	eax, [bp-4]
		neg	eax
		mov	[bp-4],	eax

loc_26524:				; CODE XREF: seg057:2F67j
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
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		mov	ax, di
		add	ax, 0Ch
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp-8]
		mov	[bp-20h], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp-0Ch]
		mov	[bp-1Ch], eax
		mov	dword ptr [bp-18h], 0
		lea	ax, [bp-20h]
		push	ax
		push	cs
		call	near ptr sub_24127
		add	sp, 2
		lea	ax, [bp-1Ch]
		push	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	sub_22F4E
		add	sp, 6
		mov	eax, [bp-10h]
		mov	[bp-4],	eax
		lea	ax, [bp-20h]
		push	ax
		sub	sp, 4
		mov	eax, [bp-4]
		mov	[bp-2Ah], eax
		push	ss
		lea	ax, [bp-14h]
		push	ax
		push	cs
		call	near ptr sub_2635D
		add	sp, 0Ah
		mov	eax, [bp-14h]
		mov	[bp-4],	eax
		mov	eax, [bp-4]
		neg	eax
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
		sub	sp, 1Ch
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		push	di
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp-8]
		mov	[bp-1Ch], eax
		mov	ax, di
		add	ax, 18h
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp-0Ch]
		mov	[bp-18h], eax
		mov	dword ptr [bp-14h], 0
		lea	ax, [bp-1Ch]
		push	ax
		push	cs
		call	near ptr sub_24127
		add	sp, 2
		lea	ax, [bp-18h]
		push	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	sub_22F4E
		add	sp, 6
		mov	eax, [bp-10h]
		mov	[bp-4],	eax
		cmp	dword ptr [bp-1Ch], 0
		jge	short loc_26683
		mov	eax, [bp-4]
		neg	eax
		mov	[bp-4],	eax

loc_26683:				; CODE XREF: seg057:30C6j
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
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+0Ah]
		mov	di, [bp+0Ch]
		mov	ax, di
		add	ax, 0Ch
		push	ax
		push	si
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp-8]
		mov	[bp-20h], eax
		push	di
		push	si
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_2375C
		add	sp, 8
		mov	eax, [bp-0Ch]
		mov	[bp-1Ch], eax
		mov	dword ptr [bp-18h], 0
		lea	ax, [bp-20h]
		push	ax
		push	cs
		call	near ptr sub_24127
		add	sp, 2
		lea	ax, [bp-1Ch]
		push	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax
		call	sub_22F4E
		add	sp, 6
		mov	eax, [bp-10h]
		mov	[bp-4],	eax
		lea	ax, [bp-20h]
		push	ax
		sub	sp, 4
		mov	eax, [bp-4]
		mov	[bp-2Ah], eax
		push	ss
		lea	ax, [bp-14h]
		push	ax
		push	cs
		call	near ptr sub_2635D
		add	sp, 0Ah
		mov	eax, [bp-14h]
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
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp-4]
		push	ax
		push	cs
		call	near ptr sub_23A1A
		add	sp, 6
		mov	bx, [bp+6]
		mov	eax, [bp-4]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		mov	si, [bp+0Ah]
		cmp	dword ptr [si+20h], 0
		jnz	short loc_26788
		jmp	loc_2687B
; ���������������������������������������������������������������������������

loc_26788:				; CODE XREF: seg057:31D3j
		mov	eax, [si+10h]
		mov	[bp-30h], eax
		mov	eax, [si+0Ch]
		neg	eax
		mov	[bp-2Ch], eax
		mov	dword ptr [bp-28h], 0
		mov	ax, si
		add	ax, 18h
		push	ax
		lea	ax, [bp-30h]
		push	ax
		push	ss
		lea	ax, [bp-4]
		push	ax
		push	cs
		call	near ptr Math_DotProduct3D_2375C
		add	sp, 8
		lea	ax, [bp-30h]
		push	ax
		push	ss
		lea	ax, [bp-8]
		push	ax
		push	cs
		call	near ptr sub_2364D
		add	sp, 6
		cmp	dword ptr [bp-8], 0
		jnz	short loc_267DA
		mov	dword ptr [bp-4], 0
		jmp	short loc_2680A
; ���������������������������������������������������������������������������

loc_267DA:				; CODE XREF: seg057:321Ej
		lea	ax, [bp-8]
		push	ax
		lea	ax, [bp-4]
		push	ax
		push	ss
		lea	ax, [bp-0Ch]
		push	ax
		call	sub_23030
		add	sp, 8
		mov	eax, [bp-0Ch]
		neg	eax
		mov	[bp-10h], eax
		mov	eax, [bp-10h]
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	[bp-4],	eax

loc_2680A:				; CODE XREF: seg057:3228j
		add	dword ptr [bp-4], 5A00h
		cmp	dword ptr [si+20h], 0
		jge	short loc_26865
		cmp	dword ptr [bp-4], 0
		jle	short loc_26840
		mov	eax, 0B400h
		sub	eax, [bp-4]
		mov	[bp-18h], eax
		mov	eax, [bp-18h]
		mov	[bp-1Ch], eax
		mov	eax, [bp-1Ch]
		mov	[bp-4],	eax
		jmp	short loc_26865
; ���������������������������������������������������������������������������

loc_26840:				; CODE XREF: seg057:326Ej
		cmp	dword ptr [bp-4], 0
		jge	short loc_26865
		mov	eax, 0FFFF4C00h
		sub	eax, [bp-4]
		mov	[bp-20h], eax
		mov	eax, [bp-20h]
		mov	[bp-24h], eax
		mov	eax, [bp-24h]
		mov	[bp-4],	eax

loc_26865:				; CODE XREF: seg057:3267j seg057:328Ej ...
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
		jmp	short loc_268AD
; ���������������������������������������������������������������������������

loc_2687B:				; CODE XREF: seg057:31D5j
		mov	di, [bp+6]
		or	di, di
		jz	short loc_26886
		mov	ax, di
		jmp	short loc_26892
; ���������������������������������������������������������������������������

loc_26886:				; CODE XREF: seg057:32D0j
		push	4
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax

loc_26892:				; CODE XREF: seg057:32D4j
		or	ax, ax
		jz	short loc_268A1
		mov	dword ptr [di],	0
		mov	ax, di
		jmp	short loc_268A3
; ���������������������������������������������������������������������������

loc_268A1:				; CODE XREF: seg057:32E4j
		mov	ax, di

loc_268A3:				; CODE XREF: seg057:32EFj
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_268AD:				; CODE XREF: seg057:32C9j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp-4]
		push	ax
		push	cs
		call	near ptr sub_23B1A
		add	sp, 6
		mov	bx, [bp+6]
		mov	eax, [bp-4]
		mov	[bx], eax
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	di
		push	cs
		call	near ptr sub_2430F
		add	sp, 2
		push	di
		push	cs
		call	near ptr Vector_Normalize3D_241B4
		add	sp, 2
		cmp	dword ptr [di],	0
		jnz	short loc_26911
		cmp	dword ptr [di+4], 0
		jnz	short loc_26911
		jmp	loc_26997
; ���������������������������������������������������������������������������

loc_26911:				; CODE XREF: seg057:3355j seg057:335Cj
		mov	[bp-2],	di
		mov	bx, [bp-2]
		mov	eax, [bx]
		mov	[si+0Ch], eax
		mov	bx, [bp-2]
		mov	eax, [bx+4]
		mov	[si+10h], eax
		mov	bx, [bp-2]
		mov	eax, [bx+8]
		mov	[si+14h], eax
		mov	eax, [di+4]
		shl	eax, 5
		mov	[si], eax
		mov	eax, [di]
		neg	eax
		shl	eax, 5
		mov	[si+4],	eax
		mov	dword ptr [si+8], 0
		push	si
		push	cs
		call	near ptr Vector_Normalize3D_241B4
		add	sp, 2
		mov	ax, si
		add	ax, 0Ch
		push	ax
		push	si
		push	ss
		lea	ax, [bp-0Eh]
		push	ax
		push	cs
		call	near ptr sub_237BC
		add	sp, 8
		mov	eax, [bp-0Eh]
		mov	[si+18h], eax
		mov	eax, [bp-0Ah]
		mov	[si+1Ch], eax
		mov	eax, [bp-6]
		mov	[si+20h], eax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	cs
		call	near ptr Vector_Normalize3D_241B4
		add	sp, 2
		jmp	short loc_269E2
; ���������������������������������������������������������������������������

loc_26997:				; CODE XREF: seg057:335Ej
		mov	dword ptr [si],	100h
		xor	eax, eax
		mov	[si+20h], eax
		mov	[si+18h], eax
		mov	[si+10h], eax
		mov	[si+0Ch], eax
		mov	[si+8],	eax
		mov	[si+4],	eax
		cmp	dword ptr [di+8], 0
		jle	short loc_269D2
		mov	dword ptr [si+14h], 100h
		mov	dword ptr [si+1Ch], 0FFFFFF00h
		jmp	short loc_269E2
; ���������������������������������������������������������������������������

loc_269D2:				; CODE XREF: seg057:340Ej
		mov	dword ptr [si+14h], 0FFFFFF00h
		mov	dword ptr [si+1Ch], 100h

loc_269E2:				; CODE XREF: seg057:33E5j seg057:3420j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		cmp	dword ptr [bp+6], 0
		jnz	short loc_26A05
		push	large 24h ; '$'
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	[bp+8],	dx
		mov	[bp+6],	ax
		or	ax, dx
		jz	short loc_26A1F

loc_26A05:				; CODE XREF: seg057:343Ej
		mov	ax, [bp+6]
		add	ax, 0Ch
		mov	ax, [bp+6]
		add	ax, 18h
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		nop
		push	cs
		call	near ptr sub_26A29
		add	sp, 4

loc_26A1F:				; CODE XREF: seg057:3453j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_26A29	proc far		; CODE XREF: seg057:3469p

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, dword_46690
		mov	es:[bx], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_46694
		mov	es:[bx+4], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_46698
		mov	es:[bx+8], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_4669C
		mov	es:[bx+0Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_466A0
		mov	es:[bx+10h], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_466A4
		mov	es:[bx+14h], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_466A8
		mov	es:[bx+18h], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_466AC
		mov	es:[bx+1Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_466B0
		mov	es:[bx+20h], eax
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_26A29	endp

; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_26AA1:				; DATA XREF: dseg:5928o
		push	bp
		mov	bp, sp
		sub	sp, 30h
		mov	dword ptr [bp-4], 100h
		mov	eax, [bp-4]
		mov	dword_46690, eax
		mov	dword ptr [bp-8], 0
		mov	eax, [bp-8]
		mov	dword_46694, eax
		mov	dword ptr [bp-0Ch], 0
		mov	eax, [bp-0Ch]
		mov	dword_46698, eax
		mov	dword ptr [bp-10h], 0
		mov	eax, [bp-10h]
		mov	dword_4669C, eax
		mov	dword ptr [bp-14h], 100h
		mov	eax, [bp-14h]
		mov	dword_466A0, eax
		mov	dword ptr [bp-18h], 0
		mov	eax, [bp-18h]
		mov	dword_466A4, eax
		mov	dword ptr [bp-1Ch], 0
		mov	eax, [bp-1Ch]
		mov	dword_466A8, eax
		mov	dword ptr [bp-20h], 0
		mov	eax, [bp-20h]
		mov	dword_466AC, eax
		mov	dword ptr [bp-24h], 100h
		mov	eax, [bp-24h]
		mov	dword_466B0, eax
		mov	dword ptr [bp-28h], 0
		mov	eax, [bp-28h]
		mov	dword_466B4, eax
		mov	dword ptr [bp-2Ch], 0
		mov	eax, [bp-2Ch]
		mov	dword_466B8, eax
		mov	dword ptr [bp-30h], 0
		mov	eax, [bp-30h]
		mov	dword_466BC, eax
		push	6504h
		push	cs
		call	near ptr sub_25718
		add	sp, 2
		push	ds
		push	offset unk_49548
		push	cs
		call	near ptr sub_25699
		add	sp, 4
		leave
		retf
seg057		ends
