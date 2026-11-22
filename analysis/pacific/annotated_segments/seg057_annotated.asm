seg057		segment	para public 'CODE' use16
		assume cs:seg057
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 56h, 9Ah, 0B2h, 3, 0, 0, 59h

loc_22DD7:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22DDB		proc far

var_14		= word ptr -14h
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	al, byte_76918
		mov	ah, 0
		or	ax, ax
		jnz	short loc_22DF3
		call	sub_6E560
		jmp	loc_22EDF

loc_22DF3:
		push	large 100000h
		push	5CC4h
		call	CRT_Memset_Public
		add	sp, 6
		mov	ax, word_76919
		mov	[bp+var_14], ax
		xor	ax, ax
		mov	ah, 84h
		mov	dx, 0
		mov	bx, [bp+var_14]
		int	15h
		mov	[bp+var_11], al
		mov	al, [bp+var_11]
		xor	al, 0FFh
		mov	[bp+var_11], al
		test	[bp+var_11], 10h
		jz	short loc_22E2C
		mov	ax, 1
		jmp	short loc_22E2E

loc_22E2C:
		xor	ax, ax

loc_22E2E:
		mov	[bp+var_A], ax
		test	[bp+var_11], 20h
		jz	short loc_22E3C
		mov	ax, 1
		jmp	short loc_22E3E

loc_22E3C:
		xor	ax, ax

loc_22E3E:
		mov	[bp+var_C], ax
		test	[bp+var_11], 40h
		jz	short loc_22E4C
		mov	ax, 1
		jmp	short loc_22E4E

loc_22E4C:
		xor	ax, ax

loc_22E4E:
		mov	[bp+var_E], ax
		test	[bp+var_11], 80h
		jz	short loc_22E5C
		mov	ax, 1
		jmp	short loc_22E5E

loc_22E5C:
		xor	ax, ax

loc_22E5E:
		mov	[bp+var_10], ax
		xor	ax, ax
		mov	ah, 84h
		mov	dx, 1
		mov	bx, [bp+var_14]
		mov	al, 4
		int	15h
		mov	[bp+var_2], ax
		mov	[bp+var_4], bx
		mov	[bp+var_6], cx
		mov	[bp+var_8], dx
		mov	ax, [bp+var_2]
		mov	word_7C3F4, ax
		mov	ax, [bp+var_4]
		mov	word_7C3F6, ax
		mov	ax, [bp+var_6]
		mov	word_7C3FC, ax
		mov	ax, [bp+var_8]
		mov	word_7C3FE, ax
		mov	ax, [bp+var_A]
		or	word_7C3F8, ax
		mov	ax, [bp+var_C]
		shl	ax, 1
		or	word_7C3F8, ax
		mov	ax, [bp+var_E]
		or	word_7C400, ax
		mov	ax, [bp+var_10]
		shl	ax, 1
		or	word_7C400, ax
		xor	si, si
		jmp	short loc_22EDA

loc_22EB7:
		mov	bx, si
		shl	bx, 3
		mov	ax, [bx+5CC4h]
		mov	bx, si
		shl	bx, 1
		mov	[bx+5CFAh], ax
		mov	bx, si
		shl	bx, 3
		mov	ax, [bx+5CC6h]
		mov	bx, si
		shl	bx, 1
		mov	[bx+5CFEh], ax
		inc	si

loc_22EDA:
		cmp	si, 2
		jl	short loc_22EB7

loc_22EDF:
		pop	si
		leave
		retf
sub_22DDB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Input_JoyTimestampValid
; (sub_28642 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,45L — vérifie qu'un timestamp (dword_6E477) correspond au mode d'entrée courant
; (byte_722D1 entre 2 et 0xB, plage joystick) et à une valeur attendue : validation du
; timestamp d'un événement d'entrée joystick.
; ==============================================================================================
Input_JoyTimestampValid		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		cmp	dword_775ED, 0
		jz	short loc_22F09
		cmp	byte_7CAC3, 2
		jb	short loc_22F09
		cmp	byte_7CAC3, 0Bh
		ja	short loc_22F09
		mov	eax, dword_775ED
		cmp	eax, [bp+arg_0]
		jz	short loc_22F09
		xor	ax, ax
		jmp	short loc_22F0E

loc_22F09:
		mov	al, byte_7CAC3
		mov	ah, 0

loc_22F0E:
		pop	bp
		retf
Input_JoyTimestampValid		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Input_NotifyModeChange (sub_28670 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,18L — enregistre
; le mode d'entrée courant (byte_722D1) et notifie l'UI (sub_66DA3, code 0x5220) puis calibre
; (sub_6823A) : notification de changement de mode de contrôleur + calibration.
; ==============================================================================================
Input_NotifyModeChange		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, byte_7CAC3
		mov	ah, 0
		mov	word_775E3, ax
		push	1
		push	6392h
		call	sub_6EF5A
		add	sp, 4
		call	Keyboard_DrainBufferBIOS_701E1
		pop	bp
		retf
Input_NotifyModeChange		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Mouse_InitAndRead
; (sub_28692 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,15L — configure les bornes souris (0x640x0x140 probable) et lit sa position
; (sub_67481/sub_67499 → word_6E471/6E473) : initialisation souris + lecture position
; courante.
; ==============================================================================================
Mouse_InitAndRead		proc far
		push	bp
		mov	bp, sp
		push	large 640140h
		call	TextScrollDisplay_RegisterEntries_6F4F8
		add	sp, 4
		call	TextScroll_ApplyHelperC_6F323
		call	sub_6F5C0
		mov	word_775E5, ax
		call	sub_6F5D8
		mov	word_775E7, ax
		pop	bp
		retf
Mouse_InitAndRead		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22F5A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_22F5A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à StreamReader_DestructWrapper_3D231 (sub_3D231 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, référencée via vtable (DATA XREF seg339) —
; enveloppe appelant StreamReader_Destruct_638FF. Référencée directement par TextRenderer_Main
; (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_22F62		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	0
		call	sub_51D5
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_22F62		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22F72		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr Input_NotifyModeChange
		pop	cx
		push	si
		push	cs
		call	near ptr sub_22F5A
		pop	cx
		cmp	byte_7C404, 0
		jz	short loc_22F92
		push	si
		push	cs
		call	near ptr StreamReader_DestructWrapper_22F62
		pop	cx

loc_22F92:
		pop	si
		pop	bp
		retf
sub_22F72		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Cursor_SlotAllocate (sub_286FA de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,29L — recherche un slot
; libre (2 max, flag à +0x5224) et le marque occupé : allocateur de slot de curseur/ressource
; pointeur (pool de 2).
; ==============================================================================================
Cursor_SlotAllocate		proc far
		push	bp
		mov	bp, sp
		push	si
		xor	si, si
		jmp	short loc_22FAE

loc_22F9D:
		cmp	byte ptr [si+6396h], 0
		jz	short loc_22FAD
		mov	byte ptr [si+6396h], 0
		mov	ax, si
		jmp	short loc_22FB6

loc_22FAD:
		inc	si

loc_22FAE:
		cmp	si, 2
		jl	short loc_22F9D
		mov	ax, 0FFFFh

loc_22FB6:
		pop	si
		pop	bp
		retf
Cursor_SlotAllocate		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Cursor_SlotFree (sub_2871E de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,19L — libère un slot
; précédemment alloué par sub_286FA (marque le flag +0x5224 à 0, invalide le handle 0xFFFF) :
; libération de slot curseur/pointeur.
; ==============================================================================================
Cursor_SlotFree		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 0FFFFh
		jz	short loc_22FD5
		mov	bx, es:[bx]
		mov	byte ptr [bx+6396h], 1
		mov	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0FFFFh

loc_22FD5:
		pop	bp
		retf
Cursor_SlotFree		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22FD7		proc far
		push	bp
		mov	bp, sp
		push	si
		push	di
		xor	si, si
		mov	di, word_775EB
		sar	di, 2
		push	1
		call	sub_52B0
		pop	cx
		mov	dx, ax
		mov	ax, word_775EB
		sub	ax, di
		cmp	ax, dx
		jle	short loc_22FFD
		mov	si, 0FFFFh
		jmp	short loc_23009

loc_22FFD:
		mov	ax, word_775EB
		add	ax, di
		cmp	ax, dx
		jge	short loc_23009
		mov	si, 1

loc_23009:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
sub_22FD7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2300F		proc far

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	[bp+var_2], 0
		push	1
		call	sub_52BE
		pop	cx
		mov	ax, [bp+var_2]
		leave
		retf
sub_2300F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Input_ReadAxis1Deadzone
; (sub_2873C de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,210L — vérifie le mode joystick (byte_722D1), la souris présente (sub_67B82),
; accumule le déplacement (dword_722DE+dword_722E2) et compare à un seuil de zone morte
; (dword_711CD) : lecture d'axe joystick avec filtre de zone morte (deadzone), axe 1.
; ==============================================================================================
Input_ReadAxis1Deadzone		proc far

var_8		= word ptr -8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	al, byte_7CAC3
		mov	ah, 0
		mov	si, ax
		or	si, si
		jz	short loc_2303D
		jmp	loc_2318B

loc_2303D:
		push	0
		call	sub_524B
		pop	cx
		or	al, al
		jnz	short loc_2304C
		jmp	loc_23109

loc_2304C:
		mov	eax, dword_7CAD2
		add	eax, dword_7CAD6
		cmp	eax, dword_7B29D
		ja	short loc_23061
		mov	ax, 1
		jmp	short loc_23063

loc_23061:
		xor	ax, ax

loc_23063:
		or	al, al
		jnz	short loc_2306A
		jmp	loc_23109

loc_2306A:
		mov	dword_7CAD6, 5
		mov	eax, dword_7B29D
		mov	dword_7CAD2, eax
		push	0
		call	sub_51D5
		pop	cx
		push	2
		push	0
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		shl	ax, 1
		push	ax
		push	1
		push	0
		call	sub_5235
		add	sp, 4
		mov	ah, 0
		mov	dx, ax
		pop	ax
		add	ax, dx
		or	ax, ax
		jz	short loc_230BA
		test	ax, 1
		jz	short loc_230B5
		mov	si, 1Ch
		jmp	short loc_23109

loc_230B5:
		mov	si, 1
		jmp	short loc_23109

loc_230BA:
		push	0
		call	sub_5292
		pop	cx
		mov	di, ax
		push	0
		call	sub_52A1
		pop	cx
		mov	dx, ax
		cmp	di, 10h
		jle	short loc_230D8
		mov	si, 4Dh
		jmp	short loc_230F4

loc_230D8:
		cmp	di, 0FFF0h
		jge	short loc_230E2
		mov	si, 4Bh
		jmp	short loc_230F4

loc_230E2:
		cmp	dx, 10h
		jle	short loc_230EC
		mov	si, 50h
		jmp	short loc_230F4

loc_230EC:
		cmp	dx, 0FFF0h
		jge	short loc_230F4
		mov	si, 48h

loc_230F4:
		or	si, si
		jz	short loc_23109
		mov	dword_7CAD6, 1Eh
		mov	eax, dword_7B29D
		mov	dword_7CAD2, eax

loc_23109:
		or	si, si
		jnz	short loc_2318B
		mov	byte ptr [bp+var_8], 0
		lea	ax, [bp+var_8]
		push	ax
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte ptr [bp+var_8], 3
		jnz	short loc_23177
		call	sub_6F5C0
		mov	di, ax
		call	sub_6F5D8
		mov	dx, ax
		mov	ax, word_775E5
		add	ax, 60h
		cmp	ax, di
		jge	short loc_2313E
		mov	si, 4Dh
		jmp	short loc_23169

loc_2313E:
		mov	ax, word_775E5
		add	ax, 0FFA0h
		cmp	ax, di
		jle	short loc_2314D
		mov	si, 4Bh
		jmp	short loc_23169

loc_2314D:
		mov	ax, word_775E7
		add	ax, 30h
		cmp	ax, dx
		jge	short loc_2315C
		mov	si, 50h
		jmp	short loc_23169

loc_2315C:
		mov	ax, word_775E7
		add	ax, 0FFD0h
		cmp	ax, dx
		jle	short loc_23169
		mov	si, 48h

loc_23169:
		or	si, si
		jz	short loc_2318B
		mov	word_775E5, di
		mov	word_775E7, dx
		jmp	short loc_2318B

loc_23177:
		cmp	byte ptr [bp+var_8], 2
		jnz	short loc_2318B
		test	byte ptr [bp+var_8+1], 1
		jz	short loc_23188
		mov	si, 1Ch
		jmp	short loc_2318B

loc_23188:
		mov	si, 1

loc_2318B:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
Input_ReadAxis1Deadzone		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Input_ReadAxis2Deadzone
; (sub_288A6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,220L — variante de sub_2873C sur les globals dword_722D6/722DA (probable axe 2) :
; lecture d'axe joystick avec deadzone, axe 2 — appelée par Player_MainUpdate.
; ==============================================================================================
Input_ReadAxis2Deadzone		proc far

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
		mov	di, word_7B296
		mov	ax, word_7B298
		mov	[bp+var_4], ax
		mov	eax, dword_7CACA
		add	eax, dword_7CACE
		cmp	eax, dword_7B29D
		ja	short loc_231BF
		mov	ax, 1
		jmp	short loc_231C1

loc_231BF:
		xor	ax, ax

loc_231C1:
		or	al, al
		jnz	short loc_231C8
		jmp	loc_23333

loc_231C8:
		movsx	eax, word_775F1
		mov	[bp+var_8], eax
		mov	dword_7CACE, eax
		mov	eax, dword_7B29D
		mov	dword_7CACA, eax
		push	0FFh
		push	[bp+arg_2]
		call	sub_6EF5A
		add	sp, 4
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx+1], 1Ch
		jz	short loc_231F8
		jmp	loc_2327B

loc_231F8:
		cmp	byte ptr [bx], 1
		jnz	short loc_23236
		mov	al, byte_775FA
		mov	ah, 0
		or	ax, ax
		jnz	short loc_23236
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
		mov	byte_775FA, 1
		jmp	loc_23333

loc_23236:
		mov	bx, [bp+arg_2]
		cmp	byte ptr [bx], 2
		jz	short loc_23241
		jmp	loc_23333

loc_23241:
		cmp	byte_775FA, 0
		jnz	short loc_2324B
		jmp	loc_23333

loc_2324B:
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
		mov	byte_775FA, 0
		mov	[bp+var_1], 1
		jmp	loc_23333

loc_2327B:
		cmp	byte_7D358, 1
		jnz	short loc_23290
		cmp	[bp+var_4], 0
		jle	short loc_23290
		sub	[bp+var_4], 3
		mov	[bp+var_1], 1

loc_23290:
		cmp	byte_7D360, 1
		jnz	short loc_232A6
		cmp	[bp+var_4], 0C7h
		jge	short loc_232A6
		add	[bp+var_4], 3
		mov	[bp+var_1], 1

loc_232A6:
		cmp	byte_7D35B, 1
		jnz	short loc_232B8
		or	di, di
		jle	short loc_232B8
		sub	di, 3
		mov	[bp+var_1], 1

loc_232B8:
		cmp	byte_7D35D, 1
		jnz	short loc_232CC
		cmp	di, 13Fh
		jge	short loc_232CC
		add	di, 3
		mov	[bp+var_1], 1

loc_232CC:
		cmp	[bp+var_1], 0
		jz	short loc_2332D
		dec	word_775F1
		cmp	word_775F1, 1
		jg	short loc_232E3
		mov	word_775F1, 1

loc_232E3:
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
		call	TextScrollDisplay_RegisterEntries_6F4F8
		add	sp, 4
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_16], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_18], ax
		push	ax
		push	[bp+var_16]
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_6FA5F
		add	sp, 8
		jmp	short loc_23333

loc_2332D:
		mov	word_775F1, 5

loc_23333:
		cmp	byte_775FA, 0
		jz	short loc_23342
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1

loc_23342:
		mov	ax, 0C00h
		int	21h
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
Input_ReadAxis2Deadzone		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à Input_ReadCombinedAxes
; (sub_28A63 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,266L — variante combinant vérification souris (sub_67B82) et lecture d'axes
; multiples (word_711C6/711C8) : lecture combinée des axes de contrôle (joystick/souris) —
; appelée par Player_MainUpdate, cœur du pilotage manuel du joueur.
; ==============================================================================================
Input_ReadCombinedAxes		proc far

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
		push	0
		call	sub_524B
		pop	cx
		or	al, al
		jnz	short loc_2336C
		jmp	loc_2353C

loc_2336C:
		mov	di, word_7B296
		mov	ax, word_7B298
		mov	[bp+var_4], ax
		mov	eax, dword_7CAD2
		add	eax, dword_7CAD6
		cmp	eax, dword_7B29D
		ja	short loc_2338B
		mov	ax, 1
		jmp	short loc_2338D

loc_2338B:
		xor	ax, ax

loc_2338D:
		or	al, al
		jnz	short loc_23394
		jmp	loc_2353C

loc_23394:
		movsx	eax, word_775F3
		mov	[bp+var_8], eax
		mov	dword_7CAD6, eax
		mov	eax, dword_7B29D
		mov	dword_7CAD2, eax
		push	0
		call	sub_51D5
		pop	cx
		push	1
		push	0
		call	sub_5235
		add	sp, 4
		mov	dl, al
		or	dl, dl
		jz	short loc_233FD
		mov	al, byte_775FB
		mov	ah, 0
		or	ax, ax
		jnz	short loc_233FD
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
		mov	byte_775FB, 1
		jmp	loc_2353C

loc_233FD:
		mov	al, dl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_2343C
		cmp	byte_775FB, 0
		jz	short loc_2343C
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
		mov	byte_775FB, 0
		jmp	loc_2353C

loc_2343C:
		push	0
		call	sub_5292
		pop	cx
		mov	[bp+var_A], ax
		push	0
		call	sub_52A1
		pop	cx
		mov	bx, ax
		cmp	[bp+var_A], 0
		jnz	short loc_2345B
		or	bx, bx
		jz	short loc_23460

loc_2345B:
		mov	ax, 1
		jmp	short loc_23462

loc_23460:
		xor	ax, ax

loc_23462:
		mov	[bp+var_1], al
		cmp	[bp+var_1], 0
		jnz	short loc_2346E
		jmp	loc_23536

loc_2346E:
		cmp	[bp+var_A], 0
		jle	short loc_2347F
		cmp	di, 13Fh
		jge	short loc_2347F
		add	di, 3
		jmp	short loc_2348C

loc_2347F:
		cmp	[bp+var_A], 0
		jge	short loc_2348C
		or	di, di
		jle	short loc_2348C
		sub	di, 3

loc_2348C:
		or	bx, bx
		jle	short loc_2349D
		cmp	[bp+var_4], 0C7h
		jge	short loc_2349D
		add	[bp+var_4], 3
		jmp	short loc_234AB

loc_2349D:
		or	bx, bx
		jge	short loc_234AB
		cmp	[bp+var_4], 0
		jle	short loc_234AB
		sub	[bp+var_4], 3

loc_234AB:
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
		jle	short loc_234CD
		mov	ax, cx
		jmp	short loc_234CF

loc_234CD:
		mov	ax, dx

loc_234CF:
		mov	[bp+var_14], ax
		mov	[bp+var_1A], 4
		mov	ax, [bp+var_1A]
		imul	[bp+var_14]
		mov	bx, 20h
		cwd
		idiv	bx
		mov	dx, 5
		sub	dx, ax
		mov	word_775F3, dx
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
		call	TextScrollDisplay_RegisterEntries_6F4F8
		add	sp, 4
		mov	ax, di
		shl	ax, 1
		mov	[bp+var_20], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_22], ax
		push	ax
		push	[bp+var_20]
		push	large 0
		call	TextScrollDisplayB_ApplyHelperB_6FA5F
		add	sp, 8
		jmp	short loc_2353C

loc_23536:
		mov	word_775F3, 5

loc_2353C:
		cmp	byte_775FB, 0
		jz	short loc_2354B
		mov	byte ptr [si+1], 1
		or	byte ptr [si+6], 1

loc_2354B:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
Input_ReadCombinedAxes		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23552		proc far
		push	bp
		mov	bp, sp
		push	6390h
		call	TextScrollDisplayB_ConstructAndReset_6F974
		pop	cx
		xor	eax, eax
		mov	dword_7CACE, eax
		mov	dword_7CACA, eax
		xor	eax, eax
		mov	dword_7CAD6, eax
		mov	dword_7CAD2, eax
		pop	bp
		retf
sub_23552		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23576		proc far

saved_0		= byte ptr  0

		push	bp
		mov	bp, sp
		push	6390h
sub_23576		endp

; START OF FUNCTION CHUNK FOR sub_23576
		db 9Ah
		cli
		add	bh, [bp+si+saved_0]
; END OF FUNCTION CHUNK FOR sub_23576
seg057		ends
