seg034		segment	byte public 'CODE' use16
		assume cs:seg034
		;org 5
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_1FF95:				; DATA XREF: seg339:0F38o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]

loc_1FF9F:				; DATA XREF: seg216:01CEo
		mov	al, byte_722D1
		mov	ah, 0
		mov	[bp-1],	al
		cmp	byte ptr [bp-1], 11h
		jnz	short loc_1FFC0
		mov	ax, [si+38h]
		mov	[bp-4],	ax
		movsx	eax, word ptr [bp-4]
		shl	eax, 8
		mov	[si+3Ah], eax

loc_1FFC0:				; CODE XREF: seg034:001Bj
		mov	eax, dword_70458
		sub	[si+3Ah], eax
		mov	eax, [si+3Ah]
		sar	eax, 1Fh
		inc	ax
		or	ax, ax

loc_1FFD3:
		jnz	short loc_1FFDC
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx

loc_1FFDC:				; CODE XREF: seg034:loc_1FFD3j
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1FFDF:				; DATA XREF: seg339:0F3Co
		push	bp
		mov	bp, sp
		sub	sp, 34h
		push	si
		push	di
		mov	di, [bp+6]
		mov	ax, [di+4]
		add	ax, 29h	; ')'
		mov	[bp-2],	ax
		push	di
		call	Widget_GetNestedPropA
		pop	cx
		mov	[di+1Ch], ax
		mov	bx, word_6E343

loc_20001:
		mov	al, [bx+17h]
		mov	[bp-3],	al
		mov	al, [di+1Bh]
		push	ax
		push	bx
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		push	large 0
		mov	al, [di+15h]
		push	ax
		push	large dword ptr	[di+11h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		mov	bx, [bp-2]
		mov	ax, [bx+6]
		add	ax, [di+20h]
		push	ax
		mov	ax, [bx+4]
		add	ax, [di+1Eh]
		push	ax
		push	bx
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		mov	bx, [di+1Ch]
		mov	ax, [bx+5Ch]
		mov	dx, [bx+5Ah]
		mov	[bp-6],	ax
		mov	[bp-8],	dx
		les	bx, [bp-8]
		cmp	word ptr es:[bx+38h], 0
		jle	short loc_20069
		mov	dx, es:[bx+36h]
		mov	ax, es:[bx+34h]
		jmp	short loc_2006D
; ���������������������������������������������������������������������������

loc_20069:				; CODE XREF: seg034:00CDj
		xor	dx, dx
		xor	ax, ax

loc_2006D:				; CODE XREF: seg034:00D7j
		mov	bx, ax
		mov	es, dx
		assume es:seg000
		mov	ax, es:[bx+13h]
		mov	[bp-0Ah], ax
		push	word ptr [di+2Eh]
		push	word ptr [di+2Ch]
		push	word ptr [di+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		movsx	eax, word ptr [bp-0Ah]
		push	eax
		push	word ptr [di+4]
		call	Widget_SetLabelFormatted
		add	sp, 6
		mov	ax, [di+2Eh]
		dec	ax
		push	ax
		push	0
		push	word ptr [di+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		les	bx, [bp-8]
		assume es:nothing
		cmp	byte ptr es:[bx+56h], 0
		jz	short loc_200BD
		push	ds
		push	offset unk_6DF74
		jmp	short loc_200C1
; ���������������������������������������������������������������������������

loc_200BD:				; CODE XREF: seg034:0125j
		push	ds
		push	offset aNorm	; "NORM"

loc_200C1:				; CODE XREF: seg034:012Bj
		push	word ptr [di+4]

loc_200C4:
		call	Widget_SetLabelRaw
		add	sp, 6
		les	bx, [bp-8]
		mov	ax, es:[bx+16h]
		mov	dx, es:[bx+14h]
		mov	bx, es:[bx]
		imul	bx, 12h
		add	dx, bx
		mov	[bp-0Ch], ax
		mov	[bp-0Eh], dx
		push	ax
		push	dx
		push	large dword ptr	[bp-8]
		call	WeaponStation_SelectForTarget
		add	sp, 8
		mov	[bp-10h], dx
		mov	[bp-12h], ax
		les	bx, [bp-0Eh]
		cmp	dword ptr es:[bx], 0
		jz	short loc_2010C

loc_20103:
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_2010E
; ���������������������������������������������������������������������������

loc_2010C:				; CODE XREF: seg034:0171j
		xor	ax, ax

loc_2010E:				; CODE XREF: seg034:017Aj
		cmp	ax, 800h
		jnz	short loc_20118

loc_20113:
		push	0ECDh
		jmp	short loc_2011B
; ���������������������������������������������������������������������������

loc_20118:				; CODE XREF: seg034:0181j
		push	0ED1h

loc_2011B:				; CODE XREF: seg034:0186j
		lea	ax, [bp-18h]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	word ptr [bp-1Ah], 1
		jmp	loc_20398
; ���������������������������������������������������������������������������

loc_2012F:				; CODE XREF: seg034:0410j
		les	bx, [bp-8]

loc_20132:
		mov	ax, es:[bx+38h]

loc_20136:
		cmp	ax, [bp-1Ah]
		jle	short loc_2014D
		mov	dx, es:[bx+36h]
		mov	ax, es:[bx+34h]
		mov	bx, [bp-1Ah]
		imul	bx, 23h
		add	ax, bx
		jmp	short loc_20151
; ���������������������������������������������������������������������������

loc_2014D:				; CODE XREF: seg034:01A9j
		xor	dx, dx
		xor	ax, ax

loc_20151:				; CODE XREF: seg034:01BBj
		mov	[bp-2Ah], dx
		mov	[bp-2Ch], ax
		les	bx, [bp-2Ch]
		mov	dx, es:[bx+0Dh]
		mov	ax, es:[bx+13h]
		mov	[bp-2Eh], ax
		cmp	word ptr [bp-2Eh], 0
		jnz	short loc_2016E
		jmp	loc_20395
; ���������������������������������������������������������������������������

loc_2016E:				; CODE XREF: seg034:01D9j
		mov	word ptr [bp-30h], 0FFFFh
		mov	[bp-28h], dx
		mov	cx, 9		; switch 9 cases
		mov	bx, offset word_20447

loc_2017C:				; CODE XREF: seg034:01F7j
		mov	ax, cs:[bx]
		cmp	ax, [bp-28h]
		jz	short loc_2018C
		add	bx, 2
		loop	loc_2017C
		jmp	loc_202ED	; default
; ���������������������������������������������������������������������������

loc_2018C:				; CODE XREF: seg034:01F2j
		jmp	word ptr cs:[bx+12h] ; switch jump

loc_20190:				; DATA XREF: seg034:04C9o
		mov	word ptr [bp-30h], 1 ; case 0x1
		les	bx, [bp-0Eh]
		cmp	dword ptr es:[bx], 0
		jz	short loc_201A8
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_201AA
; ���������������������������������������������������������������������������

loc_201A8:				; CODE XREF: seg034:020Dj
		xor	ax, ax

loc_201AA:				; CODE XREF: seg034:0216j
		cmp	ax, dx
		jz	short loc_201B1
		jmp	loc_202ED	; default
; ���������������������������������������������������������������������������

loc_201B1:				; CODE XREF: seg034:021Cj
		push	0ED6h

loc_201B4:				; CODE XREF: seg034:0257j
					; seg034:loc_2020Dj ...
		lea	ax, [bp-18h]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	loc_202ED	; default
; ���������������������������������������������������������������������������

loc_201C3:				; CODE XREF: seg034:loc_2018Cj
					; DATA XREF: seg034:04C9o
		mov	word ptr [bp-30h], 1 ; case 0x2
		les	bx, [bp-0Eh]
		cmp	dword ptr es:[bx], 0
		jz	short loc_201DB
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_201DD
; ���������������������������������������������������������������������������

loc_201DB:				; CODE XREF: seg034:0240j
		xor	ax, ax

loc_201DD:				; CODE XREF: seg034:0249j
		cmp	ax, dx
		jz	short loc_201E4
		jmp	loc_202ED	; default
; ���������������������������������������������������������������������������

loc_201E4:				; CODE XREF: seg034:024Fj
		push	0EDBh
		jmp	short loc_201B4
; ���������������������������������������������������������������������������

loc_201E9:				; CODE XREF: seg034:loc_2018Cj
					; DATA XREF: seg034:04C9o
		mov	word ptr [bp-30h], 5 ; case 0x4
		les	bx, [bp-0Eh]
		cmp	dword ptr es:[bx], 0
		jz	short loc_20201
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_20203
; ���������������������������������������������������������������������������

loc_20201:				; CODE XREF: seg034:0266j
		xor	ax, ax

loc_20203:				; CODE XREF: seg034:026Fj
		cmp	ax, dx
		jz	short loc_2020A

loc_20207:				; default
		jmp	loc_202ED
; ���������������������������������������������������������������������������

loc_2020A:				; CODE XREF: seg034:0275j
		push	0EE0h

loc_2020D:
		jmp	short loc_201B4
; ���������������������������������������������������������������������������

loc_2020F:				; CODE XREF: seg034:loc_2018Cj
					; DATA XREF: seg034:04C9o
		mov	word ptr [bp-30h], 7 ; case 0x8
		les	bx, [bp-0Eh]
		cmp	dword ptr es:[bx], 0
		jz	short loc_20227
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_20229
; ���������������������������������������������������������������������������

loc_20227:				; CODE XREF: seg034:028Cj
		xor	ax, ax

loc_20229:				; CODE XREF: seg034:0295j
		cmp	ax, dx
		jz	short loc_20230
		jmp	loc_202ED	; default
; ���������������������������������������������������������������������������

loc_20230:				; CODE XREF: seg034:029Bj
		push	0EE5h
		jmp	loc_201B4
; ���������������������������������������������������������������������������

loc_20236:				; CODE XREF: seg034:loc_2018Cj
					; DATA XREF: seg034:04C9o
		mov	word ptr [bp-30h], 9 ; case 0x10
		les	bx, [bp-0Eh]

loc_2023E:
		cmp	dword ptr es:[bx], 0

loc_20243:
		jz	short loc_2024E
		les	bx, es:[bx]

loc_20248:
		mov	ax, es:[bx+4Bh]
		jmp	short loc_20250
; ���������������������������������������������������������������������������

loc_2024E:				; CODE XREF: seg034:loc_20243j
		xor	ax, ax

loc_20250:				; CODE XREF: seg034:02BCj
		cmp	ax, dx
		jz	short loc_20257
		jmp	loc_202ED	; default
; ���������������������������������������������������������������������������

loc_20257:				; CODE XREF: seg034:02C2j
		push	0EEAh
		jmp	loc_201B4
; ���������������������������������������������������������������������������

loc_2025D:				; CODE XREF: seg034:loc_2018Cj
					; DATA XREF: seg034:04C9o
		mov	word ptr [bp-30h], 0Bh ; case 0x20
		les	bx, [bp-0Eh]
		cmp	dword ptr es:[bx], 0
		jz	short loc_20275
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_20277
; ���������������������������������������������������������������������������

loc_20275:				; CODE XREF: seg034:02DAj
		xor	ax, ax

loc_20277:				; CODE XREF: seg034:02E3j
		cmp	ax, dx
		jnz	short loc_202ED	; default
		push	0EEFh
		jmp	loc_201B4
; ���������������������������������������������������������������������������

loc_20281:				; CODE XREF: seg034:loc_2018Cj
					; DATA XREF: seg034:04C9o
		mov	word ptr [bp-30h], 0Dh ; case 0x40
		les	bx, [bp-0Eh]
		cmp	dword ptr es:[bx], 0
		jz	short loc_20299
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_2029B
; ���������������������������������������������������������������������������

loc_20299:				; CODE XREF: seg034:02FEj
		xor	ax, ax

loc_2029B:				; CODE XREF: seg034:0307j
		cmp	ax, dx
		jnz	short loc_202ED	; default
		push	0EF4h
		jmp	loc_201B4
; ���������������������������������������������������������������������������

loc_202A5:				; CODE XREF: seg034:loc_2018Cj
					; DATA XREF: seg034:04C9o
		mov	word ptr [bp-30h], 0Fh ; case 0x80
		les	bx, [bp-0Eh]
		cmp	dword ptr es:[bx], 0
		jz	short loc_202BD
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_202BF
; ���������������������������������������������������������������������������

loc_202BD:				; CODE XREF: seg034:0322j
		xor	ax, ax

loc_202BF:				; CODE XREF: seg034:032Bj
		cmp	ax, dx
		jnz	short loc_202ED	; default
		push	0EF9h
		jmp	loc_201B4
; ���������������������������������������������������������������������������

loc_202C9:				; CODE XREF: seg034:loc_2018Cj
					; DATA XREF: seg034:04C9o
		mov	word ptr [bp-30h], 3 ; case 0x100
		les	bx, [bp-0Eh]
		cmp	dword ptr es:[bx], 0
		jz	short loc_202E1
		les	bx, es:[bx]
		mov	ax, es:[bx+4Bh]
		jmp	short loc_202E3
; ���������������������������������������������������������������������������

loc_202E1:				; CODE XREF: seg034:0346j
		xor	ax, ax

loc_202E3:				; CODE XREF: seg034:034Fj
		cmp	ax, dx
		jnz	short loc_202ED	; default
		push	0EFEh
		jmp	loc_201B4
; ���������������������������������������������������������������������������

loc_202ED:				; CODE XREF: seg034:01F9j seg034:021Ej ...
		cmp	word ptr [bp-30h], 0FFFFh ; default
		jz	short loc_20359
		les	bx, [di+24h]
		mov	ax, [bp-1Ah]
		dec	ax
		shl	ax, 2
		add	bx, ax
		mov	si, [bp-2]
		mov	ax, [si+4]
		add	ax, es:[bx]
		mov	[bp-32h], ax
		mov	bx, [di+24h]
		mov	ax, [bp-1Ah]
		dec	ax
		shl	ax, 2
		add	bx, ax
		mov	ax, [si+6]
		add	ax, es:[bx+2]
		mov	[bp-34h], ax
		mov	eax, [bp-2Ch]
		cmp	eax, [bp-12h]
		jnz	short loc_2032E
		inc	word ptr [bp-30h]

loc_2032E:				; CODE XREF: seg034:0399j
		push	word ptr [bp-30h]
		push	0
		mov	al, [di+15h]
		push	ax

loc_20337:
		push	large dword ptr	[di+11h]

loc_2033B:
		push	5C44h

loc_2033E:
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [bp-34h]
		push	word ptr [bp-32h]
		push	word ptr [bp-2]
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_20359:				; CODE XREF: seg034:0361j
		les	bx, [di+28h]
		mov	ax, [bp-1Ah]
		dec	ax
		shl	ax, 2
		add	bx, ax
		push	word ptr es:[bx+2]
		mov	bx, [di+28h]
		mov	ax, [bp-1Ah]
		dec	ax
		shl	ax, 2
		add	bx, ax
		push	word ptr es:[bx]
		push	word ptr [di+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		movsx	eax, word ptr [bp-2Eh]
		push	eax
		push	word ptr [di+4]
		call	Widget_SetLabelFormatted
		add	sp, 6

loc_20395:				; CODE XREF: seg034:01DBj
		inc	word ptr [bp-1Ah]

loc_20398:				; CODE XREF: seg034:019Cj
		mov	ax, [di+22h]
		cmp	ax, [bp-1Ah]
		jl	short loc_203A3
		jmp	loc_2012F
; ���������������������������������������������������������������������������

loc_203A3:				; CODE XREF: seg034:040Ej
		les	bx, [bp-8]
		push	word ptr es:[bx+3Ch]
		push	0F03h
		lea	ax, [bp-20h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		les	bx, [bp-8]
		push	word ptr es:[bx+3Ah]
		push	0F08h
		lea	ax, [bp-26h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	word ptr [di+32h]
		push	word ptr [di+30h]
		push	word ptr [di+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	ss
		lea	ax, [bp-20h]
		push	ax
		push	word ptr [di+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		push	word ptr [di+36h]
		push	word ptr [di+34h]
		push	word ptr [di+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	ss
		lea	ax, [bp-26h]
		push	ax
		push	word ptr [di+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		mov	ax, [di+2Eh]
		dec	ax
		push	ax
		push	36h ; '6'
		push	word ptr [di+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	ss
		lea	ax, [bp-18h]
		push	ax
		push	word ptr [di+4]
		call	Widget_SetLabelRaw

loc_20430:
		add	sp, 6

loc_20433:
		mov	al, [bp-3]
		push	ax
		push	word_6E343

loc_2043B:
		call	Widget_Method_Dispatch8_6083F

loc_20440:
		add	sp, 4
		pop	di

loc_20444:
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
word_20447	dw	1,     2,     4,     8 ; DATA XREF: seg034:01E9o
		dw    10h,   20h,   40h,   80h ; value table for switch	statement
		dw   100h
		dw offset loc_20190	; jump table for switch	statement
		dw offset loc_201C3
		dw offset loc_201E9
		dw offset loc_2020F
		dw offset loc_20236
		dw offset loc_2025D
		dw offset loc_20281
		dw offset loc_202A5
		dw offset loc_202C9
; ���������������������������������������������������������������������������

loc_2046B:				; DATA XREF: seg339:0F24o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		push	si
		call	Widget_GetNestedPropA
		pop	cx
		mov	[si+1Dh], ax
		mov	bx, [si+1Dh]
		push	word ptr [bx+51h]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		add	ax, 6Dh	; 'm'
		mov	di, ax
		mov	eax, [di]
		sar	eax, 8
		mov	[si+2Bh], eax
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_204A0:				; DATA XREF: seg339:0F28o
		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+6]
		mov	ax, [si+4]
		add	ax, 29h	; ')'
		mov	[bp-2],	ax
		push	si
		call	Widget_GetNestedPropA
		pop	cx
		mov	[si+1Dh], ax
		mov	bx, [si+4]
		mov	ax, [bx+3Bh]
		mov	[bp-6],	ax
		mov	ax, [bx+3Dh]
		mov	[bp-4],	ax
		push	large 0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large dword ptr	[bp-6]
		push	word ptr [bp-2]
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		xor	di, di
		jmp	short loc_2056D
; ���������������������������������������������������������������������������

loc_204F8:				; CODE XREF: seg034:05E0j
		mov	ax, [si+23h]
		mov	dx, di
		imul	dx, 9

loc_20500:
		add	ax, dx

loc_20502:
		push	word ptr [si+25h]
		push	ax

loc_20506:
		mov	bx, [si+1Dh]
		push	large dword ptr	[bx+5Eh]
		call	Roster_FindByNameOrder
		add	sp, 8
		or	al, al
		jz	short loc_2051E
		push	0E5h ; '�'
		jmp	short loc_20542
; ���������������������������������������������������������������������������

loc_2051E:				; CODE XREF: seg034:0587j
		mov	ax, [si+23h]
		mov	dx, di
		imul	dx, 9
		add	ax, dx
		push	word ptr [si+25h]
		push	ax
		mov	bx, [si+1Dh]
		push	large dword ptr	[bx+5Eh]
		call	Roster_FindByNameAndFlag
		add	sp, 8
		or	al, al
		jz	short loc_2056C
		push	0EDh ; '�'

loc_20542:				; CODE XREF: seg034:058Cj
		mov	ax, di
		inc	ax
		push	ax
		push	0
		mov	al, [si+15h]
		push	ax
		push	large dword ptr	[si+11h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large dword ptr	[bp-6]
		push	word ptr [bp-2]
		call	Render_DrawTextString_61CD2
		add	sp, 0Eh

loc_2056C:				; CODE XREF: seg034:05ADj
		inc	di

loc_2056D:				; CODE XREF: seg034:0566j
		cmp	[si+1Fh], di
		jg	short loc_204F8
		mov	bx, word_6E343
		mov	al, [bx+17h]
		mov	[bp-7],	al
		push	ds
		push	offset aFuel	; "FUEL"
		mov	bx, [si+1Dh]
		push	large dword ptr	[bx+5Eh]
		call	Roster_FindByNameAndFlag
		add	sp, 8
		or	al, al
		jz	short loc_20598
		mov	al, [si+1Ch]
		jmp	short loc_2059B
; ���������������������������������������������������������������������������

loc_20598:				; CODE XREF: seg034:0601j
		mov	al, [si+1Bh]

loc_2059B:				; CODE XREF: seg034:0606j
		push	ax
		push	word_6E343
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		push	0F12h
		lea	ax, [bp-10h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		push	word ptr [si+29h]
		push	word ptr [si+27h]
		push	word ptr [si+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	ss
		lea	ax, [bp-10h]
		push	ax
		push	word ptr [si+4]
		call	Widget_SetLabelRaw
		add	sp, 6
		mov	ax, [si+29h]
		add	ax, 7
		push	ax
		push	word ptr [si+27h]
		push	word ptr [si+4]
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	large dword ptr	[si+2Bh]
		push	word ptr [si+4]
		call	Widget_SetLabelFormatted
		add	sp, 6
		mov	al, [bp-7]
		push	ax
		push	word_6E343
		call	Widget_Method_Dispatch8_6083F
		add	sp, 4
		pop	di
		pop	si
		leave

locret_2060F:
		retf
seg034		ends
