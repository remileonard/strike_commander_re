seg014		segment	para public 'CODE' use16
		assume cs:seg014
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9Ah, 0EDh, 0Ch, 0A7h, 42h, 83h, 0C4h, 0Ch, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_861A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	word_5B406, 0
		jnz	short loc_8631
		mov	byte_5DA20, 0
		call	PagedMemory_CheckDriverPresent_42DA7

loc_8631:
		pop	bp
		retf
sub_861A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8633		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_8680
		mov	word ptr [si], 668h
		mov	word ptr [si+4], 690h
		cmp	word_5B406, 0
		jnz	short loc_865C
		mov	byte_5DA20, 0
		call	PagedMemory_CheckDriverPresent_42DA7

loc_865C:
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_59B75
		pop	cx
		push	0
		push	si
		call	sub_47DAD
		add	sp, 4
		test	di, 1
		jz	short loc_8680
		push	si
		call	sub_33B
		pop	cx

loc_8680:
		pop	di
		pop	si
		pop	bp
		retf
sub_8633		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8684		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 3
		pop	bp
		retf
sub_8684		endp

; ----------------------------------------------------------------------

sub_868E		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	sub_8633
sub_868E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_869A		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_0]
		push	0
		push	large [bp+arg_2]
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	sub_43D60
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		leave
		retf
sub_869A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_86C1		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	dword ptr [si], 0
		jz	short loc_86FB
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0
		mov	[bp+var_8], eax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	sub_43F1F
		add	sp, 4
		mov	dword ptr [si], 0

loc_86FB:
		pop	si
		leave
		retf
sub_86C1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_86FE		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	ax, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0
		mov	[bp+var_8], eax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	PagedMemory_WriteByte_433DE
		add	sp, 4
		leave
		retf
sub_86FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_872A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		call	sub_44191
		pop	bp
		retf
sub_872A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8737		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, 1
		pop	bp
		retf
sub_8737		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8742		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_5DA20
		pop	bp
		retf
sub_8742		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_874D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_5DA20, 0
		call	PagedMemory_CheckDriverPresent_42DA7
		pop	bp
		retf
sub_874D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedMemory_ReadTextResource_4ACD (sub_4ACD de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedMemory_ReadTextResource_2B23C (sub_2B23C de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à PagedMemory_ReadTextResource_5C14E (sub_5C14E de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 66 lignes,
; NON DÉTAILLÉE — alloue (sub_658), combine sub_5F4A9 et PagedMemory_InitSubsystem_5BB0D.
; Référencée directement par TextRenderer_Main (sub_27477, seg048) — probable point d'entrée «
; charger une ressource texte depuis la mémoire paginée ».
; ==============================================================================================
PagedMemory_ReadTextResource_875F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_8778
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_87D5

loc_8778:
		mov	word ptr [si], 96Dh
		mov	ax, word_5DD68
		mov	[si+2], ax
		mov	word_5DD68, si
		mov	word ptr [si+4], 1B0h
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+8], seg seg017
		mov	word ptr [si+6], 38h
		mov	word ptr [si], 3D01h
		mov	word ptr [si+4], 3D29h
		mov	word ptr [si], 668h
		mov	word ptr [si+4], 690h
		cmp	byte_5DA20, 0
		jz	short loc_87CB
		push	300h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_59C05
		add	sp, 4
		jmp	short loc_87D0

loc_87CB:
		call	sub_4307D

loc_87D0:
		mov	byte_5DA20, 1

loc_87D5:
		mov	ax, si
		pop	si
		pop	bp
		retf
PagedMemory_ReadTextResource_875F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_87DA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_8820
		mov	word ptr [si], 668h
		mov	word ptr [si+4], 690h
		mov	byte_5DA20, 0
		call	PagedMemory_CheckDriverPresent_42DA7
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_59B75
		pop	cx
		push	0
		push	si
		call	sub_47DAD
		add	sp, 4
		test	di, 1
		jz	short loc_8820
		push	si
		call	sub_33B
		pop	cx

loc_8820:
		pop	di
		pop	si
		pop	bp
		retf
sub_87DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8824		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch
arg_A		= dword ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		mov	ax, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0
		mov	[bp+var_C], 0
		mov	[bp+var_8], eax
		mov	eax, [bp+arg_6]
		mov	[bp+var_4], eax
		mov	[bp+var_C], eax
		push	large [bp+arg_A]
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		mov	eax, [bp+var_8]
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		call	sub_43837
		add	sp, 0Ch
		leave
		retf
sub_8824		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_887F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0
		push	0
		push	0
		call	sub_4350A
		add	sp, 6
		mov	ax, 1
		pop	bp
		retf
sub_887F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8898		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_88D4
		mov	word ptr [si], 3D01h
		mov	word ptr [si+4], 3D29h
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_59B75
		pop	cx
		push	0
		push	si
		call	sub_47DAD
		add	sp, 4
		test	di, 1
		jz	short loc_88D4
		push	si
		call	sub_33B
		pop	cx

loc_88D4:
		pop	di
		pop	si
		pop	bp
		retf
sub_8898		endp

; ----------------------------------------------------------------------

sub_88D8		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
sub_88D8		endp
seg014		ends
