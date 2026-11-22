seg103		segment	para public 'CODE' use16
		assume cs:seg103
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 2, 68h, 0B0h, 67h, 0Eh, 0E8h, 0B6h, 0FFh, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44B8D		proc far

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
sub_44B8D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44BA0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		cmp	dword ptr [si], 0
		jz	short loc_44BC2
		push	large [si]
		call	sub_349
		add	sp, 4
		mov	dword ptr [si], 0

loc_44BC2:
		pop	si
		pop	bp
		retf
sub_44BA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44BC5		proc far

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
sub_44BC5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44BDE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		call	sub_451F9
		movzx	eax, ax
		shld	edx, eax, 10h
		pop	bp
		retf
sub_44BDE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44BF4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0
		push	0
		call	sub_44CF0
		add	sp, 4
		xor	ax, ax
		pop	bp
		retf
sub_44BF4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44C0A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_5DBDA
		pop	bp
		retf
sub_44C0A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedResourceC_Construct_65643 (sub_65643 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
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
PagedResourceC_Construct_44C15		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_44C2E
		push	0Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_44C84

loc_44C2E:
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
		mov	word ptr [si], 3EE5h
		mov	word ptr [si+4], 3F0Dh
		cmp	byte_5DBDA, 0
		jz	short loc_44C7F
		push	3EBBh
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_59C00
		add	sp, 4

loc_44C7F:
		mov	byte_5DBDA, 1

loc_44C84:
		mov	ax, si
		pop	si
		pop	bp
		retf
PagedResourceC_Construct_44C15		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44C89		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_44CBE
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
		jz	short loc_44CBE
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_44CBE

loc_44CBE:
		pop	di
		pop	si
		pop	bp
		retf
sub_44C89		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44CC2		proc far

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
sub_44CC2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44CD0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		xor	ax, ax
		pop	bp
		retf
sub_44CD0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_44CDA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 1
		pop	bp
		retf
sub_44CDA		endp

; ----------------------------------------------------------------------

sub_44CE4		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFFCh
		nop
		nop
		jmp	sub_44C89
sub_44CE4		endp
seg103		ends
