seg033		segment	para public 'CODE' use16
		assume cs:seg033
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 42h

loc_193A1:
		db 66h, 8Bh, 46h, 0FCh, 66h, 0Fh, 0A4h, 0C2h, 10h, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Config_LoadOrCreate
; (sub_227A2 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Config_LoadOrCreate (sub_26F2B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,45L — copie une structure (sub_2DF4), tente une résolution
; (sub_641B2) sinon parse un fichier de config (sub_1F4B) : chargeur de
; configuration/calibration (fichier .cfg), probable réglages joystick/contrôleur.
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
		call	sub_36EC
		add	sp, 8
		lea	ax, [bp+var_50]
		push	ax
		call	Tre_ContainsName_4998
		pop	cx
		or	ax, ax
		jz	short loc_193D6
		mov	al, 1
		jmp	short loc_193EF

loc_193D6:
		push	0
		lea	ax, [bp+var_50]
		push	ax
		call	CRT_Write_TextMode
		add	sp, 4
		or	ax, ax
		jnz	short loc_193ED
		mov	ax, 1
		jmp	short loc_193EF

loc_193ED:
		xor	ax, ax

loc_193EF:
		leave
		retf
Config_LoadOrCreate		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_193F1		proc far
		push	bp
		mov	bp, sp
		push	9028h
		call	sub_9D47
		pop	cx
		pop	bp
		retf
sub_193F1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_193FF		proc far
		push	bp
		mov	bp, sp
		inc	dword_5B3DD
		pop	bp
		retf
sub_193FF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19409		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	byte_5B3E5, 0
		jz	short loc_1941A
		mov	al, 0
		jmp	short loc_1941C

loc_1941A:
		mov	al, 1

loc_1941C:
		pop	bp
		retf
sub_19409		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à PIT_ReadHighPrecision
; (sub_22B6F de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 6 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à PIT_ReadHighPrecision
; (sub_27144 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,73L — lecture haute précision du timer PIT (canal 0, latch, accumulateur
; dword_6E33D) avec acquittement IRQ (port 0x20) : appelée directement par le tick physique de
; vol (sub_3314/Flight_PhysicsTick_JDYN) — source du delta-temps du moteur physique.
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
		mov	eax, dword_5B3DD
		mov	[bp+var_4], eax
		mov	dx, 26D7h

loc_19431:
		mov	al, 0C2h
		out	43h, al
		jmp	short loc_19437

loc_19437:
		in	al, 40h
		mov	ch, al
		jmp	short loc_1943D

loc_1943D:
		in	al, 40h
		mov	bl, al
		jmp	short loc_19443

loc_19443:
		in	al, 40h
		mov	bh, al
		jmp	short loc_19449

loc_19449:
		mov	al, 0Ah
		out	20h, al
		jmp	short loc_1944F

loc_1944F:
		in	al, 20h
		test	al, 1
		jz	short loc_19459
		mov	ax, dx
		jmp	short loc_19470

loc_19459:
		test	ch, 40h
		jnz	short loc_19431
		xor	ax, ax
		shr	bx, 1
		shl	ch, 1
		jnb	short loc_1946A
		mov	ax, dx
		shr	ax, 1

loc_1946A:
		add	ax, bx
		neg	ax
		add	ax, dx

loc_19470:
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
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à DOS_InstallCtrlBreakHandler (sub_22C07 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à DOS_InstallCtrlBreakHandler (sub_271DC de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,36L — alloue un
; objet (18 octets) et installe un handler d'interruption (sub_664D5, vecteur INT 23h) :
; installation du handler Ctrl-Break DOS.
; ==============================================================================================
DOS_InstallCtrlBreakHandler_194B6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_194CF
		push	12h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_194ED

loc_194CF:
		push	si
		call	JoystickCallback_Construct_54FE2
		pop	cx
		push	large 0
		push	si
		push	seg seg033
		push	offset loc_1949E
		push	23h
		push	684Ah
		call	JoystickCallback_RegisterInChain_550E1
		add	sp, 0Eh

loc_194ED:
		mov	ax, si
		pop	si
		pop	bp
		retf
DOS_InstallCtrlBreakHandler_194B6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_194F2		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_194F2		endp

; START OF FUNCTION CHUNK FOR sub_194F2
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
		cmp	dword_5B3E6, 0
		jnz	short loc_19511
		push	cs
		call	near ptr sub_194F2

loc_19511:
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
; END OF FUNCTION CHUNK FOR sub_194F2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à DOS_InstallCtrlBreakHandler (sub_22C07 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à DOS_InstallCtrlBreakHandler (sub_271DC de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,36L — alloue un
; objet (18 octets) et installe un handler d'interruption (sub_664D5, vecteur INT 23h) :
; installation du handler Ctrl-Break DOS.
; ==============================================================================================
DOS_InstallCtrlBreakHandler_1951B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_19534
		push	12h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_19552

loc_19534:
		push	si
		call	JoystickCallback_Construct_54FE2
		pop	cx
		push	large 0
		push	si
		push	seg seg033
		push	offset loc_194F7
		push	60h
		push	684Ah
		call	JoystickCallback_RegisterInChain_550E1
		add	sp, 0Eh

loc_19552:
		mov	ax, si
		pop	si
		pop	bp
		retf
DOS_InstallCtrlBreakHandler_1951B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19557		proc far
		push	bp
		mov	bp, sp
		mov	word_5FD7A, 96Dh
		mov	ax, word_5DD68
		mov	word_5FD7C, ax
		mov	word_5DD68, 605Ah
		mov	dword_5FD7F, 0
		mov	byte_5FD83, 2
		mov	byte_5FD84, 0
		mov	dword_5FD85, 0
		mov	dword_5FD89, 0
		mov	byte_5FD8D, 2
		mov	byte_5FD8E, 0
		mov	dword_5FD8F, 0
		mov	word_5FD93, 0
		mov	word_5FD99, 0
		mov	word_5FD9F, 0
		mov	word_5FD7A, 16DEh
		mov	byte_5FDA1, 3
		mov	word_5FDA2, 96Dh
		mov	ax, word_5DD68
		mov	word_5FDA4, ax
		mov	word_5DD68, 6082h
		mov	word_5FDA6, 16CEh
		mov	word_5FDA2, 16D6h
		mov	byte_5FDA8, 1
		push	6081h
		call	sub_59A70
		pop	cx
		push	608Ch
		push	cs
		call	near ptr DOS_InstallCtrlBreakHandler_194B6
		pop	cx
		push	609Eh
		call	TextScrollDisplayB_ConstructAndReset_5705D
		pop	cx
		push	60A0h
		push	cs
		call	near ptr DOS_InstallCtrlBreakHandler_1951B
		pop	cx
		pop	bp
		retf
sub_19557		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19608		proc far
		push	bp
		mov	bp, sp
		push	2
		push	60A0h
		call	sub_5502C
		add	sp, 4
		push	609Eh
		call	sub_560D6
		pop	cx
		push	2
		push	608Ch
		call	sub_5502C
		add	sp, 4
		mov	word_5FD7A, 16DEh
		push	605Ah
		call	sub_58B5E
		pop	cx
		push	0
		push	6082h
		call	sub_47DAD
		add	sp, 4
		push	0
		push	605Fh
		call	sub_58BD3
		add	sp, 4
		push	0
		push	605Ah
		call	sub_47DAD
		add	sp, 4
		pop	bp
		retf
sub_19608		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19666		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_19692
		push	0
		mov	ax, si
		inc	ax
		push	ax
		call	sub_47DAD
		add	sp, 4
		test	di, 1
		jz	short loc_19692
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_19692

loc_19692:
		pop	di
		pop	si
		pop	bp
		retf
sub_19666		endp

; ----------------------------------------------------------------------

sub_19696		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFFh
		jmp	sub_59AA0
sub_19696		endp

; ----------------------------------------------------------------------

sub_196A2		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFFh
		nop
		nop
		jmp	sub_19666
sub_196A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_196AE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_19700
		mov	word ptr [si], 16DEh
		push	si
		call	sub_58B5E
		pop	cx
		push	0
		mov	ax, si
		add	ax, 28h
		push	ax
		call	sub_47DAD
		add	sp, 4
		push	0
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_58BD3
		add	sp, 4
		push	0
		push	si
		call	sub_47DAD
		add	sp, 4
		test	di, 1
		jz	short loc_19700
		push	si
		call	sub_33B
		pop	cx
sub_196AE		endp
seg033		ends
