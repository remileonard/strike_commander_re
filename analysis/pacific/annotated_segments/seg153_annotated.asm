seg153		segment	para public 'CODE' use16
		assume cs:seg153
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65C40		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		movzx	eax, [bp+arg_2]
		or	ax, ax
		jge	short loc_65C71
		sub	ax, 7FFDh
		push	ax
		push	[bp+arg_0]
		add	[bp+arg_0], ax
		sub	[bp+arg_2], ax
		push	cs
		call	near ptr sub_65C40
		add	sp, 4
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_65C40
		add	sp, 4
		jmp	loc_65D75

loc_65C71:
		cmp	ax, 2
		ja	short loc_65C7B
		mov	ax, 1401h
		jmp	short loc_65C8E

loc_65C7B:
		movzx	ebx, [bp+arg_0]
		add	eax, ebx
		test	eax, 0FFFF0000h
		jz	short loc_65C9A
		mov	ax, 1402h

loc_65C8E:
		push	ax
		call	sub_1DDFE
		add	sp, 2
		jmp	loc_65D75

loc_65C9A:
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	word ptr es:0, 0FFFFh
		mov	word ptr es:2, 0
		mov	word ptr es:4, 0
		mov	word ptr es:6, 0
		inc	[bp+arg_0]
		mov	ax, [bp+arg_0]
		mov	bx, [bp+arg_2]
		sub	bx, 2
		add	ax, bx
		mov	es, ax
		mov	ax, [bp+arg_0]
		mov	word ptr es:0, 0FFFFh
		mov	es:2, ax
		mov	word ptr es:4, 1209h
		mov	es, ax
		mov	es:0, bx
		mov	bx, ax
		dec	bx
		mov	es:2, bx
		mov	es, ax
		cmp	word_7AE7A, 0
		jnz	short loc_65D05
		mov	word_7AE7A, ax
		mov	es:4, ax
		mov	es:6, ax
		jmp	short loc_65D53

loc_65D05:
		mov	bx, word_7AE7A
		mov	fs, bx
		mov	dx, fs
		mov	cx, es:0
		cmp	cx, fs:0
		jnb	short loc_65D1F
		mov	word_7AE7A, es
		jmp	short loc_65D31

loc_65D1F:
		mov	fs, fs:6
		mov	ax, fs
		cmp	ax, dx
		jz	short loc_65D31
		cmp	cx, fs:0
		ja	short loc_65D1F

loc_65D31:
		mov	bx, fs:4
		mov	fs, bx
		mov	es:6, bx
		mov	bx, fs:4
		mov	es:4, bx
		mov	gs, bx
		mov	fs:4, es
		mov	gs:6, es

loc_65D53:
		mov	ax, [bp+arg_0]
		dec	ax
		cmp	word_7AE7D, 0
		jnz	short loc_65D63
		mov	word_7AE7D, ax
		jmp	short loc_65D72

loc_65D63:
		cmp	word_7AE7F, 0
		jnz	short loc_65D6F
		mov	word_7AE7F, ax
		jmp	short loc_65D72

loc_65D6F:
		mov	word_7AE81, ax

loc_65D72:
		mov	ax, 1

loc_65D75:
		leave
		retf
sub_65C40		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65D77		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		enter	0, 0
		push	si
		push	di
		mov	di, [bp+arg_6]
		xor	si, si
		or	di, di
		jnz	short loc_65D9B
		push	1
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_65D77
		add	sp, 8
		or	dx, dx
		jnz	loc_65EAF

loc_65D9B:
		pushf

loc_65D9C:
		cmp	byte_7AE83, 0
		jnz	short loc_65D9C
		cli
		cmp	byte_7AE83, 0
		jz	short loc_65DAE
		popf
		jmp	short loc_65D9B

loc_65DAE:
		mov	si, 1
		mov	byte_7AE83, 1
		popf
		mov	eax, [bp+arg_0]
		or	eax, eax
		jz	loc_65E57
		add	eax, 13h
		shr	eax, 4
		or	ax, ax
		jle	loc_65E61
		mov	bx, word_7AE7A
		or	bx, bx
		jz	loc_65E5C
		mov	es, bx
		mov	dx, bx

loc_65DDE:
		or	di, di
		jz	short loc_65DFE
		jl	short loc_65DF2
		cmp	bx, word_7684C
		jbe	short loc_65DFE
		cmp	bx, 0A000h
		jb	short loc_65E07
		jmp	short loc_65DFE

loc_65DF2:
		cmp	bx, 0A000h
		jnb	short loc_65E07
		cmp	bx, word_7684C
		jbe	short loc_65E07

loc_65DFE:
		mov	cx, es:0
		sub	cx, ax
		jge	short loc_65E17

loc_65E07:
		mov	bx, es:6
		mov	es, bx
		cmp	dx, bx
		jnz	short loc_65DDE
		mov	ax, 1403h
		jmp	short loc_65E64

loc_65E17:
		or	cx, cx
		jnz	short loc_65E7E
		mov	dx, es:4
		cmp	bx, dx
		jnz	short loc_65E2C
		mov	word_7AE7A, 0
		jmp	short loc_65E4E

loc_65E2C:
		cmp	bx, word_7AE7A
		jnz	short loc_65E3B
		mov	bx, es:6
		mov	word_7AE7A, bx

loc_65E3B:
		mov	fs, dx
		mov	bx, es:6
		mov	fs:6, bx
		mov	fs, bx
		mov	fs:4, dx

loc_65E4E:
		neg	word ptr es:0
		mov	dx, es
		jmp	short loc_65EAC

loc_65E57:
		mov	ax, 1404h
		jmp	short loc_65E64

loc_65E5C:
		mov	ax, 1406h
		jmp	short loc_65E64

loc_65E61:
		mov	ax, 1405h

loc_65E64:
		cmp	[bp+arg_4], 0
		jz	short loc_65E78
		mov	byte_7AE83, 0
		push	ax
		call	sub_1DDFE
		add	sp, 2

loc_65E78:
		xor	dx, dx
		xor	ax, ax
		jmp	short loc_65EAF

loc_65E7E:
		mov	es:0, cx
		push	ax
		push	bx
		push	cx
		push	es
		push	cs
		call	near ptr sub_66065
		pop	cx
		pop	cx
		pop	bx
		pop	ax
		add	cx, bx
		mov	es, cx
		mov	es:0, ax
		neg	word ptr es:0
		mov	es:2, bx
		mov	dx, cx
		add	cx, ax
		mov	es, cx
		mov	es:2, dx

loc_65EAC:
		mov	ax, 4

loc_65EAF:
		or	si, si
		jz	short loc_65EB8
		mov	byte_7AE83, 0

loc_65EB8:
		pop	di
		pop	si
		leave
		retf
sub_65D77		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65EBC		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	si
		xor	si, si

loc_65EC3:
		pushf

loc_65EC4:
		cmp	byte_7AE83, 0
		jnz	short loc_65EC4
		cli
		cmp	byte_7AE83, 0
		jz	short loc_65ED6
		popf
		jmp	short loc_65EC3

loc_65ED6:
		mov	byte_7AE83, 1
		mov	si, 1
		popf
		push	[bp+arg_0]
		push	cs
		call	near ptr sub_65FA0
		add	sp, 2
		or	ax, ax
		jz	loc_65F94
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	ax, es:2
		or	ax, ax
		jz	short loc_65F26
		mov	fs, ax
		cmp	word ptr fs:0, 0
		jle	short loc_65F26
		mov	ax, es:0
		sub	fs:0, ax
		mov	ax, fs
		add	ax, fs:0
		mov	es, ax
		mov	es:2, fs
		push	fs
		push	cs
		call	near ptr sub_66065
		pop	cx
		jmp	short loc_65F94

loc_65F26:
		mov	ax, [bp+arg_0]
		mov	es, ax
		neg	word ptr es:0
		mov	es, ax
		cmp	word_7AE7A, 0
		jnz	short loc_65F46
		mov	word_7AE7A, ax
		mov	es:4, ax
		mov	es:6, ax
		jmp	short loc_65F94

loc_65F46:
		mov	bx, word_7AE7A
		mov	fs, bx
		mov	dx, fs
		mov	cx, es:0
		cmp	cx, fs:0
		jnb	short loc_65F60
		mov	word_7AE7A, es
		jmp	short loc_65F72

loc_65F60:
		mov	fs, fs:6
		mov	ax, fs
		cmp	ax, dx
		jz	short loc_65F72
		cmp	cx, fs:0
		ja	short loc_65F60

loc_65F72:
		mov	bx, fs:4
		mov	fs, bx
		mov	es:6, bx
		mov	bx, fs:4
		mov	es:4, bx
		mov	gs, bx
		mov	fs:4, es
		mov	gs:6, es

loc_65F94:
		or	si, si
		jz	short loc_65F9D
		mov	byte_7AE83, 0

loc_65F9D:
		pop	si
		leave
		retf
sub_65EBC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65FA0		proc far

arg_0		= word ptr  6

		enter	0, 0
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	bx, es:0
		or	bx, bx
		jge	short loc_65FDB
		neg	bx
		add	bx, ax
		mov	fs, bx
		cmp	fs:2, ax
		jnz	short loc_65FDB
		mov	bx, es:2
		or	bx, bx
		jz	short loc_65FF4
		mov	fs, bx
		mov	cx, fs:0
		or	cx, cx
		jge	short loc_65FD5
		neg	cx

loc_65FD5:
		add	bx, cx
		cmp	ax, bx
		jz	short loc_65FF4

loc_65FDB:
		mov	byte_7AE83, 0
		push	cs
		call	near ptr sub_661A6
		mov	ax, 1409h
		push	ax
		call	sub_1DDFE
		add	sp, 2
		xor	ax, ax
		jmp	short loc_66063

loc_65FF4:
		mov	ax, [bp+arg_0]
		mov	es, ax
		mov	bx, es:0
		neg	bx
		mov	dx, bx
		add	dx, ax
		mov	fs, dx
		mov	cx, fs:0
		or	cx, cx
		jle	short loc_66060
		add	bx, cx
		mov	es:0, bx
		neg	word ptr es:0
		mov	ax, es
		add	bx, ax
		mov	fs, bx
		mov	fs:2, es
		mov	ax, dx
		mov	es, ax
		cmp	es:4, ax
		jnz	short loc_66039
		mov	word_7AE7A, 0
		jmp	short loc_66060

loc_66039:
		mov	dx, word_7AE7A
		cmp	ax, dx
		jnz	short loc_66048
		mov	ax, es:6
		mov	word_7AE7A, ax

loc_66048:
		mov	bx, es:4
		mov	cx, es:6
		mov	es, bx
		mov	es:6, cx
		mov	es, cx
		mov	es:4, bx

loc_66060:
		mov	ax, 1

loc_66063:
		leave
		retf
sub_65FA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66065		proc far

arg_0		= word ptr  6

		enter	0, 0
		push	di
		push	si
		mov	dx, word_7AE7A
		mov	bx, [bp+arg_0]
		mov	es, bx
		mov	cx, es:0
		mov	di, es:6
		mov	fs, di
		cmp	di, es:4
		jnz	short loc_660A1
		cmp	di, bx
		jz	loc_66166
		mov	word_7AE7A, bx
		cmp	cx, fs:0
		jbe	loc_66166
		mov	word_7AE7A, di
		jmp	loc_66166

loc_660A1:
		cmp	cx, fs:0
		jbe	short loc_660AC
		cmp	di, dx
		jnz	short loc_660C2

loc_660AC:
		mov	di, es:4
		mov	fs, di
		cmp	cx, fs:0
		jnb	loc_66166
		cmp	bx, dx
		jz	loc_66166

loc_660C2:
		push	di
		push	bx
		push	cx
		push	es
		push	fs
		mov	ax, bx
		mov	es, ax
		cmp	es:4, ax
		jnz	short loc_660DB
		mov	word_7AE7A, 0
		jmp	short loc_66102

loc_660DB:
		mov	dx, word_7AE7A
		cmp	ax, dx
		jnz	short loc_660EA
		mov	ax, es:6
		mov	word_7AE7A, ax

loc_660EA:
		mov	bx, es:4
		mov	cx, es:6
		mov	es, bx
		mov	es:6, cx
		mov	es, cx
		mov	es:4, bx

loc_66102:
		pop	fs
		pop	es
		pop	cx
		pop	bx
		pop	di
		mov	dx, word_7AE7A
		cmp	es:4, di
		jz	short loc_66129

loc_66113:
		mov	si, di
		mov	di, fs:6
		mov	fs, di
		cmp	di, dx
		jz	short loc_66141
		cmp	fs:0, cx
		jnb	short loc_66141
		jmp	short loc_66113

loc_66129:
		mov	si, di
		mov	di, fs:4
		mov	fs, di
		cmp	si, dx
		jz	short loc_6613D
		cmp	fs:0, cx
		ja	short loc_66129

loc_6613D:
		xchg	di, si
		mov	fs, di

loc_66141:
		mov	gs, si
		mov	es:4, si
		mov	es:6, di
		mov	gs:6, bx
		mov	fs:4, bx
		mov	di, dx
		mov	fs, di
		cmp	cx, fs:0
		jnb	short loc_66166
		mov	word_7AE7A, bx

loc_66166:
		pop	si
		pop	di
		leave
		retf
sub_66065		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; DisplayCache_Helper_2C859 (sub_2C859 de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à DisplayCache_Helper_5D76B (sub_5D76B de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée directement par
; UIScreen_RenderGraphVGA (sub_509EE, seg113) et TextRenderer_ReleaseCachedGlyph (sub_5CA9E,
; seg132).
; ==============================================================================================
DisplayCache_Helper_6616A		proc far
		enter	2, 0
		xor	cx, cx
		xor	eax, eax
		mov	bx, word_7AE7A
		mov	es, bx
		mov	dx, bx

loc_6617B:
		inc	cx
		cmp	cx, 3E8h
		jb	short loc_66187
		xor	eax, eax
		jmp	short loc_6619F

loc_66187:
		mov	bx, es:6
		mov	es, bx
		add	ax, es:0
		cmp	bx, dx
		jnz	short loc_6617B
		shl	eax, 4
		sub	eax, 4

loc_6619F:
		shld	edx, eax, 10h
		leave
		retf
DisplayCache_Helper_6616A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_661A6		proc far

var_2		= word ptr -2

		enter	2, 0
		mov	[bp+var_2], 0
		mov	bx, word_7AE7D
		or	bx, bx
		jz	loc_66266

loc_661B9:
		mov	es, bx
		xor	ax, ax
		or	es:2, ax
		jnz	loc_6625A

loc_661C6:
		mov	ax, bx
		mov	cx, es:0
		or	cx, cx
		jge	short loc_661D3
		neg	cx

loc_661D3:
		add	ax, cx
		mov	fs, ax
		cmp	word ptr fs:0, 0FFFFh
		jnz	short loc_661E8
		cmp	word ptr fs:4, 1209h
		jz	short loc_66233

loc_661E8:
		cmp	fs:2, bx
		jz	short loc_661F1
		jmp	short loc_6625A

loc_661F1:
		cmp	cx, es:0
		jnz	short loc_6621E
		mov	gs, es:6
		cmp	bx, gs:4
		jz	short loc_66212

loc_66204:
		cmp	word ptr gs:0, 0
		jge	short loc_6625A
		mov	ax, gs
		mov	es, ax
		jmp	short loc_6625A

loc_66212:
		mov	gs, es:4
		cmp	bx, gs:6
		jnz	short loc_66204

loc_6621E:
		mov	bx, fs
		mov	es, bx
		cmp	word ptr es:0, 0FFFFh
		jnz	short loc_661C6
		cmp	word ptr es:4, 1209h
		jnz	short loc_661C6

loc_66233:
		inc	[bp+var_2]
		cmp	[bp+var_2], 2
		ja	short loc_66266
		jz	short loc_6624C
		cmp	word_7AE7F, 0
		jz	short loc_66266
		mov	bx, word_7AE7F
		jmp	loc_661B9

loc_6624C:
		cmp	word_7AE81, 0
		jz	short loc_66266
		mov	bx, word_7AE81
		jmp	loc_661B9

loc_6625A:
		mov	ax, 1407h
		push	ax
		call	sub_1DDFE
		add	sp, 2

loc_66266:
		leave
		retf
sub_661A6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedResourceB_Helper_5D859 (sub_5D859 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée par sub_14279 (proche de
; UIScreen_Construct, seg114).
; ==============================================================================================
PagedResourceB_Helper_66268		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= byte ptr  6

		enter	0Ch, 0
		push	di
		mov	al, [bp+arg_0]
		shl	ax, 8
		mov	al, [bp+arg_0]
		push	ax
		shl	eax, 10h
		pop	ax
		mov	bx, word_7AE7A
		mov	es, bx

loc_66282:
		mov	bx, es:6
		mov	es, bx
		movzx	ecx, word ptr es:0
		shl	ecx, 4
		mov	[bp+var_4], ecx
		mov	edx, es:0
		mov	[bp+var_8], edx
		mov	edx, es:4
		mov	[bp+var_C], edx

loc_662AC:
		mov	ecx, [bp+var_4]
		test	ecx, 0FFFF0000h
		jnz	short loc_662C2
		sub	[bp+var_4], ecx
		shr	cx, 2
		jmp	short loc_662CD

loc_662C2:
		sub	[bp+var_4], 10000h
		mov	cx, 4000h

loc_662CD:
		xor	di, di
		rep stosd
		mov	dx, es
		add	dx, 1000h
		mov	es, dx
		cmp	[bp+var_4], 0
		jnz	short loc_662AC
		mov	es, bx
		mov	edx, [bp+var_8]
		mov	es:0, edx
		mov	edx, [bp+var_C]
		mov	es:4, edx
		cmp	bx, word_7AE7A
		jnz	short loc_66282
		pop	di
		leave
		retf
PagedResourceB_Helper_66268		endp

; ----------------------------------------------------------------------

sub_66300		proc far
		mov	ah, 48h
		mov	bx, 0FFFFh
		int	21h
		jnb	short loc_66315
		mov	ah, 48h
		int	21h
		jb	short loc_66320
		cmp	ax, word_7684C
		jb	short loc_66320

loc_66315:
		push	bx
		push	ax
		push	cs
		call	near ptr sub_65C40
		add	sp, 4
		jmp	short loc_66322

loc_66320:
		xor	ax, ax

loc_66322:
		retf
sub_66300		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_66323		proc far

arg_0		= dword ptr  6

		enter	0, 0
		cmp	word_7AE7A, 0
		jnz	short loc_66336
		push	cs
		call	near ptr sub_66300
		or	ax, ax
		jz	short loc_66347

loc_66336:
		push	0
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_65D77
		add	sp, 8
		jmp	short loc_6634B

loc_66347:
		xor	ax, ax
		xor	dx, dx

loc_6634B:
		leave
		retf
sub_66323		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6634D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		enter	0, 0
		movzx	edx, [bp+arg_2]
		movzx	eax, [bp+arg_0]
		shl	edx, 4
		add	edx, eax
		shr	edx, 4
		jz	short loc_66370
		push	dx
		push	cs
		call	near ptr sub_65EBC
		add	sp, 2

loc_66370:
		leave
		retf
sub_6634D		endp

; ----------------------------------------------------------------------

sub_66372		proc far
		push	di
		xor	eax, eax
		mov	cx, 3E8h
		mov	bx, word_7AE7A
		or	bx, bx
		jz	short loc_663AB
		mov	di, bx

loc_66383:
		mov	es, bx
		mov	dx, es:0
		cmp	dx, ax
		jbe	short loc_66390
		mov	ax, dx

loc_66390:
		mov	bx, es:6
		cmp	di, bx
		jz	short loc_6639C
		dec	cx
		jnz	short loc_66383

loc_6639C:
		shl	eax, 4
		sub	eax, 4
		shld	edx, eax, 10h
		jmp	short loc_663AF

loc_663AB:
		xor	ax, ax
		xor	dx, dx

loc_663AF:
		pop	di
sub_66372		endp
seg153		ends
