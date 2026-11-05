ovr332		segment	para public 'OVERLAY' use16
		assume cs:ovr332
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6A00		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2Eh]
		mov	bx, [si+2Ch]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
sub_B6A00		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; InfoWidget_CopyFieldB_C8242 (sub_C8242 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à InfoWidget_CopyFieldB_A4582 (sub_A4582 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, copie conditionnellement un
; champ (+0x20) vers un pointeur cible (+0x1E) si un flag (arg_8) est posé.
; ==============================================================================================
InfoWidget_CopyFieldB_B6A12		proc far

arg_0		= word ptr  6
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_8], 0
		jz	short loc_B6A27
		mov	ax, [si+20h]
		mov	bx, [si+1Eh]
		mov	[bx], ax

loc_B6A27:
		pop	si
		pop	bp
		retf
InfoWidget_CopyFieldB_B6A12		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6A2A		proc far

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
sub_B6A2A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6A3C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_74AD7
		pop	cx
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_B6A5C
		push	word ptr [si+2Eh]
		jmp	short loc_B6A5F

loc_B6A5C:
		push	word ptr [si+28h]

loc_B6A5F:
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	si
		call	sub_74ADC
		pop	cx
		pop	si
		pop	bp
		retf
sub_B6A3C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6A92		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large 0FFFFFFFFh
		push	word ptr [si+2Eh]
		push	word ptr [si+2Ch]
		mov	bx, [si+2Ch]
		mov	bx, [bx+0Eh]
		call	dword ptr [bx+0Ch]
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_B6A92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6AB1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_74AD7
		pop	cx
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_B6AD1
		push	word ptr [si+2Eh]
		jmp	short loc_B6AD4

loc_B6AD1:
		push	word ptr [si+28h]

loc_B6AD4:
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	si
		call	sub_74ADC
		pop	cx
		pop	si
		pop	bp
		retf
sub_B6AB1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6B07		proc far

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
sub_B6B07		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; InfoWidget_Method_Dispatch0CB_A4696 (sub_A4696 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0x0C] (variante).
; ==============================================================================================
InfoWidget_Method_Dispatch0CB_B6B26		proc far

arg_0		= word ptr  6
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 1
		jnz	short loc_B6B38
		mov	dx, [si+2Ch]
		jmp	short loc_B6B3B

loc_B6B38:
		mov	dx, [si+30h]

loc_B6B3B:
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
InfoWidget_Method_Dispatch0CB_B6B26		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_MeasureAndDrawStyled_A46C1 (sub_A46C1 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 110 lignes, NON DÉTAILLÉE — combine TextFormat_ApplyStyleAttribute_5E2D0 (×2), le verrou
; d'ownership, Memory_TypedAllocDispatchB_5C832, Shape_DrawSpans_61F52,
; TextFormat_ReleaseStyleList_5E526.
; ==============================================================================================
InfoWidget_MeasureAndDrawStyled_B6B51		proc far

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
		mov	ax, word_79260
		add	ax, 2
		mov	[bp+var_6], ax
		mov	[bp+var_14], 0
		mov	[bp+var_12], 0
		push	ax
		lea	ax, [bp+var_14]
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	si
		mov	ax, word_79260
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	si
		call	sub_74AD7
		pop	cx
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_B6BCF
		push	word ptr [si+34h]
		jmp	short loc_B6BD2

loc_B6BCF:
		push	word ptr [si+28h]

loc_B6BD2:
		push	0
		mov	al, [si+22h]
		push	ax
		push	large [si+1Eh]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	word_79260
		push	0FFh
		mov	ax, [si+2Eh]
		add	ax, [si+28h]
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		call	sub_74BA9
		add	sp, 0Ah
		push	si
		call	sub_74ADC
		pop	cx
		lea	ax, [bp+var_14]
		push	ax
		mov	ax, word_79260
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		lea	ax, [bp+var_14]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		pop	si
		leave
		retf
InfoWidget_MeasureAndDrawStyled_B6B51		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; InfoWidget_Method_Dispatch0CC_A47AE (sub_A47AE de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0x0C].
; ==============================================================================================
InfoWidget_Method_Dispatch0CC_B6C3E		proc far

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
InfoWidget_Method_Dispatch0CC_B6C3E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; InfoWidget_Method_Dispatch0CD_A47CD (sub_A47CD de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, dispatch vtable [bx+0x0C].
; ==============================================================================================
InfoWidget_Method_Dispatch0CD_B6C5D		proc far

arg_0		= word ptr  6
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_6], 1
		jnz	short loc_B6C6F
		mov	dx, [si+32h]
		jmp	short loc_B6C72

loc_B6C6F:
		mov	dx, [si+36h]

loc_B6C72:
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
InfoWidget_Method_Dispatch0CD_B6C5D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_ApplyStubHelpers_A47F8 (sub_A47F8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle deux stubs voisins (sub_6C785/sub_6C78A).
; ==============================================================================================
InfoWidget_ApplyStubHelpers_B6C88		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_74AA5
		pop	cx
		push	word ptr [si+30h]
		push	si
		call	sub_74AAA
		add	sp, 4
		pop	si
		pop	bp
		retf
InfoWidget_ApplyStubHelpers_B6C88		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_Helper3_A4815 (sub_A4815 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible (rôle exact non détaillé, 40 lignes).
; ==============================================================================================
InfoWidget_Helper3_B6CA5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+2Eh], 0
		jge	short loc_B6CBE
		mov	bx, [si+2Ch]
		mov	ax, [bx]
		cmp	ax, [si+30h]
		jle	short loc_B6CD0
		jmp	short loc_B6CC8

loc_B6CBE:
		mov	bx, [si+2Ch]
		mov	ax, [bx]
		cmp	ax, [si+32h]
		jge	short loc_B6CD0

loc_B6CC8:
		mov	ax, [si+2Eh]
		mov	bx, [si+2Ch]
		add	[bx], ax

loc_B6CD0:
		pop	si
		pop	bp
		retf
InfoWidget_Helper3_B6CA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_Method_DispatchField2A_C85CB (sub_C85CB de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; InfoWidget_Method_DispatchField2A_A4843 (sub_A4843 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, dispatch vtable via champ
; [si+0x2A].
; ==============================================================================================
InfoWidget_Method_DispatchField2A_B6CD3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		call	dword ptr [si+2Ch]
		pop	si
		pop	bp
		retf
InfoWidget_Method_DispatchField2A_B6CD3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_Helper4_A4850 (sub_A4850 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible (rôle exact non détaillé).
; ==============================================================================================
InfoWidget_Helper4_B6CE0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+2Ch]
		mov	ax, [bx]
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bx], ax
		pop	si
		pop	bp
		retf
InfoWidget_Helper4_B6CE0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_Helper5_A4866 (sub_A4866 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible (rôle exact non détaillé).
; ==============================================================================================
InfoWidget_Helper5_B6CF6		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+10h]
		shr	ax, 5
		and	ax, 1
		or	ax, ax
		jz	short loc_B6D0F
		mov	ax, [si+2Eh]
		jmp	short loc_B6D12

loc_B6D0F:
		mov	ax, [si+30h]

loc_B6D12:
		mov	bx, [si+2Ch]
		mov	[bx], ax
		pop	si
		pop	bp
		retf
InfoWidget_Helper5_B6CF6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; InfoWidget_DrawComposite_A488A (sub_A488A de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 107 lignes, NON DÉTAILLÉE — combine
; plusieurs stubs voisins (sub_6C79E/6C799/6C7A3/6C7B2 ×4), le verrou d'ownership — probable
; dessin composite de plusieurs sous-éléments du widget.
; ==============================================================================================
InfoWidget_DrawComposite_B6D1A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	word_79220
		push	si
		call	sub_74ABE
		add	sp, 4
		push	word_791F8
		push	si
		call	sub_74AB9
		add	sp, 4
		push	word_791F8
		mov	ax, [si+1Ch]
		add	ax, 0FFFCh
		push	ax
		push	large 80002h
		push	3
		push	si
		call	sub_74AC3
		add	sp, 0Ch
		mov	di, word_7921C
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_B6DD8
		mov	di, word_791F8
		push	word_79216
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	large 90002h
		push	3
		push	si
		call	sub_74AD2
		add	sp, 0Ch
		push	word_79216
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	large 0A0002h
		push	4
		push	si
		call	sub_74AD2
		add	sp, 0Ch
		push	word_79216
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	large 30002h
		push	9
		push	si
		call	sub_74AD2
		add	sp, 0Ch
		push	word_79216
		mov	ax, [si+1Ch]
		add	ax, 0FFFDh
		push	ax
		push	large 40002h
		push	0Ah
		push	si
		call	sub_74AD2
		add	sp, 0Ch

loc_B6DD8:
		push	si
		call	sub_74AD7
		pop	cx
		push	word_79260
		push	di
		push	word ptr [si+20h]
		mov	ax, [si+6]
		add	ax, 2
		push	ax
		mov	ax, [si+4]
		add	ax, 0Dh
		push	ax
		call	sub_74BA9
		add	sp, 0Ah
		push	si
		call	sub_74ADC
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
InfoWidget_DrawComposite_B6D1A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6E08		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_B6E1C
		mov	byte ptr [bx], 0
		jmp	short loc_B6E22

loc_B6E1C:
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 1

loc_B6E22:
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		pop	si
		pop	bp
		retf
sub_B6E08		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à InfoWidget_MeasureAndDrawC_A499D (sub_A499D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que InfoWidget_MeasureAndDrawA_A45AC (variante de champ).
; ==============================================================================================
InfoWidget_MeasureAndDrawC_B6E2D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_74AD7
		pop	cx
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_B6E48
		push	word ptr [si+2Ch]
		jmp	short loc_B6E4B

loc_B6E48:
		push	word ptr [si+2Ah]

loc_B6E4B:
		push	0
		mov	al, [si+24h]
		push	ax
		push	large [si+20h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	si
		call	sub_74ADC
		pop	cx
		pop	si
		pop	bp
		retf
InfoWidget_MeasureAndDrawC_B6E2D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6E7E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+1Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_B6E92
		mov	byte ptr [bx], 0
		jmp	short loc_B6E98

loc_B6E92:
		mov	bx, [si+1Eh]
		mov	byte ptr [bx], 1

loc_B6E98:
		push	si
		mov	bx, [si+0Eh]
		call	dword ptr [bx+18h]
		pop	cx
		pop	si
		pop	bp
		retf
sub_B6E7E		endp
ovr332		ends
