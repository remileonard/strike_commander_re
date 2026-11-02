seg110		segment	para public 'CODE' use16
		assume cs:seg110
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextFormat_ApplyStyleAttribute_2E9A4 (sub_2E9A4 de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à TextFormat_ApplyStyleAttribute_5E2D0 (sub_5E2D0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle TextFormat_ReleaseStyleList_5E526. Référencée depuis seg025 (framework UI).
; ==============================================================================================
TextFormat_ApplyStyleAttribute_357D1		proc far

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
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ReleaseStyleList_35A27
		pop	cx
		mov	ax, [di]
		mov	[si], ax
		mov	ax, [di+2]
		mov	[si+2], ax
		mov	ax, [di+4]
		mov	[bp+var_2], ax
		mov	ax, [di+6]
		mov	[bp+var_4], ax
		mov	ax, [di+8]
		mov	[bp+var_6], ax
		mov	ax, [di+0Ah]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+4], ax
		mov	ax, [bp+var_4]
		mov	[si+6], ax
		mov	ax, [bp+var_6]
		mov	[si+8], ax
		mov	ax, [bp+var_8]
		mov	[si+0Ah], ax
		mov	byte ptr [si+0Dh], 0
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
TextFormat_ApplyStyleAttribute_357D1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextFormat_ApplyStyleAttributeB_2E9FD (sub_2E9FD de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à TextFormat_ApplyStyleAttributeB_5E329 (sub_5E329 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle TextFormat_ReleaseStyleList_5E526. Référencée par sub_14795.
; ==============================================================================================
TextFormat_ApplyStyleAttributeB_3582A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ReleaseStyleList_35A27
		pop	cx
		mov	ax, [di]
		mov	[si], ax
		mov	ax, [di+2]
		mov	[si+2], ax
		mov	byte ptr [si+0Dh], 0
		pop	di
		pop	si
		pop	bp
		retf
TextFormat_ApplyStyleAttributeB_3582A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextRenderer_ApplyFormatChange_2EA21 (sub_2EA21 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextRenderer_ApplyFormatChange_5E34D (sub_5E34D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 110 lignes, NON DÉTAILLÉE — combine Memory_TypedFreeWrapper_5C6F3, Memory_TypedFree_5C7B6
; ×2, sub_5E4C8. Référencée directement par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
TextRenderer_ApplyFormatChange_3584E		proc far

var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 0
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		mov	[bp+var_6], ax
		mov	ax, [si+0Ah]
		sub	ax, [si+6]
		inc	ax
		mov	[bp+var_8], ax
		imul	[bp+var_6]
		movzx	eax, ax
		mov	[bp+var_C], eax
		cmp	[bp+var_C], 0FFF0h
		jl	short loc_3588C
		jmp	loc_3590D

loc_3588C:
		push	0
		push	2
		push	2
		push	eax
		push	6C14h
		call	Memory_TypedFreeWrapper_32871
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_3590D
		cmp	word ptr [si+2], 0
		jz	short loc_358D0
		cmp	[bp+arg_2], 0
		jz	short loc_358D0
		test	byte ptr [si+0Dh], 1
		jz	short loc_358FD
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_358FD

loc_358D0:
		push	word ptr [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ResolveStyleEntry_359C9
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_358FD
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		mov	[bp+var_4], 0

loc_358FD:
		cmp	[bp+var_4], 0
		jz	short loc_3590D
		mov	ax, word ptr [bp+var_4+2]
		mov	[si], ax
		or	byte ptr [si+0Dh], 1

loc_3590D:
		cmp	[bp+var_4], 0
		jz	short loc_35919
		mov	ax, 1
		jmp	short loc_3591B

loc_35919:
		xor	ax, ax

loc_3591B:
		pop	si
		leave
		retf
TextRenderer_ApplyFormatChange_3584E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextFormat_SetAttribute_2EAF1 (sub_2EAF1 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextFormat_SetAttribute_5E41D (sub_5E41D de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine sub_5E4C8 et sub_5E5AC.
; Référencée par TextRenderer_GetOrInitFormatState_5D9FD (seg140).
; ==============================================================================================
TextFormat_SetAttribute_3591E		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+4], 0
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 13Fh
		mov	word ptr [si+0Ah], 0C7h
		mov	word ptr [si], 0A000h
		push	0
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ResolveStyleEntry_359C9
		add	sp, 4
		cmp	[bp+arg_4], 0
		jz	short loc_3595B
		mov	al, [bp+arg_2]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ReleaseAttribute_35AAD
		add	sp, 4

loc_3595B:
		pop	si
		pop	bp
		retf
TextFormat_SetAttribute_3591E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextFormat_InitAttributeTable_2EB31 (sub_2EB31 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextFormat_InitAttributeTable_5E45D (sub_5E45D de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; TextFormat_ReleaseStyleList_5E526, sub_5E4C8, sub_5E5AC. Référencée par
; PagedMemory_InitSubsystem_5BB0D (seg127).
; ==============================================================================================
TextFormat_InitAttributeTable_3595E		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= byte ptr  14h
arg_10		= byte ptr  16h

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ReleaseStyleList_35A27
		pop	cx
		mov	ax, [bp+arg_6]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_A]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_C]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+4], ax
		mov	ax, [bp+var_4]
		mov	[si+6], ax
		mov	ax, [bp+var_6]
		mov	[si+8], ax
		mov	ax, [bp+var_8]
		mov	[si+0Ah], ax
		mov	ax, [bp+arg_2]
		mov	[bp+var_A], ax
		mov	[si], ax
		push	[bp+arg_4]
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ResolveStyleEntry_359C9
		add	sp, 4
		cmp	[bp+arg_10], 0
		jz	short loc_359C6
		mov	al, [bp+arg_E]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextFormat_ReleaseAttribute_35AAD
		add	sp, 4

loc_359C6:
		pop	si
		leave
		retf
TextFormat_InitAttributeTable_3595E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextFormat_ResolveStyleEntry_2EB9C (sub_2EB9C de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextFormat_ResolveStyleEntry_5E4C8 (sub_5E4C8 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle sub_5E66E.
; Utilisée par TextRenderer_ApplyFormatChange_5E34D, TextFormat_SetAttribute_5E41D et
; TextFormat_InitAttributeTable_5E45D.
; ==============================================================================================
TextFormat_ResolveStyleEntry_359C9		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+2], 0
		jz	short loc_359EF
		mov	al, [si+0Dh]
		and	al, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_359EF
		mov	word ptr [si+2], 0

loc_359EF:
		push	[bp+arg_2]
		mov	ax, [si+0Ah]
		sub	ax, [si+6]
		inc	ax
		push	ax
		mov	ax, [si+8]
		sub	ax, [si+4]
		inc	ax
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		call	sub_35B58
		add	sp, 8
		mov	dl, al
		or	dl, dl
		jz	short loc_35A1C
		or	byte ptr [si+0Dh], 2
		jmp	short loc_35A22

loc_35A1C:
		mov	ax, [bp+var_2]
		mov	[si+2], ax

loc_35A22:
		mov	al, dl
		pop	si
		leave
		retf
TextFormat_ResolveStyleEntry_359C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TextFormat_ReleaseStyleList_2EBFA (sub_2EBFA de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de données
; ou constantes) — à vérifier à TextFormat_ReleaseStyleList_5E526 (sub_5E526 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, libère une
; liste d'attributs de style (sub_338, Memory_TypedFree_5C7B6). Référencée depuis seg025.
; ==============================================================================================
TextFormat_ReleaseStyleList_35A27		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		test	byte ptr [si+0Dh], 2
		jz	short loc_35A4D
		cmp	word ptr [si+2], 0
		jz	short loc_35A4D
		push	word ptr [si+2]
		call	sub_39C
		pop	cx
		mov	word ptr [si+2], 0
		jmp	short loc_35A4D

loc_35A4D:
		test	byte ptr [si+0Dh], 1
		jz	short loc_35A70
		push	0
		push	2
		mov	ax, [si]
		mov	[bp+var_2], ax
		mov	[bp+var_4], 0
		lea	ax, [bp+var_4]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8

loc_35A70:
		mov	byte ptr [si+0Dh], 0
		pop	si
		leave
		retf
TextFormat_ReleaseStyleList_35A27		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; UI_ApplyEncodingHelper_2EC4A (sub_2EC4A de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à UI_ApplyEncodingHelper_5E576 (sub_5E576 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle sub_60FE2. Référencée
; par sub_16898 (segment framework UI).
; ==============================================================================================
UI_ApplyEncodingHelper_35A77		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_35A8F
		push	[bp+arg_2]
		push	si
		call	Rect_BlitOverlapRegion_37B54
		add	sp, 4

loc_35A8F:
		pop	si
		pop	bp
		retf
UI_ApplyEncodingHelper_35A77		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; UI_ApplyEncodingHelper_2EC65 (sub_2EC65 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions,
; 2 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier à
; UI_ApplyEncodingHelper_5E576 (sub_5E576 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle sub_60FE2. Référencée par sub_16898
; (segment framework UI).
; ==============================================================================================
UI_ApplyEncodingHelper_35A92		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_35AAA
		push	si
		push	[bp+arg_2]
		call	Rect_BlitOverlapRegion_37B54
		add	sp, 4

loc_35AAA:
		pop	si
		pop	bp
		retf
UI_ApplyEncodingHelper_35A92		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; TextFormat_ReleaseAttribute_2EC80 (sub_2EC80 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à TextFormat_ReleaseAttribute_5E5AC (sub_5E5AC de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle sub_60F94. Référencée
; par sub_1C5D8 (proche de SmallObject_RegisterInList_5D999, seg139).
; ==============================================================================================
TextFormat_ReleaseAttribute_35AAD		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_35AC6
		mov	al, [bp+arg_2]
		push	ax
		push	si
		call	sub_37B08
		add	sp, 4

loc_35AC6:
		pop	si
		pop	bp
		retf
TextFormat_ReleaseAttribute_35AAD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35AC9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si], 0
		jz	short loc_35AF1
		mov	al, [bp+arg_4]
		push	ax
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	word ptr [di+2]
		push	word ptr [di]
		push	si
		call	sub_37A76
		add	sp, 0Ch

loc_35AF1:
		pop	di
		pop	si
		pop	bp
		retf
sub_35AC9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_35AF5		proc far

arg_0		= word ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si], 0
		jz	short loc_35B1A
		mov	al, [bp+arg_A]
		push	ax
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
sub_35AF5		endp

; START OF FUNCTION CHUNK FOR sub_35AF5
		db 0FFh, 76h
; END OF FUNCTION CHUNK FOR sub_35AF5
seg110		ends
