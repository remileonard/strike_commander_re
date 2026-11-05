seg004		segment	para public 'CODE' use16
		assume cs:seg004
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0BBh, 46h, 53h, 0CDh, 15h, 5Fh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4988		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		cmp	word_76ADA, 0
		jnz	short loc_499F
		mov	byte_7AC2A, 0
		call	PagedMemory_CheckDriverPresent_637D5

loc_499F:
		pop	bp
		retf
sub_4988		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_49A1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_49EE
		mov	word ptr [si], 138h
		mov	word ptr [si+4], 160h
		cmp	word_76ADA, 0
		jnz	short loc_49CA
		mov	byte_7AC2A, 0
		call	PagedMemory_CheckDriverPresent_637D5

loc_49CA:
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_765E5
		pop	cx
		push	0
		push	si
		call	sub_68298
		add	sp, 4
		test	di, 1
		jz	short loc_49EE
		push	si
		call	sub_3B2
		pop	cx

loc_49EE:
		pop	di
		pop	si
		pop	bp
		retf
sub_49A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_49F2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 3
		pop	bp
		retf
sub_49F2		endp

; ----------------------------------------------------------------------

sub_49FC		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	sub_49A1
sub_49FC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4A08		proc far

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
		call	sub_6478E
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		leave
		retf
sub_4A08		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4A2F		proc far

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
		jz	short loc_4A69
		mov	eax, [si]
		mov	[bp+var_4], eax
		mov	[bp+var_8], 0
		mov	[bp+var_8], eax
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		call	sub_6494D
		add	sp, 4
		mov	dword ptr [si], 0

loc_4A69:
		pop	si
		leave
		retf
sub_4A2F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4A6C		proc far

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
		call	PagedMemory_WriteByte_63E0C
		add	sp, 4
		leave
		retf
sub_4A6C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4A98		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		call	sub_64BBF
		pop	bp
		retf
sub_4A98		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4AA5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, 1
		pop	bp
		retf
sub_4AA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4AB0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_7AC2A
		pop	bp
		retf
sub_4AB0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4ABB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	byte_7AC2A, 0
		call	PagedMemory_CheckDriverPresent_637D5
		pop	bp
		retf
sub_4ABB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
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
PagedMemory_ReadTextResource_4ACD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_4AE6
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4B43

loc_4AE6:
		mov	word ptr [si], 0D7Ch
		mov	ax, word_7AFA2
		mov	[si+2], ax
		mov	word_7AFA2, si
		mov	word ptr [si+4], 372h
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+8], seg seg173
		mov	word ptr [si+6], 2
		mov	word ptr [si], 44FBh
		mov	word ptr [si+4], 4523h
		mov	word ptr [si], 138h
		mov	word ptr [si+4], 160h
		cmp	byte_7AC2A, 0
		jz	short loc_4B39
		push	300h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_76675
		add	sp, 4
		jmp	short loc_4B3E

loc_4B39:
		call	sub_63AAB

loc_4B3E:
		mov	byte_7AC2A, 1

loc_4B43:
		mov	ax, si
		pop	si
		pop	bp
		retf
PagedMemory_ReadTextResource_4ACD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4B48		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4B8E
		mov	word ptr [si], 138h
		mov	word ptr [si+4], 160h
		mov	byte_7AC2A, 0
		call	PagedMemory_CheckDriverPresent_637D5
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_765E5
		pop	cx
		push	0
		push	si
		call	sub_68298
		add	sp, 4
		test	di, 1
		jz	short loc_4B8E
		push	si
		call	sub_3B2
		pop	cx

loc_4B8E:
		pop	di
		pop	si
		pop	bp
		retf
sub_4B48		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4B92		proc far

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
		call	sub_64265
		add	sp, 0Ch
		leave
		retf
sub_4B92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BED		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0
		push	0
		push	0
		call	sub_63F38
		add	sp, 6
		mov	ax, 1
		pop	bp
		retf
sub_4BED		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4C06		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4C42
		mov	word ptr [si], 44FBh
		mov	word ptr [si+4], 4523h
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	sub_765E5
		pop	cx
		push	0
		push	si
		call	sub_68298
		add	sp, 4
		test	di, 1
		jz	short loc_4C42
		push	si
		call	sub_3B2
		pop	cx

loc_4C42:
		pop	di
		pop	si
		pop	bp
		retf
sub_4C06		endp

; ----------------------------------------------------------------------

sub_4C46		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
sub_4C46		endp

; START OF FUNCTION CHUNK FOR sub_4C46
		db 0E9h
; END OF FUNCTION CHUNK FOR sub_4C46
seg004		ends
