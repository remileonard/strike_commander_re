seg021		segment	byte public 'CODE' use16
		assume cs:seg021
		;org 0Dh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_1839D:				; DATA XREF: seg339:0B84o
		push	bp
		mov	bp, sp
		sub	sp, 42h
		push	si
		push	di
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]

loc_183B1:
		mov	al, [bx+95h]

loc_183B5:
		mov	[bp-2],	al
		mov	bx, [bp+6]

loc_183BB:
		les	bx, es:[bx+8]

loc_183BF:
		mov	eax, es:[bx]

loc_183C3:
		mov	[bp-6],	eax

loc_183C7:
		cmp	byte ptr [bp-2], 4
		jz	short loc_183D0
		jmp	loc_185BE
; ���������������������������������������������������������������������������

loc_183D0:				; CODE XREF: seg021:003Bj
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	di, [bx]
		add	di, 40h	; '@'
		mov	eax, [di]
		mov	[bp-0Eh], eax
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		les	bx, [bx+91h]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_18448
		push	0
		lea	ax, [bp-0Eh]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		les	bx, [bx+91h]
		push	word ptr es:[bx+0Dh]
		push	0
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		les	bx, [bx+91h]
		push	large dword ptr	es:[bx]
		push	ss
		lea	ax, [bp-42h]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]

loc_18431:
		les	bx, [bx+91h]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 10h
		mov	dx, ss

loc_18443:
		lea	ax, [bp-42h]
		jmp	short loc_18465
; ���������������������������������������������������������������������������

loc_18448:				; CODE XREF: seg021:0067j
		mov	eax, dword_707E0
		mov	[bp-42h], eax
		mov	eax, dword_707E4
		mov	[bp-3Eh], eax
		mov	eax, dword_707E8
		mov	[bp-3Ah], eax
		mov	dx, ss
		lea	ax, [bp-42h]

loc_18465:				; CODE XREF: seg021:00B6j
		mov	eax, [bp-42h]
		or	eax, [bp-3Eh]
		or	eax, [bp-3Ah]
		jnz	short loc_18478
		mov	ax, 1
		jmp	short loc_1847A
; ���������������������������������������������������������������������������

loc_18478:				; CODE XREF: seg021:00E1j
		xor	ax, ax

loc_1847A:				; CODE XREF: seg021:00E6j
		or	al, al
		jz	short loc_18481
		jmp	loc_185BE
; ���������������������������������������������������������������������������

loc_18481:				; CODE XREF: seg021:00ECj
		lea	ax, [bp-42h]
		push	ax
		call	Vector_PrescaleBelow256_55B04
		pop	cx
		mov	eax, [bp-3Eh]
		cmp	eax, dword_6E9A6
		jl	short loc_1849B
		mov	ax, 1
		jmp	short loc_1849D
; ���������������������������������������������������������������������������

loc_1849B:				; CODE XREF: seg021:0104j
		xor	ax, ax

loc_1849D:				; CODE XREF: seg021:0109j
		or	al, al
		jz	short loc_184FA
		mov	di, si
		add	di, 0Ch
		push	large dword ptr	[bp-3Eh]
		push	large dword ptr	[di]
		push	large dword ptr	[bp-42h]
		call	Math_FixedMulDiv_5804C
		push	dx

loc_184B7:
		push	ax
		pop	eax
		add	sp, 0Ch

loc_184BD:
		mov	[bp-12h], eax
		mov	[bp-16h], eax
		mov	ax, [si+8]
		add	ax, [bp-15h]
		mov	[bp-0Ah], ax
		mov	di, si
		add	di, 10h
		push	large dword ptr	[bp-3Eh]
		push	large dword ptr	[di]
		push	large dword ptr	[bp-3Ah]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-1Ah], eax
		mov	[bp-1Eh], eax
		mov	ax, [si+0Ah]
		sub	ax, [bp-1Dh]
		jmp	short loc_18553
; ���������������������������������������������������������������������������

loc_184FA:				; CODE XREF: seg021:010Fj
		mov	di, si
		add	di, 0Ch
		push	large [dword_6E9A6]
		push	large dword ptr	[di]
		push	large dword ptr	[bp-42h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-22h], eax
		mov	[bp-26h], eax
		mov	ax, [si+8]
		add	ax, [bp-25h]
		mov	[bp-0Ah], ax
		mov	di, si
		add	di, 10h
		push	large [dword_6E9A6]

loc_18532:
		push	large dword ptr	[di]

loc_18535:
		push	large dword ptr	[bp-3Ah]
		call	Math_FixedMulDiv_5804C

loc_1853E:
		push	dx
		push	ax
		pop	eax

loc_18542:
		add	sp, 0Ch
		mov	[bp-2Ah], eax
		mov	[bp-2Eh], eax
		mov	ax, [si+0Ah]
		sub	ax, [bp-2Dh]

loc_18553:				; CODE XREF: seg021:0168j
		mov	[bp-8],	ax
		push	0
		push	large dword ptr	[bp-6]
		call	Bitset_SetBit
		add	sp, 6
		push	0
		lea	ax, [bp-0Ah]
		push	ax
		les	bx, [bp+6]
		les	bx, es:[bx+8]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 8
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	si, [bx]
		add	si, 50h	; 'P'
		mov	ax, [si]
		mov	[bp-32h], ax
		mov	ax, [si+2]
		mov	[bp-30h], ax
		mov	eax, [bp-32h]
		mov	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	es:[bx+6], eax
		mov	ax, [bp-0Ah]
		mov	[bp-36h], ax
		mov	ax, [bp-8]
		mov	[bp-34h], ax

loc_185B3:
		mov	eax, [bp-36h]
		mov	es:[bx+22h], eax

loc_185BC:
		jmp	short loc_185C7
; ���������������������������������������������������������������������������

loc_185BE:				; CODE XREF: seg021:003Dj seg021:00EEj
		les	bx, [bp-6]
		mov	word ptr es:[bx+2Ah], 0

loc_185C7:				; CODE XREF: seg021:loc_185BCj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_185CB:				; DATA XREF: seg339:0B88o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		cmp	byte ptr [bx+95h], 4
		jnz	short loc_185EA
		push	large dword ptr	[bp+6]
		call	UI_NotifyRefresh
		add	sp, 4

loc_185EA:				; CODE XREF: seg021:024Cj
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_185EC:				; DATA XREF: seg339:0B74o
		push	bp
		mov	bp, sp
		sub	sp, 110h
		push	si
		push	di
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	al, [bx+95h]
		mov	[bp-2],	al
		mov	bx, [bp+6]
		les	bx, es:[bx+8]
		mov	eax, es:[bx]
		mov	[bp-6],	eax
		cmp	byte ptr [bp-2], 5
		jz	short loc_18620
		jmp	loc_18DF7
; ���������������������������������������������������������������������������

loc_18620:				; CODE XREF: seg021:028Bj
		les	bx, [bp+6]

loc_18623:
		mov	bx, es:[bx+2]
		mov	di, [bx]
		add	di, 40h	; '@'

loc_1862C:
		mov	eax, [di]

loc_1862F:
		mov	[bp-0Eh], eax

loc_18633:
		mov	bx, [bp+6]

loc_18636:
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	di, [bx+2]
		les	bx, [di+5Ah]
		mov	al, es:[bx+44h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1864F
		jmp	loc_186F7
; ���������������������������������������������������������������������������

loc_1864F:				; CODE XREF: seg021:02BAj
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		les	bx, [bx+91h]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_186B6
		push	4
		lea	ax, [bp-0Eh]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		les	bx, [bx+91h]
		push	word ptr es:[bx+0Dh]
		push	0
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		les	bx, [bx+91h]
		push	large dword ptr	es:[bx]
		push	ss
		lea	ax, [bp-110h]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		les	bx, [bx+91h]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]
		add	sp, 10h
		mov	dx, ss
		lea	ax, [bp-110h]
		jmp	short loc_186D7
; ���������������������������������������������������������������������������

loc_186B6:				; CODE XREF: seg021:02D3j
		mov	eax, dword_707E0

loc_186BA:
		mov	[bp-110h], eax
		mov	eax, dword_707E4
		mov	[bp-10Ch], eax
		mov	eax, dword_707E8
		mov	[bp-108h], eax
		mov	dx, ss
		lea	ax, [bp-110h]

loc_186D7:				; CODE XREF: seg021:0324j
		mov	eax, [bp-110h]
		mov	[bp-104h], eax
		mov	eax, [bp-10Ch]
		mov	[bp-100h], eax
		mov	eax, [bp-108h]
		mov	[bp-0FCh], eax
		jmp	short loc_18766
; ���������������������������������������������������������������������������

loc_186F7:				; CODE XREF: seg021:02BCj
		mov	ax, [di+5Ch]
		mov	dx, [di+5Ah]
		add	dx, 45h	; 'E'
		mov	[bp-10h], ax
		mov	[bp-12h], dx
		les	ax, [bp-12h]
		mov	[bp-14h], ax
		mov	bx, [bp-14h]
		mov	eax, es:[bx]
		mov	[bp-104h], eax
		mov	eax, es:[bx+4]
		mov	[bp-100h], eax
		mov	eax, es:[bx+8]

loc_18727:
		mov	[bp-0FCh], eax
		mov	ax, di

loc_1872E:
		add	ax, 12h
		mov	[bp-16h], ax
		mov	bx, [bp-16h]
		mov	eax, [bx]
		sub	[bp-104h], eax
		mov	eax, [bx+4]

loc_18743:
		sub	[bp-100h], eax
		mov	eax, [bx+8]
		sub	[bp-0FCh], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp-104h]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4

loc_18766:				; CODE XREF: seg021:0365j
		mov	eax, [bp-104h]
		or	eax, [bp-100h]
		or	eax, [bp-0FCh]
		jnz	short loc_1877C
		mov	ax, 1
		jmp	short loc_1877E
; ���������������������������������������������������������������������������

loc_1877C:				; CODE XREF: seg021:03E5j
		xor	ax, ax

loc_1877E:				; CODE XREF: seg021:03EAj
		or	al, al
		jz	short loc_18785
		jmp	loc_18DF7
; ���������������������������������������������������������������������������

loc_18785:				; CODE XREF: seg021:03F0j
		lea	ax, [bp-104h]
		push	ax
		call	Vector_PrescaleBelow256_55B04
		pop	cx
		mov	eax, [bp-100h]
		cmp	eax, dword_6E9A6
		jl	short loc_187A1
		mov	ax, 1
		jmp	short loc_187A3
; ���������������������������������������������������������������������������

loc_187A1:				; CODE XREF: seg021:040Aj
		xor	ax, ax

loc_187A3:				; CODE XREF: seg021:040Fj
		or	al, al
		jz	short loc_18810
		mov	ax, si
		add	ax, 0Ch
		mov	[bp-18h], ax
		push	large dword ptr	[bp-100h]

loc_187B4:
		mov	bx, [bp-18h]

loc_187B7:
		push	large dword ptr	[bx]

loc_187BA:
		push	large dword ptr	[bp-104h]

loc_187BF:
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax

loc_187C6:
		pop	eax
		add	sp, 0Ch
		mov	[bp-1Ch], eax
		mov	[bp-20h], eax
		mov	ax, [si+8]
		add	ax, [bp-1Fh]
		mov	[bp-0Ah], ax
		mov	ax, si
		add	ax, 10h
		mov	[bp-22h], ax
		push	large dword ptr	[bp-100h]
		mov	bx, [bp-22h]
		push	large dword ptr	[bx]
		push	large dword ptr	[bp-0FCh]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-26h], eax
		mov	[bp-2Ah], eax
		mov	ax, [si+0Ah]
		sub	ax, [bp-29h]
		jmp	short loc_18877
; ���������������������������������������������������������������������������

loc_18810:				; CODE XREF: seg021:0415j
		mov	ax, si
		add	ax, 0Ch
		mov	[bp-2Ch], ax
		push	large [dword_6E9A6]
		mov	bx, [bp-2Ch]
		push	large dword ptr	[bx]

loc_18823:
		push	large dword ptr	[bp-104h]

loc_18828:
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch

loc_18834:
		mov	[bp-30h], eax
		mov	[bp-34h], eax
		mov	ax, [si+8]
		add	ax, [bp-33h]
		mov	[bp-0Ah], ax
		mov	ax, si
		add	ax, 10h
		mov	[bp-36h], ax
		push	large [dword_6E9A6]
		mov	bx, [bp-36h]
		push	large dword ptr	[bx]
		push	large dword ptr	[bp-0FCh]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-3Ah], eax
		mov	[bp-3Eh], eax
		mov	ax, [si+0Ah]
		sub	ax, [bp-3Dh]

loc_18877:				; CODE XREF: seg021:047Ej
		mov	[bp-8],	ax
		push	0
		push	large dword ptr	[bp-6]
		call	Bitset_SetBit
		add	sp, 6
		push	0
		lea	ax, [bp-0Ah]
		push	ax
		les	bx, [bp+6]
		les	bx, es:[bx+8]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 8
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	si, [bx]
		add	si, 50h	; 'P'

loc_188B0:
		mov	ax, [si]
		mov	[bp-42h], ax

loc_188B5:
		mov	ax, [si+2]
		mov	[bp-40h], ax
		mov	eax, [bp-42h]
		mov	bx, [bp+6]
		les	bx, es:[bx+0Eh]
		mov	es:[bx+6], eax
		mov	ax, [bp-0Ah]
		mov	[bp-46h], ax
		mov	ax, [bp-8]
		mov	[bp-44h], ax
		mov	eax, [bp-46h]
		mov	es:[bx+22h], eax
		les	bx, [di+5Ah]
		cmp	byte ptr es:[bx+44h], 0
		jnz	short loc_188ED
		jmp	loc_18ACF
; ���������������������������������������������������������������������������

loc_188ED:				; CODE XREF: seg021:0558j
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	ax, [bx+50h]
		sub	ax, [bp-0Ah]
		sar	ax, 1
		mov	[bp-6Ah], ax
		mov	ax, [bp-0Ah]
		add	[bp-6Ah], ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	ax, [bx+52h]
		sub	ax, [bp-8]
		sar	ax, 1
		mov	[bp-68h], ax
		mov	ax, [bp-8]
		add	[bp-68h], ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx]

loc_1892A:
		add	ax, 10h
		push	ax
		push	ss
		lea	ax, [bp-7Eh]
		push	ax

loc_18933:
		call	Matrix_RollAngle_57C67
		add	sp, 6
		les	bx, [bp+6]
		mov	ax, es:[bx+1Ah]
		mov	[bp-88h], ax
		lea	ax, [bp-7Eh]
		push	ax
		push	ss
		lea	ax, [bp-8Ch]
		push	ax
		call	Math_CosDeg_5483F
		add	sp, 6
		movsx	eax, word ptr [bp-88h]
		mov	edx, [bp-8Ch]
		imul	edx, eax
		mov	[bp-90h], edx
		mov	eax, [bp-90h]
		mov	[bp-94h], eax
		mov	[bp-86h], eax
		les	bx, [bp+6]
		mov	ax, es:[bx+1Ah]
		mov	[bp-96h], ax
		lea	ax, [bp-7Eh]
		push	ax
		push	ss
		lea	ax, [bp-9Ah]
		push	ax

loc_18990:
		call	Math_SinDeg_54876

loc_18995:
		add	sp, 6

loc_18998:
		movsx	eax, word ptr [bp-96h]

loc_1899E:
		mov	edx, [bp-9Ah]

loc_189A3:
		imul	edx, eax

loc_189A7:
		mov	[bp-9Eh], edx
		mov	eax, [bp-9Eh]

loc_189B1:
		mov	[bp-0A2h], eax
		mov	[bp-82h], eax
		mov	ax, [bp-6Ah]
		mov	[bp-0A4h], ax
		movsx	eax, word ptr [bp-0A4h]
		shl	eax, 8
		mov	edx, [bp-86h]
		add	edx, eax
		mov	[bp-0A8h], edx
		mov	eax, [bp-0A8h]
		mov	[bp-0ACh], eax
		mov	[bp-72h], eax
		mov	ax, [bp-68h]
		mov	[bp-0AEh], ax
		movsx	eax, word ptr [bp-0AEh]
		shl	eax, 8
		mov	edx, [bp-82h]
		add	edx, eax
		mov	[bp-0B2h], edx
		mov	eax, [bp-0B2h]
		mov	[bp-0B6h], eax
		mov	[bp-6Eh], eax
		mov	ax, [bp-6Ah]
		mov	[bp-0B8h], ax
		movsx	eax, word ptr [bp-0B8h]
		shl	eax, 8

loc_18A24:
		sub	eax, [bp-86h]

loc_18A29:
		mov	[bp-0BCh], eax

loc_18A2E:
		mov	[bp-0C0h], eax

loc_18A33:
		mov	[bp-7Ah], eax

loc_18A37:
		mov	ax, [bp-68h]
		mov	[bp-0C2h], ax
		movsx	eax, word ptr [bp-0C2h]
		shl	eax, 8
		sub	eax, [bp-82h]
		mov	[bp-0C6h], eax
		mov	[bp-0CAh], eax
		mov	[bp-76h], eax
		mov	ax, [bp-71h]
		mov	[bp-0CCh], ax
		mov	ax, [bp-6Dh]
		mov	[bp-0CEh], ax
		mov	ax, [bp-0CCh]
		mov	[bp-0D2h], ax
		mov	ax, [bp-0CEh]
		mov	[bp-0D0h], ax
		mov	ax, [bp-0D2h]
		mov	[bp-0D6h], ax
		mov	ax, [bp-0D0h]
		mov	[bp-0D4h], ax
		mov	eax, [bp-0D6h]
		les	bx, [bp+6]
		les	bx, es:[bx+12h]

loc_18A95:
		mov	es:[bx+6], eax
		mov	ax, [bp-79h]

loc_18A9D:
		mov	[bp-0D8h], ax
		mov	ax, [bp-75h]
		mov	[bp-0DAh], ax
		mov	ax, [bp-0D8h]
		mov	[bp-0DEh], ax

loc_18AB0:
		mov	ax, [bp-0DAh]
		mov	[bp-0DCh], ax
		mov	ax, [bp-0DEh]
		mov	[bp-0E2h], ax
		mov	ax, [bp-0DCh]

loc_18AC4:
		mov	[bp-0E0h], ax
		mov	eax, [bp-0E2h]
		jmp	short loc_18B0F
; ���������������������������������������������������������������������������

loc_18ACF:				; CODE XREF: seg021:055Aj
		mov	word ptr [bp-4Ah], 0
		mov	word ptr [bp-48h], 0
		mov	ax, [bp-4Ah]
		mov	[bp-4Eh], ax
		mov	ax, [bp-48h]
		mov	[bp-4Ch], ax
		mov	eax, [bp-4Eh]
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	es:[bx+6], eax
		mov	word ptr [bp-52h], 0
		mov	word ptr [bp-50h], 0
		mov	ax, [bp-52h]
		mov	[bp-56h], ax
		mov	ax, [bp-50h]
		mov	[bp-54h], ax
		mov	eax, [bp-56h]

loc_18B0F:				; CODE XREF: seg021:073Dj
		les	bx, [bp+6]
		les	bx, es:[bx+12h]
		mov	es:[bx+22h], eax
		les	bx, [di+5Ah]

loc_18B1E:
		cmp	byte ptr es:[bx+44h], 0
		jnz	short loc_18B28

loc_18B25:
		jmp	loc_18DB5
; ���������������������������������������������������������������������������

loc_18B28:				; CODE XREF: seg021:0793j
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	ax, [bx+50h]
		sub	ax, [bp-0Ah]
		sar	ax, 1
		mov	[bp-6Ah], ax
		mov	ax, [bp-0Ah]
		add	[bp-6Ah], ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	ax, [bx+52h]
		sub	ax, [bp-8]
		sar	ax, 1
		mov	[bp-68h], ax
		mov	ax, [bp-8]
		add	[bp-68h], ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	ax, [bp-68h]
		sub	ax, [bx+52h]
		mov	si, ax
		mov	ax, [di+5Ch]
		mov	dx, [di+5Ah]
		add	dx, 51h	; 'Q'
		mov	[bp-70h], ax
		mov	[bp-72h], dx
		les	bx, [bp-72h]
		mov	eax, es:[bx]
		mov	[bp-6Eh], eax
		mov	dword ptr [bp-76h], 25800h
		mov	eax, [bp-6Eh]

loc_18B93:
		mov	edx, eax
		mov	ecx, [bp-76h]

loc_18B9A:
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-6Eh], eax
		mov	dword ptr [bp-7Ah], 100h

loc_18BB1:
		mov	eax, [bp-6Eh]

loc_18BB5:
		cmp	eax, [bp-7Ah]
		jle	short loc_18BC0

loc_18BBB:
		mov	ax, 1
		jmp	short loc_18BC2
; ���������������������������������������������������������������������������

loc_18BC0:				; CODE XREF: seg021:0829j
		xor	ax, ax

loc_18BC2:				; CODE XREF: seg021:082Ej
		or	al, al
		jz	short loc_18BD6
		mov	dword ptr [bp-7Eh], 100h
		mov	eax, [bp-7Eh]
		mov	[bp-6Eh], eax

loc_18BD6:				; CODE XREF: seg021:0834j
		mov	[bp-80h], si
		movsx	eax, word ptr [bp-80h]
		mov	edx, [bp-6Eh]
		imul	edx, eax
		mov	[bp-6Eh], edx
		mov	si, [bp-6Dh]
		sub	[bp-68h], si
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx]
		add	ax, 10h
		push	ax
		push	ss
		lea	ax, [bp-94h]
		push	ax
		call	Matrix_RollAngle_57C67
		add	sp, 6
		les	bx, [bp+6]
		mov	ax, es:[bx+1Ah]
		mov	[bp-9Eh], ax
		lea	ax, [bp-94h]
		push	ax
		push	ss
		lea	ax, [bp-0A2h]
		push	ax

loc_18C21:
		call	Math_CosDeg_5483F
		add	sp, 6
		movsx	eax, word ptr [bp-9Eh]
		mov	edx, [bp-0A2h]
		imul	edx, eax
		mov	[bp-0A6h], edx
		mov	eax, [bp-0A6h]
		mov	[bp-0AAh], eax
		mov	[bp-9Ch], eax
		les	bx, [bp+6]
		mov	ax, es:[bx+1Ah]
		mov	[bp-0ACh], ax
		lea	ax, [bp-94h]
		push	ax
		push	ss
		lea	ax, [bp-0B0h]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6
		movsx	eax, word ptr [bp-0ACh]
		mov	edx, [bp-0B0h]
		imul	edx, eax
		mov	[bp-0B4h], edx
		mov	eax, [bp-0B4h]
		mov	[bp-0B8h], eax
		mov	[bp-98h], eax
		mov	ax, [bp-6Ah]
		mov	[bp-0BAh], ax
		movsx	eax, word ptr [bp-0BAh]

loc_18C9A:
		shl	eax, 8
		mov	edx, [bp-9Ch]
		add	edx, eax
		mov	[bp-0BEh], edx
		mov	eax, [bp-0BEh]
		mov	[bp-0C2h], eax
		mov	[bp-88h], eax
		mov	ax, [bp-68h]
		mov	[bp-0C4h], ax
		movsx	eax, word ptr [bp-0C4h]
		shl	eax, 8
		mov	edx, [bp-98h]
		add	edx, eax
		mov	[bp-0C8h], edx
		mov	eax, [bp-0C8h]
		mov	[bp-0CCh], eax
		mov	[bp-84h], eax
		mov	ax, [bp-6Ah]
		mov	[bp-0CEh], ax
		movsx	eax, word ptr [bp-0CEh]
		shl	eax, 8
		sub	eax, [bp-9Ch]
		mov	[bp-0D2h], eax
		mov	[bp-0D6h], eax
		mov	[bp-90h], eax
		mov	ax, [bp-68h]
		mov	[bp-0D8h], ax
		movsx	eax, word ptr [bp-0D8h]
		shl	eax, 8
		sub	eax, [bp-98h]

loc_18D22:
		mov	[bp-0DCh], eax
		mov	[bp-0E0h], eax
		mov	[bp-8Ch], eax

loc_18D31:
		mov	ax, [bp-87h]
		mov	[bp-0E2h], ax
		mov	ax, [bp-83h]
		mov	[bp-0E4h], ax
		mov	ax, [bp-0E2h]
		mov	[bp-0E8h], ax
		mov	ax, [bp-0E4h]
		mov	[bp-0E6h], ax
		mov	ax, [bp-0E8h]
		mov	[bp-0ECh], ax
		mov	ax, [bp-0E6h]
		mov	[bp-0EAh], ax
		mov	eax, [bp-0ECh]
		les	bx, [bp+6]
		les	bx, es:[bx+16h]
		mov	es:[bx+6], eax
		mov	ax, [bp-8Fh]
		mov	[bp-0EEh], ax
		mov	ax, [bp-8Bh]
		mov	[bp-0F0h], ax
		mov	ax, [bp-0EEh]
		mov	[bp-0F4h], ax
		mov	ax, [bp-0F0h]
		mov	[bp-0F2h], ax

loc_18D92:
		mov	ax, [bp-0F4h]

loc_18D96:
		mov	[bp-0F8h], ax

loc_18D9A:
		mov	ax, [bp-0F2h]
		mov	[bp-0F6h], ax

loc_18DA2:
		mov	eax, [bp-0F8h]

loc_18DA7:				; CODE XREF: seg021:0A65j
		les	bx, [bp+6]
		les	bx, es:[bx+16h]
		mov	es:[bx+22h], eax
		jmp	short loc_18E00
; ���������������������������������������������������������������������������

loc_18DB5:				; CODE XREF: seg021:loc_18B25j
		mov	word ptr [bp-5Ah], 0
		mov	word ptr [bp-58h], 0
		mov	ax, [bp-5Ah]
		mov	[bp-5Eh], ax
		mov	ax, [bp-58h]
		mov	[bp-5Ch], ax
		mov	eax, [bp-5Eh]
		les	bx, [bp+6]
		les	bx, es:[bx+16h]
		mov	es:[bx+6], eax
		mov	word ptr [bp-62h], 0
		mov	word ptr [bp-60h], 0
		mov	ax, [bp-62h]
		mov	[bp-66h], ax
		mov	ax, [bp-60h]
		mov	[bp-64h], ax
		mov	eax, [bp-66h]
		jmp	short loc_18DA7
; ���������������������������������������������������������������������������

loc_18DF7:				; CODE XREF: seg021:028Dj seg021:03F2j
		les	bx, [bp-6]
		mov	word ptr es:[bx+2Ah], 0

loc_18E00:				; CODE XREF: seg021:0A23j
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_18E04:				; DATA XREF: seg339:0B78o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		cmp	byte ptr [bx+95h], 5
		jnz	short loc_18E23
		push	large dword ptr	[bp+6]
		call	UI_NotifyRefresh
		add	sp, 4

loc_18E23:				; CODE XREF: seg021:0A85j
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_18E25:				; DATA XREF: seg339:0B64o
		push	bp
		mov	bp, sp

loc_18E28:
		sub	sp, 66h

loc_18E2B:
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 10h
		mov	[bp-6],	ax
		mov	[bp-8],	dx
		les	bx, [bp-8]
		mov	ax, es:[bx]
		mov	[bp-4],	ax
		mov	ax, es:[bx+2]
		mov	[bp-2],	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx+7]
		add	ax, 0FFF1h
		cmp	ax, [bp-2]
		jle	short loc_18E6B
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx+7]
		add	ax, 0FFF1h
		jmp	short loc_18E8A
; ���������������������������������������������������������������������������

loc_18E6B:				; CODE XREF: seg021:0ACAj
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Bh]
		add	ax, 0Fh
		cmp	ax, [bp-2]
		jge	short loc_18E8D
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Bh]
		add	ax, 0Fh

loc_18E8A:				; CODE XREF: seg021:0AD9j
		mov	[bp-2],	ax

loc_18E8D:				; CODE XREF: seg021:0AEBj
		les	bx, [bp+6]

loc_18E90:
		mov	bx, es:[bx+2]
		mov	ax, [bx+5]

loc_18E97:
		add	ax, 0FFF1h
		cmp	ax, [bp-4]
		jle	short loc_18EAE
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx+5]
		add	ax, 0FFF1h
		jmp	short loc_18ECD
; ���������������������������������������������������������������������������

loc_18EAE:				; CODE XREF: seg021:0B0Dj
		les	bx, [bp+6]

loc_18EB1:
		mov	bx, es:[bx+2]

loc_18EB5:
		mov	ax, [bx+9]
		add	ax, 0Fh
		cmp	ax, [bp-4]
		jge	short loc_18ED0
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx+9]
		add	ax, 0Fh

loc_18ECD:				; CODE XREF: seg021:0B1Cj
		mov	[bp-4],	ax

loc_18ED0:				; CODE XREF: seg021:0B2Ej
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 14h
		mov	[bp-0Eh], ax
		mov	[bp-10h], dx
		les	bx, [bp-10h]
		mov	ax, es:[bx]
		mov	[bp-0Ch], ax
		mov	ax, es:[bx+2]
		mov	[bp-0Ah], ax
		les	bx, [bp+6]
		les	bx, es:[bx+8]
		mov	eax, es:[bx]
		mov	[bp-14h], eax
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	al, [bx+95h]
		mov	[bp-16h], al
		cmp	byte ptr [bp-16h], 6
		jz	short loc_18F1D
		cmp	byte ptr [bp-16h], 3
		jz	short loc_18F1D
		jmp	loc_19168
; ���������������������������������������������������������������������������

loc_18F1D:				; CODE XREF: seg021:0B82j seg021:0B88j
		les	bx, [bp-14h]
		mov	word ptr es:[bx+2Ah], 0
		push	0
		push	word ptr [bp-12h]
		push	bx
		call	Bitset_SetBit
		add	sp, 6
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		cmp	byte ptr [bx+96h], 0
		jnz	short loc_18F47
		jmp	loc_19140
; ���������������������������������������������������������������������������

loc_18F47:				; CODE XREF: seg021:0BB2j
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		cmp	word ptr [bx+5Ch], 0
		jnz	short loc_18F59
		jmp	loc_19140
; ���������������������������������������������������������������������������

loc_18F59:				; CODE XREF: seg021:0BC4j
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	ax, [bx+5Ch]
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		cmp	ax, [bx+5Eh]
		jz	short loc_18F9A
		mov	bx, [bp+6]
		mov	byte ptr es:[bx+18h], 1
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	[bp-18h], ax
		push	ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx]
		add	ax, 5Eh	; '^'

loc_18F91:
		push	ax
		call	SetReference16
		add	sp, 4

loc_18F9A:				; CODE XREF: seg021:0BE1j
		les	bx, [bp+6]
		mov	al, es:[bx+18h]
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_18FAF
		cmp	ax, 2
		jz	short loc_18FC3
		jmp	short loc_18FD5
; ���������������������������������������������������������������������������

loc_18FAF:				; CODE XREF: seg021:0C16j
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	eax, [bx+85h]

loc_18FBD:
		mov	[bp-4],	eax
		jmp	short loc_18FD5
; ���������������������������������������������������������������������������

loc_18FC3:				; CODE XREF: seg021:0C1Bj
		les	bx, [bp+6]

loc_18FC6:
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		mov	eax, [bx+85h]
		mov	[bp-0Ch], eax

loc_18FD5:				; CODE XREF: seg021:0C1Dj seg021:0C31j
		les	bx, [bp+6]
		cmp	byte ptr es:[bx+18h], 2
		jnz	short loc_18FE2
		jmp	loc_19154
; ���������������������������������������������������������������������������

loc_18FE2:				; CODE XREF: seg021:0C4Dj
		mov	ax, [bp-4]
		sub	ax, [bp-0Ch]
		mov	[bp-2Ah], ax
		movsx	eax, word ptr [bp-2Ah]
		shl	eax, 8
		mov	[bp-2Eh], eax
		mov	eax, [bp-2Eh]
		mov	[bp-24h], eax
		mov	ax, [bp-2]
		sub	ax, [bp-0Ah]
		mov	[bp-30h], ax
		movsx	eax, word ptr [bp-30h]
		shl	eax, 8
		mov	[bp-34h], eax
		mov	eax, [bp-34h]
		mov	[bp-28h], eax
		cmp	dword ptr [bp-24h], 0
		jnz	short loc_1902A
		mov	ax, 1
		jmp	short loc_1902C
; ���������������������������������������������������������������������������

loc_1902A:				; CODE XREF: seg021:0C93j
		xor	ax, ax

loc_1902C:				; CODE XREF: seg021:0C98j
		or	al, al
		jz	short loc_1904D

loc_19030:
		cmp	dword ptr [bp-28h], 0

loc_19035:
		jnz	short loc_1903C
		mov	ax, 1
		jmp	short loc_1903E
; ���������������������������������������������������������������������������

loc_1903C:				; CODE XREF: seg021:loc_19035j
		xor	ax, ax

loc_1903E:				; CODE XREF: seg021:0CAAj
		or	al, al

loc_19040:
		jz	short loc_1904D

loc_19042:
		les	bx, [bp+6]

loc_19045:
		mov	byte ptr es:[bx+18h], 2
		jmp	loc_19154
; ���������������������������������������������������������������������������

loc_1904D:				; CODE XREF: seg021:0C9Ej
					; seg021:loc_19040j
		mov	dword ptr [bp-3Ch], 0
		lea	ax, [bp-3Ch]
		push	ax
		lea	ax, [bp-28h]
		push	ax
		lea	ax, [bp-24h]
		push	ax
		push	ss
		lea	ax, [bp-38h]
		push	ax
		call	Math_VectorLength_Wrapper_54C77
		add	sp, 0Ah
		les	bx, [bp+6]
		mov	ax, es:[bx+0Eh]
		mov	[bp-42h], ax
		movsx	eax, word ptr [bp-42h]
		mov	edx, dword_70458
		imul	edx, eax
		mov	[bp-46h], edx
		mov	eax, [bp-46h]
		mov	[bp-40h], eax

loc_19092:
		mov	eax, [bp-38h]
		cmp	eax, [bp-40h]
		jg	short loc_190A1
		mov	ax, 1
		jmp	short loc_190A3
; ���������������������������������������������������������������������������

loc_190A1:				; CODE XREF: seg021:0D0Aj
		xor	ax, ax

loc_190A3:				; CODE XREF: seg021:0D0Fj
		or	al, al
		jz	short loc_190B6
		les	bx, [bp+6]
		mov	byte ptr es:[bx+18h], 2
		mov	eax, [bp-4]
		jmp	loc_19150
; ���������������������������������������������������������������������������

loc_190B6:				; CODE XREF: seg021:0D15j
		mov	eax, [bp-24h]

loc_190BA:
		mov	edx, [bp-40h]
		imul	edx

loc_190C1:
		shrd	eax, edx, 8
		mov	[bp-4Ah], eax
		mov	eax, [bp-4Ah]
		mov	[bp-4Eh], eax
		mov	eax, [bp-4Eh]
		mov	edx, eax
		mov	ecx, [bp-38h]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-52h], eax
		mov	eax, [bp-52h]
		mov	[bp-56h], eax
		mov	ax, [bp-55h]
		add	[bp-0Ch], ax
		mov	eax, [bp-28h]
		mov	edx, [bp-40h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-5Ah], eax
		mov	eax, [bp-5Ah]
		mov	[bp-5Eh], eax
		mov	eax, [bp-5Eh]
		mov	edx, eax
		mov	ecx, [bp-38h]

loc_19121:
		sar	edx, 18h

loc_19125:
		shl	eax, 8
		idiv	ecx
		mov	[bp-62h], eax
		mov	eax, [bp-62h]

loc_19134:
		mov	[bp-66h], eax
		mov	ax, [bp-65h]
		add	[bp-0Ah], ax

loc_1913E:
		jmp	short loc_19154
; ���������������������������������������������������������������������������

loc_19140:				; CODE XREF: seg021:0BB4j seg021:0BC6j
		les	bx, [bp+6]
		mov	byte ptr es:[bx+18h], 1
		mov	bx, es:[bx+2]
		mov	eax, [bx+0Dh]

loc_19150:				; CODE XREF: seg021:0D23j
		mov	[bp-0Ch], eax

loc_19154:				; CODE XREF: seg021:0C4Fj seg021:0CBAj ...
		push	0
		lea	ax, [bp-0Ch]
		push	ax
		push	large dword ptr	[bp+6]
		call	UI_NotifyChildrenMove
		add	sp, 8
		jmp	short loc_19171
; ���������������������������������������������������������������������������

loc_19168:				; CODE XREF: seg021:0B8Aj
		les	bx, [bp-14h]
		mov	word ptr es:[bx+2Ah], 0

loc_19171:				; CODE XREF: seg021:0DD6j
		mov	ax, [bp-4]
		mov	[bp-1Ch], ax
		mov	ax, [bp-2]
		mov	[bp-1Ah], ax
		mov	eax, [bp-1Ch]
		les	bx, [bp+6]
		mov	es:[bx+10h], eax
		mov	ax, [bp-0Ch]
		mov	[bp-20h], ax
		mov	ax, [bp-0Ah]

loc_19192:
		mov	[bp-1Eh], ax

loc_19195:
		mov	eax, [bp-20h]

loc_19199:
		mov	es:[bx+14h], eax
		leave
		retf
; ���������������������������������������������������������������������������

loc_191A0:				; DATA XREF: seg339:0B54o
		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		push	di
		mov	si, [bp+0Ah]
		les	bx, [bp+6]
		mov	bx, es:[bx+2]

loc_191B2:
		mov	bx, [bx]
		mov	dl, [bx+95h]
		mov	bx, [bp+6]

loc_191BB:
		les	bx, es:[bx+8]

loc_191BF:
		mov	eax, es:[bx]

loc_191C3:
		mov	[bp-4],	eax
		or	dl, dl
		jz	short loc_191D3
		cmp	dl, 7
		jz	short loc_191D3
		jmp	loc_19380
; ���������������������������������������������������������������������������

loc_191D3:				; CODE XREF: seg021:0E39j seg021:0E3Ej
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx]
		add	ax, 40h	; '@'
		mov	[bp-0Ah], ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		les	bx, [bx+91h]
		mov	ax, es:[bx]
		or	ax, es:[bx+2]
		jz	short loc_19246
		push	1
		push	word ptr [bp-0Ah]
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		les	bx, [bx+91h]
		push	word ptr es:[bx+0Dh]
		push	0
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		les	bx, [bx+91h]
		push	large dword ptr	es:[bx]
		push	ss
		lea	ax, [bp-36h]
		push	ax
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]

loc_1922F:
		les	bx, [bx+91h]

loc_19233:
		les	bx, es:[bx]

loc_19236:
		mov	bx, es:[bx]
		call	dword ptr [bx+18h]

loc_1923C:
		add	sp, 10h
		mov	dx, ss
		lea	ax, [bp-36h]
		jmp	short loc_19263
; ���������������������������������������������������������������������������

loc_19246:				; CODE XREF: seg021:0E66j
		mov	eax, dword_707E0
		mov	[bp-36h], eax
		mov	eax, dword_707E4
		mov	[bp-32h], eax
		mov	eax, dword_707E8
		mov	[bp-2Eh], eax
		mov	dx, ss
		lea	ax, [bp-36h]

loc_19263:				; CODE XREF: seg021:0EB4j
		mov	eax, [bp-36h]
		or	eax, [bp-32h]
		or	eax, [bp-2Eh]
		jnz	short loc_19276
		mov	ax, 1
		jmp	short loc_19278
; ���������������������������������������������������������������������������

loc_19276:				; CODE XREF: seg021:0EDFj
		xor	ax, ax

loc_19278:				; CODE XREF: seg021:0EE4j
		or	al, al
		jz	short loc_1927F
		jmp	loc_19380
; ���������������������������������������������������������������������������

loc_1927F:				; CODE XREF: seg021:0EEAj
		lea	ax, [bp-36h]
		push	ax
		call	Vector_PrescaleBelow256_55B04
		pop	cx
		mov	eax, [bp-32h]
		cmp	eax, dword_6E9A6
		jl	short loc_19299
		mov	ax, 1
		jmp	short loc_1929B
; ���������������������������������������������������������������������������

loc_19299:				; CODE XREF: seg021:0F02j
		xor	ax, ax

loc_1929B:				; CODE XREF: seg021:0F07j
		or	al, al
		jz	short loc_192F8
		mov	di, si
		add	di, 0Ch
		push	large dword ptr	[bp-32h]
		push	large dword ptr	[di]
		push	large dword ptr	[bp-36h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-0Eh], eax
		mov	[bp-12h], eax

loc_192C3:
		mov	ax, [si+8]
		add	ax, [bp-11h]
		mov	[bp-8],	ax
		mov	di, si
		add	di, 10h
		push	large dword ptr	[bp-32h]
		push	large dword ptr	[di]
		push	large dword ptr	[bp-2Eh]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-16h], eax
		mov	[bp-1Ah], eax
		mov	ax, [si+0Ah]
		sub	ax, [bp-19h]
		jmp	short loc_19351
; ���������������������������������������������������������������������������

loc_192F8:				; CODE XREF: seg021:0F0Dj
		mov	di, si
		add	di, 0Ch
		push	large [dword_6E9A6]
		push	large dword ptr	[di]
		push	large dword ptr	[bp-36h]
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-1Eh], eax
		mov	[bp-22h], eax
		mov	ax, [si+8]
		add	ax, [bp-21h]
		mov	[bp-8],	ax
		mov	di, si

loc_19328:
		add	di, 10h

loc_1932B:
		push	large [dword_6E9A6]

loc_19330:
		push	large dword ptr	[di]
		push	large dword ptr	[bp-2Eh]

loc_19337:
		call	Math_FixedMulDiv_5804C
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp-26h], eax
		mov	[bp-2Ah], eax
		mov	ax, [si+0Ah]
		sub	ax, [bp-29h]

loc_19351:				; CODE XREF: seg021:0F66j
		mov	[bp-6],	ax
		push	0
		push	large dword ptr	[bp-4]
		call	Bitset_SetBit
		add	sp, 6
		push	0
		lea	ax, [bp-8]
		push	ax
		les	bx, [bp+6]
		les	bx, es:[bx+8]
		push	large dword ptr	es:[bx]
		les	bx, es:[bx]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 8
		jmp	short loc_19389
; ���������������������������������������������������������������������������

loc_19380:				; CODE XREF: seg021:0E40j seg021:0EECj
		les	bx, [bp-4]
		mov	word ptr es:[bx+2Ah], 0

loc_19389:				; CODE XREF: seg021:0FEEj
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1938D:				; DATA XREF: seg339:0B58o
		push	bp
		mov	bp, sp
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		cmp	byte ptr [bx+95h], 0
		jz	short loc_193B0
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		cmp	byte ptr [bx+95h], 7
		jnz	short loc_193BC

loc_193B0:				; CODE XREF: seg021:100Ej
		push	large dword ptr	[bp+6]
		call	UI_NotifyRefresh
		add	sp, 4

loc_193BC:				; CODE XREF: seg021:101Ej
		pop	bp
		retf
seg021		ends
