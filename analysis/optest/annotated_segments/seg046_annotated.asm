seg046		segment	byte public 'CODE' use16
		assume cs:seg046
		;org 5
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

loc_1E3B5:				; DATA XREF: dseg:3247o dseg:325Bo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	ax, si
		add	ax, 2
		push	ax
		push	ds
		push	offset unk_493A7
		call	sub_42E6F
		add	sp, 6
		mov	ax, [si+2]
		cmp	ax, [si+10h]
		jz	short loc_1E3EA
		mov	ax, si
		add	ax, 10h
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		call	UI_ApplyEncodingHelper_2EC4A
		add	sp, 4

loc_1E3EA:				; CODE XREF: seg046:0024j
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1E3ED	proc far		; CODE XREF: seg046:013Cp

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	eax, [bx]
		mov	[di], eax
		mov	bx, [bp+arg_2]
		mov	eax, [bx+4]
		mov	[di+4],	eax
		mov	bx, [bp+arg_2]
		mov	eax, [bx+8]
		mov	[di+8],	eax
		mov	bx, [bp+arg_2]
		mov	eax, [bx+0Ch]
		mov	[di+0Ch], eax
		mov	bx, [bp+arg_2]
		mov	eax, [bx+10h]
		mov	[di+10h], eax
		mov	ax, [bp+arg_2]
		add	ax, 14h
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		mov	eax, [bx]
		mov	[di+14h], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+4]
		mov	[di+18h], eax
		mov	bx, [bp+var_2]
		mov	eax, [bx+8]
		mov	[di+1Ch], eax
		mov	ax, [bp+arg_2]
		add	ax, 20h	; ' '
		push	ax
		mov	ax, di
		add	ax, 20h	; ' '
		push	ax
		call	sub_2581F
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	eax, [bx+44h]
		mov	[di+44h], eax
		mov	bx, [bp+arg_2]
		mov	ax, [bx+48h]
		mov	[di+48h], ax
		mov	bx, [bp+arg_2]
		mov	ax, [bx+4Ah]
		mov	[di+4Ah], ax
		mov	bx, [bp+arg_2]
		mov	ax, [bx+4Ch]
		mov	[di+4Ch], ax
		mov	bx, [bp+arg_2]
		mov	ax, [bx+4Eh]
		mov	[di+4Eh], ax
		pop	di
		pop	si
		leave
		retf
sub_1E3ED	endp

; ���������������������������������������������������������������������������

loc_1E49E:				; DATA XREF: dseg:2DBCo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		nop
		push	cs
		call	near ptr sub_1E61F
		add	sp, 2
		mov	al, 1
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1E4B6:				; DATA XREF: dseg:2DC0o
		push	bp
		mov	bp, sp
		mov	dx, [bp+6]
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1E4C2:				; DATA XREF: dseg:2DC4o
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+6]
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_49462, eax
		cmp	word ptr [si+5Ch], 0
		jnz	short loc_1E4E7
		jmp	loc_1E609
; ���������������������������������������������������������������������������

loc_1E4E7:				; CODE XREF: seg046:0132j
		push	si
		push	6066h
		push	cs
		call	near ptr sub_1E3ED
		add	sp, 4
		mov	ax, [si+5Ch]
		add	ax, 2
		push	ax
		lea	ax, [bp-4]
		push	ax
		call	SmallObject_RegisterInList_2CB40
		add	sp, 4
		cmp	byte_49084, 0
		jz	short loc_1E529
		push	si
		nop
		push	cs
		call	near ptr Camera_UpdateViewportClip
		add	sp, 2
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_49466, eax
		jmp	short loc_1E55D
; ���������������������������������������������������������������������������

loc_1E529:				; CODE XREF: seg046:015Aj
		push	0
		push	0
		mov	al, byte_492EA
		push	ax
		push	word ptr dword_492E6+2
		push	word ptr dword_492E6
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		mov	bx, [si+5Ch]
		mov	ax, [bx+16h]
		neg	ax
		push	ax
		push	0
		push	word_46F44
		call	Render_MeasureOrDrawTextString_32CD8
		add	sp, 0Ch

loc_1E55D:				; CODE XREF: seg046:0177j
		mov	word_492C8, 0
		push	si
		push	6369h
		call	sub_200EA
		add	sp, 4
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4946A, eax
		push	62A6h
		call	sub_1D569
		add	sp, 2
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_4946E, eax
		push	62A6h
		call	sub_1D446
		add	sp, 2
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_49472, eax
		push	si
		call	sub_42D10
		add	sp, 2
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+20h]
		add	sp, 2
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+14h]
		add	sp, 2
		mov	[bp-6],	al
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 2
		call	sub_67A6
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	dword_49476, eax
		push	2
		lea	ax, [bp-4]
		push	ax
		call	SmallObject_UnregisterFromList_2CB7A
		add	sp, 4

loc_1E609:				; CODE XREF: seg046:0134j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1E60C:				; DATA XREF: dseg:2DCCo
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	si
		call	sub_42B60
		add	sp, 2
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_1E61F	proc far		; CODE XREF: seg046:00F8p

var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= word ptr -46h
var_44		= word ptr -44h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= word ptr -26h
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

		push	bp
		mov	bp, sp
		sub	sp, 96h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [si+2Ch]
		mov	[bp+var_8A], eax
		mov	eax, [si+30h]
		mov	[bp+var_86], eax
		mov	[bp+var_14], 0
		mov	eax, [bp+var_14]
		mov	[bp+var_82], eax
		lea	ax, [bp+var_8A]
		push	ax
		call	sub_24127
		add	sp, 2
		mov	eax, [bp+var_86]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_8A]
		neg	eax
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_8A]
		mov	edx, dword_464C7
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_86]
		mov	edx, dword_464C7
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_86], eax
		mov	eax, [bp+var_82]
		mov	edx, dword_464C7
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_82], eax
		mov	eax, dword_464C7
		sar	eax, 1
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_96]
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_96], eax
		mov	eax, [bp+var_92]
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_92], eax
		mov	eax, [bp+var_8E]
		mov	edx, [bp+var_24]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		sub	[bp+var_8A], eax
		mov	eax, [bp+var_92]
		sub	[bp+var_86], eax
		mov	eax, [bp+var_8E]
		sub	[bp+var_82], eax
		mov	eax, [bp+var_8A]
		add	[bp+var_96], eax
		mov	eax, [bp+var_86]
		add	[bp+var_92], eax
		mov	eax, [bp+var_82]
		add	[bp+var_8E], eax
		mov	eax, dword_464CB
		mov	[bp+var_82], eax
		mov	eax, dword_464CB
		mov	[bp+var_8E], eax
		mov	ax, si
		add	ax, 1Ch
		mov	di, ax
		mov	eax, [di]
		sub	[bp+var_82], eax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		lea	ax, [bp+var_8A]
		push	ax
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		mov	ax, si
		add	ax, 1Ch
		mov	[bp+var_26], ax
		mov	bx, [bp+var_26]
		mov	eax, [bx]
		sub	[bp+var_8E], eax
		mov	ax, si
		add	ax, 20h	; ' '
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	Matrix_WorldToLocal_272D3
		add	sp, 4
		mov	[bp+var_2A], 0E6h ; '�'
		mov	eax, [si+34h]
		cmp	eax, [bp+var_2A]
		jle	short loc_1E7D3
		mov	ax, 1
		jmp	short loc_1E7D5
; ���������������������������������������������������������������������������

loc_1E7D3:				; CODE XREF: sub_1E61F+1ADj
		xor	ax, ax

loc_1E7D5:				; CODE XREF: sub_1E61F+1B2j
		or	al, al
		jnz	short loc_1E7F6
		mov	[bp+var_2E], 0FFFFFF1Ah
		mov	eax, [si+34h]
		cmp	eax, [bp+var_2E]
		jge	short loc_1E7F0
		mov	ax, 1
		jmp	short loc_1E7F2
; ���������������������������������������������������������������������������

loc_1E7F0:				; CODE XREF: sub_1E61F+1CAj
		xor	ax, ax

loc_1E7F2:				; CODE XREF: sub_1E61F+1CFj
		or	al, al
		jz	short loc_1E84D

loc_1E7F6:				; CODE XREF: sub_1E61F+1B8j
		cmp	dword ptr [si+34h], 0
		jle	short loc_1E802
		mov	ax, 1
		jmp	short loc_1E804
; ���������������������������������������������������������������������������

loc_1E802:				; CODE XREF: sub_1E61F+1DCj
		xor	ax, ax

loc_1E804:				; CODE XREF: sub_1E61F+1E1j
		or	al, al
		jz	short loc_1E82A
		mov	[bp+var_4], 0FFFFFF9Ch
		mov	[bp+var_8], 12Ch
		mov	[bp+var_C], 190h
		mov	[bp+var_10], 12Ch
		jmp	short loc_1E84A
; ���������������������������������������������������������������������������

loc_1E82A:				; CODE XREF: sub_1E61F+1E7j
		mov	[bp+var_4], 0FFFFFF9Ch
		mov	[bp+var_8], 0FFFFFF9Ch
		mov	[bp+var_C], 190h
		mov	[bp+var_10], 0FFFFFF9Ch

loc_1E84A:				; CODE XREF: sub_1E61F+209j
		jmp	loc_1E9D3
; ���������������������������������������������������������������������������

loc_1E84D:				; CODE XREF: sub_1E61F+1D5j
		mov	ax, [si+8]
		mov	[bp+var_30], ax
		mov	ax, si
		add	ax, 0Ch
		mov	[bp+var_32], ax
		push	large [bp+var_86]
		mov	bx, [bp+var_32]
		push	large dword ptr	[bx]
		push	large [bp+var_8A]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_36], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_3A], eax
		movsx	eax, [bp+var_30]
		shl	eax, 8
		mov	edx, [bp+var_3A]
		add	edx, eax
		mov	[bp+var_3E], edx
		mov	eax, [bp+var_3E]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		sar	eax, 8
		mov	[bp+var_4], eax
		mov	ax, [si+0Ah]
		mov	[bp+var_44], ax
		mov	ax, si
		add	ax, 10h
		mov	[bp+var_46], ax
		push	large [bp+var_86]
		mov	bx, [bp+var_46]
		push	large dword ptr	[bx]
		push	large [bp+var_82]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_4E], eax
		movsx	eax, [bp+var_44]
		shl	eax, 8
		sub	eax, [bp+var_4E]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_52]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		sar	eax, 8
		mov	[bp+var_8], eax
		mov	ax, [si+8]
		mov	[bp+var_58], ax
		mov	ax, si
		add	ax, 0Ch
		mov	[bp+var_5A], ax
		push	large [bp+var_92]
		mov	bx, [bp+var_5A]
		push	large dword ptr	[bx]
		push	large [bp+var_96]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_5E]
		mov	[bp+var_62], eax
		movsx	eax, [bp+var_58]
		shl	eax, 8
		mov	edx, [bp+var_62]
		add	edx, eax
		mov	[bp+var_66], edx
		mov	eax, [bp+var_66]
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_6A]
		sar	eax, 8
		mov	[bp+var_C], eax
		mov	ax, [si+0Ah]
		mov	[bp+var_6C], ax
		mov	ax, si
		add	ax, 10h
		mov	[bp+var_6E], ax
		push	large [bp+var_92]
		mov	bx, [bp+var_6E]
		push	large dword ptr	[bx]
		push	large [bp+var_8E]
		call	Math_FixedMulDiv_26BB4
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 0Ch
		mov	[bp+var_72], eax
		mov	eax, [bp+var_72]
		mov	[bp+var_76], eax
		movsx	eax, [bp+var_6C]
		shl	eax, 8
		sub	eax, [bp+var_76]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_7E]
		sar	eax, 8
		mov	[bp+var_10], eax

loc_1E9D3:				; CODE XREF: sub_1E61F:loc_1E84Aj
		cmp	[bp+var_4], 1FFFh
		jle	short loc_1E9E7
		mov	[bp+var_4], 1FFFh
		jmp	short loc_1E9F9
; ���������������������������������������������������������������������������

loc_1E9E7:				; CODE XREF: sub_1E61F+3BCj
		cmp	[bp+var_4], 0FFFFE001h
		jge	short loc_1E9F9
		mov	[bp+var_4], 0FFFFE001h

loc_1E9F9:				; CODE XREF: sub_1E61F+3C6j
					; sub_1E61F+3D0j
		cmp	[bp+var_8], 1FFFh
		jle	short loc_1EA0D
		mov	[bp+var_8], 1FFFh
		jmp	short loc_1EA1F
; ���������������������������������������������������������������������������

loc_1EA0D:				; CODE XREF: sub_1E61F+3E2j
		cmp	[bp+var_8], 0FFFFE001h
		jge	short loc_1EA1F
		mov	[bp+var_8], 0FFFFE001h

loc_1EA1F:				; CODE XREF: sub_1E61F+3ECj
					; sub_1E61F+3F6j
		cmp	[bp+var_C], 1FFFh
		jle	short loc_1EA33
		mov	[bp+var_C], 1FFFh
		jmp	short loc_1EA45
; ���������������������������������������������������������������������������

loc_1EA33:				; CODE XREF: sub_1E61F+408j
		cmp	[bp+var_C], 0FFFFE001h
		jge	short loc_1EA45
		mov	[bp+var_C], 0FFFFE001h

loc_1EA45:				; CODE XREF: sub_1E61F+412j
					; sub_1E61F+41Cj
		cmp	[bp+var_10], 1FFFh
		jle	short loc_1EA59
		mov	[bp+var_10], 1FFFh
		jmp	short loc_1EA6B
; ���������������������������������������������������������������������������

loc_1EA59:				; CODE XREF: sub_1E61F+42Ej
		cmp	[bp+var_10], 0FFFFE001h
		jge	short loc_1EA6B
		mov	[bp+var_10], 0FFFFE001h

loc_1EA6B:				; CODE XREF: sub_1E61F+438j
					; sub_1E61F+442j
		mov	ax, word ptr [bp+var_4]
		mov	[si+76h], ax
		mov	ax, word ptr [bp+var_8]
		mov	[si+78h], ax
		mov	ax, word ptr [bp+var_C]
		mov	[si+7Ah], ax
		mov	ax, word ptr [bp+var_10]
		mov	[si+7Ch], ax
		pop	di
		pop	si
		leave
		retf
sub_1E61F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_UpdateViewportClip (sub_2E6CB de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,36L — compare le
; rectangle de viewport courant (+0x78-0x7E) au précédent, met à jour la zone de clipping si
; changé (sub_58B97) : mise à jour du rectangle de clipping du viewport caméra (cache si
; inchangé).
; ==============================================================================================
Camera_UpdateViewportClip	proc far		; CODE XREF: seg046:015Fp

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+76h]
		cmp	ax, [si+7Ah]
		jnz	short loc_1EA9E
		mov	ax, [si+78h]
		cmp	ax, [si+7Ch]
		jz	short loc_1EAB6

loc_1EA9E:				; CODE XREF: Camera_UpdateViewportClip+Dj
		push	word ptr [si+7Ch]
		push	word ptr [si+7Ah]
		push	word ptr [si+78h]
		push	word ptr [si+76h]
		push	word_46F44
		call	sub_42B90
		add	sp, 0Ah

loc_1EAB6:				; CODE XREF: Camera_UpdateViewportClip+15j
		pop	si
		pop	bp
		retf
Camera_UpdateViewportClip	endp

; ���������������������������������������������������������������������������

loc_1EAB9:				; DATA XREF: dseg:5904o
		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	dword ptr [bp-4], 100h
		mov	eax, [bp-4]
		mov	dword_46254, eax
		mov	dword_492D2, 0
		mov	byte_492D6, 2
		mov	byte_492D7, 0
		mov	dword_492D8, 0
		mov	dword_492DC, 0
		mov	byte_492E0, 2
		mov	byte_492E1, 0
		mov	dword_492E2, 0
		mov	word_492C6, 0
		mov	dword ptr [bp-8], 0D5h ; '�'
		mov	eax, [bp-8]
		mov	dword_46258, eax
		mov	dword_492E6, 0
		mov	byte_492EA, 2
		mov	byte_492EB, 0
		mov	dword_492EC, 0
		leave
		retf
; ���������������������������������������������������������������������������

loc_1EB3B:				; DATA XREF: dseg:59B2o
		push	bp
		mov	bp, sp
		cmp	byte_492EB, 0
		jz	short loc_1EB63
		cmp	dword_492E6, 0
		jz	short loc_1EB63
		push	0
		mov	al, byte_492EA
		push	ax
		push	62C6h
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_1EB63:				; CODE XREF: seg046:0793j seg046:079Bj
		mov	dword_492E6, 0
		mov	byte_492EB, 0
		mov	dword_492EC, 0
		push	62A6h
		call	Widget_DestructTwoLabels
		add	sp, 2
		cmp	byte_492E1, 0
		jz	short loc_1EBAA
		cmp	dword_492DC, 0
		jz	short loc_1EBAA
		push	0
		mov	al, byte_492E0
		push	ax
		push	62BCh
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_1EBAA:				; CODE XREF: seg046:07DAj seg046:07E2j
		mov	dword_492DC, 0
		mov	byte_492E1, 0
		mov	dword_492E2, 0
		cmp	byte_492D7, 0
		jz	short loc_1EBE6
		cmp	dword_492D2, 0
		jz	short loc_1EBE6
		push	0
		mov	al, byte_492D6
		push	ax
		push	62B2h
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_1EBE6:				; CODE XREF: seg046:0816j seg046:081Ej
		mov	dword_492D2, 0
		mov	byte_492D7, 0
		mov	dword_492D8, 0
		pop	bp
		retf
seg046		ends
