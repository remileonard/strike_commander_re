stub288		segment	para public 'CODE' use16
		assume cs:stub288
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
stru_6BC40	db 0CDh, 3Fh		; int_code ; DATA XREF:	seg216:09BEo
		dw 0			; memswap
		dd 25F30h		; fileoff
		dw 0B18h		; codesize
		dw 0A2h			; relsize
		dw 16			; nentries
		dw seg seg000		; prevstub
		db 10h dup(0)		; workarea

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_98A3E) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BC60	proc far		; DATA XREF: TextureLoader_FormatAndLoad_985F6+1Ao
		jmp	TextureLoader_AllocateC_98A3E
VROOMM_StubThunk_6BC60	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97F40) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BC65	proc far
		jmp	TextureLoader_Allocate_97F40
VROOMM_StubThunk_6BC65	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_97FA3) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BC6A	proc far
		jmp	TextureLoader_AllocateB_97FA3
VROOMM_StubThunk_6BC6A	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_983FB) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BC6F	proc far
		jmp	TextureLoader_LoadMixedFields_983FB
VROOMM_StubThunk_6BC6F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_98784) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BC74	proc far
		jmp	TextureLoader_LoadWithDwordFields_98784
VROOMM_StubThunk_6BC74	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_988BD) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BC79	proc far
		jmp	TextureLoader_LoadWithDwordFieldsB_988BD
VROOMM_StubThunk_6BC79	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_985F6) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BC7E	proc far
		jmp	TextureLoader_FormatAndLoad_985F6
VROOMM_StubThunk_6BC7E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_98670) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BC83	proc far
		jmp	TextureLoader_OpenAndLoadSubrecord_98670
VROOMM_StubThunk_6BC83	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_98956) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BC88	proc far
		jmp	TextureLoader_LoadWithDwordFieldsC_98956
VROOMM_StubThunk_6BC88	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_989B8) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BC8D	proc far
		jmp	TextureLoader_LoadWithDwordFieldsD_989B8
VROOMM_StubThunk_6BC8D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_98527) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BC92	proc far
		jmp	TextureLoader_LoadMixedFieldsB_98527
VROOMM_StubThunk_6BC92	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_98002) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BC97	proc far		; CODE XREF: seg066:loc_2F233P
		jmp	TextureLoader_Helper_98002
VROOMM_StubThunk_6BC97	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_980F0) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BC9C	proc far
		jmp	TextureLoader_SelectMipLevel_980F0
VROOMM_StubThunk_6BC9C	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9800A) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BCA1	proc far		; CODE XREF: Config_LoadAndApplySettings_8EEBC+DAP
					; MissionLoader_LoadWaypoint_A78AD+3DP
		jmp	TextureLoader_OpenAndDecode_9800A
VROOMM_StubThunk_6BCA1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_98151) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BCA6	proc far		; CODE XREF: seg066:0A43P
		jmp	TextureLoader_ReleaseMultiple_98151
VROOMM_StubThunk_6BCA6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: thunk

; ==============================================================================================
; far, thunk fixe VROOMM (jmp sub_9829D) — redirige un point d'entree stable vers le code
; d'overlay actuellement charge en memoire. fileoff=25F30h, codesize=0B18h, nentries=16.
; ==============================================================================================
VROOMM_StubThunk_6BCAB	proc far
		jmp	TextureLoader_ReleaseMultipleB_9829D
VROOMM_StubThunk_6BCAB	endp

stub288		ends
