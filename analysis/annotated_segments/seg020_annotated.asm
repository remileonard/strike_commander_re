seg020		segment	byte public 'CODE' use16
		assume cs:seg020
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_175BC:				; DATA XREF: seg339:0BC4o
		push	bp
		mov	bp, sp
		sub	sp, 64h
		push	si
		push	di
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		les	bx, es:[bx+8]
		mov	eax, es:[bx]
		mov	[bp-4],	eax
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	di, [bx]
		cmp	byte ptr [di+95h], 0
		jz	short loc_175E9
		jmp	loc_17820
; ���������������������������������������������������������������������������

loc_175E9:				; CODE XREF: seg020:0034j
		les	bx, [bp-4]
		mov	word ptr es:[bx+2Ah], 0
		push	0
		push	word ptr [bp-2]
		push	bx
		call	Bitset_SetBit
		add	sp, 6
		cmp	word ptr [di+5Ch], 0
		jnz	short loc_17609
		jmp	loc_177DE
; ���������������������������������������������������������������������������

loc_17609:				; CODE XREF: seg020:0054j
		mov	eax, [di+71h]
		mov	[bp-8],	eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 16h
		mov	[bp-1Ah], ax
		mov	[bp-1Ch], dx
		les	bx, [bp-1Ch]
		mov	eax, es:[bx]
		mov	[bp-18h], eax
		mov	eax, [bp-8]

loc_1762F:
		mov	edx, eax
		mov	ecx, [bp-18h]

loc_17636:
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-24h], eax
		mov	eax, [bp-24h]

loc_17649:
		mov	[bp-28h], eax
		sar	eax, 8

loc_17651:
		mov	[bp-20h], eax
		cmp	dword ptr [bp-20h], 0
		jge	short loc_17664
		mov	dword ptr [bp-20h], 0

loc_17664:				; CODE XREF: seg020:00AAj
		les	bx, [bp-4]
		mov	ax, es:[bx+30h]
		dec	ax
		movsx	eax, ax
		cmp	eax, [bp-20h]
		jge	short loc_17683
		mov	ax, es:[bx+30h]
		dec	ax
		movsx	eax, ax
		mov	[bp-20h], eax

loc_17683:				; CODE XREF: seg020:00C4j
		push	word ptr [bp-20h]
		push	large dword ptr	[bp-4]
		call	Bitset_SetBit
		add	sp, 6
		mov	ax, [di+5Ch]
		mov	[bp-2Ah], ax
		mov	ax, di
		add	ax, 40h	; '@'
		mov	[bp-2Ch], ax
		les	bx, [di+91h]
		cmp	dword ptr es:[bx], 0
		jz	short loc_176D4
		push	0
		push	ax
		push	word ptr es:[bx+0Dh]
		push	word ptr [bp-2Ah]
		push	word ptr es:[bx+2]
		push	word ptr es:[bx]
		push	ss
		lea	ax, [bp-64h]
		push	ax
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 10h
		mov	dx, ss
		lea	ax, [bp-64h]
		jmp	short loc_176F1
; ���������������������������������������������������������������������������

loc_176D4:				; CODE XREF: seg020:00F9j
		mov	eax, dword_707E0
		mov	[bp-64h], eax
		mov	eax, dword_707E4
		mov	[bp-60h], eax
		mov	eax, dword_707E8
		mov	[bp-5Ch], eax
		mov	dx, ss
		lea	ax, [bp-64h]

loc_176F1:				; CODE XREF: seg020:0122j
		mov	eax, [bp-64h]
		mov	[bp-58h], eax
		mov	eax, [bp-60h]
		mov	[bp-54h], eax
		mov	eax, [bp-5Ch]
		mov	[bp-50h], eax
		lea	ax, [bp-58h]
		push	ax
		call	Vector_PrescaleBelow256_55B04
		pop	cx
		mov	eax, [bp-54h]
		cmp	eax, dword_6E9A6
		jl	short loc_17723
		mov	ax, 1
		jmp	short loc_17725
; ���������������������������������������������������������������������������

loc_17723:				; CODE XREF: seg020:016Cj
		xor	ax, ax

loc_17725:				; CODE XREF: seg020:0171j
		or	al, al
		jz	short loc_17783
		mov	di, si
		add	di, 0Ch

loc_1772E:
		push	large dword ptr	[bp-54h]
		push	large dword ptr	[di]
		push	large dword ptr	[bp-58h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax

loc_17742:
		add	sp, 0Ch
		mov	[bp-30h], eax
		mov	[bp-34h], eax

loc_1774D:
		mov	ax, [si+8]

loc_17750:
		add	ax, [bp-33h]

loc_17753:
		mov	[bp-0Ch], ax
		mov	di, si
		add	di, 10h
		push	large dword ptr	[bp-54h]
		push	large dword ptr	[di]
		push	large dword ptr	[bp-50h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-38h], eax
		mov	[bp-3Ch], eax
		mov	ax, [si+0Ah]
		sub	ax, [bp-3Bh]
		jmp	loc_17809
; ���������������������������������������������������������������������������

loc_17783:				; CODE XREF: seg020:0177j
		mov	di, si
		add	di, 0Ch
		push	large [dword_6E9A6]
		push	large dword ptr	[di]
		push	large dword ptr	[bp-58h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-40h], eax
		mov	[bp-44h], eax
		mov	ax, [si+8]
		add	ax, [bp-43h]
		mov	[bp-0Ch], ax
		mov	di, si
		add	di, 10h
		push	large [dword_6E9A6]
		push	large dword ptr	[di]
		push	large dword ptr	[bp-50h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-48h], eax
		mov	[bp-4Ch], eax
		mov	ax, [si+0Ah]
		sub	ax, [bp-4Bh]
		jmp	short loc_17809
; ���������������������������������������������������������������������������

loc_177DE:				; CODE XREF: seg020:0056j
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 0Eh
		mov	[bp-0Eh], ax
		mov	[bp-10h], dx
		les	bx, [bp-10h]
		mov	eax, es:[bx]
		mov	[bp-14h], eax
		mov	eax, [bp-14h]
		mov	[bp-8],	eax
		mov	ax, [si+8]
		mov	[bp-0Ch], ax
		mov	ax, [si+0Ah]

loc_17809:				; CODE XREF: seg020:01D0j seg020:022Cj
		mov	[bp-0Ah], ax
		push	0
		lea	ax, [bp-0Ch]
		push	ax
		push	large dword ptr	[bp+6]
		call	UI_NotifyChildrenMove
		add	sp, 8
		jmp	short loc_17829
; ���������������������������������������������������������������������������

loc_17820:				; CODE XREF: seg020:0036j
		les	bx, [bp-4]
		mov	word ptr es:[bx+2Ah], 0

loc_17829:				; CODE XREF: seg020:026Ej
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1782D:				; DATA XREF: seg339:0BB4o
		push	bp
		mov	bp, sp
		sub	sp, 8

loc_17833:
		push	si
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	dl, [bx+95h]
		mov	bx, [bp+6]

loc_17844:
		les	bx, es:[bx+8]
		mov	eax, es:[bx]
		mov	[bp-4],	eax
		or	dl, dl

loc_17852:
		jz	short loc_17861
		cmp	dl, 1
		jz	short loc_17861
		cmp	dl, 2
		jz	short loc_17861
		jmp	loc_17938
; ���������������������������������������������������������������������������

loc_17861:				; CODE XREF: seg020:loc_17852j
					; seg020:02A7j	...
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		cmp	word ptr [bx+5Ch], 0
		jnz	short loc_17873
		jmp	loc_17938
; ���������������������������������������������������������������������������

loc_17873:				; CODE XREF: seg020:02BEj
		les	bx, [bp-4]
		mov	word ptr es:[bx+2Ah], 0
		lea	ax, [bp-8]
		push	ax
		mov	ax, [bp+6]
		add	ax, 1Ah
		push	word ptr [bp+8]
		push	ax
		mov	ax, [bp+6]
		add	ax, 16h
		push	word ptr [bp+8]
		push	ax
		mov	ax, [bp+6]
		add	ax, 12h
		push	word ptr [bp+8]
		push	ax
		mov	ax, [bp+6]
		add	ax, 0Eh
		push	word ptr [bp+8]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx]
		add	ax, 85h	; '�'
		push	ax
		mov	bx, [bp+6]
		mov	ax, es:[bx+2]
		add	ax, 0Dh
		push	ax
		push	word ptr es:[bx+2]
		call	UI_RectIntersectTest
		add	sp, 18h
		or	al, al
		jz	short loc_178F2
		push	2
		push	large dword ptr	[bp-4]
		call	Bitset_SetBit
		add	sp, 6
		push	0
		lea	ax, [bp-8]
		push	ax
		push	large dword ptr	[bp+6]
		call	UI_NotifyChildrenMove
		add	sp, 8
		jmp	short loc_17941
; ���������������������������������������������������������������������������

loc_178F2:				; CODE XREF: seg020:031Ej
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	si, [bx+5Ch]
		cmp	byte ptr [si+50h], 1
		jnz	short loc_17908
		push	0
		jmp	short loc_1790A
; ���������������������������������������������������������������������������

loc_17908:				; CODE XREF: seg020:0352j
		push	1

loc_1790A:				; CODE XREF: seg020:0356j
		push	large dword ptr	[bp-4]
		call	Bitset_SetBit
		add	sp, 6
		push	0
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx]
		add	ax, 85h	; '�'
		push	ax
		push	large dword ptr	[bp+6]
		call	UI_NotifyChildrenMove
		add	sp, 8

loc_17931:
		mov	byte_70478, 0
		jmp	short loc_17941
; ���������������������������������������������������������������������������

loc_17938:				; CODE XREF: seg020:02AEj seg020:02C0j
		les	bx, [bp-4]

loc_1793B:
		mov	word ptr es:[bx+2Ah], 0

loc_17941:				; CODE XREF: seg020:0340j seg020:0386j
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,118L — teste si un point (di) sort des limites d'une zone de défilement (+0x1E-0x24),
; ajuste les indicateurs de bord atteint (+0x1B/0x1C) et recalcule l'offset de scroll pour
; garder le point visible avec une marge (+0x10) : gestionnaire de défilement/cadrage de vue
; (carte de mission ou radar défilant).
; ==============================================================================================
UI_ScrollClamp	proc far		; CODE XREF: seg020:057Ap

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	di, [bp+arg_8]
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+20h]
		cmp	ax, [di+2]
		jl	short loc_17962
		mov	byte ptr es:[bx+1Bh], 0
		jmp	short loc_17973
; ���������������������������������������������������������������������������

loc_17962:				; CODE XREF: UI_ScrollClamp+15j
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+24h]
		cmp	ax, [di+2]
		jg	short loc_17973
		mov	byte ptr es:[bx+1Bh], 1

loc_17973:				; CODE XREF: UI_ScrollClamp+1Cj
					; UI_ScrollClamp+28j
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+1Eh]
		cmp	ax, [di]
		jl	short loc_17985
		mov	byte ptr es:[bx+1Ch], 1
		jmp	short loc_17995
; ���������������������������������������������������������������������������

loc_17985:				; CODE XREF: UI_ScrollClamp+38j
		les	bx, [bp+arg_4]
		mov	ax, es:[bx+22h]
		cmp	ax, [di]
		jg	short loc_17995
		mov	byte ptr es:[bx+1Ch], 0

loc_17995:				; CODE XREF: UI_ScrollClamp+3Fj
					; UI_ScrollClamp+4Aj
		les	bx, [bp+arg_4]
		cmp	byte ptr es:[bx+1Bh], 0
		jz	short loc_179A8
		mov	ax, [di+2]
		sub	ax, es:[bx+10h]
		jmp	short loc_179B2
; ���������������������������������������������������������������������������

loc_179A8:				; CODE XREF: UI_ScrollClamp+59j
		les	bx, [bp+arg_4]
		mov	ax, [di+2]
		add	ax, es:[bx+10h]

loc_179B2:				; CODE XREF: UI_ScrollClamp+62j
		mov	[bp+var_2], ax
		les	bx, [bp+arg_4]
		cmp	byte ptr es:[bx+1Ch], 0
		jz	short loc_179CB
		mov	ax, [di]
		add	ax, es:[bx+22h]
		sub	ax, es:[bx+1Eh]
		jmp	short loc_179D8
; ���������������������������������������������������������������������������

loc_179CB:				; CODE XREF: UI_ScrollClamp+79j
		les	bx, [bp+arg_4]
		mov	ax, [di]
		add	ax, es:[bx+1Eh]
		sub	ax, es:[bx+22h]

loc_179D8:				; CODE XREF: UI_ScrollClamp+85j
		mov	[bp+var_4], ax
		lea	ax, [bp+var_4]
		push	ax
		mov	ax, word ptr [bp+arg_4]
		add	ax, 22h	; '"'
		push	word ptr [bp+arg_4+2]
		push	ax
		mov	ax, word ptr [bp+arg_4]
		add	ax, 1Eh
		push	word ptr [bp+arg_4+2]
		push	ax
		mov	ax, word ptr [bp+arg_4]
		add	ax, 22h	; '"'
		push	word ptr [bp+arg_4+2]
		push	ax
		mov	ax, word ptr [bp+arg_4]
		add	ax, 1Eh
		push	word ptr [bp+arg_4+2]
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		push	di
		les	bx, [bp+arg_4]
		push	word ptr es:[bx+2]
		call	UI_RectIntersectTest
		add	sp, 18h
		mov	bx, [bp+arg_0]
		mov	ax, [bp+var_4]
		mov	[bx], ax
		mov	ax, [bp+var_2]
		mov	[bx+2],	ax
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		pop	di
		pop	si
		leave
		retf
UI_ScrollClamp	endp

; ���������������������������������������������������������������������������

loc_17A33:				; DATA XREF: seg339:0BA4o
		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		push	si
		mov	ax, [bp+8]
		mov	dx, [bp+6]

loc_17A40:
		add	dx, 12h

loc_17A43:
		mov	[bp-6],	ax

loc_17A46:
		mov	[bp-8],	dx

loc_17A49:
		les	bx, [bp-8]
		mov	ax, es:[bx]

loc_17A4F:
		mov	[bp-4],	ax

loc_17A52:
		mov	ax, es:[bx+2]
		mov	[bp-2],	ax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 16h
		mov	[bp-0Eh], ax
		mov	[bp-10h], dx
		les	bx, [bp-10h]
		mov	ax, es:[bx]
		mov	[bp-0Ch], ax
		mov	ax, es:[bx+2]
		mov	[bp-0Ah], ax
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	al, [bx+95h]
		mov	[bp-12h], al
		mov	bx, [bp+6]
		les	bx, es:[bx+8]
		mov	eax, es:[bx]
		mov	[bp-16h], eax
		les	bx, [bp-16h]
		mov	word ptr es:[bx+2Ah], 0
		cmp	byte ptr [bp-12h], 1
		jz	short loc_17AA9
		jmp	loc_17D52
; ���������������������������������������������������������������������������

loc_17AA9:				; CODE XREF: seg020:04F4j
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		cmp	word ptr [bx+8Fh], 0
		jg	short loc_17ABC
		jmp	loc_17D52
; ���������������������������������������������������������������������������

loc_17ABC:				; CODE XREF: seg020:0507j
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	si, [bx+5Ch]
		mov	bx, [bp+6]
		cmp	byte ptr es:[bx+1Ah], 0
		jnz	short loc_17AD5
		jmp	loc_17D4A
; ���������������������������������������������������������������������������

loc_17AD5:				; CODE XREF: seg020:0520j
		push	0
		push	large dword ptr	[bp-16h]
		call	Bitset_SetBit
		add	sp, 6
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	al, [bx+96h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_17AFA
		or	si, si
		jnz	short loc_17B3B

loc_17AFA:				; CODE XREF: seg020:0544j
		les	bx, [bp+6]
		mov	al, es:[bx+1Dh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_17B14
		cmp	ax, 2
		jz	short loc_17B14
		cmp	ax, 4
		jz	short loc_17B14
		jmp	loc_17BBF
; ���������������������������������������������������������������������������

loc_17B14:				; CODE XREF: seg020:0555j seg020:055Aj ...
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Dh], 1
		lea	ax, [bp-0Ch]
		push	ax
		push	word ptr [bp+8]
		push	bx
		push	ss
		lea	ax, [bp-22h]
		push	ax
		push	cs
		call	near ptr UI_ScrollClamp
		add	sp, 0Ah
		mov	eax, [bp-22h]

loc_17B34:				; CODE XREF: seg020:05DAj
		mov	[bp-4],	eax
		jmp	loc_17BBF
; ���������������������������������������������������������������������������

loc_17B3B:				; CODE XREF: seg020:0548j
		les	bx, [bp+6]

loc_17B3E:
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		cmp	[bx+5Eh], si
		jz	short loc_17B69
		mov	bx, [bp+6]
		mov	byte ptr es:[bx+1Dh], 1
		mov	[bp-24h], si
		push	word ptr [bp-24h]
		mov	bx, es:[bx+2]
		mov	ax, [bx]
		add	ax, 5Eh	; '^'
		push	ax
		call	SetReference16
		add	sp, 4

loc_17B69:				; CODE XREF: seg020:0597j
		les	bx, [bp+6]
		mov	al, es:[bx+1Dh]
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_17B8C
		cmp	ax, 4
		jz	short loc_17BA8
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	eax, [bx+85h]
		jmp	short loc_17B34
; ���������������������������������������������������������������������������

loc_17B8C:				; CODE XREF: seg020:05C5j
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	eax, [bx+85h]
		mov	[bp-4],	eax
		mov	bx, [bp+6]
		mov	byte ptr es:[bx+1Dh], 4
		jmp	short loc_17BBF
; ���������������������������������������������������������������������������

loc_17BA8:				; CODE XREF: seg020:05CAj
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Ah], 0
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	eax, [bx+85h]
		mov	[bp-0Ch], eax

loc_17BBF:				; CODE XREF: seg020:0561j seg020:0588j ...
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+1Dh], 2
		jnz	short loc_17BCC
		jmp	loc_17D36
; ���������������������������������������������������������������������������

loc_17BCC:				; CODE XREF: seg020:0617j
		cmp	byte ptr es:[bx+1Dh], 4
		jnz	short loc_17BD6
		jmp	loc_17D36
; ���������������������������������������������������������������������������

loc_17BD6:				; CODE XREF: seg020:0621j
		mov	ax, [bp-4]
		sub	ax, [bp-0Ch]
		mov	[bp-2Eh], ax
		movsx	eax, word ptr [bp-2Eh]
		shl	eax, 8
		mov	[bp-32h], eax
		mov	eax, [bp-32h]
		mov	[bp-28h], eax
		mov	ax, [bp-2]
		sub	ax, [bp-0Ah]
		mov	[bp-34h], ax
		movsx	eax, word ptr [bp-34h]
		shl	eax, 8
		mov	[bp-38h], eax
		mov	eax, [bp-38h]
		mov	[bp-2Ch], eax
		cmp	dword ptr [bp-28h], 0
		jnz	short loc_17C1E
		mov	ax, 1
		jmp	short loc_17C20
; ���������������������������������������������������������������������������

loc_17C1E:				; CODE XREF: seg020:0667j
		xor	ax, ax

loc_17C20:				; CODE XREF: seg020:066Cj
		or	al, al
		jz	short loc_17C41
		cmp	dword ptr [bp-2Ch], 0
		jnz	short loc_17C30
		mov	ax, 1
		jmp	short loc_17C32
; ���������������������������������������������������������������������������

loc_17C30:				; CODE XREF: seg020:0679j
		xor	ax, ax

loc_17C32:				; CODE XREF: seg020:067Ej
		or	al, al
		jz	short loc_17C41

loc_17C36:
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Dh], 2
		jmp	loc_17D36
; ���������������������������������������������������������������������������

loc_17C41:				; CODE XREF: seg020:0672j seg020:0684j
		mov	dword ptr [bp-40h], 0
		lea	ax, [bp-40h]
		push	ax
		lea	ax, [bp-2Ch]
		push	ax

loc_17C51:
		lea	ax, [bp-28h]

loc_17C54:
		push	ax
		push	ss
		lea	ax, [bp-3Ch]
		push	ax
		call	Math_VectorLength_Wrapper_54C77
		add	sp, 0Ah
		les	bx, [bp+6]
		mov	ax, es:[bx+0Eh]
		mov	[bp-46h], ax
		movsx	eax, word ptr [bp-46h]
		mov	edx, dword_70458
		imul	edx, eax
		mov	[bp-4Ah], edx
		mov	eax, [bp-4Ah]
		mov	[bp-44h], eax
		mov	eax, [bp-3Ch]
		cmp	eax, [bp-44h]
		jg	short loc_17C95
		mov	ax, 1
		jmp	short loc_17C97
; ���������������������������������������������������������������������������

loc_17C95:				; CODE XREF: seg020:06DEj
		xor	ax, ax

loc_17C97:				; CODE XREF: seg020:06E3j
		or	al, al
		jz	short loc_17CAE
		les	bx, [bp+6]
		mov	byte ptr es:[bx+1Dh], 2
		mov	eax, [bp-4]
		mov	[bp-0Ch], eax
		jmp	loc_17D36
; ���������������������������������������������������������������������������

loc_17CAE:				; CODE XREF: seg020:06E9j
		mov	eax, [bp-28h]
		mov	edx, [bp-44h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-4Eh], eax
		mov	eax, [bp-4Eh]
		mov	[bp-52h], eax
		mov	eax, [bp-52h]
		mov	edx, eax
		mov	ecx, [bp-3Ch]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-56h], eax
		mov	eax, [bp-56h]
		mov	[bp-5Ah], eax
		mov	ax, [bp-59h]
		add	[bp-0Ch], ax
		mov	eax, [bp-2Ch]
		mov	edx, [bp-44h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-5Eh], eax
		mov	eax, [bp-5Eh]
		mov	[bp-62h], eax
		mov	eax, [bp-62h]
		mov	edx, eax
		mov	ecx, [bp-3Ch]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-66h], eax
		mov	eax, [bp-66h]
		mov	[bp-6Ah], eax
		mov	ax, [bp-69h]
		add	[bp-0Ah], ax

loc_17D36:				; CODE XREF: seg020:0619j seg020:0623j ...
		push	0
		lea	ax, [bp-0Ch]
		push	ax

loc_17D3C:
		push	large dword ptr	[bp+6]

loc_17D40:
		call	UI_NotifyChildrenMove

loc_17D45:
		add	sp, 8

loc_17D48:
		jmp	short loc_17D52
; ���������������������������������������������������������������������������

loc_17D4A:				; CODE XREF: seg020:0522j
		les	bx, [bp+6]

loc_17D4D:
		mov	byte ptr es:[bx+1Ah], 1

loc_17D52:				; CODE XREF: seg020:04F6j seg020:0509j ...
		les	bx, [bp+6]
		mov	ax, es:[bx+20h]
		add	ax, 0FFF1h
		cmp	ax, [bp-0Ah]
		jle	short loc_17D6A
		mov	ax, es:[bx+20h]
		add	ax, 0FFF1h
		jmp	short loc_17D80
; ���������������������������������������������������������������������������

loc_17D6A:				; CODE XREF: seg020:07AFj
		les	bx, [bp+6]
		mov	ax, es:[bx+24h]
		add	ax, 0Fh
		cmp	ax, [bp-0Ah]
		jge	short loc_17D83
		mov	ax, es:[bx+24h]
		add	ax, 0Fh

loc_17D80:				; CODE XREF: seg020:07B8j
		mov	[bp-0Ah], ax

loc_17D83:				; CODE XREF: seg020:07C7j
		les	bx, [bp+6]
		mov	ax, es:[bx+1Eh]
		add	ax, 0FFF1h
		cmp	ax, [bp-0Ch]
		jle	short loc_17D9B
		mov	ax, es:[bx+1Eh]
		add	ax, 0FFF1h
		jmp	short loc_17DB1
; ���������������������������������������������������������������������������

loc_17D9B:				; CODE XREF: seg020:07E0j
		les	bx, [bp+6]
		mov	ax, es:[bx+22h]
		add	ax, 0Fh
		cmp	ax, [bp-0Ch]
		jge	short loc_17DB4
		mov	ax, es:[bx+22h]
		add	ax, 0Fh

loc_17DB1:				; CODE XREF: seg020:07E9j
		mov	[bp-0Ch], ax

loc_17DB4:				; CODE XREF: seg020:07F8j
		mov	ax, [bp-4]
		mov	[bp-1Ah], ax
		mov	ax, [bp-2]
		mov	[bp-18h], ax
		mov	eax, [bp-1Ah]
		les	bx, [bp+6]
		mov	es:[bx+12h], eax
		mov	ax, [bp-0Ch]
		mov	[bp-1Eh], ax
		mov	ax, [bp-0Ah]
		mov	[bp-1Ch], ax
		mov	eax, [bp-1Eh]
		mov	es:[bx+16h], eax
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_17DE4:				; DATA XREF: seg339:0B94o
		push	bp
		mov	bp, sp
		sub	sp, 0DEh
		push	si
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 10h
		mov	[bp-6],	ax
		mov	[bp-8],	dx
		les	bx, [bp-8]
		mov	eax, es:[bx]
		mov	[bp-4],	eax
		les	bx, [bp+6]
		mov	ax, es:[bx+15h]
		mov	[bp-16h], ax
		movsx	eax, word ptr [bp-16h]
		shl	eax, 8
		mov	[bp-14h], eax
		mov	bx, es:[bx+2]
		mov	eax, [bx+0Dh]
		mov	[bp-1Ah], eax
		mov	bx, [bp+6]
		mov	byte ptr es:[bx+14h], 0
		mov	bx, es:[bx+2]
		mov	bx, [bx]

loc_17E37:
		mov	cl, [bx+95h]

loc_17E3B:
		cmp	cl, 1
		jz	short loc_17E48

loc_17E40:
		cmp	cl, 2
		jz	short loc_17E48
		jmp	loc_182BA
; ���������������������������������������������������������������������������

loc_17E48:				; CODE XREF: seg020:088Ej seg020:0893j
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	si, [bx+5Ch]
		or	si, si
		jnz	short loc_17E5B
		jmp	loc_182BA
; ���������������������������������������������������������������������������

loc_17E5B:				; CODE XREF: seg020:08A6j
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	eax, [bx+61h]
		neg	eax
		mov	[bp-0D2h], eax
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	eax, [bx+65h]
		neg	eax
		mov	[bp-0CEh], eax
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	eax, [bx+69h]
		neg	eax
		mov	[bp-0CAh], eax
		mov	eax, [bp-0D2h]
		mov	[bp-0C6h], eax
		mov	eax, [bp-0CEh]
		mov	[bp-0C2h], eax
		mov	eax, [bp-0CAh]
		mov	[bp-0BEh], eax
		push	si
		push	ss
		lea	ax, [bp-0DEh]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		lea	ax, [bp-0DEh]
		push	ax
		lea	ax, [bp-0C6h]
		push	ax
		push	ss
		lea	ax, [bp-1Eh]
		push	ax
		call	Targeting_ComputeBearingElevation_55B1A
		add	sp, 8
		mov	eax, [bp-1Eh]
		mov	[bp-4],	eax
		lea	ax, [bp-0C6h]
		push	ax
		push	ss
		lea	ax, [bp-24h]
		push	ax
		call	Math_HeadingAngle_553CF
		add	sp, 6
		mov	ax, [bp-23h]
		mov	[bp-20h], ax
		lea	ax, [bp-0DEh]
		push	ax
		push	ss
		lea	ax, [bp-2Ah]
		push	ax
		call	Math_HeadingAngle_553CF
		add	sp, 6
		mov	ax, [bp-29h]
		mov	[bp-26h], ax
		mov	bx, [bp-26h]
		sub	bx, [bp-20h]
		or	bx, bx
		jge	short loc_17F24
		add	bx, 168h

loc_17F24:				; CODE XREF: seg020:096Ej
		cmp	bx, 0B4h ; '�'
		jge	short loc_17F3D
		mov	eax, [bp-4]
		neg	eax

loc_17F31:
		mov	[bp-2Eh], eax
		mov	[bp-32h], eax
		mov	[bp-4],	eax

loc_17F3D:				; CODE XREF: seg020:0978j
		mov	eax, 0B400h

loc_17F43:
		sub	eax, [bp-4]
		mov	[bp-36h], eax
		mov	[bp-3Ah], eax
		mov	[bp-4],	eax

loc_17F53:
		mov	dword ptr [bp-3Eh], 2300h
		add	eax, [bp-3Eh]
		mov	[bp-0Ch], eax
		mov	dword ptr [bp-42h], 2300h
		mov	eax, [bp-4]
		sub	eax, [bp-42h]
		mov	[bp-10h], eax
		les	bx, [bp+6]
		movsx	eax, word ptr es:[bx+0Eh]
		mov	[bp-4Eh], eax
		mov	dword ptr [bp-52h], 0
		mov	eax, [bp-52h]
		mov	[bp-4Ah], eax
		mov	eax, [bp-4Eh]
		shl	eax, 8
		mov	[bp-56h], eax
		mov	eax, [bp-56h]
		mov	[bp-46h], eax
		lea	si, [bp-4Ah]
		mov	eax, [si]
		mov	[bp-5Ah], eax
		mov	eax, [bp-4]
		mov	[bp-5Eh], eax
		mov	[bp-62h], eax
		push	eax
		call	Math_SinRaw_58063
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp-62h], eax
		push	large dword ptr	[bp-5Eh]
		call	Math_CosRaw_580A7
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp-5Eh], eax
		mov	eax, [bp-4Ah]
		mov	edx, [bp-5Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-4Ah], eax
		push	large dword ptr	[bp-62h]
		push	large dword ptr	[bp-46h]
		call	Math_FixedMultiply_58034
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		add	[bp-4Ah], eax
		mov	eax, [bp-46h]
		mov	edx, [bp-5Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-46h], eax
		push	large dword ptr	[bp-62h]
		push	large dword ptr	[bp-5Ah]
		call	Math_FixedMultiply_58034
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		sub	[bp-46h], eax
		mov	eax, [bp-46h]

loc_18040:
		mov	edx, dword_6E9AA

loc_18045:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-46h], eax
		lea	ax, [bp-4]
		push	ax
		push	ss
		lea	ax, [bp-66h]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6
		mov	eax, [bp-66h]
		add	[bp-4Ah], eax
		mov	ax, [bp-49h]
		mov	[bp-68h], ax
		mov	ax, [bp-45h]
		mov	[bp-6Ah], ax
		mov	ax, [bp-68h]
		mov	[bp-6Eh], ax
		mov	ax, [bp-6Ah]
		mov	[bp-6Ch], ax
		mov	ax, [bp-6Eh]
		mov	[bp-72h], ax
		mov	ax, [bp-6Ch]
		mov	[bp-70h], ax
		mov	eax, [bp-72h]
		les	bx, [bp+6]
		mov	es:[bx+17h], eax
		mov	byte ptr es:[bx+14h], 1
		lea	ax, [bp-10h]
		push	ax
		push	ss
		lea	ax, [bp-7Eh]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6
		mov	eax, [bp-7Eh]
		mov	[bp-7Ah], eax
		lea	ax, [bp-10h]
		push	ax
		push	ss
		lea	ax, [bp-82h]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	eax, [bp-82h]
		mov	[bp-76h], eax
		mov	eax, [bp-7Ah]
		mov	edx, [bp-14h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-7Ah], eax
		mov	eax, [bp-76h]
		mov	edx, [bp-14h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-76h], eax
		mov	eax, [bp-76h]
		mov	edx, dword_6E9AA
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-76h], eax
		les	bx, [bp+6]
		mov	ax, es:[bx+17h]
		add	ax, [bp-79h]
		mov	es:[bx+1Bh], ax
		mov	ax, es:[bx+19h]
		add	ax, [bp-75h]
		mov	es:[bx+1Dh], ax
		lea	ax, [bp-0Ch]
		push	ax
		push	ss
		lea	ax, [bp-86h]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6
		mov	eax, [bp-86h]
		mov	[bp-7Ah], eax

loc_18144:
		lea	ax, [bp-0Ch]
		push	ax
		push	ss
		lea	ax, [bp-8Ah]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		mov	eax, [bp-8Ah]
		mov	[bp-76h], eax
		mov	eax, [bp-7Ah]
		mov	edx, [bp-14h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-7Ah], eax
		mov	eax, [bp-76h]
		mov	edx, [bp-14h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-76h], eax
		mov	eax, [bp-76h]
		mov	edx, dword_6E9AA
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-76h], eax
		les	bx, [bp+6]
		mov	ax, es:[bx+17h]
		add	ax, [bp-79h]
		mov	es:[bx+1Fh], ax
		mov	ax, es:[bx+19h]
		add	ax, [bp-75h]
		mov	es:[bx+21h], ax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 17h
		mov	[bp-98h], ax
		mov	[bp-9Ah], dx
		les	bx, [bp-9Ah]
		mov	ax, es:[bx]
		mov	[bp-9Eh], ax
		mov	ax, es:[bx+2]
		mov	[bp-9Ch], ax
		mov	eax, [bp-9Eh]
		mov	[bp-8Eh], eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 1Bh
		mov	[bp-0A0h], ax
		mov	[bp-0A2h], dx
		les	bx, [bp-0A2h]
		mov	ax, es:[bx]
		mov	[bp-0A6h], ax
		mov	ax, es:[bx+2]
		mov	[bp-0A4h], ax
		mov	eax, [bp-0A6h]
		mov	[bp-92h], eax
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 1Fh
		mov	[bp-0A8h], ax
		mov	[bp-0AAh], dx
		les	bx, [bp-0AAh]
		mov	ax, es:[bx]
		mov	[bp-0AEh], ax
		mov	ax, es:[bx+2]

loc_18231:
		mov	[bp-0ACh], ax

loc_18235:
		mov	eax, [bp-0AEh]
		mov	[bp-96h], eax

loc_1823F:
		mov	ax, [bp-1Ah]

loc_18242:
		add	[bp-8Eh], ax
		mov	ax, [bp-18h]
		add	[bp-8Ch], ax
		mov	ax, [bp-1Ah]
		add	[bp-92h], ax
		mov	ax, [bp-18h]
		add	[bp-90h], ax
		mov	ax, [bp-1Ah]
		add	[bp-96h], ax
		mov	ax, [bp-18h]
		add	[bp-94h], ax
		mov	ax, [bp-8Eh]
		mov	[bp-0B2h], ax
		mov	ax, [bp-8Ch]
		mov	[bp-0B0h], ax
		mov	eax, [bp-0B2h]
		les	bx, [bp+6]
		mov	es:[bx+17h], eax
		mov	ax, [bp-92h]
		mov	[bp-0B6h], ax
		mov	ax, [bp-90h]
		mov	[bp-0B4h], ax
		mov	eax, [bp-0B6h]
		mov	es:[bx+1Bh], eax
		mov	ax, [bp-96h]
		mov	[bp-0BAh], ax
		mov	ax, [bp-94h]
		mov	[bp-0B8h], ax
		mov	eax, [bp-0BAh]
		mov	es:[bx+1Fh], eax

loc_182BA:				; CODE XREF: seg020:0895j seg020:08A8j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_182BD:				; DATA XREF: seg339:0B98o
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+14h], 0
		jnz	short loc_182D0
		jmp	locret_1839B
; ���������������������������������������������������������������������������

loc_182D0:				; CODE XREF: seg020:0D1Bj
		push	word ptr [bp+8]
		push	bx
		call	UI_NotifyRefresh
		add	sp, 4
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	al, [bx+2Bh]
		push	ax
		mov	bx, [bp+6]
		mov	ax, es:[bx+0Eh]
		mov	[bp-2],	ax
		movsx	eax, word ptr [bp-2]
		mov	edx, dword_6E9AA
		imul	edx, eax
		mov	[bp-6],	edx
		mov	eax, [bp-6]
		mov	[bp-0Ah], eax
		push	word ptr [bp-9]
		push	word ptr es:[bx+0Eh]
		mov	bx, es:[bx+2]
		push	word ptr [bx+0Fh]
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		push	word ptr [bx+0Dh]
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx+2]
		add	ax, 2
		push	ax

loc_18331:
		call	Render_DrawEllipseOutline_61612
		add	sp, 0Ch
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	al, [bx+2Bh]
		push	ax
		mov	bx, [bp+6]
		push	word ptr es:[bx+1Dh]
		push	word ptr es:[bx+1Bh]
		push	word ptr es:[bx+19h]
		push	word ptr es:[bx+17h]
		mov	bx, es:[bx+2]
		mov	ax, [bx+2]
		add	ax, 2
		push	ax
		call	Render_FillClippedRect_61960
		add	sp, 0Ch
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	al, [bx+2Bh]
		push	ax
		mov	bx, [bp+6]
		push	word ptr es:[bx+21h]
		push	word ptr es:[bx+1Fh]
		push	word ptr es:[bx+19h]
		push	word ptr es:[bx+17h]
		mov	bx, es:[bx+2]
		mov	ax, [bx+2]

loc_1838F:
		add	ax, 2
		push	ax
		call	Render_FillClippedRect_61960
		add	sp, 0Ch

locret_1839B:				; CODE XREF: seg020:0D1Dj
		leave
		retf
seg020		ends
