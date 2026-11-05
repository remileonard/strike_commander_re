ovr240		segment	para public 'OVERLAY' use16
		assume cs:ovr240
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_88050		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
sub_88050		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; InfoWidget_CopyFieldB_B6A12 (sub_B6A12 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à InfoWidget_CopyFieldB_C8242 (sub_C8242 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à InfoWidget_CopyFieldB_A4582 (sub_A4582 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; copie conditionnellement un champ (+0x20) vers un pointeur cible (+0x1E) si un flag (arg_8)
; est posé.
; ==============================================================================================
InfoWidget_CopyFieldB_88062		proc far

arg_0		= word ptr  6
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_8], 0
		jz	short loc_88077
		mov	ax, [si+20h]
		mov	bx, [si+1Eh]
		mov	[bx], ax

loc_88077:
		pop	si
		pop	bp
		retf
InfoWidget_CopyFieldB_88062		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8807A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
sub_8807A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8808C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_880C9
		push	word ptr [si+2Eh]
		cmp	byte ptr [si+22h], 3
		jnz	short loc_880D2

loc_880B0:
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_880D8
		jmp	short loc_880D2

loc_880C9:
		push	word ptr [si+28h]
		cmp	byte ptr [si+22h], 3
		jz	short loc_880B0

loc_880D2:
		mov	dx, [si+20h]
		mov	ax, [si+1Eh]

loc_880D8:
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		pop	bp
		retf
sub_8808C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_880F6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_88133
		push	word ptr [si+2Eh]
		cmp	byte ptr [si+22h], 3
		jnz	short loc_8813C

loc_8811A:
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_88142
		jmp	short loc_8813C

loc_88133:
		push	word ptr [si+28h]
		cmp	byte ptr [si+22h], 3
		jz	short loc_8811A

loc_8813C:
		mov	dx, [si+20h]
		mov	ax, [si+1Eh]

loc_88142:
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		pop	bp
		retf
sub_880F6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_88160		proc far

arg_0		= word ptr  6
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 1
		jnz	short loc_88172
		mov	ax, [si+2Ch]
		jmp	short loc_88175

loc_88172:
		mov	ax, [si+30h]

loc_88175:
		mov	bx, [si+2Ah]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
sub_88160		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_Method_Dispatch0CC_B6C3E (sub_B6C3E de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; InfoWidget_Method_Dispatch0CC_A47AE (sub_A47AE de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0x0C].
; ==============================================================================================
InfoWidget_Method_Dispatch0CC_8817D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0FFFFFFFFh
		push	word ptr [si+2Ch]
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
InfoWidget_Method_Dispatch0CC_8817D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8819C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_881D9
		push	word ptr [si+2Eh]
		cmp	byte ptr [si+22h], 3
		jnz	short loc_881E2

loc_881C0:
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_881E8
		jmp	short loc_881E2

loc_881D9:
		push	word ptr [si+28h]
		cmp	byte ptr [si+22h], 3
		jz	short loc_881C0

loc_881E2:
		mov	dx, [si+20h]
		mov	ax, [si+1Eh]

loc_881E8:
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		pop	bp
		retf
sub_8819C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_Method_Dispatch0CC_B6C3E (sub_B6C3E de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; InfoWidget_Method_Dispatch0CC_A47AE (sub_A47AE de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0x0C].
; ==============================================================================================
InfoWidget_Method_Dispatch0CC_88206		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0FFFFFFFFh
		push	word ptr [si+2Ch]
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
InfoWidget_Method_Dispatch0CC_88206		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; InfoWidget_Method_Dispatch0CB_B6B26 (sub_B6B26 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à InfoWidget_Method_Dispatch0CB_A4696 (sub_A4696 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable
; [bx+0x0C] (variante).
; ==============================================================================================
InfoWidget_Method_Dispatch0CB_88225		proc far

arg_0		= word ptr  6
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 1
		jnz	short loc_88237
		mov	dx, [si+2Ch]
		jmp	short loc_8823A

loc_88237:
		mov	dx, [si+30h]

loc_8823A:
		push	large 0FFFFFFFFh
		push	dx
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
InfoWidget_Method_Dispatch0CB_88225		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_88250		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		inc	word ptr [si+2Eh]
		mov	ax, [si+2Eh]
		cmp	ax, [si+30h]
		jle	short loc_88268
		mov	ax, [si+28h]
		mov	[si+2Eh], ax

loc_88268:
		push	large 0FFFFFFFFh
		push	word ptr [si+2Ch]
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_88250		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_88280		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	word ptr [si+2Eh]
		cmp	byte ptr [si+22h], 3
		jnz	short loc_882AE
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_882B4

loc_882AE:
		mov	dx, [si+20h]
		mov	ax, [si+1Eh]

loc_882B4:
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		pop	bp
		retf
sub_88280		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_882D2		proc far

arg_0		= word ptr  6
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 1
		jnz	short loc_882F5
		inc	word ptr [si+2Eh]
		mov	ax, [si+2Eh]
		cmp	ax, [si+30h]
		jle	short loc_882F0
		mov	ax, [si+28h]
		mov	[si+2Eh], ax

loc_882F0:
		mov	dx, [si+2Ch]
		jmp	short loc_88309

loc_882F5:
		dec	word ptr [si+2Eh]
		mov	ax, [si+2Eh]
		cmp	ax, [si+28h]
		jge	short loc_88306
		mov	ax, [si+30h]
		mov	[si+2Eh], ax

loc_88306:
		mov	dx, [si+32h]

loc_88309:
		push	large 0FFFFFFFFh
		push	dx
		push	word ptr [si+2Ah]
		mov	bx, [si+2Ah]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_882D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8831F		proc far

var_14		= word ptr -14h
var_12		= word ptr -12h
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 14h
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+2Ah]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_2], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	dl, [si+10h]
		shr	dx, 5
		and	dx, 1
		add	ax, dx
		mov	[bp+var_4], ax
		mov	ax, word_5BF74
		add	ax, 2
		mov	[bp+var_6], ax
		mov	[bp+var_14], 0
		mov	[bp+var_12], 0
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		push	si
		mov	ax, word_5BF74
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_883BA
		push	word ptr [si+34h]
		cmp	byte ptr [si+22h], 3
		jnz	short loc_883C3

loc_883A1:
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_883C9
		jmp	short loc_883C3

loc_883BA:
		push	word ptr [si+28h]
		cmp	byte ptr [si+22h], 3
		jz	short loc_883A1

loc_883C3:
		mov	dx, [si+20h]
		mov	ax, [si+1Eh]

loc_883C9:
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	word_5BF74
		push	0FFh
		mov	ax, [si+2Eh]
		add	ax, [si+28h]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		call	PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		lea	ax, [bp+var_14]
		push	ax
		mov	ax, word_5BF74
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		lea	ax, [bp+var_14]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		pop	si
		leave
		retf
sub_8831F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; InfoWidget_Method_Dispatch0CC_B6C3E (sub_B6C3E de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à InfoWidget_Method_Dispatch0CC_A47AE (sub_A47AE de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable
; [bx+0x0C].
; ==============================================================================================
InfoWidget_Method_Dispatch0CC_88420		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0FFFFFFFFh
		push	word ptr [si+32h]
		push	word ptr [si+30h]
		mov	bx, [si+30h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
InfoWidget_Method_Dispatch0CC_88420		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; InfoWidget_Method_Dispatch0CD_B6C5D (sub_B6C5D de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à InfoWidget_Method_Dispatch0CD_A47CD (sub_A47CD de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable
; [bx+0x0C].
; ==============================================================================================
InfoWidget_Method_Dispatch0CD_8843F		proc far

arg_0		= word ptr  6
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 1
		jnz	short loc_88451
		mov	dx, [si+32h]
		jmp	short loc_88454

loc_88451:
		mov	dx, [si+36h]

loc_88454:
		push	large 0FFFFFFFFh
		push	dx
		push	word ptr [si+30h]
		mov	bx, [si+30h]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
InfoWidget_Method_Dispatch0CD_8843F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_ApplyStubHelpers_B6C88 (sub_B6C88 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_ApplyStubHelpers_A47F8 (sub_A47F8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle deux stubs voisins (sub_6C785/sub_6C78A).
; ==============================================================================================
InfoWidget_ApplyStubHelpers_8846A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	PaletteScreen_DrawWidgetBorderA_22259
		pop	cx
		push	word ptr [si+2Eh]
		push	si
		call	PaletteScreen_DrawWidgetVariantB_221DE
		add	sp, 4
		pop	si
		pop	bp
		retf
InfoWidget_ApplyStubHelpers_8846A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_Helper3_B6CA5 (sub_B6CA5 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à InfoWidget_Helper3_A4815 (sub_A4815 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe visible
; (rôle exact non détaillé, 40 lignes).
; ==============================================================================================
InfoWidget_Helper3_88487		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2Ch], 0
		jge	short loc_884A0
		mov	bx, [si+2Ah]
		mov	ax, [bx]
		cmp	ax, [si+2Eh]
		jle	short loc_884B2
		jmp	short loc_884AA

loc_884A0:
		mov	bx, [si+2Ah]
		mov	ax, [bx]
		cmp	ax, [si+30h]
		jge	short loc_884B2

loc_884AA:
		mov	ax, [si+2Ch]
		mov	bx, [si+2Ah]
		add	[bx], ax

loc_884B2:
		pop	si
		pop	bp
		retf
InfoWidget_Helper3_88487		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_Method_DispatchField2A_B6CD3 (sub_B6CD3 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_Method_DispatchField2A_C85CB (sub_C85CB de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; InfoWidget_Method_DispatchField2A_A4843 (sub_A4843 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable via champ
; [si+0x2A].
; ==============================================================================================
InfoWidget_Method_DispatchField2A_884B5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		call	dword ptr [si+2Ah]
		pop	si
		pop	bp
		retf
InfoWidget_Method_DispatchField2A_884B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_Helper4_B6CE0 (sub_B6CE0 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à InfoWidget_Helper4_A4850 (sub_A4850 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe visible
; (rôle exact non détaillé).
; ==============================================================================================
InfoWidget_Helper4_884C2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+2Ah]
		mov	ax, [bx]
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bx], ax
		pop	si
		pop	bp
		retf
InfoWidget_Helper4_884C2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_Helper5_B6CF6 (sub_B6CF6 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données ou
; constantes) — à vérifier à InfoWidget_Helper5_A4866 (sub_A4866 de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe visible
; (rôle exact non détaillé).
; ==============================================================================================
InfoWidget_Helper5_884D8		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_884F1
		mov	ax, [si+2Ch]
		jmp	short loc_884F4

loc_884F1:
		mov	ax, [si+2Eh]

loc_884F4:
		mov	bx, [si+2Ah]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
InfoWidget_Helper5_884D8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; InfoWidget_DrawComposite_B6D1A (sub_B6D1A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à InfoWidget_DrawComposite_A488A (sub_A488A de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 107 lignes, NON DÉTAILLÉE —
; combine plusieurs stubs voisins (sub_6C79E/6C799/6C7A3/6C7B2 ×4), le verrou d'ownership —
; probable dessin composite de plusieurs sous-éléments du widget.
; ==============================================================================================
InfoWidget_DrawComposite_884FC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word_5BF28
		push	si
		call	sub_225AC
		add	sp, 4
		push	word_5BF00
		push	si
		call	sub_2255D
		add	sp, 4
		push	word_5BF00
		mov	ax, [si+1Ch]
		add	ax, 0FFFCh
		push	ax
		push	large 80002h
		push	3
		push	si
		call	sub_225FB
		add	sp, 0Ch
		mov	di, word_5BF24
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_885BA
		mov	di, word_5BF00
		push	word_5BF1E
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	large 90002h
		push	3
		push	si
		call	PaletteScreen_DrawWidgetFillC_226D7
		add	sp, 0Ch
		push	word_5BF1E
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	large 0A0002h
		push	4
		push	si
		call	PaletteScreen_DrawWidgetFillC_226D7
		add	sp, 0Ch
		push	word_5BF1E
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	large 30002h
		push	9
		push	si
		call	PaletteScreen_DrawWidgetFillC_226D7
		add	sp, 0Ch
		push	word_5BF1E
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	large 40002h
		push	0Ah
		push	si
		call	PaletteScreen_DrawWidgetFillC_226D7
		add	sp, 0Ch

loc_885BA:
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		push	word_5BF74
		push	di
		push	word ptr [si+20h]
		mov	ax, [si+6]
		add	ax, 2
		push	ax
		mov	ax, [si+4]
		add	ax, 0Dh
		push	ax
		call	PaletteScreen_DispatchWidgetLayoutB_232D7
		add	sp, 0Ah
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
InfoWidget_DrawComposite_884FC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_885EA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_885FE
		mov	byte ptr [bx], 0
		jmp	short loc_88604

loc_885FE:
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 1

loc_88604:
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		pop	si
		pop	bp
		retf
sub_885EA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8860F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	PaletteScreen_AcquireOwnership_2197B
		pop	cx
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_88647
		push	word ptr [si+2Ch]
		cmp	byte ptr [si+24h], 3
		jnz	short loc_88650

loc_8862E:
		push	0
		mov	al, [si+24h]
		push	ax
		push	large [si+20h]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_88656
		jmp	short loc_88650

loc_88647:
		push	word ptr [si+2Ah]
		cmp	byte ptr [si+24h], 3
		jz	short loc_8862E

loc_88650:
		mov	dx, [si+22h]
		mov	ax, [si+20h]

loc_88656:
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_5DD44
		call	sub_4A194
		add	sp, 0Ch
		push	si
		call	PaletteScreen_ReleaseOwnership_21998
		pop	cx
		pop	si
		pop	bp
		retf
sub_8860F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_88674		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_88688
		mov	byte ptr [bx], 0
		jmp	short loc_8868E

loc_88688:
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 1

loc_8868E:
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		pop	si
		pop	bp
		retf
sub_88674		endp
ovr240		ends
