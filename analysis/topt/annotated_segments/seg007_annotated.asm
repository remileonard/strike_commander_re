seg007		segment	para public 'CODE' use16
		assume cs:seg007
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 2, 68h, 52h, 60h, 9Ah, 1Ah, 3, 0D9h, 40h, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_582E		proc far
		push	bp
		mov	bp, sp
		push	2
		push	60B0h
		push	1B0h
		call	ConvData_LoadByName_10C87
		add	sp, 6
		xor	eax, eax
		shld	edx, eax, 10h
		pop	bp
		retf
sub_582E		endp

; START OF FUNCTION CHUNK FOR sub_582E
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_582E

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_584D		proc far
		push	bp
		mov	bp, sp
		push	2
		push	60B0h
		push	33h
		push	word_4EAA4
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	2
		push	60BAh
		push	7
		push	word_4EAA4
		call	Pak_LoadEntry_10D03
		add	sp, 8
		xor	eax, eax
		shld	edx, eax, 10h
		pop	bp
		retf
sub_584D		endp

; START OF FUNCTION CHUNK FOR sub_584D
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_584D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5882		proc far
		push	bp
		mov	bp, sp
		mov	dword_4EA90, 0
		mov	byte_4EA94, 2
		mov	byte_4EA95, 0
		mov	dword_4EA96, 0
		mov	dword_4EA9A, 0
		mov	byte_4EA9E, 2
		mov	byte_4EA9F, 0
		mov	dword_4EAA0, 0
		pop	bp
		retf
sub_5882		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_58BF		proc far
		push	bp
		mov	bp, sp
		cmp	byte_4EA9F, 0
		jz	short loc_58E7
		cmp	dword_4EA9A, 0
		jz	short loc_58E7
		push	0
		mov	al, byte_4EA9E
		push	ax
		push	60BAh
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_58E7

loc_58E7:
		mov	dword_4EA9A, 0
		mov	byte_4EA9F, 0
		mov	dword_4EAA0, 0
		cmp	byte_4EA95, 0
		jz	short loc_5923
		cmp	dword_4EA90, 0
		jz	short loc_5923
		push	0
		mov	al, byte_4EA94
		push	ax
		push	60B0h
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5923

loc_5923:
		mov	dword_4EA90, 0
sub_58BF		endp

; START OF FUNCTION CHUNK FOR sub_58BF
		db 0C6h
		push	es
		mov	ch, 60h
; END OF FUNCTION CHUNK FOR sub_58BF
seg007		ends
