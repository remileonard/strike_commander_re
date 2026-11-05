seg061		segment	para public 'CODE' use16
		assume cs:seg061
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23E51		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_23E51		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23E56		proc far
		push	bp
		mov	bp, sp
		pop	bp
		retf
sub_23E56		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_23E5B		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_23E93
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1100h
		test	ax, 1
		jz	short loc_23E93
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_23E93:
		leave
		retf
sub_23E5B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Descriptor_Reset (sub_2914F de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,16L — remet à zéro 3
; champs (pointeur/référence/flag) d'une petite structure : reset d'un descripteur générique
; (probable référence faible/cache invalidé).
; ==============================================================================================
Descriptor_Reset		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		mov	dword ptr es:[bx+4], 0
		mov	byte ptr es:[bx+8], 0
		pop	bp
		retf
Descriptor_Reset		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Descriptor_Construct (sub_2916B de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,20L — initialise un
; descripteur avec une référence (+2) et une valeur (+6), flag à 0 : constructeur d'un
; descripteur générique (référence + valeur).
; ==============================================================================================
Descriptor_Construct_23EB1		proc far

arg_0		= word ptr  6
arg_4		= dword ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	eax, [bp+arg_4]
		mov	es:[bx+4], eax
		mov	ax, [bp+arg_8]
		mov	es:[bx+2], ax
		mov	byte ptr es:[bx+8], 0
		pop	bp
		retf
Descriptor_Construct_23EB1		endp

; ----------------------------------------------------------------------

sub_23ECE		proc far
		push	bp
sub_23ECE		endp

; START OF FUNCTION CHUNK FOR sub_23ECE
		db 8Bh
; END OF FUNCTION CHUNK FOR sub_23ECE
seg061		ends
