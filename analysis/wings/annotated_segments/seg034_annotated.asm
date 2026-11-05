seg034		segment	para public 'CODE' use16
		assume cs:seg034
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Input_JoyTimestampValid (sub_22EE2 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Input_JoyTimestampValid (sub_28642 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far,45L — vérifie qu'un timestamp (dword_6E477)
; correspond au mode d'entrée courant (byte_722D1 entre 2 et 0xB, plage joystick) et à une
; valeur attendue : validation du timestamp d'un événement d'entrée joystick.
; ==============================================================================================
Input_JoyTimestampValid		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	dword_5B4E9, 0
		jz	short loc_1972B
		cmp	byte_5FDDF, 2
		jb	short loc_1972B
		cmp	byte_5FDDF, 0Bh
		ja	short loc_1972B
		mov	eax, dword_5B4E9
		cmp	eax, [bp+arg_0]
		jz	short loc_1972B
		xor	ax, ax
		jmp	short loc_19730

loc_1972B:
		mov	al, byte_5FDDF
		mov	ah, 0

loc_19730:
		pop	bp
		retf
Input_JoyTimestampValid		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Input_NotifyModeChange (sub_22F10 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à Input_NotifyModeChange (sub_28670 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,18L — enregistre le mode
; d'entrée courant (byte_722D1) et notifie l'UI (sub_66DA3, code 0x5220) puis calibre
; (sub_6823A) : notification de changement de mode de contrôleur + calibration.
; ==============================================================================================
Input_NotifyModeChange		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_5FDDF
		mov	ah, 0
		mov	word_5B4D9, ax
		push	1
		push	60BEh
		call	sub_55996
		add	sp, 4
		call	Keyboard_DrainBufferBIOS_578C9
		pop	bp
		retf
Input_NotifyModeChange		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à Mouse_InitAndRead
; (sub_22F32 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; Mouse_InitAndRead (sub_28692 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far,15L — configure les bornes souris (0x640x0x140 probable) et
; lit sa position (sub_67481/sub_67499 → word_6E471/6E473) : initialisation souris + lecture
; position courante.
; ==============================================================================================
Mouse_InitAndRead		proc far
		push	bp
		mov	bp, sp
		push	large 640140h
		call	TextScrollDisplay_RegisterEntries_55F34
		add	sp, 4
		call	TextScroll_ApplyHelperC_55D5F
		call	sub_55FFC
		mov	word_5B4DB, ax
		call	sub_56014
		mov	word_5B4DD, ax
		pop	bp
		retf
Mouse_InitAndRead		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1977C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_1977C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_22F62 (sub_22F62 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via
; vtable (DATA XREF seg339) — enveloppe appelant StreamReader_Destruct_638FF. Référencée
; directement par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_19784		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0
		call	sub_56A8F
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_19784		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19794		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Input_NotifyModeChange
		pop	cx
		cmp	word_603C4, 1
		jg	short loc_197C4
		cmp	word_603CA, 2
		jz	short loc_197C4
		cmp	word_603CA, 4
		jz	short loc_197C4
		cmp	word_603C6, 0
		jg	short loc_197C4
		cmp	word_603C8, 0
		jle	short loc_197CA

loc_197C4:
		push	si
		push	cs
		call	near ptr StreamReader_DestructWrapper_19784
		pop	cx

loc_197CA:
		pop	si
		pop	bp
		retf
sub_19794		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Cursor_SlotAllocate (sub_22F95 de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Cursor_SlotAllocate (sub_286FA de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,29L — recherche un slot libre (2 max, flag à
; +0x5224) et le marque occupé : allocateur de slot de curseur/ressource pointeur (pool de 2).
; ==============================================================================================
Cursor_SlotAllocate		proc far
		push	bp
		mov	bp, sp
		push	si
		xor	si, si
		jmp	short loc_197E6

loc_197D5:
		cmp	byte ptr [si+60C2h], 0
		jz	short loc_197E5
		mov	byte ptr [si+60C2h], 0
		mov	ax, si
		jmp	short loc_197EE

loc_197E5:
		inc	si

loc_197E6:
		cmp	si, 2
		jl	short loc_197D5
		mov	ax, 0FFFFh

loc_197EE:
		pop	si
		pop	bp
		retf
Cursor_SlotAllocate		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Cursor_SlotFree (sub_22FB9 de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Cursor_SlotFree (sub_2871E de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,19L — libère un slot précédemment alloué par
; sub_286FA (marque le flag +0x5224 à 0, invalide le handle 0xFFFF) : libération de slot
; curseur/pointeur.
; ==============================================================================================
Cursor_SlotFree		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 0FFFFh
		jz	short loc_1980D
		mov	bx, es:[bx]
		mov	byte ptr [bx+60C2h], 1
		mov	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0FFFFh

loc_1980D:
		pop	bp
		retf
Cursor_SlotFree		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Input_ReadAxis1Deadzone (sub_23027 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants
; et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à Input_ReadAxis1Deadzone (sub_2873C de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far,210L — vérifie le mode joystick
; (byte_722D1), la souris présente (sub_67B82), accumule le déplacement
; (dword_722DE+dword_722E2) et compare à un seuil de zone morte (dword_711CD) : lecture d'axe
; joystick avec filtre de zone morte (deadzone), axe 1.
; ==============================================================================================
Input_ReadAxis1Deadzone		proc far

var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	al, byte_5FDDF
		mov	ah, 0
		mov	si, ax
		or	si, si
		jz	short loc_19825
		jmp	loc_19973

loc_19825:
		push	0
		call	sub_56B3C
		pop	cx
		or	al, al
		jnz	short loc_19834
		jmp	loc_198F1

loc_19834:
		mov	eax, dword_5FDEC
		add	eax, dword_5FDF0
		cmp	eax, dword_5E7D3
		ja	short loc_19849
		mov	ax, 1
		jmp	short loc_1984B

loc_19849:
		xor	ax, ax

loc_1984B:
		or	al, al
		jnz	short loc_19852
		jmp	loc_198F1

loc_19852:
		mov	dword_5FDF0, 5
		mov	eax, dword_5E7D3
		mov	dword_5FDEC, eax
		push	0
		call	sub_56A8F
		pop	cx
		push	2
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	ah, 0
		shl	ax, 1
		push	ax
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	ah, 0
		mov	dx, ax
		pop	ax
		add	ax, dx
		or	ax, ax
		jz	short loc_198A2
		test	ax, 1
		jz	short loc_1989D
		mov	si, 1Ch
		jmp	short loc_198F1

loc_1989D:
		mov	si, 1
		jmp	short loc_198F1

loc_198A2:
		push	0
		call	sub_56BBF
		pop	cx
		mov	di, ax
		push	0
		call	sub_56BCE
		pop	cx
		mov	dx, ax
		cmp	di, 10h
		jle	short loc_198C0
		mov	si, 4Dh
		jmp	short loc_198DC

loc_198C0:
		cmp	di, 0FFF0h
		jge	short loc_198CA
		mov	si, 4Bh
		jmp	short loc_198DC

loc_198CA:
		cmp	dx, 10h
		jle	short loc_198D4
		mov	si, 50h
		jmp	short loc_198DC

loc_198D4:
		cmp	dx, 0FFF0h
		jge	short loc_198DC
		mov	si, 48h

loc_198DC:
		or	si, si
		jz	short loc_198F1
		mov	dword_5FDF0, 1Eh
		mov	eax, dword_5E7D3
		mov	dword_5FDEC, eax

loc_198F1:
		or	si, si
		jnz	short loc_19973
		mov	byte ptr [bp+var_8], 0
		lea	ax, [bp+var_8]
		push	ax
		call	TextScroll_FormatAndApply_55D7F
		pop	cx
		cmp	byte ptr [bp+var_8], 3
		jnz	short loc_1995F
		call	sub_55FFC
		mov	di, ax
		call	sub_56014
		mov	dx, ax
		mov	ax, word_5B4DB
		add	ax, 60h
		cmp	ax, di
		jge	short loc_19926
		mov	si, 4Dh
		jmp	short loc_19951

loc_19926:
		mov	ax, word_5B4DB
		add	ax, 0FFA0h
		cmp	ax, di
		jle	short loc_19935
		mov	si, 4Bh
		jmp	short loc_19951

loc_19935:
		mov	ax, word_5B4DD
		add	ax, 30h
		cmp	ax, dx
		jge	short loc_19944
		mov	si, 50h
		jmp	short loc_19951

loc_19944:
		mov	ax, word_5B4DD
		add	ax, 0FFD0h
		cmp	ax, dx
		jle	short loc_19951
		mov	si, 48h

loc_19951:
		or	si, si
		jz	short loc_19973
		mov	word_5B4DB, di
		mov	word_5B4DD, dx
		jmp	short loc_19973

loc_1995F:
		cmp	byte ptr [bp+var_8], 2
		jnz	short loc_19973
		test	byte ptr [bp+var_8+1], 1
		jz	short loc_19970
		mov	si, 1Ch
		jmp	short loc_19973

loc_19970:
		mov	si, 1

loc_19973:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Input_ReadAxis1Deadzone		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19979		proc far

var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	di, word_5E7CC
		mov	ax, word_5E7CE
		mov	[bp+var_4], ax
		mov	eax, dword_5FDE4
		add	eax, dword_5FDE8
		cmp	eax, dword_5E7D3
		ja	short loc_199A7
		mov	ax, 1
		jmp	short loc_199A9

loc_199A7:
		xor	ax, ax

loc_199A9:
		or	al, al
		jnz	short loc_199B0
		jmp	loc_19B50

loc_199B0:
		movsx	eax, word_5B4ED
		mov	[bp+var_8], eax
		mov	dword_5FDE8, eax
		mov	eax, dword_5E7D3
		mov	dword_5FDE4, eax
		push	0FFh
		push	[bp+arg_2]
		call	sub_55996
		add	sp, 4
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx+1], 1Ch
		jz	short loc_199E0
		jmp	loc_19A63

loc_199E0:
		cmp	byte ptr [bx], 1
		jnz	short loc_19A1E
		mov	al, byte_5B4F1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_19A1E
		mov	byte ptr [si], 1
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_A], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_C], ax
		mov	ax, [bp+var_A]
		mov	[si+2], ax
		mov	ax, [bp+var_C]
		mov	[si+4], ax
		mov	[bp+var_1], 1
		mov	byte_5B4F1, 1
		jmp	loc_19B50

loc_19A1E:
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx], 2
		jz	short loc_19A29
		jmp	loc_19B50

loc_19A29:
		cmp	byte_5B4F1, 0
		jnz	short loc_19A33
		jmp	loc_19B50

loc_19A33:
		mov	byte ptr [si], 2
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_E], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_10], ax
		mov	ax, [bp+var_E]
		mov	[si+2], ax
		mov	ax, [bp+var_10]
		mov	[si+4], ax
		mov	byte_5B4F1, 0
		mov	[bp+var_1], 1
		jmp	loc_19B50

loc_19A63:
		cmp	byte_605DE, 1
		jnz	short loc_19A78
		cmp	[bp+var_4], 0
		jle	short loc_19A78
		sub	[bp+var_4], 3
		mov	[bp+var_1], 1

loc_19A78:
		cmp	byte_605E6, 1
		jnz	short loc_19A8E
		cmp	[bp+var_4], 0C7h
		jge	short loc_19A8E
		add	[bp+var_4], 3
		mov	[bp+var_1], 1

loc_19A8E:
		cmp	byte_605E1, 1
		jnz	short loc_19AA0
		or	di, di
		jle	short loc_19AA0
		sub	di, 3
		mov	[bp+var_1], 1

loc_19AA0:
		cmp	byte_605E3, 1
		jnz	short loc_19AB4
		cmp	di, 13Fh
		jge	short loc_19AB4
		add	di, 3
		mov	[bp+var_1], 1

loc_19AB4:
		cmp	[bp+var_1], 0
		jnz	short loc_19ABD
		jmp	loc_19B4A

loc_19ABD:
		dec	word_5B4ED
		cmp	word_5B4ED, 1
		jg	short loc_19ACE
		mov	word_5B4ED, 1

loc_19ACE:
		cmp	di, word_5B4DF
		jge	short loc_19AD8
		mov	di, word_5B4DF

loc_19AD8:
		cmp	di, word_5B4E3
		jle	short loc_19AE2
		mov	di, word_5B4E3

loc_19AE2:
		mov	ax, [bp+var_4]
		cmp	ax, word_5B4E1
		jge	short loc_19AF1
		mov	ax, word_5B4E1
		mov	[bp+var_4], ax

loc_19AF1:
		mov	ax, [bp+var_4]
		cmp	ax, word_5B4E5
		jle	short loc_19B00
		mov	ax, word_5B4E5
		mov	[bp+var_4], ax

loc_19B00:
		mov	byte ptr [si], 3
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_12], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_12]
		mov	[si+2], ax
		mov	ax, [bp+var_14]
		mov	[si+4], ax
		push	[bp+var_4]
		mov	ax, di
		shl	ax, 1
		push	ax
		call	TextScrollDisplay_RegisterEntries_55F34
		add	sp, 4
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_16], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_18], ax
		push	ax
		push	[bp+var_16]
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_57148
		add	sp, 8
		jmp	short loc_19B50

loc_19B4A:
		mov	word_5B4ED, 5

loc_19B50:
		cmp	byte_5B4F1, 0
		jz	short loc_19B5F
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1

loc_19B5F:
		mov	ax, 0C00h
		int	21h
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_19979		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19B6B		proc far

var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	dx, word_60692
		cmp	dx, 1
		jnz	short loc_19B86
		jmp	loc_19D91

loc_19B86:
		cmp	dx, 3FFFh
		jnz	short loc_19B8F
		jmp	loc_19D91

loc_19B8F:
		mov	di, word_5E7CC
		mov	ax, word_5E7CE
		mov	[bp+var_4], ax
		mov	eax, dword_5FDEC
		add	eax, dword_5FDF0
		cmp	eax, dword_5E7D3
		ja	short loc_19BAE
		mov	ax, 1
		jmp	short loc_19BB0

loc_19BAE:
		xor	ax, ax

loc_19BB0:
		or	al, al
		jnz	short loc_19BB7
		jmp	loc_19D91

loc_19BB7:
		movsx	eax, word_5B4EF
		mov	[bp+var_8], eax
		mov	dword_5FDF0, eax
		mov	eax, dword_5E7D3
		mov	dword_5FDEC, eax
		push	0
		call	sub_56A8F
		pop	cx
		push	1
		push	0
		call	Joystick_TestButtonMasked_56B26
		add	sp, 4
		mov	dl, al
		or	dl, dl
		jz	short loc_19C20
		mov	al, byte_5B4F2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_19C20
		mov	byte ptr [si], 1
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_C], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_E], ax
		mov	ax, [bp+var_C]
		mov	[si+2], ax
		mov	ax, [bp+var_E]
		mov	[si+4], ax
		mov	[bp+var_1], 1
		mov	byte_5B4F2, 1
		jmp	loc_19D91

loc_19C20:
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_19C5F
		cmp	byte_5B4F2, 0
		jz	short loc_19C5F
		mov	byte ptr [si], 2
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_10], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_12], ax
		mov	ax, [bp+var_10]
		mov	[si+2], ax
		mov	ax, [bp+var_12]
		mov	[si+4], ax
		mov	[bp+var_1], 1
		mov	byte_5B4F2, 0
		jmp	loc_19D91

loc_19C5F:
		push	0
		call	sub_56BBF
		pop	cx
		mov	[bp+var_A], ax
		push	0
		call	sub_56BCE
		pop	cx
		mov	bx, ax
		cmp	[bp+var_A], 0
		jnz	short loc_19C7E
		or	bx, bx
		jz	short loc_19C83

loc_19C7E:
		mov	ax, 1
		jmp	short loc_19C85

loc_19C83:
		xor	ax, ax

loc_19C85:
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_19C91
		jmp	loc_19D8B

loc_19C91:
		cmp	[bp+var_A], 0
		jle	short loc_19CA2
		cmp	di, 13Fh
		jge	short loc_19CA2
		add	di, 3
		jmp	short loc_19CAF

loc_19CA2:
		cmp	[bp+var_A], 0
		jge	short loc_19CAF
		or	di, di
		jle	short loc_19CAF
		sub	di, 3

loc_19CAF:
		or	bx, bx
		jle	short loc_19CC0
		cmp	[bp+var_4], 0C7h
		jge	short loc_19CC0
		add	[bp+var_4], 3
		jmp	short loc_19CCE

loc_19CC0:
		or	bx, bx
		jge	short loc_19CCE
		cmp	[bp+var_4], 0
		jle	short loc_19CCE
		sub	[bp+var_4], 3

loc_19CCE:
		mov	ax, [bp+var_A]
		mov	[bp+var_16], ax
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	cx, ax
		mov	[bp+var_18], bx
		mov	ax, [bp+var_18]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	dx, ax
		cmp	cx, dx
		jle	short loc_19CF0
		mov	ax, cx
		jmp	short loc_19CF2

loc_19CF0:
		mov	ax, dx

loc_19CF2:
		mov	[bp+var_14], ax
		mov	[bp+var_1A], 4
		mov	ax, [bp+var_1A]
		imul	[bp+var_14]
		mov	bx, 20h
		cwd
		idiv	bx
		mov	dx, 5
		sub	dx, ax
		mov	word_5B4EF, dx
		cmp	di, word_5B4DF
		jge	short loc_19D19
		mov	di, word_5B4DF

loc_19D19:
		cmp	di, word_5B4E3
		jle	short loc_19D23
		mov	di, word_5B4E3

loc_19D23:
		mov	ax, [bp+var_4]
		cmp	ax, word_5B4E1
		jge	short loc_19D32
		mov	ax, word_5B4E1
		mov	[bp+var_4], ax

loc_19D32:
		mov	ax, [bp+var_4]
		cmp	ax, word_5B4E5
		jle	short loc_19D41
		mov	ax, word_5B4E5
		mov	[bp+var_4], ax

loc_19D41:
		mov	byte ptr [si], 3
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_1C], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_1C]
		mov	[si+2], ax
		mov	ax, [bp+var_1E]
		mov	[si+4], ax
		push	[bp+var_4]
		mov	ax, di
		shl	ax, 1
		push	ax
		call	TextScrollDisplay_RegisterEntries_55F34
		add	sp, 4
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_20], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_22], ax
		push	ax
		push	[bp+var_20]
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_57148
		add	sp, 8
		jmp	short loc_19D91

loc_19D8B:
		mov	word_5B4EF, 5

loc_19D91:
		cmp	byte_5B4F2, 0
		jz	short loc_19DA0
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1

loc_19DA0:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_19B6B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19DA7		proc far
		push	bp
		mov	bp, sp
		push	60BCh
		call	TextScrollDisplayB_ConstructAndReset_5705D
		pop	cx
		xor	eax, eax
		mov	dword_5FDE8, eax
		mov	dword_5FDE4, eax
		xor	eax, eax
		mov	dword_5FDF0, eax
		mov	dword_5FDEC, eax
		pop	bp
		retf
sub_19DA7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_19DCB		proc far
		push	bp
		mov	bp, sp
sub_19DCB		endp

; START OF FUNCTION CHUNK FOR sub_19DCB
		db 68h, 0BCh
; END OF FUNCTION CHUNK FOR sub_19DCB
seg034		ends
