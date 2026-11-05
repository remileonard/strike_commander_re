seg126		segment	para public 'CODE' use16
		assume cs:seg126
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 74h, 7, 56h, 9Ah, 3Bh, 3, 0, 0, 59h

loc_48C49:
		db 5Fh, 5Eh, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_ApplyStyleAndAllocate_D0E40 (sub_D0E40 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_ApplyStyleAndAllocate_3144B (sub_3144B de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Widget_ApplyStyleAndAllocate_607E1 (sub_607E1 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue
; (sub_658) et applique un style (TextFormat_ApplyStyleAttribute_5E2D0, seg143).
; ==============================================================================================
Widget_ApplyStyleAndAllocate_48C4D		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_48C69
		push	19h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_48CA6

loc_48C69:
		mov	word ptr [si], 40E2h
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+0Fh], 0
		mov	ax, si
		add	ax, 10h
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	[si+14h], ax
		mov	byte ptr [si+16h], 4
		xor	ax, ax
		mov	[si+12h], ax
		mov	[si+10h], ax

loc_48CA6:
		mov	ax, si
		pop	si
		leave
		retf
Widget_ApplyStyleAndAllocate_48C4D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_Method_Dispatch8_D0E9E (sub_D0E9E de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Widget_Method_Dispatch8_314A9 (sub_314A9 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Widget_Method_Dispatch8_6083F (sub_6083F de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; dispatch vtable [bx+8].
; ==============================================================================================
Widget_Method_Dispatch8_48CAB		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	[si+17h], al
		pop	si
		pop	bp
		retf
Widget_Method_Dispatch8_48CAB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_Method_DispatchC_D0EC0 (sub_D0EC0 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Widget_Method_DispatchC_314CB (sub_314CB de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Widget_Method_DispatchC_60861 (sub_60861 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; dispatch vtable [bx+0Ch].
; ==============================================================================================
Widget_Method_DispatchC_48CCD		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	al, [bp+arg_2]
		mov	[si+18h], al
		pop	si
		pop	bp
		retf
Widget_Method_DispatchC_48CCD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_ComputeAndStoreBounds_D0EE2 (sub_D0EE2 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à Widget_ComputeAndStoreBounds_60883 (sub_60883 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; Widget_ComputeBoundsExtent_60AEB.
; ==============================================================================================
Widget_ComputeAndStoreBounds_48CEF		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+6], ax
		mov	ax, [bp+var_4]
		mov	[si+8], ax
		mov	ax, [bp+var_6]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_8]
		mov	[si+0Ch], ax
		push	large 0
		push	si
		nop
		push	cs
		call	near ptr Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		pop	si
		leave
		retf
Widget_ComputeAndStoreBounds_48CEF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48D38		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dl, [bp+arg_2]
		cmp	dl, 0FFh
		jnz	short loc_48D4A
		mov	dl, [si+18h]

loc_48D4A:
		push	dx
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_48D38		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48D5C		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dl, [bp+arg_2]
		mov	si, [bp+arg_0]
		cmp	word ptr [si+14h], 0
		jz	short loc_48D71
		mov	ax, 1
		jmp	short loc_48D73

loc_48D71:
		xor	ax, ax

loc_48D73:
		or	al, al
		jz	short loc_48D9A
		cmp	dl, 0FFh
		jnz	short loc_48D7F
		mov	dl, [si+18h]

loc_48D7F:
		push	dx
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	large 0
		push	si
		nop
		push	cs
		call	near ptr Widget_ComputeBoundsExtent_48F57
		add	sp, 6

loc_48D9A:
		pop	si
		pop	bp
		retf	4
sub_48D5C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_RenderWithAttributes_D0F92 (sub_D0F92 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Widget_RenderWithAttributes_3159D (sub_3159D de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Widget_RenderWithAttributes_60933 (sub_60933 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 99 lignes, NON DÉTAILLÉE — combine dispatch vtable multiple
; ([bx+4]/[bx+0x20]/[bx+0xC]/[bx+8]/[bx]) et UI_Helper_5E5F4 (seg143). Référencée par
; sub_5E5F4.
; ==============================================================================================
Widget_RenderWithAttributes_48D9F		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+14h], 0
		jz	short loc_48DB5
		mov	ax, 1
		jmp	short loc_48DB7

loc_48DB5:
		xor	ax, ax

loc_48DB7:
		or	al, al
		jz	short loc_48E24
		cmp	[bp+arg_2], 0FFh
		jnz	short loc_48DC7
		mov	al, [si+18h]
		mov	[bp+arg_2], al

loc_48DC7:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	dx, [si+12h]
		sub	dx, ax
		mov	di, dx
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		pop	cx
		mov	dx, di
		add	dx, ax
		dec	dx
		mov	bx, [si+14h]
		add	dx, [bx+12h]
		mov	[bp+var_2], dx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx
		cmp	ax, di
		jl	short loc_48E24
		mov	al, [bp+arg_2]
		push	ax
		push	[bp+var_2]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	dx, [si+10h]
		sub	dx, ax
		push	dx
		mov	ax, si
		add	ax, 2
		push	ax
		call	sub_47B9B
		add	sp, 0Ch

loc_48E24:
		pop	di
		pop	si
		leave
		retf	4
Widget_RenderWithAttributes_48D9F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48E2A		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+14h], 0
		jz	short loc_48E3D
		mov	ax, 1
		jmp	short loc_48E3F

loc_48E3D:
		xor	ax, ax

loc_48E3F:
		or	al, al
		jz	short loc_48EA6
		cmp	[bp+arg_2], 0FFh
		jnz	short loc_48E4F
		mov	al, [si+18h]
		mov	[bp+arg_2], al

loc_48E4F:
		mov	al, [bp+arg_2]
		push	ax
		push	si
		push	cs
		call	near ptr Widget_RenderWithAttributes_48D9F
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	dx, [si+12h]
		sub	dx, ax
		mov	di, dx
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		pop	cx
		mov	bx, [si+14h]
		add	ax, [bx+12h]
		add	ax, di
		mov	di, ax
		mov	al, [bp+arg_2]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+0Ch]
		pop	cx
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		call	sub_47B9B
		add	sp, 0Ch

loc_48EA6:
		pop	di
		pop	si
		pop	bp
		retf	4
sub_48E2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48EAC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+6], ax
		mov	ax, [bp+arg_4]
		mov	[si+0Ah], ax
		push	large 0
		push	si
		nop
		push	cs
		call	near ptr Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_48EAC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48ECE		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+8], ax
		mov	ax, [bp+arg_4]
		mov	[si+0Ch], ax
		push	large 0
		push	si
		nop
		push	cs
		call	near ptr Widget_ComputeBoundsExtent_48F57
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_48ECE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48EF0		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 1Fh
		jbe	short loc_48F54
		push	word ptr [si+12h]
		push	word ptr [si+10h]
		mov	al, [bp+arg_2]
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		add	sp, 0Ah
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	dx, [si+10h]
		sub	dx, ax
		push	dx
		mov	al, [bp+arg_2]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		pop	dx
		add	dx, ax
		mov	bx, [si+14h]
		add	dx, [bx+10h]
		mov	[bp+var_2], dx
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_2]
		mov	[si+10h], ax

loc_48F54:
		pop	si
		leave
		retf
sub_48EF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_ComputeBoundsExtent_D114A (sub_D114A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à Widget_ComputeBoundsExtent_31755 (sub_31755 de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Widget_ComputeBoundsExtent_60AEB (sub_60AEB de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; calcule les bornes d'un widget (dispatch vtable [bx]/[bx+4] pour la position de base,
; additionne des décalages, stocke dans les champs +0x10/+0x12). Référencée massivement depuis
; seg016 et par de nombreuses fonctions de ce segment.
; ==============================================================================================
Widget_ComputeBoundsExtent_48F57		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_2]
		mov	[si+10h], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		add	ax, [bp+var_4]
		mov	[si+12h], ax
		pop	si
		leave
		retf
Widget_ComputeBoundsExtent_48F57		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_48F89		proc far

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+20h]
		pop	cx
		dec	ax
		mov	bx, [si+14h]
		add	ax, [bx+12h]
		add	ax, [bx+10h]
		mov	[bp+var_2], ax

loc_48FB0:
		push	di
		push	si
		nop
		push	cs
		call	near ptr GlyphObject_LayoutAndRenderAll_492D2
		jmp	short loc_48FFF

loc_48FB9:
		cmp	dx, 0Dh
		jz	short loc_48FC3
		cmp	dx, 0Ah
		jnz	short loc_48FF9

loc_48FC3:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	dx, [si+12h]
		sub	dx, ax
		add	dx, [bp+var_2]
		mov	[bp+var_4], dx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		add	ax, [bp+var_4]
		mov	[si+12h], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_6], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_6]
		mov	[si+10h], ax
		jmp	short loc_48FB0

loc_48FF9:
		push	dx
		push	si
		push	cs
		call	near ptr sub_48EF0

loc_48FFF:
		add	sp, 4
		mov	bx, di
		inc	di
		mov	al, [bx]
		mov	ah, 0
		mov	dx, ax
		or	ax, ax
		jnz	short loc_48FB9
		pop	di
		pop	si
		leave
		retf
sub_48F89		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_RenderComplexLayout_D11F9 (sub_D11F9 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite d'instructions,
; 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; Widget_RenderComplexLayout_31810 (sub_31810 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Widget_RenderComplexLayout_60BA6 (sub_60BA6 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 331 lignes, NON DÉTAILLÉE
; — la plus grosse fonction du segment, combine de nombreux utilitaires bas niveau
; (sub_22E1/2235/225D/2277/2B99/29E4) avec Widget_UpdateLayoutAndBounds_60B1D (×2) et dispatch
; vtable. Candidat pour session dédiée.
; ==============================================================================================
Widget_RenderComplexLayout_49013		proc far

var_198		= word ptr -198h
var_D0		= word ptr -0D0h
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 198h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]

loc_49022:
		push	large 0C80000h
		lea	ax, [bp+var_D0]
		push	ax
		call	CRT_Memset_Public
		add	sp, 6
		push	large 0C80000h
		lea	ax, [bp+var_198]
		push	ax
		call	CRT_Memset_Public
		add	sp, 6
		jmp	loc_491E6

loc_4904B:
		mov	ax, dx
		cmp	ax, 25h
		jz	short loc_49055
		jmp	loc_491CB

loc_49055:
		mov	al, [di]
		cbw
		mov	[bp+var_2], ax
		inc	di
		mov	[bp+var_8], ax
		mov	cx, 0Eh
		mov	bx, offset word_49206

loc_49065:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_8]
		jz	short loc_49075
		add	bx, 2
		loop	short loc_49065
		jmp	loc_491CB

loc_49075:
		jmp	word ptr cs:[bx+1Ch] ; switch jump

loc_49079:
		push	0Ah
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		push	word ptr [bx-2]
		call	CRT_Itoa_Signed10
		add	sp, 6
		jmp	loc_491D8

loc_49095:
		push	0Ah
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		movzx	eax, word ptr [bx-2]
		push	eax
		call	CRT_Itoa_Unsigned
		add	sp, 8
		jmp	loc_491D8

loc_490B5:
		push	0Ah
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 4
		mov	bx, [bp+arg_4]
		push	large [bx-4]
		call	CRT_Itoa_BaseVariant
		add	sp, 8
		jmp	loc_491D8

loc_490D2:
		push	0Ah
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 4
		mov	bx, [bp+arg_4]
		push	large [bx-4]
		call	CRT_Itoa_Unsigned
		add	sp, 8
		jmp	loc_491D8

loc_490EF:
		push	10h
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		movzx	eax, word ptr [bx-2]
		push	eax
		call	CRT_Itoa_Unsigned
		add	sp, 8
		push	ax
		call	CRT_Strupr_2F35
		pop	cx
		jmp	loc_491D8

loc_49116:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	byte ptr [bp+var_198], al
		jmp	loc_491CF

loc_49127:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		push	word ptr [bx-2]
		jmp	loc_491D9

loc_49134:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	ax, [bx-2]
		mov	[bp+var_4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_4]
		mov	[si+10h], ax
		jmp	loc_491E6

loc_49150:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	ax, [bx-2]
		mov	[bp+var_6], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		add	ax, [bp+var_6]
		mov	[si+12h], ax
		jmp	short loc_491E6

loc_4916C:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+18h], al
		jmp	short loc_491E6

loc_4917B:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+17h], al
		jmp	short loc_491E6

loc_4918A:
		push	si
		nop
		push	cs
		call	near ptr sub_49263
		pop	cx
		jmp	short loc_491E6

loc_49193:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+16h], al
		jmp	short loc_491E6

loc_491A2:
		lea	ax, [bp+var_D0]
		push	ax
		push	si
		push	cs
		call	near ptr sub_48F89
		add	sp, 4
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	loc_49022

loc_491CB:
		mov	byte ptr [bp+var_198], dl

loc_491CF:
		mov	byte ptr [bp+var_198+1], 0
		lea	ax, [bp+var_198]

loc_491D8:
		push	ax

loc_491D9:
		lea	ax, [bp+var_D0]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_491E6:
		mov	bx, di
		inc	di
		mov	al, [bx]
		cbw
		mov	dx, ax
		or	ax, ax
		jz	short loc_491F5
		jmp	loc_4904B

loc_491F5:
		lea	ax, [bp+var_D0]
		push	ax
		push	si
		push	cs
		call	near ptr sub_48F89
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Widget_RenderComplexLayout_49013		endp

; START OF FUNCTION CHUNK FOR Widget_RenderComplexLayout_49013
word_49206	dw 42h
		dw 44h
		dw 46h
		dw 4Ah
		dw 50h
		dw 53h
		dw 55h
		dw 58h
		dw 59h
		dw 5Ah
		dw 63h
		dw 64h
		dw 75h
		dw 78h
off_49222	dw offset loc_4916C
		dw offset loc_490B5
		dw offset loc_4917B
		dw offset loc_49193
		dw offset loc_4918A
		dw offset loc_49127
		dw offset loc_490D2
		dw offset loc_49134
		dw offset loc_49150
		dw offset loc_491A2
		dw offset loc_49116
		dw offset loc_49079
		dw offset loc_49095
		dw offset loc_490EF
; END OF FUNCTION CHUNK FOR Widget_RenderComplexLayout_49013

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; Widget_RenderComplexLayoutWrapper_D1424 (sub_D1424 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à Widget_RenderComplexLayoutWrapper_31A3B (sub_31A3B
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_RenderComplexLayoutWrapper_60DD1 (sub_60DD1 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enveloppe appelant
; Widget_RenderComplexLayout_60BA6.
; ==============================================================================================
Widget_RenderComplexLayoutWrapper_4923E		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+14h], 0
		jz	short loc_49260
		lea	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Widget_RenderComplexLayout_49013
		add	sp, 6

loc_49260:
		pop	si
		leave
		retf
Widget_RenderComplexLayoutWrapper_4923E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_49263		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_49263		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4926B		proc far

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
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		jmp	short loc_492A2

loc_49285:
		mov	al, [di]
		push	ax
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_2], dx
		inc	di
		inc	[bp+var_4]

loc_492A2:
		cmp	byte ptr [di], 0Ah
		jz	short loc_492B1
		cmp	byte ptr [di], 0Dh
		jz	short loc_492B1
		cmp	byte ptr [di], 0
		jnz	short loc_49285

loc_492B1:
		cmp	[bp+var_4], 0
		jz	short loc_492CB
		mov	dx, [bp+var_4]
		dec	dx
		mov	bx, [si+14h]
		mov	ax, [bx+10h]
		imul	dx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_2], dx

loc_492CB:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_4926B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GlyphObject_LayoutAndRenderAll_60E60 (sub_60E60 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — ⚠️ far, 131 lignes, NON DÉTAILLÉE — orchestre
; GlyphObject_RenderToWidget_60DFE (×2) et dispatch vtable multiple. Référencée par
; Widget_UpdateLayoutAndBounds_60B1D.
; ==============================================================================================
GlyphObject_LayoutAndRenderAll_492D2		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, [si+16h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		ja	short loc_49367
		shl	bx, 1
		jmp	cs:off_4936B[bx]	; switch jump

loc_492F3:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_2]
		jmp	short loc_49364

loc_49307:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr sub_4926B
		add	sp, 4
		pop	dx
		sub	dx, ax
		mov	[bp+var_4], dx
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_4]
		jmp	short loc_49364

loc_49329:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr sub_4926B
		add	sp, 4
		pop	dx
		sub	dx, ax
		mov	ax, dx
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[bp+var_6], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_6]
		jmp	short loc_49364

loc_49352:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_8], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_8]

loc_49364:
		mov	[si+10h], ax

loc_49367:
		pop	di
		pop	si
		leave
		retf
GlyphObject_LayoutAndRenderAll_492D2		endp

; START OF FUNCTION CHUNK FOR GlyphObject_LayoutAndRenderAll_492D2
off_4936B	dw offset loc_492F3
		dw offset loc_49307
		dw offset loc_49329
		dw offset loc_49352
; END OF FUNCTION CHUNK FOR GlyphObject_LayoutAndRenderAll_492D2

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_49373		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+6]
		pop	si
		pop	bp
		retf
sub_49373		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_49380		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+8]
		pop	si
		pop	bp
		retf
sub_49380		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4938D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ah]
		pop	si
		pop	bp
		retf
sub_4938D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4939A		proc far
		push	bp
		mov	bp, sp
		push	si
sub_4939A		endp

; START OF FUNCTION CHUNK FOR sub_4939A
		db 8Bh, 76h
; END OF FUNCTION CHUNK FOR sub_4939A
seg126		ends
