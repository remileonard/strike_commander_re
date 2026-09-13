seg438		segment	para public 'OVERLAY' use16
		assume cs:seg438
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6C1CA (application de flags, motif seg435) et sub_3A49C (probable
; libération de référence).
; ==============================================================================================
PlayerComponent_ApplyFlagsAndReleaseRef_A0D80	proc far		; CODE XREF: VROOMM_StubThunk_6C670J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		mov	ax, 1209h

loc_A0D8A:
		mov	bx, 5650h
		xor	cx, cx
		int	15h
		mov	cl, 1
		mov	byte_6E33B, cl
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C1CA
		add	sp, 6
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 36h	; '6'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	JDYN_LoadChunkAndConstruct_3A49C
		add	sp, 6
		pop	si
		pop	bp
		retf
PlayerComponent_ApplyFlagsAndReleaseRef_A0D80	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, alloue (sub_658), initialise deux classes de base (sub_3C9BC, sub_3DC27), appelle
; sub_45A57, enregistre dans un conteneur (sub_6C00E), dispatch vtable [bx+8], sub_3D566.
; ==============================================================================================
PlayerComponentVariantR_ConstructAndInit_A0DBA	proc far		; CODE XREF: VROOMM_StubThunk_6C675J

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	65h ; 'e'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A0E08
		push	ax
		call	WorldObject_BaseConstruct
		pop	cx
		mov	word ptr [si+51h], 0

loc_A0DE3:
		mov	word ptr [si], 26A4h
		push	si

loc_A0DE8:
		call	Camera_ResetState
		pop	cx
		mov	word ptr [si], 2B56h
		mov	word ptr [si+57h], 0

loc_A0DF7:
		push	large [bp+var_4]
		push	si

loc_A0DFC:
		call	Missile_InitGuidanceLock

loc_A0E01:
		add	sp, 6
		mov	ax, si
		jmp	short loc_A0E0A
; ���������������������������������������������������������������������������

loc_A0E08:				; CODE XREF: PlayerComponentVariantR_ConstructAndInit_A0DBA+1Bj
		mov	ax, si

loc_A0E0A:				; CODE XREF: PlayerComponentVariantR_ConstructAndInit_A0DBA+4Cj
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C00E
		add	sp, 6
		push	si
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+36h]
		mov	bx, es:[bx+36h]
		mov	bx, [bx]

loc_A0E27:
		call	dword ptr [bx+8]
		add	sp, 4

loc_A0E2D:
		mov	[bp+var_6], ax
		mov	[si+51h], ax
		push	si
		call	Camera_EnableFollowIfActive
		pop	cx
		mov	ax, si
		pop	si
		leave
		retf
PlayerComponentVariantR_ConstructAndInit_A0DBA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 188 lignes, NON DÉTAILLÉE — combine TextFormat_ApplyStyleAttribute_5E2D0 (seg143),
; Widget_ComputeBoundsExtent_60AEB, Widget_RenderComplexLayoutWrapper_60DD1 (seg163), longueur
; vectorielle (sub_5828E), et surtout AI_ComputeApproachAngles_553CF (seg116, ×2) — probable
; widget HUD affichant un angle d'approche/aspect calculé, avec formatage de texte via
; sub_2945. Candidat pour session dédiée.
; ==============================================================================================
HUD_RenderApproachAngleWidget_A0E3F	proc far		; CODE XREF: VROOMM_StubThunk_6C67AJ

var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_16		= word ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, word_70E60
		mov	[bp+var_2], ax
		push	ax

loc_A0E51:
		mov	ax, word_6E343
		add	ax, 2

loc_A0E57:
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		push	large 140000h
		push	word_6E343
		call	Widget_ComputeBoundsExtent_60AEB
		add	sp, 6
		push	si
		push	ss
		lea	ax, [bp+var_36]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		push	large [bp+var_2E]

loc_A0E84:
		push	large [bp+var_32]

loc_A0E88:
		push	large [bp+var_36]
		call	Math_VectorLength3D_Raw_5828E
		push	dx

loc_A0E92:
		push	ax
		pop	eax

loc_A0E95:
		add	sp, 0Ch
		mov	[bp+var_A], eax
		mov	[bp+var_6], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		push	ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	AI_ComputeApproachAngles_553CF
		add	sp, 6
		mov	ax, [bp+var_10+1]
		mov	[bp+var_C], ax
		mov	di, si
		add	di, 59h	; 'Y'
		mov	dx, si
		add	dx, 12h
		mov	eax, [di]
		mov	bx, dx
		sub	eax, [bx]
		mov	[bp+var_4E], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_4A], eax
		mov	eax, [di+8]

loc_A0EE4:
		sub	eax, [bx+8]

loc_A0EE8:
		mov	[bp+var_46], eax
		mov	eax, [bp+var_4E]

loc_A0EF0:
		mov	[bp+var_42], eax

loc_A0EF4:
		mov	eax, [bp+var_4A]
		mov	[bp+var_3E], eax

loc_A0EFC:
		mov	eax, [bp+var_46]

loc_A0F00:
		mov	[bp+var_3A], eax

loc_A0F04:
		lea	ax, [bp+var_42]
		push	ax
		push	ss
		lea	ax, [bp+var_16]
		push	ax
		call	AI_ComputeApproachAngles_553CF
		add	sp, 6
		mov	ax, [bp+var_16+1]
		mov	[bp+var_12], ax
		push	word ptr [bp+var_6+1]
		push	ax
		push	[bp+var_C]

loc_A0F22:
		push	2BE2h
		lea	ax, [bp+var_2A]
		push	ax

loc_A0F29:
		call	CRT_Msg_Sprintf1
		add	sp, 0Ah

loc_A0F31:
		lea	ax, [bp+var_2A]
		push	ax
		push	word_6E343
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		mov	eax, [si+16h]

loc_A0F45:
		sar	eax, 8
		push	eax
		mov	eax, [si+12h]

loc_A0F4F:
		sar	eax, 8
		push	eax
		push	2BF5h
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		lea	ax, [bp+var_2A]
		push	ax
		push	word_6E343
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		mov	eax, [si+5Dh]
		sar	eax, 8
		push	eax

loc_A0F7E:
		mov	eax, [si+59h]
		sar	eax, 8

loc_A0F86:
		push	eax
		push	2C08h
		lea	ax, [bp+var_2A]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 0Ch
		lea	ax, [bp+var_2A]
		push	ax
		push	word_6E343
		call	Widget_RenderComplexLayoutWrapper_60DD1
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
HUD_RenderApproachAngleWidget_A0E3F	endp

seg438		ends
