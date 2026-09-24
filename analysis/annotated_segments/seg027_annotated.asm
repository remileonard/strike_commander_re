seg027		segment	byte public 'CODE' use16
		assume cs:seg027
		;org 8
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

loc_1B8C8:				; DATA XREF: seg339:0DA6o
		push	bp
		mov	bp, sp
		push	si
		push	di

loc_1B8CD:
		mov	di, [bp+0Ah]

loc_1B8D0:
		les	bx, [bp+6]

loc_1B8D3:
		mov	ax, [di+78h]
		mov	es:[bx+45h], ax
		mov	ax, [di+7Ah]
		mov	es:[bx+47h], ax

loc_1B8E1:
		mov	ax, [di+7Ch]
		mov	es:[bx+49h], ax
		mov	ax, [di+7Eh]
		mov	es:[bx+4Bh], ax
		mov	si, di

loc_1B8F1:
		add	si, 20h	; ' '
		mov	eax, [si]
		mov	es:[bx+1Dh], eax

loc_1B8FC:
		mov	eax, [si+4]
		mov	es:[bx+21h], eax
		mov	eax, [si+8]
		mov	es:[bx+25h], eax
		mov	si, di
		add	si, 2Ch	; ','
		mov	eax, [si]
		mov	es:[bx+29h], eax
		mov	eax, [si+4]
		mov	es:[bx+2Dh], eax
		mov	eax, [si+8]
		mov	es:[bx+31h], eax
		mov	si, di
		add	si, 38h	; '8'
		mov	eax, [si]
		mov	es:[bx+35h], eax
		mov	eax, [si+4]
		mov	es:[bx+39h], eax
		mov	eax, [si+8]
		mov	es:[bx+3Dh], eax
		mov	ax, [di+8]
		mov	es:[bx+41h], ax
		mov	ax, [di+0Ah]
		mov	es:[bx+43h], ax
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_1B95E:				; DATA XREF: seg339:0DAAo
		push	bp
		mov	bp, sp
		sub	sp, 226h
		push	si
		push	di
		mov	word ptr [bp-1A8h], 0
		mov	word ptr [bp-1A6h], 0
		mov	byte ptr [bp-19Bh], 0
		les	bx, [bp+6]
		mov	bx, es:[bx+2]

loc_1B97F:
		mov	ax, [bx+2]
		add	ax, 2
		push	ax
		lea	ax, [bp-1A8h]
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		mov	word ptr [bp-1D0h], 0D4Eh
		push	ss
		lea	ax, [bp-1D0h]
		push	ax
		call	UI_ResetSublist
		add	sp, 4
		mov	word ptr [bp-1D0h], 0CFEh
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	al, [bx+2Bh]
		mov	[bp-1A9h], al
		mov	ax, [bp+8]
		mov	dx, [bp+6]
		add	dx, 41h	; 'A'

loc_1B9C4:
		mov	[bp-6],	ax
		mov	[bp-8],	dx
		les	bx, [bp-8]
		mov	ax, es:[bx]
		mov	[bp-4],	ax

loc_1B9D3:
		mov	ax, es:[bx+2]
		mov	[bp-2],	ax
		mov	al, [bp-1A9h]
		push	ax
		push	large dword ptr	[bp-4]
		lea	ax, [bp-1A8h]
		push	ax
		call	Render_SetPixelClipped_61B58
		add	sp, 8
		cmp	byte_72361, 0
		jnz	short loc_1B9FA
		jmp	loc_1C53A
; ���������������������������������������������������������������������������

loc_1B9FA:				; CODE XREF: seg027:0135j
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Dh]
		mov	[bp-44h], ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bx+0Fh]
		mov	[bp-42h], ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bp-44h]
		add	ax, [bx+5]
		mov	di, ax
		mov	[bp-1A4h], di
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bp-42h]
		add	ax, [bx+7]
		mov	[bp-46h], ax
		mov	[bp-1A2h], ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bp-44h]
		add	ax, [bx+9]
		mov	[bp-1A0h], ax
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	ax, [bp-42h]
		add	ax, [bx+0Bh]
		mov	[bp-19Eh], ax
		push	0
		push	word_70E60
		lea	ax, [bp-1EAh]
		push	ax
		call	Widget_ApplyStyleAndAllocate_607E1
		add	sp, 6
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	si, [bx+13h]
		mov	eax, [si+10h]
		mov	[bp-1DAh], eax

loc_1BA83:
		mov	ax, [si+14h]
		mov	[bp-1D6h], ax
		mov	al, [si+16h]
		mov	[bp-1D4h], al
		mov	al, [si+17h]

loc_1BA94:
		mov	[bp-1D3h], al
		mov	al, [si+18h]
		mov	[bp-1D2h], al
		mov	ax, si
		add	ax, 2
		push	ax
		lea	ax, [bp-1E8h]
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		lea	ax, [bp-1A8h]
		push	ax
		lea	ax, [bp-1E8h]
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4

loc_1BAC4:
		les	bx, [bp+6]
		mov	ax, es:[bx+41h]
		mov	[bp-48h], ax

loc_1BACE:
		movsx	eax, word ptr [bp-48h]

loc_1BAD3:
		shl	eax, 8

loc_1BAD7:
		mov	[bp-4Ch], eax
		mov	eax, [bp-4Ch]

loc_1BADF:
		mov	[bp-10h], eax

loc_1BAE3:
		mov	ax, es:[bx+43h]
		mov	[bp-4Eh], ax
		movsx	eax, word ptr [bp-4Eh]
		shl	eax, 8

loc_1BAF3:
		mov	[bp-52h], eax

loc_1BAF7:
		mov	eax, [bp-52h]
		mov	[bp-0Ch], eax

loc_1BAFF:
		les	bx, es:[bx+4Dh]

loc_1BB03:
		les	bx, es:[bx+8]

loc_1BB07:
		les	bx, es:[bx]
		movsx	eax, word ptr es:[bx+6]
		shl	eax, 8
		mov	[bp-30h], eax
		les	bx, [bp+6]
		les	bx, es:[bx+4Dh]
		les	bx, es:[bx+8]
		les	bx, es:[bx]
		movsx	eax, word ptr es:[bx+8]
		shl	eax, 8
		mov	[bp-2Ch], eax
		lea	ax, [bp-20Eh]
		push	ax
		call	Formation_ComputeGeometryHelper_56D43
		pop	cx
		les	bx, [bp+6]
		mov	eax, es:[bx+1Dh]
		mov	[bp-20Eh], eax
		mov	eax, es:[bx+21h]
		mov	[bp-20Ah], eax
		mov	eax, es:[bx+25h]
		mov	[bp-206h], eax
		mov	eax, es:[bx+29h]
		mov	[bp-202h], eax
		mov	eax, es:[bx+2Dh]
		mov	[bp-1FEh], eax
		mov	eax, es:[bx+31h]
		mov	[bp-1FAh], eax
		mov	eax, es:[bx+35h]

loc_1BB83:
		mov	[bp-1F6h], eax

loc_1BB88:
		mov	eax, es:[bx+39h]

loc_1BB8D:
		mov	[bp-1F2h], eax
		mov	eax, es:[bx+3Dh]
		mov	[bp-1EEh], eax
		mov	eax, [bp-202h]
		mov	[bp-21Ah], eax
		mov	eax, [bp-1FEh]
		mov	[bp-216h], eax
		mov	eax, [bp-1FAh]
		mov	[bp-212h], eax
		mov	eax, [bp-21Ah]

loc_1BBBF:
		mov	[bp-226h], eax

loc_1BBC4:
		mov	eax, [bp-216h]

loc_1BBC9:
		mov	[bp-222h], eax

loc_1BBCE:
		mov	eax, [bp-212h]

loc_1BBD3:
		mov	[bp-21Eh], eax
		mov	dword ptr [bp-56h], 2D00h
		lea	ax, [bp-56h]
		push	ax
		lea	ax, [bp-21Ah]
		push	ax
		call	Missile_ComputeDirectionVector2D_556D4
		add	sp, 4

loc_1BBF1:
		mov	dword ptr [bp-5Ah], 0FFFFD300h
		lea	ax, [bp-5Ah]
		push	ax
		lea	ax, [bp-226h]
		push	ax
		call	Missile_ComputeDirectionVector2D_556D4
		add	sp, 4
		mov	eax, [bp-226h]
		sub	[bp-21Ah], eax
		mov	eax, [bp-222h]
		sub	[bp-216h], eax
		mov	eax, [bp-21Eh]
		sub	[bp-212h], eax
		lea	ax, [bp-20Eh]
		push	ax
		lea	ax, [bp-21Ah]
		push	ax
		call	Matrix_WorldToLocal_58768
		add	sp, 4
		mov	eax, [bp-21Ah]
		mov	[bp-20h], eax
		mov	eax, [bp-212h]
		neg	eax
		mov	[bp-1Ch], eax
		lea	ax, [bp-20h]
		push	ax
		call	UI_ComputeScaledVectorHelper_56215
		pop	cx
		cmp	dword ptr [bp-20h], 0
		jnz	short loc_1BC6F
		cmp	dword ptr [bp-1Ch], 0
		jnz	short loc_1BC6F
		mov	dword ptr [bp-20h], 100h

loc_1BC6F:				; CODE XREF: seg027:039Ej seg027:03A5j
		mov	eax, [bp-30h]
		sub	eax, [bp-10h]
		mov	[bp-5Eh], eax
		mov	[bp-62h], eax
		mov	eax, [bp-2Ch]
		sub	eax, [bp-0Ch]
		mov	[bp-66h], eax
		mov	[bp-6Ah], eax
		mov	eax, [bp-62h]
		mov	[bp-72h], eax
		mov	eax, [bp-6Ah]
		mov	[bp-6Eh], eax
		mov	eax, [bp-72h]
		mov	[bp-18h], eax
		mov	eax, [bp-6Eh]
		mov	[bp-14h], eax
		lea	ax, [bp-20h]
		push	ax
		lea	ax, [bp-18h]
		push	ax
		push	ss
		lea	ax, [bp-7Ah]
		push	ax
		call	UI_ComputeScaledVector_56061

loc_1BCC1:
		add	sp, 8
		mov	eax, [bp-7Ah]
		mov	[bp-18h], eax
		mov	eax, [bp-76h]

loc_1BCD0:
		mov	[bp-14h], eax
		mov	eax, [bp-10h]
		add	[bp-18h], eax
		mov	eax, [bp-0Ch]

loc_1BCE0:
		add	[bp-14h], eax

loc_1BCE4:
		mov	eax, [bp-18h]
		mov	[bp-82h], eax
		mov	eax, [bp-14h]

loc_1BCF1:
		mov	[bp-7Eh], eax
		mov	eax, [bp-1Ch]
		mov	[bp-28h], eax
		mov	eax, [bp-20h]
		neg	eax
		mov	[bp-24h], eax
		lea	ax, [bp-20Eh]
		push	ax
		push	ss
		lea	ax, [bp-96h]
		push	ax
		call	AI_ApplyAngleBetweenVectors_57C3A
		add	sp, 6
		mov	eax, [bp-96h]
		mov	[bp-86h], eax
		mov	[bp-8Ah], eax
		mov	dword ptr [bp-9Ah], 280h
		mov	eax, [bp-9Ah]
		add	[bp-8Ah], eax
		mov	ebx, 5
		mov	eax, [bp-8Ah]
		cdq
		idiv	ebx
		mov	[bp-8Ah], eax
		mov	ax, [bp-89h]
		mov	[bp-9Ch], ax
		movsx	eax, word ptr [bp-9Ch]
		shl	eax, 8
		mov	[bp-0A0h], eax
		mov	eax, [bp-0A0h]
		mov	[bp-8Ah], eax
		imul	eax, 5
		mov	[bp-8Ah], eax
		les	bx, [bp+6]
		mov	ax, es:[bx+1Bh]
		mov	[bp-0A6h], ax
		movsx	eax, word ptr [bp-0A6h]
		shl	eax, 8
		mov	[bp-0A4h], eax
		mov	ebx, 5
		cdq
		idiv	ebx
		mov	[bp-0A4h], eax
		mov	eax, [bp-8Ah]
		sub	eax, [bp-86h]
		mov	[bp-8Eh], eax
		mov	eax, [bp-8Eh]
		mov	edx, [bp-0A4h]

loc_1BDBF:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-8Eh], eax
		mov	eax, [bp-8Eh]

loc_1BDD1:
		mov	[bp-92h], eax

loc_1BDD6:
		mov	eax, [bp-8Eh]

loc_1BDDB:
		mov	edx, [bp-28h]
		imul	edx

loc_1BDE2:
		shrd	eax, edx, 8
		mov	[bp-8Eh], eax
		mov	eax, [bp-18h]

loc_1BDF0:
		add	eax, [bp-8Eh]
		mov	[bp-38h], eax
		mov	eax, [bp-92h]
		mov	edx, [bp-24h]

loc_1BE02:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-92h], eax
		mov	eax, [bp-14h]
		add	eax, [bp-92h]
		mov	[bp-34h], eax
		mov	bx, [bp+6]
		mov	bx, es:[bx+0Fh]
		movsx	eax, bx
		mov	edx, [bp-20h]
		imul	edx, eax
		mov	[bp-0CAh], edx
		mov	eax, [bp-0CAh]
		mov	[bp-0CEh], eax
		movsx	eax, bx
		mov	edx, [bp-1Ch]
		imul	edx, eax
		mov	[bp-0D2h], edx
		mov	eax, [bp-0D2h]
		mov	[bp-0D6h], eax
		mov	eax, [bp-0CEh]
		mov	[bp-0DEh], eax
		mov	eax, [bp-0D6h]
		mov	[bp-0DAh], eax
		mov	eax, [bp-0DEh]
		mov	[bp-0AEh], eax
		mov	eax, [bp-0DAh]
		mov	[bp-0AAh], eax

loc_1BE81:
		mov	bx, [bp+6]

loc_1BE84:
		mov	ax, es:[bx+0Fh]
		add	ax, es:[bx+11h]
		mov	bx, ax
		movsx	eax, bx
		mov	edx, [bp-20h]
		imul	edx, eax
		mov	[bp-0E2h], edx
		mov	eax, [bp-0E2h]
		mov	[bp-0E6h], eax
		movsx	eax, bx
		mov	edx, [bp-1Ch]
		imul	edx, eax
		mov	[bp-0EAh], edx
		mov	eax, [bp-0EAh]
		mov	[bp-0EEh], eax

loc_1BEC4:
		mov	eax, [bp-0E6h]
		mov	[bp-0F6h], eax

loc_1BECE:
		mov	eax, [bp-0EEh]

loc_1BED3:
		mov	[bp-0F2h], eax
		mov	eax, [bp-0F6h]
		mov	[bp-0B6h], eax
		mov	eax, [bp-0F2h]
		mov	[bp-0B2h], eax
		mov	bx, [bp+6]
		mov	bx, es:[bx+15h]

loc_1BEF3:
		movsx	eax, bx

loc_1BEF7:
		mov	edx, [bp-28h]

loc_1BEFB:
		imul	edx, eax
		mov	[bp-0FAh], edx
		mov	eax, [bp-0FAh]
		mov	[bp-0FEh], eax
		movsx	eax, bx
		mov	edx, [bp-24h]
		imul	edx, eax
		mov	[bp-102h], edx
		mov	eax, [bp-102h]
		mov	[bp-106h], eax
		mov	eax, [bp-0FEh]
		mov	[bp-10Eh], eax
		mov	eax, [bp-106h]
		mov	[bp-10Ah], eax
		mov	eax, [bp-10Eh]
		mov	[bp-0BEh], eax
		mov	eax, [bp-10Ah]
		mov	[bp-0BAh], eax
		mov	bx, [bp+6]
		mov	ax, es:[bx+0Fh]
		add	ax, es:[bx+11h]
		add	ax, es:[bx+13h]
		mov	bx, ax
		movsx	eax, bx
		mov	edx, [bp-20h]
		imul	edx, eax
		mov	[bp-112h], edx
		mov	eax, [bp-112h]
		mov	[bp-116h], eax
		movsx	eax, bx
		mov	edx, [bp-1Ch]
		imul	edx, eax
		mov	[bp-11Ah], edx

loc_1BF8E:
		mov	eax, [bp-11Ah]

loc_1BF93:
		mov	[bp-11Eh], eax

loc_1BF98:
		mov	eax, [bp-116h]
		mov	[bp-126h], eax
		mov	eax, [bp-11Eh]
		mov	[bp-122h], eax
		mov	eax, [bp-126h]
		mov	[bp-0C6h], eax
		mov	eax, [bp-122h]
		mov	[bp-0C2h], eax
		mov	eax, [bp-28h]
		mov	[bp-12Eh], eax
		mov	eax, [bp-24h]
		mov	[bp-12Ah], eax
		mov	bx, [bp+6]
		mov	ax, es:[bx+1Bh]
		mov	[bp-130h], ax
		movsx	eax, word ptr [bp-130h]

loc_1BFE3:
		shl	eax, 8
		mov	[bp-134h], eax
		mov	eax, [bp-12Eh]
		mov	edx, [bp-134h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-12Eh], eax
		mov	eax, [bp-12Ah]
		mov	edx, [bp-134h]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-12Ah], eax
		mov	eax, [bp-12Eh]
		mov	[bp-13Ch], eax
		mov	eax, [bp-12Ah]
		mov	[bp-138h], eax
		mov	al, es:[bx+0Eh]
		cbw
		sar	ax, 1
		mov	bx, ax
		movsx	eax, bx
		mov	edx, [bp-12Eh]
		imul	edx, eax
		mov	[bp-140h], edx
		mov	eax, [bp-140h]
		mov	[bp-144h], eax
		movsx	eax, bx
		mov	edx, [bp-12Ah]
		imul	edx, eax
		mov	[bp-148h], edx
		mov	eax, [bp-148h]
		mov	[bp-14Ch], eax
		mov	eax, [bp-144h]
		mov	[bp-154h], eax
		mov	eax, [bp-14Ch]
		mov	[bp-150h], eax
		mov	eax, [bp-38h]

loc_1C087:
		sub	eax, [bp-154h]

loc_1C08C:
		mov	[bp-158h], eax

loc_1C091:
		mov	[bp-15Ch], eax
		mov	eax, [bp-34h]
		sub	eax, [bp-150h]
		mov	[bp-160h], eax
		mov	[bp-164h], eax
		mov	eax, [bp-15Ch]
		mov	[bp-16Ch], eax
		mov	eax, [bp-164h]
		mov	[bp-168h], eax
		mov	eax, [bp-16Ch]
		mov	[bp-40h], eax
		mov	eax, [bp-168h]
		mov	[bp-3Ch], eax
		mov	bx, [bp+6]

loc_1C0D2:
		mov	al, es:[bx+0Eh]
		cbw
		sar	ax, 1
		imul	ax, 5
		mov	[bp-16Eh], ax
		movsx	eax, word ptr [bp-16Eh]
		shl	eax, 8
		mov	edx, [bp-8Ah]
		sub	edx, eax
		mov	[bp-172h], edx
		mov	eax, [bp-172h]
		mov	[bp-176h], eax
		mov	si, [bp-175h]
		mov	word ptr [bp-17Ah], 0
		mov	word ptr [bp-178h], 0
		mov	word ptr [bp-182h], 0
		jmp	loc_1C51E
; ���������������������������������������������������������������������������

loc_1C11A:				; CODE XREF: seg027:0C6Cj
		or	si, si
		jz	short loc_1C121
		jmp	loc_1C1E1
; ���������������������������������������������������������������������������

loc_1C121:				; CODE XREF: seg027:085Cj
		mov	ax, [bp-3Fh]
		mov	[bp-1CEh], ax
		mov	ax, [bp-3Bh]
		mov	[bp-1CCh], ax
		mov	eax, [bp-40h]
		add	eax, [bp-0C6h]
		sar	eax, 8
		mov	[bp-1B2h], ax
		mov	eax, [bp-3Ch]
		add	eax, [bp-0C2h]
		sar	eax, 8
		mov	[bp-1B0h], ax
		mov	byte ptr [bp-1AAh], 0
		push	0
		lea	ax, [bp-17Ah]
		push	ax
		push	ss
		lea	ax, [bp-1D0h]
		push	ax
		call	UI_ComputeScaledRect
		add	sp, 8
		push	1
		lea	ax, [bp-1EAh]
		push	ax
		lea	ax, [bp-44h]
		push	ax
		lea	ax, [bp-1A8h]
		push	ax
		push	ss
		lea	ax, [bp-1D0h]
		push	ax

loc_1C181:
		call	UI_ComputeAnchoredRect
		add	sp, 0Ch
		mov	eax, [bp-40h]

loc_1C18D:
		sub	eax, [bp-0C6h]

loc_1C192:
		sar	eax, 8
		mov	[bp-1B2h], ax
		mov	eax, [bp-3Ch]
		sub	eax, [bp-0C2h]
		sar	eax, 8
		mov	[bp-1B0h], ax
		push	0
		lea	ax, [bp-17Ah]
		push	ax
		push	ss
		lea	ax, [bp-1D0h]
		push	ax
		call	UI_ComputeScaledRect
		add	sp, 8
		push	1

loc_1C1C2:
		lea	ax, [bp-1EAh]
		push	ax
		lea	ax, [bp-44h]
		push	ax
		lea	ax, [bp-1A8h]
		push	ax
		push	ss

loc_1C1D1:
		lea	ax, [bp-1D0h]
		push	ax
		call	UI_ComputeAnchoredRect
		add	sp, 0Ch
		jmp	loc_1C4F3
; ���������������������������������������������������������������������������

loc_1C1E1:				; CODE XREF: seg027:085Ej
		or	si, si
		jge	short loc_1C1F8
		mov	bl, 1
		mov	eax, [bp-0BEh]
		mov	[bp-192h], eax

loc_1C1F1:
		mov	eax, [bp-0BAh]

loc_1C1F6:
		jmp	short loc_1C20F
; ���������������������������������������������������������������������������

loc_1C1F8:				; CODE XREF: seg027:0923j
		mov	bl, 0
		mov	eax, [bp-0BEh]
		neg	eax
		mov	[bp-192h], eax
		mov	eax, [bp-0BAh]
		neg	eax

loc_1C20F:				; CODE XREF: seg027:loc_1C1F6j
		mov	[bp-18Eh], eax
		mov	[bp-1AAh], bl
		mov	eax, [bp-40h]
		add	eax, [bp-0AEh]
		sar	eax, 8
		mov	[bp-1CEh], ax
		mov	eax, [bp-3Ch]
		add	eax, [bp-0AAh]
		sar	eax, 8
		mov	[bp-1CCh], ax
		mov	eax, [bp-40h]
		add	eax, [bp-0B6h]
		sar	eax, 8
		mov	[bp-1B2h], ax
		mov	eax, [bp-3Ch]
		add	eax, [bp-0B2h]
		sar	eax, 8
		mov	[bp-1B0h], ax
		push	0
		lea	ax, [bp-17Ah]
		push	ax
		push	ss
		lea	ax, [bp-1D0h]
		push	ax
		call	UI_ComputeScaledRect
		add	sp, 8
		push	1
		lea	ax, [bp-1EAh]
		push	ax
		lea	ax, [bp-44h]
		push	ax
		lea	ax, [bp-1A8h]
		push	ax
		push	ss
		lea	ax, [bp-1D0h]
		push	ax
		call	UI_ComputeAnchoredRect
		add	sp, 0Ch
		mov	eax, [bp-40h]

loc_1C293:
		sub	eax, [bp-0AEh]
		sar	eax, 8
		mov	[bp-1CEh], ax
		mov	eax, [bp-3Ch]
		sub	eax, [bp-0AAh]
		sar	eax, 8
		mov	[bp-1CCh], ax
		mov	eax, [bp-40h]
		sub	eax, [bp-0B6h]
		sar	eax, 8
		mov	[bp-1B2h], ax

loc_1C2C2:
		mov	eax, [bp-3Ch]
		sub	eax, [bp-0B2h]
		sar	eax, 8
		mov	[bp-1B0h], ax
		push	0
		lea	ax, [bp-17Ah]
		push	ax
		push	ss
		lea	ax, [bp-1D0h]
		push	ax
		call	UI_ComputeScaledRect
		add	sp, 8
		push	1
		lea	ax, [bp-1EAh]
		push	ax
		lea	ax, [bp-44h]
		push	ax
		lea	ax, [bp-1A8h]
		push	ax
		push	ss
		lea	ax, [bp-1D0h]
		push	ax

loc_1C2FE:
		call	UI_ComputeAnchoredRect

loc_1C303:
		add	sp, 0Ch

loc_1C306:
		mov	byte ptr [bp-1AAh], 0
		mov	eax, [bp-40h]
		add	eax, [bp-0B6h]
		sar	eax, 8
		mov	[bp-1CEh], ax
		mov	eax, [bp-3Ch]
		add	eax, [bp-0B2h]
		sar	eax, 8
		mov	[bp-1CCh], ax
		mov	eax, [bp-40h]
		add	eax, [bp-0B6h]
		add	eax, [bp-192h]
		sar	eax, 8
		mov	[bp-1B2h], ax
		mov	eax, [bp-3Ch]
		add	eax, [bp-0B2h]
		add	eax, [bp-18Eh]
		sar	eax, 8
		mov	[bp-1B0h], ax
		push	0
		lea	ax, [bp-17Ah]
		push	ax
		push	ss
		lea	ax, [bp-1D0h]
		push	ax
		call	UI_ComputeScaledRect
		add	sp, 8
		push	1
		lea	ax, [bp-1EAh]
		push	ax
		lea	ax, [bp-44h]
		push	ax
		lea	ax, [bp-1A8h]
		push	ax
		push	ss
		lea	ax, [bp-1D0h]
		push	ax
		call	UI_ComputeAnchoredRect
		add	sp, 0Ch
		mov	eax, [bp-40h]
		sub	eax, [bp-0B6h]
		sar	eax, 8
		mov	[bp-1CEh], ax
		mov	eax, [bp-3Ch]
		sub	eax, [bp-0B2h]
		sar	eax, 8
		mov	[bp-1CCh], ax
		mov	eax, [bp-40h]
		sub	eax, [bp-0B6h]
		add	eax, [bp-192h]
		sar	eax, 8
		mov	[bp-1B2h], ax
		mov	eax, [bp-3Ch]
		sub	eax, [bp-0B2h]
		add	eax, [bp-18Eh]
		sar	eax, 8
		mov	[bp-1B0h], ax
		push	0
		lea	ax, [bp-17Ah]
		push	ax
		push	ss
		lea	ax, [bp-1D0h]
		push	ax
		call	UI_ComputeScaledRect
		add	sp, 8
		push	1
		lea	ax, [bp-1EAh]
		push	ax
		lea	ax, [bp-44h]

loc_1C3F9:
		push	ax

loc_1C3FA:
		lea	ax, [bp-1A8h]
		push	ax
		push	ss

loc_1C400:
		lea	ax, [bp-1D0h]
		push	ax
		call	UI_ComputeAnchoredRect
		add	sp, 0Ch
		mov	eax, [bp-40h]
		add	eax, [bp-0C6h]
		sar	eax, 8
		mov	[bp-196h], ax
		mov	eax, [bp-3Ch]
		add	eax, [bp-0C2h]
		sar	eax, 8
		mov	[bp-194h], ax
		mov	ax, si
		mov	bx, 5
		cwd
		idiv	bx
		mov	[bp-198h], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	bx, ax
		mov	al, [bx+0D86h]
		mov	ah, 0
		push	ax
		push	0D9Fh
		lea	ax, [bp-180h]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		lea	ax, [bp-180h]
		push	ax
		lea	ax, [bp-1EAh]
		push	ax
		call	GlyphObject_RenderToWidget_60DFE
		add	sp, 4
		sar	ax, 1
		mov	[bp-19Ah], ax
		mov	ax, [bp-194h]
		sub	ax, [bp-46h]
		push	ax
		mov	ax, [bp-196h]
		sub	ax, [bp-19Ah]

loc_1C481:
		sub	ax, di

loc_1C483:
		push	ax

loc_1C484:
		lea	ax, [bp-1EAh]
		push	ax

loc_1C489:
		call	Widget_ComputeBoundsExtent_60AEB

loc_1C48E:
		add	sp, 6

loc_1C491:
		lea	ax, [bp-180h]
		push	ax
		lea	ax, [bp-1EAh]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		mov	eax, [bp-40h]
		sub	eax, [bp-0C6h]
		sar	eax, 8
		mov	[bp-196h], ax
		mov	eax, [bp-3Ch]
		sub	eax, [bp-0C2h]
		sar	eax, 8
		mov	[bp-194h], ax
		sub	ax, [bp-46h]
		push	ax
		mov	ax, [bp-196h]
		sub	ax, [bp-19Ah]
		sub	ax, di

loc_1C4D3:
		push	ax

loc_1C4D4:
		lea	ax, [bp-1EAh]
		push	ax

loc_1C4D9:
		call	Widget_ComputeBoundsExtent_60AEB

loc_1C4DE:
		add	sp, 6

loc_1C4E1:
		lea	ax, [bp-180h]
		push	ax

loc_1C4E6:
		lea	ax, [bp-1EAh]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_60DD1

loc_1C4F0:
		add	sp, 4

loc_1C4F3:				; CODE XREF: seg027:091Ej
		add	si, 5
		mov	eax, [bp-12Eh]

loc_1C4FB:
		add	[bp-40h], eax

loc_1C4FF:
		mov	eax, [bp-12Ah]

loc_1C504:
		add	[bp-3Ch], eax
		mov	eax, [bp-40h]
		mov	[bp-18Ah], eax
		mov	eax, [bp-3Ch]
		mov	[bp-186h], eax
		inc	word ptr [bp-182h]

loc_1C51E:				; CODE XREF: seg027:0857j
		les	bx, [bp+6]
		mov	al, es:[bx+0Eh]
		cbw
		cmp	ax, [bp-182h]
		jle	short loc_1C52F
		jmp	loc_1C11A
; ���������������������������������������������������������������������������

loc_1C52F:				; CODE XREF: seg027:0C6Aj
		lea	ax, [bp-1E8h]
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx

loc_1C53A:				; CODE XREF: seg027:0137j
		push	0
		push	ss
		lea	ax, [bp-1D0h]
		push	ax
		call	VROOMM_StubThunk_6B4E4
		add	sp, 6
		lea	ax, [bp-1A8h]
		push	ax

loc_1C54F:
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		pop	di
		pop	si
		leave
		retf
seg027		ends
