seg164		segment	byte public 'CODE' use16
		assume cs:seg164
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing
byte_3F910	db 5 dup(0), 2Eh, 80h, 3Eh, 3 dup(0), 74h, 1, 0CBh, 2Eh
					; DATA XREF: seg164:00C2w seg170:05FEo ...
		db 0C6h, 6, 2 dup(0), 1, 2Eh, 0A3h, 1, 0, 9Ch, 1Eh, 0B8h
		dw seg dseg
; ���������������������������������������������������������������������������
		mov	ds, ax
		cli
		mov	word_47CF2, ss
		mov	word_47CF0, sp
		mov	ss, ax
		mov	ax, 4CD4h
		inc	ax
		inc	ax
		and	ax, 0FFFEh
		add	ax, 400h
		mov	sp, ax
		mov	ax, word ptr cs:byte_3F910+1
		push	eax
		push	ebx
		push	ecx
		push	edx
		push	edi
		push	esi
		push	ds
		push	es
		push	fs
		push	gs
		sti
		push	dx
		push	cx
		push	bx
		mov	ax, word ptr cs:byte_3F910+1
		push	ax
		mov	bx, ax
		mov	word_497B8, cx
		mov	word_497BA, dx
		mov	word_49822, 1
		mov	si, word_47A96
		dec	si
		js	short loc_3F99F
		shl	si, 1

loc_3F97F:				; CODE XREF: seg164:008Dj
		mov	ax, word ptr cs:byte_3F910+1
		and	ax, [si+6790h]
		jz	short loc_3F99B
		shl	si, 1
		mov	word ptr cs:byte_3F910+3, si
		call	dword ptr [si+6780h]
		mov	si, word ptr cs:byte_3F910+3
		shr	si, 1

loc_3F99B:				; CODE XREF: seg164:0077j
		dec	si
		dec	si
		jns	short loc_3F97F

loc_3F99F:				; CODE XREF: seg164:006Bj
		mov	word_49822, 0
		add	sp, 8
		mov	ax, word_47CF4
		cmp	ax, 0FFFFh
		jz	short loc_3F9B6
		mov	word_47CEE, 1

loc_3F9B6:				; CODE XREF: seg164:009Ej
		cli
		pop	gs
		pop	fs
		pop	es
		pop	ds
		pop	esi
		pop	edi
		pop	edx
		pop	ecx
		pop	ebx
		pop	eax
		mov	ss, word_47CF2
		mov	sp, word_47CF0
		pop	ds
		mov	cs:byte_3F910, 0
		popf
		retf
seg164		ends
