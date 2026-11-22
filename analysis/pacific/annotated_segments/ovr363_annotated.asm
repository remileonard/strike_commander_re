ovr363		segment	para public 'OVERLAY' use16
		assume cs:ovr363
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05 (fichiers, chunks et appels ; pas ligne par ligne). Commande 34
; (APPLY_CHANGE) : fichier dont le chemin est en [partie+1008], FORM STAT, FORM CHNG, INFO.
; ==============================================================================================
Gameflow_ApplyChange_CA290		proc far

var_AA		= word ptr -0AAh
var_4D		= dword ptr -4Dh
var_49		= dword ptr -49h
var_45		= dword ptr -45h
var_34		= dword ptr -34h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0AAh
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_AA], 508h
		mov	[bp+var_49], 100h
		mov	[bp+var_4D], 0
		mov	[bp+var_AA], 520h
		mov	[bp+var_2E], 0
		xor	ax, ax
		mov	[bp+var_30], ax
		movsx	eax, ax
		mov	[bp+var_45], eax
		push	1
		mov	ax, si
		add	ax, 3F0h
		push	ax
		lea	ax, [bp+var_AA]
		push	ax
		mov	bx, [bp+var_AA]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 54415453h
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		mov	[bp+var_1], 0
		jmp	short loc_CA35C

loc_CA306:
		push	1
		push	large 474E4843h
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		mov	[bp+var_2], al
		cmp	al, [bp+arg_2]
		jnz	short loc_CA349
		mov	[bp+var_1], 1
		jmp	short loc_CA38A

loc_CA349:
		mov	eax, [bp+var_34]
		mov	[bp+var_45], eax
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReleaseAndClear_6DD9E
		pop	cx

loc_CA35C:
		cmp	[bp+var_2E], 0
		jnz	short loc_CA36F
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_ReadPayload_6DE2C
		pop	cx
		jmp	short loc_CA383

loc_CA36F:
		mov	bx, [bp+var_2E]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_45]
		jg	short loc_CA381
		mov	ax, 1
		jmp	short loc_CA383

loc_CA381:
		xor	ax, ax

loc_CA383:
		or	ax, ax
		jnz	short loc_CA38A
		jmp	loc_CA306

loc_CA38A:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CA39C
		push	0DF39h
		call	sub_1DDFE
		pop	cx

loc_CA39C:
		mov	eax, [bp+var_34]
		mov	[bp+var_45], eax
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		mov	[bp+var_AA], 520h
		lea	ax, [bp+var_AA]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_AA]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		pop	si
		leave
		retf
Gameflow_ApplyChange_CA290		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Fonction vide (mov ax, [bp+arg_0] / retf), appelée par la commande 26
; (SHOW_KILL_MARKS).
; ==============================================================================================
Gameflow_EmptyKillMarks_CA3D2		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
Gameflow_EmptyKillMarks_CA3D2		endp
ovr363		ends
