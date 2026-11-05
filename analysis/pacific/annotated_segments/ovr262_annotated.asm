ovr262		segment	para public 'OVERLAY' use16
		assume cs:ovr262
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9DFD0		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Fh], 1
		jnz	short loc_9DFEF
		mov	al, byte_7D3B8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9DFEF
		mov	word ptr [si+1Fh], 0

loc_9DFEF:
		cmp	word ptr [si+1Fh], 2
		jz	short loc_9E001
		cmp	word ptr [si+1Fh], 4
		jz	short loc_9E001
		cmp	word ptr [si+1Fh], 3
		jnz	short loc_9E014

loc_9E001:
		push	0
		call	sub_524B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E014
		mov	word ptr [si+1Fh], 0

loc_9E014:
		cmp	word ptr [si+21h], 1
		jnz	short loc_9E028
		mov	al, byte_7D3B8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E028
		mov	word ptr [si+21h], 0

loc_9E028:
		cmp	word ptr [si+21h], 2
		jnz	short loc_9E041
		push	0
		call	sub_524B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E041
		mov	word ptr [si+21h], 0

loc_9E041:
		cmp	word ptr [si+21h], 4
		jnz	short loc_9E04C
		call	sub_738D3

loc_9E04C:
		cmp	word ptr [si+1Fh], 1
		jz	short loc_9E058
		cmp	word ptr [si+21h], 1
		jnz	short loc_9E05D

loc_9E058:
		call	Mouse_InitAndRead

loc_9E05D:
		cmp	word ptr [si+1Fh], 0
		jnz	short loc_9E06E
		cmp	word ptr [si+21h], 0
		jnz	short loc_9E06E
		mov	word ptr [si+21h], 5

loc_9E06E:
		cmp	word ptr [si+1Fh], 1
		jnz	short loc_9E07F
		cmp	word ptr [si+21h], 1
		jnz	short loc_9E07F
		mov	word ptr [si+21h], 0

loc_9E07F:
		mov	al, [si+15h]
		mov	byte_7791E, al
		mov	al, [si+16h]
		mov	byte_7791F, al
		mov	al, [si+15h]
		mov	byte_778FE, al
		mov	al, [si+16h]
		mov	byte_778FF, al
		mov	al, [si+17h]
		mov	byte_77956, al
		mov	al, [si+15h]
		mov	byte_77C2F, al
		mov	al, [si+19h]
		mov	byte_77C2B, al
		mov	byte_77C2A, al
		mov	byte_77C2F, al
		mov	byte_77C2B, al
		mov	byte_77C2D, al
		mov	byte_77C2E, al
		mov	byte_77C2C, al
		mov	byte_77B8A, al
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E0DA
		mov	ax, [si+1Dh]
		add	ax, 0Bh
		push	ax
		push	word_79788
		call	sub_367B1
		add	sp, 4

loc_9E0DA:
		mov	bx, [si+1Fh]
		cmp	bx, 4
		ja	short loc_9E115
		shl	bx, 1
		jmp	cs:off_9E1A8[bx]	; switch jump

loc_9E0E9:
		mov	byte_76D12, 0
		mov	byte_76D13, 1
		jmp	short loc_9E110

loc_9E0F5:
		mov	byte_76D12, 0
		mov	byte_76D13, 0
		mov	byte_76D14, 1
		jmp	short loc_9E115

loc_9E106:
		mov	byte_76D12, 1
		mov	byte_76D13, 0

loc_9E110:
		mov	byte_76D14, 0

loc_9E115:
		mov	al, [si+32h]
		mov	byte_7CEFD, al
		mov	al, [si+33h]
		mov	byte_7CEFC, al
		cmp	word_7CADA, 0
		jz	short loc_9E141
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E141
		mov	bx, word_7CADA
		push	large [bx+5Fh]
		call	sub_3E140
		add	sp, 4

loc_9E141:
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E19E
		mov	[bp+var_2], 0
		jmp	short loc_9E18B

loc_9E151:
		mov	di, [bp+var_2]
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		pop	cx
		or	ax, dx
		jz	short loc_9E167
		push	di
		mov	bx, [di]
		call	dword ptr [bx+34h]
		pop	cx
		jmp	short loc_9E169

loc_9E167:
		mov	al, 1Ch

loc_9E169:
		cmp	al, 6
		jnz	short loc_9E18B
		cmp	byte ptr [di+51h], 0FFh
		jnz	short loc_9E18B
		mov	[bp+var_4], di
		mov	bx, [bp+var_4]
		mov	ax, [bx+5Ah]
		add	ax, 1Ah
		push	word ptr [bx+5Ch]
		push	ax
		call	PilotProfile_RescaleSkillByEnemyAI_11E79
		add	sp, 4

loc_9E18B:
		lea	ax, [bp+var_2]
		push	ax
		push	67ADh
		call	sub_1E7CF
		add	sp, 4
		or	ax, ax
		jnz	short loc_9E151

loc_9E19E:
		mov	al, [si+36h]
		mov	[si+38h], al
		pop	di
		pop	si
		leave
		retf
sub_9DFD0		endp

; START OF FUNCTION CHUNK FOR sub_9DFD0
off_9E1A8	dw offset loc_9E0F5
		dw offset loc_9E0E9
		dw offset loc_9E106
		dw offset loc_9E106
		dw offset loc_9E106
; END OF FUNCTION CHUNK FOR sub_9DFD0

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E1B2		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+1Fh], 1
		jnz	short loc_9E1CD
		mov	al, byte_7D3B8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E1CD
		mov	word ptr [si+1Fh], 0

loc_9E1CD:
		cmp	word ptr [si+1Fh], 2
		jz	short loc_9E1D9
		cmp	word ptr [si+1Fh], 4
		jnz	short loc_9E1EC

loc_9E1D9:
		push	0
		call	sub_524B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E1EC
		mov	word ptr [si+1Fh], 0

loc_9E1EC:
		cmp	word ptr [si+21h], 1
		jnz	short loc_9E200
		mov	al, byte_7D3B8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E200
		mov	word ptr [si+21h], 0

loc_9E200:
		cmp	word ptr [si+21h], 2
		jnz	short loc_9E219
		push	0
		call	sub_524B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E219
		mov	word ptr [si+21h], 0

loc_9E219:
		cmp	word ptr [si+21h], 4
		jz	short loc_9E225
		cmp	word ptr [si+21h], 3
		jnz	short loc_9E238

loc_9E225:
		push	1
		call	sub_524B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E238
		mov	word ptr [si+21h], 0

loc_9E238:
		mov	byte ptr [si+15h], 1
		mov	byte ptr [si+16h], 1
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_9E27A
		cmp	ax, 1
		jz	short loc_9E26F
		cmp	ax, 2
		jnz	short loc_9E28B
		mov	byte ptr [si+19h], 0
		mov	word ptr [si+1Dh], 0
		mov	byte ptr [si+16h], 0
		mov	word ptr [si+1Dh], 0

loc_9E265:
		mov	byte ptr [si+1Ah], 0
		mov	byte ptr [si+1Bh], 0
		jmp	short loc_9E28B

loc_9E26F:
		mov	byte ptr [si+19h], 1
		mov	word ptr [si+1Dh], 2
		jmp	short loc_9E265

loc_9E27A:
		mov	byte ptr [si+19h], 1
		mov	word ptr [si+1Dh], 4
		mov	byte ptr [si+1Ah], 0
		mov	byte ptr [si+1Bh], 1

loc_9E28B:
		mov	word ptr [si+17h], 0
		pop	si
		pop	bp
		retf
sub_9E1B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E293		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	di, [bp+arg_8]
		push	si
		call	sub_74AD7
		pop	cx
		cmp	byte_7C9F0, 2
		jnz	short loc_9E2B4
		mov	ax, 1
		jmp	short loc_9E2B6

loc_9E2B4:
		xor	ax, ax

loc_9E2B6:
		or	ax, ax
		jz	short loc_9E2D7
		push	large 10002h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		push	1
		push	62B0h
		call	sub_1DF79
		jmp	short loc_9E2E3

loc_9E2D7:
		push	word_7AF7E
		push	6324h
		call	UI_ApplyEncodingHelper_67EE7

loc_9E2E3:
		add	sp, 4
		cmp	[bp+arg_A], 1
		jnz	short loc_9E301
		push	0
		push	large [bp+arg_4]
		push	large 0
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch

loc_9E301:
		cmp	[bp+arg_A], 2
		jnz	short loc_9E31E
		push	di
		push	large [bp+arg_4]
		push	large 270005h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch

loc_9E31E:
		push	di
		push	large [bp+arg_4]
		push	large 0
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		cmp	byte_7C9F0, 2
		jnz	short loc_9E33E
		mov	ax, 1
		jmp	short loc_9E340

loc_9E33E:
		xor	ax, ax

loc_9E340:
		or	ax, ax
		jz	short loc_9E35F
		push	large 1
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		push	0
		push	62B0h
		call	sub_1DF79
		add	sp, 4

loc_9E35F:
		push	si
		call	sub_74ADC
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
sub_9E293		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E36A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_7C9F0, 2
		jnz	short loc_9E37C
		mov	ax, 1
		jmp	short loc_9E37E

loc_9E37C:
		xor	ax, ax

loc_9E37E:
		or	ax, ax
		jz	short loc_9E3A3
		push	large 2
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		push	large 10002h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		jmp	short loc_9E3B2

loc_9E3A3:
		push	word_7AF7E
		push	6324h
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4

loc_9E3B2:
		pop	bp
		retf
sub_9E36A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E3B4		proc far

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
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_66], 508h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 0E61h
		push	0
		push	0FD0h
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 25h
		push	ds
		mov	ax, si
		add	ax, 15h
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
sub_9E3B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E428		proc far

var_68		= word ptr -68h
var_B		= dword ptr -0Bh
var_7		= dword ptr -7
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+28h]
		mov	[bp+var_1], al
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_68], 508h
		mov	[bp+var_7], 100h
		mov	[bp+var_B], 0
		mov	[bp+var_68], 0E61h
		push	1
		push	0FD0h
		lea	ax, [bp+var_68]
		push	ax
		mov	bx, [bp+var_68]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 25h
		push	ds
		mov	ax, si
		add	ax, 15h
		push	ax
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_68]
		push	ax
		call	sub_6C2A4
		pop	cx
		cmp	[bp+var_1], 0
		jz	short loc_9E4A4
		mov	al, [si+28h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9E4A4
		mov	byte ptr [si+28h], 1

loc_9E4A4:
		push	si
		push	cs
		call	near ptr sub_9DFD0
		pop	cx
		push	0
		lea	ax, [bp+var_68]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
sub_9E428		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E4BB		proc far

var_2		= byte ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		push	0
		push	0FDCh
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jz	short loc_9E4ED
		mov	[bp+var_2], 0
		mov	al, [bp+var_2]
		push	ax
		push	si
		push	cs
		call	near ptr sub_9E1B2
		add	sp, 4
		push	si
		nop
		push	cs
		call	near ptr sub_9E50F
		pop	cx

loc_9E4ED:
		push	0
		push	0FD0h
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jz	short loc_9E506
		push	si
		nop
		push	cs
		call	near ptr Options_LoadDefaults_9E583
		jmp	short loc_9E50B

loc_9E506:
		push	si
		push	cs
		call	near ptr sub_9E428

loc_9E50B:
		pop	cx
		pop	si
		leave
		retf
sub_9E4BB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E50F		proc far

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
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_66], 508h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 0E61h
		push	0
		push	0FDCh
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 25h
		push	ds
		mov	ax, si
		add	ax, 15h
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
sub_9E50F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Options_LoadDefaults_8FD2A (sub_8FD2A de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far. Bouton DEFAULT
; : CRT_Write_TextMode, lit OPTDFLT.CFG (nom en DGROUP 5222 = push 1466h,
; StreamReader_ReadTyped_63FA1) dans la structure de configuration,
; VROOMM_StubThunk_6B70F(9025h), puis Cockpit_ReadControlsFrame_8F720 (applique les réglages).
; Ex-nom « Config_ReadSettingsFieldWithMessage_8FD2A ».
; ==============================================================================================
Options_LoadDefaults_9E583		proc far

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
		push	0FDCh
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jnz	short loc_9E607
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_66], 508h
		mov	[bp+var_5], 100h
		mov	[bp+var_9], 0
		mov	[bp+var_66], 0E61h
		push	1
		push	0FDCh
		lea	ax, [bp+var_66]
		push	ax
		mov	bx, [bp+var_66]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	large 0FFFFFFFFh
		push	large 25h
		push	ds
		mov	ax, si
		add	ax, 15h
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		jmp	short loc_9E610

loc_9E607:
		push	9025h
		call	sub_1DDFE
		pop	cx

loc_9E610:
		push	si
		push	cs
		call	near ptr sub_9DFD0
		pop	cx
		pop	si
		leave
		retf
Options_LoadDefaults_9E583		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E619		proc far
		push	bp
		mov	bp, sp
		push	si
		xor	si, si
		jmp	short loc_9E630

loc_9E621:
		push	1
		push	si
		push	6343h
		call	sub_738BF
		add	sp, 6
		inc	si

loc_9E630:
		cmp	si, 2
		jl	short loc_9E621
		pop	si
		pop	bp
		retf
sub_9E619		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E638		proc far
		push	bp
		mov	bp, sp
		mov	dword_7CAE4, 0
		mov	byte_7CAE8, 2
		mov	byte_7CAE9, 0
		mov	dword_7CAEA, 0
		mov	dword_7CAEE, 0
		mov	byte_7CAF2, 2
		mov	byte_7CAF3, 0
		mov	dword_7CAF4, 0
		mov	word_7CAFB, 0
		mov	byte_7CAF9, 1
		mov	byte_7CAFA, 1
		mov	byte_7CAFD, 1
		mov	word_7CB01, 4
		mov	word_7CB03, 2
		mov	word_7CB05, 2
		mov	word_7CB07, 1
		mov	byte_7CB09, 0
		mov	byte_7CB0A, 1
		mov	byte_7CB0B, 0
		mov	byte_7CB0C, 0
		mov	byte_7CB0D, 0
		mov	byte_7CB0E, 0
		mov	byte_7CB0F, 0
		mov	byte_7CB10, 0
		mov	word ptr byte_7CB11, 0
		mov	byte_7CB13, 0
		mov	byte_7CB14, 1
		mov	byte_7CB15, 1
		mov	byte_7CB16, 0
		mov	byte_7CB17, 0
		mov	byte_7CB18, 1
		mov	byte_7CB19, 0
		mov	byte_7CB1A, 0
		mov	byte_7CB1B, 0
		mov	byte_7CB1C, 0
		pop	bp
		retf
sub_9E638		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E702		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7CAF3, 0
		jz	short loc_9E72A
		cmp	dword_7CAEE, 0
		jz	short loc_9E72A
		push	0
		mov	al, byte_7CAF2
		push	ax
		push	63BEh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9E72A

loc_9E72A:
		mov	dword_7CAEE, 0
		mov	byte_7CAF3, 0
		mov	dword_7CAF4, 0
		cmp	byte_7CAE9, 0
		jz	short loc_9E766
		cmp	dword_7CAE4, 0
		jz	short loc_9E766
		push	0
		mov	al, byte_7CAE8
		push	ax
		push	63B4h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9E766

loc_9E766:
		mov	dword_7CAE4, 0
		mov	byte_7CAE9, 0
		mov	dword_7CAEA, 0
		pop	bp
		retf
sub_9E702		endp
ovr262		ends
