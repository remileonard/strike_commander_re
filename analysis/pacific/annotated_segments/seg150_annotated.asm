seg150		segment	para public 'CODE' use16
		assume cs:seg150
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 4, 6Bh, 0Eh, 0E8h, 0B6h, 0FFh, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_655BB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_2]
		call	CRT_Malloc16_Retry
		pop	cx
		mov	dx, ds
		pop	bp
		retf
sub_655BB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_655CE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	dword ptr [si], 0
		jz	short loc_655F0
		push	large [si]
		call	sub_3C0
		add	sp, 4
		mov	dword ptr [si], 0

loc_655F0:
		pop	si
		pop	bp
		retf
sub_655CE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_655F3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_6		= word ptr  0Ch
arg_A		= word ptr  10h

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	[bp+arg_A]
		push	[bp+arg_6]
		push	[bp+arg_2]
		call	CRT_Memmove
		add	sp, 6
		pop	bp
		retf
sub_655F3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6560C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		call	DisplayCache_GetHeadValue_65C27
		movzx	eax, ax
		shld	edx, eax, 10h
		pop	bp
		retf
sub_6560C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65622		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0
		push	0
		call	sub_6571E
		add	sp, 4
		xor	ax, ax
		pop	bp
		retf
sub_65622		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65638		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_7ADE4
		pop	bp
		retf
sub_65638		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedResourceC_Construct_2BE28 (sub_2BE28 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à PagedResourceC_Construct_5CD3A (sub_5CD3A de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, constructeur
; multi-héritage (Borland) : alloue si besoin (sub_658, 0x0E octets), chaîne l'instance dans
; une liste globale (word_70EA8), pose successivement les tags vtable des classes de base
; héritées (129Eh, 39E3h, 39EBh/3A13h — la classe PagedTextObject de seg128 —, puis
; 3C45h/3C6Dh pour cette classe finale). Lors de la toute première construction
; (byte_70CCA==0), enregistre un gestionnaire global (sub_5F460, tag 3C1Bh). Référencée par
; Memory_AllocatorTableConstructor_5C9D3 (seg131).
; ==============================================================================================
PagedResourceC_Construct_65643		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_6565C
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_656B2

loc_6565C:
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
		mov	word ptr [si], 46DFh
		mov	word ptr [si+4], 4707h
		cmp	byte_7ADE4, 0
		jz	short loc_656AD
		push	46B5h
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_76670
		add	sp, 4

loc_656AD:
		mov	byte_7ADE4, 1

loc_656B2:
		mov	ax, si
		pop	si
		pop	bp
		retf
PagedResourceC_Construct_65643		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_656B7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_656EC
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
		jz	short loc_656EC
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_656EC

loc_656EC:
		pop	di
		pop	si
		pop	bp
		retf
sub_656B7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_656F0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_4]
		mov	ax, [bp+arg_2]
		pop	bp
		retf
sub_656F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_656FE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_656FE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_65708		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
sub_65708		endp
seg150		ends
