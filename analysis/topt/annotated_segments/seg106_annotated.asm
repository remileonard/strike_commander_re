seg106		segment	para public 'CODE' use16
		assume cs:seg106
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 50h, 9Ah, 9Ch, 3, 0, 0, 59h, 0EBh, 0

loc_34999:
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3499B		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [di], 0
		jz	short loc_349BD
		mov	ax, word_4D36C
		mov	[si+1], ax
		mov	[bp+var_2], di
		mov	ax, [bp+var_2]
		mov	word_4D36C, ax

loc_349BD:
		pop	di
		pop	si
		leave
		retf
sub_3499B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE par position d'appel dans les cinématiques : position d'appel (64 sur
; 64), à SmallObject_UnregisterFromList_2CB7A (sub_2CB7A de OPTEST.EXE). Code non comparé
; instruction par instruction. — Reprise de STRIKE.EXE : code identique instruction par
; instruction à SmallObject_UnregisterFromList_5D9D3 (sub_5D9D3 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, retire/libère (sub_338) un
; objet de la liste globale gérée par SmallObject_RegisterInList_5D999. Référencée par
; sub_1C5D8.
; ==============================================================================================
SmallObject_UnregisterFromList_349C1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1]
SmallObject_UnregisterFromList_349C1		endp

; START OF FUNCTION CHUNK FOR SmallObject_UnregisterFromList_349C1
		db 89h
		inc	si
; END OF FUNCTION CHUNK FOR SmallObject_UnregisterFromList_349C1
seg106		ends
