ovr377		segment	para public 'OVERLAY' use16
		assume cs:ovr377
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

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
Widget_ApplyStyleAndAllocate_D0E40		proc far

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
		jnz	short loc_D0E5C
		push	19h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_D0E99

loc_D0E5C:
		mov	word ptr [si], 4086h
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+0Fh], 0
		mov	ax, si
		add	ax, 10h
		push	[bp+arg_2]
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		mov	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		mov	[si+14h], ax
		mov	byte ptr [si+16h], 4
		xor	ax, ax
		mov	[si+12h], ax
		mov	[si+10h], ax

loc_D0E99:
		mov	ax, si
		pop	si
		leave
		retf
Widget_ApplyStyleAndAllocate_D0E40		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Widget_Method_Dispatch8_314A9 (sub_314A9 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Widget_Method_Dispatch8_6083F (sub_6083F de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+8].
; ==============================================================================================
Widget_Method_Dispatch8_D0E9E		proc far

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
Widget_Method_Dispatch8_D0E9E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; Widget_Method_DispatchC_314CB (sub_314CB de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à Widget_Method_DispatchC_60861 (sub_60861 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0Ch].
; ==============================================================================================
Widget_Method_DispatchC_D0EC0		proc far

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
Widget_Method_DispatchC_D0EC0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Widget_ComputeAndStoreBounds_60883 (sub_60883 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle Widget_ComputeBoundsExtent_60AEB.
; ==============================================================================================
Widget_ComputeAndStoreBounds_D0EE2		proc far

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
		call	near ptr Widget_ComputeBoundsExtent_D114A
		add	sp, 6
		pop	si
		leave
		retf
Widget_ComputeAndStoreBounds_D0EE2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0F2B		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dl, [bp+arg_2]
		cmp	dl, 0FFh
		jnz	short loc_D0F3D
		mov	dl, [si+18h]

loc_D0F3D:
		push	dx
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_D0F2B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D0F4F		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dl, [bp+arg_2]
		mov	si, [bp+arg_0]
		cmp	word ptr [si+14h], 0
		jz	short loc_D0F64
		mov	ax, 1
		jmp	short loc_D0F66

loc_D0F64:
		xor	ax, ax

loc_D0F66:
		or	al, al
		jz	short loc_D0F8D
		cmp	dl, 0FFh
		jnz	short loc_D0F72
		mov	dl, [si+18h]

loc_D0F72:
		push	dx
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		push	large 0
		push	si
		nop
		push	cs
		call	near ptr Widget_ComputeBoundsExtent_D114A
		add	sp, 6

loc_D0F8D:
		pop	si
		pop	bp
		retf	4
sub_D0F4F		endp

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
Widget_RenderWithAttributes_D0F92		proc far

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
		jz	short loc_D0FA8
		mov	ax, 1
		jmp	short loc_D0FAA

loc_D0FA8:
		xor	ax, ax

loc_D0FAA:
		or	al, al
		jz	short loc_D1017
		cmp	[bp+arg_2], 0FFh
		jnz	short loc_D0FBA
		mov	al, [si+18h]
		mov	[bp+arg_2], al

loc_D0FBA:
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
		jl	short loc_D1017
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
		call	sub_67F65
		add	sp, 0Ch

loc_D1017:
		pop	di
		pop	si
		leave
		retf	4
Widget_RenderWithAttributes_D0F92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D101D		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+14h], 0
		jz	short loc_D1030
		mov	ax, 1
		jmp	short loc_D1032

loc_D1030:
		xor	ax, ax

loc_D1032:
		or	al, al
		jz	short loc_D1099
		cmp	[bp+arg_2], 0FFh
		jnz	short loc_D1042
		mov	al, [si+18h]
		mov	[bp+arg_2], al

loc_D1042:
		mov	al, [bp+arg_2]
		push	ax
		push	si
		push	cs
		call	near ptr Widget_RenderWithAttributes_D0F92
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
		call	sub_67F65
		add	sp, 0Ch

loc_D1099:
		pop	di
		pop	si
		pop	bp
		retf	4
sub_D101D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D109F		proc far

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
		call	near ptr Widget_ComputeBoundsExtent_D114A
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_D109F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D10C1		proc far

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
		call	near ptr Widget_ComputeBoundsExtent_D114A
		add	sp, 6
		pop	si
		pop	bp
		retf
sub_D10C1		endp

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
Widget_Method_DispatchChain_D10E3		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_2], 1Fh
		jle	short loc_D1147
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

loc_D1147:
		pop	si
		leave
		retf
Widget_Method_DispatchChain_D10E3		endp

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
Widget_ComputeBoundsExtent_D114A		proc far

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
Widget_ComputeBoundsExtent_D114A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D117C		proc far

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

loc_D11A3:
		push	di
		push	si
		nop
		push	cs
		call	near ptr sub_D14B8
		jmp	short loc_D11E6

loc_D11AC:
		cmp	dx, 0Dh
		jz	short loc_D11B6
		cmp	dx, 0Ah
		jnz	short loc_D11E0

loc_D11B6:
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
		mov	[si+10h], ax
		jmp	short loc_D11A3

loc_D11E0:
		push	dx
		push	si
		push	cs
		call	near ptr Widget_Method_DispatchChain_D10E3

loc_D11E6:
		add	sp, 4
		mov	bx, di
		inc	di
		mov	al, [bx]
		cbw
		mov	dx, ax
		or	ax, ax
		jnz	short loc_D11AC
		pop	di
		pop	si
		leave
		retf
sub_D117C		endp

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
Widget_RenderComplexLayout_D11F9		proc far

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

loc_D1208:
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
		jmp	loc_D13CC

loc_D1231:
		mov	ax, dx
		cmp	ax, 25h
		jz	short loc_D123B
		jmp	loc_D13B1

loc_D123B:
		mov	al, [di]
		cbw
		mov	[bp+var_2], ax
		inc	di
		mov	[bp+var_8], ax
		mov	cx, 0Eh
		mov	bx, offset word_D13EC

loc_D124B:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_8]
		jz	short loc_D125B
		add	bx, 2
		loop	short loc_D124B
		jmp	loc_D13B1

loc_D125B:
		jmp	word ptr cs:[bx+1Ch] ; switch jump

loc_D125F:
		push	0Ah
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		push	word ptr [bx-2]
		call	CRT_Itoa_Signed10
		add	sp, 6
		jmp	loc_D13BE

loc_D127B:
		push	0Ah
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		movzx	eax, word ptr [bx-2]
		push	eax
		call	CRT_Itoa_Unsigned
		add	sp, 8
		jmp	loc_D13BE

loc_D129B:
		push	0Ah
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 4
		mov	bx, [bp+arg_4]
		push	large [bx-4]
		call	CRT_Itoa_BaseVariant
		add	sp, 8
		jmp	loc_D13BE

loc_D12B8:
		push	0Ah
		lea	ax, [bp+var_198]
		push	ax
		add	[bp+arg_4], 4
		mov	bx, [bp+arg_4]
		push	large [bx-4]
		call	CRT_Itoa_Unsigned
		add	sp, 8
		jmp	loc_D13BE

loc_D12D5:
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
		call	CRT_Strupr_30EF
		pop	cx
		jmp	loc_D13BE

loc_D12FC:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	byte ptr [bp+var_198], al
		jmp	loc_D13B5

loc_D130D:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		push	word ptr [bx-2]
		jmp	loc_D13BF

loc_D131A:
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
		jmp	loc_D13CC

loc_D1336:
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
		jmp	short loc_D13CC

loc_D1352:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+18h], al
		jmp	short loc_D13CC

loc_D1361:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+17h], al
		jmp	short loc_D13CC

loc_D1370:
		push	si
		nop
		push	cs
		call	near ptr sub_D1449
		pop	cx
		jmp	short loc_D13CC

loc_D1379:
		add	[bp+arg_4], 2
		mov	bx, [bp+arg_4]
		mov	al, [bx-2]
		mov	[si+16h], al
		jmp	short loc_D13CC

loc_D1388:
		lea	ax, [bp+var_D0]
		push	ax
		push	si
		push	cs
		call	near ptr sub_D117C
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
		jmp	loc_D1208

loc_D13B1:
		mov	byte ptr [bp+var_198], dl

loc_D13B5:
		mov	byte ptr [bp+var_198+1], 0
		lea	ax, [bp+var_198]

loc_D13BE:
		push	ax

loc_D13BF:
		lea	ax, [bp+var_D0]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_D13CC:
		mov	bx, di
		inc	di
		mov	al, [bx]
		cbw
		mov	dx, ax
		or	ax, ax
		jz	short loc_D13DB
		jmp	loc_D1231

loc_D13DB:
		lea	ax, [bp+var_D0]
		push	ax
		push	si
		push	cs
		call	near ptr sub_D117C
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Widget_RenderComplexLayout_D11F9		endp

; START OF FUNCTION CHUNK FOR Widget_RenderComplexLayout_D11F9
word_D13EC	dw 42h
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
off_D1408	dw offset loc_D1352
		dw offset loc_D129B
		dw offset loc_D1361
		dw offset loc_D1379
		dw offset loc_D1370
		dw offset loc_D130D
		dw offset loc_D12B8
		dw offset loc_D131A
		dw offset loc_D1336
		dw offset loc_D1388
		dw offset loc_D12FC
		dw offset loc_D125F
		dw offset loc_D127B
		dw offset loc_D12D5
; END OF FUNCTION CHUNK FOR Widget_RenderComplexLayout_D11F9

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
Widget_RenderComplexLayoutWrapper_D1424		proc far

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
		jz	short loc_D1446
		lea	ax, [bp+arg_4]
		mov	[bp+var_2], ax
		push	ax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr Widget_RenderComplexLayout_D11F9
		add	sp, 6

loc_D1446:
		pop	si
		leave
		retf
Widget_RenderComplexLayoutWrapper_D1424		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D1449		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_D1449		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D1451		proc far

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
		jmp	short loc_D1488

loc_D146B:
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

loc_D1488:
		cmp	byte ptr [di], 0Ah
		jz	short loc_D1497
		cmp	byte ptr [di], 0Dh
		jz	short loc_D1497
		cmp	byte ptr [di], 0
		jnz	short loc_D146B

loc_D1497:
		cmp	[bp+var_4], 0
		jz	short loc_D14B1
		mov	dx, [bp+var_4]
		dec	dx
		mov	bx, [si+14h]
		mov	ax, [bx+10h]
		imul	dx
		mov	dx, [bp+var_2]
		add	dx, ax
		mov	[bp+var_2], dx

loc_D14B1:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_D1451		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D14B8		proc far

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
		mov	al, [si+16h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		ja	short loc_D152F
		shl	bx, 1
		jmp	cs:off_D1533[bx]	; switch jump

loc_D14D9:
		jmp	short loc_D1526

loc_D14DB:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr sub_D1451
		add	sp, 4
		pop	dx
		sub	dx, ax
		mov	[bp+var_2], dx
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_2]
		jmp	short loc_D152C

loc_D14FD:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr sub_D1451
		add	sp, 4
		pop	dx
		sub	dx, ax
		mov	ax, dx
		cwd
		sub	ax, dx
		sar	ax, 1
		mov	[bp+var_4], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		add	ax, [bp+var_4]
		jmp	short loc_D152C

loc_D1526:
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx

loc_D152C:
		mov	[si+10h], ax

loc_D152F:
		pop	di
		pop	si
		leave
		retf
sub_D14B8		endp

; START OF FUNCTION CHUNK FOR sub_D14B8
off_D1533	dw offset loc_D14D9
		dw offset loc_D14DB
		dw offset loc_D14FD
		dw offset loc_D1526
; END OF FUNCTION CHUNK FOR sub_D14B8

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D153B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+6]
		pop	si
		pop	bp
		retf
sub_D153B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D1548		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+8]
		pop	si
		pop	bp
		retf
sub_D1548		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D1555		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ah]
		pop	si
		pop	bp
		retf
sub_D1555		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_D1562		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+0Ch]
		pop	si
		pop	bp
		retf
sub_D1562		endp
ovr377		ends
