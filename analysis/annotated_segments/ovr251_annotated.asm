ovr251		segment	para public 'OVERLAY' use16
		assume cs:ovr251
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 301 lignes, NON DÉTAILLÉE — combine
; ResourceRecord_SeekAndReadB_647B2/ReleaseAndClear_64D25 (seg193) — probable chargement d'un
; enregistrement de sous-titre/dialogue de mission.
; ==============================================================================================
MissionText_LoadSubtitleRecord_87A60	proc far		; CODE XREF: VROOMM_StubThunk_6B29FJ

var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, 1209h
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	0
		push	large 53574152h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_87A95
		jmp	loc_87B66
; ���������������������������������������������������������������������������

loc_87A95:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+30j
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	70h ; 'p'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_87AB2
		jmp	loc_87B4E
; ���������������������������������������������������������������������������

loc_87AB2:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+4Dj
		mov	word ptr [di], 73Ch
		mov	word ptr [di+4], 0
		mov	word ptr [di+6], 0

loc_87AC0:
		mov	byte ptr [di+11h], 0
		mov	word ptr [di+12h], 0

loc_87AC9:
		mov	word ptr [di+14h], 0

loc_87ACE:
		mov	byte ptr [di+1Fh], 0

loc_87AD2:
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bp+var_4]
		mov	[di+2],	ax
		mov	word ptr [di], 926h
		mov	dword ptr [di+3Ch], 0
		mov	byte ptr [di+40h], 2
		mov	byte ptr [di+41h], 0
		mov	dword ptr [di+42h], 0
		mov	dword ptr [di+46h], 0
		mov	byte ptr [di+4Ah], 2
		mov	byte ptr [di+4Bh], 0
		mov	dword ptr [di+4Ch], 0
		mov	dword ptr [di+54h], 0
		mov	byte ptr [di+58h], 2
		mov	byte ptr [di+59h], 0
		mov	dword ptr [di+5Ah], 0
		mov	word ptr [di+5Eh], 75Ch
		xor	ax, ax
		mov	[di+62h], ax
		mov	[di+60h], ax
		mov	word ptr [di+5Eh], 922h
		push	[bp+var_6]
		push	di
		call	VROOMM_StubThunk_6B670
		add	sp, 4
		mov	ax, di
		jmp	short loc_87B50
; ���������������������������������������������������������������������������

loc_87B4E:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+4Fj
		mov	ax, di

loc_87B50:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+ECj
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_87D74
		add	sp, 4
		push	[bp+arg_4]
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_87B66:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+32j
		push	0
		push	large 49544C41h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_87B80
		jmp	loc_87C10
; ���������������������������������������������������������������������������

loc_87B80:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+11Bj
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	3Bh ; ';'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_87BF8
		mov	word ptr [di], 73Ch
		mov	word ptr [di+4], 0
		mov	word ptr [di+6], 0
		mov	byte ptr [di+11h], 0
		mov	word ptr [di+12h], 0
		mov	word ptr [di+14h], 0
		mov	byte ptr [di+1Fh], 0
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bp+var_4]
		mov	[di+2],	ax
		mov	word ptr [di], 902h

loc_87BCC:
		mov	dword ptr [di+2Eh], 0
		mov	byte ptr [di+32h], 2
		mov	byte ptr [di+33h], 0
		mov	dword ptr [di+34h], 0
		mov	word ptr [di], 912h
		push	[bp+var_6]
		push	di
		call	VROOMM_StubThunk_6B2E0
		add	sp, 4
		mov	ax, di
		jmp	short loc_87BFA
; ���������������������������������������������������������������������������

loc_87BF8:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+138j
		mov	ax, di

loc_87BFA:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+196j
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_87D74
		add	sp, 4
		push	[bp+arg_4]
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_87C10:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+11Dj
		push	0
		push	large 53524941h
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_87C2A
		jmp	loc_87CBA
; ���������������������������������������������������������������������������

loc_87C2A:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+1C5j
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	3Bh ; ';'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_87CA2
		mov	word ptr [di], 73Ch
		mov	word ptr [di+4], 0
		mov	word ptr [di+6], 0
		mov	byte ptr [di+11h], 0
		mov	word ptr [di+12h], 0
		mov	word ptr [di+14h], 0
		mov	byte ptr [di+1Fh], 0
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bp+var_4]
		mov	[di+2],	ax
		mov	word ptr [di], 902h
		mov	dword ptr [di+2Eh], 0
		mov	byte ptr [di+32h], 2
		mov	byte ptr [di+33h], 0
		mov	dword ptr [di+34h], 0
		mov	word ptr [di], 8F2h
		push	[bp+var_6]
		push	di
		call	VROOMM_StubThunk_6B2E0
		add	sp, 4
		mov	ax, di
		jmp	short loc_87CA4
; ���������������������������������������������������������������������������

loc_87CA2:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+1E2j
		mov	ax, di

loc_87CA4:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+240j
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_87D74
		add	sp, 4
		push	[bp+arg_4]
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_87CBA:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+1C7j
		push	0
		push	large 4E52574Dh
		push	[bp+arg_4]
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_87CD4
		jmp	loc_87D70
; ���������������������������������������������������������������������������

loc_87CD4:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+26Fj
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	58h ; 'X'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_87D58
		mov	word ptr [di], 73Ch
		mov	word ptr [di+4], 0
		mov	word ptr [di+6], 0
		mov	byte ptr [di+11h], 0
		mov	word ptr [di+12h], 0
		mov	word ptr [di+14h], 0
		mov	byte ptr [di+1Fh], 0
		mov	byte ptr [di+20h], 1
		mov	byte ptr [di+21h], 0
		mov	ax, [bp+var_4]
		mov	[di+2],	ax
		mov	word ptr [di], 8E2h
		mov	dword ptr [di+2Eh], 0
		mov	byte ptr [di+32h], 2
		mov	byte ptr [di+33h], 0
		mov	dword ptr [di+34h], 0
		mov	dword ptr [di+44h], 0
		mov	dword ptr [di+48h], 0
		push	[bp+var_6]
		push	di
		call	VROOMM_StubThunk_6B6A0
		add	sp, 4
		mov	ax, di
		jmp	short loc_87D5A
; ���������������������������������������������������������������������������

loc_87D58:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+28Cj
		mov	ax, di

loc_87D5A:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+2F6j
		mov	[bp+var_2], ax
		push	ax
		push	si
		nop
		push	cs
		call	near ptr TextScroll_AllocateAndInsert_87D74
		add	sp, 4
		push	[bp+arg_4]
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx

loc_87D70:				; CODE XREF: MissionText_LoadSubtitleRecord_87A60+271j
		pop	di
		pop	si
		leave
		retf
MissionText_LoadSubtitleRecord_87A60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue et insère dans une liste (LinkedListB_InsertAtTail_5F57F, seg159).
; ==============================================================================================
TextScroll_AllocateAndInsert_87D74	proc far		; CODE XREF: VROOMM_StubThunk_6B2AEJ MissionText_LoadSubtitleRecord_87A60+F7p	...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_87DAA
		mov	word ptr [di], 8DAh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 8DEh
		mov	ax, [bp+var_4]
		mov	[di+4],	ax
		mov	ax, di
		jmp	short loc_87DAC
; ���������������������������������������������������������������������������

loc_87DAA:				; CODE XREF: TextScroll_AllocateAndInsert_87D74+1Dj
		mov	ax, di

loc_87DAC:				; CODE XREF: TextScroll_AllocateAndInsert_87D74+34j
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_5F57F
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
TextScroll_AllocateAndInsert_87D74	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine TextFormat_ReleaseStyleList_5E526 (×2),
; LinkedListB_FindAndDispatch_5F5A4/Helper_5F6A9 (seg159).
; ==============================================================================================
TextScroll_ReleaseStylesAndFind_87DBD	proc far		; CODE XREF: VROOMM_StubThunk_6B2B3J

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_87DC0:
		sub	sp, 2

loc_87DC3:
		push	si
		mov	si, [bp+arg_0]

loc_87DC7:
		jmp	short loc_87E0B
; ���������������������������������������������������������������������������

loc_87DC9:				; CODE XREF: TextScroll_ReleaseStylesAndFind_87DBD+62j
		mov	bx, [bp+var_2]

loc_87DCC:
		cmp	word ptr [bx+4], 0
		jz	short loc_87DFD

loc_87DD2:
		mov	ax, [bx+4]
		add	ax, 12h
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		mov	bx, [bp+var_2]
		mov	ax, [bx+4]
		add	ax, 4
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_87DFD:				; CODE XREF: TextScroll_ReleaseStylesAndFind_87DBD+13j
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_5F5A4
		add	sp, 6

loc_87E0B:				; CODE XREF: TextScroll_ReleaseStylesAndFind_87DBD:loc_87DC7j
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_87DC9
		pop	si
		leave
		retf
TextScroll_ReleaseStylesAndFind_87DBD	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle LinkedListB_Helper_5F6A9.
; ==============================================================================================
TextScroll_ListHelper_87E24	proc far		; CODE XREF: VROOMM_StubThunk_6B2A4J

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_87E43
; ���������������������������������������������������������������������������

loc_87E35:				; CODE XREF: TextScroll_ListHelper_87E24+2Ej
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx

loc_87E43:				; CODE XREF: TextScroll_ListHelper_87E24+Fj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_87E35
		pop	si
		leave
		retf
TextScroll_ListHelper_87E24	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle LinkedListB_Helper_5F6A9.
; ==============================================================================================
TextScroll_ListHelperB_87E57	proc far		; CODE XREF: VROOMM_StubThunk_6B2A9J

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_87E77
; ���������������������������������������������������������������������������

loc_87E68:				; CODE XREF: TextScroll_ListHelperB_87E57+2Fj
		mov	bx, [bp+var_2]
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+4]
		pop	cx

loc_87E77:				; CODE XREF: TextScroll_ListHelperB_87E57+Fj
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedListB_Helper_5F6A9
		add	sp, 4
		or	ax, ax
		jnz	short loc_87E68
		pop	si
		leave
		retf
TextScroll_ListHelperB_87E57	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CRT_FreeNear_Wrap.
; ==============================================================================================
TextScroll_ReleaseFree_87E8B	proc far		; CODE XREF: VROOMM_StubThunk_6B29AJ

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_87EA9
		mov	word ptr [si], 8DAh
		test	ax, 1
		jz	short loc_87EA9
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_87EA9:				; CODE XREF: TextScroll_ReleaseFree_87E8B+Cj
					; TextScroll_ReleaseFree_87E8B+15j
		pop	si
		pop	bp
		retf
TextScroll_ReleaseFree_87E8B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle CRT_FreeNear_Wrap.
; ==============================================================================================
TextScroll_ReleaseFreeB_87EAC	proc far		; CODE XREF: VROOMM_StubThunk_6B295J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	dx, [bp+arg_2]
		or	ax, ax
		jz	short loc_87EC8
		test	dx, 1
		jz	short loc_87EC8
		push	ax

loc_87EC0:
		call	CRT_FreeNear_Wrap
		pop	cx
		jmp	short $+2

loc_87EC8:				; CODE XREF: TextScroll_ReleaseFreeB_87EAC+Bj
					; TextScroll_ReleaseFreeB_87EAC+11j
		pop	bp
		retf
TextScroll_ReleaseFreeB_87EAC	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle LinkedListB_Helper_5F66B (×2).
; ==============================================================================================
TextScroll_ReleaseListEntries_87ECA	proc far		; CODE XREF: VROOMM_StubThunk_6B290J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_87EFC
		mov	word ptr [si], 922h
		push	si
		call	LinkedListB_Helper_5F66B
		pop	cx
		mov	word ptr [si], 75Ch
		push	si
		call	LinkedListB_Helper_5F66B
		pop	cx
		test	di, 1
		jz	short loc_87EFC
		push	si
		call	CRT_FreeNear_Wrap
		pop	cx

loc_87EFC:				; CODE XREF: TextScroll_ReleaseListEntries_87ECA+Dj
					; TextScroll_ReleaseListEntries_87ECA+29j
		pop	di
		pop	si
		pop	bp
		retf
TextScroll_ReleaseListEntries_87ECA	endp

ovr251		ends
