seg101		segment	para public 'CODE' use16
		assume cs:seg101
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 2, 68h, 14h, 6Ch, 0Eh, 0E8h, 0B6h, 0FFh, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32C1D		proc far

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
sub_32C1D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32C30		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	dword ptr [si], 0
		jz	short loc_32C52
		push	large [si]
		call	sub_3AA
		add	sp, 4
		mov	dword ptr [si], 0

loc_32C52:
		pop	si
		pop	bp
		retf
sub_32C30		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32C55		proc far

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
sub_32C55		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32C6E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		call	sub_33289
		movzx	eax, ax
		shld	edx, eax, 10h
		pop	bp
		retf
sub_32C6E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32C84		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0
		push	0
		call	sub_32D80
		add	sp, 4
		xor	ax, ax
		pop	bp
		retf
sub_32C84		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32C9A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_4D204
		pop	bp
		retf
sub_32C9A		endp

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
PagedResourceC_Construct_32CA5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_32CBE
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_32D14

loc_32CBE:
		mov	word ptr [si], 1B4h
		mov	ax, word_4D392
		mov	[si+2], ax
		mov	word_4D392, si
		mov	word ptr [si+4], 4511h
		mov	word ptr [si+0Ah], 0
		mov	word ptr [si+0Ch], 0
		mov	word ptr [si+8], seg seg123
		mov	word ptr [si+6], 7
		mov	word ptr [si], 466Bh
		mov	word ptr [si+4], 4693h
		mov	word ptr [si], 484Fh
		mov	word ptr [si+4], 4877h
		cmp	byte_4D204, 0
		jz	short loc_32D0F
		push	4825h
		mov	ax, si
		add	ax, 4
		push	ax
		call	DisplayContext_CommitFrame_30078
		add	sp, 4

loc_32D0F:
		mov	byte_4D204, 1

loc_32D14:
		mov	ax, si
		pop	si
		pop	bp
		retf
PagedResourceC_Construct_32CA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32D19		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_32D4E
		mov	ax, si
		add	ax, 0Ah
		push	ax
		call	Member_ClearAndFree_2F796
		pop	cx
		push	0
		push	si
		call	sub_35D92
		add	sp, 4
		test	di, 1
		jz	short loc_32D4E
		push	si
		call	sub_39C
		pop	cx
		jmp	short loc_32D4E

loc_32D4E:
		pop	di
		pop	si
		pop	bp
		retf
sub_32D19		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32D52		proc far

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
sub_32D52		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32D60		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_32D60		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_32D6A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_32D6A		endp

; ----------------------------------------------------------------------

sub_32D74		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	sub_32D19
sub_32D74		endp
seg101		ends
