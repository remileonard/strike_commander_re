seg009		segment	para public 'CODE' use16
		assume cs:seg009
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C2h, 10h, 5Eh, 0C9h, 0CBh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5EA8		proc far

var_6C		= word ptr -6Ch
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6Ch
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	ds
		push	offset aShp
		push	ds
		push	offset aSmFont
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_6C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_6C]
		push	ax
		push	[bp+arg_2]
		push	di
		push	64C6h
		call	sub_47B99
		add	sp, 8
		push	0
		push	large 40h
		push	ds
		push	offset unk_489E0
		push	6C30h
		call	FontStyle_ApplyVariantB_3614B
		add	sp, 0Ch
		push	0
		push	large 1000h
		push	0
		push	0
		push	6C30h
		call	FontStyle_ApplyVariantB_3614B
		add	sp, 0Ch
		mov	byte_4F55C, 0
		mov	word_4EAA6, 13Fh
		mov	word_4EAA8, 63h
		push	ds
		push	offset aShp
		push	ds
		push	offset aOptfont
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_6C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 2
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	0
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		mov	si, ax
		mov	word ptr [si+10h], 0
		mov	word ptr [si+12h], 0
		push	2Dh
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[si+14h], ax
		push	ds
		push	offset aShp
		push	ds
		push	offset aConvfont
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_6C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_6C]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_1C+2], dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[bp+var_18], eax
		mov	[bp+var_14], 2
		mov	[bp+var_13], 1
		mov	[bp+var_12], 0
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	60CCh
		call	sub_36C9D
		add	sp, 4
		push	0
		push	[bp+arg_2]
		push	di
		push	si
		push	60E3h
		call	sub_47874
		add	sp, 0Ah
		push	60E3h
		call	sub_6ACB
		add	sp, 2
		mov	al, byte_4EED5
		mov	byte_4EED4, al
		mov	byte_4CA67, 0
		call	Keyboard_DrainBufferBIOS_45C38
		push	0
		call	PagedResourceC_RefreshAndFinalize_35E0F
		add	sp, 2
		cmp	[bp+var_13], 0
		jz	short loc_6033
		cmp	[bp+var_18], 0
		jz	short loc_6033
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_6033

loc_6033:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		cmp	[bp+var_5], 0
		jz	short loc_606B
		cmp	[bp+var_A], 0
		jz	short loc_606B
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_606B

loc_606B:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf
sub_5EA8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6083		proc far
		push	bp
		mov	bp, sp
		push	60CCh
		call	GlyphObject_AllocateBuffer_36D18
		add	sp, 2
		mov	word_4EAC3, 1E4h
		xor	ax, ax
		mov	word_4EAC7, ax
		mov	word_4EAC5, ax
		mov	word_4EAC3, 1E8h
		push	61D3h
		call	sub_1109C
		add	sp, 2
		push	seg seg009
		push	offset sub_6128
		push	1
		push	4
		push	2
		push	6357h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg009
		push	offset sub_6152
		push	1
		push	8
		push	1Ah
		push	636Fh
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	byte_4EE1F, 0
		mov	byte_4EE20, 0
		mov	byte_4EE34, 0
		mov	byte_4EE48, 0
		pop	bp
		retf
sub_6083		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60F4		proc far
		push	bp
		mov	bp, sp
		mov	word_4EAC3, 1E8h
		push	60E3h
		call	sub_6276
		add	sp, 2
		mov	word_4EAC3, 1E4h
		push	60E3h
		call	sub_36702
		add	sp, 2
		push	2
		push	60CCh
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		pop	bp
		retf
sub_60F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6128		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6143
		push	2
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_614A

loc_6143:
		mov	byte ptr [si+1], 0
		mov	byte ptr [si], 0FFh

loc_614A:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6128		endp

; START OF FUNCTION CHUNK FOR sub_6128
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_6128

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6152		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_616D
		push	1Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_616D

loc_616D:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_6152		endp

; START OF FUNCTION CHUNK FOR sub_6152
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_6152

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6175		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_61A0
		mov	word ptr [si], 1E4h
		push	si
		call	sub_36702
		add	sp, 2
		test	di, 1
		jz	short loc_61A0
		push	si
		call	sub_39C
		add	sp, 2

loc_61A0:
		pop	di
		pop	si
		pop	bp
		retf
sub_6175		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61A4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_61DC
		mov	word ptr [si], 1E8h
		push	si
		call	sub_6276
		add	sp, 2
		mov	word ptr [si], 1E4h
		push	si
		call	sub_36702
		add	sp, 2
		test	di, 1
		jz	short loc_61DC
		push	si
		call	sub_39C
		add	sp, 2

loc_61DC:
		pop	di
		pop	si
		pop	bp
		retf
sub_61A4		endp
seg009		ends
