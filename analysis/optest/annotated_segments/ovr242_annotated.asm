ovr242		segment	para public 'OVERLAY' use16
		assume cs:ovr242
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C73E0	proc far		; CODE XREF: sub_42EC8J sub_C78EA+62p	...

var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	eax, [di+72h]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		push	1
		push	0
		push	2
		push	large [bp+var_12]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		mov	eax, [bp+var_16]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 2
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		mov	eax, [bp+var_12]
		mov	[bp+var_4], eax
		push	large [bp+var_E]
		push	0
		mov	al, [bp+var_6]
		push	ax
		push	word ptr [bp+var_A+2]
		push	word ptr [bp+var_A]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		lea	ax, [bp+var_A]
		push	ax
		push	si
		call	GlyphObject_ComputeMetrics_3111E
		add	sp, 4
		mov	word ptr [si+10h], 2
		mov	word ptr [si+12h], 0
		push	2Dh ; '-'
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[si+14h], ax
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		push	0
		push	0
		push	0
		mov	al, [si+6]
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	61h ; 'a'
		call	Font_ComputeGlyphBoundingBox_2EF02
		cmp	[bp+var_1C], 0
		jnz	short loc_C74F4
		push	ss
		lea	ax, [bp+var_1E]
		push	ax
		push	0
		push	0
		push	0
		mov	al, [si+6]
		push	ax
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	41h ; 'A'
		call	Font_ComputeGlyphBoundingBox_2EF02

loc_C74F4:				; CODE XREF: sub_C73E0+E9j
		mov	ax, [bp+var_1C]
		mov	[bp+var_20], ax
		mov	ax, [bp+var_20]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	[si+17h], ax
		mov	ax, [si+17h]
		mov	[bp+var_22], ax
		mov	ax, [bp+var_22]
		mov	[si+0Eh], ax
		cmp	[bp+var_5], 0
		jz	short loc_C7535
		cmp	[bp+var_A], 0
		jz	short loc_C7535
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C7535:				; CODE XREF: sub_C73E0+135j
					; sub_C73E0+13Cj
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf
sub_C73E0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GlyphObject_MeasureWrapperB_7FC55 (sub_7FC55 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle GlyphObject_MeasureChar_6064A.
; ==============================================================================================
GlyphObject_MeasureWrapperB_C754D	proc far		; CODE XREF: sub_42ECDJ sub_C7C7F+64p

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	[bp+var_4], 0
		jmp	short loc_C7573
; ���������������������������������������������������������������������������

loc_C7561:				; CODE XREF: GlyphObject_MeasureWrapperB_C754D+35j
		mov	al, byte ptr [bp+var_2]
		push	ax
		push	si
		call	GlyphObject_MeasureChar_31312
		add	sp, 4
		add	di, ax
		inc	[bp+var_4]

loc_C7573:				; CODE XREF: GlyphObject_MeasureWrapperB_C754D+12j
		les	bx, [bp+arg_2]
		add	bx, [bp+var_4]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_2], ax
		or	ax, ax
		jnz	short loc_C7561
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
GlyphObject_MeasureWrapperB_C754D	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; GlyphObject_ResolveAndMeasureB_7FC92 (sub_7FC92 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine GlyphObject_ResolveAndCache_605CE
; et GlyphObject_MeasureChar_6064A.
; ==============================================================================================
GlyphObject_ResolveAndMeasureB_C758E	proc far		; CODE XREF: sub_42ED2J

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_2], di
		mov	ax, [si+17h]
		inc	ax
		mov	[bp+var_4], ax
		mov	[bp+var_8], 0
		jmp	short loc_C75E8
; ���������������������������������������������������������������������������

loc_C75AD:				; CODE XREF: GlyphObject_ResolveAndMeasureB_C758E+69j
		cmp	[bp+var_6], 0Ah
		jnz	short loc_C75BE
		mov	di, [bp+var_2]
		mov	ax, [bp+var_4]
		add	[bp+arg_6], ax
		jmp	short loc_C75E5
; ���������������������������������������������������������������������������

loc_C75BE:				; CODE XREF: GlyphObject_ResolveAndMeasureB_C758E+23j
		push	[bp+arg_6]
		push	di
		mov	al, byte ptr [bp+var_6]
		push	ax
		push	[bp+arg_2]
		push	si
		call	GlyphObject_ResolveAndCache_31296
		add	sp, 0Ah
		mov	al, byte ptr [bp+var_6]
		push	ax
		push	si
		call	GlyphObject_MeasureChar_31312
		add	sp, 4
		mov	dx, di
		add	dx, ax
		mov	di, dx

loc_C75E5:				; CODE XREF: GlyphObject_ResolveAndMeasureB_C758E+2Ej
		inc	[bp+var_8]

loc_C75E8:				; CODE XREF: GlyphObject_ResolveAndMeasureB_C758E+1Dj
		les	bx, [bp+arg_8]
		add	bx, [bp+var_8]
		mov	al, es:[bx]
		cbw
		mov	[bp+var_6], ax
		or	ax, ax
		jnz	short loc_C75AD
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
GlyphObject_ResolveAndMeasureB_C758E	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C7603	proc far		; CODE XREF: sub_42EA5J

arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		cmp	[bp+arg_0], 0
		jnz	short loc_C7625
		push	large 0AEh ; '�'
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+arg_0+2], dx
		mov	word ptr [bp+arg_0], ax
		or	ax, dx
		jz	short loc_C766B

loc_C7625:				; CODE XREF: sub_C7603+8j
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+6], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ah], 2
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Bh], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+0Ch], 0
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+4], 0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0A1h ; '�'
		mov	ax, word ptr [bp+arg_0]
		add	ax, 0A5h ; '�'
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0A0h], 0

loc_C766B:				; CODE XREF: sub_C7603+20j
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	bp
		retf
sub_C7603	endp

; ���������������������������������������������������������������������������
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C7675	proc far		; CODE XREF: sub_42EAFJ

var_FC		= word ptr -0FCh
var_9F		= dword	ptr -9Fh
var_9B		= dword	ptr -9Bh
var_97		= dword	ptr -97h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_54		= word ptr -54h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0FCh
		push	si
		push	di
		push	seg seg168
		push	offset a_iff_0	; ".IFF"
		push	ds
		push	offset aPlaques	; "PLAQUES"
		push	ds
		push	offset aCockpits ; "COCKPITS"
		lea	ax, [bp+var_54]
		push	ax
		call	sub_C86D
		add	sp, 0Eh
		lea	ax, [bp+var_FC]
		push	ax
		call	StreamReader_ConstructVariantA_3B2A9
		add	sp, 2
		mov	[bp+var_FC], 556h
		mov	[bp+var_9B], 100h
		mov	[bp+var_9F], 0
		mov	[bp+var_FC], 56Eh
		mov	[bp+var_80], 0
		xor	ax, ax
		mov	[bp+var_82], ax
		movsx	eax, ax
		mov	[bp+var_97], eax
		push	large [dword_4681B]
		lea	ax, [bp+var_54]
		push	ax
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_InitAndValidate_3BE3D
		add	sp, 8
		or	ax, ax
		jz	short loc_C7713
		lea	ax, [bp+var_FC]
		push	ax
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		nop
		push	cs
		call	near ptr sub_C78EA
		add	sp, 6
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		jmp	short loc_C771E
; ���������������������������������������������������������������������������

loc_C7713:				; CODE XREF: sub_C7675+7Aj
		push	7010h
		call	sub_30D3
		add	sp, 2

loc_C771E:				; CODE XREF: sub_C7675+9Cj
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 0
		mov	ax, word_46F46
		mov	[bp+var_2], ax
		push	0Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_C7756
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		push	[bp+var_2]
		push	si
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	ax, si
		jmp	short loc_C7758
; ���������������������������������������������������������������������������

loc_C7756:				; CODE XREF: sub_C7675+C6j
		mov	ax, si

loc_C7758:				; CODE XREF: sub_C7675+DFj
		les	bx, [bp+arg_0]
		mov	es:[bx+0A9h], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0A9h]
		mov	[bp+var_4], ax
		push	0Eh
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_C7794
		mov	word ptr [di], 0
		mov	word ptr [di+2], 0
		push	[bp+var_4]
		push	di
		call	TextFormat_ApplyStyleAttribute_2E9A4
		add	sp, 4
		mov	ax, di
		jmp	short loc_C7796
; ���������������������������������������������������������������������������

loc_C7794:				; CODE XREF: sub_C7675+104j
		mov	ax, di

loc_C7796:				; CODE XREF: sub_C7675+11Dj
		les	bx, [bp+arg_0]
		mov	es:[bx+0ABh], ax
		mov	[bp+var_FC], 56Eh
		lea	ax, [bp+var_FC]
		push	ax
		call	ResourceRecord_Helper_3BE15
		add	sp, 2
		push	0
		lea	ax, [bp+var_FC]
		push	ax
		call	StreamReader_ReleaseBuffer_3CEB3
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_C7675	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C77C4	proc far		; CODE XREF: sub_42EAAJ

var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0Bh], 0
		jz	short loc_C7806
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+6], 0
		jz	short loc_C7806
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		mov	eax, es:[bx+6]
		mov	[bp+var_4], eax
		lea	ax, [bp+var_4]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_C7806:				; CODE XREF: sub_C77C4+Ej
					; sub_C77C4+19j
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+6], 0
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Bh], 0
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+0Ch], 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0ABh], 0
		jz	short loc_C7853
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ABh]
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0ABh]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_C7853:				; CODE XREF: sub_C77C4+6Bj
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0ABh], 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+0A9h], 0
		jz	short loc_C788A
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0A9h]
		call	TextFormat_ReleaseStyleList_2EBFA
		add	sp, 2
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+0A9h]
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_C788A:				; CODE XREF: sub_C77C4+A2j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+0A9h], 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx], 0
		jz	short loc_C78B4
		push	3
		les	bx, [bp+arg_0]
		push	word ptr es:[bx]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_C78B4:				; CODE XREF: sub_C77C4+D7j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+2], 0
		jz	short loc_C78DF
		push	3
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short $+2

loc_C78DF:				; CODE XREF: sub_C77C4+100j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+2], 0
		leave
		retf
sub_C77C4	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C78EA	proc far		; CODE XREF: sub_42EB4J sub_C7675+89p

var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 20h
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	[bp+var_2], 0
		jmp	loc_C79D9
; ���������������������������������������������������������������������������

loc_C78FD:				; CODE XREF: sub_C78EA+104j
		push	0
		push	large 45444957h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C7961
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C7961
		mov	[bp+var_4], si
		push	19h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_C7956
		push	di
		call	GlyphObject_AllocateBuffer_31191
		add	sp, 2
		mov	word ptr [di], 3800h
		push	[bp+var_4]
		push	di
		push	cs
		call	near ptr sub_C73E0
		add	sp, 4
		mov	ax, di
		jmp	short loc_C7958
; ���������������������������������������������������������������������������

loc_C7956:				; CODE XREF: sub_C78EA+4Ej
		mov	ax, di

loc_C7958:				; CODE XREF: sub_C78EA+6Aj
		les	bx, [bp+arg_0]
		mov	es:[bx], ax
		inc	[bp+var_2]

loc_C7961:				; CODE XREF: sub_C78EA+26j
					; sub_C78EA+3Bj
		push	0
		push	large 594E4954h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C79D0
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C79D0
		mov	[bp+var_6], si
		push	19h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	[bp+var_8], ax
		or	ax, ax
		jz	short loc_C79C3
		push	[bp+var_8]
		call	GlyphObject_AllocateBuffer_31191
		add	sp, 2
		mov	bx, [bp+var_8]
		mov	word ptr [bx], 3800h
		push	[bp+var_6]
		push	[bp+var_8]
		push	cs
		call	near ptr sub_C73E0
		add	sp, 4
		mov	ax, [bp+var_8]
		jmp	short loc_C79C6
; ���������������������������������������������������������������������������

loc_C79C3:				; CODE XREF: sub_C78EA+B3j
		mov	ax, [bp+var_8]

loc_C79C6:				; CODE XREF: sub_C78EA+D7j
		les	bx, [bp+arg_0]
		mov	es:[bx+2], ax
		inc	[bp+var_2]

loc_C79D0:				; CODE XREF: sub_C78EA+8Aj
					; sub_C78EA+9Fj
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		add	sp, 2

loc_C79D9:				; CODE XREF: sub_C78EA+10j
		push	1
		push	large 544E4F46h
		push	si
		call	ResourceRecord_SeekAndReadB_3C022
		add	sp, 8
		or	ax, ax
		jz	short loc_C79F1
		jmp	loc_C78FD
; ���������������������������������������������������������������������������

loc_C79F1:				; CODE XREF: sub_C78EA+102j
		cmp	[bp+var_2], 2
		jz	short loc_C7A02
		push	7011h
		call	sub_30D3
		add	sp, 2

loc_C7A02:				; CODE XREF: sub_C78EA+10Bj
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jz	short loc_C7A4C
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ch], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+98h], ax
		push	si
		call	ResourceRecord_ReadFieldGroupB_3C2C4
		add	sp, 2
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ah], ax
		jmp	short loc_C7A93
; ���������������������������������������������������������������������������

loc_C7A4C:				; CODE XREF: sub_C78EA+12Bj
		mov	bx, word_46F46
		mov	ax, [bx+0Ah]
		mov	bx, word_46F46
		sub	ax, [bx+6]
		inc	ax
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ch], ax
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+98h], 2
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+9Ah], 2
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ch]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx]
		mov	dx, [bx+17h]
		inc	dx
		sub	ax, dx
		les	bx, [bp+arg_0]
		mov	es:[bx+9Ch], ax

loc_C7A93:				; CODE XREF: sub_C78EA+160j
		push	0
		push	large 50414853h
		push	si
		call	ResourceRecord_SeekAndRead_3BFB3
		add	sp, 8
		or	ax, ax
		jnz	short loc_C7AAB
		jmp	loc_C7B71
; ���������������������������������������������������������������������������

loc_C7AAB:				; CODE XREF: sub_C78EA+1BCj
		mov	[bp+var_A], si
		mov	bx, [bp+var_A]
		mov	eax, [bx+72h]
		mov	[bp+var_E], eax
		mov	eax, [bp+var_E]
		mov	[bp+var_12], eax
		push	1
		push	0
		push	2
		push	large [bp+var_12]
		push	661Ah
		call	Memory_TypedFreeWrapper_2B7E1
		add	sp, 0Ch
		mov	word ptr [bp+var_16+2],	dx
		mov	word ptr [bp+var_16], ax
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_16]
		mov	es:[bx+6], eax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Ah], 2
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0Bh], 1
		les	bx, [bp+arg_0]
		mov	dword ptr es:[bx+0Ch], 0
		les	bx, [bp+arg_0]
		mov	eax, [bp+var_12]
		mov	es:[bx+0Ch], eax
		push	large [bp+var_E]
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_A]
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		call	Struct_GetElementCountMinusOne_33352
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax
		jmp	short loc_C7B7C
; ���������������������������������������������������������������������������

loc_C7B71:				; CODE XREF: sub_C78EA+1BEj
		push	7012h
		call	sub_30D3
		add	sp, 2

loc_C7B7C:				; CODE XREF: sub_C78EA+285j
		push	ss
		lea	ax, [bp+var_20]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	0
		call	Font_ComputeGlyphBoundingBox_2EF02
		mov	ax, [bp+var_1A]
		sub	ax, [bp+var_1E]
		inc	ax
		mov	[bp+var_18], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ah]
		shl	ax, 1
		mov	dx, [bp+var_18]
		sub	dx, ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx]
		sub	dx, [bx+17h]
		shr	dx, 1
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ah]
		add	ax, dx
		les	bx, [bp+arg_0]
		mov	es:[bx+9Eh], ax
		pop	di
		pop	si
		leave
		retf
sub_C78EA	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C7BE8	proc far		; CODE XREF: sub_42EB9J sub_C7C7F+81p

var_E		= word ptr -0Eh
var_A		= word ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+98h]
		shl	ax, 1
		add	[bp+arg_4], ax
		mov	[bp+var_2], 0
		xor	si, si
		xor	di, di
		jmp	short loc_C7C6B
; ���������������������������������������������������������������������������

loc_C7C08:				; CODE XREF: sub_C7BE8+8Aj
		mov	[bp+var_6], di
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_6]
		call	Font_ComputeGlyphBoundingBox_2EF02
		mov	ax, [bp+var_A]
		sub	ax, [bp+var_E]
		inc	ax
		mov	[bp+var_4], ax
		cmp	si, [bp+arg_4]
		jnb	short loc_C7C52
		cmp	[bp+var_4], si
		ja	short loc_C7C64

loc_C7C52:				; CODE XREF: sub_C7BE8+63j
		cmp	si, [bp+arg_4]
		jbe	short loc_C7C6A
		cmp	[bp+var_4], si
		jnb	short loc_C7C6A
		mov	ax, [bp+var_4]
		cmp	ax, [bp+arg_4]
		jb	short loc_C7C6A

loc_C7C64:				; CODE XREF: sub_C7BE8+68j
		mov	[bp+var_2], di
		mov	si, [bp+var_4]

loc_C7C6A:				; CODE XREF: sub_C7BE8+6Dj
					; sub_C7BE8+72j ...
		inc	di

loc_C7C6B:				; CODE XREF: sub_C7BE8+1Ej
		les	bx, [bp+arg_0]
		cmp	es:[bx+4], di
		ja	short loc_C7C08
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_C7BE8	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C7C7F	proc far		; CODE XREF: sub_42EBEJ sub_C7E76+45p

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_C		= word ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		xor	si, si
		jmp	short loc_C7CB2
; ���������������������������������������������������������������������������

loc_C7C8B:				; CODE XREF: sub_C7C7F+47j
		mov	di, [bp+var_2]
		mov	ax, di
		add	ax, 0FFBFh
		mov	[bp+var_4], ax
		cmp	[bp+var_4], 19h
		ja	short loc_C7CA6
		mov	ax, [bp+var_4]
		add	ax, 61h	; 'a'
		mov	di, ax
		jmp	short $+2

loc_C7CA6:				; CODE XREF: sub_C7C7F+1Bj
		mov	ax, di
		les	bx, [bp+arg_0]
		add	bx, si
		mov	es:[bx+10h], al
		inc	si

loc_C7CB2:				; CODE XREF: sub_C7C7F+Aj
		les	bx, [bp+arg_4]
		add	bx, si
		mov	al, es:[bx]
		cbw
		mov	[bp+var_2], ax
		or	ax, ax
		jz	short loc_C7CC8
		cmp	si, 80h	; '�'
		jl	short loc_C7C8B

loc_C7CC8:				; CODE XREF: sub_C7C7F+41j
		les	bx, [bp+arg_0]
		add	bx, si
		mov	byte ptr es:[bx+10h], 0
		mov	ax, word ptr [bp+arg_0]
		add	ax, 10h
		push	word ptr [bp+arg_0+2]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx]
		push	cs
		call	near ptr GlyphObject_MeasureWrapperB_C754D
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+90h], ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+90h]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_C7BE8
		add	sp, 6
		les	bx, [bp+arg_0]
		mov	es:[bx+96h], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_8], ax
		push	ss
		lea	ax, [bp+var_10]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		call	Font_ComputeGlyphBoundingBox_2EF02
		mov	ax, [bp+var_C]
		sub	ax, [bp+var_10]
		inc	ax
		mov	[bp+var_6], ax
		mov	bx, word_46F46
		mov	ax, [bx+8]
		mov	bx, word_46F46
		sub	ax, [bx+4]
		inc	ax
		sub	ax, [bp+var_6]
		sar	ax, 1
		les	bx, [bp+arg_0]
		mov	es:[bx+92h], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ch]
		les	bx, [bp+arg_0]
		mov	es:[bx+94h], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+92h]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	[bx+4],	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+92h]
		add	ax, [bp+var_6]
		dec	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	[bx+8],	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9Ch]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	[bx+6],	ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+96h]
		mov	[bp+var_12], ax
		push	ss
		lea	ax, [bp+var_1A]
		push	ax
		push	0
		push	0
		push	0
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0Ah]
		push	ax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+8]
		push	word ptr es:[bx+6]
		push	661Ah
		call	Memory_TypedAllocDispatchB_2B920
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_12]
		call	Font_ComputeGlyphBoundingBox_2EF02
		mov	ax, [bp+var_14]
		sub	ax, [bp+var_18]
		inc	ax
		les	bx, [bp+arg_0]
		mov	dx, es:[bx+9Ch]
		add	dx, ax
		dec	dx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	[bx+0Ah], dx
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+4]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+4],	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+6]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+6],	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+8]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+8],	ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0A9h]
		mov	ax, [bx+0Ah]
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0ABh]
		mov	[bx+0Ah], ax
		pop	di
		pop	si
		leave
		retf
sub_C7C7F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C7E76	proc far		; CODE XREF: sub_42EC3J

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+0A0h], 0
		jz	short loc_C7EAE
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0A0h], 0
		les	bx, [bp+arg_0]
		xor	eax, eax
		mov	es:[bx+0A1h], eax
		les	bx, [bp+arg_0]
		mov	es:[bx+0A5h], eax
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0ADh], 1

loc_C7EAE:				; CODE XREF: sub_C7E76+Fj
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	word ptr [bp+arg_0+2]
		push	word ptr [bp+arg_0]
		push	cs
		call	near ptr sub_C7C7F
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	byte ptr es:[bx+0A0h], 1
		mov	eax, [bp+arg_8]
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		les	bx, [bp+arg_0]
		mov	es:[bx+0A1h], eax
		leave
		retf
sub_C7E76	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_C7EE1	proc far		; CODE XREF: sub_42EA0J

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_C7F0E
		push	0
		push	si
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		test	di, 1
		jz	short loc_C7F0C
		push	si
		call	sub_308
		add	sp, 2
		jmp	short $+2

loc_C7F0C:				; CODE XREF: sub_C7EE1+1Ej
		jmp	short $+2

loc_C7F0E:				; CODE XREF: sub_C7EE1+Dj
		pop	di
		pop	si
		pop	bp
		retf
sub_C7EE1	endp

; ���������������������������������������������������������������������������
		pop	di
		pop	si
		pop	bp
		retf
ovr242		ends
