seg108		segment	para public 'CODE' use16
		assume cs:seg108
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 74h, 7, 56h, 9Ah, 0B2h, 3, 0, 0, 59h

loc_43839:
		db 5Fh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4383D		proc far
		push	bp
		mov	bp, sp
		mov	al, 17h
		pop	bp
		retf
sub_4383D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43844		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 17h
		pop	bp
		retf
sub_43844		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4384E		proc far

var_52		= dword ptr -52h
var_4A		= dword ptr -4Ah
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4Ah
		push	si
		push	di
		mov	di, [bp+arg_4]
		mov	cx, [bp+arg_6]
		mov	[bp+var_2], di
		mov	bx, cx
		mov	al, [bx+2]
		mov	ah, 0
		and	ax, 6Fh
		cmp	ax, 4Eh
		jnz	short loc_43873
		mov	ax, 1
		jmp	short loc_43875

loc_43873:
		xor	ax, ax

loc_43875:
		or	al, al
		jnz	short loc_4387C
		jmp	loc_43A75

loc_4387C:
		mov	si, cx
		mov	al, [si+51h]
		mov	bx, [bp+var_2]
		cmp	al, [bx+51h]
		jz	short loc_4389E
		mov	al, [bp+arg_8]
		push	ax
		push	cx
		push	di
		push	large [bp+arg_0]
		call	sub_7494F
		add	sp, 0Ah
		jmp	loc_43A87

loc_4389E:
		cmp	si, word_7CADA
		jz	short loc_438A7
		jmp	loc_43A71

loc_438A7:
		mov	[bp+var_3], 1
		mov	bx, [si+52h]
		mov	al, [bp+var_3]
		mov	[bx+20h], al
		mov	byte_776BC, 1
		cmp	[bp+arg_8], 1Fh
		jz	short loc_438C2
		jmp	loc_43A71

loc_438C2:
		mov	bx, [bp+var_2]
		mov	al, [bx+124h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_438D9
		push	bx
		call	sub_74890
		pop	cx
		jmp	loc_43A71

loc_438D9:
		mov	di, [di+121h]
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_26], eax
		mov	eax, [di+4]
		mov	[bp+var_22], eax
		mov	eax, [di+8]
		mov	[bp+var_1E], eax
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		sub	[bp+var_26], eax
		mov	eax, [di+4]
		sub	[bp+var_22], eax
		mov	eax, [di+8]
		sub	[bp+var_1E], eax
		push	large [bp+var_1E]
		push	large [bp+var_22]
		push	large [bp+var_26]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_C], eax
		mov	[bp+var_8], eax
		mov	[bp+var_10], 1400h
		cmp	eax, [bp+var_10]
		jge	short loc_43946
		mov	ax, 1
		jmp	short loc_43948

loc_43946:
		xor	ax, ax

loc_43948:
		or	al, al
		jnz	short loc_4394F
		jmp	loc_43A71

loc_4394F:
		mov	[bp+var_14], 0
		mov	[bp+var_18], 0
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_4A], eax
		mov	eax, [di+4]
		mov	[bp+var_46], eax
		mov	eax, [di+8]
		mov	[bp+var_42], eax
		mov	eax, [bp+var_18]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_4A]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_46]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_46], eax
		mov	eax, [bp+var_42]
		mov	edx, [bp+var_18]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 4
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_32], eax
		mov	eax, [di+4]
		mov	[bp+var_2E], eax
		mov	eax, [di+8]
		mov	[bp+var_2A], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	di, ax
		mov	eax, [di]
		mov	[bp+var_3E], eax
		mov	eax, [di+4]
		mov	[bp+var_3A], eax
		mov	eax, [di+8]
		mov	[bp+var_36], eax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		mov	[bp+var_1A], ax
		les	bx, [si+5Ah]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0
		sub	sp, 4
		mov	eax, [bp+var_14]
		mov	[bp+var_52], eax
		lea	ax, word ptr [bp+var_3E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	[bp+var_1A]
		call	sub_4936E
		add	sp, 0Ah
		mov	byte_78EB8, 1
		mov	byte_78EB6, 1
		mov	byte_78EBA, 1

loc_43A71:
		mov	al, 0
		jmp	short loc_43A87

loc_43A75:
		mov	al, [bp+arg_8]
		push	ax
		push	cx
		push	di
		push	large [bp+arg_0]
		call	sub_7494F
		add	sp, 0Ah

loc_43A87:
		pop	di
		pop	si
		leave
		retf
sub_4384E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43A8B		proc far

var_E		= byte ptr -0Eh
var_C		= word ptr -0Ch
var_A		= byte ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+7Ah]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_43AAF
		push	si
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	sub_736E4
		add	sp, 6

loc_43AAF:
		cmp	word ptr [si+125h], 0
		jz	short loc_43AC4
		push	word ptr [si+125h]
		mov	bx, [si+125h]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		pop	cx

loc_43AC4:
		mov	al, [si+116h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_43AD1
		jmp	loc_43C07

loc_43AD1:
		cmp	byte ptr [si+7Ah], 0
		jz	short loc_43AE8
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	RadioQueue_RegisterMessage
		add	sp, 4
		jmp	short loc_43AF6

loc_43AE8:
		mov	word ptr [si+0F4h], 0
		mov	word ptr [si+0F2h], 0
		mov	al, 0FFh

loc_43AF6:
		mov	[bp+var_2], al
		xor	di, di
		cmp	[bp+var_2], 0FFh
		jz	short loc_43B09
		les	bx, [si+0F2h]
		mov	di, es:[bx+0Dh]

loc_43B09:
		mov	al, [bp+var_2]
		cbw
		sub	ax, 64h
		mov	bx, ax
		cmp	bx, 0Ah
		jbe	short loc_43B1A
		jmp	loc_43C07

loc_43B1A:
		shl	bx, 1
		jmp	cs:off_43C12[bx]	; switch jump

loc_43B21:
		cmp	byte ptr [si+116h], 0
		jz	short loc_43B2E
		mov	[bp+var_A], 5
		jmp	short loc_43B53

loc_43B2E:
		cmp	byte ptr [si+11Ah], 0
		jnz	short loc_43B3B
		mov	[bp+var_A], 2
		jmp	short loc_43B53

loc_43B3B:
		cmp	byte ptr [si+11Ah], 1
		jnz	short loc_43B48
		mov	[bp+var_A], 4
		jmp	short loc_43B53

loc_43B48:
		cmp	byte ptr [si+11Ah], 2
		jnz	short loc_43B53
		mov	[bp+var_A], 4

loc_43B53:
		mov	[bp+var_C], di
		mov	al, [bp+var_A]
		mov	[bp+var_E], al
		cmp	byte ptr [si+7Ah], 0
		jz	short loc_43B78
		push	ax
		push	[bp+var_C]
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	loc_43C07

loc_43B78:
		jmp	loc_43C07

loc_43B7B:
		mov	[bp+var_4], di
		cmp	byte ptr [si+7Ah], 0
		jz	short loc_43B9A
		push	1Dh
		push	[bp+var_4]
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_43C07

loc_43B9A:
		jmp	short loc_43C07

loc_43B9C:
		mov	al, [si+124h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_43BAF
		push	si
		call	sub_74819
		pop	cx
		jmp	short loc_43BB6

loc_43BAF:
		push	si
		call	sub_7481E
		pop	cx

loc_43BB6:
		mov	[bp+var_6], di
		cmp	byte ptr [si+7Ah], 0
		jz	short loc_43BD5
		push	21h
		push	[bp+var_6]
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_43C07

loc_43BD5:
		jmp	short loc_43C07

loc_43BD7:
		mov	[bp+var_8], di
		cmp	byte ptr [si+7Ah], 0
		jz	short loc_43BF6
		push	1Eh
		push	[bp+var_8]
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	RadioQueue_AllocateSlot
		add	sp, 8
		jmp	short loc_43BF6

loc_43BF6:
		push	si
		call	sub_74823
		pop	cx
		push	word ptr [si+125h]
		call	sub_74850
		pop	cx

loc_43C07:
		push	si
		call	sub_44F4D
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_43A8B		endp

; START OF FUNCTION CHUNK FOR sub_43A8B
off_43C12	dw offset loc_43B21
		dw offset loc_43B7B
		dw offset loc_43BD7
		dw offset loc_43C07
		dw offset loc_43C07
		dw offset loc_43C07
		dw offset loc_43C07
		dw offset loc_43C07
		dw offset loc_43C07
		dw offset loc_43C07
		dw offset loc_43B9C
; END OF FUNCTION CHUNK FOR sub_43A8B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43C28		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+125h], 0
		jz	short loc_43C4B
		push	di
		push	word ptr [si+125h]
		mov	bx, [si+125h]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 4

loc_43C4B:
		cmp	word ptr [si+121h], 0
		jz	short loc_43C5F
		push	di
		push	word ptr [si+121h]
		call	sub_36CAA
		add	sp, 4

loc_43C5F:
		push	di
		push	si
		call	sub_36CAA
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_43C28		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43C6D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_43CE8
		mov	word ptr [si], 278Bh
		cmp	word ptr [si+125h], 0
		jz	short loc_43CA8
		cmp	word ptr [si+125h], 0
		jz	short loc_43CA2
		push	3
		push	word ptr [si+125h]
		mov	bx, [si+125h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_43CA2

loc_43CA2:
		mov	word ptr [si+125h], 0

loc_43CA8:
		cmp	word ptr [si+121h], 0
		jz	short loc_43CD0
		cmp	word ptr [si+121h], 0
		jz	short loc_43CCA
		push	3
		push	word ptr [si+121h]
		mov	bx, [si+121h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_43CCA

loc_43CCA:
		mov	word ptr [si+121h], 0

loc_43CD0:
		push	0
		push	si
		call	sub_74963
		add	sp, 4
		test	di, 1
		jz	short loc_43CE8
		push	si
		call	sub_3B2
		pop	cx

loc_43CE8:
		pop	di
		pop	si
		pop	bp
		retf
sub_43C6D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43CEC		proc far
		push	bp
		mov	bp, sp
		pop	bp
sub_43CEC		endp
seg108		ends
