seg096		segment	para public 'CODE' use16
		assume cs:seg096
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0EBh, 0

loc_30B42:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30B46		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		cmp	[bp+arg_4], 3
		jnz	short loc_30B67
		mov	eax, [bp+arg_0]
		and	eax, 0FFFFFEh
		add	eax, dword_4CFB6
		add	eax, 10h
		jmp	short loc_30BA5

loc_30B67:
		mov	ax, word ptr [bp+arg_0+2]
		cmp	ax, word_48B44
		jnb	short loc_30B87
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_30E1E
		nop
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		add	eax, dword_4CFB6
		jmp	short loc_30BA5

loc_30B87:
		movzx	eax, word ptr [bp+arg_0+2]
		shl	eax, 4
		movzx	edx, word ptr [bp+arg_0]
		add	eax, edx
		mov	dx, ds
		movzx	edx, dx
		shl	edx, 4
		sub	eax, edx

loc_30BA5:
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		leave
		retf
sub_30B46		endp

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
PagedMemory_DetectDriverSignatureA_30BB4		proc far
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
PagedMemory_DetectDriverSignatureA_30BB4		endp

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
PagedMemory_DetectDriverSignatureB_30BC5		proc far
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
PagedMemory_DetectDriverSignatureB_30BC5		endp

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
PagedMemory_LoadPage_30BD6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		les	bx, word_4CF9E
		cmp	byte ptr es:[bx], 0
		jz	short loc_30C38
		cmp	[bp+arg_0], 18h
		jb	short loc_30BF2
		push	150Eh
		call	sub_13451
		pop	cx

loc_30BF2:
		mov	bx, [bp+arg_0]
		shl	bx, 2
		mov	ax, [bx+6B88h]
		cmp	ax, [bp+arg_2]
		jz	short loc_30C60
		mov	ax, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	dx, word_4CFA2
		mov	ah, 44h
		int	67h
		or	ah, ah
		jnz	short loc_30C18
		mov	ax, 1
		jmp	short loc_30C1A

loc_30C18:
		xor	ax, ax

loc_30C1A:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_30C29
		push	150Eh
		call	sub_13451
		pop	cx

loc_30C29:
		mov	bx, [bp+arg_0]
		shl	bx, 2
		mov	ax, [bp+arg_2]
		mov	[bx+6B88h], ax
		jmp	short loc_30C60

loc_30C38:
		mov	ax, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	dx, word_4CFA2
		mov	ah, 44h
		int	67h
		or	ah, ah
		jnz	short loc_30C4F
		mov	ax, 1
		jmp	short loc_30C51

loc_30C4F:
		xor	ax, ax

loc_30C51:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_30C60
		push	150Eh
		call	sub_13451
		pop	cx

loc_30C60:
		pop	bp
		retf
PagedMemory_LoadPage_30BD6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30C62		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	60h
		push	ds
		push	offset unk_4F568
		push	large [bp+arg_0]
		call	sub_3545
		add	sp, 0Ah
		pop	bp
		retf
sub_30C62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30C79		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	60h
		push	large [bp+arg_0]
		push	ds
		push	offset unk_4F568
		call	sub_3545
		add	sp, 0Ah
		mov	ax, 5000h
		mov	cx, 18h
		mov	dx, word_4CFA2
		mov	si, 6B88h
		int	67h
		or	ah, ah
		jnz	short loc_30CA7
		mov	ax, 1
		jmp	short loc_30CA9

loc_30CA7:
		xor	ax, ax

loc_30CA9:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_30CB8
		push	150Eh
		call	sub_13451
		pop	cx

loc_30CB8:
		pop	si
		pop	bp
		retf
sub_30C79		endp

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
PagedMemory_InitDriver_30CBB		proc far

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_30BB4
		mov	[bp+var_1], al
		mov	ah, 42h
		int	67h
		or	ah, ah
		jnz	short loc_30CD5
		cmp	bx, 18h
		jnb	short loc_30CDE

loc_30CD5:
		push	150Ch
		call	sub_13451
		pop	cx

loc_30CDE:
		cmp	bx, 1E0h
		jbe	short loc_30CE7
		mov	bx, 1E0h

loc_30CE7:
		mov	word_4CFA4, bx
		movzx	eax, word_4CFA4
		shl	eax, 0Eh
		mov	dword_4CFB2, eax
		mov	ah, 43h
		int	67h
		mov	word_4CFA2, dx
		or	ah, ah
		jz	short loc_30D0E
		push	150Ch
		call	sub_13451
		pop	cx

loc_30D0E:
		mov	ah, 41h
		int	67h
		mov	word_4CFA6, bx
		movzx	eax, word_4CFA6
		shl	eax, 4
		mov	dword_4CFAA, eax
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_30BC5
		les	bx, word_4CF9E
		mov	al, es:[bx]
		cbw
		or	ax, ax
		jnz	short loc_30D3D
		push	150Dh
		call	sub_13451
		pop	cx

loc_30D3D:
		mov	ah, 41h
		int	67h
		mov	word_4CFA8, bx
		movzx	eax, word_4CFA8
		shl	eax, 4
		mov	dword_4CFAE, eax
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_30D60
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_30BB4

loc_30D60:
		leave
		retf
PagedMemory_InitDriver_30CBB		endp

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
PagedMemory_CheckDriverPresent_30D62		proc far

var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 2
		cmp	word_4CFA2, 0FFFFh
		jz	short loc_30DA4
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_30BC5
		mov	[bp+var_1], al
		mov	byte_4D03A, 1
		mov	dx, word_4CFA2
		mov	ah, 45h
		int	67h
		or	ah, ah
		jz	short loc_30D91
		push	1512h
		call	sub_13451
		pop	cx

loc_30D91:
		mov	word_4CFA2, 0FFFFh
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_30DA4
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureA_30BB4

loc_30DA4:
		leave
		retf
PagedMemory_CheckDriverPresent_30D62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30DA6		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	ax, word_4CF9E
		shr	ax, 4
		add	ax, word_4CFA0
		inc	ax
		add	ax, 0FD80h
		sar	ax, 0Ah
		mov	[bp+var_2], ax
		cmp	[bp+var_2], 0
		jle	short loc_30E1A
		mov	word_4CFBA, ax
		xor	di, di
		jmp	short loc_30DD9

loc_30DCF:
		mov	bx, di
		shl	bx, 2
		mov	[bx+6BE8h], di
		inc	di

loc_30DD9:
		cmp	di, [bp+var_2]
		jl	short loc_30DCF
		mov	ax, 5002h
		mov	cx, word_4CFBA
		mov	dx, word_4CFA2
		mov	si, 6BE8h
		int	67h
		or	ah, ah
		jnz	short loc_30DF7
		mov	ax, 1
		jmp	short loc_30DF9

loc_30DF7:
		xor	ax, ax

loc_30DF9:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_30E08
		push	150Dh
		call	sub_13451
		pop	cx

loc_30E08:
		mov	ax, [bp+var_2]
		shl	ax, 0Ah
		push	ax
		push	100h
		call	sub_332A2
		add	sp, 4

loc_30E1A:
		pop	di
		pop	si
		leave
		retf
sub_30DA6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30E1E		proc far

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
		mov	si, [bx+6BE8h]
		cmp	dx, word_4CFBA
		jnb	short loc_30E67
		cmp	si, 0FFFFh
		jz	short loc_30E67
		cmp	si, word_4CFA4
		jb	short loc_30E70

loc_30E67:
		push	1510h
		call	sub_13451
		pop	cx

loc_30E70:
		movzx	eax, si
		shl	eax, 0Eh
		mov	edx, [bp+var_4]
		and	edx, 3FFFh
		add	eax, edx
		shld	edx, eax, 10h
		pop	si
		leave
		retf
sub_30E1E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30E8E		proc far

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
		call	near ptr sub_31186
		nop
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, [bp+arg_4]
		mov	es:[bx], eax
		mov	dword ptr es:[bx+4], 0
		push	large [bp+arg_0]
		call	sub_319E4
		add	sp, 4
		push	1
		mov	eax, [bp+arg_0]
		add	eax, [bp+arg_4]
		push	eax
		push	cs
		call	near ptr sub_31186
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
sub_30E8E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30EF8		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	ax, word_4CFBA
		add	ax, 14h
		movzx	eax, ax
		shl	eax, 0Eh
		mov	[bp+var_4], eax
		push	1
		push	eax
		push	cs
		call	near ptr sub_31186
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
		jmp	short loc_30F78

loc_30F46:
		push	large 0FFD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_30E8E
		add	sp, 8
		add	[bp+var_4], 0FFE0h
		push	large 10010h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_30E8E
		add	sp, 8
		add	[bp+var_4], 10020h

loc_30F78:
		mov	eax, [bp+var_4]
		add	eax, 20000h
		cmp	eax, dword_4CFB2
		jb	short loc_30F46
		mov	eax, dword_4CFB2
		sub	eax, [bp+var_4]
		sub	eax, 8000h
		add	eax, 10h
		cmp	eax, 10010h
		jl	short loc_30FD7
		push	large 3FD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_30E8E
		add	sp, 8
		add	[bp+var_4], 3FE0h
		push	large 10010h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_30E8E
		add	sp, 8
		add	[bp+var_4], 10020h
		jmp	short loc_31001

loc_30FD7:
		mov	eax, [bp+var_4]
		add	eax, 0FFF0h
		cmp	eax, dword_4CFB2
		jnb	short loc_31001
		push	large 0FFD0h
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_30E8E
		add	sp, 8
		add	[bp+var_4], 0FFE0h

loc_31001:
		mov	eax, dword_4CFB2
		sub	eax, [bp+var_4]
		sub	eax, 10h
		push	eax
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_30E8E
		add	sp, 8
		leave
		retf
sub_30EF8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3101C		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		cmp	word_4CFA2, 0FFFFh
		jz	short loc_31035
		push	150Ah
		call	sub_13451
		pop	cx

loc_31035:
		mov	ax, 1209h
		mov	bx, 4143h
		int	15h
		or	ax, ax
		jnz	short loc_31047
		cmp	bx, 1209h
		jz	short loc_31050

loc_31047:
		push	150Bh
		call	sub_13451
		pop	cx

loc_31050:
		mov	[bp+var_2], 0
		jmp	short loc_31073

loc_31057:
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	word ptr [bx+6B88h], 0FFFFh
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	ax, [bp+var_2]
		mov	[bx+6B8Ah], ax
		inc	[bp+var_2]

loc_31073:
		cmp	[bp+var_2], 18h
		jl	short loc_31057
		mov	[bp+var_2], 0
		jmp	short loc_3109C

loc_31080:
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	word ptr [bx+6BE8h], 0FFFFh
		mov	bx, [bp+var_2]
		shl	bx, 2
		mov	ax, [bp+var_2]
		mov	[bx+6BEAh], ax
		inc	[bp+var_2]

loc_3109C:
		cmp	[bp+var_2], 8
		jl	short loc_31080
		mov	ax, 1209h
		mov	bx, 4646h
		int	15h
		mov	word_4CFA0, es
		mov	word_4CF9E, di
		or	ax, ax
		jz	short loc_310BF
		push	150Dh
		call	sub_13451
		pop	cx

loc_310BF:
		push	cs
		call	near ptr PagedMemory_DetectDriverSignatureB_30BC5
		push	cs
		call	near ptr PagedMemory_InitDriver_30CBB
		mov	ax, 5000h
		mov	cx, 18h
		mov	dx, word_4CFA2
		mov	si, 6B88h
		int	67h
		or	ah, ah
		jnz	short loc_310DF
		mov	ax, 1
		jmp	short loc_310E1

loc_310DF:
		xor	ax, ax

loc_310E1:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_310F0
		push	150Dh
		call	sub_13451
		pop	cx

loc_310F0:
		push	cs
		call	near ptr sub_30DA6
		mov	ax, 1209h
		mov	bx, 4648h
		mov	dx, word_4CFA2
		int	15h
		mov	dword_4CFB6, edx
		or	ax, ax
		jz	short loc_31112
		push	150Dh
		call	sub_13451
		pop	cx

loc_31112:
		mov	ax, ds
		movzx	eax, ax
		shl	eax, 4
		sub	dword_4CFB6, eax
		push	cs
		call	near ptr sub_30EF8
		mov	[bp+var_2], 0
		jmp	short loc_31141

loc_3112C:
		mov	ax, [bp+var_2]
		add	ax, word_4CFBA
		push	ax
		push	[bp+var_2]
		push	cs
		call	near ptr PagedMemory_LoadPage_30BD6
		add	sp, 4
		inc	[bp+var_2]

loc_31141:
		cmp	[bp+var_2], 14h
		jl	short loc_3112C
		push	5000h
		push	word_4CFA8
		call	sub_332A2
		add	sp, 4
		call	sub_3630F
		cmp	word_4CFA8, 0B000h
		jnb	short loc_31182
		push	0
		push	0
		push	large 0C7013Fh
		push	large 0
		push	large 10FFFFh
		push	word_4D36E
		call	TextFormat_InitAttributeTable_3595E
		add	sp, 12h

loc_31182:
		pop	di
		pop	si
		leave
		retf
sub_3101C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31186		proc far

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
		les	bx, word_4CF9E
		cmp	byte ptr es:[bx], 0
		jz	short loc_311CB
		cmp	[bp+arg_4], 4
		jbe	short loc_311B2
		push	150Fh
		call	sub_13451
		pop	cx

loc_311B2:
		mov	ax, 5
		sub	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		xor	dx, dx
		div	[bp+var_4]
		add	dx, 14h
		mov	[bp+var_6], dx
		jmp	short loc_311D5

loc_311CB:
		mov	[bp+var_6], 0
		mov	[bp+arg_4], 4

loc_311D5:
		les	bx, word_4CF9E
		cmp	byte ptr es:[bx], 0
		jz	short loc_31251
		mov	[bp+var_F], 0
		xor	di, di
		jmp	short loc_31210

loc_311E7:
		mov	bx, [bp+var_6]
		add	bx, di
		shl	bx, 2
		mov	ax, [bp+var_2]
		add	ax, di
		cmp	[bx+6B88h], ax
		jz	short loc_3120F
		mov	bx, [bp+var_6]
		add	bx, di
		shl	bx, 2
		mov	ax, [bp+var_2]
		add	ax, di
		mov	[bx+6B88h], ax
		mov	[bp+var_F], 1

loc_3120F:
		inc	di

loc_31210:
		cmp	di, [bp+arg_4]
		jnb	short loc_31220
		mov	ax, [bp+var_2]
		add	ax, di
		cmp	ax, word_4CFA4
		jb	short loc_311E7

loc_31220:
		cmp	[bp+var_F], 0
		jz	short loc_31279
		mov	ax, 5000h
		mov	cx, 18h
		mov	dx, word_4CFA2
		mov	si, 6B88h
		int	67h
		or	ah, ah
		jnz	short loc_3123E
		mov	ax, 1
		jmp	short loc_31240

loc_3123E:
		xor	ax, ax

loc_31240:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_31279
		push	150Eh
		call	sub_13451
		pop	cx
		jmp	short loc_31279

loc_31251:
		xor	di, di
		jmp	short loc_31269

loc_31255:
		mov	ax, [bp+var_2]
		add	ax, di
		push	ax
		mov	ax, [bp+var_6]
		add	ax, di
		push	ax
		push	cs
		call	near ptr PagedMemory_LoadPage_30BD6
		add	sp, 4
		inc	di

loc_31269:
		cmp	di, [bp+arg_4]
		jnb	short loc_31279
		mov	ax, [bp+var_2]
		add	ax, di
		cmp	ax, word_4CFA4
		jb	short loc_31255

loc_31279:
		movzx	eax, [bp+var_6]
		shl	eax, 0Eh
		mov	edx, [bp+arg_0]
		and	edx, 3FFFh
		add	edx, eax
		mov	[bp+var_A], edx
		les	bx, word_4CF9E
		cmp	byte ptr es:[bx], 0
		jz	short loc_312B6
		mov	eax, dword_4CFAE
		add	[bp+var_A], eax
		mov	eax, [bp+var_A]
		shr	eax, 4
		mov	dx, word ptr [bp+var_A]
		and	dx, 0Fh
		jmp	short loc_312BC

loc_312B6:
		mov	ax, word_4CFA6
		mov	dx, word ptr [bp+var_A]

loc_312BC:
		mov	[bp+var_C], ax
		mov	[bp+var_E], dx
		mov	dx, [bp+var_C]
		mov	ax, [bp+var_E]
		pop	di
		pop	si
		leave
		retf
sub_31186		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_312CC		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, word_4CF9E
		cmp	byte ptr es:[bx], 0
		jnz	short loc_312E6
		push	1510h
		call	sub_13451
		pop	cx

loc_312E6:
		mov	ax, word ptr [bp+arg_0+2]
		cmp	ax, word_48B44
		jnb	short loc_312FC
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_30E1E
		add	sp, 4
		jmp	short loc_31361

loc_312FC:
		movzx	eax, word ptr [bp+arg_0+2]
		shl	eax, 4
		movzx	edx, word ptr [bp+arg_0]
		add	eax, edx
		mov	[bp+var_4], eax
		mov	eax, dword_4CFAE
		sub	[bp+var_4], eax
		mov	eax, [bp+var_4]
		shr	eax, 0Eh
		mov	dx, ax
		mov	bx, dx
		shl	bx, 2
		mov	si, [bx+6B88h]
		cmp	dx, 18h
		jnb	short loc_3133D
		cmp	si, 0FFFFh
		jz	short loc_3133D
		cmp	si, word_4CFA4
		jb	short loc_31346

loc_3133D:
		push	1510h
		call	sub_13451
		pop	cx

loc_31346:
		movzx	eax, si
		shl	eax, 0Eh
		mov	edx, [bp+var_4]
		and	edx, 3FFFh
		add	eax, edx
		shld	edx, eax, 10h

loc_31361:
		pop	si
		leave
		retf
sub_312CC		endp

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
PagedMemory_WriteByte_31364		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0Fh
		cmp	eax, 1
		jnz	short loc_3137D
		mov	ax, 1
		jmp	short loc_3137F

loc_3137D:
		xor	ax, ax

loc_3137F:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_3138E
		push	1509h
		call	sub_13451
		pop	cx

loc_3138E:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		shr	eax, 18h
		push	ax
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		add	eax, 10h
		push	eax
		push	cs
		call	near ptr sub_31186
		add	sp, 6
		pop	bp
		retf
PagedMemory_WriteByte_31364		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_313B3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	1
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		push	eax
		push	cs
		call	near ptr sub_31186
		add	sp, 6
		pop	bp
		retf
sub_313B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_313D0		proc far

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
		jnz	short loc_313E6
		jmp	loc_31474

loc_313E6:
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		mov	[bp+var_A], eax
		push	1
		push	eax
		push	cs
		call	near ptr sub_31186
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
		call	near ptr sub_31186
		add	sp, 6
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		les	bx, [bp+var_6]
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_A]
		jnz	short loc_3148B
		cmp	[bp+var_12], 0
		jz	short loc_31487
		push	1
		push	large [bp+var_12]
		push	cs
		call	near ptr sub_31186
		add	sp, 6
		mov	[bp+var_4], dx
		mov	[bp+var_6], ax
		les	bx, [bp+var_6]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		add	eax, [bp+var_12]
		cmp	eax, [bp+var_A]
		jnz	short loc_3148B
		jmp	short loc_31487

loc_31474:
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		cmp	eax, 0
		jnz	short loc_3148B

loc_31487:
		mov	[bp+var_1], 1

loc_3148B:
		mov	al, [bp+var_1]
		leave
		retf
sub_313D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31490		proc far

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
		mov	ax, word_4CFBA
		add	ax, 14h
		movzx	eax, ax
		shl	eax, 0Eh
		mov	[bp+var_8], eax
		cmp	[bp+arg_0], 0
		jnz	short loc_314C4
		jmp	loc_31694

loc_314C4:
		push	45DCh
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		or	si, si
		jnz	short loc_314DA
		jmp	loc_3168A

loc_314DA:
		push	si
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	loc_31694
		jmp	loc_3168A

loc_314ED:
		mov	eax, [bp+var_14]
		add	[bp+var_8], eax
		push	1
		push	large [bp+var_8]
		push	cs
		call	near ptr sub_31186
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
		jnb	short loc_31531
		jmp	loc_31694

loc_31531:
		cmp	[bp+var_25], 0
		jz	short loc_31541
		mov	eax, [bp+var_14]
		add	[bp+var_10], eax
		jmp	short loc_31549

loc_31541:
		mov	eax, [bp+var_14]
		add	[bp+var_C], eax

loc_31549:
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
		call	near ptr sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+4]
		cmp	eax, [bp+var_8]
		jnz	short loc_315CB
		cmp	[bp+var_1C], 0
		jz	short loc_315C7
		push	1
		push	large [bp+var_1C]
		push	cs
		call	near ptr sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx]
		and	eax, 0FFFFFFFEh
		add	eax, [bp+var_1C]
		cmp	eax, [bp+var_8]
		jnz	short loc_315CB

loc_315C7:
		mov	[bp+var_26], 1

loc_315CB:
		cmp	[bp+var_26], 0
		jz	short loc_31636
		mov	al, [bp+var_25]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_31636
		push	1
		push	large [bp+var_24]
		push	cs
		call	near ptr sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+0Ch]
		cmp	eax, [bp+var_8]
		jnz	short loc_31600
		mov	ax, 1
		jmp	short loc_31602

loc_31600:
		xor	ax, ax

loc_31602:
		mov	[bp+var_26], al
		cmp	[bp+var_26], 0
		jz	short loc_31636
		push	1
		push	large [bp+var_20]
		push	cs
		call	near ptr sub_31186
		add	sp, 6
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		les	bx, [bp+var_4]
		mov	eax, es:[bx+8]
		cmp	eax, [bp+var_8]
		jnz	short loc_31631
		mov	ax, 1
		jmp	short loc_31633

loc_31631:
		xor	ax, ax

loc_31633:
		mov	[bp+var_26], al

loc_31636:
		mov	al, [bp+var_26]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_31648
		push	1507h
		call	sub_13451
		pop	cx

loc_31648:
		mov	al, [bp+arg_0]
		mov	ah, 0
		or	ax, ax
		jz	short loc_31694
		cmp	[bp+var_25], 0
		jz	short loc_3165D
		cmp	[bp+arg_2], 0
		jnz	short loc_31694

loc_3165D:
		push	large [bp+var_14]
		push	large [bp+var_8]
		cmp	[bp+var_25], 0
		jz	short loc_31670
		mov	ax, 4618h
		jmp	short loc_31673

loc_31670:
		mov	ax, 4622h

loc_31673:
		push	ax
		push	45F8h
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Eh
		or	si, si
		jz	short loc_3168A
		jmp	loc_314DA

loc_3168A:
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_31694:
		mov	eax, [bp+var_8]
		add	eax, [bp+var_14]
		cmp	eax, dword_4CFB2
		jnb	short loc_316A6
		jmp	loc_314ED

loc_316A6:
		cmp	[bp+arg_0], 0
		jz	short loc_316E0
		push	large [bp+var_10]
		push	large [bp+var_C]
		push	4627h
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		or	si, si
		jz	short loc_316D6
		push	si
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Strrchr_Like
		add	sp, 4
		jmp	short loc_316E0

loc_316D6:
		lea	ax, [bp+var_76]
		push	ax
		call	CRT_Msg_NullPtrAssign
		pop	cx

loc_316E0:
		pop	si
		leave
		retf
sub_31490		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_316E3		proc far

var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	eax, [bp+arg_0]
		shr	eax, 0Eh
		mov	[bp+var_6], ax
		mov	[bp+var_7], 0
		xor	di, di
		jmp	short loc_31721

loc_316FE:
		mov	bx, di
		shl	bx, 2
		mov	ax, [bp+var_6]
		add	ax, di
		cmp	[bx+6B88h], ax
		jz	short loc_31720
		mov	bx, di
		shl	bx, 2
		mov	ax, [bp+var_6]
		add	ax, di
		mov	[bx+6B88h], ax
		mov	[bp+var_7], 1

loc_31720:
		inc	di

loc_31721:
		cmp	di, 14h
		jge	short loc_31731
		mov	ax, [bp+var_6]
		add	ax, di
		cmp	ax, word_4CFA4
		jb	short loc_316FE

loc_31731:
		cmp	[bp+var_7], 0
		jz	short loc_31760
		mov	ax, 5000h
		mov	cx, 18h
		mov	dx, word_4CFA2
		mov	si, 6B88h
		int	67h
		or	ah, ah
		jnz	short loc_3174F
		mov	ax, 1
		jmp	short loc_31751

loc_3174F:
		xor	ax, ax

loc_31751:
		mov	ah, 0
		or	ax, ax
		jnz	short loc_31760
		push	150Eh
		call	sub_13451
		pop	cx

loc_31760:
		mov	eax, [bp+arg_0]
		and	eax, 3FFFh
		add	eax, dword_4CFAE
		mov	[bp+var_4], eax
		shr	eax, 4
		mov	dx, word ptr [bp+var_4]
		and	dx, 0Fh
		push	dx
		mov	dx, ax
		pop	ax
		pop	di
		pop	si
		leave
		retf
sub_316E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31785		proc far

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
		jmp	short loc_317F8

loc_317BB:
		cmp	[bp+arg_8], 0FFF0h
		jbe	short loc_317CA
		mov	ax, 0FFF0h
		jmp	short loc_317CD

loc_317CA:
		mov	ax, word ptr [bp+arg_8]

loc_317CD:
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

loc_317F8:
		cmp	[bp+arg_8], 0
		jnz	short loc_317BB
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
sub_31785		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31804		proc far

var_6C		= word ptr -6Ch
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 6Ch
		mov	eax, [bp+arg_0]
		add	eax, [bp+arg_8]
		cmp	eax, dword_4CFB2
		ja	short loc_3182F
		mov	eax, [bp+arg_4]
		add	eax, [bp+arg_8]
		cmp	eax, dword_4CFB2
		ja	short loc_3182F
		cmp	[bp+arg_8], 0
		jnz	short loc_31838

loc_3182F:
		push	1209h
		call	sub_13451
		pop	cx

loc_31838:
		push	ss
		lea	ax, [bp+var_6C]
		push	ax
		push	cs
		call	near ptr sub_30C62
		add	sp, 4

loc_31844:
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_316E3
		add	sp, 4
		mov	word ptr [bp+var_C+2], dx
		mov	word ptr [bp+var_C], ax
		push	4
		push	large [bp+arg_4]
		push	cs
		call	near ptr sub_31186
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+arg_4]
		and	eax, 3FFFh
		mov	edx, 10000h
		sub	edx, eax
		mov	[bp+var_4], edx
		mov	eax, [bp+var_4]
		cmp	eax, [bp+arg_8]
		jbe	short loc_31891
		mov	eax, [bp+arg_8]
		mov	[bp+var_4], eax

loc_31891:
		push	large [bp+var_4]
		push	large [bp+var_8]
		push	large [bp+var_C]
		push	cs
		call	near ptr sub_31785
		add	sp, 0Ch
		mov	eax, [bp+var_4]
		add	[bp+arg_4], eax
		add	[bp+arg_0], eax
		sub	[bp+arg_8], eax
		cmp	[bp+arg_8], 0
		jnz	short loc_31844
		push	ss
		lea	ax, [bp+var_6C]
		push	ax
		push	cs
		call	near ptr sub_30C79
		add	sp, 4
		leave
		retf
sub_31804		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_318C9		proc far

var_64		= word ptr -64h
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 64h
		les	bx, [bp+arg_0]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		add	eax, [bp+arg_4]
		add	eax, 10h
		mov	[bp+var_4], eax
		cmp	word ptr [bp+arg_8+2], 0A000h
		jnb	short loc_31927
		push	ss
		lea	ax, [bp+var_64]
		push	ax
		push	cs
		call	near ptr sub_30C62
		add	sp, 4
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	4
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_31186
		add	sp, 6
		push	dx
		push	ax
		push	cs
		call	near ptr sub_31785
		add	sp, 0Ch
		push	ss
		lea	ax, [bp+var_64]
		push	ax
		push	cs
		call	near ptr sub_30C79
		add	sp, 4
		jmp	short loc_31943

loc_31927:
		push	large [bp+arg_C]
		push	large [bp+arg_8]
		push	cs
		call	near ptr sub_312CC
		add	sp, 4
		push	dx
		push	ax
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_31804
		add	sp, 0Ch

loc_31943:
		leave
		retf
sub_318C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_31945		proc far

var_64		= word ptr -64h
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 64h
		les	bx, [bp+arg_4]
		mov	eax, es:[bx]
		and	eax, 0FFFFFEh
		add	eax, [bp+arg_8]
		add	eax, 10h
		mov	[bp+var_4], eax
		cmp	word ptr [bp+arg_0+2], 0A000h
		jnb	short loc_319A3
		push	ss
		lea	ax, [bp+var_64]
		push	ax
		push	cs
		call	near ptr sub_30C62
		add	sp, 4
		push	large [bp+arg_C]
		push	4
		push	large [bp+var_4]
		push	cs
		call	near ptr sub_31186
		add	sp, 6
		push	dx
		push	ax
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_31785
		add	sp, 0Ch
		push	ss
		lea	ax, [bp+var_64]
		push	ax
		push	cs
		call	near ptr sub_30C79
		add	sp, 4
		jmp	short loc_319BF

loc_319A3:
		push	large [bp+arg_C]
		push	large [bp+var_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_312CC
		add	sp, 4
		push	dx
		push	ax
		push	cs
		call	near ptr sub_31804
		add	sp, 0Ch

loc_319BF:
		leave
sub_31945		endp
seg096		ends
