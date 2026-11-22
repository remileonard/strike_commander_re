seg056		segment	para public 'CODE' use16
		assume cs:seg056
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Config_LoadOrCreate
; (sub_26F2B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,45L — copie une structure (sub_2DF4), tente une résolution (sub_641B2) sinon
; parse un fichier de config (sub_1F4B) : chargeur de configuration/calibration (fichier
; .cfg), probable réglages joystick/contrôleur.
; ==============================================================================================
Config_LoadOrCreate		proc far

var_50		= word ptr -50h
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 50h
		push	large [bp+arg_0]
		push	ss
		lea	ax, [bp+var_50]
		push	ax
		call	sub_38D6
		add	sp, 8
		lea	ax, [bp+var_50]
		push	ax
		call	StreamReader_ParseFormattedValueB_6BC5F
		pop	cx
		or	ax, ax
		jz	short loc_227CB
		mov	al, 1
		jmp	short loc_227E4

loc_227CB:
		push	0
		lea	ax, [bp+var_50]
		push	ax
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jnz	short loc_227E2
		mov	ax, 1
		jmp	short loc_227E4

loc_227E2:
		xor	ax, ax

loc_227E4:
		leave
		retf
Config_LoadOrCreate		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_227E6		proc far
		push	bp
		mov	bp, sp
		push	9028h
		call	sub_1DDFE
		pop	cx
		pop	bp
		retf
sub_227E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_227F4		proc far
		push	bp
		mov	bp, sp
		inc	dword_7752F
		pop	bp
		retf
sub_227F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_227FE		proc far

var_AA		= word ptr -0AAh
var_5A		= word ptr -5Ah
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0AAh
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_77537, 0
		jz	short loc_22816

loc_22811:
		mov	al, 0
		jmp	loc_22B53

loc_22816:
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jz	short loc_22822
		jmp	loc_22B51

loc_22822:
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_22F72
		pop	cx
		mov	al, byte_7CAC3
		mov	ah, 0
		mov	[bp+var_4], ax
		cmp	byte_7CAC2, 1
		jnz	short loc_2284D
		test	byte_7CAC5, 0C0h
		jz	short loc_22849
		mov	ax, 1
		jmp	short loc_2284B

loc_22849:
		xor	ax, ax

loc_2284B:
		jmp	short loc_22862

loc_2284D:
		cmp	byte_7D348, 1
		jz	short loc_2285B
		cmp	byte_7D369, 1
		jnz	short loc_22860

loc_2285B:
		mov	ax, 1
		jmp	short loc_22862

loc_22860:
		xor	ax, ax

loc_22862:
		or	al, al
		jnz	short loc_22869
		jmp	loc_229E7

loc_22869:
		cmp	byte_7CAC2, 1
		jnz	short loc_22880
		test	byte_7CAC5, 0Ch
		jz	short loc_2287C
		mov	ax, 1
		jmp	short loc_2287E

loc_2287C:
		xor	ax, ax

loc_2287E:
		jmp	short loc_22895

loc_22880:
		cmp	byte_7D33A, 1
		jz	short loc_2288E
		cmp	byte_7D346, 1
		jnz	short loc_22893

loc_2288E:
		mov	ax, 1
		jmp	short loc_22895

loc_22893:
		xor	ax, ax

loc_22895:
		mov	ah, 0
		or	ax, ax
		jz	short loc_2289E
		jmp	loc_229E7

loc_2289E:
		cmp	byte_7CAC2, 1
		jnz	short loc_228B5
		test	byte_7CAC5, 30h
		jz	short loc_228B1
		mov	ax, 1
		jmp	short loc_228B3

loc_228B1:
		xor	ax, ax

loc_228B3:
		jmp	short loc_228CA

loc_228B5:
		cmp	byte_7D32D, 1
		jz	short loc_228C3
		cmp	byte_7D365, 1
		jnz	short loc_228C8

loc_228C3:
		mov	ax, 1
		jmp	short loc_228CA

loc_228C8:
		xor	ax, ax

loc_228CA:
		mov	ah, 0
		or	ax, ax
		jz	short loc_228D3
		jmp	loc_229E7

loc_228D3:
		mov	ax, [bp+var_4]
		mov	[bp+var_2], ax
		mov	cx, 6
		mov	bx, offset word_22B57

loc_228DF:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_2]
		jz	short loc_228EF
		add	bx, 2
		loop	short loc_228DF
		jmp	loc_229E7

loc_228EF:
		jmp	word ptr cs:[bx+0Ch] ; switch jump

loc_228F3:
		mov	al, [si+30h]
		xor	al, 1
		mov	[si+30h], al
		jmp	loc_229E7

loc_228FE:
		call	sub_73879
		or	al, al
		jnz	short loc_2290A
		jmp	loc_229E7

loc_2290A:
		mov	byte ptr [si+2Eh], 1
		mov	byte_77537, 1
		jmp	loc_22811

loc_22916:
		mov	byte_775FC, 0
		xor	di, di
		jmp	short loc_22938

loc_2291F:
		cmp	byte ptr [di+6398h], 0
		jz	short loc_22937
		push	1
		push	di
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_738BF
		add	sp, 6

loc_22937:
		inc	di

loc_22938:
		cmp	di, 2
		jl	short loc_2291F
		jmp	loc_229E7

loc_22940:
		mov	al, byte_7CB19
		mov	byte ptr [bp+var_6+1], al
		call	sub_5EEB4

loc_2294B:
		push	63B4h
		call	sub_739C4
		pop	cx
		cmp	byte_77718, 0
		jz	short loc_22989
		mov	byte_775FC, 0
		xor	di, di
		jmp	short loc_2297D

loc_22964:
		cmp	byte ptr [di+6398h], 0
		jz	short loc_2297C
		push	1
		push	di
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_738BF
		add	sp, 6

loc_2297C:
		inc	di

loc_2297D:
		cmp	di, 2
		jl	short loc_22964
		mov	byte_77718, 0
		jmp	short loc_2294B

loc_22989:
		cmp	byte ptr [bp+var_6+1], 0
		jz	short loc_2299C
		mov	al, byte_7CB19
		mov	ah, 0
		or	ax, ax
		jnz	short loc_229E7
		push	1
		jmp	short loc_229BD

loc_2299C:
		cmp	byte_7CB19, 0
		jz	short loc_229E7
		jmp	short loc_229C5

loc_229A5:
		mov	al, byte_7CB19
		mov	byte ptr [bp+var_6+1], al
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_7CB19, al
		cmp	byte ptr [bp+var_6+1], 0
		jz	short loc_229C5
		push	0

loc_229BD:
		call	Music_Stop_5ED8F
		pop	cx
		jmp	short loc_229E7

loc_229C5:
		call	Music_SelectStartTune_5EDAB
		jmp	short loc_229E7

loc_229CC:
		mov	al, byte_7CB1A
		mov	byte ptr [bp+var_6+1], al
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_7CB1A, al
		cmp	byte ptr [bp+var_6+1], 0
		jz	short loc_229E7
		call	SoundFX_Disable_5EE92

loc_229E7:
		mov	al, byte_76D40
		mov	ah, 0
		or	ax, ax
		jnz	short loc_229F9
		push	6988h
		call	sub_5F28E
		pop	cx

loc_229F9:
		cmp	byte ptr [si+30h], 0
		jnz	short loc_22A02
		jmp	loc_22B51

loc_22A02:
		mov	ax, word_7AF7C
		mov	[bp+var_6], ax
		push	ax
		mov	ax, word_77535
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	0
		push	word_77535
		call	sub_75D09
		add	sp, 4
		push	0EFh
		push	word_77535
		call	sub_75D09
		add	sp, 4
		push	large 0A0000h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		push	seg seg008
		push	offset loc_564D
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_54BE
		add	sp, 6
		call	DisplayCache_ComputeChecksum_65BFD
		push	ax
		call	DisplayCache_Helper_6616A
		push	dx
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah
		lea	ax, [bp+var_5A]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 4
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		mov	dx, seg seg230
		mov	es, dx
		mov	edx, es:0
		sub	edx, eax
		mov	[bp+var_A], edx
		push	seg seg008
		push	offset loc_565A
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	0
		push	3
		push	6B04h
		call	Memory_TypedAllocDispatchC_6538A
		add	sp, 6
		push	dx
		push	ax
		call	sub_64B0E
		push	dx
		push	ax
		push	large [bp+var_A]
		lea	ax, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 10h
		push	large 140000h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		lea	ax, [bp+var_5A]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 4
		push	seg seg008
		push	offset loc_5673
		lea	ax, [bp+var_AA]
		push	ax
		call	sub_54BE
		add	sp, 6
		call	DisplayCache_ComputeChecksum_65BFD
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		lea	ax, [bp+var_5A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		push	large 1E0005h
		push	word_77535
		call	sub_75D27
		add	sp, 6
		lea	ax, [bp+var_5A]
		push	ax
		push	word_77535
		call	sub_75D4A
		add	sp, 4

loc_22B51:
		mov	al, 1

loc_22B53:
		pop	di
		pop	si
		leave
		retf
sub_227FE		endp

; START OF FUNCTION CHUNK FOR sub_227FE
word_22B57	dw 18h
		dw 1Fh
		dw 20h
		dw 24h
		dw 2Dh
		dw 32h
off_22B63	dw offset loc_22940
		dw offset loc_229CC
		dw offset loc_228F3
		dw offset loc_22916
		dw offset loc_228FE
		dw offset loc_229A5
; END OF FUNCTION CHUNK FOR sub_227FE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PIT_ReadHighPrecision (sub_27144 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,73L — lecture
; haute précision du timer PIT (canal 0, latch, accumulateur dword_6E33D) avec acquittement
; IRQ (port 0x20) : appelée directement par le tick physique de vol
; (sub_3314/Flight_PhysicsTick_JDYN) — source du delta-temps du moteur physique.
; ==============================================================================================
PIT_ReadHighPrecision		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		pushf
		cli
		mov	eax, dword_7752F
		mov	[bp+var_4], eax
		mov	dx, 26D7h

loc_22B82:
		mov	al, 0C2h
		out	43h, al
		jmp	short loc_22B88

loc_22B88:
		in	al, 40h
		mov	ch, al
		jmp	short loc_22B8E

loc_22B8E:
		in	al, 40h
		mov	bl, al
		jmp	short loc_22B94

loc_22B94:
		in	al, 40h
		mov	bh, al
		jmp	short loc_22B9A

loc_22B9A:
		mov	al, 0Ah
		out	20h, al
		jmp	short loc_22BA0

loc_22BA0:
		in	al, 20h
		test	al, 1
		jz	short loc_22BAA
		mov	ax, dx
		jmp	short loc_22BC1

loc_22BAA:
		test	ch, 40h
		jnz	short loc_22B82
		xor	ax, ax
		shr	bx, 1
		shl	ch, 1
		jnb	short loc_22BBB
		mov	ax, dx
		shr	ax, 1

loc_22BBB:
		add	ax, bx
		neg	ax
		add	ax, dx

loc_22BC1:
		popf
		movzx	eax, ax
		mov	[bp+var_8], eax
		mov	eax, [bp+var_4]
		imul	eax, eax, 26D7h
		add	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	ebx, 0C6h
		cdq
		idiv	ebx
		shld	edx, eax, 10h
		leave
		retf
PIT_ReadHighPrecision		endp

; START OF FUNCTION CHUNK FOR PIT_ReadHighPrecision
		push	ax
		push	bx
		push	cx
		push	dx
		push	es
		push	ds
		push	si
		push	di
		push	bp
		mov	bp, seg dseg
		mov	ds, bp
		pop	bp
		pop	di
		pop	si
		pop	ds
		pop	es
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		iret
; END OF FUNCTION CHUNK FOR PIT_ReadHighPrecision

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à DOS_InstallCtrlBreakHandler (sub_271DC de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,36L — alloue un
; objet (18 octets) et installe un handler d'interruption (sub_664D5, vecteur INT 23h) :
; installation du handler Ctrl-Break DOS.
; ==============================================================================================
DOS_InstallCtrlBreakHandler		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_22C20
		push	12h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_22C3E

loc_22C20:
		push	si
		call	JoystickCallback_Construct_6E5A6
		pop	cx
		push	large 0
		push	si
		push	seg seg056
		push	offset loc_22BEF
		push	23h
		push	6BACh
		call	JoystickCallback_RegisterInChain_6E6A5
		add	sp, 0Eh

loc_22C3E:
		mov	ax, si
		pop	si
		pop	bp
		retf
DOS_InstallCtrlBreakHandler		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22C43		proc far
		push	bp
		mov	bp, sp
		mov	word_7CA6E, 0D7Ch
		mov	ax, word_7AFA2
		mov	word_7CA70, ax
		mov	word_7AFA2, 633Eh
		mov	dword_7CA73, 0
		mov	byte_7CA77, 2
		mov	byte_7CA78, 0
		mov	dword_7CA79, 0
		mov	dword_7CA7D, 0
		mov	byte_7CA81, 2
		mov	byte_7CA82, 0
		mov	dword_7CA83, 0
		mov	word_7CA87, 0
		mov	word_7CA8D, 0
		mov	word_7CA93, 0
		mov	word_7CA6E, 0E18h
		mov	byte_7CA95, 3
		mov	word_7CA96, 0D7Ch
		mov	ax, word_7AFA2
		mov	word_7CA98, ax
		mov	word_7AFA2, 6366h
		mov	word_7CA9A, 0E08h
		mov	word_7CA96, 0E10h
		mov	byte_7CA9C, 1
		push	6365h
		call	sub_76510
		pop	cx
		push	6371h
		push	cs
		call	near ptr DOS_InstallCtrlBreakHandler
		pop	cx
		push	6383h
		call	TextScrollDisplayB_ConstructAndReset_6F974
		pop	cx
		pop	bp
		retf
sub_22C43		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22CEC		proc far
		push	bp
		mov	bp, sp
		push	6383h
		call	sub_6F69A
		pop	cx
		push	2
		push	6371h
		call	sub_6E5F0
		add	sp, 4
		mov	word_7CA6E, 0E18h
		push	633Eh
		call	sub_7385B
		pop	cx
		push	0
		push	large 6366h
		call	sub_68298
		add	sp, 4
		push	0
		push	6343h
		call	sub_738CE
		add	sp, 4
		push	0
		push	633Eh
		call	sub_68298
		add	sp, 4
		pop	bp
		retf
sub_22CEC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22D3D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_22D69
		push	0
		mov	ax, si
		inc	ax
		push	ax
		call	sub_68298
		add	sp, 4
		test	di, 1
		jz	short loc_22D69
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_22D69

loc_22D69:
		pop	di
		pop	si
		pop	bp
		retf
sub_22D3D		endp

; ----------------------------------------------------------------------

sub_22D6D		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFFh
		jmp	sub_76540
sub_22D6D		endp

; ----------------------------------------------------------------------

sub_22D79		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFFh
		nop
		nop
		jmp	sub_22D3D
sub_22D79		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22D85		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_22DD7
		mov	word ptr [si], 0E18h
		push	si
		call	sub_7385B
		pop	cx
		push	0
		mov	ax, si
		add	ax, 28h
		push	ax
		call	sub_68298
		add	sp, 4
		push	0
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_738CE
		add	sp, 4
		push	0
		push	si
		call	sub_68298
		add	sp, 4
		test	di, 1
		jz	short loc_22DD7
sub_22D85		endp
seg056		ends
