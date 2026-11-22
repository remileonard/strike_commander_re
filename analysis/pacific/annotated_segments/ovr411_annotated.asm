ovr411		segment	para public 'OVERLAY' use16
		assume cs:ovr411
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
ResourceRecord_WriteField_E5B30		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 3
		jmp	short loc_E5B5B

loc_E5B3D:
		mov	eax, [si+65h]
		inc	dword ptr [si+65h]
		push	eax
		push	large 1
		mov	ax, [bp+arg_2]
		add	ax, di
		push	ds
		push	ax
		push	si
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		dec	di

loc_E5B5B:
		or	di, di
		jge	short loc_E5B3D
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_WriteField_E5B30		endp

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
ResourceRecord_WriteFieldGroupA_E5B63		proc far

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
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		lea	ax, word ptr [bp+arg_6]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_E5B30
		add	sp, 4
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupA_E5B63		endp

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
ResourceRecord_WriteFieldGroupB_E5BD3		proc far

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
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		lea	ax, word ptr [bp+arg_6]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_E5B30
		add	sp, 4
		mov	eax, [bp+arg_2]
		mov	[bp+var_8], eax
		push	large [si+65h]
		push	large 4
		push	ss
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	si
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupB_E5BD3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E5C69		proc far

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
		jz	short loc_E5CCD
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
		jmp	short loc_E5CCF

loc_E5CCD:
		mov	ax, di

loc_E5CCF:
		mov	[si+7Ch], ax
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_E5CE4
		push	0B0E0h
		push	si
		call	sub_76675
		add	sp, 4

loc_E5CE4:
		inc	word ptr [si+7Ah]
		pop	di
		pop	si
		leave
		retf
sub_E5C69		endp

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
ResourceRecord_WriteFieldWrapper_E5CEB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupC_E5D31
		pop	cx
		pop	bp
		retf
ResourceRecord_WriteFieldWrapper_E5CEB		endp

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
ResourceRecord_SeekAndRelease_E5CFA		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupD_E5D86
		pop	cx
		push	si
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndRelease_E5CFA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E5D12		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_E5D21

loc_E5D1B:
		push	si
		push	cs
		call	near ptr ResourceRecord_SeekAndRelease_E5CFA
		pop	cx

loc_E5D21:
		cmp	word ptr [si+7Ah], 0
		jg	short loc_E5D1B
		push	si
		call	ResourceRecord_Helper_6D61E
		pop	cx
		pop	si
		pop	bp
		retf
sub_E5D12		endp

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
ResourceRecord_WriteFieldGroupC_E5D31		proc far

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
		call	near ptr ResourceRecord_WriteField_E5B30
		add	sp, 4
		mov	eax, [si+76h]
		mov	[si+65h], eax
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupC_E5D31		endp

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
ResourceRecord_WriteFieldGroupD_E5D86		proc far

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
		call	near ptr ResourceRecord_WriteField_E5B30
		add	sp, 4
		mov	bx, [si+7Ch]
		mov	eax, [bx+0Fh]
		mov	[si+65h], eax
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupD_E5D86		endp

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
ResourceRecord_ReadAndWriteBridge_E5DE1		proc far

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
		jmp	short loc_E5E58

loc_E5DFA:
		mov	eax, [bp+arg_4]
		sub	eax, [bp+var_8]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 400h
		jle	short loc_E5E18
		mov	[bp+var_4], 400h

loc_E5E18:
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	large [di+65h]
		push	eax
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	di
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		mov	eax, [bp+var_C]
		add	[di+65h], eax
		mov	eax, [bp+var_4]
		add	[bp+var_8], eax

loc_E5E58:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+arg_4]
		jl	short loc_E5DFA
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
ResourceRecord_ReadAndWriteBridge_E5DE1		endp

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
ResourceRecord_ReadAndWriteBridgeB_E5E6B		proc far

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
		jmp	short loc_E5EE0

loc_E5E80:
		mov	eax, [bp+arg_4]
		sub	eax, [bp+var_8]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 400h
		jle	short loc_E5E9E
		mov	[bp+var_4], 400h

loc_E5E9E:
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	large [si+65h]
		push	eax
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	si
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		mov	eax, [bp+var_C]
		add	[si+65h], eax
		mov	eax, [bp+var_4]
		add	[bp+var_8], eax

loc_E5EE0:
		mov	eax, [bp+var_8]
		cmp	eax, [bp+arg_4]
		jl	short loc_E5E80
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadAndWriteBridgeB_E5E6B		endp

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
ResourceRecord_BridgeWrapperA_E5EF2		proc far

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
		call	near ptr ResourceRecord_ReadAndWriteBridgeB_E5E6B
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
ResourceRecord_BridgeWrapperA_E5EF2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E5F2C		proc far

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
		call	near ptr ResourceRecord_ReadAndWriteBridge_E5DE1
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_E5F2C		endp

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
ResourceRecord_BridgeWrapperB_E5F45		proc far

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
		call	near ptr ResourceRecord_ReadAndWriteBridgeB_E5E6B
		add	sp, 8
		pop	si
		pop	bp
		retf
ResourceRecord_BridgeWrapperB_E5F45		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E5F65		proc far

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
		call	near ptr ResourceRecord_ReadAndWriteBridge_E5DE1
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_E5F65		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E5F84		proc far

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
		call	near ptr ResourceRecord_WriteFieldGroupA_E5B63
		add	sp, 0Ah
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr ResourceRecord_BridgeWrapperA_E5EF2
		add	sp, 4
		test	word ptr [si+65h], 1
		jz	short loc_E5FE4
		mov	byte ptr [bp+var_7], 0
		push	large [si+65h]
		push	large 1
		push	ss
		lea	ax, [bp+var_7]
		push	ax
		push	si
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		inc	dword ptr [si+65h]

loc_E5FE4:
		pop	di
		pop	si
		leave
		retf
sub_E5F84		endp

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
ResourceRecord_CopyOrTransform_E5FE8		proc far

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
		call	near ptr ResourceRecord_WriteFieldGroupB_E5BD3
		add	sp, 0Ah
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_BridgeWrapperB_E5F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
ResourceRecord_CopyOrTransform_E5FE8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E6023		proc far

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
		jmp	short loc_E6065

loc_E6038:
		push	di
		call	ResourceRecord_ComputeRecordBounds_6D754
		pop	cx
		or	ax, ax
		jnz	short loc_E604B
		push	di
		push	si
		push	cs
		call	near ptr sub_E5F84
		jmp	short loc_E605B

loc_E604B:
		mov	eax, [di+6Dh]
		cmp	eax, [bp+arg_2]
		jz	short loc_E6060
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_CopyOrTransform_E5FE8

loc_E605B:
		add	sp, 4
		jmp	short loc_E6065

loc_E6060:
		mov	[bp+var_2], 1

loc_E6065:
		cmp	[bp+var_2], 0
		jnz	short loc_E6092
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_E607A
		push	di
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_E608E

loc_E607A:
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_E608C
		mov	ax, 1
		jmp	short loc_E608E

loc_E608C:
		xor	ax, ax

loc_E608E:
		or	ax, ax
		jz	short loc_E6038

loc_E6092:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_E6023		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceRecord_CopyChunksUntilTag_3CBF6 (sub_3CBF6 de OPTEST.EXE). Résumé repris de
; OPTEST.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-11-04 (structure).
; Recopie du fichier lu (3e argument) vers le fichier écrit (1er argument) les chunks et FORM
; qui suivent, jusqu'au premier chunk du tag donné (2e argument, dword), non compris. Appelée
; par Training_BuildInstantMission_58EEA.
; ==============================================================================================
ResourceRecord_CopyChunksUntilTag_E6099		proc far

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
		jmp	short loc_E60DB

loc_E60AE:
		push	di
		call	ResourceRecord_ComputeRecordBounds_6D754
		pop	cx
		or	ax, ax
		jz	short loc_E60C1
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_CopyOrTransform_E5FE8
		jmp	short loc_E60D1

loc_E60C1:
		mov	eax, [di+6Dh]
		cmp	eax, [bp+arg_2]
		jz	short loc_E60D6
		push	di
		push	si
		push	cs
		call	near ptr sub_E5F84

loc_E60D1:
		add	sp, 4
		jmp	short loc_E60DB

loc_E60D6:
		mov	[bp+var_2], 1

loc_E60DB:
		cmp	[bp+var_2], 0
		jnz	short loc_E6108
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_E60F0
		push	di
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_E6104

loc_E60F0:
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_E6102
		mov	ax, 1
		jmp	short loc_E6104

loc_E6102:
		xor	ax, ax

loc_E6104:
		or	ax, ax
		jz	short loc_E60AE

loc_E6108:
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
ResourceRecord_CopyChunksUntilTag_E6099		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E610F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		jmp	short loc_E612C

loc_E611C:
		push	di
		call	ResourceRecord_ComputeAlignedBounds_6DC3A
		pop	cx
		push	di
		push	si
		push	cs
		call	near ptr sub_E5F84
		add	sp, 4

loc_E612C:
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_E613B
		push	di
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_E614F

loc_E613B:
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_E614D
		mov	ax, 1
		jmp	short loc_E614F

loc_E614D:
		xor	ax, ax

loc_E614F:
		or	ax, ax
		jz	short loc_E611C
		pop	di
		pop	si
		pop	bp
		retf
sub_E610F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E6157		proc far

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
		call	near ptr ResourceRecord_WriteFieldGroupA_E5B63
		add	sp, 0Ah
		push	[bp+arg_4]
		push	si
		call	ResourceRecord_AdvanceByArrayCount_6DA3A
		add	sp, 4
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupC_E5D31
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
sub_E6157		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E6186		proc far

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
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		push	large [si+98h]
		push	large 4
		push	ds
		mov	ax, si
		add	ax, 9Ch
		push	ax
		push	si
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	dword ptr [si+98h], 4
		pop	si
		leave
		retf
sub_E6186		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_E61E0		proc far

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
		call	StreamReader_WriteTyped_6DFF7
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		mov	eax, [si+0A4h]
		mov	[si+65h], eax
		pop	si
		leave
		retf
sub_E61E0		endp
ovr411		ends
