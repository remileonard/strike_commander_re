seg001		segment	byte public 'CODE' use16
		assume cs:seg001
		;org 3
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_30D3	proc far		; CODE XREF: sub_75AF+87P
					; sub_1A1CC+12CP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	si, 150Bh
		jnz	short loc_30FC
		call	PagedResourceC_RefreshAllInstances_2FD55
		push	13Dh
		call	CRT_Msg_NullPtrAssign
		add	sp, 2
		push	1
		call	CRT_Exit
		add	sp, 2
		jmp	short loc_3108
; ���������������������������������������������������������������������������

loc_30FC:				; CODE XREF: sub_30D3+Bj
		push	si
		push	4035h
		nop
		push	cs
		call	near ptr Fatal_Error_310B
		add	sp, 4

loc_3108:				; CODE XREF: sub_30D3+27j
		pop	si
		pop	bp
		retf
sub_30D3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-10-22. Affiche un message d'erreur (CRT_Msg_Sprintf2) et quitte le programme
; (CRT_Exit).
; ==============================================================================================
Fatal_Error_310B	proc far		; CODE XREF: sub_30D3+2Fp Gameflow_RunScriptPairs_36CF+80P ...

var_102		= word ptr -102h
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 102h
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_47080, 0
		jz	short loc_3120
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

loc_3120:				; CODE XREF: Fatal_Error_310B+10j
		mov	byte_47080, 1
		lea	ax, [bp+var_102]
		cmp	ax, si
		jz	short loc_3144
		lea	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		push	[bp+var_2]
		push	si
		lea	ax, [bp+var_102]
		push	ax
		call	CRT_Msg_Sprintf2
		add	sp, 6

loc_3144:				; CODE XREF: Fatal_Error_310B+20j
		call	PagedResourceC_RefreshAllInstances_2FD55
		lea	ax, [bp+var_102]
		push	ax
		push	167h
		call	CRT_Msg_NullPtrAssign
		add	sp, 4
		push	1
		call	CRT_Exit
		add	sp, 2
		pop	si
		leave
		retf
Fatal_Error_310B	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3166	proc far		; CODE XREF: EntryPoint_RuntimeInit+158P

var_70		= word ptr -70h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
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
		sub	sp, 70h
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aSmFont	; "sm-font"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_70]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		lea	ax, [bp+var_70]
		push	ax
		push	[bp+arg_2]
		push	di
		push	5DFEh
		call	sub_4226F
		add	sp, 8
		push	0
		push	large 40h ; '@'
		push	ds
		push	offset unk_43020
		push	6640h
		call	FontStyle_ApplyVariantB_2F661
		add	sp, 0Ch
		cmp	word_4313C, 200h
		ja	short loc_31D0
		push	0
		push	large 1000h
		push	0
		push	0
		push	6640h
		call	FontStyle_ApplyVariantB_2F661
		add	sp, 0Ch
		jmp	short loc_31F1
; ���������������������������������������������������������������������������

loc_31D0:				; CODE XREF: sub_3166+4Fj
		push	0
		mov	ax, word_4313C
		sub	ax, 200h
		movzx	eax, ax
		shl	eax, 4
		push	eax
		push	0
		push	0
		push	6640h
		call	FontStyle_ApplyVariantB_2F661
		add	sp, 0Ch

loc_31F1:				; CODE XREF: sub_3166+68j
		mov	ax, ds
		sub	ax, word_4313C
		sub	ax, 300h
		movzx	eax, ax
		shl	eax, 4
		mov	[bp+var_20], eax
		push	1
		push	large [bp+var_20]
		push	word_4313C
		push	200h
		push	6640h
		call	FontStyle_ApplyVariantB_2F661
		add	sp, 0Ch
		mov	byte_495FC, 0
		mov	word_48A24, 13Fh
		mov	word_48A26, 63h	; 'c'
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aOptfont	; "optfont"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_70]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_E+2], dx
		mov	word ptr [bp+var_E], ax
		mov	eax, [bp+var_E]
		mov	[bp+var_A], eax
		mov	[bp+var_6], 2
		mov	[bp+var_5], 1
		mov	[bp+var_4], 0
		lea	ax, [bp+var_A]
		push	ax
		push	0
		call	GlyphObject_ConstructWithBuffer_311CF
		add	sp, 4
		mov	si, ax
		mov	word ptr [si+10h], 0
		mov	word ptr [si+12h], 0
		push	2Dh ; '-'
		push	si
		mov	bx, [si]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[si+14h], ax
		push	ds
		push	offset a_shp	; ".shp"
		push	ds
		push	offset aConvfont ; "convfont"
		push	ds
		push	offset a____DataFonts ;	"..\\..\\data\\fonts\\"
		lea	ax, [bp+var_70]
		push	ax
		call	Path_Build_C82C
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_70]
		push	ax
		call	TextRenderer_LoadResourceFile_3DA1F
		add	sp, 4
		mov	word ptr [bp+var_1C+2],	dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[bp+var_18], eax
		mov	[bp+var_14], 2
		mov	[bp+var_13], 1
		mov	[bp+var_12], 0
		lea	ax, [bp+var_18]
		push	ax
		push	5A0Ah
		call	GlyphObject_ComputeMetrics_3111E
		add	sp, 4
		push	0
		push	[bp+arg_2]
		push	di
		push	si
		push	5A21h
		call	sub_41F24
		add	sp, 0Ah
		push	5A21h
		call	Gameflow_MainLoop_3D2E
		add	sp, 2
		mov	al, byte_48E43
		mov	byte_48E42, al
		mov	byte_46853, 0
		call	Keyboard_DrainBufferBIOS_3FA5E
		push	0
		call	PagedResourceC_RefreshAndFinalize_2FD7D
		add	sp, 2
		cmp	[bp+var_13], 0
		jz	short loc_3349
		cmp	[bp+var_18], 0
		jz	short loc_3349
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_3349:				; CODE XREF: sub_3166+1C3j
					; sub_3166+1CAj
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		cmp	[bp+var_5], 0
		jz	short loc_3381
		cmp	[bp+var_A], 0
		jz	short loc_3381
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		push	661Ah
		call	Memory_TypedFree_2B8A4
		add	sp, 8
		jmp	short $+2

loc_3381:				; CODE XREF: sub_3166+1FBj
					; sub_3166+202j
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf
sub_3166	endp

; ���������������������������������������������������������������������������

loc_3399:				; DATA XREF: dseg:58C8o
		push	bp
		mov	bp, sp
		push	5A0Ah
		call	GlyphObject_AllocateBuffer_31191
		add	sp, 2
		mov	word_48A41, 2BDh
		xor	ax, ax
		mov	word_48A45, ax
		mov	word_48A43, ax
		mov	word_48A41, 2C1h
		push	5B10h
		call	sub_C7A3
		add	sp, 2
		push	seg seg001
		push	offset loc_343E
		push	1
		push	4
		push	2
		push	5C94h
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg seg001
		push	offset loc_3468
		push	1
		push	8
		push	1Ah
		push	5CACh
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	byte_48D9C, 0
		mov	byte_48D9D, 0
		mov	byte_48DB1, 0
		mov	byte_48DC5, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_340A:				; DATA XREF: dseg:5994o
		push	bp
		mov	bp, sp
		mov	word_48A41, 2C1h
		push	5A21h
		call	sub_358C
		add	sp, 2
		mov	word_48A41, 2BDh
		push	5A21h
		call	sub_2FEE0
		add	sp, 2
		push	2
		push	5A0Ah
		call	GlyphObject_ScalarDeletingDtorA_313D6
		add	sp, 4
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_343E:				; DATA XREF: seg001:02F9o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_3459
		push	2
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_3460

loc_3459:				; CODE XREF: seg001:0377j
		mov	byte ptr [si+1], 0
		mov	byte ptr [si], 0FFh

loc_3460:				; CODE XREF: seg001:0387j
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_3468:				; DATA XREF: seg001:0310o
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		or	si, si
		jnz	short loc_3483
		push	1Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short $+2

loc_3483:				; CODE XREF: seg001:03A1j
		mov	ax, si
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_348B:				; DATA XREF: dseg:02BDo
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_34B6
		mov	word ptr [si], 2BDh
		push	si
		call	sub_2FEE0
		add	sp, 2
		test	di, 1
		jz	short loc_34B6
		push	si
		call	sub_308
		add	sp, 2

loc_34B6:				; CODE XREF: seg001:03C8j seg001:03DBj
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_34BA:				; DATA XREF: dseg:02C1o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		or	si, si
		jz	short loc_34F2
		mov	word ptr [si], 2C1h
		push	si
		call	sub_358C
		add	sp, 2
		mov	word ptr [si], 2BDh
		push	si
		call	sub_2FEE0
		add	sp, 2
		test	di, 1
		jz	short loc_34F2
		push	si
		call	sub_308
		add	sp, 2

loc_34F2:				; CODE XREF: seg001:03F7j seg001:0417j
		pop	di
		pop	si
		pop	bp
		retf
seg001		ends
