seg210		segment	byte public 'CODE' use16
		assume cs:seg210
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
byte_680EC	db 5 dup(0), 2Eh, 80h, 3Eh, 0Ch, 2 dup(0), 74h,	1, 0CBh
					; DATA XREF: seg210:loc_681AEw
					; seg210:0043r	...
		db 2Eh,	0C6h, 6, 0Ch, 0, 1, 2Eh, 0A3h, 0Dh, 0, 9Ch, 1Eh
		db 0B8h
seg_68107	dw seg seg339
; ���������������������������������������������������������������������������

loc_68109:
		mov	ds, ax
		cli

loc_6810C:
		mov	word_71204, ss
		mov	word_71202, sp

loc_68114:
		mov	ss, ax
		mov	ax, 4156h
		inc	ax
		inc	ax
		and	ax, 0FFFEh
		add	ax, 400h
		mov	sp, ax
		mov	ax, word ptr cs:byte_680EC+1
		push	eax
		push	ebx
		push	ecx
		push	edx
		push	edi
		push	esi

loc_68133:
		push	ds

loc_68134:
		push	es

loc_68135:
		push	fs

loc_68137:
		push	gs
		sti
		push	dx
		push	cx
		push	bx

loc_6813D:
		mov	ax, word ptr cs:byte_680EC+1
		push	ax

loc_68142:
		mov	bx, ax

loc_68144:
		mov	word_72E68, cx
		mov	word_72E6A, dx

loc_6814C:
		mov	word_72ED2, 1
		mov	si, word_711A8
		dec	si
		js	short loc_6817B
		shl	si, 1

loc_6815B:				; CODE XREF: seg210:0099j
		mov	ax, word ptr cs:byte_680EC+1
		and	ax, [si+5DB0h]
		jz	short loc_68177
		shl	si, 1
		mov	word ptr cs:byte_680EC+3, si
		call	dword ptr [si+5DA0h]

loc_68170:
		mov	si, word ptr cs:byte_680EC+3
		shr	si, 1

loc_68177:				; CODE XREF: seg210:0083j
		dec	si
		dec	si
		jns	short loc_6815B

loc_6817B:				; CODE XREF: seg210:0077j
		mov	word_72ED2, 0

loc_68181:
		add	sp, 8

loc_68184:
		mov	ax, word_71206

loc_68187:
		cmp	ax, 0FFFFh
		jz	short loc_68192
		mov	word_71200, 1

loc_68192:				; CODE XREF: seg210:00AAj
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
		mov	ss, word_71204
		mov	sp, word_71202
		pop	ds

loc_681AE:
		mov	cs:byte_680EC, 0
		popf
		retf
seg210		ends
