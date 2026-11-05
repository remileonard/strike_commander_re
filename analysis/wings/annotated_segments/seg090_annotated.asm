seg090		segment	para public 'CODE' use16
		assume cs:seg090
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D351		proc far
		push	bp
		mov	bp, sp
		push	668Ah
		push	cs
		call	sub_4D2F9
		pop	cx
		pop	bp
		retf
sub_3D351		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D35E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3D35E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D366		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3D366		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D36E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3D36E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D376		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		cmp	byte_5F552, 2
		jnz	short loc_3D393
		mov	ax, 1
		jmp	short loc_3D395

loc_3D393:
		xor	ax, ax

loc_3D395:
		or	ax, ax
		jz	short loc_3D3B6
		push	large 10002h
		push	5822h
		call	sub_5856
		add	sp, 6
		push	1
		push	5822h
		call	sub_58A1
		jmp	short loc_3D3C2

loc_3D3B6:
		push	word_5DD44
		push	6286h
		call	UI_ApplyEncodingHelper_47B1D

loc_3D3C2:
		add	sp, 4
		push	0
		push	large [bp+arg_4]
		push	large 0
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		cmp	byte_5F552, 2
		jnz	short loc_3D3E6
		mov	ax, 1
		jmp	short loc_3D3E8

loc_3D3E6:
		xor	ax, ax

loc_3D3E8:
		or	ax, ax
		jz	short loc_3D407
		push	large 1
		push	5822h
		call	sub_5856
		add	sp, 6
		push	0
		push	5822h
		call	sub_58A1
		add	sp, 4

loc_3D407:
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		pop	bp
		retf
sub_3D376		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D411		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_5F552, 2
		jnz	short loc_3D423
		mov	ax, 1
		jmp	short loc_3D425

loc_3D423:
		xor	ax, ax

loc_3D425:
		or	ax, ax
		jz	short loc_3D44A
		push	large 2
		push	5822h
		call	sub_5856
		add	sp, 6
		push	large 10002h
		push	5822h
		call	sub_5856
		add	sp, 6
		jmp	short loc_3D459

loc_3D44A:
		push	word_5DD44
		push	6286h
		call	UI_ApplyEncodingHelper_47B1D
		add	sp, 4

loc_3D459:
		pop	bp
		retf
sub_3D411		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D45B		proc far

var_66		= word ptr -66h
var_9		= dword ptr -9
var_5		= dword ptr -5
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_66], 9B5h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 0B2Ch
		push	0
		push	32ADh
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 2Eh
		push	ds
		mov	ax, si
		add	ax, 2
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	sub_527AA
		pop	cx
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	si
		leave
		retf
sub_3D45B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Config_ReadSettingsField_8FBE7 (sub_8FBE7 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; construit un StreamReader et lit un champ typé (StreamReader_ReadTyped_63FA1, seg190).
; ==============================================================================================
Config_ReadSettingsField_3D4CF		proc far

var_66		= word ptr -66h
var_9		= dword ptr -9
var_5		= dword ptr -5
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_66], 9B5h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 0B2Ch
		push	1
		push	32ADh
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 2Eh
		push	ds
		mov	ax, si
		add	ax, 2
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	sub_527AA
		pop	cx
		push	si
		push	cs
		call	near ptr sub_3D366
		pop	cx
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	si
		leave
		retf
Config_ReadSettingsField_3D4CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CRT_DisplayCalibrationMessage_8FC61 (sub_8FC61 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine CRT_Write_TextMode et CPU_SpeedCalibration — affichage lié à la calibration de
; vitesse CPU (cf. joystick, seg199).
; ==============================================================================================
CRT_DisplayCalibrationMessage_3D549		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	32B9h
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jz	short loc_3D57C
		call	sub_58B6D
		mov	[bp+var_2], al
		push	ax
		push	si
		push	cs
		call	near ptr sub_3D36E
		add	sp, 4
		push	si
		nop
		push	cs
		call	near ptr sub_3D59E
		pop	cx

loc_3D57C:
		push	0
		push	32ADh
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jz	short loc_3D595
		push	si
		nop
		push	cs
		call	near ptr Options_LoadDefaults_3D612
		jmp	short loc_3D59A

loc_3D595:
		push	si
		push	cs
		call	near ptr Config_ReadSettingsField_3D4CF

loc_3D59A:
		pop	cx
		pop	si
		leave
		retf
CRT_DisplayCalibrationMessage_3D549		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D59E		proc far

var_66		= word ptr -66h
var_9		= dword ptr -9
var_5		= dword ptr -5
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_66], 9B5h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 0B2Ch
		push	0
		push	32B9h
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 2Eh
		push	ds
		mov	ax, si
		add	ax, 2
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	sub_527AA
		pop	cx
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		pop	si
		leave
		retf
sub_3D59E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Options_LoadDefaults_9E583 (sub_9E583 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Options_LoadDefaults_8FD2A (sub_8FD2A de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far. Bouton DEFAULT :
; CRT_Write_TextMode, lit OPTDFLT.CFG (nom en DGROUP 5222 = push 1466h,
; StreamReader_ReadTyped_63FA1) dans la structure de configuration,
; VROOMM_StubThunk_6B70F(9025h), puis Cockpit_ReadControlsFrame_8F720 (applique les réglages).
; Ex-nom « Config_ReadSettingsFieldWithMessage_8FD2A ».
; ==============================================================================================
Options_LoadDefaults_3D612		proc far

var_66		= word ptr -66h
var_9		= dword ptr -9
var_5		= dword ptr -5
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 66h
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	32B9h
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jnz	short loc_3D696
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_66], 9B5h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 0B2Ch
		push	1
		push	32B9h
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 2Eh
		push	ds
		mov	ax, si
		add	ax, 2
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReadTyped_529F9
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	sub_527AA
		pop	cx
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		jmp	short loc_3D69F

loc_3D696:
		push	9025h
		call	sub_9D47
		pop	cx

loc_3D69F:
		push	si
		push	cs
		call	near ptr sub_3D366
		pop	cx
		pop	si
		leave
		retf
Options_LoadDefaults_3D612		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D6A8		proc far

var_108		= word ptr -108h
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 108h
		push	si
		mov	ax, [bp+arg_0]
		push	0
		push	63DEh
		call	sub_58F31
		add	sp, 4
		xor	si, si
		jmp	loc_3D9A6

loc_3D6C5:
		mov	ax, 0Fh
		sub	ax, si
		cmp	ax, 0FFFFh
		jnz	short loc_3D6D8
		lea	ax, [bp+var_108]
		mov	word ptr [bp+var_4+2], ss
		jmp	short loc_3D70C

loc_3D6D8:
		cmp	byte_60160, 3
		jnz	short loc_3D6F7
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3D6FF

loc_3D6F7:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_3D6FF:
		mov	bx, 0Fh
		sub	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_4+2], dx

loc_3D70C:
		mov	word ptr [bp+var_4], ax
		lea	ax, [bp+var_108]
		mov	word ptr [bp+var_8+2], ss
		mov	word ptr [bp+var_8], ax
		push	100h
		push	large [bp+var_4]
		push	large [bp+var_8]
		call	sub_3609
		add	sp, 0Ah
		les	bx, word ptr [bp+var_8]
		mov	byte ptr es:[bx+0FFh], 0FFh
		mov	ax, si
		add	ax, 10h
		cmp	ax, 0FFFFh
		jnz	short loc_3D748
		lea	ax, [bp+var_108]
		mov	word ptr [bp+var_4+2], ss
		jmp	short loc_3D77C

loc_3D748:
		cmp	byte_60160, 3
		jnz	short loc_3D767
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3D76F

loc_3D767:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_3D76F:
		mov	bx, si
		add	bx, 10h
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_4+2], dx

loc_3D77C:
		mov	word ptr [bp+var_4], ax
		mov	ax, 0Fh
		sub	ax, si
		cmp	ax, 0FFFFh
		jnz	short loc_3D792
		lea	ax, [bp+var_108]
		mov	word ptr [bp+var_8+2], ss
		jmp	short loc_3D7C6

loc_3D792:
		cmp	byte_60160, 3
		jnz	short loc_3D7B1
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3D7B9

loc_3D7B1:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_3D7B9:
		mov	bx, 0Fh
		sub	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_8+2], dx

loc_3D7C6:
		mov	word ptr [bp+var_8], ax
		push	100h
		push	large [bp+var_4]
		push	large [bp+var_8]
		call	sub_3609
		add	sp, 0Ah
		les	bx, word ptr [bp+var_8]
		mov	byte ptr es:[bx+0FFh], 0FFh
		cmp	si, 0FFFFh
		jnz	short loc_3D7F3
		lea	ax, [bp+var_108]
		mov	word ptr [bp+var_4+2], ss
		jmp	short loc_3D824

loc_3D7F3:
		cmp	byte_60160, 3
		jnz	short loc_3D812
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3D81A

loc_3D812:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_3D81A:
		mov	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_4+2], dx

loc_3D824:
		mov	word ptr [bp+var_4], ax
		mov	ax, si
		add	ax, 10h
		cmp	ax, 0FFFFh
		jnz	short loc_3D83A
		lea	ax, [bp+var_108]
		mov	word ptr [bp+var_8+2], ss
		jmp	short loc_3D86E

loc_3D83A:
		cmp	byte_60160, 3
		jnz	short loc_3D859
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3D861

loc_3D859:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_3D861:
		mov	bx, si
		add	bx, 10h
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_8+2], dx

loc_3D86E:
		mov	word ptr [bp+var_8], ax
		push	100h
		push	large [bp+var_4]
		push	large [bp+var_8]
		call	sub_3609
		add	sp, 0Ah
		les	bx, word ptr [bp+var_8]
		mov	byte ptr es:[bx+0FFh], 0FFh
		mov	ax, 1Fh
		sub	ax, si
		cmp	ax, 0FFFFh
		jnz	short loc_3D8A0
		lea	ax, [bp+var_108]
		mov	word ptr [bp+var_4+2], ss
		jmp	short loc_3D8D4

loc_3D8A0:
		cmp	byte_60160, 3
		jnz	short loc_3D8BF
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3D8C7

loc_3D8BF:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_3D8C7:
		mov	bx, 1Fh
		sub	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_4+2], dx

loc_3D8D4:
		mov	word ptr [bp+var_4], ax
		cmp	si, 0FFFFh
		jnz	short loc_3D8E5
		lea	ax, [bp+var_108]
		mov	word ptr [bp+var_8+2], ss
		jmp	short loc_3D916

loc_3D8E5:
		cmp	byte_60160, 3
		jnz	short loc_3D904
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3D90C

loc_3D904:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_3D90C:
		mov	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_8+2], dx

loc_3D916:
		mov	word ptr [bp+var_8], ax
		push	100h
		push	large [bp+var_4]
		push	large [bp+var_8]
		call	sub_3609
		add	sp, 0Ah
		les	bx, word ptr [bp+var_8]
		mov	byte ptr es:[bx+0FFh], 0FFh
		lea	ax, [bp+var_108]
		mov	word ptr [bp+var_4+2], ss
		mov	word ptr [bp+var_4], ax
		mov	ax, 1Fh
		sub	ax, si
		cmp	ax, 0FFFFh
		jnz	short loc_3D952
		lea	ax, [bp+var_108]
		mov	word ptr [bp+var_8+2], ss
		jmp	short loc_3D986

loc_3D952:
		cmp	byte_60160, 3
		jnz	short loc_3D971
		push	0
		mov	al, byte_60160
		push	ax
		push	large dword_6015C
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_3D979

loc_3D971:
		mov	edx, dword_6015E
		mov	ax, word ptr dword_6015C

loc_3D979:
		mov	bx, 1Fh
		sub	bx, si
		shl	bx, 8
		add	ax, bx
		mov	word ptr [bp+var_8+2], dx

loc_3D986:
		mov	word ptr [bp+var_8], ax
		push	100h
		push	large [bp+var_4]
		push	large [bp+var_8]
		call	sub_3609
		add	sp, 0Ah
		les	bx, word ptr [bp+var_8]
		mov	byte ptr es:[bx+0FFh], 0FFh
		inc	si

loc_3D9A6:
		cmp	si, 8
		jge	short loc_3D9AE
		jmp	loc_3D6C5

loc_3D9AE:
		pop	si
		leave
		retf
sub_3D6A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3D9B1		proc far
		push	bp
		mov	bp, sp
		mov	word_603BA, 0
		mov	byte_603B9, 1
		mov	byte_603B8, 0
		mov	word_603BC, 4
		mov	word_603BE, 0
		mov	word_603C0, 0
		mov	word_603C2, 2
		mov	word_603C4, 2
		mov	word_603C6, 0
		mov	word_603C8, 0
		mov	word_603CA, 2
		mov	byte_603CC, 0
		mov	byte_603CD, 1
		mov	byte_603CE, 0
		mov	byte_603D2, 0
		mov	byte_603D1, 1
		mov	byte_603CF, 1
		mov	byte_603D0, 1
		mov	word_603D8, 2
		mov	byte_603D3, 1
		mov	byte_603D4, 0
		mov	byte_603D5, 0
		mov	byte_603D7, 0
		mov	byte_603D6, 0
		mov	byte_603DA, 1
		mov	byte_603DB, 1
		mov	word_603B6, 2
		mov	byte_603AE, 0
		mov	byte_603AF, 0
		mov	byte_603B0, 1
		mov	byte_603B1, 1
		mov	byte_603B2, 1
		mov	byte_603B3, 1
		mov	byte_603B4, 1
		mov	byte_603B5, 0
		pop	bp
		retf
sub_3D9B1		endp
seg090		ends
