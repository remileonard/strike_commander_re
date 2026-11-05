seg098		segment	para public 'CODE' use16
		assume cs:seg098
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0, 8Ah, 46h, 0FFh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42A76		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_4], 3
		jnz	short loc_42A97
		mov	eax, [bp+arg_0]
		and	eax, 0FFFFFEh
		add	eax, dword_5D98C
		add	eax, 10h
		jmp	short loc_42AD5

loc_42A97:
		mov	ax, word ptr [bp+arg_0+2]
		cmp	ax, word_59E3D
		jnb	short loc_42AB7
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_42E7F
		nop
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		add	eax, dword_5D98C
		jmp	short loc_42AD5

loc_42AB7:
		movzx	eax, word ptr [bp+arg_0+2]
		shl	eax, 4
		movzx	edx, word ptr [bp+arg_0]
		add	eax, edx
		mov	dx, ds
		movzx	edx, dx
		shl	edx, 4
		sub	eax, edx

loc_42AD5:
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		leave
		retf
sub_42A76		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42AE4		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	byte_5D992, 0
		jnz	short loc_42B11
		inc	byte_5D992
		mov	dword_604AE, 0
		mov	byte_604B2, 2
		mov	byte_604B3, 0
		mov	dword_604B4, 0

loc_42B11:
		cmp	[bp+arg_0], 10000h
		jnb	short loc_42B2D
		mov	byte_604B2, 1
		mov	ax, word ptr [bp+arg_0]
		mov	word_604B0, ds
		mov	word ptr dword_604AE, ax
		jmp	loc_42BF4

loc_42B2D:
		cmp	[bp+arg_0], 100000h
		jnb	short loc_42B62
		mov	ax, ds
		movzx	eax, ax
		shl	eax, 4
		add	[bp+arg_0], eax
		mov	eax, [bp+arg_0]
		shr	eax, 4
		mov	dx, word ptr [bp+arg_0]
		and	dx, 0Fh
		mov	word_604B0, ax
		mov	word ptr dword_604AE, dx
		mov	byte_604B2, 2
		jmp	loc_42BF4

loc_42B62:
		mov	dword_604AE, 0
		mov	eax, dword_5D98C
		sub	[bp+arg_0], eax
		mov	eax, [bp+arg_0]
		shr	eax, 0Eh
		mov	[bp+var_4], ax
		mov	ax, word ptr [bp+arg_0]
		and	ax, 3FFFh
		mov	[bp+var_2], ax
		xor	dx, dx
		jmp	short loc_42BCC

loc_42B8B:
		mov	bx, dx
		shl	bx, 2
		mov	ax, [bx+676Eh]
		cmp	ax, [bp+var_4]
		jnz	short loc_42BCB
		movzx	eax, dx
		shl	eax, 0Eh
		movzx	edx, [bp+var_2]
		add	eax, edx
		add	eax, 1000h
		mov	[bp+arg_0], eax
		shr	eax, 4
		mov	dx, word ptr [bp+arg_0]
		and	dx, 0Fh
		mov	word_604B0, ax
		mov	word ptr dword_604AE, dx
		mov	byte_604B2, 2
		jmp	short loc_42BD2

loc_42BCB:
		inc	dx

loc_42BCC:
		cmp	dx, word_5D990
		jb	short loc_42B8B

loc_42BD2:
		cmp	dword_604AE, 0
		jnz	short loc_42BF4
		sub	[bp+arg_0], 10h
		or	[bp+arg_0], 4000001h
		mov	eax, [bp+arg_0]
		mov	dword_604AE, eax
		mov	byte_604B2, 3

loc_42BF4:
		mov	ax, 678Eh
		leave
		retf
sub_42AE4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PagedMemory_DetectDriverSignatureA_63627 (sub_63627 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à PagedMemory_DetectDriverSignatureA_2A8DF (sub_2A8DF
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedMemory_DetectDriverSignatureA_5B7F1 (sub_5B7F1 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far, référencée via vtable (DATA
; XREF seg216) — détection matérielle : int 15h fonction 1209h avec signature bx=736Dh ("sm").
; Probable détection du propre pilote de mémoire paginée du jeu (TSR maison, signature liée au
; nom "Strike Commander").
; ==============================================================================================
PagedMemory_DetectDriverSignatureA_42BF9		proc far
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
PagedMemory_DetectDriverSignatureA_42BF9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PagedMemory_DetectDriverSignatureB_63638 (sub_63638 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à PagedMemory_DetectDriverSignatureB_2A8F0 (sub_2A8F0
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; PagedMemory_DetectDriverSignatureB_5B802 (sub_5B802 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far, variante de
; PagedMemory_DetectDriverSignatureA avec signature bx=534Dh ("SM", casse différente) — int
; 15h fonction 1209h. Référencée par sub_5B89D et sub_5B944.
; ==============================================================================================
PagedMemory_DetectDriverSignatureB_42C0A		proc far
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
PagedMemory_DetectDriverSignatureB_42C0A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à PagedMemory_LoadPage_63649 (sub_63649 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à PagedMemory_LoadPage_2A901 (sub_2A901 de OPTEST.EXE). Résumé
; repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à PagedMemory_LoadPage_5B813 (sub_5B813 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, charge une page de 16 Ko
; (probable appel au pilote de mémoire étendue/paginée détecté par les fonctions Detect*).
; Appelée en boucle par PagedMemory_ResolveAddress_5BBCC.
; ==============================================================================================
PagedMemory_LoadPage_42C1B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, word_5D974
		cmp	byte ptr es:[bx], 0
		jz	short loc_42C7D
		cmp	[bp+arg_0], 18h
		jb	short loc_42C37
		push	150Eh
		call	sub_9D47
		pop	cx

loc_42C37:
		mov	bx, [bp+arg_0]
		shl	bx, 2
		mov	ax, [bx+670Eh]
		cmp	ax, [bp+arg_2]
		jz	short loc_42CA5
		mov	ax, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	dx, word_5D978
		mov	ah, 44h
		int	67h
		or	ah, ah
		jnz	short loc_42C5D
		mov	ax, 1
		jmp	short loc_42C5F

loc_42C5D:
		xor	ax, ax

loc_42C5F:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_42C6E
		push	150Eh
		call	sub_9D47
		pop	cx

loc_42C6E:
		mov	bx, [bp+arg_0]
		shl	bx, 2
		mov	ax, [bp+arg_2]
		mov	[bx+670Eh], ax
		jmp	short loc_42CA5

loc_42C7D:
		mov	ax, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	dx, word_5D978
		mov	ah, 44h
		int	67h
		or	ah, ah
		jnz	short loc_42C94
		mov	ax, 1
		jmp	short loc_42C96

loc_42C94:
		xor	ax, ax

loc_42C96:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_42CA5
		push	150Eh
		call	sub_9D47
		pop	cx

loc_42CA5:
		pop	bp
		retf
PagedMemory_LoadPage_42C1B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42CA7		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	60h
		push	ds
		push	offset unk_6042E
		push	large [bp+arg_0]
		call	sub_3609
		add	sp, 0Ah
		pop	bp
		retf
sub_42CA7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42CBE		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	60h
		push	large [bp+arg_0]
		push	ds
		push	offset unk_6042E
		call	sub_3609
		add	sp, 0Ah
		mov	ax, 5000h
		mov	cx, 18h
		mov	dx, word_5D978
		mov	si, 670Eh
		int	67h
		or	ah, ah
		jnz	short loc_42CEC
		mov	ax, 1
		jmp	short loc_42CEE

loc_42CEC:
		xor	ax, ax

loc_42CEE:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_42CFD
		push	150Eh
		call	sub_9D47
		pop	cx

loc_42CFD:
		pop	si
		pop	bp
		retf
sub_42CBE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PagedMemory_InitDriver_6372E (sub_6372E de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à PagedMemory_InitDriver_2A98B (sub_2A98B de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PagedMemory_InitDriver_5B89D (sub_5B89D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; initialise le pilote de mémoire paginée : combine PagedMemory_DetectDriverSignatureA_5B7F1
; et B_5B802 avec gestion d'erreur (sub_6B70F ×2).
; ==============================================================================================
PagedMemory_InitDriver_42D00		proc far

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_42BF9
		mov	[bp+var_1], al
		mov	ah, 42h
		int	67h
		or	ah, ah
		jnz	short loc_42D1A
		cmp	bx, 18h
		jnb	short loc_42D23

loc_42D1A:
		push	150Ch
		call	sub_9D47
		pop	cx

loc_42D23:
		cmp	bx, 1E0h
		jbe	short loc_42D2C
		mov	bx, 1E0h

loc_42D2C:
		mov	word_5D97A, bx
		movzx	eax, word_5D97A
		shl	eax, 0Eh
		mov	dword_5D988, eax
		mov	ah, 43h
		int	67h
		mov	word_5D978, dx
		or	ah, ah
		jz	short loc_42D53
		push	150Ch
		call	sub_9D47
		pop	cx

loc_42D53:
		mov	ah, 41h
		int	67h
		mov	word_5D97C, bx
		movzx	eax, word_5D97C
		shl	eax, 4
		mov	dword_5D980, eax
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_42C0A
		les	bx, word_5D974
		mov	al, es:[bx]
		cbw
		or	ax, ax
		jnz	short loc_42D82
		push	150Dh
		call	sub_9D47
		pop	cx

loc_42D82:
		mov	ah, 41h
		int	67h
		mov	word_5D97E, bx
		movzx	eax, word_5D97E
		shl	eax, 4
		mov	dword_5D984, eax
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_42DA5
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_42BF9

loc_42DA5:
		leave
		retf
PagedMemory_InitDriver_42D00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PagedMemory_CheckDriverPresent_637D5 (sub_637D5 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à PagedMemory_CheckDriverPresent_2AA32 (sub_2AA32 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; PagedMemory_CheckDriverPresent_5B944 (sub_5B944 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, vérifie la présence du pilote
; (PagedMemory_DetectDriverSignatureB_5B802) avec repli sur
; PagedMemory_DetectDriverSignatureA_5B7F1 en cas d'échec.
; ==============================================================================================
PagedMemory_CheckDriverPresent_42DA7		proc far

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	word_5D978, 0FFFFh
		jz	short loc_42DE9
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_42C0A
		mov	[bp+var_1], al
		mov	byte_5DA10, 1
		mov	dx, word_5D978
		mov	ah, 45h
		int	67h
		or	ah, ah
		jz	short loc_42DD6
		push	1512h
		call	sub_9D47
		pop	cx

loc_42DD6:
		mov	word_5D978, 0FFFFh
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_42DE9
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_42BF9

loc_42DE9:
		leave
		retf
PagedMemory_CheckDriverPresent_42DA7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42DEB		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	ax, word_5D976
		cmp	ax, word_59E3D
		jbe	short loc_42E09
		mov	di, word_59E3D
		sub	di, 100h
		shr	di, 0Ah
		jmp	short loc_42E1C

loc_42E09:
		mov	di, word_5D974
		shr	di, 4
		add	di, word_5D976
		inc	di
		add	di, 0FD80h
		sar	di, 0Ah

loc_42E1C:
		or	di, di
		jle	short loc_42E7B
		mov	word_5D990, di
		mov	[bp+var_2], 0
		jmp	short loc_42E3B

loc_42E2B:
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	ax, [bp+var_2]
		mov	[bx+676Eh], ax
		inc	[bp+var_2]

loc_42E3B:
		cmp	[bp+var_2], di
		jl	short loc_42E2B
		mov	ax, 5002h
		mov	cx, word_5D990
		mov	dx, word_5D978
		mov	si, 676Eh
		int	67h
		or	ah, ah
		jnz	short loc_42E59
		mov	ax, 1
		jmp	short loc_42E5B

loc_42E59:
		xor	ax, ax

loc_42E5B:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_42E6A
		push	150Dh
		call	sub_9D47
		pop	cx

loc_42E6A:
		mov	ax, di
		shl	ax, 0Ah
		push	ax
		push	100h
		call	sub_45212
		add	sp, 4

loc_42E7B:
		pop	di
		pop	si
		leave
		retf
sub_42DEB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42E7F		proc far

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
		mov	si, [bx+676Eh]
		cmp	dx, word_5D990
		jnb	short loc_42EC8
		cmp	si, 0FFFFh
		jz	short loc_42EC8
		cmp	si, word_5D97A
		jb	short loc_42ED1

loc_42EC8:
		push	1510h
		call	sub_9D47
		pop	cx

loc_42ED1:
		movzx	eax, si
		shl	eax, 0Eh
		mov	edx, [bp+var_4]
		and	edx, 3FFFh
		add	eax, edx
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_42E7F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42EEF		proc far

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
		call	near ptr sub_431E7
		nop
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_4]
		mov	es:[bx], eax
		mov	dword ptr es:[bx+4], 0
		push	large [bp+arg_0]
		call	sub_43954
		add	sp, 4
		push	1
		mov	eax, [bp+arg_0]
		add	eax, [bp+arg_4]
		push	eax
		push	cs
		call	near ptr sub_431E7
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
sub_42EEF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_42F59		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	ax, word_5D990
		add	ax, 14h
		movzx	eax, ax
		shl	eax, 0Eh
		mov	[bp+var_4], eax
		push	1
		push	eax
		push	cs
		call	near ptr sub_431E7
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
		jmp	short loc_42FD9

loc_42FA7:
		push	large 0FFD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_42EEF
		add	sp, 8
		add	[bp+var_4], 0FFE0h
		push	large 10010h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_42EEF
		add	sp, 8
		add	[bp+var_4], 10020h

loc_42FD9:
		mov	eax, [bp+var_4]
		add	eax, 20000h
		cmp	eax, dword_5D988
		jb	short loc_42FA7
		mov	eax, dword_5D988
		sub	eax, [bp+var_4]
		sub	eax, 8000h
		add	eax, 10h
		cmp	eax, 10010h
		jl	short loc_43038
		push	large 3FD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_42EEF
		add	sp, 8
		add	[bp+var_4], 3FE0h
		push	large 10010h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_42EEF
		add	sp, 8
		add	[bp+var_4], 10020h
		jmp	short loc_43062

loc_43038:
		mov	eax, [bp+var_4]
		add	eax, 0FFF0h
		cmp	eax, dword_5D988
		jnb	short loc_43062
		push	large 0FFD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_42EEF
		add	sp, 8
		add	[bp+var_4], 0FFE0h

loc_43062:
		mov	eax, dword_5D988
		sub	eax, [bp+var_4]
		sub	eax, 10h
		push	eax
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_42EEF
		add	sp, 8
		leave
		retf
sub_42F59		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4307D		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		cmp	word_5D978, 0FFFFh
		jz	short loc_43096
		push	150Ah
		call	sub_9D47
		pop	cx

loc_43096:
		mov	ax, 1209h
		mov	bx, 4143h
		int	15h
		or	ax, ax
		jnz	short loc_430A8
		cmp	bx, 1209h
		jz	short loc_430B1

loc_430A8:
		push	150Bh
		call	sub_9D47
		pop	cx

loc_430B1:
		mov	[bp+var_2], 0
		jmp	short loc_430D4

loc_430B8:
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	word ptr [bx+670Eh], 0FFFFh
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	ax, [bp+var_2]
		mov	[bx+6710h], ax
		inc	[bp+var_2]

loc_430D4:
		cmp	[bp+var_2], 18h
		jl	short loc_430B8
		mov	[bp+var_2], 0
		jmp	short loc_430FD

loc_430E1:
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	word ptr [bx+676Eh], 0FFFFh
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	ax, [bp+var_2]
		mov	[bx+6770h], ax
		inc	[bp+var_2]

loc_430FD:
		cmp	[bp+var_2], 8
		jl	short loc_430E1
		mov	ax, 1209h
		mov	bx, 4646h
		int	15h
		mov	word_5D976, es
		mov	word_5D974, di
		or	ax, ax
		jz	short loc_43120
		push	150Dh
		call	sub_9D47
		pop	cx

loc_43120:
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_42C0A
		push	cs
		call	near ptr PagedMemory_InitDriver_42D00
		mov	ax, 5000h
		mov	cx, 18h
		mov	dx, word_5D978
		mov	si, 670Eh
		int	67h
		or	ah, ah
		jnz	short loc_43140
		mov	ax, 1
		jmp	short loc_43142

loc_43140:
		xor	ax, ax

loc_43142:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_43151
		push	150Dh
		call	sub_9D47
		pop	cx

loc_43151:
		push	cs
		call	near ptr sub_42DEB
		mov	ax, 1209h
		mov	bx, 4648h
		mov	dx, word_5D978
		int	15h
		mov	dword_5D98C, edx
		or	ax, ax
		jz	short loc_43173
		push	150Dh
		call	sub_9D47
		pop	cx

loc_43173:
		mov	ax, ds
		movzx	eax, ax
		shl	eax, 4
		sub	dword_5D98C, eax
		push	cs
		call	near ptr sub_42F59
		mov	[bp+var_2], 0
		jmp	short loc_431A2

loc_4318D:
		mov	ax, [bp+var_2]
		add	ax, word_5D990
		push	ax
		push	[bp+var_2]
		push	cs
		call	near ptr PagedMemory_LoadPage_42C1B
		add	sp, 4
		inc	[bp+var_2]

loc_431A2:
		cmp	[bp+var_2], 14h
		jl	short loc_4318D
		push	5000h
		push	word_5D97E
		call	sub_45212
		add	sp, 4
		call	sub_4831C
		cmp	word_5D97E, 0B000h
		jnb	short loc_431E3
		push	0
		push	0
		push	large 0C7013Fh
		push	large 0
		push	large 10FFFFh
		push	word_5DD44
		call	TextFormat_InitAttributeTable_47A04
		add	sp, 12h

loc_431E3:
		pop	di
		pop	si
		leave
		retf
sub_4307D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_431E7		proc far

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
		les	bx, word_5D974
		cmp	byte ptr es:[bx], 0
		jz	short loc_4322C
		cmp	[bp+arg_4], 4
		jbe	short loc_43213
		push	150Fh
		call	sub_9D47
		pop	cx

loc_43213:
		mov	ax, 5
		sub	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		xor	dx, dx
		div	[bp+var_4]
		add	dx, 14h
		mov	[bp+var_6], dx
		jmp	short loc_43236

loc_4322C:
		mov	[bp+var_6], 0
		mov	[bp+arg_4], 4

loc_43236:
		les	bx, word_5D974
		cmp	byte ptr es:[bx], 0
		jnz	short loc_43243
		jmp	loc_432CB

loc_43243:
		cmp	[bp+arg_4], 1
		jnz	short loc_43259
		push	[bp+var_2]
		push	[bp+var_6]
		push	cs
		call	near ptr PagedMemory_LoadPage_42C1B
		add	sp, 4
		jmp	loc_432F3

loc_43259:
		mov	[bp+var_F], 0
		xor	di, di
		jmp	short loc_4328A

loc_43261:
		mov	bx, [bp+var_6]
		add	bx, di
		shl	bx, 2
		mov	ax, [bp+var_2]
		add	ax, di
		cmp	[bx+670Eh], ax
		jz	short loc_43289
		mov	bx, [bp+var_6]
		add	bx, di
		shl	bx, 2
		mov	ax, [bp+var_2]
		add	ax, di
		mov	[bx+670Eh], ax
		mov	[bp+var_F], 1

loc_43289:
		inc	di

loc_4328A:
		cmp	di, [bp+arg_4]
		jnb	short loc_4329A
		mov	ax, [bp+var_2]
		add	ax, di
		cmp	ax, word_5D97A
		jb	short loc_43261

loc_4329A:
		cmp	[bp+var_F], 0
		jz	short loc_432F3
		mov	ax, 5000h
		mov	cx, 18h
		mov	dx, word_5D978
		mov	si, 670Eh
		int	67h
		or	ah, ah
		jnz	short loc_432B8
		mov	ax, 1
		jmp	short loc_432BA

loc_432B8:
		xor	ax, ax

loc_432BA:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_432F3
		push	150Eh
		call	sub_9D47
		pop	cx
		jmp	short loc_432F3

loc_432CB:
		xor	di, di
		jmp	short loc_432E3

loc_432CF:
		mov	ax, [bp+var_2]
		add	ax, di
		push	ax
		mov	ax, [bp+var_6]
		add	ax, di
		push	ax
		push	cs
		call	near ptr PagedMemory_LoadPage_42C1B
		add	sp, 4
		inc	di

loc_432E3:
		cmp	di, [bp+arg_4]
		jnb	short loc_432F3
		mov	ax, [bp+var_2]
		add	ax, di
		cmp	ax, word_5D97A
		jb	short loc_432CF

loc_432F3:
		movzx	eax, [bp+var_6]
		shl	eax, 0Eh
		mov	edx, [bp+arg_0]
		and	edx, 3FFFh
		add	edx, eax
		mov	[bp+var_A], edx
		les	bx, word_5D974
		cmp	byte ptr es:[bx], 0
		jz	short loc_43330
		mov	eax, dword_5D984
		add	[bp+var_A], eax
		mov	eax, [bp+var_A]
		shr	eax, 4
		mov	dx, word ptr [bp+var_A]
		and	dx, 0Fh
		jmp	short loc_43336

loc_43330:
		mov	ax, word_5D97C
		mov	dx, word ptr [bp+var_A]

loc_43336:
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]
		pop	di
		pop	si
		leave
		retf
sub_431E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43346		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, word_5D974
		cmp	byte ptr es:[bx], 0
		jnz	short loc_43360
		push	1510h
		call	sub_9D47
		pop	cx

loc_43360:
		mov	ax, word ptr [bp+arg_0+2]
		cmp	ax, word_59E3D
		jnb	short loc_43376
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_42E7F
		add	sp, 4
		jmp	short loc_433DB

loc_43376:
		movzx	eax, word ptr [bp+arg_0+2]
		shl	eax, 4
		movzx	edx, word ptr [bp+arg_0]
		add	eax, edx
		mov	[bp+var_4], eax
		mov	eax, dword_5D984
		sub	[bp+var_4], eax
		mov	eax, [bp+var_4]
		shr	eax, 0Eh
		mov	dx, ax
		mov	bx, dx
		shl	bx, 2
		mov	si, [bx+670Eh]
		cmp	dx, 18h
		jnb	short loc_433B7
		cmp	si, 0FFFFh
		jz	short loc_433B7
		cmp	si, word_5D97A
		jb	short loc_433C0

loc_433B7:
		push	1510h
		call	sub_9D47
		pop	cx

loc_433C0:
		movzx	eax, si
		shl	eax, 0Eh
		mov	edx, [bp+var_4]
		and	edx, 3FFFh
		add	eax, edx
		shld	edx, eax, 10h

loc_433DB:
		pop	si
		leave
		retf
sub_43346		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; PagedMemory_WriteByte_63E0C (sub_63E0C de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à PagedMemory_WriteByte_2AE02 (sub_2AE02 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à PagedMemory_WriteByte_5BD14 (sub_5BD14 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; écrit un octet à une adresse paginée (PagedMemory_ResolveAddress_5BBCC + gestion d'erreur
; sub_6B70F).
; ==============================================================================================
PagedMemory_WriteByte_433DE		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0Fh
		cmp	eax, 1
		jnz	short loc_433F7
		mov	ax, 1
		jmp	short loc_433F9

loc_433F7:
		xor	ax, ax

loc_433F9:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_43408
		push	1509h
		call	sub_9D47
		pop	cx

loc_43408:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		shr	eax, 18h
		push	ax
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		push	cs
		call	near ptr sub_431E7
		add	sp, 6
		pop	bp
		retf
PagedMemory_WriteByte_433DE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4342D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	1
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		push	eax
		push	cs
		call	near ptr sub_431E7
		add	sp, 6
		pop	bp
		retf
sub_4342D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4344A		proc far

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
		jnz	short loc_43460
		jmp	loc_434EE

loc_43460:
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		mov	[bp+var_A], eax
		push	1
		push	eax
		push	cs
		call	near ptr sub_431E7
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
		call	near ptr sub_431E7
		add	sp, 6
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		les	bx, [bp+var_6]
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_A]
		jnz	short loc_43505
		cmp	[bp+var_12], 0
		jz	short loc_43501
		push	1
		push	large [bp+var_12]
		push	cs
		call	near ptr sub_431E7
		add	sp, 6
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		les	bx, [bp+var_6]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		add	eax, [bp+var_12]
		cmp	eax, [bp+var_A]
		jnz	short loc_43505
		jmp	short loc_43501

loc_434EE:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jnz	short loc_43505

loc_43501:
		mov	[bp+var_1], 1

loc_43505:
		mov	al, [bp+var_1]
		leave
		retf
sub_4344A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4350A		proc far

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
		mov	ax, word_5D990
		add	ax, 14h
		movzx	eax, ax
		shl	eax, 0Eh
		mov	[bp+var_8], eax
		cmp	[bp+arg_0], 0
		jnz	short loc_4353E
		jmp	loc_4370E

loc_4353E:
		push	3C73h
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		or	si, si
		jnz	short loc_43554
		jmp	loc_43704

loc_43554:
		push	si
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	loc_4370E
		jmp	loc_43704

loc_43567:
		mov	eax, [bp+var_14]
		add	[bp+var_8], eax
		push	1
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_431E7
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
		jnb	short loc_435AB
		jmp	loc_4370E

loc_435AB:
		cmp	[bp+var_25], 0
		jz	short loc_435BB
		mov	eax, [bp+var_14]
		add	[bp+var_10], eax
		jmp	short loc_435C3

loc_435BB:
		mov	eax, [bp+var_14]
		add	[bp+var_C], eax

loc_435C3:
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
		call	near ptr sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_8]
		jnz	short loc_43645
		cmp	[bp+var_1C], 0
		jz	short loc_43641
		push	1
		push	large [bp+var_1C]
		push	cs
		call	near ptr sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_8]
		jnz	short loc_43645

loc_43641:
		mov	[bp+var_26], 1

loc_43645:
		cmp	[bp+var_26], 0
		jz	short loc_436B0
		mov	al, [bp+var_25]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_436B0
		push	1
		push	large [bp+var_24]
		push	cs
		call	near ptr sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		cmp	eax, [bp+var_8]
		jnz	short loc_4367A
		mov	ax, 1
		jmp	short loc_4367C

loc_4367A:
		xor	ax, ax

loc_4367C:
		mov	[bp+var_26], al
		cmp	[bp+var_26], 0
		jz	short loc_436B0
		push	1
		push	large [bp+var_20]
		push	cs
		call	near ptr sub_431E7
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		cmp	eax, [bp+var_8]
		jnz	short loc_436AB
		mov	ax, 1
		jmp	short loc_436AD

loc_436AB:
		xor	ax, ax

loc_436AD:
		mov	[bp+var_26], al

loc_436B0:
		mov	al, [bp+var_26]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_436C2
		push	1507h
		call	sub_9D47
		pop	cx

loc_436C2:
		mov	al, [bp+arg_0]
		mov	ah, 0
		or	ax, ax
		jz	short loc_4370E
		cmp	[bp+var_25], 0
		jz	short loc_436D7
		cmp	[bp+arg_2], 0
		jnz	short loc_4370E

loc_436D7:
		push	large [bp+var_14]
		push	large [bp+var_8]
		cmp	[bp+var_25], 0
		jz	short loc_436EA
		mov	ax, 3CAFh
		jmp	short loc_436ED

loc_436EA:
		mov	ax, 3CB9h

loc_436ED:
		push	ax
		push	3C8Fh
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Eh
		or	si, si
		jz	short loc_43704
		jmp	loc_43554

loc_43704:
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_4370E:
		mov	eax, [bp+var_8]
		add	eax, [bp+var_14]
		cmp	eax, dword_5D988
		jnb	short loc_43720
		jmp	loc_43567

loc_43720:
		cmp	[bp+arg_0], 0
		jz	short loc_4375A
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	3CBEh
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	si, si
		jz	short loc_43750
		push	si
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_4375A

loc_43750:
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_4375A:
		pop	si
		leave
		retf
sub_4350A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4375D		proc far

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
		jmp	short loc_437D0

loc_43793:
		cmp	[bp+arg_8], 0FFF0h
		jbe	short loc_437A2
		mov	ax, 0FFF0h
		jmp	short loc_437A5

loc_437A2:
		mov	ax, word ptr [bp+arg_8]

loc_437A5:
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

loc_437D0:
		cmp	[bp+arg_8], 0
		jnz	short loc_43793
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_4375D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_437DC		proc far
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ecx, dword_604C0
		mov	esi, dword_604BC
		mov	edi, dword_604B8
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
sub_437DC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43807		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		mov	eax, [bp+arg_0]
		mov	dword_604B8, eax
		mov	eax, [bp+arg_4]
		mov	dword_604BC, eax
		mov	eax, [bp+arg_8]
		mov	dword_604C0, eax
		push	ds
		pop	es
		mov	dx, 0D6Ch
		movzx	edx, dx
		mov	ax, 1209h
		mov	bx, 5350h
		xor	cx, cx
		int	15h
		pop	bp
		retf
sub_43807		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_43837		proc far

arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		push	large [bp+arg_8]
		mov	eax, [bp+arg_4]
		add	eax, dword_5D98C
		push	eax
		mov	eax, [bp+arg_0]
		add	eax, dword_5D98C
		push	eax
		push	cs
		call	near ptr sub_43807
		add	sp, 0Ch
		pop	bp
		retf
sub_43837		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4385D		proc far

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
		call	near ptr sub_42A76
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
		call	near ptr sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		add	eax, [bp+arg_4]
		push	eax
		push	cs
		call	near ptr sub_43807
		add	sp, 0Ch
		pop	bp
		retf
sub_4385D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_438A3		proc far

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
		call	near ptr sub_42A76
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		add	eax, [bp+arg_8]
		push	eax
		push	2
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_42A76
		add	sp, 6
		push	dx
		push	ax
		push	cs
		call	near ptr sub_43807
		add	sp, 0Ch
		pop	bp
		retf
sub_438A3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_438E9		proc far
		push	bp
		mov	bp, sp
		cmp	byte_5D992, 0
		jz	short loc_4392F
		cmp	byte_604B3, 0
		jz	short loc_43918
		cmp	dword_604AE, 0
		jz	short loc_43918
		push	0
		mov	al, byte_604B2
		push	ax
		push	678Eh
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_43918

loc_43918:
		mov	dword_604AE, 0
		mov	byte_604B3, 0
		mov	dword_604B4, 0

loc_4392F:
		pop	bp
sub_438E9		endp
seg098		ends
