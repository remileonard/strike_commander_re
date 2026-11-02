seg057		segment	para public 'CODE' use16
		assume cs:seg057
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0FCh, 0EBh, 4

loc_22743:
		db 33h, 0D2h, 33h, 0C0h, 0C9h, 0CBh, 0C9h, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2274B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_2274B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22753		proc far

var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= byte ptr  16h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_2274B
		add	sp, 2
		mov	al, [bp+arg_10]
		mov	[si], al
		sub	sp, 4
		mov	eax, [bp+arg_C]
		mov	[bp+var_6], eax
		sub	sp, 4
		mov	eax, [bp+arg_8]
		mov	[bp+var_A], eax
		sub	sp, 4
		mov	eax, [bp+arg_4]
		mov	[bp+var_E], eax
		mov	ax, si
		inc	ax
		push	ax
		call	Utility_Helper_294D7
		add	sp, 0Eh
		cmp	[bp+arg_10], 0
		jz	short loc_227A6
		mov	ax, si
		inc	ax
		push	ax
		call	sub_28F25
		add	sp, 2

loc_227A6:
		mov	ax, [bp+arg_2]
		mov	[si+0Dh], ax
		pop	si
		pop	bp
		retf
sub_22753		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_227AF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_2274B
		add	sp, 2
		mov	al, [bp+arg_6]
		mov	[si], al
		mov	di, [bp+arg_4]
		mov	eax, [di]
		mov	[si+1], eax
		mov	eax, [di+4]
		mov	[si+5], eax
		mov	eax, [di+8]
		mov	[si+9], eax
		cmp	[bp+arg_6], 0
		jz	short loc_227F0
		mov	ax, si
		inc	ax
		push	ax
		call	sub_28F25
		add	sp, 2

loc_227F0:
		mov	ax, [bp+arg_2]
		mov	[si+0Dh], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_227AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à LightSet_Init_1D72E
; (sub_1D72E de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier
; ici. — Reprise de STRIKE.EXE : code identique instruction par instruction à
; LightSet_Init_2B191 (sub_2B191 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et
; contexte à revérifier ici. — far, LUE 2026-10-14. JEU DE LUMIÈRES — initialisation : +6 = 1,
; poids ambiant 0, intensité 100 %. Appelée par seg112. Ex-'ProgressBar_InitFull'.
; ==============================================================================================
LightSet_Init_227FA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+6], 1
		mov	word ptr [si+7], 0
		push	64h
		push	si
		nop
		push	cs
		call	near ptr LightSet_SetIntensityPercent_22899
		add	sp, 4
		pop	si
		pop	bp
		retf
LightSet_Init_227FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22818		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_2284A

loc_22829:
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		call	sub_39C
		add	sp, 2
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6
		mov	[bp+var_2], 0

loc_2284A:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_22829
		pop	si
		leave
		retf
sub_22818		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2285E		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_22895
		mov	word ptr [si], 3772h
		push	si
		push	cs
		call	near ptr sub_22818
		add	sp, 2
		mov	word ptr [si], 1E4h
		push	si
		call	sub_36702
		add	sp, 2
		test	di, 1
		jz	short loc_22895
		push	si
		call	sub_39C
		add	sp, 2

loc_22895:
		pop	di
		pop	si
		pop	bp
		retf
sub_2285E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; LightSet_SetIntensityPercent_1D7CD (sub_1D7CD de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; LightSet_SetIntensityPercent_2B228 (sub_2B228 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-14. JEU DE LUMIÈRES — intensité
; globale +9 = pourcentage × 256 ÷ 100, ou 256 (1,0) au-delà de 100.
; Ex-'ProgressBar_PercentToFixed'.
; ==============================================================================================
LightSet_SetIntensityPercent_22899		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		cmp	cx, 64h
		jle	short loc_228AF
		mov	word ptr [si+9], 100h
		jmp	short loc_228BD

loc_228AF:
		mov	ax, cx
		shl	ax, 8
		mov	bx, 64h
		cwd
		idiv	bx
		mov	[si+9], ax

loc_228BD:
		pop	si
		pop	bp
		retf
LightSet_SetIntensityPercent_22899		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_228C0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+7], ax
		push	si
		nop
		push	cs
		call	near ptr sub_22B3C
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_228C0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_228D9		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	6
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_22911
		mov	word ptr [di], 4F8h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 376Eh
		mov	ax, [bp+var_4]
		mov	[di+4], ax
		mov	ax, di
		jmp	short loc_22913

loc_22911:
		mov	ax, di

loc_22913:
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		call	LinkedListB_InsertAtTail_36616
		add	sp, 4
		push	si
		call	sub_3676C
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		cmp	eax, 1
		ja	short loc_2294A
		mov	bx, [bp+arg_2]
		mov	al, [bx]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		or	al, al
		jz	short loc_2294E

loc_2294A:
		mov	byte ptr [si+6], 0

loc_2294E:
		push	si
		nop
		push	cs
		call	near ptr sub_22B3C
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_228D9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_2295B		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h
arg_10		= byte ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	eax, [bp+arg_4]
		mov	[bp+var_8], eax
		mov	eax, [bp+arg_8]
		mov	[bp+var_C], eax
		mov	eax, [bp+arg_C]
		mov	[bp+var_10], eax
		mov	al, [bp+arg_10]
		mov	[bp+var_11], al
		push	11h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_229CE
		mov	al, [bp+var_11]
		push	ax
		sub	sp, 4
		mov	eax, [bp+var_10]
		mov	[bp+var_1C], eax
		sub	sp, 4
		mov	eax, [bp+var_C]
		mov	[bp+var_20], eax
		sub	sp, 4
		mov	eax, [bp+var_8]
		mov	[bp+var_24], eax
		push	[bp+var_4]
		push	di
		push	cs
		call	near ptr sub_22753
		add	sp, 12h
		mov	ax, di
		jmp	short loc_229D0

loc_229CE:
		mov	ax, di

loc_229D0:
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_228D9
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_2295B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_229E2		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	di, [bp+arg_4]
		mov	eax, [di]
		mov	[bp+var_14], eax
		mov	eax, [di+4]
		mov	[bp+var_10], eax
		mov	eax, [di+8]
		mov	[bp+var_C], eax
		mov	al, [bp+arg_6]
		mov	[bp+var_5], al
		push	11h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_22A3E
		mov	al, [bp+var_5]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	[bp+var_4]
		push	[bp+var_8]
		push	cs
		call	near ptr sub_227AF
		add	sp, 8
		mov	ax, [bp+var_8]
		jmp	short loc_22A41

loc_22A3E:
		mov	ax, [bp+var_8]

loc_22A41:
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		push	cs
		call	near ptr sub_228D9
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_229E2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22A53		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		xor	di, di
		jmp	short loc_22A67

loc_22A67:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jz	short loc_22A80
		mov	ax, di
		inc	di
		cmp	ax, [bp+arg_2]
		jl	short loc_22A67

loc_22A80:
		cmp	[bp+var_2], 0
		jz	short loc_22AA8
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		mov	[bp+var_4], ax
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6
		push	[bp+var_4]
		call	sub_39C
		add	sp, 2

loc_22AA8:
		pop	di
		pop	si
		leave
		retf
sub_22A53		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22AAC		proc far

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
		mov	[bp+var_2], 0
		jmp	short loc_22AC1

loc_22AC1:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jz	short loc_22ADA
		mov	bx, [bp+var_2]
		cmp	[bx+4], di
		jnz	short loc_22AC1

loc_22ADA:
		cmp	[bp+var_2], 0
		jz	short loc_22AF7
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6
		push	di
		call	sub_39C
		add	sp, 2

loc_22AF7:
		pop	di
		pop	si
		leave
		retf
sub_22AAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22AFB		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		xor	di, di
		jmp	short loc_22B21

loc_22B0F:
		mov	ax, di
		inc	di
		cmp	ax, [bp+arg_2]
		jnz	short loc_22B21
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		pop	di
		pop	si
		leave
		retf

loc_22B21:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_22B0F
		xor	ax, ax
		pop	di
		pop	si
		leave
		retf
sub_22AFB		endp

; START OF FUNCTION CHUNK FOR sub_22AFB
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_22AFB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22B3C		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		mov	ax, [si+7]
		mov	[bp+var_4], ax
		jmp	short loc_22B60

loc_22B54:
		mov	bx, [bp+var_2]
		mov	bx, [bx+4]
		mov	ax, [bx+0Dh]
		add	[bp+var_4], ax

loc_22B60:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_22B54
		cmp	[bp+var_4], 0
		jz	short loc_22BC8
		jmp	short loc_22B9A

loc_22B79:
		mov	bx, [bp+var_2]
		mov	di, [bx+4]
		movsx	eax, word ptr [di+0Dh]
		movsx	edx, word ptr [si+9]
		imul	eax, edx
		movsx	ebx, [bp+var_4]
		cdq
		idiv	ebx
		mov	[di+0Fh], ax

loc_22B9A:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_22B79
		movsx	eax, word ptr [si+7]
		movsx	edx, word ptr [si+9]
		imul	eax, edx
		movsx	ebx, [bp+var_4]
		cdq
		idiv	ebx
		mov	[si+0Bh], ax
		jmp	short loc_22BEB

loc_22BC8:
		jmp	short loc_22BD5

loc_22BCA:
		mov	bx, [bp+var_2]
		mov	bx, [bx+4]
		mov	word ptr [bx+0Fh], 0

loc_22BD5:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_22BCA
		mov	word ptr [si+0Bh], 0

loc_22BEB:
		pop	di
		pop	si
		leave
		retf
sub_22B3C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; LightSet_FaceIntensity_1DB23 (sub_1DB23 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à LightSet_FaceIntensity_2B54A (sub_2B54A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-14, corrigé le même
; jour. INTENSITÉ LUMINEUSE D'UNE FACE (ou d'un sommet) de modèle 3D. Args : (jeu de lumières,
; vecteur A, vecteur B) ; appelée par Mesh_FacePrepareIndirect et les méthodes d'éclairage des
; éléments de face (seg055) avec A = vecteur passé par l'appelant de ces méthodes (origine non
; tracée) et B = normale de la face lue dans les données du modèle. intensité = part ambiante
; (+0Bh) + (si A · B > 0) (A · B) × part de la PREMIÈRE lumière de la liste (+0Fh du 1er
; élément) ; bornée à 255. La direction rangée dans les lumières n'est pas lue ici.
; Ex-'Render_FaceDotProductTest'.
; ==============================================================================================
LightSet_FaceIntensity_22BEF		proc far

var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [si+0Bh]
		mov	[bp+var_2], ax
		mov	bx, [bp+arg_4]
		mov	ax, [di]
		imul	word ptr [bx]
		mov	[bp+var_8], ax
		mov	cx, dx
		mov	ax, [di+4]
		imul	word ptr [bx+4]
		add	[bp+var_8], ax
		adc	cx, dx
		mov	ax, [di+8]
		imul	word ptr [bx+8]
		add	ax, [bp+var_8]
		adc	dx, cx
		shl	edx, 10h
		mov	dx, ax
		sar	edx, 8
		mov	[bp+var_6], edx
		cmp	[bp+var_6], 0
		jle	short loc_22C6B
		mov	bx, [si+2]
		mov	ax, [bx+4]
		mov	[bp+var_A], ax
		mov	bx, [bp+var_A]
		mov	ax, [bx+0Fh]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		mov	edx, [bp+var_6]
		imul	edx, eax
		mov	[bp+var_10], edx
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	ax, word ptr [bp+var_14+1]
		add	[bp+var_2], ax

loc_22C6B:
		cmp	[bp+var_2], 0FFh
		jle	short loc_22C77
		mov	[bp+var_2], 0FFh

loc_22C77:
		mov	al, byte ptr [bp+var_2]
		pop	di
		pop	si
		leave
		retf
LightSet_FaceIntensity_22BEF		endp

; START OF FUNCTION CHUNK FOR LightSet_FaceIntensity_22BEF
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR LightSet_FaceIntensity_22BEF

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_22C82		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_22CA4
		test	di, 1
		jz	short loc_22CA2
		push	si
		call	sub_39C
		add	sp, 2
sub_22C82		endp
seg057		ends
