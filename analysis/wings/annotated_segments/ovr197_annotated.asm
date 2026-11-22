ovr197		segment	para public 'OVERLAY' use16
		assume cs:ovr197
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; MissionText_ApplyDualStyle_A5D50 (sub_A5D50 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à MissionText_ApplyDualStyle_C0F30 (sub_C0F30 de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à MissionText_ApplyDualStyle_97540 (sub_97540 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; applique deux styles de texte (TextFormat_ApplyStyleAttribute_5E2D0 ×2).
; ==============================================================================================
MissionText_ApplyDualStyle_703E0		proc far

var_C		= word ptr -0Ch
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

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	word_5DD44
		mov	ax, si
		add	ax, 10h
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	[bp+var_2], di
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		mov	[si+14h], ax
		mov	ax, [bp+var_4]
		mov	[si+16h], ax
		mov	ax, [bp+var_6]
		mov	[si+18h], ax
		mov	ax, [bp+var_8]
		mov	[si+1Ah], ax
		mov	ax, si
		add	ax, 10h
		push	ax
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_47877
		add	sp, 4
		mov	ax, [bp+arg_6]
		sub	ax, di
		mov	[bp+var_A], ax
		mov	ax, [bp+arg_8]
		sub	ax, [bp+arg_4]
		mov	[bp+var_C], ax
		mov	word ptr [si+6], 0
		mov	word ptr [si+8], 0
		mov	ax, [bp+var_A]
		mov	[si+0Ah], ax
		mov	ax, [bp+var_C]
		mov	[si+0Ch], ax
		pop	di
		pop	si
		leave
		retf
MissionText_ApplyDualStyle_703E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7046C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word_5C144, 0
		jnz	short loc_70491
		push	6286h
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttributeB_478D0
		add	sp, 4
		mov	word_5C144, si
		jmp	short loc_704B0

loc_70491:
		push	0
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextRenderer_ApplyFormatChange_478F4
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_704B0
		push	9001h
		call	sub_9D47
		pop	cx

loc_704B0:
		pop	si
		pop	bp
		retf
sub_7046C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; MissionText_ReleaseStyleWrapper_A5E88 (sub_A5E88 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à MissionText_ReleaseStyleWrapper_9786A (sub_9786A de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle TextFormat_ReleaseStyleList_5E526.
; ==============================================================================================
MissionText_ReleaseStyleWrapper_704B3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		cmp	word_5C144, dx
		jnz	short loc_704C7
		mov	word_5C144, 0
		jmp	short loc_704D3

loc_704C7:
		mov	ax, dx
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx

loc_704D3:
		pop	bp
		retf
MissionText_ReleaseStyleWrapper_704B3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionText_ReleaseStyles_A5EAA (sub_A5EAA de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionText_ReleaseStyles_9788C (sub_9788C de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; libère 2 listes de style et un bloc (CRT_FreeNear_Wrap).
; ==============================================================================================
MissionText_ReleaseStyles_704D5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_70519
		mov	word ptr [si], 2685h
		cmp	word_5C144, si
		jnz	short loc_704F4
		mov	word_5C144, 0

loc_704F4:
		mov	ax, si
		add	ax, 10h
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		mov	ax, si
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		test	di, 1
		jz	short loc_70519
		push	si
		call	sub_33B
		pop	cx

loc_70519:
		pop	di
		pop	si
		pop	bp
		retf
MissionText_ReleaseStyles_704D5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7051D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_70536
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_7056B

loc_70536:
		mov	word ptr [si], 2685h
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+0Fh], 0
		mov	word ptr [si+10h], 0
		mov	word ptr [si+12h], 0
		mov	byte ptr [si+1Dh], 0
		mov	word ptr [si], 2671h
		push	large 0C7013Fh
		push	large 0
		push	si
		push	cs
		call	near ptr MissionText_ApplyDualStyle_703E0
		add	sp, 0Ah

loc_7056B:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_7051D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70570		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	8
		push	266Ah
		mov	ax, si
		add	ax, 53h
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		mov	[bp+var_4], 4E2000h
		mov	eax, [bp+var_4]
		mov	[si+44h], eax
		mov	[bp+var_8], 2D00h
		mov	eax, [bp+var_8]
		mov	[si+5Eh], eax
		mov	[bp+var_C], 2800h
		mov	eax, [bp+var_C]
		mov	[si], eax
		mov	word ptr [si+5Ch], 0
		and	byte ptr [si+52h], 0FDh
		and	byte ptr [si+52h], 0FEh
		pop	si
		leave
		retf
sub_70570		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionText_Helper_A5F57 (sub_A5F57 de PACIFIC.EXE).
; Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à MissionText_Helper_97939
; (sub_97939 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, aucun appel externe visible (35 lignes).
; ==============================================================================================
MissionText_Helper_705D0		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah
arg_8		= dword ptr  0Eh
arg_C		= dword ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_70570
		pop	cx
		mov	eax, [bp+arg_4]
		mov	[bp+var_4], eax
		shl	eax, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[si+44h], eax
		mov	eax, [bp+arg_8]
		mov	[si+5Eh], eax
		mov	eax, [bp+arg_C]
		mov	[si], eax
		mov	ax, [bp+arg_2]
		mov	[si+5Ch], ax
		pop	si
		leave
		retf
MissionText_Helper_705D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionText_LoadFormationLabel_A5F97 (sub_A5F97 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionText_LoadFormationLabel_97979 (sub_97979 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine Formation_ComputeGeometryHelper_56D43, String_ConstructEmpty, ReadFieldGroupA_64A19.
; ==============================================================================================
MissionText_LoadFormationLabel_70610		proc far

var_2E		= word ptr -2Eh
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2Eh
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_7062C
		push	7Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_70691

loc_7062C:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_3B522
		pop	cx
		mov	word ptr [si+50h], 242Ah
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		mov	ax, si
		add	ax, 5Eh
		mov	ax, si
		add	ax, 62h
		mov	ax, si
		add	ax, 66h
		mov	ax, si
		add	ax, 6Ah
		mov	ax, si
		add	ax, 6Eh
		mov	ax, si
		add	ax, 72h
		mov	ax, si
		add	ax, 76h
		mov	ax, si
		add	ax, 7Ah
		push	large 2Eh
		push	ss
		lea	ax, [bp+var_2E]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		lea	ax, [bp+var_2E]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr MissionText_ConstructFullOrientation_706C3
		add	sp, 4

loc_70691:
		mov	ax, si
		pop	si
		leave
		retf
MissionText_LoadFormationLabel_70610		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; MissionText_Helper2_A601E (sub_A601E de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à MissionText_Helper2_97A00 (sub_97A00 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle CRT_MemFamily_Extra1.
; ==============================================================================================
MissionText_Helper2_70696		proc far

var_2E		= word ptr -2Eh
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2Eh
		push	si
		mov	si, [bp+arg_0]
		push	2Eh
		push	large [bp+arg_2]
		push	ss
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_3609
		add	sp, 0Ah
		lea	ax, [bp+var_2E]
		push	ax
		push	si
		nop
		push	cs
		call	near ptr MissionText_ConstructFullOrientation_706C3
		add	sp, 4
		pop	si
		leave
		retf
MissionText_Helper2_70696		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionText_ConstructFullOrientation_A604B (sub_A604B
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionText_ConstructFullOrientation_97A2D (sub_97A2D
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️
; far, 138 lignes, NON DÉTAILLÉE — combine Matrix_BuildFullOrientation_575B2 (seg116),
; Utility_Helper_55E11, allocation, copie de chaîne.
; ==============================================================================================
MissionText_ConstructFullOrientation_706C3		proc far

var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+18h]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		lea	ax, word ptr [bp+var_6]
		push	ax
		mov	ax, [di+1Ah]
		mov	[bp+var_8], ax
		movsx	eax, [bp+var_8]
		shl	eax, 8
		mov	[bp+var_C], eax
		lea	ax, word ptr [bp+var_C]
		push	ax
		mov	ax, [di+16h]
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		lea	ax, word ptr [bp+var_12]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Matrix_BuildFullOrientation_3BD91
		add	sp, 8
		push	large [di+12h]
		push	large [di+0Eh]
		push	large [di+0Ah]
		mov	ax, si
		add	ax, 14h
		push	ax
		call	Utility_Helper_3A5F0
		add	sp, 0Eh
		mov	ax, [di+26h]
		mov	[bp+var_14], ax
		mov	ax, [di+28h]
		mov	[bp+var_16], ax
		mov	ax, [di+2Ah]
		mov	[bp+var_18], ax
		mov	ax, [di+2Ch]
		mov	[bp+var_1A], ax
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	[bp+var_1C], ax
		or	ax, ax
		jz	short loc_707A1
		mov	bx, [bp+var_1C]
		mov	word ptr [bx], 2685h
		mov	word ptr [bx+2], 0
		mov	word ptr [bx+4], 0
		mov	byte ptr [bx+0Fh], 0
		mov	word ptr [bx+10h], 0
		mov	word ptr [bx+12h], 0
		mov	byte ptr [bx+1Dh], 0
		push	[bp+var_1A]
		push	[bp+var_18]
		push	[bp+var_16]
		push	[bp+var_14]
		push	ax
		push	cs
		call	near ptr MissionText_ApplyDualStyle_703E0
		add	sp, 0Ah
		mov	ax, [bp+var_1C]
		jmp	short loc_707A4

loc_707A1:
		mov	ax, [bp+var_1C]

loc_707A4:
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	ax, di
		add	ax, 22h
		mov	[bp+var_1E], ax
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		mov	[bp+var_2A], eax
		sub	sp, 4
		mov	ax, [di+20h]
		mov	[bp+var_20], ax
		movsx	eax, [bp+var_20]
		shl	eax, 8
		mov	[bp+var_2E], eax
		push	large [di+1Ch]
		push	word ptr [si+5Ch]
		push	si
		push	cs
		call	near ptr MissionText_Helper_705D0
		add	sp, 10h
		mov	[bp+var_22], di
		push	8
		push	[bp+var_22]
		mov	ax, si
		add	ax, 53h
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	byte ptr [si+5Bh], 0
		pop	di
		pop	si
		leave
		retf
MissionText_ConstructFullOrientation_706C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; MissionText_Helper3_A6187 (sub_A6187 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à MissionText_Helper3_97B69 (sub_97B69 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel externe visible (22
; lignes).
; ==============================================================================================
MissionText_Helper3_707FF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Ch], 0
		jz	short loc_70818
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		pop	cx

loc_70818:
		and	byte ptr [si+52h], 0FEh
		pop	si
		pop	bp
		retf
MissionText_Helper3_707FF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionText_ReleaseFree_A61A7 (sub_A61A7 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionText_ReleaseFree_97B89 (sub_97B89 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle CRT_FreeNear_Wrap.
; ==============================================================================================
MissionText_ReleaseFree_7081F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_70865
		mov	word ptr [si+50h], 242Ah
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+4]
		pop	cx
		cmp	word ptr [si+5Ch], 0
		jz	short loc_70853
		push	3
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 4
		jmp	short loc_70853

loc_70853:
		mov	word ptr [si+5Ch], 0
		test	di, 1
		jz	short loc_70865
		push	si
		call	sub_33B
		pop	cx

loc_70865:
		pop	di
		pop	si
		pop	bp
		retf
MissionText_ReleaseFree_7081F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionText_CopyBuffer_A61F1 (sub_A61F1 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; MissionText_CopyBuffer_97BD3 (sub_97BD3 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle CRT_Fmemcpy.
; ==============================================================================================
MissionText_CopyBuffer_70869		proc far

var_8		= dword ptr -8
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Ch], 0
		jz	short loc_708C5
		push	word ptr [si+5Ch]
		mov	bx, [si+5Ch]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		sub	sp, 4
		mov	di, si
		add	di, 5Eh
		mov	eax, [di]
		mov	[bp+var_8], eax
		push	si
		nop
		push	cs
		call	near ptr EntityScreenLayout_PrepareAndCompute
		add	sp, 6
		or	byte ptr [si+52h], 1
		mov	ax, si
		add	ax, 48h
		push	ds
		push	ax
		mov	ax, [si+5Ch]
		add	ax, 2
		jz	short loc_708B5
		mov	ax, [si+5Ch]
		add	ax, 6
		jmp	short loc_708BB

loc_708B5:
		mov	ax, [si+5Ch]
		add	ax, 2

loc_708BB:
		push	ds
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy

loc_708C5:
		mov	al, [si+52h]
		and	ax, 1
		pop	di
		pop	si
		pop	bp
		retf
MissionText_CopyBuffer_70869		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_708CF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	al, [si+52h]
		and	ax, 1
		or	al, al
		jz	short loc_708E8
		push	si
		mov	bx, [si+50h]
		call	dword ptr [bx+8]
		pop	cx

loc_708E8:
		pop	si
		pop	bp
		retf
sub_708CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; MissionText_CopyBufferB_A627A (sub_A627A de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à MissionText_CopyBufferB_97C5C (sub_97C5C de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle CRT_Fmemcpy.
; ==============================================================================================
MissionText_CopyBufferB_708EB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di+8]
		sub	ax, [di+4]
		inc	ax
		mov	[si+4], ax
		mov	ax, [di+0Ah]
		sub	ax, [di+6]
		inc	ax
		mov	[si+6], ax
		mov	ax, [si+4]
		sar	ax, 1
		mov	dx, [di+4]
		add	dx, ax
		mov	[si+8], dx
		mov	ax, [si+6]
		sar	ax, 1
		mov	dx, [di+6]
		add	dx, ax
		mov	[si+0Ah], dx
		mov	ax, si
		add	ax, 48h
		push	ds
		push	ax
		or	di, di
		jz	short loc_70936
		mov	ax, di
		add	ax, 4
		jmp	short loc_70938

loc_70936:
		mov	ax, di

loc_70938:
		push	ds
		push	ax
		mov	cx, 8
		call	CRT_Fmemcpy
		pop	di
		pop	si
		pop	bp
		retf
MissionText_CopyBufferB_708EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; MissionText_Helper4_A62D5 (sub_A62D5 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à MissionText_Helper4_C14F9 (sub_C14F9 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à MissionText_Helper4_97CB7 (sub_97CB7 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible (19 lignes).
; ==============================================================================================
MissionText_Helper4_70946		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+5Ch]
		add	ax, 2
		push	ax
		push	si
		push	cs
		call	near ptr MissionText_CopyBufferB_708EB
		add	sp, 4
		pop	si
		pop	bp
		retf
MissionText_Helper4_70946		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; MissionText_Helper5_A62EE (sub_A62EE de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à MissionText_Helper5_C1512 (sub_C1512 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à MissionText_Helper5_97CD0 (sub_97CD0 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, aucun appel
; externe visible (25 lignes).
; ==============================================================================================
MissionText_Helper5_7095F		proc far

var_6		= dword ptr -6
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_6]
		mov	[si], eax
		sub	sp, 4
		mov	eax, [bp+arg_2]
		mov	[bp+var_6], eax
		push	si
		nop
		push	cs
		call	near ptr EntityScreenLayout_PrepareAndCompute
		add	sp, 6
		pop	si
		pop	bp
		retf
MissionText_Helper5_7095F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityScreenLayout_PrepareAndCompute (sub_A6313 de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; EntityScreenLayout_PrepareAndCompute (sub_97CF5 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, 43L, LUE INTEGRALEMENT. RENOMMEE (ancien
; 'MissionText_Helper6' — aucune preuve que ce soit lie a du texte, garde generique en
; attendant confirmation). Appelle EntityScreenLayout_Helper4 (non lue), clampe une valeur
; d'angle/distance a 0x100 si non positive, la stocke sur l'entite (+0x60), puis appelle
; EntityScreenLayout_ComputeAngularPosition.
; ==============================================================================================
EntityScreenLayout_PrepareAndCompute		proc far

var_C		= dword ptr -0Ch
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr MissionText_Helper4_70946
		pop	cx
		cmp	[bp+arg_2], 0
		jg	short loc_709A0
		mov	ax, 1
		jmp	short loc_709A2

loc_709A0:
		xor	ax, ax

loc_709A2:
		or	al, al
		jz	short loc_709B6
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]
		mov	[bp+arg_2], eax

loc_709B6:
		mov	eax, [bp+arg_2]
		mov	[si+5Eh], eax
		push	si
		nop
		push	cs
		call	near ptr EntityScreenLayout_ComputeAngularPosition
		pop	cx
		pop	si
		leave
		retf
EntityScreenLayout_PrepareAndCompute		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 9 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityScreenLayout_ComputeAngularPosition (sub_A6357
; de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityScreenLayout_ComputeAngularPosition (sub_97D39
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 207L, LUE INTEGRALEMENT. RENOMMEE (ancien 'MissionText_ComputeTrigonometricLayout' — le
; calcul trigonometrique est reel et verifie, mais RIEN ne confirme un rendu de texte : garde
; 'EntityScreenLayout' generique, pas 'Text', en attendant de tracer qui consomme le resultat
; +0xC/+0x10). Calcule une position ecran a partir d'un angle (+0x60) et des dimensions de
; l'entite (+4/+6) : plusieurs Sin/Tan/ArcTan enchaines, division par les dimensions, mise a
; l'echelle finale via dword_6E9AA. Ecrit le resultat en +0xC/+0x10 (coordonnees finales) et
; +0x64/0x68/0x6C/0x70/0x74 (valeurs intermediaires). NE DESSINE RIEN elle-meme — calcule
; seulement une position, stockee sur l'objet, consommee ailleurs (non trace).
; ==============================================================================================
EntityScreenLayout_ComputeAngularPosition		proc far

var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= word ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= word ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 7Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 5Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		call	Math_CosDeg_38FF6
		add	sp, 6
		mov	eax, [bp+var_4]
		mov	[si+62h], eax
		mov	ax, [si+4]
		sar	ax, 1
		mov	[bp+var_E], ax
		movsx	eax, [bp+var_E]
		shl	eax, 8
		mov	[bp+var_12], eax
		mov	eax, [bp+var_12]
		mov	[bp+var_C], eax
		mov	ax, [si+6]
		sar	ax, 1
		mov	[bp+var_14], ax
		movsx	eax, [bp+var_14]
		shl	eax, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_8], eax
		push	large 0
		push	eax
		push	large [bp+var_C]
		call	Math_VectorLength3D_Raw_3CA71
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_20], eax
		mov	[bp+var_24], eax
		mov	ax, si
		add	ax, 5Eh
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_28]
		push	ax
		call	sub_39064
		add	sp, 6
		mov	di, si
		mov	eax, [bp+var_28]
		mov	edx, [di]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_24]
		mov	edx, eax
		mov	ecx, [bp+var_30]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_1C], eax
		mov	di, si
		mov	eax, [bp+var_8]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_38], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_3C], eax
		mov	[si+6Eh], eax
		mov	di, si
		mov	eax, [bp+var_C]
		mov	edx, eax
		mov	ecx, [di]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	[si+72h], eax
		mov	ax, si
		add	ax, 6Eh
		push	ax
		push	ss
		lea	ax, [bp+var_48]
		push	ax
		call	Math_ArcTan_3927F
		add	sp, 6
		lea	ax, [bp+var_48]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_4C]
		push	ax
		call	Math_CosDeg_38FF6
		add	sp, 6
		mov	[bp+var_50], 100h
		mov	eax, [bp+var_50]
		mov	edx, eax
		mov	ecx, [bp+var_4C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_54], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_58], eax
		mov	[si+66h], eax
		mov	ax, si
		add	ax, 72h
		push	ax
		push	ss
		lea	ax, [bp+var_5C]
		push	ax
		call	Math_ArcTan_3927F
		add	sp, 6
		lea	ax, [bp+var_5C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_60]
		push	ax
		call	Math_CosDeg_38FF6
		add	sp, 6
		mov	[bp+var_64], 100h
		mov	eax, [bp+var_64]
		mov	edx, eax
		mov	ecx, [bp+var_60]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_68], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_6C], eax
		mov	[si+6Ah], eax
		mov	eax, [si]
		mov	edx, [bp+var_1C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_70], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_74], eax
		mov	[si+0Ch], eax
		mov	eax, [si+0Ch]
		mov	edx, dword_5C386
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_78], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_7C], eax
		mov	[si+10h], eax
		pop	di
		pop	si
		leave
		retf
EntityScreenLayout_ComputeAngularPosition		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70BCD		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_70BCD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_70BD5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_70C00
		push	0
		push	si
		nop
		push	cs
		call	near ptr MissionText_ReleaseStyles_704D5
		add	sp, 4
		test	di, 1
		jz	short loc_70BFE
		push	si
		call	sub_33B
		pop	cx
		jmp	short loc_70C00

loc_70BFE:
		jmp	short loc_70C00

loc_70C00:
		pop	di
		pop	si
		pop	bp
		retf
sub_70BD5		endp
ovr197		ends
