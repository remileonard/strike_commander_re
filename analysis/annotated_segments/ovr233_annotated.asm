ovr233		segment	para public 'OVERLAY' use16
		assume cs:ovr233
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 275 lignes, NON DÉTAILLÉE — appelle Pilot_LowLevelControlCommand — émission de
; commande de pilotage bas niveau.
; ==============================================================================================
Pilot_IssueControlCommand_79DA0	proc far		; CODE XREF: VROOMM_StubThunk_6AC8AJ UIScript_ParseAndEvaluate_7A054+3F0p ...

var_A8		= dword	ptr -0A8h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 0A0h
		push	si
		push	di
		mov	di, [bp+arg_6]
		mov	cx, [bp+arg_C]
		mov	[bp+var_2], 64h	; 'd'
		or	cx, cx
		jz	short loc_79DBB
		shl	[bp+var_2], 1

loc_79DBB:				; CODE XREF: Pilot_IssueControlCommand_79DA0+16j
		mov	si, di
		mov	eax, [si]
		mov	[bp+var_64], eax
		mov	eax, [si+4]
		mov	[bp+var_60], eax
		mov	eax, [si+8]
		mov	[bp+var_5C], eax
		mov	ax, [bp+var_2]
		mov	[bp+var_4], ax
		movsx	eax, [bp+var_4]
		shl	eax, 8

loc_79DE3:
		mov	[bp+var_8], eax
		mov	eax, [bp+var_64]
		mov	edx, [bp+var_8]
		imul	edx

loc_79DF2:
		shrd	eax, edx, 8
		mov	[bp+var_64], eax
		mov	eax, [bp+var_60]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_60], eax
		mov	eax, [bp+var_5C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_5C], eax
		mov	[bp+var_A], 0FFCEh
		or	cx, cx
		jz	short loc_79E2F
		shl	[bp+var_A], 1

loc_79E2F:				; CODE XREF: Pilot_IssueControlCommand_79DA0+8Aj
		mov	si, di
		add	si, 0Ch
		mov	eax, [si]
		mov	[bp+var_70], eax
		mov	eax, [si+4]
		mov	[bp+var_6C], eax
		mov	eax, [si+8]
		mov	[bp+var_68], eax
		mov	ax, [bp+var_A]
		mov	[bp+var_C], ax
		movsx	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_70]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8

loc_79E6E:
		mov	[bp+var_70], eax
		mov	eax, [bp+var_6C]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_68]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_68], eax
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_7C], eax
		mov	eax, [si+4]
		mov	[bp+var_78], eax
		mov	eax, [si+8]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_70]
		add	[bp+var_7C], eax
		mov	eax, [bp+var_6C]
		add	[bp+var_78], eax
		mov	eax, [bp+var_68]
		add	[bp+var_74], eax
		mov	eax, [bp+var_64]
		add	[bp+var_7C], eax
		mov	eax, [bp+var_60]
		add	[bp+var_78], eax
		mov	eax, [bp+var_5C]

loc_79EE0:
		add	[bp+var_74], eax
		mov	si, 1

loc_79EE7:
		jmp	loc_7A048
; ���������������������������������������������������������������������������

loc_79EEA:				; CODE XREF: Pilot_IssueControlCommand_79DA0+2ADj
		sub	sp, 4

loc_79EED:
		mov	eax, [bp+arg_8]
		mov	[bp+var_A8], eax
		mov	ax, di
		add	ax, 0Ch
		push	ax
		lea	ax, [bp+var_7C]
		push	ax
		mov	ax, si
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr [bx]
		call	Pilot_LowLevelControlCommand
		add	sp, 0Ah
		mov	ax, si
		and	ax, 1
		cmp	ax, 1
		jnz	short loc_79F81
		mov	eax, [bp+var_64]
		shl	eax, 1
		mov	[bp+var_14], eax
		mov	[bp+var_18], eax
		mov	eax, [bp+var_60]
		shl	eax, 1
		mov	[bp+var_1C], eax
		mov	[bp+var_20], eax
		mov	eax, [bp+var_5C]
		shl	eax, 1
		mov	[bp+var_24], eax
		mov	[bp+var_28], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_88]
		sub	[bp+var_7C], eax
		mov	eax, [bp+var_84]

loc_79F72:
		sub	[bp+var_78], eax
		mov	eax, [bp+var_80]
		sub	[bp+var_74], eax
		jmp	loc_7A047
; ���������������������������������������������������������������������������

loc_79F81:				; CODE XREF: Pilot_IssueControlCommand_79DA0+17Bj
		mov	eax, [bp+var_64]
		shl	eax, 1
		mov	[bp+var_2C], eax
		mov	[bp+var_30], eax
		mov	eax, [bp+var_60]
		shl	eax, 1
		mov	[bp+var_34], eax
		mov	[bp+var_38], eax
		mov	eax, [bp+var_5C]
		shl	eax, 1
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_94]
		add	[bp+var_7C], eax
		mov	eax, [bp+var_90]
		add	[bp+var_78], eax
		mov	eax, [bp+var_8C]
		add	[bp+var_74], eax
		mov	eax, [bp+var_70]
		shl	eax, 1
		mov	[bp+var_44], eax
		mov	[bp+var_48], eax
		mov	eax, [bp+var_6C]
		shl	eax, 1
		mov	[bp+var_4C], eax
		mov	[bp+var_50], eax
		mov	eax, [bp+var_68]
		shl	eax, 1
		mov	[bp+var_54], eax
		mov	[bp+var_58], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_A0]
		add	[bp+var_7C], eax
		mov	eax, [bp+var_9C]
		add	[bp+var_78], eax
		mov	eax, [bp+var_98]
		add	[bp+var_74], eax

loc_7A047:				; CODE XREF: Pilot_IssueControlCommand_79DA0+1DEj
		inc	si

loc_7A048:				; CODE XREF: Pilot_IssueControlCommand_79DA0:loc_79EE7j
		cmp	si, [bp+arg_2]
		jge	short loc_7A050
		jmp	loc_79EEA
; ���������������������������������������������������������������������������

loc_7A050:				; CODE XREF: Pilot_IssueControlCommand_79DA0+2ABj
		pop	di
		pop	si
		leave
		retf
Pilot_IssueControlCommand_79DA0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 796 lignes, NON DÉTAILLÉE — combine Lexer_ResolveConstantAlt,
; Expr_Node_GetOrRecompute_53236 (seg114), UIScreen_RenderOrLayoutList_54503 (seg114),
; Parser_LookaheadPattern — probable interpréteur/évaluateur de script pour un écran UI
; dynamique, lié au système Expr_VM. Candidat prioritaire pour session dédiée.
; ==============================================================================================
UIScript_ParseAndEvaluate_7A054	proc far		; CODE XREF: VROOMM_StubThunk_6AC85J UIScript_Helper_7A79E+32p	...

var_C4		= dword	ptr -0C4h
var_BC		= dword	ptr -0BCh
var_B8		= dword	ptr -0B8h
var_B4		= dword	ptr -0B4h
var_B0		= dword	ptr -0B0h
var_AC		= dword	ptr -0ACh
var_A8		= dword	ptr -0A8h
var_A4		= dword	ptr -0A4h
var_A0		= dword	ptr -0A0h
var_9C		= dword	ptr -9Ch
var_98		= dword	ptr -98h
var_94		= dword	ptr -94h
var_90		= dword	ptr -90h
var_8C		= dword	ptr -8Ch
var_88		= dword	ptr -88h
var_84		= dword	ptr -84h
var_80		= dword	ptr -80h
var_7C		= dword	ptr -7Ch
var_78		= dword	ptr -78h
var_74		= word ptr -74h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4B		= byte ptr -4Bh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_45		= byte ptr -45h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0BCh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 1F400h
		mov	[bp+var_8], 1F400h

loc_7A070:
		mov	bx, word_706A0
		mov	al, [bx+6Fh]

loc_7A077:
		mov	ah, 0
		mov	[bp+var_A], ax
		push	ax

loc_7A07D:
		lea	ax, [bp+var_74]
		push	ax
		push	bx
		call	VROOMM_StubThunk_6CE60
		add	sp, 6
		mov	[bp+var_C], ax
		mov	si, [bp+var_74]
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	[bp+var_80], eax
		mov	eax, [di+4]
		mov	[bp+var_7C], eax
		mov	eax, [di+8]
		mov	[bp+var_78], eax
		mov	bx, word_706A0
		mov	di, [bx+50h]
		lea	ax, [bp+var_8C]
		push	ax
		mov	ax, word_706A0
		add	ax, 68h	; 'h'
		push	ax
		call	Lexer_ResolveConstantAlt
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A0D0
		jmp	loc_7A79A
; ���������������������������������������������������������������������������

loc_7A0D0:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+77j
		lea	ax, [bp+var_8C]
		push	ax
		mov	ax, word_706A0
		add	ax, 3Ah	; ':'
		push	ax
		call	Scene_FindMatchingByAreaContainment_53236
		add	sp, 4
		mov	[bp+var_E], ax
		mov	al, [bp+arg_2]
		push	ax
		push	word_706A0
		call	UIScreen_RenderOrLayoutList_54503
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A100
		jmp	loc_7A79A
; ���������������������������������������������������������������������������

loc_7A100:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+A7j
		mov	word_7046E, 1
		mov	[bp+var_12], 100h
		mov	eax, [bp+var_12]
		mov	dword_70468, eax
		mov	byte_7046C, 0
		push	0
		push	word_70E62
		call	TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4
		mov	word_6DF26, 0
		mov	dword_6DF2E, 0
		mov	ax, word_706A0
		add	ax, 68h	; 'h'
		push	ax
		call	Parser_LookaheadPattern
		pop	cx
		or	al, al
		jz	short loc_7A1BF
		mov	bx, word_706A0
		cmp	word ptr [bx+4Eh], 0
		jz	short loc_7A175
		push	large 0
		mov	bx, [bx+4Eh]
		push	large dword ptr	[bx+10h]
		mov	bx, word_706A0
		mov	bx, [bx+4Eh]
		mov	ax, [bx+2]
		add	ax, 40h	; '@'
		push	ax
		call	Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah
		jmp	short $+2

loc_7A175:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+FDj
		mov	bx, word_706A0
		mov	al, [bx+0A1h]
		mov	[bp+var_13], al
		cmp	[bp+var_13], 0
		mov	bx, word_706A0
		cmp	word ptr [bx+4Eh], 0
		jz	short loc_7A1B0
		push	large 0
		mov	bx, [bx+4Eh]
		push	large dword ptr	[bx+10h]
		mov	bx, word_706A0
		mov	bx, [bx+4Eh]
		mov	ax, [bx+2]
		add	ax, 40h	; '@'
		push	ax
		call	Expr_VM_ExecuteSingleInstruction_51E7E
		add	sp, 0Ah
		jmp	short $+2

loc_7A1B0:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+138j
		mov	bx, word_706A0
		mov	al, [bx+0AFh]
		mov	[bp+var_14], al
		cmp	[bp+var_14], 0

loc_7A1BF:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+F3j
		mov	[bp+var_16], 1
		jmp	short loc_7A1F4
; ���������������������������������������������������������������������������

loc_7A1C6:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+1A6j
		mov	bx, [bp+var_16]
		shl	bx, 1
		lea	ax, [bp+var_74]
		add	bx, ax
		mov	bx, [bx]
		push	word ptr [bx+51h]
		mov	bx, [bp+var_16]
		shl	bx, 1
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx+51h]

loc_7A1E1:
		mov	bx, [bx]

loc_7A1E3:
		call	dword ptr [bx+48h]

loc_7A1E6:
		pop	cx
		mov	[bp+var_18], ax
		mov	bx, [bp+var_18]
		mov	byte ptr [bx+68h], 0FFh
		inc	[bp+var_16]

loc_7A1F4:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+170j
		mov	ax, [bp+var_16]
		cmp	ax, [bp+var_C]
		jl	short loc_7A1C6
		cmp	di, [bp+var_E]
		jnz	short loc_7A204
		jmp	loc_7A294
; ���������������������������������������������������������������������������

loc_7A204:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+1ABj
		mov	[bp+var_5C], 0
		mov	word ptr [bp+var_60+2],	0
		jmp	short loc_7A27E
; ���������������������������������������������������������������������������

loc_7A210:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+23Dj
		mov	ax, word ptr [bp+var_60+2]
		mov	word ptr [bp+var_60], ax
		push	ax
		mov	ax, word_706A0
		add	ax, 34h	; '4'
		push	ax
		call	Expr_Node_Accessor_52E17
		add	sp, 4
		mov	word ptr [bp+var_64+2],	dx
		mov	word ptr [bp+var_64], ax
		cmp	[bp+var_64], 0
		jz	short loc_7A255
		push	dx
		push	ax
		call	VROOMM_StubThunk_6CE1A
		add	sp, 4
		or	al, al
		jz	short loc_7A278
		push	large [bp+var_64]
		call	Expr_Node_ClearDirtyAndNotify_5242A
		add	sp, 4
		mov	ax, [bp+var_5C]
		mov	word ptr [bp+var_60+2],	ax
		jmp	short loc_7A278
; ���������������������������������������������������������������������������

loc_7A255:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+1DDj
		mov	bx, word ptr [bp+var_60]
		test	byte ptr [bx+4], 1
		jnz	short loc_7A264
		test	byte ptr [bx+4], 20h
		jz	short loc_7A278

loc_7A264:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+208j
		push	word ptr [bp+var_60]
		push	59C3h
		call	Container_Op_223C5
		add	sp, 4
		mov	ax, [bp+var_5C]
		mov	word ptr [bp+var_60+2],	ax

loc_7A278:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+1EBj
					; UIScript_ParseAndEvaluate_7A054+1FFj ...
		mov	ax, word ptr [bp+var_60+2]
		mov	[bp+var_5C], ax

loc_7A27E:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+1BAj
		lea	ax, [bp+var_60+2]
		push	ax
		push	59C3h
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax
		jz	short loc_7A294
		jmp	loc_7A210
; ���������������������������������������������������������������������������

loc_7A294:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+1ADj
					; UIScript_ParseAndEvaluate_7A054+23Bj
		mov	[bp+var_1C], 15E00h
		push	0
		mov	[bp+var_24], 0
		mov	eax, [bp+var_24]
		mov	[bp+var_98], eax
		mov	[bp+var_28], 0
		mov	eax, [bp+var_28]
		mov	[bp+var_94], eax
		mov	[bp+var_2C], 100h
		mov	eax, [bp+var_2C]
		mov	[bp+var_90], eax
		lea	ax, [bp+var_98]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp+var_78]

loc_7A2EF:
		sub	eax, [bp+var_20]

loc_7A2F3:
		mov	[bp+var_30], eax

loc_7A2F7:
		cmp	[bp+var_30], 7D000h
		jge	short loc_7A30F
		mov	eax, [bp+var_20]
		add	eax, 7D000h
		mov	[bp+var_78], eax

loc_7A30F:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+2ABj
		mov	eax, [bp+var_8C]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_80]
		sub	[bp+var_A4], eax
		mov	eax, [bp+var_7C]
		sub	[bp+var_A0], eax
		mov	eax, [bp+var_78]
		sub	[bp+var_9C], eax
		mov	[bp+var_34], 0
		mov	eax, [bp+var_34]
		mov	[bp+var_9C], eax
		lea	ax, [bp+var_A4]
		push	ax
		call	UI_ApplyVectorLength_55B04
		pop	cx
		lea	ax, [bp+var_A4]
		push	ax
		call	Targeting_LineOfSightCheck_5593A
		pop	cx
		push	si

loc_7A370:
		mov	bx, [si]

loc_7A372:
		call	dword ptr [bx+3Ch]
		pop	cx

loc_7A376:
		add	ax, 0Ch
		mov	[bp+var_36], ax
		mov	bx, [bp+var_36]
		mov	eax, [bp+var_A4]
		mov	[bx], eax
		mov	eax, [bp+var_A0]
		mov	[bx+4],	eax
		mov	eax, [bp+var_9C]
		mov	[bx+8],	eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		mov	[bp+var_38], ax
		mov	[bp+var_3C], 0
		mov	eax, [bp+var_3C]
		mov	[bp+var_B0], eax
		mov	[bp+var_40], 0
		mov	eax, [bp+var_40]
		mov	[bp+var_AC], eax
		mov	[bp+var_44], 100h
		mov	eax, [bp+var_44]
		mov	[bp+var_A8], eax
		mov	bx, [bp+var_38]
		mov	eax, [bp+var_B0]
		mov	[bx], eax
		mov	eax, [bp+var_AC]

loc_7A3E9:
		mov	[bx+4],	eax
		mov	eax, [bp+var_A8]

loc_7A3F2:
		mov	[bx+8],	eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		call	Matrix_ApplyToVectorZ_576E5
		pop	cx
		sub	sp, 4
		mov	eax, [bp+var_1C]
		mov	[bp+var_C4], eax
		lea	ax, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	si
		call	Pilot_LowLevelControlCommand
		add	sp, 0Ah
		push	0
		sub	sp, 4
		mov	eax, [bp+var_1C]
		mov	[bp-0C6h], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	[bp+var_C]
		lea	ax, [bp+var_74]
		push	ax
		push	cs
		call	near ptr Pilot_IssueControlCommand_79DA0
		add	sp, 0Eh
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_7A456
		jmp	loc_7A4D7
; ���������������������������������������������������������������������������

loc_7A456:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+3FDj
		mov	byte_6D558, 1
		push	ds
		push	offset aAutopilt ; "AUTOPILT"
		push	59CDh
		call	EntityTracker_SelectByID
		add	sp, 6
		or	al, al
		jz	short loc_7A4C9
		mov	ax, word_72A8F
		mov	[bp+var_5C], ax
		jmp	short loc_7A4C0
; ���������������������������������������������������������������������������

loc_7A476:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+473j
		mov	ax, [bp+var_5C]
		cmp	ax, word_72A8F
		jz	short loc_7A48B

loc_7A47F:
		push	word_72A8F

loc_7A483:
		call	Camera_DetachParent

loc_7A488:
		pop	cx
		jmp	short loc_7A4C9
; ���������������������������������������������������������������������������

loc_7A48B:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+429j
		mov	word_7046E, 1
		mov	[bp+var_60], 100h
		mov	eax, [bp+var_60]
		mov	dword_70468, eax
		mov	byte_7046C, 0
		mov	byte_72B34, 0
		xor	eax, eax
		mov	dword_72B35, eax
		mov	dword_72B39, eax
		mov	byte_72B41, 1
		call	UIScreen_ApplyFormFields_500F6

loc_7A4C0:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+420j
		call	CombatTarget_WeaponActionSubsystem
		or	al, al
		jnz	short loc_7A476

loc_7A4C9:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+418j
					; UIScript_ParseAndEvaluate_7A054+435j
		push	51E2h
		call	Config_ReadCalibration
		pop	cx
		mov	byte_6D558, 0

loc_7A4D7:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+3FFj
		cmp	[bp+var_E], 0
		jnz	short loc_7A4E0
		jmp	loc_7A79A
; ���������������������������������������������������������������������������

loc_7A4E0:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+487j
		mov	[bp+var_45], 0
		mov	[bp+var_48], di
		mov	[bp+var_4A], 0FFFFh

loc_7A4EC:
		mov	[bp+var_4B], 0

loc_7A4F0:
		jmp	loc_7A631
; ���������������������������������������������������������������������������

loc_7A4F3:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+5E6j
		mov	eax, [bp+var_8C]
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_80]
		sub	[bp+var_BC], eax
		mov	eax, [bp+var_7C]
		sub	[bp+var_B8], eax
		mov	eax, [bp+var_78]
		sub	[bp+var_B4], eax
		or	di, di
		jnz	short loc_7A533
		jmp	loc_7A5DC
; ���������������������������������������������������������������������������

loc_7A533:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+4DAj
		cmp	di, [bp+var_E]
		jz	short loc_7A53B
		jmp	loc_7A5BE
; ���������������������������������������������������������������������������

loc_7A53B:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+4E2j
		mov	[bp+var_4B], 1
		cmp	[bp+arg_2], 0
		jnz	short loc_7A54B
		cmp	word ptr [di+14h], 0
		jnz	short loc_7A569

loc_7A54B:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+4EFj
		mov	eax, [bp+var_8C]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_78], eax
		jmp	loc_7A63D
; ���������������������������������������������������������������������������

loc_7A569:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+4F5j
		push	large [bp+var_B4]
		push	large [bp+var_B8]
		push	large [bp+var_BC]

loc_7A578:
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax

loc_7A581:
		add	sp, 0Ch
		mov	[bp+var_64+2], eax
		mov	[bp+var_60+2], eax
		cmp	eax, [bp+var_8]
		jge	short loc_7A596
		mov	[bp+var_8], eax

loc_7A596:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+53Cj
		mov	eax, [bp+var_60+2]
		cmp	eax, [bp+var_4]
		jge	short loc_7A5A4
		mov	[bp+var_45], 1

loc_7A5A4:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+54Aj
		push	0FFh
		push	di
		call	VROOMM_StubThunk_6CF49
		add	sp, 4
		or	ax, ax
		jle	short loc_7A5DC
		mov	[bp+var_4B], 0
		mov	[bp+var_45], 1
		jmp	short loc_7A5DC
; ���������������������������������������������������������������������������

loc_7A5BE:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+4E4j
		cmp	di, [bp+var_48]
		jz	short loc_7A5DC
		push	0FFh
		push	di
		call	VROOMM_StubThunk_6CF49
		add	sp, 4
		mov	[bp+var_5C], ax
		cmp	[bp+var_5C], 0
		jle	short loc_7A5DC
		mov	[bp+var_45], 1

loc_7A5DC:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+4DCj
					; UIScript_ParseAndEvaluate_7A054+55Ej ...
		mov	al, [bp+var_45]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A631
		lea	ax, [bp+var_BC]
		push	ax
		call	UI_ApplyVectorLength_55B04
		pop	cx
		lea	ax, [bp+var_8]

loc_7A5F3:
		push	ax
		lea	ax, [bp+var_BC]
		push	ax
		call	UI_ApplyLineOfSightCheck_55A9E
		add	sp, 4
		mov	eax, [bp+var_BC]
		add	[bp+var_80], eax
		mov	eax, [bp+var_B8]
		add	[bp+var_7C], eax
		mov	eax, [bp+var_B4]
		add	[bp+var_78], eax
		lea	ax, [bp+var_80]
		push	ax
		mov	ax, word_706A0
		add	ax, 3Ah	; ':'
		push	ax
		call	Scene_FindMatchingByAreaContainment_53236
		add	sp, 4
		mov	di, ax

loc_7A631:				; CODE XREF: UIScript_ParseAndEvaluate_7A054:loc_7A4F0j
					; UIScript_ParseAndEvaluate_7A054+58Fj
		mov	al, [bp+var_45]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A63D
		jmp	loc_7A4F3
; ���������������������������������������������������������������������������

loc_7A63D:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+512j
					; UIScript_ParseAndEvaluate_7A054+5E4j
		or	di, di
		jz	short loc_7A66F
		cmp	byte ptr [di+18h], 0
		jz	short loc_7A66F
		mov	ax, di
		add	ax, 1Bh
		mov	[bp+var_4E], ax
		mov	bx, [bp+var_4E]
		mov	eax, [bx]
		mov	[bp+var_80], eax
		mov	eax, [bx+4]
		mov	[bp+var_7C], eax
		mov	eax, [bx+8]
		mov	[bp+var_78], eax
		mov	ax, [di+19h]
		mov	[bp+var_4A], ax

loc_7A66F:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+5EBj
					; UIScript_ParseAndEvaluate_7A054+5F1j
		cmp	[bp+var_4A], 0FFFFh

loc_7A673:
		jz	short loc_7A6B1
		xor	eax, eax
		mov	[bp+var_9C], eax

loc_7A67D:
		mov	[bp+var_A4], eax

loc_7A682:
		mov	[bp+var_A0], 100h
		mov	ax, [bp+var_4A]
		neg	ax
		mov	[bp+var_50], ax
		movsx	eax, [bp+var_50]
		shl	eax, 8
		mov	[bp+var_54], eax
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_A4]
		push	ax
		call	Missile_ComputeDirectionVector2D_556D4
		add	sp, 4

loc_7A6B1:				; CODE XREF: UIScript_ParseAndEvaluate_7A054:loc_7A673j
		mov	[bp+var_58], 0C800h
		mov	eax, [bp+var_58]
		mov	[bp+var_1C], eax
		sub	sp, 4
		mov	[bp+var_C4], eax
		lea	ax, [bp+var_A4]
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	si
		call	Pilot_LowLevelControlCommand
		add	sp, 0Ah
		push	1
		sub	sp, 4
		mov	eax, [bp+var_1C]
		mov	[bp-0C6h], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, [bp+var_80]
		push	ax
		push	[bp+var_C]
		lea	ax, [bp+var_74]
		push	ax
		push	cs
		call	near ptr Pilot_IssueControlCommand_79DA0
		add	sp, 0Eh
		mov	al, [bp+arg_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A716
		push	word_70474
		call	Picking_ClearSelectableList
		pop	cx

loc_7A716:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+6B6j
		push	word_6E4B2
		call	VROOMM_StubThunk_6B21D
		pop	cx
		cmp	byte_721F0, 2
		jnz	short loc_7A736
		push	0
		push	5130h
		call	EMS_MapPage
		add	sp, 4
		jmp	short $+2

loc_7A736:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+6D1j
		push	0
		push	word_70E62
		call	TextFormat_ReleaseAttribute_5E5AC
		add	sp, 4
		cmp	byte_721F0, 2
		jnz	short loc_7A787
		pushf
		mov	bx, 534Dh
		mov	ax, 1209h
		int	15h
		popf
		mov	[bp+var_5A], bx
		push	1
		push	5130h
		call	EMS_MapPage
		add	sp, 4
		xor	dx, dx
		mov	cl, 0
		mov	ch, 2
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		cmp	[bp+var_5A], 0
		jnz	short loc_7A785
		pushf
		mov	bx, 736Dh
		mov	ax, 1209h
		int	15h
		popf

loc_7A783:
		jmp	short loc_7A787
; ���������������������������������������������������������������������������

loc_7A785:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+723j
		jmp	short $+2

loc_7A787:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+6F5j
					; UIScript_ParseAndEvaluate_7A054:loc_7A783j
		cmp	[bp+var_4B], 0
		jz	short loc_7A79A
		mov	ax, word_706A0
		add	ax, 68h	; 'h'
		push	ax
		call	Parser_ConsumeRemaining
		pop	cx

loc_7A79A:				; CODE XREF: UIScript_ParseAndEvaluate_7A054+79j
					; UIScript_ParseAndEvaluate_7A054+A9j ...
		pop	di
		pop	si
		leave
		retf
UIScript_ParseAndEvaluate_7A054	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, aucun appel externe visible (55 lignes).
; ==============================================================================================
UIScript_Helper_7A79E	proc far		; CODE XREF: VROOMM_StubThunk_6AC80J

var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	dx, [bp+arg_0]
		mov	bx, word_706A0
		mov	al, [bx+6Eh]
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	bx, [bp+var_2]
		sub	bx, 0A2h	; switch 5 cases
		cmp	bx, 4
		ja	short locret_7A7EA ; default
		shl	bx, 1
		jmp	cs:off_7A7EC[bx] ; switch jump

loc_7A7C6:				; DATA XREF: ovr233:off_7A7ECo
		mov	[bp+var_3], 1	; case 0xA2
		mov	al, [bp+var_3]
		push	ax
		push	dx
		push	cs
		call	near ptr UIScript_ParseAndEvaluate_7A054
		add	sp, 4
		jmp	short locret_7A7EA ; default
; ���������������������������������������������������������������������������

loc_7A7D8:				; CODE XREF: UIScript_Helper_7A79E+23j
					; DATA XREF: ovr233:off_7A7ECo
		mov	al, 0		; case 0xA4
		mov	ah, 0
		or	ax, ax
		jnz	short locret_7A7EA ; default

loc_7A7E0:
		push	0
		push	dx

loc_7A7E3:
		push	cs
		call	near ptr UIScript_ParseAndEvaluate_7A054

loc_7A7E7:
		add	sp, 4

locret_7A7EA:				; CODE XREF: UIScript_Helper_7A79E+1Fj
					; UIScript_Helper_7A79E+23j ...
		leave			; default
		retf
UIScript_Helper_7A79E	endp

; ���������������������������������������������������������������������������
off_7A7EC	dw offset loc_7A7C6	; DATA XREF: UIScript_Helper_7A79E+23r
		dw offset locret_7A7EA	; jump table for switch	statement
		dw offset loc_7A7D8
		dw offset loc_7A7D8
		dw offset loc_7A7D8
ovr233		ends
