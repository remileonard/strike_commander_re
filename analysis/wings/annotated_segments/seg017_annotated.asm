seg017		segment	para public 'CODE' use16
		assume cs:seg017
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0F7h, 0B8h, 0C2h, 0, 0E9h, 22h, 0F7h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9D47		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	ax, 150Bh
		jnz	short loc_9D6A
		call	sub_47E06
		push	6A1h
		call	CRT_Msg_NullPtrAssign
		pop	cx
		push	1
		call	CRT_Exit
		pop	cx
		jmp	short loc_9D76

loc_9D6A:
		push	ax
		push	4065h
		nop
		push	cs
		call	near ptr sub_9D78
		add	sp, 4

loc_9D76:
		pop	bp
		retf
sub_9D47		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9D78		proc far

var_102		= word ptr -102h
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 102h
		mov	dx, [bp+arg_0]
		cmp	byte_5DDB0, 0
		jnz	short loc_9DC8
		mov	byte_5DDB0, 1
		lea	ax, [bp+var_102]
		cmp	ax, dx
		jz	short loc_9DAB
		lea	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		lea	ax, [bp+var_102]
		push	ax
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_9DAB:
		call	sub_47E06
		lea	ax, [bp+var_102]
		push	ax
		push	6C9h
		call	CRT_Msg_NullPtrAssign
		add	sp, 4
		push	1
		call	CRT_Exit
		pop	cx

loc_9DC8:
		leave
		retf
sub_9D78		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9DCA		proc far

var_66		= word ptr -66h
var_16		= word ptr -16h
var_C		= word ptr -0Ch
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		push	di
		mov	di, [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_A0D8
		lea	ax, [bp+var_66]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0EC
		pop	cx
		push	ds
		push	offset aShp_3
		push	ds
		push	offset aSmFont
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_66]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		nop
		push	cs
		call	near ptr sub_A12D
		pop	cx
		push	ax
		push	[bp+arg_2]
		push	di
		push	605Ah
		call	sub_58B59
		add	sp, 8
		push	668Ch
		call	CRT_DisplayCalibrationMessage_3D549
		pop	cx
		push	0
		push	605Fh
		call	sub_58BC4
		add	sp, 4
		push	0
		push	large 100h
		push	ds
		push	offset unk_59D20
		push	67CCh
		call	FontStyle_ApplyVariantB_48166
		add	sp, 0Ch
		push	0
		push	large 1000h
		push	large 0
		push	67CCh
		call	FontStyle_ApplyVariantB_48166
		add	sp, 0Ch
		mov	byte_603DE, 0
		mov	word_5F8DE, 13Fh
		mov	word_5F8E0, 63h
		push	ds
		push	offset aShp_3
		push	ds
		push	offset aOptfont
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_66]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		push	2
		lea	ax, [bp+var_66]
		push	ax
		nop
		push	cs
		call	near ptr sub_A12D
		pop	cx
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		nop
		push	cs
		call	near ptr sub_A137
		add	sp, 8
		lea	ax, [bp+var_C]
		push	ax
		push	0
		call	GlyphObject_ConstructWithBuffer_48911
		add	sp, 4
		mov	si, ax
		push	large 1
		push	65h
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 4
		sub	ax, 2
		push	ax
		push	si
		nop
		push	cs
		call	near ptr sub_A193
		add	sp, 8
		push	ds
		push	offset aShp_3
		push	ds
		push	offset aConvfont
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_66]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		push	2
		push	2
		lea	ax, [bp+var_66]
		push	ax
		nop
		push	cs
		call	near ptr sub_A12D
		pop	cx
		push	ax
		call	TextRenderer_LoadResourceFile_54D15
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		nop
		push	cs
		call	near ptr sub_A137
		add	sp, 8
		lea	ax, [bp+var_16]
		push	ax
		push	5BC5h
		call	sub_48858
		add	sp, 4
		push	0
		push	5822h
		call	sub_595C
		add	sp, 4
		push	6040h
		call	sub_13A65
		pop	cx
		push	0
		push	[bp+arg_2]
		push	di
		push	si
		push	5C40h
		call	sub_58AA4
		add	sp, 0Ah
		cmp	byte_603B1, 0
		jz	short loc_9F56
		push	6040h
		call	sub_13DD2
		jmp	short loc_9F5E

loc_9F56:
		push	6040h
		call	sub_13D97

loc_9F5E:
		pop	cx
		push	668Ah
		nop
		push	cs
		call	near ptr sub_A1C4
		pop	cx
		or	ax, ax
		jz	short loc_9F75
		mov	al, byte_603B4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9F7A

loc_9F75:
		mov	byte_603B5, 1

loc_9F7A:
		push	5C40h
		call	sub_B155
		pop	cx
		mov	[bp+var_2], ax
		push	605Ah
		nop
		push	cs
		call	near ptr sub_A1CF
		pop	cx
		mov	byte_5CFA5, 0
		call	Keyboard_DrainBufferBIOS_578C9
		push	[bp+var_2]
		call	PagedResourceC_RefreshAndFinalize_47E2A
		pop	cx
		push	2
		lea	ax, [bp+var_16]
		push	ax
		nop
		push	cs
		call	near ptr sub_A168
		add	sp, 4
		push	2
		lea	ax, [bp+var_C]
		push	ax
		nop
		push	cs
		call	near ptr sub_A168
		add	sp, 4
		push	2
		lea	ax, [bp+var_66]
		push	ax
		nop
		push	cs
		call	near ptr sub_A111
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_9DCA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9FD0		proc far
		push	bp
		mov	bp, sp
		push	5BC5h
		call	GlyphObject_AllocateBuffer_488D3
		pop	cx
		push	5C40h
		nop
		push	cs
		call	near ptr sub_A006
		pop	cx
		pop	bp
		retf
sub_9FD0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9FE7		proc far
		push	bp
		mov	bp, sp
		push	2
		push	5C40h
		nop
		push	cs
		call	near ptr sub_A088
		add	sp, 4
		push	2
		push	5BC5h
		call	sub_48B6C
		add	sp, 4
		pop	bp
		retf
sub_9FE7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A006		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A020
		push	3DCh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A083

loc_A020:
		push	si
		nop
		push	cs
		call	near ptr sub_A1DF
		pop	cx
		mov	ax, si
		add	ax, 57h
		push	ax
		nop
		push	cs
		call	near ptr sub_A0EC
		pop	cx
		mov	ax, si
		add	ax, 102h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	seg seg017
		push	offset TextCycler_AllocateA_A208
		push	large 10004h
		push	2
		mov	ax, si
		add	ax, 292h
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg017
		push	offset TextureLoader_AllocateC_A22D
		push	large 10008h
		push	1Ah
		mov	ax, si
		add	ax, 29Ah
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	ax, si
		add	ax, 36Ah
		push	ax
		nop
		push	cs
		call	near ptr MissionRecord_Helper_A247
		pop	cx

loc_A083:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_A006		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A088		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A0D4
		push	0
		push	2
		mov	ax, si
		add	ax, 112h
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		push	2
		mov	ax, si
		add	ax, 57h
		push	ax
		nop
		push	cs
		call	near ptr sub_A111
		add	sp, 4
		push	2
		push	si
		nop
		push	cs
		call	near ptr sub_A274
		add	sp, 4
		test	di, 1
		jz	short loc_A0D4
		push	si
		call	sub_33B
		pop	cx

loc_A0D4:
		pop	di
		pop	si
		pop	bp
		retf
sub_A088		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A0D8		proc far
		push	bp
		mov	bp, sp
		push	0
		call	CRT_Time_A8C
		pop	cx
		push	ax
		call	CRT_Srand_77A
		pop	cx
		pop	bp
		retf
sub_A0D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A0EC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A105
		push	50h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A10C

loc_A105:
		push	si
		nop
		push	cs
		call	near ptr sub_A2AA
		pop	cx

loc_A10C:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_A0EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A111		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_A12B
		test	dx, 1
		jz	short loc_A12B
		push	ax
		call	sub_33B
		pop	cx

loc_A12B:
		pop	bp
		retf
sub_A111		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A12D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	ax, dx
		pop	bp
		retf
sub_A12D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A137		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A150
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A163

loc_A150:
		push	1
		mov	al, [bp+arg_6]
		push	ax
		push	large [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr sub_A2B2
		add	sp, 0Ah

loc_A163:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_A137		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A168		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A18F
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_A2D7
		add	sp, 4
		test	di, 1
		jz	short loc_A18F
		push	si
		call	sub_33B
		pop	cx

loc_A18F:
		pop	di
		pop	si
		pop	bp
		retf
sub_A168		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A193		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_4]
		mov	[si+10h], ax
		mov	ax, [bp+arg_6]
		mov	[si+12h], ax
		cmp	dx, 0FFFFh
		jnz	short loc_A1BE
		push	2Dh
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[si+14h], ax
		jmp	short loc_A1C1

loc_A1BE:
		mov	[si+14h], dx

loc_A1C1:
		pop	si
		pop	bp
		retf
sub_A193		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A1C4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, word_5CF9F
		pop	bp
		retf
sub_A1C4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A1CF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+2Fh]
		mov	[si+2Eh], al
		pop	si
		pop	bp
		retf
sub_A1CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A1DF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A1F8
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A203

loc_A1F8:
		push	si
		nop
		push	cs
		call	sub_A313
		pop	cx
		mov	word ptr [si], 81Dh

loc_A203:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_A1DF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextCycler_AllocateA_CE661 (sub_CE661 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à TextCycler_AllocateA_A7566 (sub_A7566 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue (sub_658).
; ==============================================================================================
TextCycler_AllocateA_A208		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A221
		push	2
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A228

loc_A221:
		mov	byte ptr [si+1], 0
		mov	byte ptr [si], 0FFh

loc_A228:
		mov	ax, si
		pop	si
		pop	bp
		retf
TextCycler_AllocateA_A208		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextureLoader_AllocateC_DFB51 (sub_DFB51 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextureLoader_AllocateC_98A3E (sub_98A3E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; alloue (CRT_Malloc16_Retry, 22 lignes).
; ==============================================================================================
TextureLoader_AllocateC_A22D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		or	dx, dx
		jnz	short loc_A243
		push	1Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ax
		or	ax, ax

loc_A243:
		mov	ax, dx
		pop	bp
		retf
TextureLoader_AllocateC_A22D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionRecord_Helper_95F76 (sub_95F76 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à MissionRecord_Helper_7D249
; (sub_7D249 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, alloue (CRT_Malloc16_Retry, 29 lignes).
; ==============================================================================================
MissionRecord_Helper_A247		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_A260
		push	3Dh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A26F

loc_A260:
		mov	byte ptr [si], 0
		mov	byte ptr [si+1], 0
		mov	byte ptr [si+15h], 0
		mov	byte ptr [si+29h], 0

loc_A26F:
		mov	ax, si
		pop	si
		pop	bp
		retf
MissionRecord_Helper_A247		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A274		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A2A6
		mov	word ptr [si], 81Dh
		push	si
		call	sub_A8A2
		pop	cx
		push	0
		push	si
		call	HUDSymbol_ReleaseListEntry_7446
		add	sp, 4
		test	di, 1
		jz	short loc_A2A6
		push	si
		call	sub_33B
		pop	cx

loc_A2A6:
		pop	di
		pop	si
		pop	bp
		retf
sub_A274		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A2AA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_A2AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A2B2		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[si], eax
		mov	al, [bp+arg_6]
		mov	[si+4], al
		mov	al, [bp+arg_8]
		mov	[si+5], al
		mov	dword ptr [si+6], 0
		pop	si
		pop	bp
		retf
sub_A2B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A2D7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+5], 0
		jz	short loc_A2FD
		cmp	dword ptr [si], 0
		jz	short loc_A2FD
		push	[bp+arg_2]
		mov	al, [si+4]
		push	ax
		push	si
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8

loc_A2FD:
		mov	dword ptr [si], 0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		pop	si
		pop	bp
		retf
sub_A2D7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A313		proc near

arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_2]
		or	si, si
		jnz	short loc_A32C
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A338

loc_A32C:
		mov	word ptr [si], 492h
sub_A313		endp
seg017		ends
