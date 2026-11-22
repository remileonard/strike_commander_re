ovr256		segment	para public 'OVERLAY' use16
		assume cs:ovr256
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_WriteField_E5B30 (sub_E5B30 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ;
; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique instruction
; par instruction à ResourceRecord_WriteField_3C68D (sub_3C68D de OPTEST.EXE). Résumé repris
; de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_WriteField_64E1D (sub_64E1D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; écrit un champ typé via sub_6568F (seg195). Appelée par sub_64E50, sub_64EC0, sub_6501E,
; sub_65073.
; ==============================================================================================
ResourceRecord_WriteField_89690		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 3
		jmp	short loc_896BB

loc_8969D:
		mov	eax, [si+65h]
		inc	dword ptr [si+65h]
		push	eax
		push	large 1
		mov	ax, [bp+arg_2]
		add	ax, di
		push	ds
		push	ax
		push	si
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		dec	di

loc_896BB:
		or	di, di
		jge	short loc_8969D
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_WriteField_89690		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldGroupA_E5B63 (sub_E5B63 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 3 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à ResourceRecord_WriteFieldGroupA_3C6C0 (sub_3C6C0 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_WriteFieldGroupA_64E50 (sub_64E50 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_6568F et ResourceRecord_WriteField_64E1D — écriture d'un groupe de champs.
; ==============================================================================================
ResourceRecord_WriteFieldGroupA_896C3		proc far

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
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		lea	ax, word ptr [bp+arg_6]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_89690
		add	sp, 4
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupA_896C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldGroupB_E5BD3 (sub_E5BD3 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 5 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à ResourceRecord_WriteFieldGroupB_3C730 (sub_3C730 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_WriteFieldGroupB_64EC0 (sub_64EC0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine sub_6568F (×2) et ResourceRecord_WriteField_64E1D.
; ==============================================================================================
ResourceRecord_WriteFieldGroupB_89733		proc far

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
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		lea	ax, word ptr [bp+arg_6]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_89690
		add	sp, 4
		mov	eax, [bp+arg_2]
		mov	[bp+var_8], eax
		push	large [si+65h]
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	si
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupB_89733		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_897C9		proc far

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
		jz	short loc_8982D
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
		jmp	short loc_8982F

loc_8982D:
		mov	ax, di

loc_8982F:
		mov	[si+7Ch], ax
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_89844
		push	0B0E0h
		push	si
		call	sub_59C05
		add	sp, 4

loc_89844:
		inc	word ptr [si+7Ah]
		pop	di
		pop	si
		leave
		retf
sub_897C9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldWrapper_E5CEB (sub_E5CEB de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à ResourceRecord_WriteFieldWrapper_3C848 (sub_3C848 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise
; de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldWrapper_64FD8 (sub_64FD8 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enveloppe appelant sub_6501E.
; Référencée par sub_A8F22.
; ==============================================================================================
ResourceRecord_WriteFieldWrapper_8984B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupC_89891
		pop	cx
		pop	bp
		retf
ResourceRecord_WriteFieldWrapper_8984B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_SeekAndRelease_E5CFA (sub_E5CFA de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à ResourceRecord_SeekAndRelease_3C857 (sub_3C857 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_SeekAndRelease_64FE7 (sub_64FE7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_65073 et
; ResourceRecord_ReleaseAndClear_64D25.
; ==============================================================================================
ResourceRecord_SeekAndRelease_8985A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupD_898E6
		pop	cx
		push	si
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndRelease_8985A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89872		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_89881

loc_8987B:
		push	si
		push	cs
		call	near ptr ResourceRecord_SeekAndRelease_8985A
		pop	cx

loc_89881:
		cmp	word ptr [si+7Ah], 0
		jg	short loc_8987B
		push	si
		call	ResourceRecord_Helper_53B24
		pop	cx
		pop	si
		pop	bp
		retf
sub_89872		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldGroupC_E5D31 (sub_E5D31 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à ResourceRecord_WriteFieldGroupC_3C88E (sub_3C88E de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_WriteFieldGroupC_6501E (sub_6501E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine ResourceRecord_WriteField_64E1D (×2). Référencée par sub_64FD8.
; ==============================================================================================
ResourceRecord_WriteFieldGroupC_89891		proc far

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
		call	near ptr ResourceRecord_WriteField_89690
		add	sp, 4
		mov	eax, [si+76h]
		mov	[si+65h], eax
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupC_89891		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldGroupD_E5D86 (sub_E5D86 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à ResourceRecord_WriteFieldGroupD_3C8E3 (sub_3C8E3 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_WriteFieldGroupD_65073 (sub_65073 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; combine ResourceRecord_WriteField_64E1D (×2). Référencée par sub_64FE7.
; ==============================================================================================
ResourceRecord_WriteFieldGroupD_898E6		proc far

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
		call	near ptr ResourceRecord_WriteField_89690
		add	sp, 4
		mov	bx, [si+7Ch]
		mov	eax, [bx+0Fh]
		mov	[si+65h], eax
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupD_898E6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_ReadAndWriteBridge_E5DE1 (sub_E5DE1 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à ResourceRecord_ReadAndWriteBridge_3C93E (sub_3C93E de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_ReadAndWriteBridge_650CE (sub_650CE
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️
; far, 88 lignes, NON DÉTAILLÉE — combine ResourceRecord_ReadFieldGroupA_64A19 (seg193) et
; sub_6568F — pont lecture/écriture entre deux enregistrements.
; ==============================================================================================
ResourceRecord_ReadAndWriteBridge_89941		proc far

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
		jmp	short loc_899B8

loc_8995A:
		mov	eax, [bp+arg_4]
		sub	eax, [bp+var_8]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 400h
		jle	short loc_89978
		mov	[bp+var_4], 400h

loc_89978:
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	large [di+65h]
		push	eax
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	di
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		mov	eax, [bp+var_C]
		add	[di+65h], eax
		mov	eax, [bp+var_4]
		add	[bp+var_8], eax

loc_899B8:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+arg_4]
		jl	short loc_8995A
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
ResourceRecord_ReadAndWriteBridge_89941		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_ReadAndWriteBridgeB_E5E6B (sub_E5E6B de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à ResourceRecord_ReadAndWriteBridgeB_3C9C8 (sub_3C9C8 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_ReadAndWriteBridgeB_65158 (sub_65158
; de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️
; far, 78 lignes, NON DÉTAILLÉE — variante de ResourceRecord_ReadAndWriteBridge_650CE.
; ==============================================================================================
ResourceRecord_ReadAndWriteBridgeB_899CB		proc far

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
		jmp	short loc_89A40

loc_899E0:
		mov	eax, [bp+arg_4]
		sub	eax, [bp+var_8]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 400h
		jle	short loc_899FE
		mov	[bp+var_4], 400h

loc_899FE:
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_53F98
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	large [si+65h]
		push	eax
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	si
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		mov	eax, [bp+var_C]
		add	[si+65h], eax
		mov	eax, [bp+var_4]
		add	[bp+var_8], eax

loc_89A40:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+arg_4]
		jl	short loc_899E0
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadAndWriteBridgeB_899CB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_BridgeWrapperA_E5EF2 (sub_E5EF2 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à ResourceRecord_BridgeWrapperA_3CA4F (sub_3CA4F de OPTEST.EXE). Résumé repris de OPTEST.EXE
; ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique
; instruction par instruction à ResourceRecord_BridgeWrapperA_651DF (sub_651DF de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, appelle
; ResourceRecord_ReadAndWriteBridgeB_65158. Appelée par sub_652D5.
; ==============================================================================================
ResourceRecord_BridgeWrapperA_89A52		proc far

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
		call	near ptr ResourceRecord_ReadAndWriteBridgeB_899CB
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
ResourceRecord_BridgeWrapperA_89A52		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89A8C		proc far

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
		call	near ptr ResourceRecord_ReadAndWriteBridge_89941
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_89A8C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_BridgeWrapperB_E5F45 (sub_E5F45 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE
; ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code identique
; instruction par instruction à ResourceRecord_BridgeWrapperB_3CAA2 (sub_3CAA2 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_BridgeWrapperB_65232 (sub_65232 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle
; ResourceRecord_ReadAndWriteBridgeB_65158. Appelée par sub_652D5.
; ==============================================================================================
ResourceRecord_BridgeWrapperB_89AA5		proc far

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
		call	near ptr ResourceRecord_ReadAndWriteBridgeB_899CB
		add	sp, 8
		pop	si
		pop	bp
		retf
ResourceRecord_BridgeWrapperB_89AA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89AC5		proc far

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
		call	near ptr ResourceRecord_ReadAndWriteBridge_89941
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_89AC5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89AE4		proc far

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
		call	near ptr ResourceRecord_WriteFieldGroupA_896C3
		add	sp, 0Ah
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr ResourceRecord_BridgeWrapperA_89A52
		add	sp, 4
		test	word ptr [si+65h], 1
		jz	short loc_89B44
		mov	byte ptr [bp+var_7], 0
		push	large [si+65h]
		push	large 1
		push	ss
		lea	ax, [bp+var_7]
		push	ax
		push	si
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		inc	dword ptr [si+65h]

loc_89B44:
		pop	di
		pop	si
		leave
		retf
sub_89AE4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_CopyOrTransform_E5FE8 (sub_E5FE8 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : même suite
; d'instructions, 1 opérande(s) différent(s) (adresses de données ou constantes) — à vérifier
; à ResourceRecord_CopyOrTransform_3CB45 (sub_3CB45 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code
; identique instruction par instruction à ResourceRecord_CopyOrTransform_652D5 (sub_652D5 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far,
; 38 lignes, NON DÉTAILLÉE — combine ResourceRecord_BridgeWrapperA_651DF/B_65232 (sélection
; selon condition) — copie ou transformation d'un enregistrement vers un autre format.
; ==============================================================================================
ResourceRecord_CopyOrTransform_89B48		proc far

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
		call	near ptr ResourceRecord_WriteFieldGroupB_89733
		add	sp, 0Ah
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_BridgeWrapperB_89AA5
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
ResourceRecord_CopyOrTransform_89B48		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89B83		proc far

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
		jmp	short loc_89BC5

loc_89B98:
		push	di
		call	ResourceRecord_ComputeRecordBounds_53C5A
		pop	cx
		or	ax, ax
		jnz	short loc_89BAB
		push	di
		push	si
		push	cs
		call	near ptr sub_89AE4
		jmp	short loc_89BBB

loc_89BAB:
		mov	eax, [di+6Dh]
		cmp	eax, [bp+arg_2]
		jz	short loc_89BC0
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_CopyOrTransform_89B48

loc_89BBB:
		add	sp, 4
		jmp	short loc_89BC5

loc_89BC0:
		mov	[bp+var_2], 1

loc_89BC5:
		cmp	[bp+var_2], 0
		jnz	short loc_89BF2
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_89BDA
		push	di
		call	ResourceRecord_ReadPayload_54332
		pop	cx
		jmp	short loc_89BEE

loc_89BDA:
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_89BEC
		mov	ax, 1
		jmp	short loc_89BEE

loc_89BEC:
		xor	ax, ax

loc_89BEE:
		or	ax, ax
		jz	short loc_89B98

loc_89BF2:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_89B83		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : code identique instruction par instruction à
; ResourceRecord_CopyChunksUntilTag_E6099 (sub_E6099 de PACIFIC.EXE). Résumé repris de
; PACIFIC.EXE ; appelants et contexte à revérifier ici. — Reprise de OPTEST.EXE : code
; identique instruction par instruction à ResourceRecord_CopyChunksUntilTag_3CBF6 (sub_3CBF6
; de OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-11-04 (structure). Recopie du fichier lu (3e argument) vers le fichier écrit (1er
; argument) les chunks et FORM qui suivent, jusqu'au premier chunk du tag donné (2e argument,
; dword), non compris. Appelée par Training_BuildInstantMission_58EEA.
; ==============================================================================================
ResourceRecord_CopyChunksUntilTag_89BF9		proc far

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
		jmp	short loc_89C3B

loc_89C0E:
		push	di
		call	ResourceRecord_ComputeRecordBounds_53C5A
		pop	cx
		or	ax, ax
		jz	short loc_89C21
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_CopyOrTransform_89B48
		jmp	short loc_89C31

loc_89C21:
		mov	eax, [di+6Dh]
		cmp	eax, [bp+arg_2]
		jz	short loc_89C36
		push	di
		push	si
		push	cs
		call	near ptr sub_89AE4

loc_89C31:
		add	sp, 4
		jmp	short loc_89C3B

loc_89C36:
		mov	[bp+var_2], 1

loc_89C3B:
		cmp	[bp+var_2], 0
		jnz	short loc_89C68
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_89C50
		push	di
		call	ResourceRecord_ReadPayload_54332
		pop	cx
		jmp	short loc_89C64

loc_89C50:
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_89C62
		mov	ax, 1
		jmp	short loc_89C64

loc_89C62:
		xor	ax, ax

loc_89C64:
		or	ax, ax
		jz	short loc_89C0E

loc_89C68:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
ResourceRecord_CopyChunksUntilTag_89BF9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89C6F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		jmp	short loc_89C8C

loc_89C7C:
		push	di
		call	ResourceRecord_ComputeAlignedBounds_54140
		pop	cx
		push	di
		push	si
		push	cs
		call	near ptr sub_89AE4
		add	sp, 4

loc_89C8C:
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_89C9B
		push	di
		call	ResourceRecord_ReadPayload_54332
		pop	cx
		jmp	short loc_89CAF

loc_89C9B:
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_89CAD
		mov	ax, 1
		jmp	short loc_89CAF

loc_89CAD:
		xor	ax, ax

loc_89CAF:
		or	ax, ax
		jz	short loc_89C7C
		pop	di
		pop	si
		pop	bp
		retf
sub_89C6F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89CB7		proc far

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
		call	near ptr ResourceRecord_WriteFieldGroupA_896C3
		add	sp, 0Ah
		push	[bp+arg_4]
		push	si
		call	ResourceRecord_AdvanceByArrayCount_53F40
		add	sp, 4
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupC_89891
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
sub_89CB7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89CE6		proc far

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
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		push	large [si+98h]
		push	large 4
		push	ds
		mov	ax, si
		add	ax, 9Ch
		push	ax
		push	si
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	dword ptr [si+98h], 4
		pop	si
		leave
		retf
sub_89CE6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_89D40		proc far

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
		call	StreamReader_WriteTyped_544FD
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		mov	eax, [si+0A4h]
		mov	[si+65h], eax
		pop	si
		leave
		retf
sub_89D40		endp
ovr256		ends
