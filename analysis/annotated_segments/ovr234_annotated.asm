ovr234		segment	para public 'OVERLAY' use16
		assume cs:ovr234
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Matrix_BuildFromAngle_56D72 et une opération de conteneur (Container_Op_223F0).
; ==============================================================================================
AIManeuver_BuildRotationAndLookup_7A800	proc far		; CODE XREF: VROOMM_StubThunk_6ACB5J

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 143h
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		push	word ptr [si+173h]
		push	59C3h
		call	Container_Op_223F0
		add	sp, 4
		push	si
		call	VROOMM_StubThunk_6B085
		pop	cx
		mov	byte ptr [si+1BCh], 0
		mov	byte ptr [si+1BDh], 0
		pop	si
		pop	bp
		retf
AIManeuver_BuildRotationAndLookup_7A800	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine Matrix_BuildFromAngle_56D72 et une comparaison de clé de conteneur
; (Container_KeyEquals).
; ==============================================================================================
AIManeuver_BuildRotationAndLookupB_7A836	proc far		; CODE XREF: VROOMM_StubThunk_6ACB0J
					; AI_ApplyManeuverAngles_7A90A:loc_7A976p

var_6		= dword	ptr -6
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
		cmp	word ptr [si+173h], 0
		jnz	short loc_7A84E
		jmp	loc_7A906
; ���������������������������������������������������������������������������

loc_7A84E:				; CODE XREF: AIManeuver_BuildRotationAndLookupB_7A836+13j
		mov	ax, si
		add	ax, 143h
		push	ax
		call	Matrix_BuildFromAngle_56D72
		pop	cx
		push	word ptr [si+173h]
		push	59C3h
		call	Container_KeyEquals
		add	sp, 4
		mov	byte ptr [si+1BCh], 1
		mov	word ptr [si+125h], 0FFFFh
		push	word ptr [si+125h]
		push	si
		call	VROOMM_StubThunk_6B1FF
		add	sp, 4
		mov	ax, si
		add	ax, 2
		push	ax
		push	di
		call	VROOMM_StubThunk_6BBF4
		add	sp, 4
		xor	ax, ax
		mov	[si+189h], ax
		mov	[si+18Bh], ax
		mov	eax, [si+1B7h]
		mov	[di+8],	eax
		mov	eax, [si+19Fh]
		mov	[di+0Ch], eax
		mov	eax, [si+1A3h]
		mov	[di+10h], eax
		mov	eax, [si+19Bh]
		mov	[di], eax
		mov	ax, [si+195h]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		mov	[bp+var_6], eax
		mov	eax, [bp+var_6]
		mov	[di+60h], eax
		mov	eax, [si+197h]

loc_7A8DE:
		mov	[di+64h], eax
		mov	eax, [si+1A7h]
		mov	[di+68h], eax
		mov	eax, [si+1ABh]
		mov	[di+6Ch], eax
		mov	eax, [si+1AFh]
		mov	[di+70h], eax
		mov	eax, [si+1B3h]
		mov	[di+74h], eax

loc_7A906:				; CODE XREF: AIManeuver_BuildRotationAndLookupB_7A836+15j
		pop	di
		pop	si
		leave
		retf
AIManeuver_BuildRotationAndLookupB_7A836	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine AI_ApplyAngleBetweenVectors_57C3A et AI_ApplyApproachAngles_57D81 (seg116).
; ==============================================================================================
AI_ApplyManeuverAngles_7A90A	proc far		; CODE XREF: VROOMM_StubThunk_6ACBAJ

var_8		= word ptr -8
var_4		= word ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	[bp+arg_4], 0
		jnz	short loc_7A922
		or	di, di
		jz	short loc_7A97C

loc_7A922:				; CODE XREF: AI_ApplyManeuverAngles_7A90A+12j
		cmp	byte ptr [si+1BDh], 0
		jz	short loc_7A962
		mov	ax, si
		add	ax, 143h
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	AI_ApplyAngleBetweenVectors_57C3A
		add	sp, 6
		mov	ax, [bp+var_4+1]
		mov	[si+189h], ax
		mov	ax, si
		add	ax, 143h
		push	ax
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		call	AI_ApplyApproachAngles_57D81
		add	sp, 6
		mov	ax, [bp+var_8+1]
		mov	[si+18Bh], ax
		mov	byte ptr [si+1BDh], 0

loc_7A962:				; CODE XREF: AI_ApplyManeuverAngles_7A90A+1Dj
		mov	byte ptr [si+1BEh], 1
		mov	al, [si+1BCh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7A97C

loc_7A971:
		push	[bp+arg_6]
		push	si
		push	cs

loc_7A976:
		call	near ptr AIManeuver_BuildRotationAndLookupB_7A836

loc_7A979:
		add	sp, 4

loc_7A97C:				; CODE XREF: AI_ApplyManeuverAngles_7A90A+16j
					; AI_ApplyManeuverAngles_7A90A+65j
		mov	ax, [bp+arg_4]

loc_7A97F:
		sub	[si+18Bh], ax

loc_7A983:
		mov	ax, [si+18Bh]
		cmp	ax, [si+187h]
		jle	short loc_7A995
		mov	ax, [si+187h]
		mov	[si+18Bh], ax

loc_7A995:				; CODE XREF: AI_ApplyManeuverAngles_7A90A+81j
		mov	ax, [si+18Bh]
		cmp	ax, [si+185h]
		jge	short loc_7A9A7
		mov	ax, [si+185h]
		mov	[si+18Bh], ax

loc_7A9A7:				; CODE XREF: AI_ApplyManeuverAngles_7A90A+93j
		add	[si+189h], di
		mov	ax, [si+189h]
		cmp	ax, [si+181h]
		jge	short loc_7A9BD
		mov	ax, [si+181h]
		mov	[si+189h], ax

loc_7A9BD:				; CODE XREF: AI_ApplyManeuverAngles_7A90A+A9j
		mov	ax, [si+189h]
		cmp	ax, [si+183h]
		jle	short loc_7A9CF
		mov	ax, [si+183h]
		mov	[si+189h], ax

loc_7A9CF:				; CODE XREF: AI_ApplyManeuverAngles_7A90A+BBj
		pop	di
		pop	si
		leave
		retf
AI_ApplyManeuverAngles_7A90A	endp

ovr234		ends
