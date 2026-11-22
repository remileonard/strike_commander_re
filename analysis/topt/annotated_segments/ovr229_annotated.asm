ovr229		segment	para public 'OVERLAY' use16
		assume cs:ovr229
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BBA70		proc far

var_6A		= word ptr -6Ah
var_56		= word ptr -56h
var_6		= dword ptr -6
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 6Ah
		cmp	byte_4C377, 0
		jnz	short loc_BBA80
		jmp	loc_BBDA3

loc_BBA80:
		mov	ax, word_4D36C
		mov	[bp+var_2], ax
		push	[bp+var_2]
		mov	ax, word_49DFA
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_357D1
		add	sp, 4
		push	0
		push	word_49DFA
		call	Widget_Method_Dispatch8_37030
		add	sp, 4
		push	0Ah
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		push	word_4C361
		call	DisplayCache_ComputeChecksum_3325F
		push	ax
		call	DisplayCache_Helper_337CC
		push	dx
		push	ax
		push	word_4C1C9
		push	word_4F26E
		push	3
		push	3979h
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_28185
		add	sp, 6
		push	ax
		push	3D12h
		lea	ax, [bp+var_56]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 12h
		lea	ax, [bp+var_56]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		call	sub_32170
		shl	eax, 10h
		shrd	eax, edx, 10h
		mov	edx, dword_4F47C
		sub	edx, eax
		mov	[bp+var_6], edx
		push	0
		push	3
		push	6C14h
		call	Memory_TypedAllocDispatchC_329EC
		add	sp, 6
		push	dx
		push	ax
		call	sub_32170
		push	dx
		push	ax
		push	large [bp+var_6]
		push	3D47h
		lea	ax, [bp+var_56]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 10h
		push	14h
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		lea	ax, [bp+var_56]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		mov	eax, dword_4F414
		sub	eax, dword_4F410
		push	eax
		mov	eax, dword_4F410
		sub	eax, dword_4F40C
		push	eax
		mov	eax, dword_4F40C
		sub	eax, dword_4F408
		push	eax
		push	large dword_4C6EE
		push	large dword_4C6EA
		push	word_4C6E6
		mov	eax, dword_4F408
		sub	eax, dword_4F404
		push	eax
		mov	eax, dword_4F404
		sub	eax, dword_4F400
		push	eax
		mov	eax, dword_4F414
		sub	eax, dword_4F400
		push	eax
		push	3D74h
		lea	ax, [bp+var_56]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 26h
		push	1Eh
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		lea	ax, [bp+var_56]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		mov	eax, dword_4F42C
		sub	eax, dword_4F428
		push	eax
		mov	eax, dword_4F428
		sub	eax, dword_4F424
		push	eax
		mov	eax, dword_4F424
		sub	eax, dword_4F420
		push	eax
		mov	eax, dword_4F420
		sub	eax, dword_4F41C
		push	eax
		mov	eax, dword_4F42C
		sub	eax, dword_4F41C
		push	eax
		push	3DB1h
		lea	ax, [bp+var_56]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 18h
		push	28h
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		lea	ax, [bp+var_56]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		mov	eax, dword_4F424
		sub	eax, dword_4F438
		push	eax
		mov	eax, dword_4F438
		sub	eax, dword_4F434
		push	eax
		mov	eax, dword_4F434
		sub	eax, dword_4F430
		push	eax
		mov	eax, dword_4F430
		sub	eax, dword_4F420
		push	eax
		mov	eax, dword_4F424
		sub	eax, dword_4F420
		push	eax
		push	3DDBh
		lea	ax, [bp+var_56]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 18h
		push	32h
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		lea	ax, [bp+var_56]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		push	word_4F464
		push	word_4F466
		push	large dword_4F43C
		push	large dword_4F444
		push	large dword_4F440
		push	large dword_4F448
		mov	eax, dword_4F420
		sub	eax, dword_4F41C
		push	eax
		push	3E05h
		lea	ax, [bp+var_56]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 1Ch
		push	3Ch
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		lea	ax, [bp+var_56]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		mov	ax, word_4F478
		sub	ax, word_4F474
		push	ax
		mov	ax, word_4F474
		sub	ax, word_4F470
		push	ax
		mov	ax, word_4F46C
		sub	ax, word_4F468
		push	ax
		mov	ax, word_4F460
		sub	ax, word_4F45C
		push	ax
		push	3E3Fh
		lea	ax, [bp+var_56]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		push	46h
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		lea	ax, [bp+var_56]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4
		xor	ax, ax
		mov	word_4F466, ax
		mov	word_4F464, ax
		xor	eax, eax
		mov	dword_4C6EA, eax
		mov	dword ptr word_4C6E6, eax
		call	sub_42181
		push	dx
		push	ax
		push	large dword_4DCE8
		push	3E5Fh
		lea	ax, [bp+var_56]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		push	6Eh
		push	0
		push	word_49DFA
		call	Widget_ComputeBoundsExtent_372DC
		add	sp, 6
		lea	ax, [bp+var_56]
		push	ax
		push	word_49DFA
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 4

loc_BBDA3:
		leave
		retf
sub_BBA70		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_RegisterAndSelect (sub_7AFA8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 20L, LUE INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_UpdateEntry'). CONFIRME DIRECTEMENT
; 0x59CD comme adresse de la liste globale trackee : ajoute l'entite passee en parametre a
; cette liste (EntityTracker_AddEntryObj) PUIS l'applique comme selection active
; (EntityTracker_ApplySelection). Appelee depuis MissionRecord_LoadEntityDatabase_7B035 —
; candidat serieux pour la fonction qui peuple cette liste avec les entites de la mission, a
; lire.
; ==============================================================================================
EntityTracker_RegisterAndSelect		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	cs
		call	near ptr sub_BBA70
		add	sp, 2
		push	si
		push	6947h
		call	sub_24DA7
		add	sp, 4
		pop	si
		pop	bp
		retf
EntityTracker_RegisterAndSelect		endp
ovr229		ends
