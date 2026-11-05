ovr202		segment	para public 'OVERLAY' use16
		assume cs:ovr202
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_72300		proc far

var_11E		= word ptr -11Eh
var_CE		= word ptr -0CEh
var_71		= dword ptr -71h
var_6D		= dword ptr -6Dh
var_69		= dword ptr -69h
var_61		= dword ptr -61h
var_54		= word ptr -54h
var_52		= word ptr -52h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_6		= byte ptr -6
arg_0		= word ptr  6
arg_2		= dword ptr  8
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 11Eh
		push	si
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_CE]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_CE], 9B5h
		mov	[bp+var_6D], 100h
		mov	[bp+var_71], 0
		mov	[bp+var_CE], 9CDh
		mov	[bp+var_52], 0
		xor	ax, ax
		mov	[bp+var_54], ax
		movsx	eax, ax
		mov	[bp+var_69], eax
		mov	eax, [bp+arg_2]
		mov	[bp+var_12], eax
		push	8
		push	large [bp+var_12]
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		call	sub_37AD
		add	sp, 0Ah
		mov	[bp+var_6], 0
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	si
		call	Debris_FindModelByID
		add	sp, 6
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		cmp	[bp+var_16], 0
		jz	short loc_72381
		jmp	loc_72624

loc_72381:
		mov	byte_5C58D, 0
		push	ds
		push	offset aIff
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		push	ds
		push	offset aOBJECTS
		lea	ax, [bp+var_11E]
		push	ax
		call	Path_BuildDataPath_1F0C4
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_11E]
		push	ax
		lea	ax, [bp+var_CE]
		push	ax
		mov	bx, [bp+var_CE]
		call	dword ptr [bx+14h]
		add	sp, 6
		cmp	[bp+var_61], 4C414552h
		jnz	short loc_723C5
		mov	ax, 1
		jmp	short loc_723C7

loc_723C5:
		xor	ax, ax

loc_723C7:
		or	ax, ax
		jnz	short loc_723CE
		jmp	loc_725F9

loc_723CE:
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_541A0
		pop	cx
		push	0
		push	large 544A424Fh
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jnz	short loc_723F5
		jmp	loc_725CF

loc_723F5:
		push	0
		push	large 4A424F42h
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jz	short loc_72475
		push	1
		push	0
		push	2
		push	large 2Bh
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_1C], dx
		mov	[bp+var_1E], ax
		or	ax, dx
		jz	short loc_7245C
		les	bx, [bp+var_1E]
		mov	word ptr es:[bx], 2799h
		xor	eax, eax
		mov	es:[bx+21h], eax
		mov	es:[bx+1Dh], eax
		mov	es:[bx+25h], al
		lea	ax, [bp+var_CE]
		push	ax
		push	dx
		push	bx
		call	sub_5900F
		add	sp, 6
		mov	dx, [bp+var_1C]
		mov	ax, [bp+var_1E]
		jmp	short loc_72462

loc_7245C:
		mov	dx, [bp+var_1C]
		mov	ax, [bp+var_1E]

loc_72462:
		mov	word ptr [bp+var_16+2], dx
		mov	word ptr [bp+var_16], ax
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		jmp	loc_7257D

loc_72475:
		push	0
		push	large 544E524Fh
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_SeekAndReadB_53D31
		add	sp, 8
		or	ax, ax
		jz	short loc_724FA
		push	1
		push	0
		push	2
		push	large 2Ch
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_20], dx
		mov	[bp+var_22], ax
		or	ax, dx
		jz	short loc_724F1
		les	bx, [bp+var_22]
		mov	word ptr es:[bx], 2799h
		xor	eax, eax
		mov	es:[bx+21h], eax
		mov	es:[bx+1Dh], eax
		mov	es:[bx+25h], al
		push	dx
		push	bx
		call	sub_5900A
		add	sp, 4
		les	bx, [bp+var_22]
		mov	word ptr es:[bx], 27B3h
		lea	ax, [bp+var_CE]
		push	ax
		push	[bp+var_20]
		push	bx
		call	sub_38074
		add	sp, 6
		mov	dx, [bp+var_20]
		mov	ax, [bp+var_22]
		jmp	loc_72462

loc_724F1:
		mov	dx, [bp+var_20]
		mov	ax, [bp+var_22]
		jmp	loc_72462

loc_724FA:
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_59032
		pop	cx
		or	al, al
		jz	short loc_72575
		push	1
		push	0
		push	2
		push	large 2Ch
		push	67B0h
		call	Memory_TypedFreeWrapper_447E1
		add	sp, 0Ch
		mov	[bp+var_24], dx
		mov	[bp+var_26], ax
		or	ax, dx
		jz	short loc_7256C
		les	bx, [bp+var_26]
		mov	word ptr es:[bx], 2799h
		xor	eax, eax
		mov	es:[bx+21h], eax
		mov	es:[bx+1Dh], eax
		mov	es:[bx+25h], al
		push	dx
		push	bx
		call	sub_5900A
		add	sp, 4
		les	bx, [bp+var_26]
		mov	word ptr es:[bx], 27B3h
		lea	ax, [bp+var_CE]
		push	ax
		push	[bp+var_24]
		push	bx
		call	sub_38074
		add	sp, 6
		mov	dx, [bp+var_24]
		mov	ax, [bp+var_26]
		jmp	loc_72462

loc_7256C:
		mov	dx, [bp+var_24]
		mov	ax, [bp+var_26]
		jmp	loc_72462

loc_72575:
		push	0C015h
		call	sub_9D47

loc_7257D:
		pop	cx
		cmp	[bp+var_16], 0
		jz	short loc_725C6
		lea	ax, [bp+var_CE]
		push	ax
		push	large [bp+var_16]
		call	sub_59014
		add	sp, 6
		push	large [bp+var_16]
		push	si
		call	sub_59023
		add	sp, 6
		push	8
		push	ss
		lea	ax, [bp+var_E]
		push	ax
		mov	ax, word ptr [bp+var_16]
		add	ax, 1Dh
		push	word ptr [bp+var_16+2]
		push	ax
		call	sub_37AD
		add	sp, 0Ah
		les	bx, word ptr [bp+var_16]
		mov	byte ptr es:[bx+25h], 0
		jmp	short loc_725CF

loc_725C6:
		push	0C014h
		call	sub_9D47
		pop	cx

loc_725CF:
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_542A4
		pop	cx
		cmp	[bp+var_16], 0
		jz	short loc_72624
		lea	ax, [bp+var_CE]
		push	ax
		call	sub_2F4DC
		pop	cx
		les	bx, word ptr [bp+var_16]
		mov	es:[bx+1Bh], dx
		mov	es:[bx+19h], ax
		jmp	short loc_72624

loc_725F9:
		push	large [bp+arg_2]
		call	sub_3756
		add	sp, 4
		inc	ax
		push	ax
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		push	large [bp+arg_2]
		push	ds
		push	ax
		call	sub_36EC
		add	sp, 8
		push	si
		call	sub_9D78
		pop	cx

loc_72624:
		les	bx, word ptr [bp+var_16]
		mov	al, [bp+arg_6]
		mov	es:[bx+2], al
		mov	eax, [bp+var_16]
		mov	[bp+var_1A], eax
		mov	[bp+var_CE], 9CDh
		lea	ax, [bp+var_CE]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_CE]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	dx, word ptr [bp+var_1A+2]
		mov	ax, word ptr [bp+var_1A]
		pop	si
		leave
		retf
sub_72300		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionText_ReleaseWidgetLabel_A103E (sub_A103E de
; PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à revérifier ici. —
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à MissionText_ReleaseWidgetLabel_94B9E (sub_94B9E de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; appelle Widget_DestructWithLabel et Memory_TypedFree_5C7B6.
; ==============================================================================================
MissionText_ReleaseWidgetLabel_7265F		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_726A1
		push	0
		push	large [bp+arg_0]
		call	sub_59019
		add	sp, 6
		test	si, 1
		jz	short loc_726A1
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_726A1

loc_726A1:
		pop	si
		leave
		retf
MissionText_ReleaseWidgetLabel_7265F		endp
ovr202		ends
