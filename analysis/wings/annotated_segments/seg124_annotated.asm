seg124		segment	para public 'CODE' use16
		assume cs:seg124
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 10h, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Runtime_FatalErrorHandler_68BA2 (sub_68BA2 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Runtime_FatalErrorHandler_2FF75 (sub_2FF75 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Runtime_FatalErrorHandler_5F700 (sub_5F700 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⭐ far, référencée
; via vtable (DATA XREF seg216) et par des dizaines de fonctions dans toute la base, notamment
; Render_TerrainPipelineMain (sub_345D6, seg074) — gestionnaire d'erreur fatale/assertion :
; garde de réentrance (byte_70EEE), formate un message (sub_2962), résout le nom de la classe
; fautive via Memory_AllocatorTable_PopulateSlots_5CB99 (tag 5C44h, le gestionnaire de mémoire
; typée), imprime le diagnostic à l'écran (Video_PrintString_5EFD3, plusieurs fois, avec un
; tag fixe 3DFAh), puis appelle sub_3C2(1) — probable terminaison/abandon du programme.
; CONFIRMÉ par le seg339 : le dialogue d'erreur fatale affiché est exactement « Strike
; Commander has encountered an Error that it cannot recover from... » avec un code « Error
; Code: %X-%X » et une invite à contacter le support Origin — texte utilisateur final retrouvé
; tel quel.
; ==============================================================================================
Runtime_FatalErrorHandler_487A4		proc far

var_202		= word ptr -202h
var_102		= word ptr -102h
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 202h
		push	si
		mov	dx, [bp+arg_0]
		cmp	byte_5DDB0, 0
		jnz	short loc_4882E
		mov	byte_5DDB0, 1
		lea	ax, [bp+var_102]
		cmp	ax, dx
		jz	short loc_487D8
		lea	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	ax
		push	dx
		lea	ax, [bp+var_102]
		push	ax
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_487D8:
		push	67B0h
		call	sub_59990
		pop	cx
		mov	si, ax
		or	si, si
		jz	short loc_487FE
		push	67B0h
		call	sub_59990
		pop	cx
		push	ax
		lea	ax, [bp+var_202]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_487FE:
		call	sub_47E06
		or	si, si
		jz	short loc_48812
		lea	ax, [bp+var_202]
		push	ax
		call	sub_59BB0
		pop	cx

loc_48812:
		lea	ax, [bp+var_102]
		push	ax
		call	sub_59BB0
		pop	cx
		push	404Ch
		call	sub_59BB0
		pop	cx
		push	1
		call	CRT_Exit
		pop	cx

loc_4882E:
		pop	si
		leave
		retf
Runtime_FatalErrorHandler_487A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48831		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	4065h
		push	cs
		call	near ptr Runtime_FatalErrorHandler_487A4
		add	sp, 4
		pop	bp
		retf
sub_48831		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48843		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	4073h
		push	cs
sub_48843		endp
seg124		ends
