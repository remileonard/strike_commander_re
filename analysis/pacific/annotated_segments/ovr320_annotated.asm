ovr320		segment	para public 'OVERLAY' use16
		assume cs:ovr320
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-13. Lecteur du chunk CARD d'un objet CARR : 8 i32 en 24.8 rangés dans des
; variables globales dword_7CDE6, 7CDEA, 7CDEE, 7CDF2, 7CDF6, 7CDFA, 7CDFE, 7CE02 (le dernier
; porte-avions chargé l'emporte ; les 4 fichiers de PACIFIC.DAT ont les mêmes valeurs : 33, 5,
; 0, −60, 33, 0, −80, 33 m). Absent : erreur 49273. dword_7CDE6 = hauteur du pont
; (Aircraft_ContactWithObject_3CA69, PhysicsTicks_4A8F4) ; 7CDEE..7CDF6 = point (0, −60, 33)
; lu par sub_B169C (ovr321) et ovr322 ; les autres rangés, rôle non établi.
; ==============================================================================================
CarrierDeck_LoadCARD_B0E70		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	sub_74940
		add	sp, 6
		push	0
		push	large 44524143h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B0F13
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_7CDE6, eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_7CDEA, eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_7CDEE, eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_7CDF2, eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_7CDF6, eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_7CDFA, eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_7CDFE, eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	dword_7CE02, eax
		jmp	short loc_B0F1C

loc_B0F13:
		push	0C079h
		call	sub_1DDFE
		pop	cx

loc_B0F1C:
		pop	si
		pop	bp
		retf
CarrierDeck_LoadCARD_B0E70		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B0F1F		proc far

var_A		= dword ptr -0Ah
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	127h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B0FA7
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si+52h], 0
		mov	word ptr [si], 2058h
		push	si
		call	sub_3C494
		pop	cx
		mov	word ptr [si], 2658h
		mov	word ptr [si+5Ch], 0
		push	si
		call	Widget_SetFlagBit0_4352E
		pop	cx
		mov	dword ptr [si+6Ah], 0
		mov	word ptr [si], 2845h
		push	ds
		mov	ax, si
		add	ax, 6Eh
		push	ax
		call	sub_736DA
		add	sp, 4
		mov	word ptr [si+11Ch], 0
		mov	word ptr [si+11Eh], 0
		push	si
		call	sub_74959
		pop	cx
		mov	word ptr [si], 278Bh
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr sub_B1014
		add	sp, 6
		mov	ax, si
		jmp	short loc_B0FA9

loc_B0FA7:
		mov	ax, si

loc_B0FA9:
		mov	si, ax
		les	bx, word ptr [bp+arg_0]
		cmp	word ptr es:[bx+49h], 0
		jz	short loc_B0FCC
		push	ax
		push	word ptr es:[bx+49h]
		mov	bx, es:[bx+49h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_6], ax
		mov	[si+52h], ax

loc_B0FCC:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+59h], 0
		jz	short loc_B0FF3
		push	si
		push	large es:[bx+59h]
		call	sub_7425F
		add	sp, 6
		mov	word ptr [bp+var_A+2], dx
		mov	word ptr [bp+var_A], ax
		mov	eax, [bp+var_A]
		mov	[si+6Ah], eax

loc_B0FF3:
		push	si
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		mov	ax, si
		pop	si
		leave
		retf
sub_B0F1F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via vtable
; (DATA XREF seg339) — enveloppe appelant StreamReader_Destruct_638FF. Référencée directement
; par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_B1005		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_74959
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_B1005		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1014		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	sub_7495E
		add	sp, 6
		mov	word ptr [si+125h], 0
		mov	word ptr [si+121h], 0
		mov	byte ptr [si+124h], 0
		mov	byte ptr [si+123h], 0
		pop	si
		pop	bp
		retf
sub_B1014		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1041		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		mov	bx, [si+121h]
		mov	[bx+12h], eax
		mov	eax, [di+4]
		mov	[bx+16h], eax
		mov	eax, [di+8]
		mov	[bx+1Ah], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	word ptr [si+121h]
		mov	bx, [si+121h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	eax, dword_7CDFA
		mov	[bp+var_C], eax
		mov	eax, dword_7CDFE
		mov	[bp+var_8], eax
		mov	eax, dword_7CE02
		mov	[bp+var_4], eax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		call	Matrix_WorldToLocal_5A569
		add	sp, 4
		mov	bx, [si+121h]
		mov	eax, [bp+var_C]
		add	[bx+12h], eax
		mov	eax, [bp+var_8]
		add	[bx+16h], eax
		mov	eax, [bp+var_4]
		add	[bx+1Ah], eax
		pop	di
		pop	si
		leave
		retf
sub_B1041		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B10D0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+121h], 0
		jnz	short loc_B1111
		push	1
		push	1
		push	ds
		push	offset aCrashbar
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	[si+121h], ax
		cmp	word ptr [si+121h], 0
		jz	short loc_B1108
		mov	byte ptr [si+124h], 1
		push	si
		push	cs
		call	near ptr sub_B1041
		jmp	short loc_B1110

loc_B1108:
		push	0B000h
		call	sub_1DDFE

loc_B1110:
		pop	cx

loc_B1111:
		pop	si
		pop	bp
		retf
sub_B10D0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1114		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+124h], 0
		cmp	word ptr [si+121h], 0
		jz	short loc_B113B
		push	3
		push	word ptr [si+121h]
		mov	bx, [si+121h]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		jmp	short loc_B113B

loc_B113B:
		mov	word ptr [si+121h], 0
		pop	si
		pop	bp
		retf
sub_B1114		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B1144		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		push	1
		push	1
		push	ds
		push	offset aLSO
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	[si+125h], ax
		cmp	word ptr [si+125h], 0
		jnz	short loc_B1175
		push	2831h
		call	Runtime_FatalErrorHandler_68BA2
		pop	cx

loc_B1175:
		mov	[bp+var_2], si
		push	[bp+var_2]
		mov	ax, [si+125h]
		add	ax, 55h
		push	ax
		call	SetReference16
		add	sp, 4
		mov	ax, word_7CADA
		mov	[bp+var_4], ax
		push	ax
		mov	ax, [si+125h]
		add	ax, 53h
		push	ax
		call	SetReference16
		add	sp, 4
		pop	si
		leave
		retf
sub_B1144		endp
ovr320		ends
