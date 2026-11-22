seg066		segment	para public 'CODE' use16
		assume cs:seg066
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FCh, 5Eh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F5F4		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_2F62C
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 25E0h
		test	ax, 1
		jz	short loc_2F62C
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8

loc_2F62C:
		leave
		retf
sub_2F5F4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Descriptor_Reset (sub_23E95 de PACIFIC.EXE). Résumé
; repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE :
; même suite d'instructions, 2 opérande(s) différent(s) (adresses de données ou constantes) —
; à vérifier à Descriptor_Reset (sub_2914F de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,16L — remet à zéro 3 champs
; (pointeur/référence/flag) d'une petite structure : reset d'un descripteur générique
; (probable référence faible/cache invalidé).
; ==============================================================================================
Descriptor_Reset		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+6], 0
		mov	dword ptr es:[bx+2], 0
		mov	byte ptr es:[bx+8], 0
		pop	bp
		retf
Descriptor_Reset		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2F64A		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+2], eax
		mov	ax, [bp+arg_8]
		mov	es:[bx+6], ax
sub_2F64A		endp
seg066		ends
