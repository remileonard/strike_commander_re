seg145		segment	para public 'CODE' use16
		assume cs:seg145
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 3Ch, 8, 3Bh, 66h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_634A4		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_4], 3
		jnz	short loc_634C5
		mov	eax, [bp+arg_0]
		and	eax, 0FFFFFEh
		add	eax, dword_7AB96
		add	eax, 10h
		jmp	short loc_63503

loc_634C5:
		mov	ax, word ptr [bp+arg_0+2]
		cmp	ax, word_7684C
		jnb	short loc_634E5
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_638AD
		nop
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		add	eax, dword_7AB96
		jmp	short loc_63503

loc_634E5:
		movzx	eax, word ptr [bp+arg_0+2]
		shl	eax, 4
		movzx	edx, word ptr [bp+arg_0]
		add	eax, edx
		mov	dx, ds
		movzx	edx, dx
		shl	edx, 4
		sub	eax, edx

loc_63503:
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		leave
		retf
sub_634A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63512		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	byte_7AB9C, 0
		jnz	short loc_6353F
		inc	byte_7AB9C
		mov	dword_7D212, 0
		mov	byte_7D216, 2
		mov	byte_7D217, 0
		mov	dword_7D218, 0

loc_6353F:
		cmp	[bp+arg_0], 10000h
		jnb	short loc_6355B
		mov	byte_7D216, 1
		mov	ax, word ptr [bp+arg_0]
		mov	word_7D214, ds
		mov	word ptr dword_7D212, ax
		jmp	loc_63622

loc_6355B:
		cmp	[bp+arg_0], 100000h
		jnb	short loc_63590
		mov	ax, ds
		movzx	eax, ax
		shl	eax, 4
		add	[bp+arg_0], eax
		mov	eax, [bp+arg_0]
		shr	eax, 4
		mov	dx, word ptr [bp+arg_0]
		and	dx, 0Fh
		mov	word_7D214, ax
		mov	word ptr dword_7D212, dx
		mov	byte_7D216, 2
		jmp	loc_63622

loc_63590:
		mov	dword_7D212, 0
		mov	eax, dword_7AB96
		sub	[bp+arg_0], eax
		mov	eax, [bp+arg_0]
		shr	eax, 0Eh
		mov	[bp+var_4], ax
		mov	ax, word ptr [bp+arg_0]
		and	ax, 3FFFh
		mov	[bp+var_2], ax
		xor	dx, dx
		jmp	short loc_635FA

loc_635B9:
		mov	bx, dx
		shl	bx, 2
		mov	ax, [bx+6AC2h]
		cmp	ax, [bp+var_4]
		jnz	short loc_635F9
		movzx	eax, dx
		shl	eax, 0Eh
		movzx	edx, [bp+var_2]
		add	eax, edx
		add	eax, 1000h
		mov	[bp+arg_0], eax
		shr	eax, 4
		mov	dx, word ptr [bp+arg_0]
		and	dx, 0Fh
		mov	word_7D214, ax
		mov	word ptr dword_7D212, dx
		mov	byte_7D216, 2
		jmp	short loc_63600

loc_635F9:
		inc	dx

loc_635FA:
		cmp	dx, word_7AB9A
		jb	short loc_635B9

loc_63600:
		cmp	dword_7D212, 0
		jnz	short loc_63622
		sub	[bp+arg_0], 10h
		or	[bp+arg_0], 4000001h
		mov	eax, [bp+arg_0]
		mov	dword_7D212, eax
		mov	byte_7D216, 3

loc_63622:
		mov	ax, 6AE2h
		leave
		retf
sub_63512		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; PagedMemory_DetectDriverSignatureA_2A8DF (sub_2A8DF de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PagedMemory_DetectDriverSignatureA_5B7F1 (sub_5B7F1
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐
; far, référencée via vtable (DATA XREF seg216) — détection matérielle : int 15h fonction
; 1209h avec signature bx=736Dh ("sm"). Probable détection du propre pilote de mémoire paginée
; du jeu (TSR maison, signature liée au nom "Strike Commander").
; ==============================================================================================
PagedMemory_DetectDriverSignatureA_63627		proc far
		push	bp
		mov	bp, sp
		pushf
		mov	ax, 1209h
		mov	bx, 736Dh
		int	15h
		popf
		mov	al, bl
		pop	bp
		retf
PagedMemory_DetectDriverSignatureA_63627		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; PagedMemory_DetectDriverSignatureB_2A8F0 (sub_2A8F0 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PagedMemory_DetectDriverSignatureB_5B802 (sub_5B802
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐
; far, variante de PagedMemory_DetectDriverSignatureA avec signature bx=534Dh ("SM", casse
; différente) — int 15h fonction 1209h. Référencée par sub_5B89D et sub_5B944.
; ==============================================================================================
PagedMemory_DetectDriverSignatureB_63638		proc far
		push	bp
		mov	bp, sp
		pushf
		mov	ax, 1209h
		mov	bx, 534Dh
		int	15h
		popf
		mov	al, bl
		pop	bp
		retf
PagedMemory_DetectDriverSignatureB_63638		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedMemory_LoadPage_2A901 (sub_2A901 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à PagedMemory_LoadPage_5B813 (sub_5B813 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, charge une page de 16
; Ko (probable appel au pilote de mémoire étendue/paginée détecté par les fonctions Detect*).
; Appelée en boucle par PagedMemory_ResolveAddress_5BBCC.
; ==============================================================================================
PagedMemory_LoadPage_63649		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, word_7AB7E
		cmp	byte ptr es:[bx], 0
		jz	short loc_636AB
		cmp	[bp+arg_0], 18h
		jb	short loc_63665
		push	150Eh
		call	sub_1DDFE
		pop	cx

loc_63665:
		mov	bx, [bp+arg_0]
		shl	bx, 2
		mov	ax, [bx+6A62h]
		cmp	ax, [bp+arg_2]
		jz	short loc_636D3
		mov	ax, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	dx, word_7AB82
		mov	ah, 44h
		int	67h
		or	ah, ah
		jnz	short loc_6368B
		mov	ax, 1
		jmp	short loc_6368D

loc_6368B:
		xor	ax, ax

loc_6368D:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6369C
		push	150Eh
		call	sub_1DDFE
		pop	cx

loc_6369C:
		mov	bx, [bp+arg_0]
		shl	bx, 2
		mov	ax, [bp+arg_2]
		mov	[bx+6A62h], ax
		jmp	short loc_636D3

loc_636AB:
		mov	ax, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	dx, word_7AB82
		mov	ah, 44h
		int	67h
		or	ah, ah
		jnz	short loc_636C2
		mov	ax, 1
		jmp	short loc_636C4

loc_636C2:
		xor	ax, ax

loc_636C4:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_636D3
		push	150Eh
		call	sub_1DDFE
		pop	cx

loc_636D3:
		pop	bp
		retf
PagedMemory_LoadPage_63649		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_636D5		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	60h
		push	ds
		push	offset unk_7D192
		push	large [bp+arg_0]
		call	sub_37C3
		add	sp, 0Ah
		pop	bp
		retf
sub_636D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_636EC		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	60h
		push	large [bp+arg_0]
		push	ds
		push	offset unk_7D192
		call	sub_37C3
		add	sp, 0Ah
		mov	ax, 5000h
		mov	cx, 18h
		mov	dx, word_7AB82
		mov	si, 6A62h
		int	67h
		or	ah, ah
		jnz	short loc_6371A
		mov	ax, 1
		jmp	short loc_6371C

loc_6371A:
		xor	ax, ax

loc_6371C:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6372B
		push	150Eh
		call	sub_1DDFE
		pop	cx

loc_6372B:
		pop	si
		pop	bp
		retf
sub_636EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; PagedMemory_InitDriver_2A98B (sub_2A98B de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à PagedMemory_InitDriver_5B89D (sub_5B89D de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, initialise le pilote de mémoire
; paginée : combine PagedMemory_DetectDriverSignatureA_5B7F1 et B_5B802 avec gestion d'erreur
; (sub_6B70F ×2).
; ==============================================================================================
PagedMemory_InitDriver_6372E		proc far

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_63627
		mov	[bp+var_1], al
		mov	ah, 42h
		int	67h
		or	ah, ah
		jnz	short loc_63748
		cmp	bx, 18h
		jnb	short loc_63751

loc_63748:
		push	150Ch
		call	sub_1DDFE
		pop	cx

loc_63751:
		cmp	bx, 1E0h
		jbe	short loc_6375A
		mov	bx, 1E0h

loc_6375A:
		mov	word_7AB84, bx
		movzx	eax, word_7AB84
		shl	eax, 0Eh
		mov	dword_7AB92, eax
		mov	ah, 43h
		int	67h
		mov	word_7AB82, dx
		or	ah, ah
		jz	short loc_63781
		push	150Ch
		call	sub_1DDFE
		pop	cx

loc_63781:
		mov	ah, 41h
		int	67h
		mov	word_7AB86, bx
		movzx	eax, word_7AB86
		shl	eax, 4
		mov	dword_7AB8A, eax
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_63638
		les	bx, word_7AB7E
		mov	al, es:[bx]
		cbw
		or	ax, ax
		jnz	short loc_637B0
		push	150Dh
		call	sub_1DDFE
		pop	cx

loc_637B0:
		mov	ah, 41h
		int	67h
		mov	word_7AB88, bx
		movzx	eax, word_7AB88
		shl	eax, 4
		mov	dword_7AB8E, eax
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_637D3
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_63627

loc_637D3:
		leave
		retf
PagedMemory_InitDriver_6372E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; PagedMemory_CheckDriverPresent_2AA32 (sub_2AA32 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à PagedMemory_CheckDriverPresent_5B944 (sub_5B944 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; vérifie la présence du pilote (PagedMemory_DetectDriverSignatureB_5B802) avec repli sur
; PagedMemory_DetectDriverSignatureA_5B7F1 en cas d'échec.
; ==============================================================================================
PagedMemory_CheckDriverPresent_637D5		proc far

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	word_7AB82, 0FFFFh
		jz	short loc_63817
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_63638
		mov	[bp+var_1], al
		mov	byte_7AC1A, 1
		mov	dx, word_7AB82
		mov	ah, 45h
		int	67h
		or	ah, ah
		jz	short loc_63804
		push	1512h
		call	sub_1DDFE
		pop	cx

loc_63804:
		mov	word_7AB82, 0FFFFh
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_63817
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_63627

loc_63817:
		leave
		retf
PagedMemory_CheckDriverPresent_637D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63819		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	ax, word_7AB80
		cmp	ax, word_7684C
		jbe	short loc_63837
		mov	di, word_7684C
		sub	di, 100h
		shr	di, 0Ah
		jmp	short loc_6384A

loc_63837:
		mov	di, word_7AB7E
		shr	di, 4
		add	di, word_7AB80
		inc	di
		add	di, 0FD80h
		sar	di, 0Ah

loc_6384A:
		or	di, di
		jle	short loc_638A9
		mov	word_7AB9A, di
		mov	[bp+var_2], 0
		jmp	short loc_63869

loc_63859:
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	ax, [bp+var_2]
		mov	[bx+6AC2h], ax
		inc	[bp+var_2]

loc_63869:
		cmp	[bp+var_2], di
		jl	short loc_63859
		mov	ax, 5002h
		mov	cx, word_7AB9A
		mov	dx, word_7AB82
		mov	si, 6AC2h
		int	67h
		or	ah, ah
		jnz	short loc_63887
		mov	ax, 1
		jmp	short loc_63889

loc_63887:
		xor	ax, ax

loc_63889:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_63898
		push	150Dh
		call	sub_1DDFE
		pop	cx

loc_63898:
		mov	ax, di
		shl	ax, 0Ah
		push	ax
		push	100h
		call	sub_65C40
		add	sp, 4

loc_638A9:
		pop	di
		pop	si
		leave
		retf
sub_63819		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_638AD		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		movzx	eax, [bp+arg_2]
		shl	eax, 4
		movzx	edx, [bp+arg_0]
		add	eax, edx
		mov	[bp+var_4], eax
		sub	[bp+var_4], 1000h
		mov	eax, [bp+var_4]
		shr	eax, 0Eh
		mov	dx, ax
		mov	bx, dx
		shl	bx, 2
		mov	si, [bx+6AC2h]
		cmp	dx, word_7AB9A
		jnb	short loc_638F6
		cmp	si, 0FFFFh
		jz	short loc_638F6
		cmp	si, word_7AB84
		jb	short loc_638FF

loc_638F6:
		push	1510h
		call	sub_1DDFE
		pop	cx

loc_638FF:
		movzx	eax, si
		shl	eax, 0Eh
		mov	edx, [bp+var_4]
		and	edx, 3FFFh
		add	eax, edx
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_638AD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6391D		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	1
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_63C15
		nop
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_4]
		mov	es:[bx], eax
		mov	dword ptr es:[bx+4], 0
		push	large [bp+arg_0]
		call	sub_64382
		add	sp, 4
		push	1
		mov	eax, [bp+arg_0]
		add	eax, [bp+arg_4]
		push	eax
		push	cs
		call	near ptr sub_63C15
		nop
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	dword ptr es:[bx], 11h
		mov	eax, [bp+arg_0]
		mov	es:[bx+4], eax
		leave
		retf
sub_6391D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63987		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	ax, word_7AB9A
		add	ax, 14h
		movzx	eax, ax
		shl	eax, 0Eh
		mov	[bp+var_4], eax
		push	1
		push	eax
		push	cs
		call	near ptr sub_63C15
		nop
		add	sp, 6
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		les	bx, [bp+var_8]
		mov	dword ptr es:[bx], 11h
		xor	eax, eax
		mov	es:[bx+8], eax
		mov	es:[bx+0Ch], eax
		mov	es:[bx+4], eax
		add	[bp+var_4], 10h
		jmp	short loc_63A07

loc_639D5:
		push	large 0FFD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_6391D
		add	sp, 8
		add	[bp+var_4], 0FFE0h
		push	large 10010h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_6391D
		add	sp, 8
		add	[bp+var_4], 10020h

loc_63A07:
		mov	eax, [bp+var_4]
		add	eax, 20000h
		cmp	eax, dword_7AB92
		jb	short loc_639D5
		mov	eax, dword_7AB92
		sub	eax, [bp+var_4]
		sub	eax, 8000h
		add	eax, 10h
		cmp	eax, 10010h
		jl	short loc_63A66
		push	large 3FD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_6391D
		add	sp, 8
		add	[bp+var_4], 3FE0h
		push	large 10010h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_6391D
		add	sp, 8
		add	[bp+var_4], 10020h
		jmp	short loc_63A90

loc_63A66:
		mov	eax, [bp+var_4]
		add	eax, 0FFF0h
		cmp	eax, dword_7AB92
		jnb	short loc_63A90
		push	large 0FFD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_6391D
		add	sp, 8
		add	[bp+var_4], 0FFE0h

loc_63A90:
		mov	eax, dword_7AB92
		sub	eax, [bp+var_4]
		sub	eax, 10h
		push	eax
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_6391D
		add	sp, 8
		leave
		retf
sub_63987		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63AAB		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		cmp	word_7AB82, 0FFFFh
		jz	short loc_63AC4
		push	150Ah
		call	sub_1DDFE
		pop	cx

loc_63AC4:
		mov	ax, 1209h
		mov	bx, 4143h
		int	15h
		or	ax, ax
		jnz	short loc_63AD6
		cmp	bx, 1209h
		jz	short loc_63ADF

loc_63AD6:
		push	150Bh
		call	sub_1DDFE
		pop	cx

loc_63ADF:
		mov	[bp+var_2], 0
		jmp	short loc_63B02

loc_63AE6:
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	word ptr [bx+6A62h], 0FFFFh
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	ax, [bp+var_2]
		mov	[bx+6A64h], ax
		inc	[bp+var_2]

loc_63B02:
		cmp	[bp+var_2], 18h
		jl	short loc_63AE6
		mov	[bp+var_2], 0
		jmp	short loc_63B2B

loc_63B0F:
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	word ptr [bx+6AC2h], 0FFFFh
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	ax, [bp+var_2]
		mov	[bx+6AC4h], ax
		inc	[bp+var_2]

loc_63B2B:
		cmp	[bp+var_2], 8
		jl	short loc_63B0F
		mov	ax, 1209h
		mov	bx, 4646h
		int	15h
		mov	word_7AB80, es
		mov	word_7AB7E, di
		or	ax, ax
		jz	short loc_63B4E
		push	150Dh
		call	sub_1DDFE
		pop	cx

loc_63B4E:
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_63638
		push	cs
		call	near ptr PagedMemory_InitDriver_6372E
		mov	ax, 5000h
		mov	cx, 18h
		mov	dx, word_7AB82
		mov	si, 6A62h
		int	67h
		or	ah, ah
		jnz	short loc_63B6E
		mov	ax, 1
		jmp	short loc_63B70

loc_63B6E:
		xor	ax, ax

loc_63B70:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_63B7F
		push	150Dh
		call	sub_1DDFE
		pop	cx

loc_63B7F:
		push	cs
		call	near ptr sub_63819
		mov	ax, 1209h
		mov	bx, 4648h
		mov	dx, word_7AB82
		int	15h
		mov	dword_7AB96, edx
		or	ax, ax
		jz	short loc_63BA1
		push	150Dh
		call	sub_1DDFE
		pop	cx

loc_63BA1:
		mov	ax, ds
		movzx	eax, ax
		shl	eax, 4
		sub	dword_7AB96, eax
		push	cs
		call	near ptr sub_63987
		mov	[bp+var_2], 0
		jmp	short loc_63BD0

loc_63BBB:
		mov	ax, [bp+var_2]
		add	ax, word_7AB9A
		push	ax
		push	[bp+var_2]
		push	cs
		call	near ptr PagedMemory_LoadPage_63649
		add	sp, 4
		inc	[bp+var_2]

loc_63BD0:
		cmp	[bp+var_2], 14h
		jl	short loc_63BBB
		push	5000h
		push	word_7AB88
		call	sub_65C40
		add	sp, 4
		call	sub_4965
		cmp	word_7AB88, 0B000h
		jnb	short loc_63C11
		push	0
		push	0
		push	large 0C7013Fh
		push	large 0
		push	large 10FFFFh
		push	word_7AF7E
		call	TextFormat_InitAttributeTable_67DCE
		add	sp, 12h

loc_63C11:
		pop	di
		pop	si
		leave
		retf
sub_63AAB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63C15		proc far

var_F		= byte ptr -0Fh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	eax, [bp+arg_0]
		shr	eax, 0Eh
		mov	[bp+var_2], ax
		les	bx, word_7AB7E
		cmp	byte ptr es:[bx], 0
		jz	short loc_63C5A
		cmp	[bp+arg_4], 4
		jbe	short loc_63C41
		push	150Fh
		call	sub_1DDFE
		pop	cx

loc_63C41:
		mov	ax, 5
		sub	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		xor	dx, dx
		div	[bp+var_4]
		add	dx, 14h
		mov	[bp+var_6], dx
		jmp	short loc_63C64

loc_63C5A:
		mov	[bp+var_6], 0
		mov	[bp+arg_4], 4

loc_63C64:
		les	bx, word_7AB7E
		cmp	byte ptr es:[bx], 0
		jnz	short loc_63C71
		jmp	loc_63CF9

loc_63C71:
		cmp	[bp+arg_4], 1
		jnz	short loc_63C87
		push	[bp+var_2]
		push	[bp+var_6]
		push	cs
		call	near ptr PagedMemory_LoadPage_63649
		add	sp, 4
		jmp	loc_63D21

loc_63C87:
		mov	[bp+var_F], 0
		xor	di, di
		jmp	short loc_63CB8

loc_63C8F:
		mov	bx, [bp+var_6]
		add	bx, di
		shl	bx, 2
		mov	ax, [bp+var_2]
		add	ax, di
		cmp	[bx+6A62h], ax
		jz	short loc_63CB7
		mov	bx, [bp+var_6]
		add	bx, di
		shl	bx, 2
		mov	ax, [bp+var_2]
		add	ax, di
		mov	[bx+6A62h], ax
		mov	[bp+var_F], 1

loc_63CB7:
		inc	di

loc_63CB8:
		cmp	di, [bp+arg_4]
		jnb	short loc_63CC8
		mov	ax, [bp+var_2]
		add	ax, di
		cmp	ax, word_7AB84
		jb	short loc_63C8F

loc_63CC8:
		cmp	[bp+var_F], 0
		jz	short loc_63D21
		mov	ax, 5000h
		mov	cx, 18h
		mov	dx, word_7AB82
		mov	si, 6A62h
		int	67h
		or	ah, ah
		jnz	short loc_63CE6
		mov	ax, 1
		jmp	short loc_63CE8

loc_63CE6:
		xor	ax, ax

loc_63CE8:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_63D21
		push	150Eh
		call	sub_1DDFE
		pop	cx
		jmp	short loc_63D21

loc_63CF9:
		xor	di, di
		jmp	short loc_63D11

loc_63CFD:
		mov	ax, [bp+var_2]
		add	ax, di
		push	ax
		mov	ax, [bp+var_6]
		add	ax, di
		push	ax
		push	cs
		call	near ptr PagedMemory_LoadPage_63649
		add	sp, 4
		inc	di

loc_63D11:
		cmp	di, [bp+arg_4]
		jnb	short loc_63D21
		mov	ax, [bp+var_2]
		add	ax, di
		cmp	ax, word_7AB84
		jb	short loc_63CFD

loc_63D21:
		movzx	eax, [bp+var_6]
		shl	eax, 0Eh
		mov	edx, [bp+arg_0]
		and	edx, 3FFFh
		add	edx, eax
		mov	[bp+var_A], edx
		les	bx, word_7AB7E
		cmp	byte ptr es:[bx], 0
		jz	short loc_63D5E
		mov	eax, dword_7AB8E
		add	[bp+var_A], eax
		mov	eax, [bp+var_A]
		shr	eax, 4
		mov	dx, word ptr [bp+var_A]
		and	dx, 0Fh
		jmp	short loc_63D64

loc_63D5E:
		mov	ax, word_7AB86
		mov	dx, word ptr [bp+var_A]

loc_63D64:
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]
		pop	di
		pop	si
		leave
		retf
sub_63C15		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63D74		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, word_7AB7E
		cmp	byte ptr es:[bx], 0
		jnz	short loc_63D8E
		push	1510h
		call	sub_1DDFE
		pop	cx

loc_63D8E:
		mov	ax, word ptr [bp+arg_0+2]
		cmp	ax, word_7684C
		jnb	short loc_63DA4
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_638AD
		add	sp, 4
		jmp	short loc_63E09

loc_63DA4:
		movzx	eax, word ptr [bp+arg_0+2]
		shl	eax, 4
		movzx	edx, word ptr [bp+arg_0]
		add	eax, edx
		mov	[bp+var_4], eax
		mov	eax, dword_7AB8E
		sub	[bp+var_4], eax
		mov	eax, [bp+var_4]
		shr	eax, 0Eh
		mov	dx, ax
		mov	bx, dx
		shl	bx, 2
		mov	si, [bx+6A62h]
		cmp	dx, 18h
		jnb	short loc_63DE5
		cmp	si, 0FFFFh
		jz	short loc_63DE5
		cmp	si, word_7AB84
		jb	short loc_63DEE

loc_63DE5:
		push	1510h
		call	sub_1DDFE
		pop	cx

loc_63DEE:
		movzx	eax, si
		shl	eax, 0Eh
		mov	edx, [bp+var_4]
		and	edx, 3FFFh
		add	eax, edx
		shld	edx, eax, 10h

loc_63E09:
		pop	si
		leave
		retf
sub_63D74		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; PagedMemory_WriteByte_2AE02 (sub_2AE02 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à PagedMemory_WriteByte_5BD14 (sub_5BD14 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, écrit un octet à une adresse
; paginée (PagedMemory_ResolveAddress_5BBCC + gestion d'erreur sub_6B70F).
; ==============================================================================================
PagedMemory_WriteByte_63E0C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0Fh
		cmp	eax, 1
		jnz	short loc_63E25
		mov	ax, 1
		jmp	short loc_63E27

loc_63E25:
		xor	ax, ax

loc_63E27:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_63E36
		push	1509h
		call	sub_1DDFE
		pop	cx

loc_63E36:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		shr	eax, 18h
		push	ax
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		push	cs
		call	near ptr sub_63C15
		add	sp, 6
		pop	bp
		retf
PagedMemory_WriteByte_63E0C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63E5B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	1
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		push	eax
		push	cs
		call	near ptr sub_63C15
		add	sp, 6
		pop	bp
		retf
sub_63E5B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63E78		proc far

var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 12h
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		test	byte ptr es:[bx], 1
		jnz	short loc_63E8E
		jmp	loc_63F1C

loc_63E8E:
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		mov	[bp+var_A], eax
		push	1
		push	eax
		push	cs
		call	near ptr sub_63C15
		add	sp, 6
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		les	bx, [bp+var_6]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		mov	edx, [bp+var_A]
		add	edx, eax
		mov	[bp+var_E], edx
		mov	eax, es:[bx+4]
		mov	[bp+var_12], eax
		push	1
		push	edx
		push	cs
		call	near ptr sub_63C15
		add	sp, 6
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		les	bx, [bp+var_6]
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_A]
		jnz	short loc_63F33
		cmp	[bp+var_12], 0
		jz	short loc_63F2F
		push	1
		push	large [bp+var_12]
		push	cs
		call	near ptr sub_63C15
		add	sp, 6
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		les	bx, [bp+var_6]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		add	eax, [bp+var_12]
		cmp	eax, [bp+var_A]
		jnz	short loc_63F33
		jmp	short loc_63F2F

loc_63F1C:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jnz	short loc_63F33

loc_63F2F:
		mov	[bp+var_1], 1

loc_63F33:
		mov	al, [bp+var_1]
		leave
		retf
sub_63E78		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_63F38		proc far

var_76		= word ptr -76h
var_26		= byte ptr -26h
var_25		= byte ptr -25h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= byte ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 76h
		push	si
		mov	si, [bp+arg_4]
		xor	eax, eax
		mov	[bp+var_14], eax
		mov	[bp+var_10], eax
		mov	[bp+var_C], eax
		mov	ax, word_7AB9A
		add	ax, 14h
		movzx	eax, ax
		shl	eax, 0Eh
		mov	[bp+var_8], eax
		cmp	[bp+arg_0], 0
		jnz	short loc_63F6C
		jmp	loc_6413C

loc_63F6C:
		push	446Dh
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		or	si, si
		jnz	short loc_63F82
		jmp	loc_64132

loc_63F82:
		push	si
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	loc_6413C
		jmp	loc_64132

loc_63F95:
		mov	eax, [bp+var_14]
		add	[bp+var_8], eax
		push	1
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		mov	[bp+var_14], eax
		mov	al, byte ptr [bp+var_14]
		and	al, 1
		mov	[bp+var_25], al
		and	[bp+var_14], 0FFFFFFFEh
		mov	eax, [bp+var_14]
		shr	eax, 4
		cmp	eax, 2
		jnb	short loc_63FD9
		jmp	loc_6413C

loc_63FD9:
		cmp	[bp+var_25], 0
		jz	short loc_63FE9
		mov	eax, [bp+var_14]
		add	[bp+var_10], eax
		jmp	short loc_63FF1

loc_63FE9:
		mov	eax, [bp+var_14]
		add	[bp+var_C], eax

loc_63FF1:
		mov	[bp+var_26], 0
		mov	eax, [bp+var_8]
		add	eax, [bp+var_14]
		mov	[bp+var_18], eax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+4]
		mov	[bp+var_1C], eax
		mov	eax, es:[bx+0Ch]
		mov	[bp+var_20], eax
		mov	eax, es:[bx+8]
		mov	[bp+var_24], eax
		push	1
		push	large [bp+var_18]
		push	cs
		call	near ptr sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_8]
		jnz	short loc_64073
		cmp	[bp+var_1C], 0
		jz	short loc_6406F
		push	1
		push	large [bp+var_1C]
		push	cs
		call	near ptr sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_8]
		jnz	short loc_64073

loc_6406F:
		mov	[bp+var_26], 1

loc_64073:
		cmp	[bp+var_26], 0
		jz	short loc_640DE
		mov	al, [bp+var_25]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_640DE
		push	1
		push	large [bp+var_24]
		push	cs
		call	near ptr sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		cmp	eax, [bp+var_8]
		jnz	short loc_640A8
		mov	ax, 1
		jmp	short loc_640AA

loc_640A8:
		xor	ax, ax

loc_640AA:
		mov	[bp+var_26], al
		cmp	[bp+var_26], 0
		jz	short loc_640DE
		push	1
		push	large [bp+var_20]
		push	cs
		call	near ptr sub_63C15
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		cmp	eax, [bp+var_8]
		jnz	short loc_640D9
		mov	ax, 1
		jmp	short loc_640DB

loc_640D9:
		xor	ax, ax

loc_640DB:
		mov	[bp+var_26], al

loc_640DE:
		mov	al, [bp+var_26]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_640F0
		push	1507h
		call	sub_1DDFE
		pop	cx

loc_640F0:
		mov	al, [bp+arg_0]
		mov	ah, 0
		or	ax, ax
		jz	short loc_6413C
		cmp	[bp+var_25], 0
		jz	short loc_64105
		cmp	[bp+arg_2], 0
		jnz	short loc_6413C

loc_64105:
		push	large [bp+var_14]
		push	large [bp+var_8]
		cmp	[bp+var_25], 0
		jz	short loc_64118
		mov	ax, 44A9h
		jmp	short loc_6411B

loc_64118:
		mov	ax, 44B3h

loc_6411B:
		push	ax
		push	4489h
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Eh
		or	si, si
		jz	short loc_64132
		jmp	loc_63F82

loc_64132:
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_6413C:
		mov	eax, [bp+var_8]
		add	eax, [bp+var_14]
		cmp	eax, dword_7AB92
		jnb	short loc_6414E
		jmp	loc_63F95

loc_6414E:
		cmp	[bp+arg_0], 0
		jz	short loc_64188
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	44B8h
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	si, si
		jz	short loc_6417E
		push	si
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_64188

loc_6417E:
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_64188:
		pop	si
		leave
		retf
sub_63F38		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6418B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, [bp+arg_0]
		shr	ax, 4
		mov	bx, [bp+arg_2]
		add	bx, ax
		mov	ax, [bp+arg_0]
		and	ax, 0Fh
		mov	[bp+arg_2], bx
		mov	[bp+arg_0], ax
		mov	ax, [bp+arg_4]
		shr	ax, 4
		mov	bx, [bp+arg_6]
		add	bx, ax
		mov	ax, [bp+arg_4]
		and	ax, 0Fh
		mov	[bp+arg_6], bx
		mov	[bp+arg_4], ax
		push	ds
		jmp	short loc_641FE

loc_641C1:
		cmp	[bp+arg_8], 0FFF0h
		jbe	short loc_641D0
		mov	ax, 0FFF0h
		jmp	short loc_641D3

loc_641D0:
		mov	ax, word ptr [bp+arg_8]

loc_641D3:
		mov	bx, ax
		lds	si, [bp+arg_4]
		les	di, [bp+arg_0]
		mov	cx, bx
		and	cx, 3
		rep movsb
		mov	ax, bx
		shr	ax, 2
		mov	cx, ax
		rep movsd
		add	[bp+arg_2], 0FFFh
		add	[bp+arg_6], 0FFFh
		movzx	eax, bx
		sub	[bp+arg_8], eax

loc_641FE:
		cmp	[bp+arg_8], 0
		jnz	short loc_641C1
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_6418B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6420A		proc far
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ecx, dword_7D224
		mov	esi, dword_7D220
		mov	edi, dword_7D21C
		mov	dl, cl
		and	dl, 3
		shr	ecx, 2
		cld
		rep movsd
		mov	cl, dl
		rep movsb
		pop	di
		pop	si
		pop	bp
		retf
sub_6420A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64235		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_7D21C, eax
		mov	eax, [bp+arg_4]
		mov	dword_7D220, eax
		mov	eax, [bp+arg_8]
		mov	dword_7D224, eax
		push	ds
		pop	es
		mov	dx, 0D6Ah
		movzx	edx, dx
		mov	ax, 1209h
		mov	bx, 5350h
		xor	cx, cx
		int	15h
		pop	bp
		retf
sub_64235		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64265		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		push	large [bp+arg_8]
		mov	eax, [bp+arg_4]
		add	eax, dword_7AB96
		push	eax
		mov	eax, [bp+arg_0]
		add	eax, dword_7AB96
		push	eax
		push	cs
		call	near ptr sub_64235
		add	sp, 0Ch
		pop	bp
		retf
sub_64265		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6428B		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		push	large [bp+arg_C]
		push	2
		push	large [bp+arg_8]
		push	cs
		call	near ptr sub_634A4
		add	sp, 6
		push	dx
		push	ax
		push	3
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		shld	edx, eax, 10h
		push	dx
		push	ax
		push	cs
		call	near ptr sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		add	eax, [bp+arg_4]
		push	eax
		push	cs
		call	near ptr sub_64235
		add	sp, 0Ch
		pop	bp
		retf
sub_6428B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_642D1		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		push	large [bp+arg_C]
		push	3
		les	bx, [bp+arg_4]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		shld	edx, eax, 10h
		push	dx
		push	ax
		push	cs
		call	near ptr sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		add	eax, [bp+arg_8]
		push	eax
		push	2
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_634A4
		add	sp, 6
		push	dx
		push	ax
		push	cs
		call	near ptr sub_64235
		add	sp, 0Ch
		pop	bp
		retf
sub_642D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_64317		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7AB9C, 0
		jz	short loc_6435D
		cmp	byte_7D217, 0
		jz	short loc_64346
		cmp	dword_7D212, 0
		jz	short loc_64346
		push	0
		mov	al, byte_7D216
		push	ax
		push	6AE2h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_64346

loc_64346:
		mov	dword_7D212, 0
sub_64317		endp

; START OF FUNCTION CHUNK FOR sub_64317
		db 0C6h
; END OF FUNCTION CHUNK FOR sub_64317
seg145		ends
