ovr215		segment	para public 'OVERLAY' use16
		assume cs:ovr215
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C0550	proc far		; CODE XREF: sub_4280FJ

var_CC		= dword	ptr -0CCh
var_C8		= dword	ptr -0C8h
var_C4		= dword	ptr -0C4h
var_C0		= dword	ptr -0C0h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B2		= word ptr -0B2h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= word ptr -0A4h
var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= word ptr -9Ah
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= word ptr -90h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= word ptr -86h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= word ptr -7Ch
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= word ptr -72h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_66		= word ptr -66h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= word ptr -36h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= byte ptr -8
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0CCh
		push	si
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_443B1, cl
		mov	[bp+var_6], 0
		xor	eax, eax
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	[bp+var_8], al
		push	si
		call	ResourceRecord_ReadFinalField_3C3C1
		add	sp, 2
		mov	[bp+var_1], al
		mov	al, [bp+var_1]
		cbw
		cmp	ax, 42h	; 'B'
		jnz	short loc_C0599
		jmp	loc_C074C
; ���������������������������������������������������������������������������

loc_C0599:				; CODE XREF: sub_C0550+44j
		cmp	ax, 4Ch	; 'L'
		jnz	short loc_C05A1
		jmp	loc_C09F8
; ���������������������������������������������������������������������������

loc_C05A1:				; CODE XREF: sub_C0550+4Cj
		cmp	ax, 53h	; 'S'
		jz	short loc_C05A9
		jmp	loc_C0AAF
; ���������������������������������������������������������������������������

loc_C05A9:				; CODE XREF: sub_C0550+54j
		mov	[bp+var_16], si
		push	[bp+var_16]
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	sub_C7FA
		add	sp, 6
		mov	eax, [bp+var_20]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 0
		mov	[bp+var_22], si
		push	[bp+var_22]
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		shl	eax, 8
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_CC]
		sar	eax, 8
		mov	[bp+var_CC], eax
		mov	[bp+var_2C], si
		push	[bp+var_2C]
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		shl	eax, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_C8]
		sar	eax, 8
		mov	[bp+var_C8], eax
		mov	[bp+var_36], si
		push	[bp+var_36]
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		shl	eax, 8
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_C4], eax
		mov	eax, [bp+var_C4]
		sar	eax, 8
		mov	[bp+var_C4], eax
		mov	[bp+var_40], si
		push	[bp+var_40]
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_44], eax
		mov	eax, [bp+var_44]
		shl	eax, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		sar	eax, 8
		mov	[bp+var_14], eax
		push	1
		push	0
		push	2
		push	large 1Fh
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_4C+2],	dx
		mov	word ptr [bp+var_4C], ax
		or	ax, dx
		jz	short loc_C073D
		les	bx, [bp+var_4C]
		mov	word ptr es:[bx], 2EB6h
		xor	eax, eax
		les	bx, [bp+var_4C]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+var_4C]
		mov	es:[bx+6], eax
		les	bx, [bp+var_4C]
		mov	es:[bx+0Eh], al
		les	bx, [bp+var_4C]
		mov	dword ptr es:[bx+2], 0
		les	bx, [bp+var_4C]
		mov	word ptr es:[bx], 2ECAh
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		lea	ax, [bp+var_CC]
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		push	word ptr [bp+var_4C+2]
		push	word ptr [bp+var_4C]
		call	sub_14DB3
		add	sp, 0Ch
		mov	dx, word ptr [bp+var_4C+2]
		mov	ax, word ptr [bp+var_4C]
		jmp	short loc_C0743
; ���������������������������������������������������������������������������

loc_C073D:				; CODE XREF: sub_C0550+191j
		mov	dx, word ptr [bp+var_4C+2]
		mov	ax, word ptr [bp+var_4C]

loc_C0743:				; CODE XREF: sub_C0550+1EBj
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		jmp	loc_C0ABC
; ���������������������������������������������������������������������������

loc_C074C:				; CODE XREF: sub_C0550+46j
		mov	[bp+var_66], si
		push	[bp+var_66]
		lea	ax, [bp+var_70]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		mov	eax, [bp+var_70]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 0
		mov	[bp+var_72], si
		push	[bp+var_72]
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_76], eax
		mov	eax, [bp+var_76]
		shl	eax, 8
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		sar	eax, 8
		mov	[bp+var_50], eax
		mov	[bp+var_7C], si
		push	[bp+var_7C]
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_80], eax
		mov	eax, [bp+var_80]
		shl	eax, 8
		mov	[bp+var_84], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		sar	eax, 8
		mov	[bp+var_54], eax
		mov	[bp+var_86], si
		push	[bp+var_86]
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_8A]
		shl	eax, 8
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8E]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_58]
		sar	eax, 8
		mov	[bp+var_58], eax
		mov	[bp+var_90], si
		push	[bp+var_90]
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_94], eax
		mov	eax, [bp+var_94]
		shl	eax, 8
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_5C]
		sar	eax, 8
		mov	[bp+var_5C], eax
		mov	[bp+var_9A], si
		push	[bp+var_9A]
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_9E]
		shl	eax, 8
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_60]
		sar	eax, 8
		mov	[bp+var_60], eax
		mov	[bp+var_A4], si
		push	[bp+var_A4]
		call	ResourceRecord_ReadFieldGroupC_3C2EE
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_A8]
		shl	eax, 8
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_64]
		sar	eax, 8
		mov	[bp+var_64], eax
		push	1
		push	0
		push	2
		push	large 37h ; '7'
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_B0+2],	dx
		mov	word ptr [bp+var_B0], ax
		or	ax, dx
		jnz	short loc_C0911
		jmp	loc_C09E7
; ���������������������������������������������������������������������������

loc_C0911:				; CODE XREF: sub_C0550+3BCj
		les	bx, [bp+var_B0]
		mov	word ptr es:[bx], 2EB6h
		xor	eax, eax
		les	bx, [bp+var_B0]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+var_B0]
		mov	es:[bx+6], eax
		les	bx, [bp+var_B0]
		mov	es:[bx+0Eh], al
		les	bx, [bp+var_B0]
		mov	dword ptr es:[bx+2], 0
		les	bx, [bp+var_B0]
		mov	word ptr es:[bx], 2EA2h
		push	seg stub215
		push	offset sub_4280A
		push	5
		push	large 2
		push	4
		mov	ax, word ptr [bp+var_B0]
		add	ax, 1Fh
		push	word ptr [bp+var_B0+2]
		push	ax
		call	CRT_Doscan_Core
		add	sp, 10h
		push	seg stub215
		push	offset sub_4280A
		push	5
		push	large 2
		push	4
		mov	ax, word ptr [bp+var_B0]
		add	ax, 27h	; '''
		push	word ptr [bp+var_B0+2]
		push	ax
		call	CRT_Doscan_Core
		add	sp, 10h
		push	seg stub215
		push	offset sub_4280A
		push	5
		push	large 2
		push	4
		mov	ax, word ptr [bp+var_B0]
		add	ax, 2Fh	; '/'
		push	word ptr [bp+var_B0+2]
		push	ax
		call	CRT_Doscan_Core
		add	sp, 10h
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		lea	ax, [bp+var_64]
		push	ax
		lea	ax, [bp+var_60]
		push	ax
		lea	ax, [bp+var_5C]
		push	ax
		lea	ax, [bp+var_58]
		push	ax
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		push	word ptr [bp+var_B0+2]
		push	word ptr [bp+var_B0]
		nop
		push	cs
		call	near ptr sub_C0AC8
		add	sp, 14h
		mov	dx, word ptr [bp+var_B0+2]
		mov	ax, word ptr [bp+var_B0]
		jmp	short loc_C09EF
; ���������������������������������������������������������������������������

loc_C09E7:				; CODE XREF: sub_C0550+3BEj
		mov	dx, word ptr [bp+var_B0+2]
		mov	ax, word ptr [bp+var_B0]

loc_C09EF:				; CODE XREF: sub_C0550+495j
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		jmp	loc_C0ABC
; ���������������������������������������������������������������������������

loc_C09F8:				; CODE XREF: sub_C0550+4Ej
		mov	[bp+var_B2], si
		push	[bp+var_B2]
		push	ss
		lea	ax, [bp+var_BC]
		push	ax
		call	sub_C7FA
		add	sp, 6
		mov	eax, [bp+var_BC]
		mov	[bp+var_10], eax
		mov	eax, [bp+var_B8]
		mov	[bp+var_C], eax
		mov	[bp+var_8], 0
		push	1
		push	0
		push	2
		push	large 2Bh ; '+'
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_C0+2],	dx
		mov	word ptr [bp+var_C0], ax
		or	ax, dx
		jz	short loc_C0A9F
		les	bx, [bp+var_C0]
		mov	word ptr es:[bx], 2EB6h
		xor	eax, eax
		les	bx, [bp+var_C0]
		mov	es:[bx+0Ah], eax
		les	bx, [bp+var_C0]
		mov	es:[bx+6], eax
		les	bx, [bp+var_C0]
		mov	es:[bx+0Eh], al
		les	bx, [bp+var_C0]
		mov	dword ptr es:[bx+2], 0
		les	bx, [bp+var_C0]
		mov	word ptr es:[bx], 2E8Eh
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		push	word ptr [bp+var_C0+2]
		push	word ptr [bp+var_C0]
		call	sub_15147
		add	sp, 8
		mov	dx, word ptr [bp+var_C0+2]
		mov	ax, word ptr [bp+var_C0]
		jmp	short loc_C0AA7
; ���������������������������������������������������������������������������

loc_C0A9F:				; CODE XREF: sub_C0550+4F2j
		mov	dx, word ptr [bp+var_C0+2]
		mov	ax, word ptr [bp+var_C0]

loc_C0AA7:				; CODE XREF: sub_C0550+54Dj
		mov	word ptr [bp+var_6+2], dx
		mov	word ptr [bp+var_6], ax
		jmp	short loc_C0ABC
; ���������������������������������������������������������������������������

loc_C0AAF:				; CODE XREF: sub_C0550+56j
		push	0C008h
		call	sub_30D3
		add	sp, 2
		jmp	short $+2

loc_C0ABC:				; CODE XREF: sub_C0550+1F9j
					; sub_C0550+4A5j ...
		mov	dx, word ptr [bp+var_6+2]
		mov	ax, word ptr [bp+var_6]
		pop	si
		leave
		retf
sub_C0550	endp

; ���������������������������������������������������������������������������
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C0AC8	proc far		; CODE XREF: sub_42814J sub_C0550+487p

var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= word ptr -44h
var_42		= dword	ptr -42h
var_3E		= word ptr -3Eh
var_3C		= dword	ptr -3Ch
var_38		= word ptr -38h
var_36		= dword	ptr -36h
var_32		= word ptr -32h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
var_24		= dword	ptr -24h
var_20		= word ptr -20h
var_1E		= dword	ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= dword	ptr -0Ch
var_8		= word ptr -8
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= dword	ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 0BCh
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_6]
		mov	eax, [di]
		cmp	eax, [si]
		jle	short loc_C0AE4
		mov	ax, 1
		jmp	short loc_C0AE6
; ���������������������������������������������������������������������������

loc_C0AE4:				; CODE XREF: sub_C0AC8+15j
		xor	ax, ax

loc_C0AE6:				; CODE XREF: sub_C0AC8+1Aj
		or	al, al
		jz	short loc_C0B1E
		mov	[bp+var_2], di
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], eax
		mov	[bp+var_8], si
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		les	bx, [bp+arg_0]
		mov	es:[bx+23h], eax
		jmp	short loc_C0B50
; ���������������������������������������������������������������������������

loc_C0B1E:				; CODE XREF: sub_C0AC8+20j
		mov	[bp+var_E], si
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], eax
		mov	[bp+var_14], di
		mov	bx, [bp+var_14]
		mov	eax, [bx]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		les	bx, [bp+arg_0]
		mov	es:[bx+23h], eax

loc_C0B50:				; CODE XREF: sub_C0AC8+54j
		mov	bx, [bp+arg_A]
		mov	eax, [bx]
		mov	bx, [bp+arg_8]
		cmp	eax, [bx]
		jle	short loc_C0B63
		mov	ax, 1
		jmp	short loc_C0B65
; ���������������������������������������������������������������������������

loc_C0B63:				; CODE XREF: sub_C0AC8+94j
		xor	ax, ax

loc_C0B65:				; CODE XREF: sub_C0AC8+99j
		or	al, al
		jz	short loc_C0BA3
		mov	ax, [bp+arg_A]
		mov	[bp+var_1A], ax
		mov	bx, [bp+var_1A]
		mov	eax, [bx]
		mov	[bp+var_1E], eax
		mov	eax, [bp+var_1E]
		les	bx, [bp+arg_0]
		mov	es:[bx+27h], eax
		mov	ax, [bp+arg_8]
		mov	[bp+var_20], ax
		mov	bx, [bp+var_20]
		mov	eax, [bx]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Bh], eax
		jmp	short loc_C0BDB
; ���������������������������������������������������������������������������

loc_C0BA3:				; CODE XREF: sub_C0AC8+9Fj
		mov	ax, [bp+arg_8]
		mov	[bp+var_26], ax
		mov	bx, [bp+var_26]
		mov	eax, [bx]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		les	bx, [bp+arg_0]
		mov	es:[bx+27h], eax
		mov	ax, [bp+arg_A]
		mov	[bp+var_2C], ax
		mov	bx, [bp+var_2C]
		mov	eax, [bx]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Bh], eax

loc_C0BDB:				; CODE XREF: sub_C0AC8+D9j
		mov	bx, [bp+arg_E]
		mov	eax, [bx]
		mov	bx, [bp+arg_C]
		cmp	eax, [bx]
		jle	short loc_C0BEE
		mov	ax, 1
		jmp	short loc_C0BF0
; ���������������������������������������������������������������������������

loc_C0BEE:				; CODE XREF: sub_C0AC8+11Fj
		xor	ax, ax

loc_C0BF0:				; CODE XREF: sub_C0AC8+124j
		or	al, al
		jz	short loc_C0C2E
		mov	ax, [bp+arg_E]
		mov	[bp+var_32], ax
		mov	bx, [bp+var_32]
		mov	eax, [bx]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Fh], eax
		mov	ax, [bp+arg_C]
		mov	[bp+var_38], ax
		mov	bx, [bp+var_38]
		mov	eax, [bx]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_3C]
		les	bx, [bp+arg_0]
		mov	es:[bx+33h], eax
		jmp	short loc_C0C66
; ���������������������������������������������������������������������������

loc_C0C2E:				; CODE XREF: sub_C0AC8+12Aj
		mov	ax, [bp+arg_C]
		mov	[bp+var_3E], ax
		mov	bx, [bp+var_3E]
		mov	eax, [bx]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		les	bx, [bp+arg_0]
		mov	es:[bx+2Fh], eax
		mov	ax, [bp+arg_E]
		mov	[bp+var_44], ax
		mov	bx, [bp+var_44]
		mov	eax, [bx]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		les	bx, [bp+arg_0]
		mov	es:[bx+33h], eax

loc_C0C66:				; CODE XREF: sub_C0AC8+164j
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 23h	; '#'
		mov	word ptr [bp+var_64+2],	ax
		mov	word ptr [bp+var_64], dx
		les	bx, [bp+var_64]
		mov	eax, es:[bx]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_4C], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 1Fh
		mov	word ptr [bp+var_6C+2],	ax
		mov	word ptr [bp+var_6C], dx
		les	bx, [bp+var_6C]
		mov	eax, es:[bx]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_50], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 27h	; '''
		mov	word ptr [bp+var_74+2],	ax
		mov	word ptr [bp+var_74], dx
		les	bx, [bp+var_74]
		mov	eax, es:[bx]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_54], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Bh	; '+'
		mov	word ptr [bp+var_7C+2],	ax
		mov	word ptr [bp+var_7C], dx
		les	bx, [bp+var_7C]
		mov	eax, es:[bx]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_58], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 2Fh	; '/'
		mov	word ptr [bp+var_84+2],	ax
		mov	word ptr [bp+var_84], dx
		les	bx, [bp+var_84]
		mov	eax, es:[bx]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_5C], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 33h	; '3'
		mov	word ptr [bp+var_8C+2],	ax
		mov	word ptr [bp+var_8C], dx
		les	bx, [bp+var_8C]
		mov	eax, es:[bx]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_50]
		sub	eax, [bp+var_4C]
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_54]
		sub	eax, [bp+var_58]
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_5C]
		sub	eax, [bp+var_60]
		mov	[bp+var_A8], eax
		mov	[bp+var_94], 200h
		mov	eax, [bp+var_B0]
		mov	edx, eax
		mov	ecx, [bp+var_94]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_AC]
		mov	edx, eax
		mov	ecx, [bp+var_94]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_A8]
		mov	edx, eax
		mov	ecx, [bp+var_94]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_A8], eax
		mov	eax, [bp+var_4C]
		add	eax, [bp+var_50]
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_54]
		add	eax, [bp+var_58]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_5C]
		add	eax, [bp+var_60]
		mov	[bp+var_B4], eax
		mov	[bp+var_98], 200h
		mov	eax, [bp+var_BC]
		mov	edx, eax
		mov	ecx, [bp+var_98]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_B8]
		mov	edx, eax
		mov	ecx, [bp+var_98]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_B4]
		mov	edx, eax
		mov	ecx, [bp+var_98]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_B4], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_BC]
		mov	es:[bx+13h], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_B8]
		mov	es:[bx+17h], eax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_B4]
		mov	es:[bx+1Bh], eax
		lea	ax, [bp+var_B0]
		push	ax
		push	ss
		lea	ax, [bp+var_9C]
		push	ax
		call	sub_2364D
		add	sp, 6
		mov	eax, [bp+var_9C]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_A0]
		les	bx, [bp+arg_0]
		mov	es:[bx+0Fh], eax
		mov	eax, [bp+arg_10]
		mov	[bp+var_A4], eax
		push	8
		push	word ptr [bp+var_A4+2]
		push	word ptr [bp+var_A4]
		mov	ax, word ptr [bp+arg_0]
		add	ax, 6
		push	word ptr [bp+arg_0+2]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Eh], 0
		pop	di
		pop	si
		leave
		retf
sub_C0AC8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C0ECC	proc far		; CODE XREF: sub_4280AJ

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_C0EEB
		push	large 4
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short $+2

loc_C0EEB:				; CODE XREF: sub_C0ECC+8j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_C0ECC	endp

; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C0EF5	proc far		; CODE XREF: sub_42805J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx+1Fh], eax
		mov	eax, [si+4]
		les	bx, [bp+arg_0]
		mov	es:[bx+23h], eax
		mov	eax, [si+8]
		les	bx, [bp+arg_0]
		mov	es:[bx+27h], eax
		pop	si
		pop	bp
		retf
sub_C0EF5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C0F22	proc far		; CODE XREF: sub_42800J
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_C0F22	endp

ovr215		ends
