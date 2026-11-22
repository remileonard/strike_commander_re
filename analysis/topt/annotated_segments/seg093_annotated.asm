seg093		segment	para public 'CODE' use16
		assume cs:seg093
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_WriteField_3C68D (sub_3C68D de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ResourceRecord_WriteField_64E1D (sub_64E1D de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, écrit un champ typé via
; sub_6568F (seg195). Appelée par sub_64E50, sub_64EC0, sub_6501E, sub_65073.
; ==============================================================================================
ResourceRecord_WriteField_300F0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 3
		jmp	short loc_3011B

loc_300FD:
		mov	eax, [si+65h]
		inc	dword ptr [si+65h]
		push	eax
		push	large 1
		mov	ax, [bp+arg_2]
		add	ax, di
		push	ds
		push	ax
		push	si
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		dec	di

loc_3011B:
		or	di, di
		jge	short loc_300FD
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_WriteField_300F0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_WriteFieldGroupA_3C6C0 (sub_3C6C0 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldGroupA_64E50 (sub_64E50 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_6568F et
; ResourceRecord_WriteField_64E1D — écriture d'un groupe de champs.
; ==============================================================================================
ResourceRecord_WriteFieldGroupA_30123		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+69h], eax
		mov	eax, [bp+arg_2]
		mov	[si+6Dh], eax
		mov	eax, [bp+arg_6]
		mov	[si+72h], eax
		mov	ax, word ptr [bp+arg_6]
		and	ax, 1
		movsx	eax, ax
		mov	edx, [bp+arg_6]
		add	edx, eax
		add	edx, [si+65h]
		add	edx, 4
		mov	[si+76h], edx
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	large [si+65h]
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		lea	ax, word ptr [bp+arg_6]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_300F0
		add	sp, 4
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupA_30123		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 5 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_WriteFieldGroupB_3C730 (sub_3C730 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldGroupB_64EC0 (sub_64EC0 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_6568F (×2) et
; ResourceRecord_WriteField_64E1D.
; ==============================================================================================
ResourceRecord_WriteFieldGroupB_30193		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= dword ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+69h], eax
		mov	eax, [bp+arg_2]
		mov	[si+6Dh], eax
		mov	eax, [bp+arg_6]
		add	eax, 4
		mov	[si+72h], eax
		mov	ax, word ptr [bp+arg_6]
		and	ax, 1
		movsx	eax, ax
		mov	edx, [bp+arg_6]
		add	edx, eax
		add	edx, [si+65h]
		add	edx, 0Ch
		mov	[si+76h], edx
		mov	[bp+var_4], 4D524F46h
		push	large [si+65h]
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		lea	ax, word ptr [bp+arg_6]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_300F0
		add	sp, 4
		mov	eax, [bp+arg_2]
		mov	[bp+var_8], eax
		push	large [si+65h]
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	si
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupB_30193		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30229		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+7Ch]
		mov	[bp+var_2], ax
		mov	ax, si
		add	ax, 69h
		mov	[bp+var_4], ax
		push	13h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_3028D
		mov	ax, [bp+var_2]
		mov	[di], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[di+2], eax
		mov	eax, [bx+9]
		mov	[di+0Bh], eax
		push	4
		mov	ax, [bp+var_4]
		add	ax, 4
		push	ax
		mov	ax, di
		add	ax, 6
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [bp+var_4]
		mov	eax, [bx+0Dh]
		mov	[di+0Fh], eax
		mov	ax, di
		jmp	short loc_3028F

loc_3028D:
		mov	ax, di

loc_3028F:
		mov	[si+7Ch], ax
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_302A4
		push	0B0E0h
		push	si
		call	DisplayContext_CommitFrameWithTag_300C1
		add	sp, 4

loc_302A4:
		inc	word ptr [si+7Ah]
		pop	di
		pop	si
		leave
		retf
sub_30229		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldWrapper_3C848 (sub_3C848 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_WriteFieldWrapper_64FD8 (sub_64FD8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; enveloppe appelant sub_6501E. Référencée par sub_A8F22.
; ==============================================================================================
ResourceRecord_WriteFieldWrapper_302AB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupC_302F1
		pop	cx
		pop	bp
		retf
ResourceRecord_WriteFieldWrapper_302AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_SeekAndRelease_3C857 (sub_3C857 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ResourceRecord_SeekAndRelease_64FE7 (sub_64FE7 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine sub_65073 et
; ResourceRecord_ReleaseAndClear_64D25.
; ==============================================================================================
ResourceRecord_SeekAndRelease_302BA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupD_30346
		pop	cx
		push	si
		call	ResourceRecord_ReleaseAndClear_42D38
		pop	cx
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndRelease_302BA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_302D2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_302E1

loc_302DB:
		push	si
		push	cs
		call	near ptr ResourceRecord_SeekAndRelease_302BA
		pop	cx

loc_302E1:
		cmp	word ptr [si+7Ah], 0
		jg	short loc_302DB
		push	si
		call	ResourceRecord_Helper_425B8
		pop	cx
		pop	si
		pop	bp
		retf
sub_302D2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_WriteFieldGroupC_3C88E (sub_3C88E de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldGroupC_6501E (sub_6501E de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine ResourceRecord_WriteField_64E1D
; (×2). Référencée par sub_64FD8.
; ==============================================================================================
ResourceRecord_WriteFieldGroupC_302F1		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	edx, [si+69h]
		add	edx, 8
		sub	eax, edx
		mov	[bp+var_4], eax
		mov	ax, [si+65h]
		and	ax, 1
		movsx	eax, ax
		mov	edx, [si+65h]
		add	edx, eax
		mov	[si+76h], edx
		mov	eax, [si+69h]
		add	eax, 4
		mov	[si+65h], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_300F0
		add	sp, 4
		mov	eax, [si+76h]
		mov	[si+65h], eax
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupC_302F1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_WriteFieldGroupD_3C8E3 (sub_3C8E3 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldGroupD_65073 (sub_65073 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine ResourceRecord_WriteField_64E1D
; (×2). Référencée par sub_64FE7.
; ==============================================================================================
ResourceRecord_WriteFieldGroupD_30346		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		mov	edx, [bx+2]
		add	edx, 8
		sub	eax, edx
		mov	[bp+var_4], eax
		mov	ax, [si+65h]
		and	ax, 1
		movsx	eax, ax
		mov	edx, [si+65h]
		add	edx, eax
		mov	[bx+0Fh], edx
		mov	eax, [bx+2]
		add	eax, 4
		mov	[si+65h], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_300F0
		add	sp, 4
		mov	bx, [si+7Ch]
		mov	eax, [bx+0Fh]
		mov	[si+65h], eax
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupD_30346		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_ReadAndWriteBridge_3C93E (sub_3C93E de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadAndWriteBridge_650CE (sub_650CE de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 88 lignes, NON DÉTAILLÉE —
; combine ResourceRecord_ReadFieldGroupA_64A19 (seg193) et sub_6568F — pont lecture/écriture
; entre deux enregistrements.
; ==============================================================================================
ResourceRecord_ReadAndWriteBridge_303A1		proc far

var_40C		= word ptr -40Ch
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 40Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_8], 0
		jmp	short loc_30418

loc_303BA:
		mov	eax, [bp+arg_4]
		sub	eax, [bp+var_8]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 400h
		jle	short loc_303D8
		mov	[bp+var_4], 400h

loc_303D8:
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	large [di+65h]
		push	eax
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	di
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		mov	eax, [bp+var_C]
		add	[di+65h], eax
		mov	eax, [bp+var_4]
		add	[bp+var_8], eax

loc_30418:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+arg_4]
		jl	short loc_303BA
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
ResourceRecord_ReadAndWriteBridge_303A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_ReadAndWriteBridgeB_3C9C8 (sub_3C9C8 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadAndWriteBridgeB_65158 (sub_65158 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 78 lignes, NON DÉTAILLÉE —
; variante de ResourceRecord_ReadAndWriteBridge_650CE.
; ==============================================================================================
ResourceRecord_ReadAndWriteBridgeB_3042B		proc far

var_40C		= word ptr -40Ch
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 40Ch
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_8], 0
		jmp	short loc_304A0

loc_30440:
		mov	eax, [bp+arg_4]
		sub	eax, [bp+var_8]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 400h
		jle	short loc_3045E
		mov	[bp+var_4], 400h

loc_3045E:
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_42A2C
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	large [si+65h]
		push	eax
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	si
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		mov	eax, [bp+var_C]
		add	[si+65h], eax
		mov	eax, [bp+var_4]
		add	[bp+var_8], eax

loc_304A0:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+arg_4]
		jl	short loc_30440
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadAndWriteBridgeB_3042B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_BridgeWrapperA_3CA4F (sub_3CA4F de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_BridgeWrapperA_651DF (sub_651DF de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle
; ResourceRecord_ReadAndWriteBridgeB_65158. Appelée par sub_652D5.
; ==============================================================================================
ResourceRecord_BridgeWrapperA_304B2		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	large [si+72h]
		push	si
		push	ax
		push	cs
		call	near ptr ResourceRecord_ReadAndWriteBridgeB_3042B
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_BridgeWrapperA_304B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_304EC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [si+72h]
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadAndWriteBridge_303A1
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_304EC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_BridgeWrapperB_3CAA2 (sub_3CAA2 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à ResourceRecord_BridgeWrapperB_65232 (sub_65232 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; ResourceRecord_ReadAndWriteBridgeB_65158. Appelée par sub_652D5.
; ==============================================================================================
ResourceRecord_BridgeWrapperB_30505		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	eax, [si+72h]
		add	eax, 0FFFFFFFCh
		push	eax
		push	si
		push	dx
		push	cs
		call	near ptr ResourceRecord_ReadAndWriteBridgeB_3042B
		add	sp, 8
		pop	si
		pop	bp
		retf
ResourceRecord_BridgeWrapperB_30505		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30525		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+72h]
		add	eax, 0FFFFFFFCh
		push	eax
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadAndWriteBridge_303A1
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_30525		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30544		proc far

var_7		= word ptr -7
var_6		= dword ptr -6
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
		add	di, 69h
		mov	ax, di
		add	ax, 4
		mov	[bp+var_2], ax
		mov	eax, [di+9]
		mov	[bp+var_6], eax
		push	eax
		mov	bx, [bp+var_2]
		push	large [bx]
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr ResourceRecord_BridgeWrapperA_304B2
		add	sp, 4
		test	word ptr [si+65h], 1
		jz	short loc_305A4
		mov	byte ptr [bp+var_7], 0
		push	large [si+65h]
		push	large 1
		push	ss
		lea	ax, [bp+var_7]
		push	ax
		push	si
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		inc	dword ptr [si+65h]

loc_305A4:
		pop	di
		pop	si
		leave
		retf
sub_30544		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceRecord_CopyOrTransform_3CB45 (sub_3CB45 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_CopyOrTransform_652D5 (sub_652D5 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — ⚠️ far, 38 lignes, NON DÉTAILLÉE — combine
; ResourceRecord_BridgeWrapperA_651DF/B_65232 (sélection selon condition) — copie ou
; transformation d'un enregistrement vers un autre format.
; ==============================================================================================
ResourceRecord_CopyOrTransform_305A8		proc far

var_6		= dword ptr -6
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
		mov	ax, di
		add	ax, 6Dh
		mov	[bp+var_2], ax
		mov	eax, [di+72h]
		mov	[bp+var_6], eax
		push	eax
		mov	bx, [bp+var_2]
		push	large [bx]
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupB_30193
		add	sp, 0Ah
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_BridgeWrapperB_30505
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
ResourceRecord_CopyOrTransform_305A8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_305E3		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		mov	[bp+var_2], 0
		jmp	short loc_30625

loc_305F8:
		push	di
		call	ResourceRecord_ComputeRecordBounds_426EE
		pop	cx
		or	ax, ax
		jnz	short loc_3060B
		push	di
		push	si
		push	cs
		call	near ptr sub_30544
		jmp	short loc_3061B

loc_3060B:
		mov	eax, [di+6Dh]
		cmp	eax, [bp+arg_2]
		jz	short loc_30620
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_CopyOrTransform_305A8

loc_3061B:
		add	sp, 4
		jmp	short loc_30625

loc_30620:
		mov	[bp+var_2], 1

loc_30625:
		cmp	[bp+var_2], 0
		jnz	short loc_30652
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_3063A
		push	di
		call	ResourceRecord_ReadPayload_42DC6
		pop	cx
		jmp	short loc_3064E

loc_3063A:
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_3064C
		mov	ax, 1
		jmp	short loc_3064E

loc_3064C:
		xor	ax, ax

loc_3064E:
		or	ax, ax
		jz	short loc_305F8

loc_30652:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_305E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30659		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		mov	[bp+var_2], 0
		jmp	short loc_3069B

loc_3066E:
		push	di
		call	ResourceRecord_ComputeRecordBounds_426EE
		pop	cx
		or	ax, ax
		jz	short loc_30681
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_CopyOrTransform_305A8
		jmp	short loc_30691

loc_30681:
		mov	eax, [di+6Dh]
		cmp	eax, [bp+arg_2]
		jz	short loc_30696
		push	di
		push	si
		push	cs
		call	near ptr sub_30544

loc_30691:
		add	sp, 4
		jmp	short loc_3069B

loc_30696:
		mov	[bp+var_2], 1

loc_3069B:
		cmp	[bp+var_2], 0
		jnz	short loc_306C8
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_306B0
		push	di
		call	ResourceRecord_ReadPayload_42DC6
		pop	cx
		jmp	short loc_306C4

loc_306B0:
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_306C2
		mov	ax, 1
		jmp	short loc_306C4

loc_306C2:
		xor	ax, ax

loc_306C4:
		or	ax, ax
		jz	short loc_3066E

loc_306C8:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_30659		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_306CF		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		jmp	short loc_306EC

loc_306DC:
		push	di
		call	ResourceRecord_ComputeAlignedBounds_42BD4
		pop	cx
		push	di
		push	si
		push	cs
		call	near ptr sub_30544
		add	sp, 4

loc_306EC:
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_306FB
		push	di
		call	ResourceRecord_ReadPayload_42DC6
		pop	cx
		jmp	short loc_3070F

loc_306FB:
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_3070D
		mov	ax, 1
		jmp	short loc_3070F

loc_3070D:
		xor	ax, ax

loc_3070F:
		or	ax, ax
		jz	short loc_306DC
		pop	di
		pop	si
		pop	bp
		retf
sub_306CF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30717		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	large 0
		push	large [di]
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupA_30123
		add	sp, 0Ah
		push	[bp+arg_4]
		push	si
		call	ResourceRecord_AdvanceByArrayCount_429D4
		add	sp, 4
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupC_302F1
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
sub_30717		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_30746		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+9Ch], eax
		xor	eax, eax
		mov	[si+0A0h], eax
		mov	[bp+var_4], eax
		push	large [si+65h]
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		push	large [si+98h]
		push	large 4
		push	ds
		mov	ax, si
		add	ax, 9Ch
		push	ax
		push	si
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	dword ptr [si+98h], 4
		pop	si
		leave
		retf
sub_30746		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_307A0		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+0A4h], eax
		mov	eax, [si+0A4h]
		mov	edx, [si+9Ch]
		add	edx, 4
		sub	eax, edx
		mov	[si+0A0h], eax
		mov	eax, [si+9Ch]
		mov	[si+65h], eax
		mov	eax, [si+0A0h]
		mov	[bp+var_4], eax
		push	large [si+65h]
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	si
		call	StreamReader_WriteTyped_42F91
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		mov	eax, [si+0A4h]
		mov	[si+65h], eax
		pop	si
		leave
sub_307A0		endp
seg093		ends
