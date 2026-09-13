seg033		segment	byte public 'CODE' use16
		assume cs:seg033
		;org 0Fh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_1FC8F:				; DATA XREF: seg339:08EAo
		push	bp
		mov	bp, sp
		sub	sp, 36h
		push	si
		push	di
		mov	si, [bp+6]
		mov	byte ptr [bp-1], 0
		mov	byte ptr [bp-2], 0
		mov	word ptr [bp-0Ch], 0
		jmp	loc_1FDB7
; ���������������������������������������������������������������������������

loc_1FCAA:				; CODE XREF: seg033:014Aj
		mov	di, [bp-0Ch]
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		mov	[bp-0Eh], dx
		mov	[bp-10h], ax
		cmp	dword ptr [bp-10h], 0
		jnz	short loc_1FCC3

loc_1FCC0:
		jmp	loc_1FDB7
; ���������������������������������������������������������������������������

loc_1FCC3:				; CODE XREF: seg033:003Ej
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		mov	[bp-12h], al
		cmp	byte ptr [bp-12h], 8
		jz	short loc_1FCD6

loc_1FCD3:
		jmp	loc_1FDB7
; ���������������������������������������������������������������������������

loc_1FCD6:				; CODE XREF: seg033:0051j
		mov	ax, [di+55h]
		cmp	ax, word_722E6
		jz	short loc_1FCE2
		jmp	loc_1FDB7
; ���������������������������������������������������������������������������

loc_1FCE2:				; CODE XREF: seg033:005Dj
		mov	dx, word_722E6
		add	dx, 12h
		mov	bx, dx
		mov	eax, [bx]
		mov	[bp-36h], eax
		mov	eax, [bx+4]
		mov	[bp-32h], eax
		mov	eax, [bx+8]
		mov	[bp-2Eh], eax
		add	di, 12h
		mov	eax, [di]

loc_1FD08:
		sub	[bp-36h], eax
		mov	eax, [di+4]
		sub	[bp-32h], eax
		mov	eax, [di+8]
		sub	[bp-2Eh], eax
		push	large dword ptr	[bp-2Eh]
		push	large dword ptr	[bp-32h]
		push	large dword ptr	[bp-36h]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax

loc_1FD31:
		add	sp, 0Ch
		mov	[bp-1Ah], eax
		mov	[bp-16h], eax
		mov	dword ptr [bp-22h], 66h	; 'f'

loc_1FD44:
		mov	eax, [bp-22h]
		mov	[bp-1Eh], eax
		mov	eax, [bp-16h]
		sar	eax, 8
		cmp	eax, 9C4h
		jge	short loc_1FD6A
		mov	dword ptr [bp-26h], 0Ch
		mov	eax, [bp-26h]
		jmp	short loc_1FD86
; ���������������������������������������������������������������������������

loc_1FD6A:				; CODE XREF: seg033:00DAj
		mov	eax, [bp-16h]
		sar	eax, 8
		cmp	eax, 1194h
		jge	short loc_1FD8A
		mov	dword ptr [bp-2Ah], 33h	; '3'
		mov	eax, [bp-2Ah]

loc_1FD86:				; CODE XREF: seg033:00E8j
		mov	[bp-1Eh], eax

loc_1FD8A:				; CODE XREF: seg033:00F8j
		les	bx, [bp-10h]
		mov	dx, es:[bx+4Bh]
		test	dx, 3
		jz	short loc_1FDA5
		mov	byte ptr [bp-1], 1
		mov	eax, [bp-1Eh]
		mov	[bp-6],	eax
		jmp	short loc_1FDB7
; ���������������������������������������������������������������������������

loc_1FDA5:				; CODE XREF: seg033:0115j
		test	dx, 700h
		jz	short loc_1FDB7
		mov	byte ptr [bp-2], 1
		mov	eax, [bp-1Eh]
		mov	[bp-0Ah], eax

loc_1FDB7:				; CODE XREF: seg033:0027j
					; seg033:loc_1FCC0j ...
		lea	ax, [bp-0Ch]
		push	ax
		push	59C3h
		call	World_IterateObjects

loc_1FDC3:
		add	sp, 4

loc_1FDC6:
		or	ax, ax

loc_1FDC8:
		jz	short loc_1FDCD
		jmp	loc_1FCAA
; ���������������������������������������������������������������������������

loc_1FDCD:				; CODE XREF: seg033:loc_1FDC8j
		cmp	byte ptr [bp-1], 0
		jz	short loc_1FE1F

loc_1FDD3:
		cmp	byte ptr [si+40h], 0
		jz	short loc_1FDF8
		mov	eax, dword_70458
		sub	[si+44h], eax
		mov	eax, [si+44h]
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jnz	short loc_1FDFC
		mov	byte ptr [si+40h], 0
		xor	byte ptr [si+42h], 1
		jmp	short loc_1FDFC
; ���������������������������������������������������������������������������

loc_1FDF8:				; CODE XREF: seg033:0157j
		mov	byte ptr [si+42h], 1

loc_1FDFC:				; CODE XREF: seg033:016Cj seg033:0176j
		mov	al, [si+40h]
		mov	ah, 0
		or	ax, ax

loc_1FE03:
		jz	short loc_1FE0F

loc_1FE05:
		mov	eax, [si+4Ch]

loc_1FE09:
		cmp	eax, [bp-6]
		jle	short loc_1FE17

loc_1FE0F:				; CODE XREF: seg033:loc_1FE03j
		mov	eax, [bp-6]

loc_1FE13:
		mov	[si+44h], eax

loc_1FE17:				; CODE XREF: seg033:018Dj
		mov	eax, [bp-6]
		mov	[si+4Ch], eax

loc_1FE1F:				; CODE XREF: seg033:0151j
		mov	al, [bp-1]
		mov	[si+40h], al
		cmp	byte ptr [bp-2], 0
		jz	short loc_1FE77
		cmp	byte ptr [si+41h], 0
		jz	short loc_1FE50

loc_1FE31:
		mov	eax, dword_70458

loc_1FE35:
		sub	[si+48h], eax
		mov	eax, [si+48h]

loc_1FE3D:
		sar	eax, 1Fh
		inc	ax
		or	ax, ax
		jnz	short loc_1FE54
		mov	byte ptr [si+41h], 0
		xor	byte ptr [si+43h], 1
		jmp	short loc_1FE54
; ���������������������������������������������������������������������������

loc_1FE50:				; CODE XREF: seg033:01AFj
		mov	byte ptr [si+43h], 1

loc_1FE54:				; CODE XREF: seg033:01C4j seg033:01CEj
		mov	al, [si+41h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1FE67
		mov	eax, [si+50h]
		cmp	eax, [bp-0Ah]
		jle	short loc_1FE6F

loc_1FE67:				; CODE XREF: seg033:01DBj
		mov	eax, [bp-0Ah]
		mov	[si+48h], eax

loc_1FE6F:				; CODE XREF: seg033:01E5j
		mov	eax, [bp-0Ah]
		mov	[si+50h], eax

loc_1FE77:				; CODE XREF: seg033:01A9j
		mov	al, [bp-2]
		mov	[si+41h], al
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_1FE81:				; DATA XREF: seg339:08EEo
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+6]
		cmp	byte ptr [si+40h], 0
		jnz	short loc_1FE9B
		cmp	byte ptr [si+41h], 0
		jnz	short loc_1FE9B
		jmp	loc_1FF91
; ���������������������������������������������������������������������������

loc_1FE9B:				; CODE XREF: seg033:0210j seg033:0216j
		mov	bx, [si+2]
		cmp	byte ptr [bx+21Dh], 0
		jz	short loc_1FEB2
		mov	ax, [si+56h]
		mov	[bp-2],	ax
		mov	di, si
		add	di, 22h	; '"'
		jmp	short loc_1FEBD
; ���������������������������������������������������������������������������

loc_1FEB2:				; CODE XREF: seg033:0223j
		mov	ax, [si+54h]
		mov	[bp-2],	ax
		mov	di, si
		add	di, 38h	; '8'

loc_1FEBD:				; CODE XREF: seg033:0230j
		mov	ax, [di]
		mov	[bp-4],	ax
		mov	ax, [di+2]
		mov	[bp-6],	ax
		mov	ax, [di+4]
		mov	[bp-8],	ax
		mov	ax, [di+6]
		mov	[bp-0Ah], ax
		mov	ax, [bp-4]
		mov	[si+16h], ax
		mov	ax, [bp-6]
		mov	[si+18h], ax
		mov	ax, [bp-8]
		mov	[si+1Ah], ax
		mov	ax, [bp-0Ah]
		mov	[si+1Ch], ax
		push	word ptr [bp-2]
		push	0
		mov	al, [si+32h]
		push	ax
		push	large dword ptr	[si+2Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832

loc_1FF01:
		add	sp, 0Ah
		push	dx
		push	ax

loc_1FF06:
		push	word ptr [di+2]
		push	word ptr [di]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		cmp	byte ptr [si+40h], 0
		jz	short loc_1FF54
		cmp	byte ptr [si+42h], 0
		jz	short loc_1FF54
		mov	ax, [bp-2]
		inc	ax
		push	ax
		push	0
		mov	al, [si+32h]
		push	ax
		push	large dword ptr	[si+2Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_1FF54:				; CODE XREF: seg033:029Dj seg033:02A3j
		cmp	byte ptr [si+41h], 0
		jz	short loc_1FF91
		cmp	byte ptr [si+43h], 0
		jz	short loc_1FF91
		mov	ax, [bp-2]
		add	ax, 2
		push	ax
		push	0
		mov	al, [si+32h]
		push	ax
		push	large dword ptr	[si+2Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [di+2]
		push	word ptr [di]
		mov	ax, si
		add	ax, 12h
		push	ax
		call	Render_MeasureOrDrawTextString_61F52

loc_1FF8E:
		add	sp, 0Ch

loc_1FF91:				; CODE XREF: seg033:0218j seg033:02D8j ...
		pop	di
		pop	si
		leave
		retf
seg033		ends
