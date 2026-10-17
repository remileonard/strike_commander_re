seg148		segment	byte public 'CODE' use16
		assume cs:seg148
		;org 0Dh
		assume es:nothing, ss:nothing, ds:dseg,	fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteField_64E1D (sub_64E1D de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, écrit un champ typé via sub_6568F (seg195).
; Appelée par sub_64E50, sub_64EC0, sub_6501E, sub_65073.
; ==============================================================================================
ResourceRecord_WriteField_3C68D	proc far		; CODE XREF: ResourceRecord_WriteFieldGroupA_3C6C0+67p
					; ResourceRecord_WriteFieldGroupB_3C730+6Bp ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, 3
		jmp	short loc_3C6B8
; ���������������������������������������������������������������������������

loc_3C69A:				; CODE XREF: ResourceRecord_WriteField_3C68D+2Dj
		mov	eax, [si+65h]
		inc	dword ptr [si+65h]
		push	eax
		push	large 1
		mov	ax, [bp+arg_2]
		add	ax, di
		push	ds
		push	ax
		push	si
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		dec	di

loc_3C6B8:				; CODE XREF: ResourceRecord_WriteField_3C68D+Bj
		or	di, di
		jge	short loc_3C69A
		pop	di
		pop	si
		pop	bp
		retf
ResourceRecord_WriteField_3C68D	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldGroupA_64E50 (sub_64E50 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_6568F et
; ResourceRecord_WriteField_64E1D — écriture d'un groupe de champs.
; ==============================================================================================
ResourceRecord_WriteFieldGroupA_3C6C0	proc far		; CODE XREF: ResourceRecord_FindByTag_3CAE1+2Bp
					; seg148:0647p	...

var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
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
		mov	[bp+var_4], eax
		push	large dword ptr	[si+65h]
		push	large 4
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		lea	ax, [bp+arg_6]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_3C68D
		add	sp, 4
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupA_3C6C0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldGroupB_64EC0 (sub_64EC0 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine sub_6568F (×2) et
; ResourceRecord_WriteField_64E1D.
; ==============================================================================================
ResourceRecord_WriteFieldGroupB_3C730	proc far		; CODE XREF: ResourceRecord_CopyOrTransform_3CB45+28p
					; sub_4BBF7+22FP ...

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
		mov	[bp+var_4], 4D524F46h
		push	large dword ptr	[si+65h]
		push	large 4
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		lea	ax, [bp+arg_6]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_3C68D
		add	sp, 4
		mov	eax, [bp+arg_2]
		mov	[bp+var_8], eax
		push	large dword ptr	[si+65h]
		push	large 4
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		push	si
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupB_3C730	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3C7C6	proc far		; CODE XREF: sub_4BBF7+23CP
					; sub_4BBF7+33BP ...

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
		jz	short loc_3C82A
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
		jmp	short loc_3C82C
; ���������������������������������������������������������������������������

loc_3C82A:				; CODE XREF: sub_3C7C6+25j
		mov	ax, di

loc_3C82C:				; CODE XREF: sub_3C7C6+62j
		mov	[si+7Ch], ax
		cmp	word ptr [si+7Ch], 0
		jnz	short loc_3C841
		push	0B0E0h
		push	si
		call	DisplayContext_CommitFrameWithTag_2FD1E
		add	sp, 4

loc_3C841:				; CODE XREF: sub_3C7C6+6Dj
		inc	word ptr [si+7Ah]
		pop	di
		pop	si
		leave
		retf
sub_3C7C6	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldWrapper_64FD8 (sub_64FD8 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — far, enveloppe appelant sub_6501E.
; Référencée par sub_A8F22.
; ==============================================================================================
ResourceRecord_WriteFieldWrapper_3C848	proc far		; CODE XREF: sub_4BBF7+27EP
					; sub_4BBF7+30FP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		nop
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupC_3C88E
		pop	cx
		pop	bp
		retf
ResourceRecord_WriteFieldWrapper_3C848	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_SeekAndRelease_64FE7 (sub_64FE7 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, combine sub_65073 et
; ResourceRecord_ReleaseAndClear_64D25.
; ==============================================================================================
ResourceRecord_SeekAndRelease_3C857	proc far		; CODE XREF: sub_3C86F+Bp
					; sub_4BBF7+52AP ...

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		nop
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupD_3C8E3
		pop	cx
		push	si
		call	ResourceRecord_ReleaseAndClear_3C595
		pop	cx
		pop	si
		pop	bp
		retf
ResourceRecord_SeekAndRelease_3C857	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3C86F	proc far		; CODE XREF: sub_4BBF7+7A7P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_3C87E
; ���������������������������������������������������������������������������

loc_3C878:				; CODE XREF: sub_3C86F+13j
		push	si
		push	cs
		call	near ptr ResourceRecord_SeekAndRelease_3C857
		pop	cx

loc_3C87E:				; CODE XREF: sub_3C86F+7j
		cmp	word ptr [si+7Ah], 0
		jg	short loc_3C878
		push	si
		call	ResourceRecord_Helper_3BE15
		pop	cx
		pop	si
		pop	bp
		retf
sub_3C86F	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldGroupC_6501E (sub_6501E de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine ResourceRecord_WriteField_64E1D
; (×2). Référencée par sub_64FD8.
; ==============================================================================================
ResourceRecord_WriteFieldGroupC_3C88E	proc far		; CODE XREF: ResourceRecord_WriteFieldWrapper_3C848+9p seg148:065Bp

var_4		= dword	ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [si+65h]
		mov	edx, [si+69h]
		add	edx, 8
		sub	eax, edx
		mov	[bp+var_4], eax
		mov	ax, [si+65h]
		and	ax, 1
		movsx	eax, ax
		mov	edx, [si+65h]
		add	edx, eax
		mov	[si+76h], edx
		mov	eax, [si+69h]
		add	eax, 4
		mov	[si+65h], eax
		lea	ax, [bp+var_4]
		push	ax
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteField_3C68D
		add	sp, 4
		mov	eax, [si+76h]
		mov	[si+65h], eax
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupC_3C88E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_WriteFieldGroupD_65073 (sub_65073 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — far, combine ResourceRecord_WriteField_64E1D
; (×2). Référencée par sub_64FE7.
; ==============================================================================================
ResourceRecord_WriteFieldGroupD_3C8E3	proc far		; CODE XREF: ResourceRecord_SeekAndRelease_3C857+Ap

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
		mov	[bp+var_4], eax
		mov	ax, [si+65h]
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
		call	near ptr ResourceRecord_WriteField_3C68D
		add	sp, 4
		mov	bx, [si+7Ch]
		mov	eax, [bx+0Fh]
		mov	[si+65h], eax
		pop	si
		leave
		retf
ResourceRecord_WriteFieldGroupD_3C8E3	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadAndWriteBridge_650CE (sub_650CE de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 88 lignes, NON DÉTAILLÉE —
; combine ResourceRecord_ReadFieldGroupA_64A19 (seg193) et sub_6568F — pont lecture/écriture
; entre deux enregistrements.
; ==============================================================================================
ResourceRecord_ReadAndWriteBridge_3C93E	proc far		; CODE XREF: seg148:0419p seg148:0458p

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
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_8], 0
		jmp	short loc_3C9B5
; ���������������������������������������������������������������������������

loc_3C957:				; CODE XREF: ResourceRecord_ReadAndWriteBridge_3C93E+7Fj
		mov	eax, [bp+arg_4]
		sub	eax, [bp+var_8]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 400h
		jle	short loc_3C975
		mov	[bp+var_4], 400h

loc_3C975:				; CODE XREF: ResourceRecord_ReadAndWriteBridge_3C93E+2Dj
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	large dword ptr	[di+65h]
		push	eax
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	di
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		mov	eax, [bp+var_C]
		add	[di+65h], eax
		mov	eax, [bp+var_4]
		add	[bp+var_8], eax

loc_3C9B5:				; CODE XREF: ResourceRecord_ReadAndWriteBridge_3C93E+17j
		mov	eax, [bp+var_8]
		cmp	eax, [bp+arg_4]
		jl	short loc_3C957
		shld	edx, eax, 10h
		pop	di
		pop	si
		leave
		retf
ResourceRecord_ReadAndWriteBridge_3C93E	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_ReadAndWriteBridgeB_65158 (sub_65158 de STRIKE.EXE). Résumé repris de
; STRIKE.EXE ; appelants et contexte à revérifier ici. — ⚠️ far, 78 lignes, NON DÉTAILLÉE —
; variante de ResourceRecord_ReadAndWriteBridge_650CE.
; ==============================================================================================
ResourceRecord_ReadAndWriteBridgeB_3C9C8	proc far		; CODE XREF: ResourceRecord_BridgeWrapperA_3CA4F+14p
					; ResourceRecord_BridgeWrapperB_3CAA2+17p

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
		jmp	short loc_3CA3D
; ���������������������������������������������������������������������������

loc_3C9DD:				; CODE XREF: ResourceRecord_ReadAndWriteBridgeB_3C9C8+7Dj
		mov	eax, [bp+arg_4]
		sub	eax, [bp+var_8]
		mov	[bp+var_4], eax
		cmp	[bp+var_4], 400h
		jle	short loc_3C9FB
		mov	[bp+var_4], 400h

loc_3C9FB:				; CODE XREF: ResourceRecord_ReadAndWriteBridgeB_3C9C8+29j
		push	large [bp+var_4]
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	[bp+arg_2]
		call	ResourceRecord_ReadFieldGroupA_3C289
		add	sp, 0Ah
		mov	eax, [bp+var_4]
		mov	[bp+var_C], eax
		push	large dword ptr	[si+65h]
		push	eax
		push	ss
		lea	ax, [bp+var_40C]
		push	ax
		push	si
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		mov	eax, [bp+var_C]
		add	[si+65h], eax
		mov	eax, [bp+var_4]
		add	[bp+var_8], eax

loc_3CA3D:				; CODE XREF: ResourceRecord_ReadAndWriteBridgeB_3C9C8+13j
		mov	eax, [bp+var_8]
		cmp	eax, [bp+arg_4]
		jl	short loc_3C9DD
		shld	edx, eax, 10h
		pop	si
		leave
		retf
ResourceRecord_ReadAndWriteBridgeB_3C9C8	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_BridgeWrapperA_651DF (sub_651DF de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle
; ResourceRecord_ReadAndWriteBridgeB_65158. Appelée par sub_652D5.
; ==============================================================================================
ResourceRecord_BridgeWrapperA_3CA4F	proc far		; CODE XREF: ResourceRecord_FindByTag_3CAE1+36p
					; sub_58EEA+134P ...

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
		call	near ptr ResourceRecord_ReadAndWriteBridgeB_3C9C8
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
ResourceRecord_BridgeWrapperA_3CA4F	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+6]
		push	large dword ptr	[si+72h]
		push	word ptr [bp+8]
		push	si
		push	cs
		call	near ptr ResourceRecord_ReadAndWriteBridge_3C93E
		add	sp, 8
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_BridgeWrapperB_65232 (sub_65232 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far, appelle
; ResourceRecord_ReadAndWriteBridgeB_65158. Appelée par sub_652D5.
; ==============================================================================================
ResourceRecord_BridgeWrapperB_3CAA2	proc far		; CODE XREF: ResourceRecord_CopyOrTransform_3CB45+31p
					; sub_58EEA+6FCP

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	dx, [bp+arg_0]
		mov	si, [bp+arg_2]
		mov	eax, [si+72h]
		add	eax, 0FFFFFFFCh
		push	eax
		push	si
		push	dx
		push	cs
		call	near ptr ResourceRecord_ReadAndWriteBridgeB_3C9C8
		add	sp, 8
		pop	si
		pop	bp
		retf
ResourceRecord_BridgeWrapperB_3CAA2	endp

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
		call	near ptr ResourceRecord_ReadAndWriteBridge_3C93E
		add	sp, 8
		pop	si
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_FindByTag_65271 (sub_65271 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — ⚠️ far, 63 lignes, NON DÉTAILLÉE — recherche un
; sous-enregistrement par tag/type. Appelée massivement par le grand bloc de recherche en fin
; de segment.
; ==============================================================================================
ResourceRecord_FindByTag_3CAE1	proc far		; CODE XREF: seg148:0523p
					; sub_3CBF6+35p ...

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
		push	large dword ptr	[bx]
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		push	[bp+arg_2]
		push	si
		push	cs
		call	near ptr ResourceRecord_BridgeWrapperA_3CA4F
		add	sp, 4
		test	word ptr [si+65h], 1
		jz	short loc_3CB41
		mov	byte ptr [bp+var_7], 0
		push	large dword ptr	[si+65h]
		push	large 1
		push	ss
		lea	ax, [bp+var_7]
		push	ax
		push	si
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		inc	dword ptr [si+65h]

loc_3CB41:				; CODE XREF: ResourceRecord_FindByTag_3CAE1+41j
		pop	di
		pop	si
		leave
		retf
ResourceRecord_FindByTag_3CAE1	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; ResourceRecord_CopyOrTransform_652D5 (sub_652D5 de STRIKE.EXE). Résumé repris de STRIKE.EXE
; ; appelants et contexte à revérifier ici. — ⚠️ far, 38 lignes, NON DÉTAILLÉE — combine
; ResourceRecord_BridgeWrapperA_651DF/B_65232 (sélection selon condition) — copie ou
; transformation d'un enregistrement vers un autre format.
; ==============================================================================================
ResourceRecord_CopyOrTransform_3CB45	proc far		; CODE XREF: seg148:0535p
					; sub_3CBF6+23p

var_6		= dword	ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
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
		call	near ptr ResourceRecord_WriteFieldGroupB_3C730
		add	sp, 0Ah
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_BridgeWrapperB_3CAA2
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
ResourceRecord_CopyOrTransform_3CB45	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+0Ch]
		mov	word ptr [bp-2], 0
		jmp	short loc_3CBC2
; ���������������������������������������������������������������������������

loc_3CB95:				; CODE XREF: seg148:056Dj
		push	di
		call	ResourceRecord_ComputeRecordBounds_3BF4B
		pop	cx
		or	ax, ax
		jnz	short loc_3CBA8
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_FindByTag_3CAE1
		jmp	short loc_3CBB8
; ���������������������������������������������������������������������������

loc_3CBA8:				; CODE XREF: seg148:051Ej
		mov	eax, [di+6Dh]
		cmp	eax, [bp+8]
		jz	short loc_3CBBD
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_CopyOrTransform_3CB45

loc_3CBB8:				; CODE XREF: seg148:0526j
		add	sp, 4
		jmp	short loc_3CBC2
; ���������������������������������������������������������������������������

loc_3CBBD:				; CODE XREF: seg148:0530j
		mov	word ptr [bp-2], 1

loc_3CBC2:				; CODE XREF: seg148:0513j seg148:053Bj
		cmp	word ptr [bp-2], 0
		jnz	short loc_3CBEF
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_3CBD7
		push	di
		call	ResourceRecord_ReadPayload_3C623
		pop	cx
		jmp	short loc_3CBEB
; ���������������������������������������������������������������������������

loc_3CBD7:				; CODE XREF: seg148:054Cj
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_3CBE9
		mov	ax, 1
		jmp	short loc_3CBEB
; ���������������������������������������������������������������������������

loc_3CBE9:				; CODE XREF: seg148:0562j
		xor	ax, ax

loc_3CBEB:				; CODE XREF: seg148:0555j seg148:0567j
		or	ax, ax
		jz	short loc_3CB95

loc_3CBEF:				; CODE XREF: seg148:0546j
		mov	ax, [bp-2]
		pop	di
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

sub_3CBF6	proc far		; CODE XREF: sub_58EEA+F9P
					; sub_58EEA+1F3P

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword	ptr  8
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		mov	[bp+var_2], 0
		jmp	short loc_3CC38
; ���������������������������������������������������������������������������

loc_3CC0B:				; CODE XREF: sub_3CBF6+6Dj
		push	di
		call	ResourceRecord_ComputeRecordBounds_3BF4B
		pop	cx
		or	ax, ax
		jz	short loc_3CC1E
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_CopyOrTransform_3CB45
		jmp	short loc_3CC2E
; ���������������������������������������������������������������������������

loc_3CC1E:				; CODE XREF: sub_3CBF6+1Ej
		mov	eax, [di+6Dh]
		cmp	eax, [bp+arg_2]
		jz	short loc_3CC33
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_FindByTag_3CAE1

loc_3CC2E:				; CODE XREF: sub_3CBF6+26j
		add	sp, 4
		jmp	short loc_3CC38
; ���������������������������������������������������������������������������

loc_3CC33:				; CODE XREF: sub_3CBF6+30j
		mov	[bp+var_2], 1

loc_3CC38:				; CODE XREF: sub_3CBF6+13j
					; sub_3CBF6+3Bj
		cmp	[bp+var_2], 0
		jnz	short loc_3CC65
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_3CC4D
		push	di
		call	ResourceRecord_ReadPayload_3C623
		pop	cx
		jmp	short loc_3CC61
; ���������������������������������������������������������������������������

loc_3CC4D:				; CODE XREF: sub_3CBF6+4Cj
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_3CC5F
		mov	ax, 1
		jmp	short loc_3CC61
; ���������������������������������������������������������������������������

loc_3CC5F:				; CODE XREF: sub_3CBF6+62j
		xor	ax, ax

loc_3CC61:				; CODE XREF: sub_3CBF6+55j
					; sub_3CBF6+67j
		or	ax, ax
		jz	short loc_3CC0B

loc_3CC65:				; CODE XREF: sub_3CBF6+46j
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
sub_3CBF6	endp

; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		jmp	short loc_3CC89
; ���������������������������������������������������������������������������

loc_3CC79:				; CODE XREF: seg148:062Ej
		push	di
		call	ResourceRecord_ComputeAlignedBounds_3C431
		pop	cx
		push	di
		push	si
		push	cs
		call	near ptr ResourceRecord_FindByTag_3CAE1
		add	sp, 4

loc_3CC89:				; CODE XREF: seg148:05F7j
		cmp	word ptr [di+7Ch], 0
		jnz	short loc_3CC98
		push	di
		call	ResourceRecord_ReadPayload_3C623
		pop	cx
		jmp	short loc_3CCAC
; ���������������������������������������������������������������������������

loc_3CC98:				; CODE XREF: seg148:060Dj
		mov	eax, [di+65h]
		mov	bx, [di+7Ch]
		cmp	eax, [bx+0Fh]
		jl	short loc_3CCAA
		mov	ax, 1
		jmp	short loc_3CCAC
; ���������������������������������������������������������������������������

loc_3CCAA:				; CODE XREF: seg148:0623j
		xor	ax, ax

loc_3CCAC:				; CODE XREF: seg148:0616j seg148:0628j
		or	ax, ax
		jz	short loc_3CC79
		pop	di
		pop	si
		pop	bp
		retf
; ���������������������������������������������������������������������������
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+6]
		mov	di, [bp+8]
		push	large 0
		push	large dword ptr	[di]
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupA_3C6C0
		add	sp, 0Ah
		push	word ptr [bp+0Ah]
		push	si
		call	ResourceRecord_AdvanceByArrayCount_3C231
		add	sp, 4
		push	si
		push	cs
		call	near ptr ResourceRecord_WriteFieldGroupC_3C88E
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
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		push	large dword ptr	[si+98h]
		push	large 4
		push	ds
		mov	ax, si
		add	ax, 9Ch	; '�'
		push	ax
		push	si
		call	StreamReader_WriteTyped_3CEFF
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
		mov	si, [bp+6]
		mov	eax, [si+65h]
		mov	[si+0A4h], eax
		mov	eax, [si+0A4h]
		mov	edx, [si+9Ch]
		add	edx, 4
		sub	eax, edx
		mov	[si+0A0h], eax
		mov	eax, [si+9Ch]
		mov	[si+65h], eax
		mov	eax, [si+0A0h]
		mov	[bp-4],	eax
		push	large dword ptr	[si+65h]
		push	large 4
		push	ss
		lea	ax, [bp-4]
		push	ax
		push	si
		call	StreamReader_WriteTyped_3CEFF
		add	sp, 0Eh
		add	dword ptr [si+65h], 4
		mov	eax, [si+0A4h]
		mov	[si+65h], eax
		pop	si
		leave
		retf
seg148		ends
