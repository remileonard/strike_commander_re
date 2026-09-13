seg194		segment	byte public 'CODE' use16
		assume cs:seg194
		;org 0Dh
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, écrit un champ typé via sub_6568F (seg195). Appelée par sub_64E50, sub_64EC0,
; sub_6501E, sub_65073.
; ==============================================================================================
ResourceRecord_WriteField_64E1D	proc far		; CODE XREF: ResourceRecord_WriteFieldGroupA_64E50+67p
					; ResourceRecord_WriteFieldGroupB_64EC0+6Bp ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si

loc_64E21:
		push	di
		mov	si, [bp+arg_0]

loc_64E25:
		mov	di, 3
		jmp	short loc_64E48
; ���������������������������������������������������������������������������

loc_64E2A:				; CODE XREF: ResourceRecord_WriteField_64E1D+2Dj
		mov	eax, [si+65h]
		inc	dword ptr [si+65h]
		push	eax
		push	large 1
		mov	ax, [bp+arg_2]
		add	ax, di
		push	ds
		push	ax
		push	si
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		dec	di

loc_64E48:				; CODE XREF: ResourceRecord_WriteField_64E1D+Bj
		or	di, di
		jge	short loc_64E2A
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_WriteField_64E1D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6568F et ResourceRecord_WriteField_64E1D — écriture d'un groupe de champs.
; ==============================================================================================
ResourceRecord_WriteFieldGroupA_64E50	proc far		; CODE XREF: ResourceRecord_FindByTag_65271:loc_6529Cp
					; seg194:loc_65457p ...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp

loc_64E53:
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+69h], eax
		mov	eax, [bp+arg_2]
		mov	[si+6Dh], eax
		mov	eax, [bp+arg_6]
		mov	[si+72h], eax
		mov	ax, word ptr [bp+arg_6]
		and	ax, 1
		movsx	eax, ax
		mov	edx, [bp+arg_6]
		add	edx, eax
		add	edx, [si+65h]
		add	edx, 4
		mov	[si+76h], edx
		mov	eax, [bp+arg_2]

loc_64E93:
		mov	[bp+var_4], eax
		push	large dword ptr	[si+65h]
		push	large 4
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		lea	ax, [bp+arg_6]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_64E1D
		add	sp, 4
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupA_64E50	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_6568F (×2) et ResourceRecord_WriteField_64E1D.
; ==============================================================================================
ResourceRecord_WriteFieldGroupB_64EC0	proc far		; CODE XREF: ResourceRecord_CopyOrTransform_652D5+28p
					; MissionScenario_ResolveAndBindExpressions_A8F22+ADP

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	[si+69h], eax
		mov	eax, [bp+arg_2]
		mov	[si+6Dh], eax
		mov	eax, [bp+arg_6]
		add	eax, 4
		mov	[si+72h], eax
		mov	ax, word ptr [bp+arg_6]
		and	ax, 1
		movsx	eax, ax
		mov	edx, [bp+arg_6]
		add	edx, eax
		add	edx, [si+65h]
		add	edx, 0Ch
		mov	[si+76h], edx

loc_64F03:
		mov	[bp+var_4], 4D524F46h
		push	large dword ptr	[si+65h]
		push	large 4
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh

loc_64F20:
		add	dword ptr [si+65h], 4
		lea	ax, [bp+arg_6]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_64E1D
		add	sp, 4
		mov	eax, [bp+arg_2]
		mov	[bp+var_8], eax
		push	large dword ptr	[si+65h]
		push	large 4
		push	ss
		lea	ax, [bp+var_8]
		push	ax

loc_64F45:
		push	si
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupB_64EC0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 65 lignes, NON DÉTAILLÉE — combine sub_658, sub_2B6D (décodage externe) et
; Runtime_FatalErrorHandlerWithTag (sub_5F4A9), même motif que
; ResourceRecord_AllocateAndDecode_64C21 (seg193).
; ==============================================================================================
ResourceRecord_AllocateAndDecodeVariant_64F56	proc far		; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+BAP

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [si+7Ch]
		mov	[bp+var_2], ax
		mov	ax, si
		add	ax, 69h	; 'i'
		mov	[bp+var_4], ax
		push	13h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_64FBA
		mov	ax, [bp+var_2]
		mov	[di], ax
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[di+2],	eax
		mov	eax, [bx+9]
		mov	[di+0Bh], eax
		push	4
		mov	ax, [bp+var_4]
		add	ax, 4
		push	ax
		mov	ax, di
		add	ax, 6
		push	ax
		call	CRT_Strncpy_Pad
		add	sp, 6
		mov	bx, [bp+var_4]
		mov	eax, [bx+0Dh]
		mov	[di+0Fh], eax
		mov	ax, di
		jmp	short loc_64FBC
; ���������������������������������������������������������������������������

loc_64FBA:				; CODE XREF: ResourceRecord_AllocateAndDecodeVariant_64F56+25j
		mov	ax, di

loc_64FBC:				; CODE XREF: ResourceRecord_AllocateAndDecodeVariant_64F56+62j
		mov	[si+7Ch], ax
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_64FD1
		push	0B0E0h
		push	si
		call	DisplayContext_CommitFrameWithTag_5F4A9
		add	sp, 4

loc_64FD1:				; CODE XREF: ResourceRecord_AllocateAndDecodeVariant_64F56+6Dj
		inc	word ptr [si+7Ah]
		pop	di
		pop	si
		leave
		retf
ResourceRecord_AllocateAndDecodeVariant_64F56	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, enveloppe appelant sub_6501E. Référencée par sub_A8F22.
; ==============================================================================================
ResourceRecord_WriteFieldWrapper_64FD8	proc far		; CODE XREF: MissionScenario_ResolveAndBindExpressions_A8F22+100P
					; MissionScenario_ResolveAndBindExpressions_A8F22+156P ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupC_6501E
		pop	cx
		pop	bp
		retf
ResourceRecord_WriteFieldWrapper_64FD8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine sub_65073 et ResourceRecord_ReleaseAndClear_64D25.
; ==============================================================================================
ResourceRecord_SeekAndRelease_64FE7	proc far		; CODE XREF: seg194:01FAp
					; MissionScenario_ResolveAndBindExpressions_A8F22+436P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupD_65073
		pop	cx

loc_64FF5:
		push	si
		call	ResourceRecord_ReleaseAndClear_64D25
		pop	cx
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndRelease_64FE7	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		jmp	short loc_6500E
; ���������������������������������������������������������������������������

loc_65008:				; CODE XREF: seg194:0202j
		push	si
		push	cs
		call	near ptr ResourceRecord_SeekAndRelease_64FE7
		pop	cx

loc_6500E:				; CODE XREF: seg194:01F6j
		cmp	word ptr [si+7Ah], 0
		jg	short loc_65008
		push	si
		call	ResourceRecord_Helper_645A5
		pop	cx
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_WriteField_64E1D (×2). Référencée par sub_64FD8.
; ==============================================================================================
ResourceRecord_WriteFieldGroupC_6501E	proc far		; CODE XREF: ResourceRecord_WriteFieldWrapper_64FD8+9p seg194:065Bp

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp

loc_65021:
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	edx, [si+69h]
		add	edx, 8

loc_65034:
		sub	eax, edx
		mov	[bp+var_4], eax
		mov	ax, [si+65h]
		and	ax, 1

loc_65041:
		movsx	eax, ax

loc_65045:
		mov	edx, [si+65h]
		add	edx, eax

loc_6504C:
		mov	[si+76h], edx

loc_65050:
		mov	eax, [si+69h]

loc_65054:
		add	eax, 4
		mov	[si+65h], eax
		lea	ax, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_64E1D
		add	sp, 4
		mov	eax, [si+76h]
		mov	[si+65h], eax
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupC_6501E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, combine ResourceRecord_WriteField_64E1D (×2). Référencée par sub_64FE7.
; ==============================================================================================
ResourceRecord_WriteFieldGroupD_65073	proc far		; CODE XREF: ResourceRecord_SeekAndRelease_64FE7+Ap

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	bx, [si+7Ch]
		mov	edx, [bx+2]
		add	edx, 8
		sub	eax, edx

loc_6508F:
		mov	[bp+var_4], eax

loc_65093:
		mov	ax, [si+65h]

loc_65096:
		and	ax, 1
		movsx	eax, ax
		mov	edx, [si+65h]
		add	edx, eax
		mov	[bx+0Fh], edx
		mov	eax, [bx+2]
		add	eax, 4
		mov	[si+65h], eax
		lea	ax, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_64E1D
		add	sp, 4
		mov	bx, [si+7Ch]
		mov	eax, [bx+0Fh]
		mov	[si+65h], eax
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupD_65073	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 88 lignes, NON DÉTAILLÉE — combine ResourceRecord_ReadFieldGroupA_64A19 (seg193) et
; sub_6568F — pont lecture/écriture entre deux enregistrements.
; ==============================================================================================
ResourceRecord_ReadAndWriteBridge_650CE	proc far		; CODE XREF: seg194:0419p seg194:0458p

var_40C		= word ptr -40Ch
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp

loc_650D1:
		sub	sp, 40Ch
		push	si

loc_650D6:
		push	di
		mov	si, [bp+arg_0]

loc_650DA:
		mov	di, [bp+arg_2]

loc_650DD:
		mov	[bp+var_8], 0
		jmp	short loc_65145
; ���������������������������������������������������������������������������

loc_650E7:				; CODE XREF: ResourceRecord_ReadAndWriteBridge_650CE+7Fj
		mov	eax, [bp+arg_4]
		sub	eax, [bp+var_8]
		mov	[bp+var_4], eax

loc_650F3:
		cmp	[bp+var_4], 400h
		jle	short loc_65105
		mov	[bp+var_4], 400h

loc_65105:				; CODE XREF: ResourceRecord_ReadAndWriteBridge_650CE+2Dj
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_64A19
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax

loc_65120:
		push	large dword ptr	[di+65h]
		push	eax

loc_65126:
		push	ss

loc_65127:
		lea	ax, [bp+var_40C]
		push	ax

loc_6512C:
		push	di

loc_6512D:
		call	StreamReader_WriteTyped_6568F

loc_65132:
		add	sp, 0Eh

loc_65135:
		mov	eax, [bp+var_C]
		add	[di+65h], eax
		mov	eax, [bp+var_4]
		add	[bp+var_8], eax

loc_65145:				; CODE XREF: ResourceRecord_ReadAndWriteBridge_650CE+17j
		mov	eax, [bp+var_8]
		cmp	eax, [bp+arg_4]
		jl	short loc_650E7

loc_6514F:
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
ResourceRecord_ReadAndWriteBridge_650CE	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 78 lignes, NON DÉTAILLÉE — variante de ResourceRecord_ReadAndWriteBridge_650CE.
; ==============================================================================================
ResourceRecord_ReadAndWriteBridgeB_65158	proc far		; CODE XREF: ResourceRecord_BridgeWrapperA_651DF+14p
					; ResourceRecord_BridgeWrapperB_65232+17p

var_40C		= word ptr -40Ch
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 40Ch
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_8], 0
		jmp	short loc_651CD
; ���������������������������������������������������������������������������

loc_6516D:				; CODE XREF: ResourceRecord_ReadAndWriteBridgeB_65158+7Dj
		mov	eax, [bp+arg_4]
		sub	eax, [bp+var_8]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 400h
		jle	short loc_6518B
		mov	[bp+var_4], 400h

loc_6518B:				; CODE XREF: ResourceRecord_ReadAndWriteBridgeB_65158+29j
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_64A19

loc_6519D:
		add	sp, 0Ah

loc_651A0:
		mov	eax, [bp+var_4]

loc_651A4:
		mov	[bp+var_C], eax

loc_651A8:
		push	large dword ptr	[si+65h]

loc_651AC:
		push	eax
		push	ss

loc_651AF:
		lea	ax, [bp+var_40C]
		push	ax

loc_651B4:
		push	si

loc_651B5:
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		mov	eax, [bp+var_C]
		add	[si+65h], eax
		mov	eax, [bp+var_4]
		add	[bp+var_8], eax

loc_651CD:				; CODE XREF: ResourceRecord_ReadAndWriteBridgeB_65158+13j
		mov	eax, [bp+var_8]
		cmp	eax, [bp+arg_4]
		jl	short loc_6516D

loc_651D7:
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadAndWriteBridgeB_65158	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle ResourceRecord_ReadAndWriteBridgeB_65158. Appelée par sub_652D5.
; ==============================================================================================
ResourceRecord_BridgeWrapperA_651DF	proc far		; CODE XREF: ResourceRecord_FindByTag_65271:loc_652A7p

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	ax, [bp+arg_0]
		mov	si, [bp+arg_2]
		push	large dword ptr	[si+72h]
		push	si
		push	ax
		push	cs
		call	near ptr ResourceRecord_ReadAndWriteBridgeB_65158
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		mov	[bp+var_4], eax
		mov	eax, [si+76h]
		mov	[si+65h], eax
		mov	byte ptr [si+6Dh], 0
		mov	eax, [bp+var_4]
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_BridgeWrapperA_651DF	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	large dword ptr	[si+72h]
		push	word ptr [bp+8]

loc_65227:
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadAndWriteBridge_650CE
		add	sp, 8

loc_6522F:
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle ResourceRecord_ReadAndWriteBridgeB_65158. Appelée par sub_652D5.
; ==============================================================================================
ResourceRecord_BridgeWrapperB_65232	proc far		; CODE XREF: ResourceRecord_CopyOrTransform_652D5+31p

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	eax, [si+72h]

loc_65240:
		add	eax, 0FFFFFFFCh
		push	eax
		push	si
		push	dx
		push	cs
		call	near ptr ResourceRecord_ReadAndWriteBridgeB_65158

loc_6524C:
		add	sp, 8
		pop	si
		pop	bp
		retf
ResourceRecord_BridgeWrapperB_65232	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		mov	eax, [si+72h]
		add	eax, 0FFFFFFFCh
		push	eax
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadAndWriteBridge_650CE
		add	sp, 8
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 63 lignes, NON DÉTAILLÉE — recherche un sous-enregistrement par tag/type. Appelée
; massivement par le grand bloc de recherche en fin de segment.
; ==============================================================================================
ResourceRecord_FindByTag_65271	proc far		; CODE XREF: seg194:0523p seg194:05ABp ...

var_7		= word ptr -7
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		add	di, 69h	; 'i'
		mov	ax, di
		add	ax, 4
		mov	[bp+var_2], ax
		mov	eax, [di+9]
		mov	dword ptr [bp+var_7+1],	eax
		push	eax
		mov	bx, [bp+var_2]

loc_65297:
		push	large dword ptr	[bx]
		push	si
		push	cs

loc_6529C:
		call	near ptr ResourceRecord_WriteFieldGroupA_64E50
		add	sp, 0Ah

loc_652A2:
		push	[bp+arg_2]
		push	si
		push	cs

loc_652A7:
		call	near ptr ResourceRecord_BridgeWrapperA_651DF
		add	sp, 4

loc_652AD:
		test	word ptr [si+65h], 1
		jz	short loc_652D1
		mov	byte ptr [bp+var_7], 0
		push	large dword ptr	[si+65h]
		push	large 1
		push	ss
		lea	ax, [bp+var_7]
		push	ax
		push	si
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		inc	dword ptr [si+65h]

loc_652D1:				; CODE XREF: ResourceRecord_FindByTag_65271+41j
		pop	di
		pop	si

locret_652D3:
		leave
		retf
ResourceRecord_FindByTag_65271	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 38 lignes, NON DÉTAILLÉE — combine ResourceRecord_BridgeWrapperA_651DF/B_65232
; (sélection selon condition) — copie ou transformation d'un enregistrement vers un autre
; format.
; ==============================================================================================
ResourceRecord_CopyOrTransform_652D5	proc far		; CODE XREF: seg194:0535p seg194:0599p

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si

loc_652DC:
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, di
		add	ax, 6Dh	; 'm'
		mov	[bp+var_2], ax
		mov	eax, [di+72h]
		mov	[bp+var_6], eax
		push	eax
		mov	bx, [bp+var_2]
		push	large dword ptr	[bx]
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupB_64EC0
		add	sp, 0Ah
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_BridgeWrapperB_65232
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
ResourceRecord_CopyOrTransform_652D5	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+0Ch]
		mov	word ptr [bp-2], 0

loc_65323:
		jmp	short loc_65352
; ���������������������������������������������������������������������������

loc_65325:				; CODE XREF: seg194:056Dj
		push	di
		call	ResourceRecord_ComputeRecordBounds_646DB
		pop	cx

loc_6532C:
		or	ax, ax
		jnz	short loc_65338
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_FindByTag_65271
		jmp	short loc_65348
; ���������������������������������������������������������������������������

loc_65338:				; CODE XREF: seg194:051Ej
		mov	eax, [di+6Dh]
		cmp	eax, [bp+8]
		jz	short loc_6534D
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_CopyOrTransform_652D5

loc_65348:				; CODE XREF: seg194:0526j
		add	sp, 4
		jmp	short loc_65352
; ���������������������������������������������������������������������������

loc_6534D:				; CODE XREF: seg194:0530j
		mov	word ptr [bp-2], 1

loc_65352:				; CODE XREF: seg194:loc_65323j
					; seg194:053Bj
		cmp	word ptr [bp-2], 0
		jnz	short loc_6537F
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_65367
		push	di
		call	ResourceRecord_ReadPayload_64DB3
		pop	cx
		jmp	short loc_6537B
; ���������������������������������������������������������������������������

loc_65367:				; CODE XREF: seg194:054Cj
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_65379
		mov	ax, 1
		jmp	short loc_6537B
; ���������������������������������������������������������������������������

loc_65379:				; CODE XREF: seg194:0562j
		xor	ax, ax

loc_6537B:				; CODE XREF: seg194:0555j seg194:0567j
		or	ax, ax
		jz	short loc_65325

loc_6537F:				; CODE XREF: seg194:0546j
		mov	ax, [bp-2]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]

loc_65391:
		mov	di, [bp+0Ch]
		mov	word ptr [bp-2], 0
		jmp	short loc_653C8
; ���������������������������������������������������������������������������

loc_6539B:				; CODE XREF: seg194:05E3j
		push	di

loc_6539C:
		call	ResourceRecord_ComputeRecordBounds_646DB
		pop	cx

loc_653A2:
		or	ax, ax

loc_653A4:
		jz	short loc_653AE
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_CopyOrTransform_652D5

loc_653AC:
		jmp	short loc_653BE
; ���������������������������������������������������������������������������

loc_653AE:				; CODE XREF: seg194:loc_653A4j
		mov	eax, [di+6Dh]
		cmp	eax, [bp+8]
		jz	short loc_653C3
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_FindByTag_65271

loc_653BE:				; CODE XREF: seg194:loc_653ACj
		add	sp, 4
		jmp	short loc_653C8
; ���������������������������������������������������������������������������

loc_653C3:				; CODE XREF: seg194:05A6j
		mov	word ptr [bp-2], 1

loc_653C8:				; CODE XREF: seg194:0589j seg194:05B1j
		cmp	word ptr [bp-2], 0
		jnz	short loc_653F5
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_653DD
		push	di
		call	ResourceRecord_ReadPayload_64DB3

loc_653DA:
		pop	cx
		jmp	short loc_653F1
; ���������������������������������������������������������������������������

loc_653DD:				; CODE XREF: seg194:05C2j
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_653EF
		mov	ax, 1
		jmp	short loc_653F1
; ���������������������������������������������������������������������������

loc_653EF:				; CODE XREF: seg194:05D8j
		xor	ax, ax

loc_653F1:				; CODE XREF: seg194:05CBj seg194:05DDj
		or	ax, ax
		jz	short loc_6539B

loc_653F5:				; CODE XREF: seg194:05BCj
		mov	ax, [bp-2]
		pop	di
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		jmp	short loc_65419
; ���������������������������������������������������������������������������

loc_65409:				; CODE XREF: seg194:062Ej
		push	di
		call	ResourceRecord_ComputeAlignedBounds_64BC1
		pop	cx
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_FindByTag_65271
		add	sp, 4

loc_65419:				; CODE XREF: seg194:05F7j
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_65428
		push	di

loc_65420:
		call	ResourceRecord_ReadPayload_64DB3
		pop	cx

loc_65426:
		jmp	short loc_6543C
; ���������������������������������������������������������������������������

loc_65428:				; CODE XREF: seg194:060Dj
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_6543A
		mov	ax, 1
		jmp	short loc_6543C
; ���������������������������������������������������������������������������

loc_6543A:				; CODE XREF: seg194:0623j
		xor	ax, ax

loc_6543C:				; CODE XREF: seg194:loc_65426j
					; seg194:0628j
		or	ax, ax
		jz	short loc_65409
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_65444:
		push	bp
		mov	bp, sp
		push	si

loc_65448:
		push	di

loc_65449:
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	large 0

loc_65452:
		push	large dword ptr	[di]
		push	si

loc_65456:
		push	cs

loc_65457:
		call	near ptr ResourceRecord_WriteFieldGroupA_64E50
		add	sp, 0Ah
		push	word ptr [bp+0Ah]
		push	si
		call	ResourceRecord_AdvanceByArrayCount_649C1
		add	sp, 4
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupC_6501E
		pop	cx
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+6]
		mov	eax, [si+65h]
		mov	[si+9Ch], eax
		xor	eax, eax
		mov	[si+0A0h], eax
		mov	[bp-4],	eax
		push	large dword ptr	[si+65h]
		push	large 4
		push	ss
		lea	ax, [bp-4]
		push	ax
		push	si

loc_6549F:
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh

loc_654A7:
		add	dword ptr [si+65h], 4
		push	large dword ptr	[si+98h]
		push	large 4
		push	ds
		mov	ax, si
		add	ax, 9Ch	; '�'
		push	ax
		push	si
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh
		add	dword ptr [si+98h], 4
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si

loc_654D4:
		mov	si, [bp+6]

loc_654D7:
		mov	eax, [si+65h]
		mov	[si+0A4h], eax

loc_654E0:
		mov	eax, [si+0A4h]

loc_654E5:
		mov	edx, [si+9Ch]
		add	edx, 4
		sub	eax, edx

loc_654F1:
		mov	[si+0A0h], eax

loc_654F6:
		mov	eax, [si+9Ch]

loc_654FB:
		mov	[si+65h], eax

loc_654FF:
		mov	eax, [si+0A0h]

loc_65504:
		mov	[bp-4],	eax
		push	large dword ptr	[si+65h]
		push	large 4
		push	ss
		lea	ax, [bp-4]
		push	ax
		push	si
		call	StreamReader_WriteTyped_6568F
		add	sp, 0Eh

loc_6551D:
		add	dword ptr [si+65h], 4

loc_65522:
		mov	eax, [si+0A4h]

loc_65527:
		mov	[si+65h], eax
		pop	si
		leave
		retf
seg194		ends
