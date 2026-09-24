ovr230		segment	para public 'OVERLAY' use16
		assume cs:ovr230
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_EC22 (externe, 15 lignes).
; ==============================================================================================
AITargeting_Helper_75730	proc far		; CODE XREF: VROOMM_StubThunk_6ABA3J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	[bp+arg_4]
		push	large [bp+arg_0]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	al, 0
		pop	bp
		retf
AITargeting_Helper_75730	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 334 lignes, NON DÉTAILLÉE — grande frame locale (0x11C octets), dispatch vtable
; [bx+4], combine sub_6AB4F, sub_43D9B, UIScreen_RenderOrLayoutList_54503 (seg114), sub_6AEF3,
; sub_6AB45 (×2) — probable affichage d'une liste de menaces/cibles suivies sur un élément
; d'interface (HUD ou radar).
; ==============================================================================================
AITargeting_RenderThreatList_75746	proc far		; CODE XREF: VROOMM_StubThunk_6ABA8J

var_11C		= dword	ptr -11Ch
var_114		= word ptr -114h
var_C4		= word ptr -0C4h
var_67		= dword	ptr -67h
var_63		= dword	ptr -63h
var_5F		= dword	ptr -5Fh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_C		= byte ptr -0Ch
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_1		= byte ptr -1
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 114h
		push	si
		push	di
		mov	si, [bp+arg_4]
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ch]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7576D
		push	si
		push	word ptr [bp+arg_0+2]
		push	bx
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6

loc_7576D:				; CODE XREF: AITargeting_RenderThreatList_75746+17j
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6AB4F
		add	sp, 6
		cmp	word ptr [si+2], 0
		jz	short loc_757A2
		mov	di, [si+2]
		mov	eax, [di]
		les	bx, [bp+arg_0]
		mov	es:[bx+15h], eax
		mov	eax, [di+4]
		mov	es:[bx+19h], eax
		mov	eax, [di+8]
		mov	es:[bx+1Dh], eax
		jmp	short loc_757B7
; ���������������������������������������������������������������������������

loc_757A2:				; CODE XREF: AITargeting_RenderThreatList_75746+38j
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+1Dh], eax
		mov	es:[bx+19h], eax
		mov	es:[bx+15h], eax

loc_757B7:				; CODE XREF: AITargeting_RenderThreatList_75746+5Aj
		cmp	word ptr [si+4], 0
		jz	short loc_757E1
		mov	si, [si+4]
		mov	eax, [si]
		les	bx, [bp+arg_0]
		mov	es:[bx+7Ch], eax
		mov	eax, [si+4]
		mov	es:[bx+80h], eax
		mov	eax, [si+8]
		mov	es:[bx+84h], eax
		jmp	short loc_757F8
; ���������������������������������������������������������������������������

loc_757E1:				; CODE XREF: AITargeting_RenderThreatList_75746+75j
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+84h], eax
		mov	es:[bx+80h], eax
		mov	es:[bx+7Ch], eax

loc_757F8:				; CODE XREF: AITargeting_RenderThreatList_75746+99j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+22h], 1
		mov	[bp+var_1], 0
		mov	cl, 1
		mov	ax, es:[bx+11h]
		cmp	ax, word_722E6
		jz	short loc_75854
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 7Ch	; '|'
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		les	si, [bp+var_6]
		mov	eax, es:[si]
		mov	es, word ptr [bp+arg_0+2]
		mov	bx, es:[bx+11h]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+1Ah], eax
		jmp	short loc_7587E
; ���������������������������������������������������������������������������

loc_75854:				; CODE XREF: AITargeting_RenderThreatList_75746+C9j
		push	ds
		push	offset aLandgear_0 ; "LANDGEAR"
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+11h]
		push	large dword ptr	[bx+5Eh]
		call	Roster_FindByNameOrder
		add	sp, 8
		mov	[bp+var_1], al
		push	1
		push	word_706A0
		call	UIScreen_RenderOrLayoutList_54503
		add	sp, 4
		mov	cl, al

loc_7587E:				; CODE XREF: AITargeting_RenderThreatList_75746+10Cj
		cmp	[bp+var_1], 0
		jz	short loc_758AF
		sub	sp, 4
		mov	[bp+var_11C], 500h
		push	ds
		push	offset aLandingGearDam ; "Landing Gear Damaged"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4
		jmp	loc_75AA2
; ���������������������������������������������������������������������������

loc_758AF:				; CODE XREF: AITargeting_RenderThreatList_75746+13Cj
		mov	al, cl
		mov	ah, 0
		or	ax, ax
		jnz	short loc_758C6
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4
		jmp	loc_75AA2
; ���������������������������������������������������������������������������

loc_758C6:				; CODE XREF: AITargeting_RenderThreatList_75746+16Fj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+11h]
		cmp	ax, word_722E6
		jnz	short loc_758E4
		mov	[bp+var_A], 2300h
		mov	eax, [bp+var_A]
		sub	dword_706AB, eax

loc_758E4:				; CODE XREF: AITargeting_RenderThreatList_75746+18Bj
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx]
		pop	cx
		mov	[bp+var_16], dx
		mov	[bp+var_18], ax
		mov	ax, [bp+var_16]
		mov	dx, [bp+var_18]
		add	dx, 2Bh	; '+'
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], dx
		push	8
		push	ax
		push	dx
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		call	CRT_MemFamily_Extra8
		add	sp, 0Ah
		mov	[bp+var_C], 0
		lea	ax, [bp+var_C4]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_C4], 2C8h
		mov	[bp+var_63], 100h
		mov	[bp+var_67], 0
		mov	[bp+var_C4], 2E0h
		mov	[bp+var_48], 0
		xor	ax, ax
		mov	[bp+var_4A], ax
		movsx	eax, ax
		mov	[bp+var_5F], eax
		push	seg seg215
		push	offset a_iff	; ".IFF"
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		push	ds
		push	offset aObjects	; "OBJECTS"
		lea	ax, [bp+var_114]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_114]
		push	ax
		lea	ax, [bp+var_C4]
		push	ax
		mov	bx, [bp+var_C4]
		call	dword ptr [bx+14h]
		add	sp, 6
		or	al, al
		jnz	short loc_75990
		jmp	loc_75A72
; ���������������������������������������������������������������������������

loc_75990:				; CODE XREF: AITargeting_RenderThreatList_75746+245j
		push	0
		push	large 'LAER'    ; REAL
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_759AC
		jmp	loc_75A72
; ���������������������������������������������������������������������������

loc_759AC:				; CODE XREF: AITargeting_RenderThreatList_75746+261j
		push	0
		push	large 'TJBO'    ; OBJT
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_759C8
		jmp	loc_75A72
; ���������������������������������������������������������������������������

loc_759C8:				; CODE XREF: AITargeting_RenderThreatList_75746+27Dj
		push	0
		push	large 'PTEJ'    ; JETP
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_SeekAndReadB_647B2
		add	sp, 8
		or	ax, ax
		jnz	short loc_759E4
		jmp	loc_75A72
; ���������������������������������������������������������������������������

loc_759E4:				; CODE XREF: AITargeting_RenderThreatList_75746+299j
		push	0
		push	large 'DNAL'    ; LAND
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_75A50
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+95h], ax
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+97h], eax
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+9Bh], ax
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_64A54
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+9Dh], ax
		jmp	short loc_75A72
; ���������������������������������������������������������������������������

loc_75A50:				; CODE XREF: AITargeting_RenderThreatList_75746+2B5j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+95h], 0C8h ; '�'
		mov	dword ptr es:[bx+97h], 64h ; 'd'
		mov	word ptr es:[bx+9Bh], 6
		mov	word ptr es:[bx+9Dh], 14h

loc_75A72:				; CODE XREF: AITargeting_RenderThreatList_75746+247j
					; AITargeting_RenderThreatList_75746+263j ...
		push	large [bp+arg_0]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		mov	[bp+var_C4], 2E0h
		lea	ax, [bp+var_C4]
		push	ax
		call	ResourceRecord_Helper_645A5
		pop	cx
		push	0
		lea	ax, [bp+var_C4]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4

loc_75AA2:				; CODE XREF: AITargeting_RenderThreatList_75746+166j
					; AITargeting_RenderThreatList_75746+17Dj
		pop	di
		pop	si
		leave
		retf
AITargeting_RenderThreatList_75746	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 125 lignes, NON DÉTAILLÉE — combine Vector_TransformHelperB_559BB (seg116) et
; AITargeting_ComputeSolution_75D51.
; ==============================================================================================
AITargeting_ComputeGeometry_75AA6	proc far		; CODE XREF: VROOMM_StubThunk_6AB85J AITargeting_UpdateAndRender_75C18+8Ep

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
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 38h
		push	si
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 15h
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_20], eax
		mov	eax, es:[si+4]
		mov	[bp+var_1C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_18], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 7Ch	; '|'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	si, [bp+var_8]
		mov	eax, es:[si]
		mov	[bp+var_2C], eax
		mov	eax, es:[si+4]
		mov	[bp+var_28], eax
		mov	eax, es:[si+8]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_2C]
		sub	[bp+var_20], eax
		mov	eax, [bp+var_28]
		sub	[bp+var_1C], eax
		mov	eax, [bp+var_24]
		sub	[bp+var_18], eax
		lea	ax, [bp+var_20]
		push	ax
		call	Vector_Normalize3D_559BB
		pop	cx
		mov	[bp+var_C], 1F400h
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_18]
		mov	edx, [bp+var_C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 15h
		mov	word ptr [bp+var_10+2],	ax
		mov	word ptr [bp+var_10], dx
		les	si, [bp+var_10]
		mov	eax, es:[si]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+1Ah], eax
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	eax, [bp+var_20]
		sub	[bx+12h], eax
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	eax, [bp+var_1C]
		sub	[bx+16h], eax
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	eax, [bp+var_18]
		sub	[bx+1Ah], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 15h
		mov	word ptr [bp+var_14+2],	ax
		mov	word ptr [bp+var_14], dx
		les	si, [bp+var_14]
		mov	eax, es:[si]
		mov	[bp+var_38], eax
		mov	eax, es:[si+4]
		mov	[bp+var_34], eax
		mov	eax, es:[si+8]
		mov	[bp+var_30], eax
		lea	ax, [bp+var_38]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AITargeting_ComputeSolution_75D51
		add	sp, 6
		pop	si
		leave
		retf
AITargeting_ComputeGeometry_75AA6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 158 lignes, NON DÉTAILLÉE — combine AITargeting_ApplyRangeCheck_76E67, sub_6AB45
; (×2), AITargeting_ComputeGeometry_75AA6, sub_23C4F, AITargeting_ComputeSolution_75D51.
; ==============================================================================================
AITargeting_UpdateAndRender_75C18	proc far		; CODE XREF: VROOMM_StubThunk_6AB9EJ

var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+11h]
		cmp	ax, word_722E6
		jnz	short loc_75C55
		mov	al, byte_722D1
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_75C38
		jmp	short loc_75C55
; ���������������������������������������������������������������������������

loc_75C38:				; CODE XREF: AITargeting_UpdateAndRender_75C18+1Cj
		push	1
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AITargeting_ApplyRangeCheck_76E67
		add	sp, 6
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6AB45
		add	sp, 4
		jmp	loc_75D42
; ���������������������������������������������������������������������������

loc_75C55:				; CODE XREF: AITargeting_UpdateAndRender_75C18+12j
					; AITargeting_UpdateAndRender_75C18+1Ej
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		push	word ptr es:[bx+0Bh]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx+2]
		call	dword ptr [bx+48h]
		pop	cx
		mov	bx, ax
		and	byte ptr [bx+75h], 0DFh
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+22h]
		dec	bx
		cmp	bx, 5		; switch 6 cases
		ja	short loc_75C85	; default
		shl	bx, 1
		jmp	cs:off_75D45[bx] ; switch jump
; ���������������������������������������������������������������������������

loc_75C85:				; CODE XREF: AITargeting_UpdateAndRender_75C18+64j
		push	large [bp+arg_0] ; default
		call	VROOMM_StubThunk_6AB45
		add	sp, 4
		jmp	loc_75D42
; ���������������������������������������������������������������������������

loc_75C94:				; CODE XREF: AITargeting_UpdateAndRender_75C18+68j
					; DATA XREF: ovr230:off_75D45o
		les	bx, [bp+arg_0]	; case 0x0
		mov	ax, es:[bx+11h]
		cmp	ax, word_722E6
		jnz	short loc_75CBE
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr AITargeting_ComputeGeometry_75AA6
		add	sp, 4
		push	ds
		push	offset aLanding	; "LANDING"
		push	59CDh
		call	EntityTracker_SelectByID
		add	sp, 6
		jmp	loc_75D42
; ���������������������������������������������������������������������������

loc_75CBE:				; CODE XREF: AITargeting_UpdateAndRender_75C18+87j
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 15h
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		les	si, [bp+var_4]
		mov	eax, es:[si]
		mov	[bp+var_10], eax
		mov	eax, es:[si+4]
		mov	[bp+var_C], eax
		mov	eax, es:[si+8]
		mov	[bp+var_8], eax
		lea	ax, [bp+var_10]
		push	ax
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AITargeting_ComputeSolution_75D51
		add	sp, 6
		jmp	short loc_75D42
; ���������������������������������������������������������������������������

loc_75CFC:				; CODE XREF: AITargeting_UpdateAndRender_75C18+68j
					; DATA XREF: ovr230:off_75D45o
		push	large [bp+arg_0] ; case	0x1
		nop
		push	cs
		call	near ptr AITargeting_ComputeOrientation_76325
		add	sp, 4
		jmp	short loc_75D42
; ���������������������������������������������������������������������������

loc_75D0A:				; CODE XREF: AITargeting_UpdateAndRender_75C18+68j
					; DATA XREF: ovr230:off_75D45o
		push	large [bp+arg_0] ; case	0x2
		nop
		push	cs
		call	near ptr AITargeting_ComputeOrientationExtended_765B2
		add	sp, 4
		jmp	short loc_75D42
; ���������������������������������������������������������������������������

loc_75D18:				; CODE XREF: AITargeting_UpdateAndRender_75C18+68j
					; DATA XREF: ovr230:off_75D45o
		push	large [bp+arg_0] ; case	0x3
		nop
		push	cs
		call	near ptr AITargeting_Helper2_76C09
		add	sp, 4
		jmp	short loc_75D42
; ���������������������������������������������������������������������������

loc_75D26:				; CODE XREF: AITargeting_UpdateAndRender_75C18+68j
					; DATA XREF: ovr230:off_75D45o
		push	0		; case 0x4
		push	large [bp+arg_0]
		nop
		push	cs
		call	near ptr AITargeting_ApplyRangeCheck_76E67
		add	sp, 6
		jmp	short loc_75D42
; ���������������������������������������������������������������������������

loc_75D36:				; CODE XREF: AITargeting_UpdateAndRender_75C18+68j
					; DATA XREF: ovr230:off_75D45o
		push	large [bp+arg_0] ; case	0x5
		call	VROOMM_StubThunk_6AB45
		add	sp, 4

loc_75D42:				; CODE XREF: AITargeting_UpdateAndRender_75C18+3Aj
					; AITargeting_UpdateAndRender_75C18+79j ...
		pop	si
		leave
		retf
AITargeting_UpdateAndRender_75C18	endp

; ���������������������������������������������������������������������������
off_75D45	dw offset loc_75C94	; DATA XREF: AITargeting_UpdateAndRender_75C18+68r
		dw offset loc_75CFC	; jump table for switch	statement
		dw offset loc_75D0A
		dw offset loc_75D18
		dw offset loc_75D26
		dw offset loc_75D36

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 558 lignes, NON DÉTAILLÉE — combine longueur vectorielle (sub_5828E, seg117),
; Vector_NormalizeInPlace_5593A (seg116, ×3+), AI_ComputeGeometryHelper_56E29 — probable
; calcul complet de solution de ciblage (ligne de vue, distance, géométrie). Candidat
; prioritaire pour session dédiée.
; ==============================================================================================
AITargeting_ComputeSolution_75D51	proc far		; CODE XREF: VROOMM_StubThunk_6AB80J AITargeting_ComputeGeometry_75AA6+169p ...

var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_8A		= dword	ptr -8Ah
var_86		= dword	ptr -86h
var_82		= dword	ptr -82h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 96h
		push	si
		les	bx, [bp+arg_0]
		mov	si, es:[bx+11h]
		add	si, 12h
		mov	eax, [si]
		mov	es:[bx+64h], eax
		mov	eax, [si+4]
		mov	es:[bx+68h], eax
		mov	eax, [si+8]
		mov	es:[bx+6Ch], eax
		mov	si, [bp+arg_4]
		mov	eax, [si]
		mov	[bp+var_42], eax
		mov	eax, [si+4]
		mov	[bp+var_3E], eax
		mov	eax, [si+8]
		mov	[bp+var_3A], eax
		mov	ax, es:[bx+9Bh]
		mov	[bp+var_2], ax
		movsx	eax, [bp+var_2]
		shl	eax, 8
		add	[bp+var_3A], eax
		mov	eax, [bp+var_42]
		mov	es:[bx+70h], eax
		mov	eax, [bp+var_3E]
		mov	es:[bx+74h], eax
		mov	eax, [bp+var_3A]
		mov	es:[bx+78h], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 64h	; 'd'
		mov	word ptr [bp+var_6+2], ax
		mov	word ptr [bp+var_6], dx
		les	si, [bp+var_6]
		mov	eax, es:[si]
		mov	[bp+var_5A], eax
		mov	eax, es:[si+4]
		mov	[bp+var_56], eax
		mov	eax, es:[si+8]
		mov	[bp+var_52], eax
		mov	eax, [bp+var_42]
		sub	eax, [bp+var_5A]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_3E]
		sub	eax, [bp+var_56]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_3A]
		sub	eax, [bp+var_52]
		mov	[bp+var_46], eax
		cmp	[bp+var_4E], 0
		jnz	short loc_75E23
		mov	ax, 1
		jmp	short loc_75E25
; ���������������������������������������������������������������������������

loc_75E23:				; CODE XREF: AITargeting_ComputeSolution_75D51+CBj
		xor	ax, ax

loc_75E25:				; CODE XREF: AITargeting_ComputeSolution_75D51+D0j
		or	al, al
		jz	short loc_75E48
		cmp	[bp+var_4A], 0
		jle	short loc_75E35
		mov	ax, 1
		jmp	short loc_75E37
; ���������������������������������������������������������������������������

loc_75E35:				; CODE XREF: AITargeting_ComputeSolution_75D51+DDj
		xor	ax, ax

loc_75E37:				; CODE XREF: AITargeting_ComputeSolution_75D51+E2j
		or	al, al
		jz	short loc_75E48
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+9Fh], 0
		jmp	loc_75ED6
; ���������������������������������������������������������������������������

loc_75E48:				; CODE XREF: AITargeting_ComputeSolution_75D51+D6j
					; AITargeting_ComputeSolution_75D51+E8j
		cmp	[bp+var_4E], 0
		jnz	short loc_75E54
		mov	ax, 1
		jmp	short loc_75E56
; ���������������������������������������������������������������������������

loc_75E54:				; CODE XREF: AITargeting_ComputeSolution_75D51+FCj
		xor	ax, ax

loc_75E56:				; CODE XREF: AITargeting_ComputeSolution_75D51+101j
		or	al, al
		jz	short loc_75E78
		cmp	[bp+var_4A], 0
		jge	short loc_75E66
		mov	ax, 1
		jmp	short loc_75E68
; ���������������������������������������������������������������������������

loc_75E66:				; CODE XREF: AITargeting_ComputeSolution_75D51+10Ej
		xor	ax, ax

loc_75E68:				; CODE XREF: AITargeting_ComputeSolution_75D51+113j
		or	al, al
		jz	short loc_75E78
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+9Fh], 0B4h ; '�'
		jmp	short loc_75ED6
; ���������������������������������������������������������������������������

loc_75E78:				; CODE XREF: AITargeting_ComputeSolution_75D51+107j
					; AITargeting_ComputeSolution_75D51+119j
		cmp	[bp+var_4A], 0
		jnz	short loc_75E84
		mov	ax, 1
		jmp	short loc_75E86
; ���������������������������������������������������������������������������

loc_75E84:				; CODE XREF: AITargeting_ComputeSolution_75D51+12Cj
		xor	ax, ax

loc_75E86:				; CODE XREF: AITargeting_ComputeSolution_75D51+131j
		or	al, al
		jz	short loc_75EA8
		cmp	[bp+var_4E], 0
		jle	short loc_75E96
		mov	ax, 1
		jmp	short loc_75E98
; ���������������������������������������������������������������������������

loc_75E96:				; CODE XREF: AITargeting_ComputeSolution_75D51+13Ej
		xor	ax, ax

loc_75E98:				; CODE XREF: AITargeting_ComputeSolution_75D51+143j
		or	al, al
		jz	short loc_75EA8
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+9Fh], 10Eh
		jmp	short loc_75ED6
; ���������������������������������������������������������������������������

loc_75EA8:				; CODE XREF: AITargeting_ComputeSolution_75D51+137j
					; AITargeting_ComputeSolution_75D51+149j
		cmp	[bp+var_4A], 0
		jnz	short loc_75EB4
		mov	ax, 1
		jmp	short loc_75EB6
; ���������������������������������������������������������������������������

loc_75EB4:				; CODE XREF: AITargeting_ComputeSolution_75D51+15Cj
		xor	ax, ax

loc_75EB6:				; CODE XREF: AITargeting_ComputeSolution_75D51+161j
		or	al, al
		jz	short loc_75ED6
		cmp	[bp+var_4E], 0
		jge	short loc_75EC6
		mov	ax, 1
		jmp	short loc_75EC8
; ���������������������������������������������������������������������������

loc_75EC6:				; CODE XREF: AITargeting_ComputeSolution_75D51+16Ej
		xor	ax, ax

loc_75EC8:				; CODE XREF: AITargeting_ComputeSolution_75D51+173j
		or	al, al
		jz	short loc_75ED6
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+9Fh], 5Ah ; 'Z'

loc_75ED6:				; CODE XREF: AITargeting_ComputeSolution_75D51+F4j
					; AITargeting_ComputeSolution_75D51+125j ...
		push	large [bp+var_46]
		push	large [bp+var_4A]
		push	large [bp+var_4E]
		call	Math_VectorLength3D_Raw_5828E
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_E], eax
		mov	[bp+var_A], eax
		lea	ax, [bp+var_4E]
		push	ax
		call	Vector_NormalizeInPlace_5593A
		pop	cx
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_4E]
		mov	es:[bx+88h], eax
		mov	eax, [bp+var_4A]
		mov	es:[bx+8Ch], eax
		mov	eax, [bp+var_46]
		mov	es:[bx+90h], eax
		mov	ax, es:[bx+95h]
		mov	[bp+var_10], ax
		movsx	eax, [bp+var_10]
		shl	eax, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	es:[bx+48h], eax
		mov	ax, es:[bx+95h]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	es:[bx+4Ch], eax
		push	large 0
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	eax, [bp+var_66]
		mov	[bx+8],	eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	eax, [bp+var_62]
		mov	[bx+0Ch], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	eax, [bp+var_5E]
		mov	[bx+10h], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx]
		add	ax, 8
		lea	ax, [bp+var_66]
		push	ax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		push	word ptr es:[bx+0Bh]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx+2]
		call	dword ptr [bx+10h]
		add	sp, 4
		mov	[bp+var_1E], 0
		mov	eax, [bp+var_1E]
		les	bx, [bp+arg_0]
		mov	es:[bx+54h], eax
		mov	[bp+var_22], 0
		mov	eax, [bp+var_22]
		mov	es:[bx+5Ch], eax
		mov	byte ptr es:[bx+94h], 0
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 48h	; 'H'
		mov	word ptr [bp+var_2E+2],	ax
		mov	word ptr [bp+var_2E], dx
		les	bx, [bp+var_2E]
		mov	eax, es:[bx]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_A]
		mov	edx, eax
		mov	ecx, [bp+var_2A]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_26], eax
		mov	eax, [bp+var_26]
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		les	bx, [bp+arg_0]
		mov	es:[bx+58h], eax
		mov	bx, es:[bx+11h]
		mov	byte ptr [bx+59h], 1
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		or	byte ptr [bx+75h], 4
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Fh]
		mov	[bp+var_34], ax
		mov	cx, 4		; switch 4 cases
		mov	bx, offset word_76315

loc_76074:				; CODE XREF: AITargeting_ComputeSolution_75D51+32Ej
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_34]
		jz	short loc_76084
		add	bx, 2
		loop	loc_76074
		jmp	loc_7630B	; default
; ���������������������������������������������������������������������������

loc_76084:				; CODE XREF: AITargeting_ComputeSolution_75D51+329j
		jmp	word ptr cs:[bx+8] ; switch jump

loc_76088:				; DATA XREF: ovr230:0BEDo
		push	large 1		; case 0x0
		push	0
		lea	ax, [bp+var_72]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_36], ax
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	eax, [bp+var_72]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_82], eax
		push	large 0
		push	1
		lea	ax, [bp+var_72]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		mov	eax, [bp+var_72]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_8E], eax
		lea	ax, [bp+var_96]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	loc_7630B	; default
; ���������������������������������������������������������������������������

loc_76128:				; CODE XREF: AITargeting_ComputeSolution_75D51:loc_76084j
					; DATA XREF: ovr230:0BEDo
		push	large 0		; case 0x10E
		push	1
		lea	ax, [bp+var_72]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_36], ax
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	eax, [bp+var_72]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_82], eax
		push	large 0FFFFh
		push	0
		lea	ax, [bp+var_72]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		mov	eax, [bp+var_72]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_8E], eax
		lea	ax, [bp+var_96]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	loc_7630B	; default
; ���������������������������������������������������������������������������

loc_761CB:				; CODE XREF: AITargeting_ComputeSolution_75D51:loc_76084j
					; DATA XREF: ovr230:0BEDo
		push	large 0FFFFh	; case 0xB4
		push	0
		lea	ax, [bp+var_72]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_36], ax
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	eax, [bp+var_72]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_82], eax
		push	large 0
		push	0FFFFh
		lea	ax, [bp+var_72]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		mov	eax, [bp+var_72]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_8E], eax
		lea	ax, [bp+var_96]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	loc_7630B	; default
; ���������������������������������������������������������������������������

loc_7626E:				; CODE XREF: AITargeting_ComputeSolution_75D51:loc_76084j
					; DATA XREF: ovr230:0BEDo
		push	large 0		; case 0x5A
		push	0FFFFh
		lea	ax, [bp+var_72]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_36], ax
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	eax, [bp+var_72]
		mov	[bp+var_8A], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_86], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_82], eax
		push	large 1
		push	0
		lea	ax, [bp+var_72]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		mov	eax, [bp+var_72]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_6E]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_6A]
		mov	[bp+var_8E], eax
		lea	ax, [bp+var_96]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_7630B:				; CODE XREF: AITargeting_ComputeSolution_75D51+330j
					; AITargeting_ComputeSolution_75D51+3D4j ...
		les	bx, [bp+arg_0]	; default
		inc	word ptr es:[bx+22h]
		pop	si
		leave
		retf
AITargeting_ComputeSolution_75D51	endp

; ���������������������������������������������������������������������������
word_76315	dw	0,   5Ah,  0B4h,  10Eh ; DATA XREF: AITargeting_ComputeSolution_75D51+320o
					; value	table for switch statement
		dw offset loc_76088	; jump table for switch	statement
		dw offset loc_7626E
		dw offset loc_761CB
		dw offset loc_76128

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 214 lignes, NON DÉTAILLÉE — combine AI_ComputeGeometryHelper_56E29,
; Matrix_BuildAxisX_56EC3, Matrix_OrthonormalizeKeepRow1_57660 (seg116) — calcul d'orientation
; pour la solution de ciblage.
; ==============================================================================================
AITargeting_ComputeOrientation_76325	proc far		; CODE XREF: VROOMM_StubThunk_6AB8AJ AITargeting_UpdateAndRender_75C18+EAp

var_84		= word ptr -84h
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
var_38		= word ptr -38h
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 84h
		push	si
		push	di
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+23h], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+27h], eax
		mov	[bp+var_10], 100h
		mov	eax, [bp+var_10]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	[bx+7Ch], eax
		les	bx, [bp+arg_0]
		mov	eax, dword_70458
		add	es:[bx+5Ch], eax
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		sub	es:[bx+54h], eax
		mov	eax, es:[bx+54h]
		sar	eax, 8
		movsx	edx, word ptr es:[bx+9Dh]
		cmp	eax, edx
		jge	short loc_763EF
		mov	ax, es:[bx+9Dh]
		mov	[bp+var_16], ax
		movsx	eax, [bp+var_16]
		shl	eax, 8
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	es:[bx+54h], eax
		jmp	short loc_7644D
; ���������������������������������������������������������������������������

loc_763EF:				; CODE XREF: AITargeting_ComputeOrientation_76325+A8j
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_38], ax
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	[bp+var_3C], 100h
		lea	ax, [bp+var_3C]
		push	ax
		lea	ax, [bp+var_84]
		push	ax
		call	Matrix_BuildAxisX_56EC3
		add	sp, 4
		lea	ax, [bp+var_84]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		lea	ax, [bp+var_84]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_7644D:				; CODE XREF: AITargeting_ComputeOrientation_76325+C8j
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 88h	; '�'
		mov	word ptr [bp+var_1E+2],	ax
		mov	word ptr [bp+var_1E], dx
		les	si, [bp+var_1E]
		mov	eax, es:[si]
		mov	[bp+var_48], eax
		mov	eax, es:[si+4]
		mov	[bp+var_44], eax
		mov	eax, es:[si+8]
		mov	[bp+var_40], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 48h	; 'H'
		mov	word ptr [bp+var_26+2],	ax
		mov	word ptr [bp+var_26], dx
		les	bx, [bp+var_26]
		mov	eax, es:[bx]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_48]
		mov	edx, [bp+var_22]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_22]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_22]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 5Ch	; '\'
		mov	word ptr [bp+var_2E+2],	ax
		mov	word ptr [bp+var_2E], dx
		les	bx, [bp+var_2E]
		mov	eax, es:[bx]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_48]
		mov	edx, [bp+var_2A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_54], eax
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_2A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_50], eax
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_2A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4C], eax
		les	bx, [bp+arg_0]
		mov	si, es:[bx+11h]
		add	si, 12h
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 64h	; 'd'
		mov	word ptr [bp+var_32+2],	ax
		mov	word ptr [bp+var_32], dx
		les	di, [bp+var_32]
		mov	eax, es:[di]
		mov	[bp+var_60], eax
		mov	eax, es:[di+4]
		mov	[bp+var_5C], eax
		mov	eax, es:[di+8]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_60]
		add	eax, [bp+var_54]
		mov	[si], eax
		mov	eax, [bp+var_5C]
		add	eax, [bp+var_50]
		mov	[si+4],	eax
		mov	eax, [bp+var_58]
		add	eax, [bp+var_4C]
		mov	[si+8],	eax
		mov	es, word ptr [bp+arg_0+2]
		mov	eax, es:[bx+5Ch]
		sar	eax, 8
		mov	edx, es:[bx+58h]
		sar	edx, 8
		cmp	eax, edx
		jl	short loc_765AE
		mov	[bp+var_36], 0
		mov	eax, [bp+var_36]
		mov	es:[bx+5Ch], eax
		inc	word ptr es:[bx+22h]

loc_765AE:				; CODE XREF: AITargeting_ComputeOrientation_76325+272j
		pop	di
		pop	si
		leave
		retf
AITargeting_ComputeOrientation_76325	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 594 lignes — plus grosse fonction du segment, NON DÉTAILLÉE — combine
; AI_ComputeGeometryHelper_56E29, Matrix_BuildAxisX_56EC3,
; Matrix_OrthonormalizeKeepRow1_57660, Vector_NormalizeInPlace_5593A (×3+, seg116) — variante
; étendue de AITargeting_ComputeOrientation_76325. Candidat prioritaire pour session dédiée.
; ==============================================================================================
AITargeting_ComputeOrientationExtended_765B2	proc far		; CODE XREF: VROOMM_StubThunk_6AB8FJ AITargeting_UpdateAndRender_75C18+F8p

var_A2		= dword	ptr -0A2h
var_9E		= dword	ptr -9Eh
var_9A		= dword	ptr -9Ah
var_96		= dword	ptr -96h
var_92		= dword	ptr -92h
var_8E		= dword	ptr -8Eh
var_7E		= dword	ptr -7Eh
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6E		= dword	ptr -6Eh
var_6A		= dword	ptr -6Ah
var_66		= dword	ptr -66h
var_62		= dword	ptr -62h
var_5E		= dword	ptr -5Eh
var_5A		= word ptr -5Ah
var_58		= dword	ptr -58h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_50		= word ptr -50h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= dword	ptr -2Eh
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1E		= dword	ptr -1Eh
var_1A		= dword	ptr -1Ah
var_16		= dword	ptr -16h
var_12		= word ptr -12h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0A2h
		push	si
		push	di
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 5Ch	; '\'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 0
		jnz	short loc_765E1
		mov	ax, 1
		jmp	short loc_765E3
; ���������������������������������������������������������������������������

loc_765E1:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+28j
		xor	ax, ax

loc_765E3:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+2Dj
		or	al, al
		jz	short loc_76628
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 70h	; 'p'
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		les	si, [bp+var_C]
		mov	eax, es:[si]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+1Ah], eax

loc_76628:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+33j
		mov	[bp+var_10], 100h
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_10]
		add	es:[bx+54h], eax
		mov	ax, es:[bx+9Dh]
		mov	bx, 6
		cwd
		idiv	bx
		mov	[bp+var_12], ax
		mov	bx, word ptr [bp+arg_0]
		mov	eax, es:[bx+54h]
		sar	eax, 8
		movsx	edx, [bp+var_12]
		cmp	eax, edx
		jl	short loc_76673
		mov	[bp+var_16], 0
		mov	eax, [bp+var_16]
		mov	es:[bx+54h], eax
		jmp	short loc_766D1
; ���������������������������������������������������������������������������

loc_76673:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+ACj
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_54], ax
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	[bp+var_58], 0FFFFFF00h
		lea	ax, [bp+var_58]
		push	ax
		lea	ax, [bp+var_96]
		push	ax
		call	Matrix_BuildAxisX_56EC3
		add	sp, 4
		lea	ax, [bp+var_96]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		lea	ax, [bp+var_96]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_766D1:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+BFj
		les	bx, [bp+arg_0]
		mov	eax, dword_70458
		add	es:[bx+5Ch], eax
		mov	ax, es:[bx+9Fh]
		mov	[bp+var_50], ax
		mov	cx, 4		; switch 4 cases
		mov	bx, offset word_76BF9

loc_766EB:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+144j
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_50]
		jz	short loc_766FB
		add	bx, 2
		loop	loc_766EB
		jmp	loc_76854	; default
; ���������������������������������������������������������������������������

loc_766FB:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+13Fj
		jmp	word ptr cs:[bx+8] ; switch jump

loc_766FF:				; DATA XREF: ovr230:14D1o
		push	large 1		; case 0x0
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 48h	; 'H'
		mov	word ptr [bp+var_1E+2],	ax
		mov	word ptr [bp+var_1E], dx
		les	bx, [bp+var_1E]
		mov	eax, es:[bx]
		mov	[bp+var_22], eax
		mov	eax, [bp+var_22]
		mov	[bp+var_1A], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+5Ch]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_62], eax
		jmp	loc_76854	; default
; ���������������������������������������������������������������������������

loc_7674D:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2:loc_766FBj
					; DATA XREF: ovr230:14D1o
		push	large 0		; case 0x5A
		push	0FFFFh
		lea	ax, [bp+var_66]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 48h	; 'H'
		mov	word ptr [bp+var_26+2],	ax
		mov	word ptr [bp+var_26], dx
		les	bx, [bp+var_26]
		mov	eax, es:[bx]
		mov	[bp+var_2A], eax
		mov	eax, [bp+var_2A]
		mov	[bp+var_1A], eax
		neg	eax
		mov	[bp+var_2E], eax
		mov	[bp+var_32], eax
		mov	[bp+var_1A], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+5Ch]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_66], eax
		jmp	loc_76854	; default
; ���������������������������������������������������������������������������

loc_767AA:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2:loc_766FBj
					; DATA XREF: ovr230:14D1o
		push	large 0FFFFh	; case 0xB4
		push	0
		lea	ax, [bp+var_66]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 48h	; 'H'
		mov	word ptr [bp+var_36+2],	ax
		mov	word ptr [bp+var_36], dx
		les	bx, [bp+var_36]
		mov	eax, es:[bx]
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_1A], eax
		neg	eax
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		mov	[bp+var_1A], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+5Ch]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_62], eax
		jmp	short loc_76854	; default
; ���������������������������������������������������������������������������

loc_76809:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2:loc_766FBj
					; DATA XREF: ovr230:14D1o
		push	large 0		; case 0x10E
		push	1
		lea	ax, [bp+var_66]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 48h	; 'H'
		mov	word ptr [bp+var_46+2],	ax
		mov	word ptr [bp+var_46], dx
		les	bx, [bp+var_46]
		mov	eax, es:[bx]
		mov	[bp+var_4A], eax
		mov	eax, [bp+var_4A]
		mov	[bp+var_1A], eax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+5Ch]
		mov	edx, [bp+var_1A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_66], eax

loc_76854:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+146j
					; AITargeting_ComputeOrientationExtended_765B2+198j ...
		les	bx, [bp+arg_0]	; default
		mov	si, es:[bx+11h]
		add	si, 12h
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 70h	; 'p'
		mov	word ptr [bp+var_4E+2],	ax
		mov	word ptr [bp+var_4E], dx
		les	di, [bp+var_4E]
		mov	eax, es:[di]
		mov	[bp+var_72], eax
		mov	eax, es:[di+4]
		mov	[bp+var_6E], eax
		mov	eax, es:[di+8]
		mov	[bp+var_6A], eax
		mov	eax, [bp+var_72]
		add	eax, [bp+var_66]
		mov	[si], eax
		mov	eax, [bp+var_6E]
		add	eax, [bp+var_62]
		mov	[si+4],	eax
		mov	eax, [bp+var_6A]
		add	eax, [bp+var_5E]
		mov	[si+8],	eax
		mov	es, word ptr [bp+arg_0+2]
		mov	eax, es:[bx+54h]
		sar	eax, 8
		cmp	eax, 0
		jz	short loc_768C2
		jmp	loc_76BE5
; ���������������������������������������������������������������������������

loc_768C2:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+30Bj
		mov	al, es:[bx+94h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_768D0
		jmp	loc_76BE5
; ���������������������������������������������������������������������������

loc_768D0:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+319j
		mov	ax, es:[bx+9Fh]
		mov	[bp+var_52], ax
		mov	cx, 4		; switch 4 cases
		mov	bx, offset word_76BE9

loc_768DE:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+337j
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_52]
		jz	short loc_768EE
		add	bx, 2
		loop	loc_768DE
		jmp	loc_76B75	; default
; ���������������������������������������������������������������������������

loc_768EE:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+332j
		jmp	word ptr cs:[bx+8] ; switch jump

loc_768F2:				; DATA XREF: ovr230:14C1o
		push	large 1		; case 0x0
		push	0
		lea	ax, [bp+var_7E]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_5A], ax
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	eax, [bp+var_7E]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_8E], eax
		push	large 0
		push	1
		lea	ax, [bp+var_7E]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		mov	eax, [bp+var_7E]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_9A], eax
		lea	ax, [bp+var_A2]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		lea	ax, [bp+var_A2]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	loc_76B75	; default
; ���������������������������������������������������������������������������

loc_76992:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2:loc_768EEj
					; DATA XREF: ovr230:14C1o
		push	large 0		; case 0x10E
		push	1
		lea	ax, [bp+var_7E]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_5A], ax
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	eax, [bp+var_7E]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_8E], eax
		push	large 0FFFFh
		push	0
		lea	ax, [bp+var_7E]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		mov	eax, [bp+var_7E]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_9A], eax
		lea	ax, [bp+var_A2]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		lea	ax, [bp+var_A2]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	loc_76B75	; default
; ���������������������������������������������������������������������������

loc_76A35:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2:loc_768EEj
					; DATA XREF: ovr230:14C1o
		push	large 0FFFFh	; case 0xB4
		push	0
		lea	ax, [bp+var_7E]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_5A], ax
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	eax, [bp+var_7E]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_8E], eax
		push	large 0
		push	0FFFFh
		lea	ax, [bp+var_7E]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		mov	eax, [bp+var_7E]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_9A], eax
		lea	ax, [bp+var_A2]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		lea	ax, [bp+var_A2]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		jmp	loc_76B75	; default
; ���������������������������������������������������������������������������

loc_76AD8:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2:loc_768EEj
					; DATA XREF: ovr230:14C1o
		push	large 0		; case 0x5A
		push	0FFFFh
		lea	ax, [bp+var_7E]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		mov	[bp+var_5A], ax
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		call	AI_ComputeGeometryHelper_56E29
		add	sp, 4
		mov	eax, [bp+var_7E]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_8E], eax
		push	large 1
		push	0
		lea	ax, [bp+var_7E]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		mov	eax, [bp+var_7E]
		mov	[bp+var_A2], eax
		mov	eax, [bp+var_7A]
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_76]
		mov	[bp+var_9A], eax
		lea	ax, [bp+var_A2]
		push	ax
		call	Matrix_OrthonormalizeKeepRow1_57660
		pop	cx
		lea	ax, [bp+var_A2]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4

loc_76B75:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+339j
					; AITargeting_ComputeOrientationExtended_765B2+3DDj ...
		les	bx, [bp+arg_0]	; default
		mov	byte ptr es:[bx+94h], 1
		mov	ax, es:[bx+11h]
		cmp	ax, word_722E6
		jnz	short loc_76BCD
		mov	bx, word_706A0
		cmp	word ptr [bx+4Eh], 0
		jz	short loc_76BB4
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

loc_76BB4:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+5DEj
		mov	bx, word_706A0
		mov	al, [bx+0A1h]
		mov	byte ptr [bp+var_54+1],	al
		mov	ah, 0
		or	ax, ax
		jnz	short loc_76BCD
		push	14h
		call	TextObject_AllocateVariantA_5A984
		pop	cx

loc_76BCD:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+5D4j
					; AITargeting_ComputeOrientationExtended_765B2+611j
		mov	[bp+var_58], 0
		mov	eax, [bp+var_58]
		les	bx, [bp+arg_0]
		mov	es:[bx+5Ch], eax
		inc	word ptr es:[bx+22h]

loc_76BE5:				; CODE XREF: AITargeting_ComputeOrientationExtended_765B2+30Dj
					; AITargeting_ComputeOrientationExtended_765B2+31Bj
		pop	di
		pop	si
		leave
		retf
AITargeting_ComputeOrientationExtended_765B2	endp

; ���������������������������������������������������������������������������
word_76BE9	dw	0,   5Ah,  0B4h,  10Eh ; DATA XREF: AITargeting_ComputeOrientationExtended_765B2+329o
					; value	table for switch statement
		dw offset loc_768F2	; jump table for switch	statement
		dw offset loc_76AD8
		dw offset loc_76A35
		dw offset loc_76992
word_76BF9	dw	0,   5Ah,  0B4h,  10Eh ; DATA XREF: AITargeting_ComputeOrientationExtended_765B2+136o
					; value	table for switch statement
		dw offset loc_766FF	; jump table for switch	statement
		dw offset loc_7674D
		dw offset loc_767AA
		dw offset loc_76809

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 206 lignes, NON DÉTAILLÉE — aucun appel externe visible (calcul entièrement inline).
; ==============================================================================================
AITargeting_Helper2_76C09	proc far		; CODE XREF: VROOMM_StubThunk_6AB94J AITargeting_UpdateAndRender_75C18+106p

var_32		= word ptr -32h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 32h
		push	si
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+5Ch]
		sar	eax, 8
		cmp	eax, 0
		jnz	short loc_76C54
		mov	[bp+var_4], 200h
		mov	eax, [bp+var_4]
		mov	es:[bx+60h], eax
		mov	si, es:[bx+11h]
		add	si, 12h
		mov	eax, [si]
		mov	es:[bx+70h], eax
		mov	eax, [si+4]
		mov	es:[bx+74h], eax
		mov	eax, [si+8]
		mov	es:[bx+78h], eax

loc_76C54:				; CODE XREF: AITargeting_Helper2_76C09+17j
		mov	eax, dword_70458
		mov	[bp+var_8], eax
		les	bx, [bp+arg_0]
		add	es:[bx+5Ch], eax
		mov	eax, es:[bx+60h]
		sar	eax, 8
		mov	edx, es:[bx+5Ch]
		sar	edx, 8
		imul	eax, edx
		mov	edx, es:[bx+48h]
		sar	edx, 8
		sub	edx, eax
		mov	[bp+var_C], edx
		mov	eax, [bp+var_C]
		shl	eax, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	es:[bx+4Ch], eax
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	[bp+var_14], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 4Ch	; 'L'
		mov	word ptr [bp+var_20+2],	ax
		mov	word ptr [bp+var_20], dx
		les	bx, [bp+var_20]
		mov	eax, es:[bx]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Fh]
		mov	[bp+var_32], ax
		mov	cx, 4		; switch 4 cases
		mov	bx, offset word_76E57

loc_76CEE:				; CODE XREF: AITargeting_Helper2_76C09+F0j
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_32]
		jz	short loc_76CFE
		add	bx, 2
		loop	loc_76CEE
		jmp	loc_76E3E	; default
; ���������������������������������������������������������������������������

loc_76CFE:				; CODE XREF: AITargeting_Helper2_76C09+EBj
		jmp	word ptr cs:[bx+8] ; switch jump

loc_76D02:				; DATA XREF: ovr230:172Fo
		les	bx, [bp+arg_0]	; case 0x0
		mov	eax, [bp+var_14]
		add	es:[bx+74h], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 70h	; 'p'
		mov	word ptr [bp+var_24+2],	ax
		mov	word ptr [bp+var_24], dx
		les	si, [bp+var_24]
		mov	eax, es:[si]
		mov	es, word ptr [bp+arg_0+2]
		mov	bx, es:[bx+11h]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+1Ah], eax
		jmp	loc_76E3E	; default
; ���������������������������������������������������������������������������

loc_76D52:				; CODE XREF: AITargeting_Helper2_76C09:loc_76CFEj
					; DATA XREF: ovr230:172Fo
		les	bx, [bp+arg_0]	; case 0x5A
		mov	eax, [bp+var_14]
		sub	es:[bx+70h], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 70h	; 'p'
		mov	word ptr [bp+var_28+2],	ax
		mov	word ptr [bp+var_28], dx
		les	si, [bp+var_28]
		mov	eax, es:[si]
		mov	es, word ptr [bp+arg_0+2]
		mov	bx, es:[bx+11h]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+1Ah], eax
		jmp	loc_76E3E	; default
; ���������������������������������������������������������������������������

loc_76DA2:				; CODE XREF: AITargeting_Helper2_76C09:loc_76CFEj
					; DATA XREF: ovr230:172Fo
		les	bx, [bp+arg_0]	; case 0xB4
		mov	eax, [bp+var_14]
		sub	es:[bx+74h], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 70h	; 'p'
		mov	word ptr [bp+var_2C+2],	ax
		mov	word ptr [bp+var_2C], dx
		les	si, [bp+var_2C]
		mov	eax, es:[si]
		mov	es, word ptr [bp+arg_0+2]
		mov	bx, es:[bx+11h]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+1Ah], eax
		jmp	short loc_76E3E	; default
; ���������������������������������������������������������������������������

loc_76DF1:				; CODE XREF: AITargeting_Helper2_76C09:loc_76CFEj
					; DATA XREF: ovr230:172Fo
		les	bx, [bp+arg_0]	; case 0x10E
		mov	eax, [bp+var_14]
		add	es:[bx+70h], eax
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 70h	; 'p'
		mov	word ptr [bp+var_30+2],	ax
		mov	word ptr [bp+var_30], dx
		les	si, [bp+var_30]
		mov	eax, es:[si]
		mov	es, word ptr [bp+arg_0+2]
		mov	bx, es:[bx+11h]
		mov	[bx+12h], eax
		mov	eax, es:[si+4]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+16h], eax
		mov	eax, es:[si+8]
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+1Ah], eax

loc_76E3E:				; CODE XREF: AITargeting_Helper2_76C09+F2j
					; AITargeting_Helper2_76C09+146j ...
		les	bx, [bp+arg_0]	; default
		mov	eax, es:[bx+4Ch]
		sar	eax, 8
		cmp	eax, 0
		jg	short loc_76E54
		inc	word ptr es:[bx+22h]

loc_76E54:				; CODE XREF: AITargeting_Helper2_76C09+245j
		pop	si
		leave
		retf
AITargeting_Helper2_76C09	endp

; ���������������������������������������������������������������������������
word_76E57	dw	0,   5Ah,  0B4h,  10Eh ; DATA XREF: AITargeting_Helper2_76C09+E2o
					; value	table for switch statement
		dw offset loc_76D02	; jump table for switch	statement
		dw offset loc_76D52
		dw offset loc_76DA2
		dw offset loc_76DF1

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 137 lignes, NON DÉTAILLÉE — combine Vector_NormalizeInPlace_5593A (seg116),
; Trigger_TimedRangedSpawnOnce-style test de portée (sub_378CA, seg109), sub_3E5A6 —
; vérification de portée pour le ciblage.
; ==============================================================================================
AITargeting_ApplyRangeCheck_76E67	proc far		; CODE XREF: VROOMM_StubThunk_6AB99J AITargeting_UpdateAndRender_75C18+28p	...

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
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 38h
		push	large 0
		push	0
		lea	ax, [bp+var_2C]
		push	ax
		call	Utility_Helper_55DB4
		add	sp, 8
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	eax, [bp+var_2C]
		mov	[bx+8],	eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	eax, [bp+var_28]
		mov	[bx+0Ch], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	eax, [bp+var_24]
		mov	[bx+10h], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	ax, [bx]
		add	ax, 8
		push	0
		mov	[bp+var_4], 0
		mov	eax, [bp+var_4]
		mov	[bp+var_38], eax
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[bp+var_34], eax
		mov	[bp+var_C], 100h
		mov	eax, [bp+var_C]
		mov	[bp+var_30], eax
		lea	ax, [bp+var_38]
		push	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+11h]
		add	ax, 12h
		push	ax
		push	word_70474
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		call	Terrain_QueryAltitudeAt
		add	sp, 0Ch
		mov	eax, [bp+var_10]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	[bx+1Ah], eax
		push	bx
		push	ss
		lea	ax, [bp+var_14]
		push	ax
		call	Gauge_ComputeNeedlePosition
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+11h]
		mov	eax, [bp+var_14]
		add	[bx+1Ah], eax
		mov	[bp+var_18], 0
		mov	eax, [bp+var_18]
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+23h], eax
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 1
		and	ax, 1
		and	ax, 1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0EFh
		shl	al, 4
		or	es:[bx+1Ch], al
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	es:[bx+27h], eax
		les	bx, [bp+arg_0]
		les	bx, es:[bx+8]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0FFh
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+11h]
		cmp	ax, word_722E6
		jnz	short loc_76FF0
		mov	byte_706AF, 1
		jmp	short locret_76FF7
; ���������������������������������������������������������������������������

loc_76FF0:				; CODE XREF: AITargeting_ApplyRangeCheck_76E67+180j
		les	bx, [bp+arg_0]
		inc	word ptr es:[bx+22h]

locret_76FF7:				; CODE XREF: AITargeting_ApplyRangeCheck_76E67+187j
		leave
		retf
AITargeting_ApplyRangeCheck_76E67	endp

ovr230		ends
