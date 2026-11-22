ovr239		segment	para public 'OVERLAY' use16
		assume cs:ovr239
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AudioQueue_Helper2_AB860 (sub_AB860 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants
; et contexte à revérifier ici. — far, aucun appel externe visible (21 lignes).
; ==============================================================================================
AudioQueue_Helper2_87D90		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+34h], ax
		mov	byte ptr [si+40h], 0
		mov	word ptr [si+41h], 0
		mov	word ptr [si+49h], 0
		mov	word ptr [si+43h], 0
		pop	si
		pop	bp
		retf
AudioQueue_Helper2_87D90		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Speech_StopPlayback_AB883 (sub_AB883 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. —
; Ex-'AudioQueue_OpcodeWrapper_AB883'. far. LUE 2026-10-06. AIL_stop_digital_playback_60366
; sur le pilote voix.
; ==============================================================================================
Speech_StopPlayback_87DB3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+34h], 0
		jz	short loc_87DCE
		mov	bx, [si+34h]
		push	word ptr [bx+4]
		call	sub_9C57
		pop	cx
		jmp	short loc_87DCE

loc_87DCE:
		pop	si
		pop	bp
		retf
Speech_StopPlayback_87DB3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_87DD1		proc far

var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	bx, [bp+arg_2]
		mov	ax, [bx+5Dh]
		mov	[bp+var_2], ax
		push	seg seg027
		push	offset MissionRecord_Helper_1677F
		push	11h
		push	ax
		push	large 0A0000h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_4], ax
		mov	[bp+var_6], 0
		jmp	loc_87EC3

loc_87E07:
		push	[bp+var_6]
		push	[bp+arg_2]
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	bx, [bp+arg_2]
		mov	ax, [bx+6Dh]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_87E29
		mov	eax, [bx+61h]
		jmp	short loc_87E30

loc_87E29:
		mov	bx, [bp+arg_2]
		mov	eax, [bx+71h]

loc_87E30:
		mov	[bp+var_12], eax
		cmp	[bp+var_12], 0
		jnz	short loc_87E3E
		jmp	loc_87EC0

loc_87E3E:
		mov	ax, [bp+var_6]
		imul	ax, ax, 0Ah
		mov	di, [bp+var_4]
		add	di, ax
		mov	eax, [bp+var_12]
		mov	[bp+var_16], eax
		push	0
		push	0
		push	3
		push	eax
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	word ptr [bp+var_1A+2], dx
		mov	word ptr [bp+var_1A], ax
		mov	eax, [bp+var_1A]
		mov	[di], eax
		mov	byte ptr [di+4], 3
		mov	byte ptr [di+5], 1
		mov	dword ptr [di+6], 0
		mov	eax, [bp+var_16]
		mov	[di+6], eax
		cmp	dword ptr [di], 0
		jz	short loc_87ECE
		cmp	byte ptr [di+4], 3
		jnz	short loc_87EAB
		push	0
		mov	al, [di+4]
		push	ax
		push	large [di]
		push	67B0h
		call	Memory_TypedAllocDispatchB_44921
		add	sp, 0Ah
		jmp	short loc_87EB0

loc_87EAB:
		mov	dx, [di+2]
		mov	ax, [di]

loc_87EB0:
		push	dx
		push	ax
		push	[bp+var_6]
		push	[bp+arg_2]
		call	sub_54A85
		add	sp, 8

loc_87EC0:
		inc	[bp+var_6]

loc_87EC3:
		mov	ax, [bp+var_6]
		cmp	ax, [bp+var_2]
		jge	short loc_87ECE
		jmp	loc_87E07

loc_87ECE:
		mov	ax, [si+41h]
		inc	word ptr [si+41h]
		shl	ax, 3
		mov	di, si
		add	di, ax
		add	di, 4
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		mov	ax, [si+45h]
		mov	[bp+var_A], ax
		mov	ax, [si+47h]
		mov	[bp+var_C], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_E], ax
		mov	ax, [bp+var_8]
		mov	[di], ax
		push	[bp+var_A]
		call	CRT_Strdup
		pop	cx
		mov	[di+2], ax
		mov	ax, [bp+var_C]
		mov	[di+4], ax
		mov	ax, [bp+var_E]
		mov	[di+6], ax
		pop	di
		pop	si
		leave
		retf
sub_87DD1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AudioQueue_LoadFromMultipleReaders_AB9D7 (sub_AB9D7 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 118 lignes, NON DÉTAILLÉE —
; combine sub_26F2B, IndexedRecordReader_ConstructVariantB_65A4A,
; IndexedRecordReader_AdvanceIndex_65E2C, IndexedRecordReader_ConstructVariantA_65A1A,
; StreamReader_ConstructAndBind_63B23 (seg190), AudioQueue_ProcessAndDecode_AB8A1,
; IndexedRecordReader_Destruct_659D0 (×2, seg196).
; ==============================================================================================
AudioQueue_LoadFromMultipleReaders_87F17		proc far

var_F8		= word ptr -0F8h
var_80		= word ptr -80h
var_1F		= dword ptr -1Fh
var_1B		= dword ptr -1Bh
var_13		= word ptr -13h
var_F		= dword ptr -0Fh
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0F8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+41h], 6
		jl	short loc_87F2F
		jmp	loc_87FE9

loc_87F2F:
		push	ds
		push	di
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jnz	short loc_87F40
		jmp	loc_87FE9

loc_87F40:
		mov	[si+45h], di
		mov	ax, [bp+arg_4]
		mov	[si+47h], ax
		push	1
		push	di
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	[bp+arg_4]
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_AdvanceIndex_54C22
		add	sp, 4
		mov	eax, [bp+var_1B]
		mov	[bp+var_4], eax
		mov	ax, [bp+var_13]
		and	ax, 0C0h
		cmp	ax, 0C0h
		jnz	short loc_87F80
		mov	eax, [bp+var_1F]
		jmp	short loc_87F84

loc_87F80:
		mov	eax, [bp+var_F]

loc_87F84:
		mov	edx, [bp+var_4]
		add	edx, eax
		mov	[bp+var_8], edx
		mov	eax, [bp+var_4]
		cmp	eax, [bp+var_8]
		jz	short loc_87FDB
		lea	ax, [bp+var_F8]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_54888
		pop	cx
		push	0
		push	large [bp+var_8]
		push	large [bp+var_4]
		lea	ax, [bp+var_80]
		push	ax
		lea	ax, [bp+var_F8]
		push	ax
		call	sub_5252A
		add	sp, 0Eh
		lea	ax, [bp+var_F8]
		push	ax
		push	si
		push	cs
		call	near ptr sub_87DD1
		add	sp, 4
		push	2
		lea	ax, [bp+var_F8]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4

loc_87FDB:
		push	2
		lea	ax, [bp+var_80]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4

loc_87FE9:
		pop	di
		pop	si
		leave
		retf
AudioQueue_LoadFromMultipleReaders_87F17		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; AudioQueue_ReleaseAndCoalesce_ABAAD (sub_ABAAD de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine Speech_StopPlayback_AB883, sub_E77,
; Heap_FreeAndCoalesce_5D30E (seg137).
; ==============================================================================================
AudioQueue_ReleaseAndCoalesce_87FED		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte_5CFF5, 0
		jz	short loc_88049
		cmp	word ptr [si+34h], 0
		jz	short loc_88044
		mov	bx, [si+34h]
		push	word ptr [bx+4]
		call	sub_9C57
		pop	cx
		xor	di, di
		jmp	short loc_8803F

loc_88012:
		push	seg seg017
		push	offset sub_A168
		push	large 190000h
		push	0Ah
		mov	bx, di
		shl	bx, 3
		push	word ptr [bx+si+4]
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		mov	bx, di
		shl	bx, 3
		push	word ptr [bx+si+6]
		call	sub_45058
		pop	cx
		inc	di

loc_8803F:
		cmp	[si+41h], di
		jg	short loc_88012

loc_88044:
		mov	byte_5CFF5, 0

loc_88049:
		pop	di
		pop	si
		pop	bp
		retf
AudioQueue_ReleaseAndCoalesce_87FED		endp
ovr239		ends
