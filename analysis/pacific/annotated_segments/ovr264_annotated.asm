ovr264		segment	para public 'OVERLAY' use16
		assume cs:ovr264
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A0BD0		proc far

var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 26h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		push	0
		push	large 594C4F50h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_A0BFA
		jmp	loc_A0C9B

loc_A0BFA:
		mov	[bp+var_6], si
		push	1
		push	0
		push	2
		push	large 9Ch
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_8], dx
		mov	[bp+var_A], ax
		or	ax, dx
		jz	short loc_A0C92
		les	bx, [bp+var_A]
		mov	word ptr es:[bx], 112Ch
		mov	word ptr es:[bx], 11C0h
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 2
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		mov	dword ptr es:[bx+12h], 0
		mov	byte ptr es:[bx+16h], 2
		mov	byte ptr es:[bx+17h], 0
		mov	dword ptr es:[bx+18h], 0
		xor	ax, ax
		mov	es:[bx+7Eh], ax
		mov	es:[bx+7Ch], ax
		xor	eax, eax
		mov	es:[bx+84h], eax
		mov	es:[bx+80h], eax
		push	[bp+var_6]
		push	dx
		push	bx
		call	sub_73BB5
		add	sp, 6
		mov	dx, [bp+var_8]
		mov	ax, [bp+var_A]
		jmp	loc_A0EFF

loc_A0C92:
		mov	dx, [bp+var_8]
		mov	ax, [bp+var_A]
		jmp	loc_A0EFF

loc_A0C9B:
		push	0
		push	large 54414C46h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_A0D19
		mov	[bp+var_C], si
		push	1
		push	0
		push	2
		push	large 17h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		or	ax, dx
		jz	short loc_A0D10
		les	bx, [bp+var_10]
		mov	word ptr es:[bx], 112Ch
		mov	word ptr es:[bx], 11B4h
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 2
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		push	[bp+var_C]
		push	dx
		push	bx
		call	sub_73D2A
		add	sp, 6
		mov	dx, [bp+var_E]
		mov	ax, [bp+var_10]

loc_A0D0D:
		jmp	loc_A0EFF

loc_A0D10:
		mov	dx, [bp+var_E]
		mov	ax, [bp+var_10]
		jmp	loc_A0EFF

loc_A0D19:
		push	0
		push	large 54534944h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_A0D9F
		mov	[bp+var_12], si
		push	1
		push	0
		push	2
		push	large 17h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		or	ax, dx
		jz	short loc_A0D96
		les	bx, [bp+var_16]
		mov	word ptr es:[bx], 112Ch
		mov	word ptr es:[bx], 11B4h
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 2
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		push	[bp+var_12]
		push	dx
		push	bx
		call	sub_73D2A
		add	sp, 6
		les	bx, [bp+var_16]
		mov	word ptr es:[bx], 11A8h
		mov	dx, [bp+var_14]
		mov	ax, [bp+var_16]
		jmp	loc_A0EFF

loc_A0D96:
		mov	dx, [bp+var_14]
		mov	ax, [bp+var_16]
		jmp	loc_A0EFF

loc_A0D9F:
		push	0
		push	large 4D494E41h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_A0E31
		mov	[bp+var_18], si
		push	1
		push	0
		push	2
		push	large 22h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_1A], dx
		mov	[bp+var_1C], ax
		or	ax, dx
		jz	short loc_A0E28
		les	bx, [bp+var_1C]
		mov	word ptr es:[bx], 112Ch
		mov	word ptr es:[bx], 11B4h
		mov	dword ptr es:[bx+8], 0
		mov	byte ptr es:[bx+0Ch], 2
		mov	byte ptr es:[bx+0Dh], 0
		mov	dword ptr es:[bx+0Eh], 0
		push	dx
		push	bx
		call	Descriptor_ConstructDefaultScale
		add	sp, 4
		les	bx, [bp+var_1C]
		mov	word ptr es:[bx], 119Ch
		push	[bp+var_18]
		push	[bp+var_1A]
		push	bx
		call	sub_73D50
		add	sp, 6
		mov	dx, [bp+var_1A]
		mov	ax, [bp+var_1C]
		jmp	loc_A0EFF

loc_A0E28:
		mov	dx, [bp+var_1A]
		mov	ax, [bp+var_1C]
		jmp	loc_A0EFF

loc_A0E31:
		push	0
		push	large 52435254h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_A0EB8
		mov	[bp+var_1E], si
		push	1
		push	0
		push	2
		push	large 6Dh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_20], dx
		mov	[bp+var_22], ax
		or	ax, dx
		jz	short loc_A0EB0
		les	bx, [bp+var_22]
		mov	word ptr es:[bx], 112Ch
		mov	word ptr es:[bx], 1188h
		mov	word ptr es:[bx+56h], 107Ch
		mov	ax, [bp+var_22]
		add	ax, 56h
		push	dx
		push	ax
		call	sub_23ED5
		add	sp, 4
		les	bx, [bp+var_22]
		mov	word ptr es:[bx+56h], 1138h
		mov	word ptr es:[bx+56h], 1160h
		push	[bp+var_1E]
		push	[bp+var_20]
		push	bx
		call	sub_75095
		add	sp, 6
		mov	dx, [bp+var_20]
		mov	ax, [bp+var_22]
		jmp	short loc_A0EFF

loc_A0EB0:
		mov	dx, [bp+var_20]
		mov	ax, [bp+var_22]
		jmp	short loc_A0EFF

loc_A0EB8:
		push	0
		push	large 454E4F4Eh
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jz	short loc_A0F05
		push	1
		push	0
		push	2
		push	large 2
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_24], dx
		mov	[bp+var_26], ax
		or	ax, dx
		jz	short loc_A0EF9
		les	bx, [bp+var_26]
		mov	word ptr es:[bx], 112Ch
		mov	ax, [bp+var_26]
		jmp	loc_A0D0D

loc_A0EF9:
		mov	dx, [bp+var_24]
		mov	ax, [bp+var_26]

loc_A0EFF:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_A0F05:
		cmp	[bp+var_4], 0
		jnz	short loc_A0F16
		push	6002h
		call	sub_1DDFE
		jmp	short loc_A0F1C

loc_A0F16:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E

loc_A0F1C:
		pop	cx
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
sub_A0BD0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Model_LoadAppearance_94A86 (sub_94A86 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LECTEUR DE
; L'APPARENCE 3D (ex-MissionText_LoadSubtitleWithString, aucun rapport avec du texte) : FORM
; APPR, avec soit un chunk FILE (apparence dans un autre fichier), soit FORM POLY (INFO, AINF,
; VERT, FORM TRIS/VTRI, FORM LINS/VLIN, FORM SPRS/VSPR, FORM TXMS…) via
; MissionText_LoadSubtitleRecordB_94710. Appelé par IFF_LoadModelMain au niveau REAL (après
; OBJT) et pour le FORM DAPR de la classe DURD.
; ==============================================================================================
Model_LoadAppearance_A0F26		proc far

var_B8		= word ptr -0B8h
var_5B		= dword ptr -5Bh
var_57		= dword ptr -57h
var_53		= dword ptr -53h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B8h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		push	0
		push	large 52505041h
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_A0F51
		jmp	loc_A1035

loc_A0F51:
		push	0
		push	large 454C4946h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_A0F69
		jmp	loc_A1022

loc_A0F69:
		mov	[bp+var_10], si
		push	[bp+var_10]
		lea	ax, [bp+var_E]
		push	ax
		call	String_ConstructFromPtrLen
		add	sp, 4
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_B8], 508h
		mov	[bp+var_57], 100h
		mov	[bp+var_5B], 0
		mov	[bp+var_B8], 520h
		mov	[bp+var_3C], 0
		xor	ax, ax
		mov	[bp+var_3E], ax
		movsx	eax, ax
		mov	[bp+var_53], eax
		push	1
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_B8]
		push	ax
		mov	bx, [bp+var_B8]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	dword ptr [si+6Dh], 52505041h
		jnz	short loc_A0FD8
		mov	ax, 1
		jmp	short loc_A0FDA

loc_A0FD8:
		xor	ax, ax

loc_A0FDA:
		or	ax, ax
		jz	short loc_A0FF7
		push	si
		call	sub_6DC9A
		pop	cx
		lea	ax, [bp+var_B8]
		push	ax
		push	cs
		call	near ptr sub_A0BD0
		pop	cx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		jmp	short loc_A1000

loc_A0FF7:
		push	6003h
		call	sub_1DDFE
		pop	cx

loc_A1000:
		mov	[bp+var_B8], 520h
		lea	ax, [bp+var_B8]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_B8]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		jmp	short loc_A102E

loc_A1022:
		push	si
		push	cs
		call	near ptr sub_A0BD0
		pop	cx
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_A102E:
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_A1035:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
Model_LoadAppearance_A0F26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionText_ReleaseWidgetLabel_94B9E (sub_94B9E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle Widget_DestructWithLabel et Memory_TypedFree_5C7B6.
; ==============================================================================================
MissionText_ReleaseWidgetLabel_A103E		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_A1080
		push	0
		push	large [bp+arg_0]
		call	Widget_DestructWithLabel
		add	sp, 6
		test	si, 1
		jz	short loc_A1080
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A1080

loc_A1080:
		pop	si
		leave
		retf
MissionText_ReleaseWidgetLabel_A103E		endp
ovr264		ends
