ovr268		segment	para public 'OVERLAY' use16
		assume cs:ovr268
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 227 lignes, NON DÉTAILLÉE — combine TextRenderer_ApplyFormatChange_5E34D (seg143),
; Render_MeasureOrDrawTextString_61F52 (×2).
; ==============================================================================================
Cockpit_ApplyFormatAndDraw_91B70	proc far		; CODE XREF: VROOMM_StubThunk_6B830J ResourceFile_LoadTypeB_91D29+91Cp

var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp

loc_91B71:
		mov	bp, sp

loc_91B73:
		sub	sp, 1Eh
		push	si

loc_91B77:
		push	di

loc_91B78:
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di

loc_91B7F:
		call	VROOMM_StubThunk_6C7B7

loc_91B84:
		pop	cx
		mov	[bp+var_10], 0
		mov	[bp+var_E], 0
		mov	[bp+var_C], 0
		mov	[bp+var_A], 0
		mov	[bp+var_8], 5Dh	; ']'
		mov	[bp+var_6], 48h	; 'H'
		push	0
		lea	ax, [bp+var_10]
		push	ax
		call	TextRenderer_ApplyFormatChange_5E34D
		add	sp, 4
		mov	ax, word_70E62
		mov	[bp+var_2], ax
		mov	[bp+var_1E], 0
		mov	[bp+var_1C], 0
		push	ax
		lea	ax, [bp+var_1E]
		push	ax
		call	TextFormat_ApplyStyleAttribute_5E2D0
		add	sp, 4
		mov	[bp+var_1A], 72h ; 'r'
		mov	[bp+var_18], 45h ; 'E'
		mov	[bp+var_16], 0CEh ; '�'
		mov	[bp+var_14], 8Ch ; '�'
		cmp	byte ptr [si+5Ah], 0
		jz	short loc_91BEC
		push	27h ; '''
		jmp	short loc_91BEE
; ���������������������������������������������������������������������������

loc_91BEC:				; CODE XREF: Cockpit_ApplyFormatAndDraw_91B70+76j
		push	26h ; '&'

loc_91BEE:				; CODE XREF: Cockpit_ApplyFormatAndDraw_91B70+7Aj
		push	large [bp+arg_4]
		push	large 0
		lea	ax, [bp+var_10]
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		cmp	byte ptr [si+56h], 0
		jz	short loc_91C1C
		push	28h ; '('
		push	large [bp+arg_4]
		push	large 0
		lea	ax, [bp+var_10]
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_91C1C:				; CODE XREF: Cockpit_ApplyFormatAndDraw_91B70+95j
		cmp	byte ptr [si+59h], 0
		jz	short loc_91C37
		push	29h ; ')'
		push	large [bp+arg_4]
		push	large 0
		lea	ax, [bp+var_10]
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_91C37:				; CODE XREF: Cockpit_ApplyFormatAndDraw_91B70+B0j
		cmp	byte ptr [si+55h], 0
		jz	short loc_91C52
		push	2Ah ; '*'
		push	large [bp+arg_4]
		push	large 0
		lea	ax, [bp+var_10]
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_91C52:				; CODE XREF: Cockpit_ApplyFormatAndDraw_91B70+CBj
		cmp	byte ptr [si+58h], 0
		jz	short loc_91C6D
		push	2Bh ; '+'
		push	large [bp+arg_4]
		push	large 0
		lea	ax, [bp+var_10]
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_91C6D:				; CODE XREF: Cockpit_ApplyFormatAndDraw_91B70+E6j
		cmp	byte ptr [si+57h], 0

loc_91C71:
		jz	short loc_91C88
		push	2Ch ; ','
		push	large [bp+arg_4]
		push	large 0
		lea	ax, [bp+var_10]
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch

loc_91C88:				; CODE XREF: Cockpit_ApplyFormatAndDraw_91B70:loc_91C71j
		cmp	byte ptr [si+5Bh], 0
		jz	short loc_91C92
		push	2Eh ; '.'
		jmp	short loc_91C94
; ���������������������������������������������������������������������������

loc_91C92:				; CODE XREF: Cockpit_ApplyFormatAndDraw_91B70+11Cj
		push	2Dh ; '-'

loc_91C94:				; CODE XREF: Cockpit_ApplyFormatAndDraw_91B70+120j
		push	large [bp+arg_4]
		push	large 0
		lea	ax, [bp+var_10]
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		cmp	byte ptr [si+51h], 0
		jz	short loc_91CB1
		push	31h ; '1'
		jmp	short loc_91CB3
; ���������������������������������������������������������������������������

loc_91CB1:				; CODE XREF: Cockpit_ApplyFormatAndDraw_91B70+13Bj
		push	32h ; '2'

loc_91CB3:				; CODE XREF: Cockpit_ApplyFormatAndDraw_91B70+13Fj
		push	large [bp+arg_4]
		push	large 0
		lea	ax, [bp+var_10]
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		cmp	byte ptr [si+52h], 0
		jz	short loc_91CE5
		push	30h ; '0'
		push	large [bp+arg_4]

loc_91CD2:
		push	large 0

loc_91CD5:
		lea	ax, [bp+var_10]
		push	ax

loc_91CD9:
		call	Render_MeasureOrDrawTextString_61F52

loc_91CDE:
		add	sp, 0Ch

loc_91CE1:
		push	33h ; '3'

loc_91CE3:
		jmp	short loc_91CE7
; ���������������������������������������������������������������������������

loc_91CE5:				; CODE XREF: Cockpit_ApplyFormatAndDraw_91B70+15Aj
		push	2Fh ; '/'

loc_91CE7:				; CODE XREF: Cockpit_ApplyFormatAndDraw_91B70:loc_91CE3j
		push	large [bp+arg_4]
		push	large 0
		lea	ax, [bp+var_10]
		push	ax
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		lea	ax, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		call	UI_ApplyEncodingHelper_5E576
		add	sp, 4
		push	di
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		lea	ax, [bp+var_1E]
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		lea	ax, [bp+var_10]
		push	ax
		call	TextFormat_ReleaseStyleList_5E526
		pop	cx
		pop	di
		pop	si
		leave
		retf
Cockpit_ApplyFormatAndDraw_91B70	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 1017 lignes, NON DÉTAILLÉE — variante de ResourceFile_LoadTypeA_90097. Candidat
; pour session dédiée.
; ==============================================================================================
ResourceFile_LoadTypeB_91D29	proc far		; CODE XREF: VROOMM_StubThunk_6B83AJ

var_194		= word ptr -194h
var_137		= dword	ptr -137h
var_133		= dword	ptr -133h
var_12E		= word ptr -12Eh
var_DE		= word ptr -0DEh
var_B8		= word ptr -0B8h
var_A9		= word ptr -0A9h
var_8F		= byte ptr -8Fh
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_63		= byte ptr -63h
var_62		= dword	ptr -62h
var_5E		= word ptr -5Eh
var_5B		= byte ptr -5Bh
var_5A		= dword	ptr -5Ah
var_56		= word ptr -56h
var_54		= word ptr -54h
var_51		= byte ptr -51h
var_50		= dword	ptr -50h
var_4C		= word ptr -4Ch
var_4A		= word ptr -4Ah
var_47		= byte ptr -47h
var_46		= dword	ptr -46h
var_42		= word ptr -42h
var_40		= word ptr -40h
var_3D		= byte ptr -3Dh
var_3C		= dword	ptr -3Ch
var_38		= word ptr -38h
var_36		= word ptr -36h
var_33		= byte ptr -33h
var_32		= dword	ptr -32h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_29		= byte ptr -29h
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_1F		= byte ptr -1Fh
var_1E		= dword	ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_15		= byte ptr -15h
var_14		= dword	ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= dword	ptr -0Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 194h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	ds
		push	offset a_shp_6	; ".shp"
		push	ds
		push	offset aDetlopt	; "detlopt"
		push	ds
		push	offset aFonts_0	; "FONTS"
		lea	ax, [bp+var_12E]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_194]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_194], 2C8h
		mov	[bp+var_133], 100h
		mov	[bp+var_137], 0

loc_91D71:
		mov	[bp+var_194], 138Ah
		push	1
		lea	ax, [bp+var_12E]
		push	ax
		lea	ax, [bp+var_194]
		push	ax

loc_91D83:
		mov	bx, [bp+var_194]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_194]
		push	ax
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_68], eax
		mov	[bp+var_6C], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_70+2],	dx
		mov	word ptr [bp+var_70], ax
		mov	eax, [bp+var_70]
		mov	[si+0Ah], eax
		mov	byte ptr [si+0Eh], 3
		mov	byte ptr [si+0Fh], 1
		mov	dword ptr [si+10h], 0

loc_91DD5:
		mov	eax, [bp+var_6C]
		mov	[si+10h], eax

loc_91DDD:
		push	large 0FFFFFFFFh
		push	large [bp+var_68]
		push	0
		mov	al, [si+0Eh]
		push	ax
		push	large dword ptr	[si+0Ah]

loc_91DEE:
		push	5C44h

loc_91DF1:
		call	Memory_TypedAllocDispatchB_5C832

loc_91DF6:
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_194]
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		lea	ax, [bp+var_194]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	0
		lea	ax, [bp+var_194]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		mov	[bp+var_2], 0
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_DE]
		push	ax
		call	VROOMM_StubThunk_6C969
		add	sp, 0Ah
		cmp	[bp+var_A9], 0
		jnz	short loc_91E4B
		mov	[bp+var_8F], 0
		jmp	short $+2

loc_91E4B:				; CODE XREF: ResourceFile_LoadTypeB_91D29+119j
		push	0
		mov	ax, si

loc_91E4F:
		add	ax, 0Ah

loc_91E52:
		mov	[bp+var_4], ax

loc_91E55:
		mov	ax, si
		add	ax, 51h	; 'Q'
		mov	[bp+var_6], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_91EE3
		push	large 0B0049h

loc_91E71:
		push	large 4300E2h

loc_91E77:
		push	ax

loc_91E78:
		call	VROOMM_StubThunk_6C76C

loc_91E7D:
		add	sp, 0Ah

loc_91E80:
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[bp+var_A], eax
		mov	al, [bx+4]
		mov	[bp+var_B], al
		mov	eax, [bp+var_A]
		mov	[di+20h], eax
		mov	al, [bp+var_B]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax

loc_91ECF:
		mov	word ptr [di+2Ah], 1Ah
		mov	word ptr [di+2Ch], 1Bh
		mov	ax, [bp+var_6]

loc_91EDC:
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_91EE5
; ���������������������������������������������������������������������������

loc_91EE3:				; CODE XREF: ResourceFile_LoadTypeB_91D29+140j
		mov	ax, di

loc_91EE5:				; CODE XREF: ResourceFile_LoadTypeB_91D29+1B8j
		push	ax

loc_91EE6:
		lea	ax, [bp+var_DE]
		push	ax

loc_91EEB:
		call	VROOMM_StubThunk_6C95A

loc_91EF0:
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 0Ah
		mov	[bp+var_E], ax
		mov	ax, si
		add	ax, 52h	; 'R'
		mov	[bp+var_10], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_91F8B
		push	large 0B0049h
		push	large 5000E2h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_14], eax
		mov	al, [bx+4]
		mov	[bp+var_15], al
		mov	eax, [bp+var_14]
		mov	[di+20h], eax

loc_91F5D:
		mov	al, [bp+var_15]
		mov	[di+24h], al

loc_91F63:
		mov	byte ptr [di+25h], 0

loc_91F67:
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 1Ch
		mov	word ptr [di+2Ch], 1Dh
		mov	ax, [bp+var_10]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_91F8D
; ���������������������������������������������������������������������������

loc_91F8B:				; CODE XREF: ResourceFile_LoadTypeB_91D29+1E8j
		mov	ax, di

loc_91F8D:				; CODE XREF: ResourceFile_LoadTypeB_91D29+260j
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 0Ah
		mov	[bp+var_18], ax
		mov	ax, si
		add	ax, 5Ah	; 'Z'
		mov	[bp+var_1A], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_92033
		push	large 0B0049h
		push	large 430016h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh

loc_91FD5:
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2

loc_91FE1:
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0

loc_91FED:
		mov	bx, [bp+var_18]

loc_91FF0:
		mov	eax, [bx]

loc_91FF3:
		mov	[bp+var_1E], eax
		mov	al, [bx+4]
		mov	[bp+var_1F], al
		mov	eax, [bp+var_1E]

loc_92001:
		mov	[di+20h], eax

loc_92005:
		mov	al, [bp+var_1F]
		mov	[di+24h], al

loc_9200B:
		mov	byte ptr [di+25h], 0

loc_9200F:
		mov	dword ptr [di+26h], 0

loc_92017:
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 2
		mov	word ptr [di+2Ch], 3
		mov	ax, [bp+var_1A]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_92035
; ���������������������������������������������������������������������������

loc_92033:				; CODE XREF: ResourceFile_LoadTypeB_91D29+290j
		mov	ax, di

loc_92035:				; CODE XREF: ResourceFile_LoadTypeB_91D29+308j
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 0Ah
		mov	[bp+var_22], ax
		mov	ax, si
		add	ax, 55h	; 'U'
		mov	[bp+var_24], ax
		push	2Eh ; '.'

loc_92057:
		call	CRT_Malloc16_Retry

loc_9205C:
		pop	cx
		mov	di, ax
		or	ax, ax

loc_92061:
		jz	short loc_920DB
		push	large 0B0049h
		push	large 5D0016h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh

loc_9207D:
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_22]
		mov	eax, [bx]
		mov	[bp+var_28], eax
		mov	al, [bx+4]
		mov	[bp+var_29], al
		mov	eax, [bp+var_28]
		mov	[di+20h], eax
		mov	al, [bp+var_29]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 6
		mov	word ptr [di+2Ch], 7
		mov	ax, [bp+var_24]

loc_920D4:
		mov	[di+1Eh], ax

loc_920D7:
		mov	ax, di

loc_920D9:
		jmp	short loc_920DD
; ���������������������������������������������������������������������������

loc_920DB:				; CODE XREF: ResourceFile_LoadTypeB_91D29:loc_92061j
		mov	ax, di

loc_920DD:				; CODE XREF: ResourceFile_LoadTypeB_91D29:loc_920D9j
		push	ax
		lea	ax, [bp+var_DE]

loc_920E2:
		push	ax

loc_920E3:
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 0Ah

loc_920F2:
		mov	[bp+var_2C], ax
		mov	ax, si
		add	ax, 56h	; 'V'
		mov	[bp+var_2E], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax

loc_92107:
		or	ax, ax
		jz	short loc_92183

loc_9210B:
		push	large 0B0049h
		push	large 500016h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_2C]
		mov	eax, [bx]
		mov	[bp+var_32], eax
		mov	al, [bx+4]
		mov	[bp+var_33], al
		mov	eax, [bp+var_32]

loc_92151:
		mov	[di+20h], eax
		mov	al, [bp+var_33]
		mov	[di+24h], al

loc_9215B:
		mov	byte ptr [di+25h], 0

loc_9215F:
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 4

loc_92174:
		mov	word ptr [di+2Ch], 5
		mov	ax, [bp+var_2E]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_92185
; ���������������������������������������������������������������������������

loc_92183:				; CODE XREF: ResourceFile_LoadTypeB_91D29+3E0j
		mov	ax, di

loc_92185:				; CODE XREF: ResourceFile_LoadTypeB_91D29+458j
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 0Ah
		mov	[bp+var_36], ax
		mov	ax, si
		add	ax, 57h	; 'W'
		mov	[bp+var_38], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9222B
		push	large 0B0049h
		push	large 840016h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh

loc_921CD:
		mov	dword ptr [di+20h], 0

loc_921D5:
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_36]
		mov	eax, [bx]
		mov	[bp+var_3C], eax
		mov	al, [bx+4]
		mov	[bp+var_3D], al
		mov	eax, [bp+var_3C]
		mov	[di+20h], eax
		mov	al, [bp+var_3D]
		mov	[di+24h], al

loc_92203:
		mov	byte ptr [di+25h], 0

loc_92207:
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 0Ch
		mov	word ptr [di+2Ch], 0Dh
		mov	ax, [bp+var_38]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_9222D
; ���������������������������������������������������������������������������

loc_9222B:				; CODE XREF: ResourceFile_LoadTypeB_91D29+488j
		mov	ax, di

loc_9222D:				; CODE XREF: ResourceFile_LoadTypeB_91D29+500j
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 0Ah
		mov	[bp+var_40], ax
		mov	ax, si
		add	ax, 59h	; 'Y'
		mov	[bp+var_42], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_922D3
		push	large 0B0049h

loc_92261:
		push	large 6A0016h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah

loc_92270:
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_40]
		mov	eax, [bx]
		mov	[bp+var_46], eax
		mov	al, [bx+4]
		mov	[bp+var_47], al
		mov	eax, [bp+var_46]
		mov	[di+20h], eax
		mov	al, [bp+var_47]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 8
		mov	word ptr [di+2Ch], 9
		mov	ax, [bp+var_42]
		mov	[di+1Eh], ax
		mov	ax, di

loc_922D1:
		jmp	short loc_922D5
; ���������������������������������������������������������������������������

loc_922D3:				; CODE XREF: ResourceFile_LoadTypeB_91D29+530j
		mov	ax, di

loc_922D5:				; CODE XREF: ResourceFile_LoadTypeB_91D29:loc_922D1j
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		call	VROOMM_StubThunk_6C95A

loc_922E0:
		add	sp, 6

loc_922E3:
		push	0
		mov	ax, si

loc_922E7:
		add	ax, 0Ah
		mov	[bp+var_4A], ax
		mov	ax, si

loc_922EF:
		add	ax, 58h	; 'X'

loc_922F2:
		mov	[bp+var_4C], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9237B
		push	large 0B0049h

loc_92309:
		push	large 770016h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_4A]
		mov	eax, [bx]
		mov	[bp+var_50], eax
		mov	al, [bx+4]
		mov	[bp+var_51], al
		mov	eax, [bp+var_50]
		mov	[di+20h], eax
		mov	al, [bp+var_51]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 0Ah
		mov	word ptr [di+2Ch], 0Bh
		mov	ax, [bp+var_4C]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_9237D
; ���������������������������������������������������������������������������

loc_9237B:				; CODE XREF: ResourceFile_LoadTypeB_91D29+5D8j
		mov	ax, di

loc_9237D:				; CODE XREF: ResourceFile_LoadTypeB_91D29+650j
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 0Ah
		mov	[bp+var_54], ax
		mov	ax, si
		add	ax, 5Bh	; '['
		mov	[bp+var_56], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_92423
		push	large 0B0049h
		push	large 910016h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2

loc_923D1:
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_54]

loc_923E0:
		mov	eax, [bx]

loc_923E3:
		mov	[bp+var_5A], eax
		mov	al, [bx+4]
		mov	[bp+var_5B], al
		mov	eax, [bp+var_5A]
		mov	[di+20h], eax
		mov	al, [bp+var_5B]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0

loc_923FF:
		mov	dword ptr [di+26h], 0

loc_92407:
		mov	eax, [bx+6]
		mov	[di+26h], eax

loc_9240F:
		mov	word ptr [di+2Ah], 0Eh

loc_92414:
		mov	word ptr [di+2Ch], 0Fh
		mov	ax, [bp+var_56]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_92425
; ���������������������������������������������������������������������������

loc_92423:				; CODE XREF: ResourceFile_LoadTypeB_91D29+680j
		mov	ax, di

loc_92425:				; CODE XREF: ResourceFile_LoadTypeB_91D29+6F8j
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	large 0
		push	large 230022h
		push	large 0B000Ch
		push	large 1Ch
		push	large 21h ; '!'
		push	large 20000Bh

loc_9244E:
		push	large 0C0000h

loc_92454:
		push	large 0E0000h

loc_9245A:
		push	large 1F001Eh

loc_92460:
		push	large 0B000Ch
		push	large 0
		push	3
		mov	ax, si
		add	ax, 53h	; 'S'
		push	ax
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	large 0B0028h
		push	large 5D00F3h
		push	0
		call	VROOMM_StubThunk_6C9F0
		add	sp, 3Ah
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	large 0
		push	large 190018h
		push	large 0B000Ch
		push	large 0
		push	large 17h
		push	large 16000Bh
		push	large 0C0000h
		push	large 0E0000h
		push	large 150014h
		push	large 0B000Ch
		push	large 1Ch

loc_924D1:
		push	large 13h

loc_924D4:
		push	large 12000Bh

loc_924DA:
		push	large 0C0000h

loc_924E0:
		push	large 2A0000h
		push	large 110010h
		push	large 0B000Ch

loc_924F2:
		push	large 38h ; '8'
		push	5
		mov	ax, si
		add	ax, 5Ch	; '\'
		push	ax
		mov	ax, si

loc_924FF:
		add	ax, 0Ah
		push	ax

loc_92503:
		push	large 0B0044h
		push	large 9F007Fh
		push	0
		call	VROOMM_StubThunk_6C9F0
		add	sp, 56h
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 0Ah
		mov	[bp+var_5E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_92542
		jmp	loc_925C9
; ���������������������������������������������������������������������������

loc_92542:				; CODE XREF: ResourceFile_LoadTypeB_91D29+814j
		push	large 0B0026h
		push	large 8400F4h
		push	ax

loc_9254F:
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_5E]
		mov	eax, [bx]
		mov	[bp+var_62], eax
		mov	al, [bx+4]
		mov	[bp+var_63], al
		mov	eax, [bp+var_62]
		mov	[di+1Eh], eax
		mov	al, [bp+var_63]
		mov	[di+22h], al

loc_92592:
		mov	byte ptr [di+23h], 0

loc_92596:
		mov	dword ptr [di+24h], 0

loc_9259E:
		mov	eax, [bx+6]

loc_925A2:
		mov	[di+24h], eax

loc_925A6:
		mov	word ptr [di+28h], 24h ; '$'
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 25h ; '%'
		mov	ax, di
		jmp	short loc_925CB
; ���������������������������������������������������������������������������

loc_925C9:				; CODE XREF: ResourceFile_LoadTypeB_91D29+816j
		mov	ax, di

loc_925CB:				; CODE XREF: ResourceFile_LoadTypeB_91D29+89Ej
		push	ax
		lea	ax, [bp+var_DE]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	[bp+var_B8]
		push	1
		lea	ax, [bp+var_DE]
		push	ax

loc_925E4:
		call	VROOMM_StubThunk_6C946
		add	sp, 6

loc_925EC:
		lea	di, [bp+var_DE]
		push	1

loc_925F2:
		push	large 10000h
		mov	al, [si+0Eh]
		push	ax
		push	large dword ptr	[si+0Ah]

loc_92600:
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		push	si
		call	VROOMM_StubThunk_6B785
		add	sp, 0Ch
		push	di
		call	VROOMM_StubThunk_6C996
		pop	cx
		jmp	short loc_9262B
; ���������������������������������������������������������������������������

loc_92620:				; CODE XREF: ResourceFile_LoadTypeB_91D29+926j
		push	0
		push	di
		call	VROOMM_StubThunk_6C9B4
		add	sp, 4

loc_9262B:				; CODE XREF: ResourceFile_LoadTypeB_91D29+8F5j
		push	0
		mov	al, [si+0Eh]
		push	ax
		push	large dword ptr	[si+0Ah]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		push	si
		push	cs
		call	near ptr Cockpit_ApplyFormatAndDraw_91B70
		add	sp, 8
		cmp	[bp+var_2], 0
		jz	short loc_92620

loc_92651:
		push	di
		call	VROOMM_StubThunk_6C9BE
		pop	cx
		cmp	byte ptr [si+0Fh], 0
		jz	short loc_9267E
		cmp	dword ptr [si+0Ah], 0

loc_92663:
		jz	short loc_9267E
		push	0
		mov	al, [si+0Eh]
		push	ax
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_9267E:				; CODE XREF: ResourceFile_LoadTypeB_91D29+933j
					; ResourceFile_LoadTypeB_91D29:loc_92663j
		mov	dword ptr [si+0Ah], 0
		mov	byte ptr [si+0Fh], 0
		mov	dword ptr [si+10h], 0
		push	2

loc_92694:
		lea	ax, [bp+var_DE]
		push	ax
		call	VROOMM_StubThunk_6C978

loc_9269E:
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
ResourceFile_LoadTypeB_91D29	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 123 lignes, NON DÉTAILLÉE — combine Cockpit_PanAzimuthUpdate, EMS_MapPage,
; UI_ApplyEncodingHelper_5E576, TextScrollDisplayB_ApplyHelperD_67F60 (seg209).
; ==============================================================================================
Cockpit_LoadAndApplyEncoding_926A5	proc far		; CODE XREF: VROOMM_StubThunk_6B835J

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_4], 100h
		lea	ax, [bp+var_4]
		push	ax
		push	541Ah
		call	Cockpit_PanAzimuthUpdate
		add	sp, 4
		cmp	byte_721F0, 2
		jnz	short loc_926D2
		mov	ax, 1
		jmp	short loc_926D4
; ���������������������������������������������������������������������������

loc_926D2:				; CODE XREF: Cockpit_LoadAndApplyEncoding_926A5+26j
		xor	ax, ax

loc_926D4:				; CODE XREF: Cockpit_LoadAndApplyEncoding_926A5+2Bj
		or	ax, ax
		jz	short loc_926FE
		cmp	byte_721F0, 2
		jnz	short loc_926EE
		push	0
		push	5130h
		call	EMS_MapPage
		add	sp, 4
		jmp	short $+2

loc_926EE:				; CODE XREF: Cockpit_LoadAndApplyEncoding_926A5+38j
		xor	dx, dx
		mov	cl, 0
		mov	ch, 2
		mov	bx, 4355h
		mov	ax, 1209h
		int	15h
		jmp	short loc_9270D
; ���������������������������������������������������������������������������

loc_926FE:				; CODE XREF: Cockpit_LoadAndApplyEncoding_926A5+31j
		push	5196h

loc_92701:
		push	word_70E62
		call	UI_ApplyEncodingHelper_5E576
		add	sp, 4

loc_9270D:				; CODE XREF: Cockpit_LoadAndApplyEncoding_926A5+57j
		mov	al, [bp+arg_2]
		push	ax
		push	si
		nop
		push	cs

loc_92714:
		call	near ptr ResourceFile_LoadTypeC_9277C
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperD_67F60
		push	si
		call	VROOMM_StubThunk_6B78A
		pop	cx
		cmp	byte_721F0, 2
		jnz	short loc_92732
		mov	ax, 1
		jmp	short loc_92734
; ���������������������������������������������������������������������������

loc_92732:				; CODE XREF: Cockpit_LoadAndApplyEncoding_926A5+86j
		xor	ax, ax

loc_92734:				; CODE XREF: Cockpit_LoadAndApplyEncoding_926A5+8Bj
		or	ax, ax
		jz	short loc_92779
		cmp	byte_721F0, 2
		jnz	short loc_92779
		pushf
		mov	bx, 534Dh
		mov	ax, 1209h
		int	15h
		popf
		mov	[bp+var_6], bx
		push	1
		push	5130h

loc_92751:
		call	EMS_MapPage

loc_92756:
		add	sp, 4
		xor	dx, dx
		mov	cl, 0

loc_9275D:
		mov	ch, 2
		mov	bx, 4355h

loc_92762:
		mov	ax, 1209h
		int	15h
		cmp	[bp+var_6], 0
		jnz	short loc_92779
		pushf
		mov	bx, 736Dh
		mov	ax, 1209h
		int	15h
		popf
		jmp	short $+2

loc_92779:				; CODE XREF: Cockpit_LoadAndApplyEncoding_926A5+91j
					; Cockpit_LoadAndApplyEncoding_926A5+98j ...
		pop	si
		leave
		retf
Cockpit_LoadAndApplyEncoding_926A5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 832 lignes, NON DÉTAILLÉE — variante de ResourceFile_LoadTypeA_90097.
; ==============================================================================================
ResourceFile_LoadTypeC_9277C	proc far		; CODE XREF: VROOMM_StubThunk_6B83FJ
					; Cockpit_LoadAndApplyEncoding_926A5:loc_92714p

var_192		= word ptr -192h
var_135		= dword	ptr -135h
var_131		= dword	ptr -131h
var_12C		= word ptr -12Ch
var_DC		= word ptr -0DCh
var_C8		= word ptr -0C8h
var_B4		= word ptr -0B4h
var_8E		= word ptr -8Eh
var_7F		= word ptr -7Fh
var_65		= byte ptr -65h
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= word ptr -36h
var_33		= byte ptr -33h
var_32		= word ptr -32h
var_2F		= byte ptr -2Fh
var_2E		= dword	ptr -2Eh
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_23		= byte ptr -23h
var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
var_1B		= byte ptr -1Bh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_13		= byte ptr -13h
var_12		= dword	ptr -12h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 192h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	ds
		push	offset a_shp_7	; ".shp"
		push	ds
		push	offset aRestart	; "restart"
		push	ds

loc_92791:				; "FONTS"
		push	offset aFonts_0
		lea	ax, [bp+var_12C]
		push	ax

loc_92799:
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_192]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_192], 2C8h
		mov	[bp+var_131], 100h
		mov	[bp+var_135], 0
		mov	[bp+var_192], 138Ah
		push	1
		lea	ax, [bp+var_12C]
		push	ax

loc_927D1:
		lea	ax, [bp+var_192]
		push	ax

loc_927D6:
		mov	bx, [bp+var_192]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_192]
		push	ax
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_3E], eax

loc_927F3:
		mov	[bp+var_42], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h

loc_92802:
		call	Memory_TypedFreeWrapper_5C6F3

loc_92807:
		add	sp, 0Ch
		mov	word ptr [bp+var_46+2],	dx

loc_9280D:
		mov	word ptr [bp+var_46], ax
		mov	eax, [bp+var_46]
		mov	[si+46h], eax
		mov	byte ptr [si+4Ah], 3
		mov	byte ptr [si+4Bh], 1
		mov	dword ptr [si+4Ch], 0
		mov	eax, [bp+var_42]
		mov	[si+4Ch], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_3E]
		push	0
		mov	al, [si+4Ah]
		push	ax
		push	large dword ptr	[si+46h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_192]
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		lea	ax, [bp+var_192]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	0
		lea	ax, [bp+var_192]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0

loc_9287F:
		mov	[bp+var_6], 0

loc_92884:
		mov	[bp+var_8], 0

loc_92889:
		mov	[bp+var_A], 8

loc_9288E:
		mov	[bp+var_C], 9

loc_92893:
		cmp	[bp+arg_2], 0

loc_92897:
		jz	short loc_928A2

loc_92899:
		mov	ax, 0Ah
		mov	[bp+var_C], ax
		mov	[bp+var_A], ax

loc_928A2:				; CODE XREF: ResourceFile_LoadTypeC_9277C:loc_92897j
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C969
		add	sp, 0Ah
		cmp	[bp+var_7F], 0
		jnz	short loc_928C4
		mov	[bp+var_65], 0
		jmp	short $+2

loc_928C4:				; CODE XREF: ResourceFile_LoadTypeC_9277C+140j
		push	0
		mov	ax, si
		add	ax, 46h	; 'F'
		mov	[bp+var_E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_928DF
		jmp	loc_92966
; ���������������������������������������������������������������������������

loc_928DF:				; CODE XREF: ResourceFile_LoadTypeC_9277C+15Ej
		push	large 0B0042h

loc_928E5:
		push	large 500036h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_12], eax
		mov	al, [bx+4]
		mov	[bp+var_13], al
		mov	eax, [bp+var_12]
		mov	[di+1Eh], eax
		mov	al, [bp+var_13]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 2
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_4]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 3

loc_92962:
		mov	ax, di
		jmp	short loc_92968
; ���������������������������������������������������������������������������

loc_92966:				; CODE XREF: ResourceFile_LoadTypeC_9277C+160j
		mov	ax, di

loc_92968:				; CODE XREF: ResourceFile_LoadTypeC_9277C+1E8j
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	[bp+var_8E]
		push	13h
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C946

loc_92986:
		add	sp, 6
		push	0
		mov	ax, si

loc_9298D:
		add	ax, 46h	; 'F'
		mov	[bp+var_16], ax

loc_92993:
		push	30h ; '0'

loc_92995:
		call	CRT_Malloc16_Retry

loc_9299A:
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_929A4

loc_929A1:
		jmp	loc_92A2B
; ���������������������������������������������������������������������������

loc_929A4:				; CODE XREF: ResourceFile_LoadTypeC_9277C+223j
		push	large 0B0042h

loc_929AA:
		push	large 50007Eh

loc_929B0:
		push	ax

loc_929B1:
		call	VROOMM_StubThunk_6C76C

loc_929B6:
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_16]

loc_929D9:
		mov	eax, [bx]

loc_929DC:
		mov	[bp+var_1A], eax

loc_929E0:
		mov	al, [bx+4]

loc_929E3:
		mov	[bp+var_1B], al
		mov	eax, [bp+var_1A]
		mov	[di+1Eh], eax
		mov	al, [bp+var_1B]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 4
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_8]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 5
		mov	ax, di
		jmp	short loc_92A2D
; ���������������������������������������������������������������������������

loc_92A2B:				; CODE XREF: ResourceFile_LoadTypeC_9277C:loc_929A1j
		mov	ax, di

loc_92A2D:				; CODE XREF: ResourceFile_LoadTypeC_9277C+2ADj
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	[bp+var_8E]
		push	1Eh
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C946
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 46h	; 'F'

loc_92A55:
		mov	[bp+var_1E], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_92A69
		jmp	loc_92AF0
; ���������������������������������������������������������������������������

loc_92A69:				; CODE XREF: ResourceFile_LoadTypeC_9277C+2E8j
		push	large 0B0045h
		push	large 5000C6h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h

loc_92A83:
		mov	dword ptr [di+1Eh], 0

loc_92A8B:
		mov	byte ptr [di+22h], 2

loc_92A8F:
		mov	byte ptr [di+23h], 0

loc_92A93:
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_1E]
		mov	eax, [bx]
		mov	[bp+var_22], eax

loc_92AA5:
		mov	al, [bx+4]
		mov	[bp+var_23], al
		mov	eax, [bp+var_22]

loc_92AAF:
		mov	[di+1Eh], eax
		mov	al, [bp+var_23]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 6

loc_92AD2:
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_6]
		mov	[di+2Ah], ax

loc_92ADD:
		mov	word ptr [di+2Ch], 1

loc_92AE2:
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 7
		mov	ax, di
		jmp	short loc_92AF2
; ���������������������������������������������������������������������������

loc_92AF0:				; CODE XREF: ResourceFile_LoadTypeC_9277C+2EAj
		mov	ax, di

loc_92AF2:				; CODE XREF: ResourceFile_LoadTypeC_9277C+372j
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6

loc_92B00:
		push	[bp+var_8E]
		push	2Eh ; '.'

loc_92B06:
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C946
		add	sp, 6
		cmp	[bp+arg_2], 0
		jz	short loc_92B1C
		jmp	loc_92BEF
; ���������������������������������������������������������������������������

loc_92B1C:				; CODE XREF: ResourceFile_LoadTypeC_9277C+39Bj
		push	0
		mov	ax, si
		add	ax, 46h	; 'F'
		mov	[bp+var_26], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_28], ax
		mov	ax, [bp+var_C]
		mov	[bp+var_2A], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_92B43
		jmp	loc_92BCC
; ���������������������������������������������������������������������������

loc_92B43:				; CODE XREF: ResourceFile_LoadTypeC_9277C+3C2j
		push	large 1D000Bh
		push	large 370122h
		push	ax

loc_92B50:
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_26]
		mov	eax, [bx]
		mov	[bp+var_2E], eax
		mov	al, [bx+4]
		mov	[bp+var_2F], al
		mov	eax, [bp+var_2E]

loc_92B89:
		mov	[di+1Eh], eax
		mov	al, [bp+var_2F]

loc_92B90:
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]

loc_92BA3:
		mov	[di+24h], eax
		mov	ax, [bp+var_28]

loc_92BAA:
		mov	[di+28h], ax
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	ax, [bp+var_2A]
		mov	[di+2Eh], ax
		mov	ax, di
		jmp	short loc_92BCE
; ���������������������������������������������������������������������������

loc_92BCC:				; CODE XREF: ResourceFile_LoadTypeC_9277C+3C4j
		mov	ax, di

loc_92BCE:				; CODE XREF: ResourceFile_LoadTypeC_9277C+44Ej
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	[bp+var_8E]
		push	12h

loc_92BE2:
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C946
		add	sp, 6

loc_92BEF:				; CODE XREF: ResourceFile_LoadTypeC_9277C+39Dj
		push	[bp+var_8E]
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C946
		add	sp, 6
		lea	ax, [bp+var_B4]
		mov	[bp+var_32], ax
		cmp	[bp+arg_2], 0
		jnz	short loc_92C14

loc_92C0F:
		mov	ax, 1

loc_92C12:
		jmp	short loc_92C16
; ���������������������������������������������������������������������������

loc_92C14:				; CODE XREF: ResourceFile_LoadTypeC_9277C+491j
		xor	ax, ax

loc_92C16:				; CODE XREF: ResourceFile_LoadTypeC_9277C:loc_92C12j
		mov	[bp+var_33], al
		push	ax
		push	large 10000h
		mov	al, [si+4Ah]
		push	ax
		push	large dword ptr	[si+46h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_32]
		push	si
		call	VROOMM_StubThunk_6B785
		add	sp, 0Ch
		cmp	[bp+arg_2], 0
		jz	short loc_92C86
		push	[bp+var_32]
		call	VROOMM_StubThunk_6C7B7
		pop	cx
		push	large 0A0000h
		mov	al, [si+4Ah]
		push	ax
		push	large dword ptr	[si+46h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 370122h
		push	word_70E62
		call	Render_MeasureOrDrawTextString_61F52
		add	sp, 0Ch
		push	[bp+var_32]

loc_92C80:
		call	VROOMM_StubThunk_6C7BC
		pop	cx

loc_92C86:				; CODE XREF: ResourceFile_LoadTypeC_9277C+4C9j
		push	[bp+var_32]

loc_92C89:
		call	VROOMM_StubThunk_6C996
		pop	cx
		push	[bp+var_32]

loc_92C92:
		call	VROOMM_StubThunk_6C7B7

loc_92C97:
		pop	cx
		mov	di, word_72A94
		push	14DCh
		lea	ax, [bp+var_DC]
		push	ax

loc_92CA4:
		call	CRT_Strcpy

loc_92CA9:
		add	sp, 4
		push	ss
		lea	ax, [bp+var_DC]
		push	ax
		push	di
		call	VROOMM_StubThunk_6AEFD
		add	sp, 6
		mov	cx, ax
		mov	bx, word_70E62
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		sub	ax, cx
		sar	ax, 1
		mov	cx, ax
		mov	[bp+var_36], 36h ; '6'
		push	ss
		lea	ax, [bp+var_DC]
		push	ax
		push	46h ; 'F'
		push	cx
		push	bx
		push	di
		call	VROOMM_StubThunk_6AF02
		add	sp, 0Ch
		mov	al, [bp+arg_2]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3		; switch 4 cases
		ja	short loc_92D51	; default
		shl	bx, 1
		jmp	cs:off_92E56[bx] ; switch jump

loc_92CF9:				; DATA XREF: ovr268:off_92E56o
		push	14ECh		; case 0x0
		jmp	short loc_92D0B
; ���������������������������������������������������������������������������

loc_92CFE:				; CODE XREF: ResourceFile_LoadTypeC_9277C+578j
					; DATA XREF: ovr268:off_92E56o
		push	14F6h		; case 0x1
		jmp	short loc_92D0B
; ���������������������������������������������������������������������������

loc_92D03:				; CODE XREF: ResourceFile_LoadTypeC_9277C+578j
					; DATA XREF: ovr268:off_92E56o
		push	1508h		; case 0x2
		jmp	short loc_92D0B
; ���������������������������������������������������������������������������

loc_92D08:				; CODE XREF: ResourceFile_LoadTypeC_9277C+578j
					; DATA XREF: ovr268:off_92E56o
		push	1517h		; case 0x3

loc_92D0B:				; CODE XREF: ResourceFile_LoadTypeC_9277C+580j
					; ResourceFile_LoadTypeC_9277C+585j ...
		lea	ax, [bp+var_C8]
		push	ax

loc_92D10:
		call	CRT_Strcpy
		add	sp, 4
		push	ss
		lea	ax, [bp+var_C8]
		push	ax
		push	di
		call	VROOMM_StubThunk_6AEFD
		add	sp, 6
		mov	cx, ax
		mov	bx, word_70E62
		mov	ax, [bx+8]
		sub	ax, [bx+4]
		inc	ax
		sub	ax, cx
		sar	ax, 1
		mov	bx, ax
		push	ss
		lea	ax, [bp+var_C8]
		push	ax
		push	[bp+var_36]
		push	bx
		push	word_70E62
		push	di
		call	VROOMM_StubThunk_6AF02
		add	sp, 0Ch

loc_92D51:				; CODE XREF: ResourceFile_LoadTypeC_9277C+574j
		push	[bp+var_32]	; default
		call	VROOMM_StubThunk_6C7BC
		pop	cx
		jmp	short loc_92D80
; ���������������������������������������������������������������������������

loc_92D5C:				; CODE XREF: ResourceFile_LoadTypeC_9277C+608j
		push	0
		push	[bp+var_32]
		call	VROOMM_StubThunk_6C9B4
		add	sp, 4
		cmp	[bp+var_8], 0
		jnz	short loc_92D7B
		cmp	[bp+var_4], 0
		jnz	short loc_92D7B
		cmp	[bp+var_6], 0
		jz	short loc_92D80

loc_92D7B:				; CODE XREF: ResourceFile_LoadTypeC_9277C+5F1j
					; ResourceFile_LoadTypeC_9277C+5F7j
		mov	[bp+var_2], 1

loc_92D80:				; CODE XREF: ResourceFile_LoadTypeC_9277C+5DEj
					; ResourceFile_LoadTypeC_9277C+5FDj
		cmp	[bp+var_2], 0
		jz	short loc_92D5C

loc_92D86:
		push	[bp+var_32]
		call	VROOMM_StubThunk_6C9BE
		pop	cx
		cmp	[bp+var_8], 0

loc_92D93:
		jz	short loc_92D9C

loc_92D95:
		mov	byte_706AF, 4
		jmp	short loc_92DE2
; ���������������������������������������������������������������������������

loc_92D9C:				; CODE XREF: ResourceFile_LoadTypeC_9277C:loc_92D93j
		cmp	[bp+var_4], 0
		jz	short loc_92DA9

loc_92DA2:
		mov	byte_706AF, 6

loc_92DA7:
		jmp	short loc_92DE2
; ���������������������������������������������������������������������������

loc_92DA9:				; CODE XREF: ResourceFile_LoadTypeC_9277C+624j
		cmp	[bp+var_6], 0
		jz	short loc_92DE2

loc_92DAF:
		cmp	[bp+arg_2], 0
		jz	short loc_92DBB

loc_92DB5:
		cmp	[bp+arg_2], 3
		jnz	short loc_92DE2

loc_92DBB:				; CODE XREF: ResourceFile_LoadTypeC_9277C+637j
		mov	byte_706AF, 1
		cmp	[bp+arg_2], 0
		jnz	short loc_92DE2
		mov	[bp+var_3A], 80h ; '�'

loc_92DCE:
		mov	eax, dword_706AB

loc_92DD2:
		mov	edx, [bp+var_3A]

loc_92DD6:
		imul	edx

loc_92DD9:
		shrd	eax, edx, 8

loc_92DDE:
		mov	dword_706AB, eax

loc_92DE2:				; CODE XREF: ResourceFile_LoadTypeC_9277C+61Ej
					; ResourceFile_LoadTypeC_9277C:loc_92DA7j	...
		cmp	byte ptr [si+4Bh], 0
		jz	short loc_92E08
		cmp	dword ptr [si+46h], 0
		jz	short loc_92E08
		push	0
		mov	al, [si+4Ah]
		push	ax
		mov	ax, si
		add	ax, 46h	; 'F'
		push	ax
		push	5C44h

loc_92DFE:
		call	Memory_TypedFree_5C7B6

loc_92E03:
		add	sp, 8

loc_92E06:
		jmp	short $+2

loc_92E08:				; CODE XREF: ResourceFile_LoadTypeC_9277C+66Aj
					; ResourceFile_LoadTypeC_9277C+671j
		mov	dword ptr [si+46h], 0

loc_92E10:
		mov	byte ptr [si+4Bh], 0

loc_92E14:
		mov	dword ptr [si+4Ch], 0
		cmp	[bp+var_8], 0
		jnz	short loc_92E2E
		cmp	[bp+var_4], 0
		jnz	short loc_92E2E
		cmp	[bp+var_6], 0
		jz	short loc_92E41

loc_92E2E:				; CODE XREF: ResourceFile_LoadTypeC_9277C+6A4j
					; ResourceFile_LoadTypeC_9277C+6AAj
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C978
		add	sp, 4
		mov	al, 1
		jmp	short loc_92E52
; ���������������������������������������������������������������������������

loc_92E41:				; CODE XREF: ResourceFile_LoadTypeC_9277C+6B0j
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C978
		add	sp, 4
		mov	al, 0

loc_92E52:				; CODE XREF: ResourceFile_LoadTypeC_9277C+6C3j
		pop	di
		pop	si
		leave
		retf
ResourceFile_LoadTypeC_9277C	endp

; ���������������������������������������������������������������������������
off_92E56	dw offset loc_92CF9	; DATA XREF: ResourceFile_LoadTypeC_9277C+578r
		dw offset loc_92CFE	; jump table for switch	statement
		dw offset loc_92D03
		dw offset loc_92D08
ovr268		ends
