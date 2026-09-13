ovr269		segment	para public 'OVERLAY' use16
		assume cs:ovr269
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 477 lignes, NON DÉTAILLÉE — variante de ResourceFile_LoadTypeA_90097.
; ==============================================================================================
ResourceFile_LoadTypeD_92E60	proc far		; CODE XREF: VROOMM_StubThunk_6B87FJ

var_14E		= word ptr -14Eh
var_F1		= dword	ptr -0F1h
var_ED		= dword	ptr -0EDh
var_E8		= word ptr -0E8h
var_98		= word ptr -98h
var_72		= word ptr -72h
var_63		= word ptr -63h
var_49		= byte ptr -49h
var_2A		= dword	ptr -2Ah
var_26		= dword	ptr -26h
var_22		= dword	ptr -22h
var_1D		= byte ptr -1Dh
var_1C		= dword	ptr -1Ch
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
		sub	sp, 14Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	ds
		push	offset a_shp_8	; ".shp"
		push	ds
		push	offset aGameopt	; "gameopt"
		push	ds
		push	offset aFonts_0	; "FONTS"
		lea	ax, [bp+var_E8]
		push	ax

loc_92E7D:
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_14E]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_14E], 2C8h
		mov	[bp+var_ED], 100h

loc_92E9F:
		mov	[bp+var_F1], 0
		mov	[bp+var_14E], 138Ah
		push	1
		lea	ax, [bp+var_E8]
		push	ax
		lea	ax, [bp+var_14E]
		push	ax
		mov	bx, [bp+var_14E]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_14E]
		push	ax
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax

loc_92ED0:
		pop	eax
		pop	cx
		mov	[bp+var_22], eax
		mov	[bp+var_26], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_2A+2],	dx
		mov	word ptr [bp+var_2A], ax
		mov	eax, [bp+var_2A]
		mov	[si+32h], eax
		mov	byte ptr [si+36h], 3
		mov	byte ptr [si+37h], 1

loc_92F04:
		mov	dword ptr [si+38h], 0

loc_92F0C:
		mov	eax, [bp+var_26]

loc_92F10:
		mov	[si+38h], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_22]
		push	0
		mov	al, [si+36h]
		push	ax
		push	large dword ptr	[si+32h]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_14E]
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		lea	ax, [bp+var_14E]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	0
		lea	ax, [bp+var_14E]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		mov	[bp+var_2], 0
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_98]
		push	ax
		call	VROOMM_StubThunk_6C969
		add	sp, 0Ah
		cmp	[bp+var_63], 0
		jnz	short loc_92F80
		mov	[bp+var_49], 0
		jmp	short $+2

loc_92F80:				; CODE XREF: ResourceFile_LoadTypeD_92E60+118j
		push	0

loc_92F82:
		mov	ax, si
		add	ax, 32h	; '2'
		mov	[bp+var_4], ax
		mov	ax, si
		add	ax, 68h	; 'h'
		mov	[bp+var_6], ax
		push	2Eh ; '.'

loc_92F94:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_93018

loc_92FA0:
		push	large 110049h
		push	large 460030h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0

loc_92FCA:
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[bp+var_A], eax
		mov	al, [bx+4]
		mov	[bp+var_B], al

loc_92FE2:
		mov	eax, [bp+var_A]

loc_92FE6:
		mov	[di+20h], eax

loc_92FEA:
		mov	al, [bp+var_B]

loc_92FED:
		mov	[di+24h], al

loc_92FF0:
		mov	byte ptr [di+25h], 0

loc_92FF4:
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]

loc_93000:
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 2

loc_93009:
		mov	word ptr [di+2Ch], 3
		mov	ax, [bp+var_6]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_9301A
; ���������������������������������������������������������������������������

loc_93018:				; CODE XREF: ResourceFile_LoadTypeD_92E60+13Ej
		mov	ax, di

loc_9301A:				; CODE XREF: ResourceFile_LoadTypeD_92E60+1B6j
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 32h	; '2'
		mov	[bp+var_E], ax
		mov	ax, si
		add	ax, 69h	; 'i'
		mov	[bp+var_10], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_930C0
		push	large 110049h
		push	large 5A0030h
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

loc_93080:
		mov	[bp+var_14], eax
		mov	al, [bx+4]

loc_93087:
		mov	[bp+var_15], al

loc_9308A:
		mov	eax, [bp+var_14]

loc_9308E:
		mov	[di+20h], eax

loc_93092:
		mov	al, [bp+var_15]

loc_93095:
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0

loc_9309C:
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 4

loc_930B1:
		mov	word ptr [di+2Ch], 5
		mov	ax, [bp+var_10]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_930C2
; ���������������������������������������������������������������������������

loc_930C0:				; CODE XREF: ResourceFile_LoadTypeD_92E60+1E6j
		mov	ax, di

loc_930C2:				; CODE XREF: ResourceFile_LoadTypeD_92E60+25Ej
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	large 0

loc_930D3:
		push	large 70006h

loc_930D9:
		push	large 0B002Eh

loc_930DF:
		push	large 1A0000h

loc_930E5:
		push	large 9
		push	large 8000Bh

loc_930EE:
		push	large 2E000Dh
		push	large 0
		push	large 0B000Ah

loc_930FD:
		push	large 0B002Eh

loc_93103:
		push	large 0

loc_93106:
		push	3

loc_93108:
		mov	ax, si

loc_9310A:
		add	ax, 6Fh	; 'o'
		push	ax

loc_9310E:
		mov	ax, si
		add	ax, 32h	; '2'
		push	ax

loc_93114:
		push	large 270042h
		push	large 4A00C5h
		push	0
		call	VROOMM_StubThunk_6C9F0
		add	sp, 3Ah
		push	ax
		lea	ax, [bp+var_98]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 32h	; '2'
		mov	[bp+var_18], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_93153
		jmp	loc_931DA
; ���������������������������������������������������������������������������

loc_93153:				; CODE XREF: ResourceFile_LoadTypeD_92E60+2EEj
		push	large 0B003Bh
		push	large 7A0081h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_18]
		mov	eax, [bx]
		mov	[bp+var_1C], eax
		mov	al, [bx+4]
		mov	[bp+var_1D], al
		mov	eax, [bp+var_1C]
		mov	[di+1Eh], eax

loc_9319D:
		mov	al, [bp+var_1D]
		mov	[di+22h], al

loc_931A3:
		mov	byte ptr [di+23h], 0

loc_931A7:
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Ch
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 0Dh
		mov	ax, di
		jmp	short loc_931DC
; ���������������������������������������������������������������������������

loc_931DA:				; CODE XREF: ResourceFile_LoadTypeD_92E60+2F0j
		mov	ax, di

loc_931DC:				; CODE XREF: ResourceFile_LoadTypeD_92E60+378j
		push	ax
		lea	ax, [bp+var_98]
		push	ax

loc_931E2:
		call	VROOMM_StubThunk_6C95A
		add	sp, 6

loc_931EA:
		push	[bp+var_72]
		push	1
		lea	ax, [bp+var_98]
		push	ax
		call	VROOMM_StubThunk_6C946
		add	sp, 6
		lea	di, [bp+var_98]

loc_93200:
		push	1

loc_93202:
		push	large 10000h

loc_93208:
		mov	al, [si+36h]
		push	ax
		push	large dword ptr	[si+32h]

loc_93210:
		push	5C44h

loc_93213:
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
		jmp	short loc_9323B
; ���������������������������������������������������������������������������

loc_93230:				; CODE XREF: ResourceFile_LoadTypeD_92E60+3DFj
		push	0
		push	di
		call	VROOMM_StubThunk_6C9B4
		add	sp, 4

loc_9323B:				; CODE XREF: ResourceFile_LoadTypeD_92E60+3CEj
		cmp	[bp+var_2], 0
		jz	short loc_93230
		push	di
		call	VROOMM_StubThunk_6C9BE
		pop	cx
		cmp	byte ptr [si+37h], 0
		jz	short loc_9326E
		cmp	dword ptr [si+32h], 0
		jz	short loc_9326E
		push	0
		mov	al, [si+36h]
		push	ax
		mov	ax, si
		add	ax, 32h	; '2'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_9326E:				; CODE XREF: ResourceFile_LoadTypeD_92E60+3ECj
					; ResourceFile_LoadTypeD_92E60+3F3j
		mov	dword ptr [si+32h], 0
		mov	byte ptr [si+37h], 0
		mov	dword ptr [si+38h], 0
		push	2
		lea	ax, [bp+var_98]
		push	ax
		call	VROOMM_StubThunk_6C978
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
ResourceFile_LoadTypeD_92E60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 1023 lignes, NON DÉTAILLÉE — variante de ResourceFile_LoadTypeA_90097.
; ==============================================================================================
ResourceFile_LoadTypeE_93295	proc far		; CODE XREF: VROOMM_StubThunk_6B870J

var_19E		= word ptr -19Eh
var_141		= dword	ptr -141h
var_13D		= dword	ptr -13Dh
var_138		= word ptr -138h
var_E8		= word ptr -0E8h
var_C2		= word ptr -0C2h
var_B3		= word ptr -0B3h
var_99		= byte ptr -99h
var_7A		= dword	ptr -7Ah
var_76		= dword	ptr -76h
var_72		= dword	ptr -72h
var_6D		= byte ptr -6Dh
var_6C		= dword	ptr -6Ch
var_68		= word ptr -68h
var_65		= byte ptr -65h
var_64		= dword	ptr -64h
var_60		= word ptr -60h
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

loc_93298:
		sub	sp, 19Eh

loc_9329C:
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	ds

loc_932A2:				; ".shp"
		push	offset a_shp_9
		push	ds
		push	offset aCockopt	; "cockopt"
		push	ds
		push	offset aFonts_0	; "FONTS"
		lea	ax, [bp+var_138]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_19E]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_19E], 2C8h
		mov	[bp+var_13D], 100h
		mov	[bp+var_141], 0
		mov	[bp+var_19E], 138Ah

loc_932E3:
		push	1
		lea	ax, [bp+var_138]
		push	ax

loc_932EA:
		lea	ax, [bp+var_19E]
		push	ax
		mov	bx, [bp+var_19E]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_19E]
		push	ax

loc_932FE:
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax
		pop	eax

loc_93307:
		pop	cx
		mov	[bp+var_72], eax
		mov	[bp+var_76], eax
		push	1

loc_93312:
		push	0

loc_93314:
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_7A+2],	dx
		mov	word ptr [bp+var_7A], ax
		mov	eax, [bp+var_7A]
		mov	[si+1Eh], eax
		mov	byte ptr [si+22h], 3
		mov	byte ptr [si+23h], 1
		mov	dword ptr [si+24h], 0
		mov	eax, [bp+var_76]
		mov	[si+24h], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_72]
		push	0
		mov	al, [si+22h]
		push	ax
		push	large dword ptr	[si+1Eh]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_19E]
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		lea	ax, [bp+var_19E]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	0

loc_93381:
		lea	ax, [bp+var_19E]
		push	ax

loc_93386:
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4

loc_9338E:
		mov	[bp+var_2], 0

loc_93393:
		push	large 0C7013Fh
		push	large 0

loc_9339C:
		lea	ax, [bp+var_E8]

loc_933A0:
		push	ax

loc_933A1:
		call	VROOMM_StubThunk_6C969
		add	sp, 0Ah
		cmp	[bp+var_B3], 0
		jnz	short loc_933B7
		mov	[bp+var_99], 0
		jmp	short $+2

loc_933B7:				; CODE XREF: ResourceFile_LoadTypeE_93295+119j
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_4], ax
		mov	ax, si
		add	ax, 71h	; 'q'
		mov	[bp+var_6], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax

loc_933D5:
		jz	short loc_9344F
		push	large 0B006Fh
		push	large 3E002Dh
		push	ax

loc_933E4:
		call	VROOMM_StubThunk_6C76C

loc_933E9:
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh

loc_933F1:
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0

loc_93401:
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_4]

loc_9340C:
		mov	eax, [bx]
		mov	[bp+var_A], eax

loc_93413:
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
		mov	word ptr [di+2Ah], 2
		mov	word ptr [di+2Ch], 3
		mov	ax, [bp+var_6]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_93451
; ���������������������������������������������������������������������������

loc_9344F:				; CODE XREF: ResourceFile_LoadTypeE_93295:loc_933D5j
		mov	ax, di

loc_93451:				; CODE XREF: ResourceFile_LoadTypeE_93295+1B8j
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_E], ax
		mov	ax, si
		add	ax, 72h	; 'r'
		mov	[bp+var_10], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_934F7
		push	large 0B006Fh
		push	large 4B002Dh
		push	ax

loc_9348C:
		call	VROOMM_StubThunk_6C76C

loc_93491:
		add	sp, 0Ah

loc_93494:
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0

loc_934A1:
		mov	byte ptr [di+24h], 2

loc_934A5:
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_E]
		mov	eax, [bx]
		mov	[bp+var_14], eax
		mov	al, [bx+4]
		mov	[bp+var_15], al
		mov	eax, [bp+var_14]
		mov	[di+20h], eax
		mov	al, [bp+var_15]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0

loc_934D3:
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]

loc_934DF:
		mov	[di+26h], eax

loc_934E3:
		mov	word ptr [di+2Ah], 4
		mov	word ptr [di+2Ch], 5
		mov	ax, [bp+var_10]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_934F9
; ���������������������������������������������������������������������������

loc_934F7:				; CODE XREF: ResourceFile_LoadTypeE_93295+1E8j
		mov	ax, di

loc_934F9:				; CODE XREF: ResourceFile_LoadTypeE_93295+260j
		push	ax
		lea	ax, [bp+var_E8]
		push	ax

loc_934FF:
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_18], ax
		mov	ax, si

loc_93513:
		add	ax, 73h	; 's'
		mov	[bp+var_1A], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9359F
		push	large 0B006Fh
		push	large 58002Dh
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_18]
		mov	eax, [bx]
		mov	[bp+var_1E], eax
		mov	al, [bx+4]
		mov	[bp+var_1F], al
		mov	eax, [bp+var_1E]
		mov	[di+20h], eax
		mov	al, [bp+var_1F]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]

loc_93587:
		mov	[di+26h], eax

loc_9358B:
		mov	word ptr [di+2Ah], 6

loc_93590:
		mov	word ptr [di+2Ch], 7
		mov	ax, [bp+var_1A]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_935A1
; ���������������������������������������������������������������������������

loc_9359F:				; CODE XREF: ResourceFile_LoadTypeE_93295+290j
		mov	ax, di

loc_935A1:				; CODE XREF: ResourceFile_LoadTypeE_93295+308j
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6

loc_935AF:
		push	0
		mov	ax, si

loc_935B3:
		add	ax, 1Eh

loc_935B6:
		mov	[bp+var_22], ax
		mov	ax, si
		add	ax, 74h	; 't'
		mov	[bp+var_24], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_93647
		push	large 0B006Fh
		push	large 4B00A2h
		push	ax
		call	VROOMM_StubThunk_6C76C

loc_935E1:
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0

loc_93601:
		mov	bx, [bp+var_22]
		mov	eax, [bx]

loc_93607:
		mov	[bp+var_28], eax

loc_9360B:
		mov	al, [bx+4]
		mov	[bp+var_29], al

loc_93611:
		mov	eax, [bp+var_28]
		mov	[di+20h], eax
		mov	al, [bp+var_29]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 0Eh
		mov	word ptr [di+2Ch], 0Fh
		mov	ax, [bp+var_24]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_93649
; ���������������������������������������������������������������������������

loc_93647:				; CODE XREF: ResourceFile_LoadTypeE_93295+338j
		mov	ax, di

loc_93649:				; CODE XREF: ResourceFile_LoadTypeE_93295+3B0j
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_2C], ax
		mov	ax, si
		add	ax, 75h	; 'u'
		mov	[bp+var_2E], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_936EF
		push	large 0B006Fh

loc_9367D:
		push	large 3E00A2h

loc_93683:
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah

loc_9368C:
		mov	word ptr [di+0Eh], 147Fh

loc_93691:
		mov	dword ptr [di+20h], 0

loc_93699:
		mov	byte ptr [di+24h], 2

loc_9369D:
		mov	byte ptr [di+25h], 0

loc_936A1:
		mov	dword ptr [di+26h], 0

loc_936A9:
		mov	bx, [bp+var_2C]

loc_936AC:
		mov	eax, [bx]

loc_936AF:
		mov	[bp+var_32], eax
		mov	al, [bx+4]
		mov	[bp+var_33], al
		mov	eax, [bp+var_32]
		mov	[di+20h], eax
		mov	al, [bp+var_33]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 0Ch

loc_936E0:
		mov	word ptr [di+2Ch], 0Dh
		mov	ax, [bp+var_2E]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_936F1
; ���������������������������������������������������������������������������

loc_936EF:				; CODE XREF: ResourceFile_LoadTypeE_93295+3E0j
		mov	ax, di

loc_936F1:				; CODE XREF: ResourceFile_LoadTypeE_93295+458j
		push	ax

loc_936F2:
		lea	ax, [bp+var_E8]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si

loc_93703:
		add	ax, 1Eh
		mov	[bp+var_36], ax
		mov	ax, si
		add	ax, 6Ah	; 'j'
		mov	[bp+var_38], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_93797
		push	large 0B006Fh
		push	large 72002Dh
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
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
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 0Ah
		mov	word ptr [di+2Ch], 0Bh
		mov	ax, [bp+var_38]

loc_93790:
		mov	[di+1Eh], ax

loc_93793:
		mov	ax, di
		jmp	short loc_93799
; ���������������������������������������������������������������������������

loc_93797:				; CODE XREF: ResourceFile_LoadTypeE_93295+488j
		mov	ax, di

loc_93799:				; CODE XREF: ResourceFile_LoadTypeE_93295+500j
		push	ax
		lea	ax, [bp+var_E8]
		push	ax

loc_9379F:
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si

loc_937AB:
		add	ax, 1Eh

loc_937AE:
		mov	[bp+var_40], ax
		mov	ax, si

loc_937B3:
		add	ax, 6Eh	; 'n'
		mov	[bp+var_42], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9383F
		push	large 0B006Fh
		push	large 7200A2h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh

loc_937E1:
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2

loc_937ED:
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_40]
		mov	eax, [bx]
		mov	[bp+var_46], eax

loc_93803:
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
		mov	word ptr [di+2Ah], 14h
		mov	word ptr [di+2Ch], 15h
		mov	ax, [bp+var_42]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_93841
; ���������������������������������������������������������������������������

loc_9383F:				; CODE XREF: ResourceFile_LoadTypeE_93295+530j
		mov	ax, di

loc_93841:				; CODE XREF: ResourceFile_LoadTypeE_93295+5A8j
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_4A], ax
		mov	ax, si
		add	ax, 6Dh	; 'm'
		mov	[bp+var_4C], ax
		push	2Eh ; '.'

loc_93863:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax

loc_9386B:
		or	ax, ax

loc_9386D:
		jz	short loc_938E7

loc_9386F:
		push	large 0B006Fh

loc_93875:
		push	large 65002Dh
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0

loc_93891:
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0

loc_938A1:
		mov	bx, [bp+var_4A]

loc_938A4:
		mov	eax, [bx]
		mov	[bp+var_50], eax
		mov	al, [bx+4]
		mov	[bp+var_51], al

loc_938B1:
		mov	eax, [bp+var_50]
		mov	[di+20h], eax
		mov	al, [bp+var_51]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 8
		mov	word ptr [di+2Ch], 9
		mov	ax, [bp+var_4C]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_938E9
; ���������������������������������������������������������������������������

loc_938E7:				; CODE XREF: ResourceFile_LoadTypeE_93295:loc_9386Dj
		mov	ax, di

loc_938E9:				; CODE XREF: ResourceFile_LoadTypeE_93295+650j
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_54], ax

loc_93901:
		mov	ax, si

loc_93903:
		add	ax, 6Bh	; 'k'

loc_93906:
		mov	[bp+var_56], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9398F
		push	large 0B006Fh
		push	large 6500A2h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_54]
		mov	eax, [bx]
		mov	[bp+var_5A], eax
		mov	al, [bx+4]
		mov	[bp+var_5B], al
		mov	eax, [bp+var_5A]
		mov	[di+20h], eax
		mov	al, [bp+var_5B]
		mov	[di+24h], al

loc_93967:
		mov	byte ptr [di+25h], 0

loc_9396B:
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 12h

loc_93980:
		mov	word ptr [di+2Ch], 13h

loc_93985:
		mov	ax, [bp+var_56]

loc_93988:
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_93991
; ���������������������������������������������������������������������������

loc_9398F:				; CODE XREF: ResourceFile_LoadTypeE_93295+680j
		mov	ax, di

loc_93991:				; CODE XREF: ResourceFile_LoadTypeE_93295+6F8j
		push	ax

loc_93992:
		lea	ax, [bp+var_E8]

loc_93996:
		push	ax

loc_93997:
		call	VROOMM_StubThunk_6C95A

loc_9399C:
		add	sp, 6
		push	0
		mov	ax, si

loc_939A3:
		add	ax, 1Eh
		mov	[bp+var_5E], ax
		mov	ax, si
		add	ax, 6Ch	; 'l'
		mov	[bp+var_60], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_93A37
		push	large 0B006Fh
		push	large 5800A2h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_5E]
		mov	eax, [bx]
		mov	[bp+var_64], eax
		mov	al, [bx+4]
		mov	[bp+var_65], al
		mov	eax, [bp+var_64]
		mov	[di+20h], eax
		mov	al, [bp+var_65]
		mov	[di+24h], al

loc_93A0F:
		mov	byte ptr [di+25h], 0

loc_93A13:
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 10h
		mov	word ptr [di+2Ch], 11h
		mov	ax, [bp+var_60]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_93A39
; ���������������������������������������������������������������������������

loc_93A37:				; CODE XREF: ResourceFile_LoadTypeE_93295+728j
		mov	ax, di

loc_93A39:				; CODE XREF: ResourceFile_LoadTypeE_93295+7A0j
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 1Eh
		mov	[bp+var_68], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_93A62
		jmp	loc_93AE9
; ���������������������������������������������������������������������������

loc_93A62:				; CODE XREF: ResourceFile_LoadTypeE_93295+7C8j
		push	large 0B003Bh

loc_93A68:
		push	large 8E0081h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h

loc_93A7C:
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_68]
		mov	eax, [bx]
		mov	[bp+var_6C], eax
		mov	al, [bx+4]

loc_93AA1:
		mov	[bp+var_6D], al

loc_93AA4:
		mov	eax, [bp+var_6C]

loc_93AA8:
		mov	[di+1Eh], eax
		mov	al, [bp+var_6D]

loc_93AAF:
		mov	[di+22h], al

loc_93AB2:
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 16h
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah

loc_93AE0:
		mov	word ptr [di+2Eh], 17h

loc_93AE5:
		mov	ax, di
		jmp	short loc_93AEB
; ���������������������������������������������������������������������������

loc_93AE9:				; CODE XREF: ResourceFile_LoadTypeE_93295+7CAj
		mov	ax, di

loc_93AEB:				; CODE XREF: ResourceFile_LoadTypeE_93295+852j
		push	ax
		lea	ax, [bp+var_E8]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	[bp+var_C2]
		push	1
		lea	ax, [bp+var_E8]
		push	ax
		call	VROOMM_StubThunk_6C946

loc_93B09:
		add	sp, 6

loc_93B0C:
		lea	di, [bp+var_E8]
		push	1

loc_93B12:
		push	large 10000h
		mov	al, [si+22h]
		push	ax
		push	large dword ptr	[si+1Eh]
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
		jmp	short loc_93B4B
; ���������������������������������������������������������������������������

loc_93B40:				; CODE XREF: ResourceFile_LoadTypeE_93295+8BAj
		push	0
		push	di
		call	VROOMM_StubThunk_6C9B4
		add	sp, 4

loc_93B4B:				; CODE XREF: ResourceFile_LoadTypeE_93295+8A9j
		cmp	[bp+var_2], 0
		jz	short loc_93B40
		push	di
		call	VROOMM_StubThunk_6C9BE
		pop	cx
		cmp	byte ptr [si+23h], 0
		jz	short loc_93B7E
		cmp	dword ptr [si+1Eh], 0
		jz	short loc_93B7E
		push	0
		mov	al, [si+22h]

loc_93B6A:
		push	ax
		mov	ax, si
		add	ax, 1Eh
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_93B7E:				; CODE XREF: ResourceFile_LoadTypeE_93295+8C7j
					; ResourceFile_LoadTypeE_93295+8CEj
		mov	dword ptr [si+1Eh], 0
		mov	byte ptr [si+23h], 0
		mov	dword ptr [si+24h], 0

loc_93B92:
		push	2

loc_93B94:
		lea	ax, [bp+var_E8]
		push	ax
		call	VROOMM_StubThunk_6C978
		add	sp, 4

loc_93BA1:
		pop	di
		pop	si

locret_93BA3:
		leave
		retf
ResourceFile_LoadTypeE_93295	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 650 lignes, NON DÉTAILLÉE — variante de ResourceFile_LoadTypeA_90097.
; ==============================================================================================
ResourceFile_LoadTypeF_93BA5	proc far		; CODE XREF: VROOMM_StubThunk_6B875J

var_16A		= word ptr -16Ah
var_10D		= dword	ptr -10Dh
var_109		= dword	ptr -109h
var_104		= word ptr -104h
var_B4		= word ptr -0B4h
var_8E		= word ptr -8Eh
var_7F		= word ptr -7Fh
var_65		= byte ptr -65h
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_39		= byte ptr -39h
var_38		= dword	ptr -38h
var_34		= word ptr -34h
var_31		= byte ptr -31h
var_30		= dword	ptr -30h
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_23		= byte ptr -23h
var_22		= dword	ptr -22h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_19		= byte ptr -19h
var_18		= dword	ptr -18h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_F		= byte ptr -0Fh
var_E		= dword	ptr -0Eh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	ds
		push	offset a_shp_10	; ".shp"
		push	ds
		push	offset aCamropt	; "camropt"
		push	ds
		push	offset aFonts_0	; "FONTS"
		lea	ax, [bp+var_104]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_16A]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_16A], 2C8h
		mov	[bp+var_109], 100h
		mov	[bp+var_10D], 0

loc_93BED:
		mov	[bp+var_16A], 138Ah

loc_93BF3:
		push	1

loc_93BF5:
		lea	ax, [bp+var_104]
		push	ax
		lea	ax, [bp+var_16A]
		push	ax

loc_93BFF:
		mov	bx, [bp+var_16A]

loc_93C03:
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_16A]

loc_93C0D:
		push	ax

loc_93C0E:
		call	StreamReader_GetCapacity_64062
		push	dx

loc_93C14:
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_46+2],	dx
		mov	word ptr [bp+var_46], ax
		mov	eax, [bp+var_46]
		mov	[si+28h], eax
		mov	byte ptr [si+2Ch], 3
		mov	byte ptr [si+2Dh], 1
		mov	dword ptr [si+2Eh], 0
		mov	eax, [bp+var_42]
		mov	[si+2Eh], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_3E]
		push	0

loc_93C62:
		mov	al, [si+2Ch]
		push	ax

loc_93C66:
		push	large dword ptr	[si+28h]

loc_93C6A:
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832

loc_93C72:
		add	sp, 0Ah
		push	dx

loc_93C76:
		push	ax

loc_93C77:
		lea	ax, [bp+var_16A]
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh

loc_93C84:
		lea	ax, [bp+var_16A]

loc_93C88:
		push	ax
		call	StreamReader_CloseHook_63D6E

loc_93C8E:
		pop	cx
		push	0

loc_93C91:
		lea	ax, [bp+var_16A]

loc_93C95:
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4

loc_93C9E:
		mov	[bp+var_2], 0
		mov	[bp+var_4], 8
		mov	[bp+var_6], 9
		push	0
		push	2

loc_93CB1:
		push	5C44h

loc_93CB4:
		call	Memory_TypedAllocDispatchC_5C86D
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		cmp	eax, 0A000h
		jge	short loc_93CD1
		mov	ax, 0Ah
		mov	[bp+var_6], ax
		mov	[bp+var_4], ax

loc_93CD1:				; CODE XREF: ResourceFile_LoadTypeF_93BA5+121j
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C969
		add	sp, 0Ah

loc_93CE7:
		cmp	[bp+var_7F], 0

loc_93CEB:
		jnz	short loc_93CF3
		mov	[bp+var_65], 0

loc_93CF1:
		jmp	short $+2

loc_93CF3:				; CODE XREF: ResourceFile_LoadTypeF_93BA5:loc_93CEBj
		push	0
		mov	ax, si
		add	ax, 28h	; '('
		mov	[bp+var_8], ax
		mov	ax, si
		add	ax, 78h	; 'x'
		mov	[bp+var_A], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_93D8B

loc_93D13:
		push	large 0B0088h
		push	large 3C00A4h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[bp+var_E], eax
		mov	al, [bx+4]
		mov	[bp+var_F], al
		mov	eax, [bp+var_E]
		mov	[di+20h], eax
		mov	al, [bp+var_F]

loc_93D60:
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0

loc_93D67:
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 4
		mov	word ptr [di+2Ch], 5
		mov	ax, [bp+var_A]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_93D8D
; ���������������������������������������������������������������������������

loc_93D8B:				; CODE XREF: ResourceFile_LoadTypeF_93BA5+16Cj
		mov	ax, di

loc_93D8D:				; CODE XREF: ResourceFile_LoadTypeF_93BA5+1E4j
		push	ax
		lea	ax, [bp+var_B4]
		push	ax

loc_93D93:
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 28h	; '('

loc_93DA2:
		mov	[bp+var_12], ax

loc_93DA5:
		mov	ax, si

loc_93DA7:
		add	ax, 77h	; 'w'
		mov	[bp+var_14], ax

loc_93DAD:
		push	2Eh ; '.'

loc_93DAF:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_93E33
		push	large 0B0088h
		push	large 490016h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2

loc_93DE1:
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0

loc_93DED:
		mov	bx, [bp+var_12]

loc_93DF0:
		mov	eax, [bx]

loc_93DF3:
		mov	[bp+var_18], eax
		mov	al, [bx+4]
		mov	[bp+var_19], al
		mov	eax, [bp+var_18]
		mov	[di+20h], eax
		mov	al, [bp+var_19]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 6
		mov	word ptr [di+2Ch], 7
		mov	ax, [bp+var_14]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_93E35
; ���������������������������������������������������������������������������

loc_93E33:				; CODE XREF: ResourceFile_LoadTypeF_93BA5+214j
		mov	ax, di

loc_93E35:				; CODE XREF: ResourceFile_LoadTypeF_93BA5+28Cj
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 28h	; '('
		mov	[bp+var_1C], ax
		mov	ax, si
		add	ax, 7Ah	; 'z'
		mov	[bp+var_1E], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax

loc_93E61:
		jz	short loc_93EDB
		push	large 0B0088h
		push	large 3C0016h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0

loc_93E8D:
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_1C]
		mov	eax, [bx]
		mov	[bp+var_22], eax
		mov	al, [bx+4]
		mov	[bp+var_23], al
		mov	eax, [bp+var_22]
		mov	[di+20h], eax
		mov	al, [bp+var_23]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	word ptr [di+2Ah], 2
		mov	word ptr [di+2Ch], 3
		mov	ax, [bp+var_1E]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_93EDD
; ���������������������������������������������������������������������������

loc_93EDB:				; CODE XREF: ResourceFile_LoadTypeF_93BA5:loc_93E61j
		mov	ax, di

loc_93EDD:				; CODE XREF: ResourceFile_LoadTypeF_93BA5+334j
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 28h	; '('

loc_93EF2:
		mov	[bp+var_26], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_28], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_2A], ax

loc_93F01:
		mov	ax, si

loc_93F03:
		add	ax, 79h	; 'y'

loc_93F06:
		mov	[bp+var_2C], ax

loc_93F09:
		push	2Eh ; '.'

loc_93F0B:
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax

loc_93F13:
		or	ax, ax
		jz	short loc_93F91
		push	large 0B0088h
		push	large 4900A4h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_26]
		mov	eax, [bx]
		mov	[bp+var_30], eax
		mov	al, [bx+4]
		mov	[bp+var_31], al
		mov	eax, [bp+var_30]
		mov	[di+20h], eax

loc_93F61:
		mov	al, [bp+var_31]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0

loc_93F73:
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	ax, [bp+var_28]
		mov	[di+2Ah], ax
		mov	ax, [bp+var_2A]

loc_93F84:
		mov	[di+2Ch], ax
		mov	ax, [bp+var_2C]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_93F93
; ���������������������������������������������������������������������������

loc_93F91:				; CODE XREF: ResourceFile_LoadTypeF_93BA5+370j
		mov	ax, di

loc_93F93:				; CODE XREF: ResourceFile_LoadTypeF_93BA5+3EAj
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	large 0
		push	large 10000Fh
		push	large 0B0042h

loc_93FB0:
		push	large 90h ; '�'
		push	large 0Eh
		push	large 0D000Bh
		push	large 420000h
		push	large 480000h
		push	large 0C000Bh
		push	large 0B0042h
		push	large 0
		push	3
		mov	ax, si
		add	ax, 5Eh	; '^'
		push	ax
		mov	ax, si
		add	ax, 28h	; '('
		push	ax
		push	large 0B00D2h
		push	large 660035h
		push	0
		call	VROOMM_StubThunk_6C9F0
		add	sp, 3Ah
		push	ax

loc_93FFF:
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 28h	; '('
		mov	[bp+var_34], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_94027
		jmp	loc_940AE
; ���������������������������������������������������������������������������

loc_94027:				; CODE XREF: ResourceFile_LoadTypeF_93BA5+47Dj
		push	large 0B003Bh
		push	large 7C0081h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_34]
		mov	eax, [bx]
		mov	[bp+var_38], eax

loc_94063:
		mov	al, [bx+4]

loc_94066:
		mov	[bp+var_39], al
		mov	eax, [bp+var_38]

loc_9406D:
		mov	[di+1Eh], eax
		mov	al, [bp+var_39]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0

loc_94083:
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 11h
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah

loc_940A5:
		mov	word ptr [di+2Eh], 12h
		mov	ax, di
		jmp	short loc_940B0
; ���������������������������������������������������������������������������

loc_940AE:				; CODE XREF: ResourceFile_LoadTypeF_93BA5+47Fj
		mov	ax, di

loc_940B0:				; CODE XREF: ResourceFile_LoadTypeF_93BA5+507j
		push	ax
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	[bp+var_8E]
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C946
		add	sp, 6
		lea	di, [bp+var_B4]
		push	1
		push	large 10000h
		mov	al, [si+2Ch]
		push	ax

loc_940E1:
		push	large dword ptr	[si+28h]

loc_940E5:
		push	5C44h

loc_940E8:
		call	Memory_TypedAllocDispatchB_5C832

loc_940ED:
		add	sp, 0Ah
		push	dx
		push	ax
		push	di
		push	si

loc_940F4:
		call	VROOMM_StubThunk_6B785
		add	sp, 0Ch
		push	di

loc_940FD:
		call	VROOMM_StubThunk_6C996
		pop	cx
		jmp	short loc_94110
; ���������������������������������������������������������������������������

loc_94105:				; CODE XREF: ResourceFile_LoadTypeF_93BA5:loc_94114j
		push	0
		push	di
		call	VROOMM_StubThunk_6C9B4
		add	sp, 4

loc_94110:				; CODE XREF: ResourceFile_LoadTypeF_93BA5+55Ej
		cmp	[bp+var_2], 0

loc_94114:
		jz	short loc_94105
		push	di
		call	VROOMM_StubThunk_6C9BE
		pop	cx
		cmp	byte ptr [si+2Dh], 0
		jz	short loc_94143
		cmp	dword ptr [si+28h], 0
		jz	short loc_94143
		push	0
		mov	al, [si+2Ch]
		push	ax
		mov	ax, si
		add	ax, 28h	; '('
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8
		jmp	short $+2

loc_94143:				; CODE XREF: ResourceFile_LoadTypeF_93BA5+57Cj
					; ResourceFile_LoadTypeF_93BA5+583j
		mov	dword ptr [si+28h], 0
		mov	byte ptr [si+2Dh], 0
		mov	dword ptr [si+2Eh], 0
		push	2
		lea	ax, [bp+var_B4]
		push	ax
		call	VROOMM_StubThunk_6C978
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
ResourceFile_LoadTypeF_93BA5	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⭐⚠️ far, 580 lignes, NON DÉTAILLÉE — variante de ResourceFile_LoadTypeA_90097.
; ==============================================================================================
ResourceFile_LoadTypeG_9416A	proc far		; CODE XREF: VROOMM_StubThunk_6B87AJ

var_17E		= word ptr -17Eh
var_121		= dword	ptr -121h
var_11D		= dword	ptr -11Dh
var_118		= word ptr -118h
var_C8		= word ptr -0C8h
var_A2		= word ptr -0A2h
var_93		= word ptr -93h
var_79		= byte ptr -79h
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4D		= byte ptr -4Dh
var_4C		= dword	ptr -4Ch
var_48		= word ptr -48h
var_45		= byte ptr -45h
var_44		= dword	ptr -44h
var_40		= word ptr -40h
var_3E		= word ptr -3Eh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_37		= byte ptr -37h
var_36		= dword	ptr -36h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_29		= byte ptr -29h
var_28		= dword	ptr -28h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1B		= byte ptr -1Bh
var_1A		= dword	ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 17Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	ds
		push	offset a_shp_11	; ".shp"
		push	ds
		push	offset aAudiopt	; "audiopt"
		push	ds
		push	offset aFonts_0	; "FONTS"
		lea	ax, [bp+var_118]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_17E]
		push	ax
		call	StreamReader_ConstructVariantA_63A39
		pop	cx
		mov	[bp+var_17E], 2C8h

loc_941A0:
		mov	[bp+var_11D], 100h
		mov	[bp+var_121], 0
		mov	[bp+var_17E], 138Ah
		push	1
		lea	ax, [bp+var_118]
		push	ax
		lea	ax, [bp+var_17E]
		push	ax
		mov	bx, [bp+var_17E]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_17E]
		push	ax
		call	StreamReader_GetCapacity_64062
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_52], eax

loc_941E1:
		mov	[bp+var_56], eax
		push	1
		push	0
		push	3
		push	eax
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_5A+2],	dx
		mov	word ptr [bp+var_5A], ax
		mov	eax, [bp+var_5A]

loc_94202:
		mov	[si+3Ch], eax

loc_94206:
		mov	byte ptr [si+40h], 3
		mov	byte ptr [si+41h], 1

loc_9420E:
		mov	dword ptr [si+42h], 0
		mov	eax, [bp+var_56]
		mov	[si+42h], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_52]
		push	0
		mov	al, [si+40h]
		push	ax
		push	large dword ptr	[si+3Ch]
		push	5C44h
		call	Memory_TypedAllocDispatchB_5C832
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_17E]
		push	ax
		call	StreamReader_ReadTyped_63FA1
		add	sp, 0Eh
		lea	ax, [bp+var_17E]
		push	ax
		call	StreamReader_CloseHook_63D6E
		pop	cx
		push	0
		lea	ax, [bp+var_17E]
		push	ax
		call	StreamReader_ReleaseBuffer_65643
		add	sp, 4
		mov	[bp+var_2], 0
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_C8]
		push	ax
		call	VROOMM_StubThunk_6C969
		add	sp, 0Ah
		cmp	[bp+var_93], 0
		jnz	short loc_9428B
		mov	[bp+var_79], 0
		jmp	short $+2

loc_9428B:				; CODE XREF: ResourceFile_LoadTypeG_9416A+119j
		mov	dx, 2
		mov	bx, 3
		mov	[bp+var_4], 5
		mov	[bp+var_6], 6
		mov	[bp+var_8], 8
		mov	[bp+var_A], 9
		mov	[bp+var_C], 0Bh
		mov	[bp+var_E], 0Ch
		cmp	byte_70996, 0
		jnz	short loc_942C4
		mov	bx, 4
		mov	dx, bx
		mov	ax, 0Ah
		mov	[bp+var_A], ax
		mov	[bp+var_8], ax

loc_942C4:				; CODE XREF: ResourceFile_LoadTypeG_9416A+14Aj
		cmp	word_70999, 0
		jnz	short loc_942DD
		mov	ax, 7
		mov	[bp+var_6], ax
		mov	[bp+var_4], ax
		mov	ax, 0Dh
		mov	[bp+var_E], ax
		mov	[bp+var_C], ax

loc_942DD:				; CODE XREF: ResourceFile_LoadTypeG_9416A+15Fj
		push	0
		mov	ax, si

loc_942E1:
		add	ax, 3Ch	; '<'
		mov	[bp+var_10], ax
		mov	[bp+var_12], dx
		mov	[bp+var_14], bx
		mov	ax, si
		add	ax, 7Bh	; '{'

loc_942F2:
		mov	[bp+var_16], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9437D
		push	large 0B0048h
		push	large 3F0058h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_10]
		mov	eax, [bx]
		mov	[bp+var_1A], eax
		mov	al, [bx+4]
		mov	[bp+var_1B], al
		mov	eax, [bp+var_1A]
		mov	[di+20h], eax
		mov	al, [bp+var_1B]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0

loc_9435F:
		mov	eax, [bx+6]

loc_94363:
		mov	[di+26h], eax
		mov	ax, [bp+var_12]
		mov	[di+2Ah], ax
		mov	ax, [bp+var_14]
		mov	[di+2Ch], ax
		mov	ax, [bp+var_16]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_9437F
; ���������������������������������������������������������������������������

loc_9437D:				; CODE XREF: ResourceFile_LoadTypeG_9416A+197j
		mov	ax, di

loc_9437F:				; CODE XREF: ResourceFile_LoadTypeG_9416A+211j
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 3Ch	; '<'
		mov	[bp+var_1E], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_20], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_22], ax
		mov	ax, si
		add	ax, 7Ch	; '|'
		mov	[bp+var_24], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_94433
		push	large 0B0048h
		push	large 4C0058h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0

loc_943E3:
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_1E]

loc_943EE:
		mov	eax, [bx]

loc_943F1:
		mov	[bp+var_28], eax
		mov	al, [bx+4]
		mov	[bp+var_29], al
		mov	eax, [bp+var_28]
		mov	[di+20h], eax
		mov	al, [bp+var_29]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0

loc_9440D:
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	ax, [bp+var_20]
		mov	[di+2Ah], ax
		mov	ax, [bp+var_22]
		mov	[di+2Ch], ax
		mov	ax, [bp+var_24]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_94435
; ���������������������������������������������������������������������������

loc_94433:				; CODE XREF: ResourceFile_LoadTypeG_9416A+24Dj
		mov	ax, di

loc_94435:				; CODE XREF: ResourceFile_LoadTypeG_9416A+2C7j
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 3Ch	; '<'
		mov	[bp+var_2C], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_2E], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_30], ax
		mov	ax, si
		add	ax, 7Dh	; '}'
		mov	[bp+var_32], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_944E9

loc_9446F:
		push	large 0B0048h

loc_94475:
		push	large 3F00A5h
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
		mov	[bp+var_36], eax
		mov	al, [bx+4]
		mov	[bp+var_37], al
		mov	eax, [bp+var_36]
		mov	[di+20h], eax
		mov	al, [bp+var_37]
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	ax, [bp+var_2E]
		mov	[di+2Ah], ax
		mov	ax, [bp+var_30]
		mov	[di+2Ch], ax
		mov	ax, [bp+var_32]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_944EB
; ���������������������������������������������������������������������������

loc_944E9:				; CODE XREF: ResourceFile_LoadTypeG_9416A+303j
		mov	ax, di

loc_944EB:				; CODE XREF: ResourceFile_LoadTypeG_9416A+37Dj
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 3Ch	; '<'
		mov	[bp+var_3A], ax

loc_94503:
		mov	ax, [bp+var_C]
		mov	[bp+var_3C], ax
		mov	ax, [bp+var_E]
		mov	[bp+var_3E], ax
		mov	ax, si
		add	ax, 7Eh	; '~'
		mov	[bp+var_40], ax
		push	2Eh ; '.'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9459F
		push	large 0B0048h
		push	large 4C00A5h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 147Fh
		mov	dword ptr [di+20h], 0
		mov	byte ptr [di+24h], 2
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	bx, [bp+var_3A]
		mov	eax, [bx]
		mov	[bp+var_44], eax
		mov	al, [bx+4]
		mov	[bp+var_45], al

loc_94567:
		mov	eax, [bp+var_44]

loc_9456B:
		mov	[di+20h], eax
		mov	al, [bp+var_45]

loc_94572:
		mov	[di+24h], al
		mov	byte ptr [di+25h], 0
		mov	dword ptr [di+26h], 0
		mov	eax, [bx+6]
		mov	[di+26h], eax
		mov	ax, [bp+var_3C]
		mov	[di+2Ah], ax
		mov	ax, [bp+var_3E]
		mov	[di+2Ch], ax
		mov	ax, [bp+var_40]
		mov	[di+1Eh], ax
		mov	ax, di
		jmp	short loc_945A1
; ���������������������������������������������������������������������������

loc_9459F:				; CODE XREF: ResourceFile_LoadTypeG_9416A+3B9j
		mov	ax, di

loc_945A1:				; CODE XREF: ResourceFile_LoadTypeG_9416A+433j
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6
		push	0
		mov	ax, si
		add	ax, 3Ch	; '<'
		mov	[bp+var_48], ax
		push	30h ; '0'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_945CA
		jmp	loc_94651
; ���������������������������������������������������������������������������

loc_945CA:				; CODE XREF: ResourceFile_LoadTypeG_9416A+45Bj
		push	large 0B003Bh
		push	large 650081h
		push	ax
		call	VROOMM_StubThunk_6C76C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 12E2h
		mov	dword ptr [di+1Eh], 0
		mov	byte ptr [di+22h], 2

loc_945F0:
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	bx, [bp+var_48]
		mov	eax, [bx]

loc_94602:
		mov	[bp+var_4C], eax
		mov	al, [bx+4]
		mov	[bp+var_4D], al
		mov	eax, [bp+var_4C]
		mov	[di+1Eh], eax
		mov	al, [bp+var_4D]
		mov	[di+22h], al
		mov	byte ptr [di+23h], 0
		mov	dword ptr [di+24h], 0
		mov	eax, [bx+6]
		mov	[di+24h], eax
		mov	word ptr [di+28h], 0Eh
		mov	word ptr [di+0Eh], 1316h
		lea	ax, [bp+var_2]
		mov	[di+2Ah], ax
		mov	word ptr [di+2Ch], 1
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di+2Eh], 0Fh
		mov	ax, di
		jmp	short loc_94653
; ���������������������������������������������������������������������������

loc_94651:				; CODE XREF: ResourceFile_LoadTypeG_9416A+45Dj
		mov	ax, di

loc_94653:				; CODE XREF: ResourceFile_LoadTypeG_9416A+4E5j
		push	ax
		lea	ax, [bp+var_C8]
		push	ax
		call	VROOMM_StubThunk_6C95A
		add	sp, 6

loc_94661:
		push	[bp+var_A2]
		push	1
		lea	ax, [bp+var_C8]
		push	ax

loc_9466C:
		call	VROOMM_StubThunk_6C946
		add	sp, 6

loc_94674:
		lea	di, [bp+var_C8]
		push	1
		push	large 10000h
		mov	al, [si+40h]
		push	ax
		push	large dword ptr	[si+3Ch]
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
		jmp	short loc_946B3
; ���������������������������������������������������������������������������

loc_946A8:				; CODE XREF: ResourceFile_LoadTypeG_9416A+54Dj
		push	0
		push	di
		call	VROOMM_StubThunk_6C9B4
		add	sp, 4

loc_946B3:				; CODE XREF: ResourceFile_LoadTypeG_9416A+53Cj
		cmp	[bp+var_2], 0
		jz	short loc_946A8
		push	di
		call	VROOMM_StubThunk_6C9BE
		pop	cx
		cmp	byte ptr [si+41h], 0
		jz	short loc_946E6
		cmp	dword ptr [si+3Ch], 0
		jz	short loc_946E6
		push	0
		mov	al, [si+40h]
		push	ax
		mov	ax, si
		add	ax, 3Ch	; '<'
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_946E4:
		jmp	short $+2

loc_946E6:				; CODE XREF: ResourceFile_LoadTypeG_9416A+55Aj
					; ResourceFile_LoadTypeG_9416A+561j
		mov	dword ptr [si+3Ch], 0
		mov	byte ptr [si+41h], 0
		mov	dword ptr [si+42h], 0
		push	2
		lea	ax, [bp+var_C8]
		push	ax
		call	VROOMM_StubThunk_6C978
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
ResourceFile_LoadTypeG_9416A	endp

ovr269		ends
