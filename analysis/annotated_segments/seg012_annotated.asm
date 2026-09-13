seg012		segment	byte public 'CODE' use16
		assume cs:seg012
		;org 9
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,289L — appelée directement depuis start (init programme). Charge la police 'SM-FONT.SHP'
; (dossier FONTS), configure la palette/mode vidéo selon la mémoire disponible (word_6D140 vs
; seuil 0x800h), puis parse les arguments de ligne de commande caractère par caractère (flags
; '+G'/'-G', '+S'/'-S' détectés via sub_E4B) : initialisation programme (vidéo/police) +
; parseur d'arguments de ligne de commande.
; ==============================================================================================
Program_InitVideoFontArgs	proc far		; CODE XREF: EntryPoint_RuntimeInit+158P

var_E6		= word ptr -0E6h
var_CC		= word ptr -0CCh
var_C8		= word ptr -0C8h
var_C2		= word ptr -0C2h
var_BE		= word ptr -0BEh
var_B8		= word ptr -0B8h
var_B6		= dword	ptr -0B6h
var_B2		= word ptr -0B2h
var_AC		= word ptr -0ACh
var_A6		= word ptr -0A6h
var_9E		= word ptr -9Eh
var_7E		= word ptr -7Eh
var_78		= byte ptr -78h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_35		= word ptr -35h
var_13		= dword	ptr -13h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_2		= byte ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp

loc_1427C:				; DATA XREF: seg216:011Eo
		sub	sp, 0E6h
		push	si
		push	di
		mov	di, [bp+arg_2]
		lea	ax, [bp+var_A]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	8
		push	406h
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_2], 0
		mov	[bp+var_B], 0
		push	ds
		push	offset a_shp	; ".SHP"
		push	ds
		push	offset aSmFont	; "SM-FONT"
		push	ds
		push	offset aFonts	; "FONTS"
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_ResolveDataFile
		add	sp, 0Eh
		lea	ax, [bp+var_5E]
		push	ax
		push	di
		push	[bp+arg_0]
		push	51E2h
		call	TextRenderer_Main
		add	sp, 8
		push	0
		push	large 40h ; '@'
		push	ds
		push	offset unk_6D0B0
		push	5C60h
		call	FontStyle_ApplyVariantB_5EDEC
		add	sp, 0Ch
		cmp	word_6D140, 800h
		ja	short loc_142F8
		push	0
		push	large 1000h
		jmp	short loc_1430A
; ���������������������������������������������������������������������������

loc_142F8:				; CODE XREF: Program_InitVideoFontArgs+73j
		push	0
		mov	ax, word_6D140
		sub	ax, 800h
		movzx	eax, ax
		shl	eax, 4
		push	eax

loc_1430A:				; CODE XREF: Program_InitVideoFontArgs+7Dj
		push	large 0
		push	5C60h
		call	FontStyle_ApplyVariantB_5EDEC
		add	sp, 0Ch
		push	0FFFFh
		call	PagedResourceB_Helper_5D859
		pop	cx
		push	0FFh
		call	Registry_LookupForUIScreen_5B6FC
		pop	cx
		cmp	[bp+arg_0], 1
		jle	short loc_143AB
		mov	si, 1
		jmp	short loc_143A6
; ���������������������������������������������������������������������������

loc_14334:				; CODE XREF: Program_InitVideoFontArgs+130j
		mov	bx, si
		shl	bx, 1
		mov	bx, [bx+di]
		mov	al, [bx]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		cmp	ax, 2Bh	; '+'
		jz	short loc_14371
		cmp	ax, 2Dh	; '-'
		jnz	short loc_14389
		mov	bx, si
		shl	bx, 1
		mov	bx, [bx+di]
		mov	al, [bx+1]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		cmp	ax, 47h	; 'G'
		jz	short loc_1436B
		cmp	ax, 53h	; 'S'
		jz	short loc_143A5
		jmp	short loc_143A5
; ���������������������������������������������������������������������������

loc_1436B:				; CODE XREF: Program_InitVideoFontArgs+E9j
		mov	[bp+var_B], 1
		jmp	short loc_143A5
; ���������������������������������������������������������������������������

loc_14371:				; CODE XREF: Program_InitVideoFontArgs+CEj
		mov	bx, si
		shl	bx, 1
		mov	bx, [bx+di]
		mov	al, [bx+1]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		cmp	ax, 53h	; 'S'
		jz	short loc_143A5
		jmp	short loc_143A5
; ���������������������������������������������������������������������������

loc_14389:				; CODE XREF: Program_InitVideoFontArgs+D3j
		mov	bx, si
		shl	bx, 1
		mov	ax, [bx+di]
		mov	[bp+var_E], ax
		push	8
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	[bp+var_2], 0

loc_143A5:				; CODE XREF: Program_InitVideoFontArgs+EEj
					; Program_InitVideoFontArgs+F0j ...
		inc	si

loc_143A6:				; CODE XREF: Program_InitVideoFontArgs+B9j
		cmp	si, [bp+arg_0]
		jl	short loc_14334

loc_143AB:				; CODE XREF: Program_InitVideoFontArgs+B4j
		lea	ax, [bp+var_E6]
		push	ax
		call	String_ConstructEmpty
		pop	cx
		lea	ax, [bp+var_CC]
		push	ax
		call	VROOMM_StubThunk_6CED1
		pop	cx
		lea	ax, [bp+var_C8]
		push	ax
		call	VROOMM_StubThunk_6CEE0
		pop	cx
		lea	ax, [bp+var_C2]
		push	ax
		call	VROOMM_StubThunk_6CEEF
		pop	cx
		lea	ax, [bp+var_BE]
		push	ax
		call	VROOMM_StubThunk_6CEFE
		pop	cx
		mov	[bp+var_B8], 0
		mov	[bp+var_B6], 0
		lea	ax, [bp+var_B2]
		push	ax
		call	VROOMM_StubThunk_6CF30
		pop	cx
		lea	ax, [bp+var_AC]
		push	ax
		call	VROOMM_StubThunk_6CF4E
		pop	cx
		lea	ax, [bp+var_A6]
		push	ax
		call	VROOMM_StubThunk_6CEA9
		pop	cx
		lea	ax, [bp+var_9E]
		push	ax
		call	VROOMM_StubThunk_6CE9A
		pop	cx
		mov	[bp+var_7E], 0
		mov	[bp+var_78], 0
		push	seg seg057
		push	offset String_ConstructEmpty
		push	large 10003h
		push	9
		lea	ax, [bp+var_60]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_35], 0
		mov	[bp+var_13], 0
		lea	ax, [bp+var_E6]
		push	ax
		call	VROOMM_StubThunk_6CE42
		pop	cx
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_14474
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_E6]
		push	ax
		call	VROOMM_StubThunk_6CE47
		add	sp, 4
		jmp	short loc_1447F
; ���������������������������������������������������������������������������

loc_14474:				; CODE XREF: Program_InitVideoFontArgs+1E6j
		lea	ax, [bp+var_E6]
		push	ax
		call	VROOMM_StubThunk_6CE51
		pop	cx

loc_1447F:				; CODE XREF: Program_InitVideoFontArgs+1F9j
		push	5240h
		call	VROOMM_StubThunk_6B7A3
		pop	cx
		lea	ax, [bp+var_E6]
		push	ax
		call	UIScreen_Construct_53896
		pop	cx
		push	2
		lea	ax, [bp+var_E6]
		push	ax
		call	VROOMM_StubThunk_6CE4C
		add	sp, 4
		mov	al, [bp+var_B]
		mov	ah, 0
		or	ax, ax
		jz	short loc_144B2
		cmp	byte_6E345, 0
		jz	short loc_144CE

loc_144B2:				; CODE XREF: Program_InitVideoFontArgs+230j
		mov	byte_709A1, 1
		call	PagedResourceC_RefreshAllInstances_5F4E0
		push	421h
		call	CRT_Msg_NullPtrAssign
		pop	cx
		push	1
		call	CRT_Exit
		jmp	short loc_144E0
; ���������������������������������������������������������������������������

loc_144CE:				; CODE XREF: Program_InitVideoFontArgs+237j
		mov	byte_709A1, 0
		mov	al, byte_722B7
		mov	byte_722B6, al
		push	0
		call	PagedResourceC_RefreshAndFinalize_5F508

loc_144E0:				; CODE XREF: Program_InitVideoFontArgs+253j
		pop	cx
		pop	di
		pop	si
		leave
		retf
Program_InitVideoFontArgs	endp

seg012		ends
