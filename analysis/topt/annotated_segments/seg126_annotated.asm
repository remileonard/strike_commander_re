seg126		segment	para public 'CODE' use16
		assume cs:seg126
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_ApplyStyleAndAllocate_3144B (sub_3144B de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à Widget_ApplyStyleAndAllocate_607E1 (sub_607E1 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, alloue
; (sub_658) et applique un style (TextFormat_ApplyStyleAttribute_5E2D0, seg143).
; ==============================================================================================
Widget_ApplyStyleAndAllocate_36FD2		proc far

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
		jnz	short loc_36FEE
		push	19h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_3702B

loc_36FEE:
		mov	word ptr [si], 4A74h
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+0Fh], 0
		mov	ax, si
		add	ax, 10h
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	[si+14h], ax
		mov	byte ptr [si+16h], 4
		xor	ax, ax
		mov	[si+12h], ax
		mov	[si+10h], ax

loc_3702B:
		mov	ax, si
		pop	si
		leave
		retf
Widget_ApplyStyleAndAllocate_36FD2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Widget_Method_Dispatch8_314A9 (sub_314A9 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Widget_Method_Dispatch8_6083F (sub_6083F de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+8].
; ==============================================================================================
Widget_Method_Dispatch8_37030		proc far

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
Widget_Method_Dispatch8_37030		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Widget_Method_DispatchC_314CB (sub_314CB de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Widget_Method_DispatchC_60861 (sub_60861 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0Ch].
; ==============================================================================================
Widget_Method_DispatchC_37052		proc far

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
Widget_Method_DispatchC_37052		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_ComputeAndStoreBounds_60883 (sub_60883 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle Widget_ComputeBoundsExtent_60AEB.
; ==============================================================================================
Widget_ComputeAndStoreBounds_37074		proc far

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
		call	near ptr Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		pop	si
		leave
		retf
Widget_ComputeAndStoreBounds_37074		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_370BD		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dl, [bp+arg_2]
		cmp	dl, 0FFh
		jnz	short loc_370CF
		mov	dl, [si+18h]

loc_370CF:
		push	dx
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_370BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_370E1		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dl, [bp+arg_2]
		mov	si, [bp+arg_0]
		cmp	word ptr [si+14h], 0
		jz	short loc_370F6
		mov	ax, 1
		jmp	short loc_370F8

loc_370F6:
		xor	ax, ax

loc_370F8:
		or	al, al
		jz	short loc_3711F
		cmp	dl, 0FFh
		jnz	short loc_37104
		mov	dl, [si+18h]

loc_37104:
		push	dx
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	large 0
		push	si
		nop
		push	cs
		call	near ptr Widget_ComputeBoundsExtent_372DC
		add	sp, 6

loc_3711F:
		pop	si
		pop	bp
		retf	4
sub_370E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Widget_RenderWithAttributes_3159D (sub_3159D de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Widget_RenderWithAttributes_60933 (sub_60933 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 99 lignes, NON DÉTAILLÉE —
; combine dispatch vtable multiple ([bx+4]/[bx+0x20]/[bx+0xC]/[bx+8]/[bx]) et UI_Helper_5E5F4
; (seg143). Référencée par sub_5E5F4.
; ==============================================================================================
Widget_RenderWithAttributes_37124		proc far

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
		jz	short loc_3713A
		mov	ax, 1
		jmp	short loc_3713C

loc_3713A:
		xor	ax, ax

loc_3713C:
		or	al, al
		jz	short loc_371A9
		cmp	[bp+arg_2], 0FFh
		jnz	short loc_3714C
		mov	al, [si+18h]
		mov	[bp+arg_2], al

loc_3714C:
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
		jl	short loc_371A9
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
		call	sub_35AF5
		add	sp, 0Ch

loc_371A9:
		pop	di
		pop	si
		leave
		retf	4
Widget_RenderWithAttributes_37124		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_371AF		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+14h], 0
		jz	short loc_371C2
		mov	ax, 1
		jmp	short loc_371C4

loc_371C2:
		xor	ax, ax

loc_371C4:
		or	al, al
		jz	short loc_3722B
		cmp	[bp+arg_2], 0FFh
		jnz	short loc_371D4
		mov	al, [si+18h]
		mov	[bp+arg_2], al

loc_371D4:
		mov	al, [bp+arg_2]
		push	ax
		push	si
		push	cs
		call	near ptr Widget_RenderWithAttributes_37124
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
		call	sub_35AF5
		add	sp, 0Ch

loc_3722B:
		pop	di
		pop	si
		pop	bp
		retf	4
sub_371AF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37231		proc far

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
		call	near ptr Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_37231		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37253		proc far

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
		call	near ptr Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_37253		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Widget_Method_DispatchChain_316EE (sub_316EE de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Widget_Method_DispatchChain_60A84 (sub_60A84 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable en chaîne
; ([bx+4]/[bx]/[bx+0x18]/[bx]). Référencée par sub_60B1D.
; ==============================================================================================
Widget_Method_DispatchChain_37275		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 1Fh
		jle	short loc_372D9
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

loc_372D9:
		pop	si
		leave
		retf
Widget_Method_DispatchChain_37275		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Widget_ComputeBoundsExtent_31755 (sub_31755 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Widget_ComputeBoundsExtent_60AEB (sub_60AEB de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, calcule les bornes d'un
; widget (dispatch vtable [bx]/[bx+4] pour la position de base, additionne des décalages,
; stocke dans les champs +0x10/+0x12). Référencée massivement depuis seg016 et par de
; nombreuses fonctions de ce segment.
; ==============================================================================================
Widget_ComputeBoundsExtent_372DC		proc far

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
Widget_ComputeBoundsExtent_372DC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Widget_UpdateLayoutAndBounds_31787 (sub_31787 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Widget_UpdateLayoutAndBounds_60B1D (sub_60B1D de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 103 lignes, NON
; DÉTAILLÉE — combine dispatch vtable, GlyphObject-related sub_60E60 et
; Widget_Method_DispatchChain_60A84. Référencée par sub_60BA6 (×2).
; ==============================================================================================
Widget_UpdateLayoutAndBounds_3730E		proc far

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

loc_37335:
		push	di
		push	si
		nop
		push	cs
		call	near ptr GlyphObject_LayoutAndRenderAll_37656
		jmp	short loc_37384

loc_3733E:
		cmp	dx, 0Dh
		jz	short loc_37348
		cmp	dx, 0Ah
		jnz	short loc_3737E

loc_37348:
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
		jmp	short loc_37335

loc_3737E:
		push	dx
		push	si
		push	cs
		call	near ptr Widget_Method_DispatchChain_37275

loc_37384:
		add	sp, 4
		mov	bx, di
		inc	di
		mov	al, [bx]
		cbw
		mov	dx, ax
		or	ax, ax
		jnz	short loc_3733E
		pop	di
		pop	si
		leave
		retf
Widget_UpdateLayoutAndBounds_3730E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_RenderComplexLayout_31810 (sub_31810 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; Widget_RenderComplexLayout_60BA6 (sub_60BA6 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 331 lignes, NON DÉTAILLÉE — la plus grosse
; fonction du segment, combine de nombreux utilitaires bas niveau
; (sub_22E1/2235/225D/2277/2B99/29E4) avec Widget_UpdateLayoutAndBounds_60B1D (×2) et dispatch
; vtable. Candidat pour session dédiée.
; ==============================================================================================
Widget_RenderComplexLayout_37397		proc far

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

loc_373A6:
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
		jmp	loc_3756A

loc_373CF:
		mov	ax, dx
		cmp	ax, 25h
		jz	short loc_373D9
		jmp	loc_3754F

loc_373D9:
		mov	al, [di]
		cbw
		mov	[bp+var_2], ax
		inc	di
		mov	[bp+var_8], ax
		mov	cx, 0Eh
		mov	bx, offset word_3758A

loc_373E9:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_8]
		jz	short loc_373F9
		add	bx, 2
		loop	short loc_373E9
		jmp	loc_3754F

loc_373F9:
		jmp	word ptr cs:[bx+1Ch] ; switch jump

loc_373FD:
		push	0Ah
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		push	word ptr [bx-2]
		call	CRT_Itoa_Signed10
		add	sp, 6
		jmp	loc_3755C

loc_37419:
		push	0Ah
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		movzx	eax, word ptr [bx-2]
		push	eax
		call	CRT_Itoa_Unsigned
		add	sp, 8
		jmp	loc_3755C

loc_37439:
		push	0Ah
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 4
		mov	bx, [bp+arg_4]
		push	large [bx-4]
		call	CRT_Itoa_BaseVariant
		add	sp, 8
		jmp	loc_3755C

loc_37456:
		push	0Ah
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 4
		mov	bx, [bp+arg_4]
		push	large [bx-4]
		call	CRT_Itoa_Unsigned
		add	sp, 8
		jmp	loc_3755C

loc_37473:
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
		call	CRT_Strupr_2E71
		pop	cx
		jmp	loc_3755C

loc_3749A:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	byte ptr [bp+var_198], al
		jmp	loc_37553

loc_374AB:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		push	word ptr [bx-2]
		jmp	loc_3755D

loc_374B8:
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
		jmp	loc_3756A

loc_374D4:
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
		jmp	short loc_3756A

loc_374F0:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+18h], al
		jmp	short loc_3756A

loc_374FF:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+17h], al
		jmp	short loc_3756A

loc_3750E:
		push	si
		nop
		push	cs
		call	near ptr sub_375E7
		pop	cx
		jmp	short loc_3756A

loc_37517:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+16h], al
		jmp	short loc_3756A

loc_37526:
		lea	ax, [bp+var_D0]
		push	ax
		push	si
		push	cs
		call	near ptr Widget_UpdateLayoutAndBounds_3730E
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
		jmp	loc_373A6

loc_3754F:
		mov	byte ptr [bp+var_198], dl

loc_37553:
		mov	byte ptr [bp+var_198+1], 0
		lea	ax, [bp+var_198]

loc_3755C:
		push	ax

loc_3755D:
		lea	ax, [bp+var_D0]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_3756A:
		mov	bx, di
		inc	di
		mov	al, [bx]
		cbw
		mov	dx, ax
		or	ax, ax
		jz	short loc_37579
		jmp	loc_373CF

loc_37579:
		lea	ax, [bp+var_D0]
		push	ax
		push	si
		push	cs
		call	near ptr Widget_UpdateLayoutAndBounds_3730E
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Widget_RenderComplexLayout_37397		endp

; START OF FUNCTION CHUNK FOR Widget_RenderComplexLayout_37397
word_3758A	dw 42h
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
off_375A6	dw offset loc_374F0
		dw offset loc_37439
		dw offset loc_374FF
		dw offset loc_37517
		dw offset loc_3750E
		dw offset loc_374AB
		dw offset loc_37456
		dw offset loc_374B8
		dw offset loc_374D4
		dw offset loc_37526
		dw offset loc_3749A
		dw offset loc_373FD
		dw offset loc_37419
		dw offset loc_37473
; END OF FUNCTION CHUNK FOR Widget_RenderComplexLayout_37397

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Widget_RenderComplexLayoutWrapper_31A3B (sub_31A3B de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à Widget_RenderComplexLayoutWrapper_60DD1 (sub_60DD1
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe appelant Widget_RenderComplexLayout_60BA6.
; ==============================================================================================
Widget_RenderComplexLayoutWrapper_375C2		proc far

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
		jz	short loc_375E4
		lea	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Widget_RenderComplexLayout_37397
		add	sp, 6

loc_375E4:
		pop	si
		leave
		retf
Widget_RenderComplexLayoutWrapper_375C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_375E7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_375E7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_375EF		proc far

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
		jmp	short loc_37626

loc_37609:
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

loc_37626:
		cmp	byte ptr [di], 0Ah
		jz	short loc_37635
		cmp	byte ptr [di], 0Dh
		jz	short loc_37635
		cmp	byte ptr [di], 0
		jnz	short loc_37609

loc_37635:
		cmp	[bp+var_4], 0
		jz	short loc_3764F
		mov	dx, [bp+var_4]
		dec	dx
		mov	bx, [si+14h]
		mov	ax, [bx+10h]
		imul	dx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_2], dx

loc_3764F:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_375EF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; GlyphObject_LayoutAndRenderAll_31ACA (sub_31ACA de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à GlyphObject_LayoutAndRenderAll_60E60 (sub_60E60 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 131 lignes, NON DÉTAILLÉE — orchestre GlyphObject_RenderToWidget_60DFE (×2) et dispatch
; vtable multiple. Référencée par Widget_UpdateLayoutAndBounds_60B1D.
; ==============================================================================================
GlyphObject_LayoutAndRenderAll_37656		proc far

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
		ja	short loc_376EB
		shl	bx, 1
		jmp	cs:off_376EF[bx]	; switch jump

loc_37677:
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
		jmp	short loc_376E8

loc_3768B:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr sub_375EF
		add	sp, 4
		pop	dx
		sub	dx, ax
		mov	[bp+var_4], dx
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_4]
		jmp	short loc_376E8

loc_376AD:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr sub_375EF
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
		jmp	short loc_376E8

loc_376D6:
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

loc_376E8:
		mov	[si+10h], ax

loc_376EB:
		pop	di
		pop	si
		leave
		retf
GlyphObject_LayoutAndRenderAll_37656		endp

; START OF FUNCTION CHUNK FOR GlyphObject_LayoutAndRenderAll_37656
off_376EF	dw offset loc_37677
		dw offset loc_3768B
		dw offset loc_376AD
		dw offset loc_376D6
; END OF FUNCTION CHUNK FOR GlyphObject_LayoutAndRenderAll_37656

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_376F7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+6]
		pop	si
		pop	bp
		retf
sub_376F7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37704		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+8]
		pop	si
		pop	bp
		retf
sub_37704		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_37711		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ah]
		pop	si
		pop	bp
		retf
sub_37711		endp

; ----------------------------------------------------------------------

sub_3771E		proc far
		push	bp
sub_3771E		endp

; START OF FUNCTION CHUNK FOR sub_3771E
		db 8Bh
; END OF FUNCTION CHUNK FOR sub_3771E
seg126		ends
