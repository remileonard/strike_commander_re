ovr191		segment	para public 'OVERLAY' use16
		assume cs:ovr191
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_55E10		proc far

var_AE		= word ptr -0AEh
var_51		= dword ptr -51h
var_4D		= dword ptr -4Dh
var_49		= dword ptr -49h
var_3C		= word ptr -3Ch
var_38		= dword ptr -38h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_6		= dword ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0AEh
		push	si
		push	di
		mov	si, [bp+arg_0]
		lea	ax, [bp+var_AE]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_AE], 480h
		mov	[bp+var_4D], 100h
		mov	[bp+var_51], 0
		mov	[bp+var_AE], 498h
		mov	[bp+var_32], 0
		xor	ax, ax
		mov	[bp+var_34], ax
		movsx	eax, ax
		mov	[bp+var_49], eax
		push	1
		mov	ax, si
		add	ax, 44h
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		mov	bx, [bp+var_AE]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 54415453h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		mov	[bp+var_1], 0
		jmp	short loc_55EE6

loc_55E89:
		push	1
		push	large 474E4843h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 4F464E49h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_2], al
		mov	al, [bp+var_2]
		cmp	al, [bp+arg_2]
		jnz	short loc_55ED1
		mov	[bp+var_1], 1
		jmp	short loc_55F16

loc_55ED1:
		mov	eax, [bp+var_38]
		mov	[bp+var_49], eax
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReleaseAndClear_42D38
		add	sp, 2

loc_55EE6:
		cmp	[bp+var_32], 0
		jnz	short loc_55EFB
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadPayload_42DC6
		add	sp, 2
		jmp	short loc_55F0F

loc_55EFB:
		mov	bx, [bp+var_32]
		mov	eax, [bx+0Fh]
		cmp	eax, [bp+var_49]
		jg	short loc_55F0D
		mov	ax, 1
		jmp	short loc_55F0F

loc_55F0D:
		xor	ax, ax

loc_55F0F:
		or	ax, ax
		jnz	short loc_55F16
		jmp	loc_55E89

loc_55F16:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_55F2C
		push	27h
		push	88Eh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_55F2C:
		mov	eax, [bp+var_38]
		mov	[bp+var_49], eax
		push	0
		push	large 48534143h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_55FC2
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_2], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_6], eax
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_55F8C
		cmp	ax, 1
		jz	short loc_55F97
		cmp	ax, 2
		jz	short loc_55FA2
		jmp	short loc_55FAD

loc_55F8C:
		mov	eax, [bp+var_6]
		add	[si+27Ch], eax
		jmp	short loc_55FBA

loc_55F97:
		mov	eax, [bp+var_6]
		sub	[si+27Ch], eax
		jmp	short loc_55FBA

loc_55FA2:
		mov	eax, [bp+var_6]
		mov	[si+27Ch], eax
		jmp	short loc_55FBA

loc_55FAD:
		push	28h
		push	88Eh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_55FBA:
		mov	eax, [bp+var_38]
		mov	[bp+var_49], eax

loc_55FC2:
		push	0
		push	large 5245564Fh
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jz	short loc_56050
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_2], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFieldGroupC_42A91
		shl	eax, 10h
		shrd	eax, edx, 10h
		add	sp, 2
		mov	[bp+var_6], eax
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_5601A
		cmp	ax, 1
		jz	short loc_56025
		cmp	ax, 2
		jz	short loc_56030
		jmp	short loc_5603B

loc_5601A:
		mov	eax, [bp+var_6]
		add	[si+280h], eax
		jmp	short loc_56048

loc_56025:
		mov	eax, [bp+var_6]
		sub	[si+280h], eax
		jmp	short loc_56048

loc_56030:
		mov	eax, [bp+var_6]
		mov	[si+280h], eax
		jmp	short loc_56048

loc_5603B:
		push	28h
		push	88Eh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_56048:
		mov	eax, [bp+var_38]
		mov	[bp+var_49], eax

loc_56050:
		push	0
		push	large 50414557h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_5606C
		jmp	loc_56140

loc_5606C:
		jmp	loc_5610D

loc_5606F:
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_2], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	byte ptr [bp+var_6+3], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	di, ax
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_560B3
		cmp	ax, 1
		jz	short loc_560C2
		cmp	ax, 2
		jz	short loc_560F1
		jmp	short loc_56100

loc_560B3:
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		add	[bx+si+262h], di
		jmp	short loc_5610D

loc_560C2:
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		cmp	[bx+si+262h], di
		jnb	short loc_560E2
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	word ptr [bx+si+262h], 0
		jmp	short loc_560EF

loc_560E2:
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		sub	[bx+si+262h], di

loc_560EF:
		jmp	short loc_5610D

loc_560F1:
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	[bx+si+262h], di
		jmp	short loc_5610D

loc_56100:
		push	29h
		push	88Eh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_5610D:
		test	[bp+var_3C], 1
		jz	short loc_56128
		mov	eax, [bp+var_38]
		dec	eax
		cmp	eax, [bp+var_49]
		jnz	short loc_56126
		inc	[bp+var_49]
		jmp	short loc_56126

loc_56126:
		jmp	short loc_56128

loc_56128:
		mov	eax, [bp+var_49]
		cmp	eax, [bp+var_38]
		jl	short loc_56137
		mov	ax, 1
		jmp	short loc_56139

loc_56137:
		xor	ax, ax

loc_56139:
		or	ax, ax
		jnz	short loc_56140
		jmp	loc_5606F

loc_56140:
		push	0
		push	large 544C4950h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_5615C
		jmp	loc_562F2

loc_5615C:
		jmp	loc_562BF

loc_5615F:
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_2], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	byte ptr [bp+var_6+3], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	byte ptr [bp+var_6+2], al
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	di, ax
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_561B7
		cmp	ax, 1
		jz	short loc_561E2
		cmp	ax, 2
		jnz	short loc_561B4
		jmp	loc_56258

loc_561B4:
		jmp	loc_562B2

loc_561B7:
		cmp	byte ptr [bp+var_6+2], 0
		jnz	short loc_561CF
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		add	[bx+si+2A0h], di
		jmp	short loc_561DF

loc_561CF:
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		add	[bx+si+2A2h], di

loc_561DF:
		jmp	loc_562BF

loc_561E2:
		cmp	byte ptr [bp+var_6+2], 0
		jnz	short loc_56220
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		cmp	[bx+si+2A0h], di
		jnb	short loc_5620E
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		mov	word ptr [bx+si+2A0h], 0
		jmp	short loc_5621E

loc_5620E:
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		sub	[bx+si+2A0h], di

loc_5621E:
		jmp	short loc_56256

loc_56220:
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		cmp	[bx+si+2A2h], di
		jnb	short loc_56246
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		mov	word ptr [bx+si+2A2h], 0
		jmp	short loc_56256

loc_56246:
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		sub	[bx+si+2A2h], di

loc_56256:
		jmp	short loc_562BF

loc_56258:
		cmp	byte ptr [bp+var_6+2], 0
		jnz	short loc_56288
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_56270
		mov	al, byte_4EEA4
		mov	ah, 0
		or	ax, ax
		jz	short loc_56276

loc_56270:
		cmp	byte ptr [bp+var_6+3], 0
		jz	short loc_56286

loc_56276:
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		mov	[bx+si+2A0h], di

loc_56286:
		jmp	short loc_562B0

loc_56288:
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5629A
		mov	al, byte_4EEA4
		mov	ah, 0
		or	ax, ax
		jz	short loc_562A0

loc_5629A:
		cmp	byte ptr [bp+var_6+3], 0
		jz	short loc_562B0

loc_562A0:
		mov	al, byte ptr [bp+var_6+3]
		mov	ah, 0
		mov	dx, 1Ah
		imul	dx
		mov	bx, ax
		mov	[bx+si+2A2h], di

loc_562B0:
		jmp	short loc_562BF

loc_562B2:
		push	2Ah
		push	88Eh
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_562BF:
		test	[bp+var_3C], 1
		jz	short loc_562DA
		mov	eax, [bp+var_38]
		dec	eax
		cmp	eax, [bp+var_49]
		jnz	short loc_562D8
		inc	[bp+var_49]
		jmp	short loc_562D8

loc_562D8:
		jmp	short loc_562DA

loc_562DA:
		mov	eax, [bp+var_49]
		cmp	eax, [bp+var_38]
		jl	short loc_562E9
		mov	ax, 1
		jmp	short loc_562EB

loc_562E9:
		xor	ax, ax

loc_562EB:
		or	ax, ax
		jnz	short loc_562F2
		jmp	loc_5615F

loc_562F2:
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_AE], 498h
		lea	ax, [bp+var_AE]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_AE]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_55E10		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Gameflow_CheckLossConversations_50645 (sub_50645 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE en partie 2026-10-22. Si [partie+3D4h] (avions perdus au total) > 16 : conversation 254
; (assurance perdue) ; sinon si [partie+27Bh] (dword) < 0 : conversation 255. Puis
; sub_4268A(1), [+0E8h] = 0, [+0E7h] = 2.
; ==============================================================================================
Gameflow_CheckLossConversations_56325		proc far

var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 54h
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		cmp	word ptr [si+3D5h], 10h
		jbe	short loc_56344
		mov	[bp+var_2], 0FEh
		jmp	short loc_56350

loc_56344:
		cmp	dword ptr [si+27Ch], 0
		jge	short loc_56350
		mov	[bp+var_2], 0FFh

loc_56350:
		cmp	[bp+var_2], 0
		jz	short loc_5637B
		mov	[bp+var_1], 1
		mov	al, [bp+var_2]
		push	ax
		push	si
		call	sub_47883
		add	sp, 4
		push	1
		call	sub_47FBA
		add	sp, 2
		mov	byte ptr [si+0E9h], 0
		mov	byte ptr [si+0E8h], 2

loc_5637B:
		mov	al, [bp+var_1]
		mov	[bp+var_3], al
		mov	al, [bp+var_3]
		pop	si
		leave
		retf
Gameflow_CheckLossConversations_56325		endp

; START OF FUNCTION CHUNK FOR Gameflow_CheckLossConversations_56325
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR Gameflow_CheckLossConversations_56325

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Marques de victoires peintes sur l'avion (commande 26, SHOW_KILL_MARKS), chunk MARK
; d'OPTIONS ; même suite d'instructions que Gameflow_ShowKillMarks_506AA d'OPTEST, avec en
; plus le switch sur la carte son (byte_4CA58) et le PAK mmusic.
; ==============================================================================================
Gameflow_ShowKillMarks_5638A		proc far

var_314		= word ptr -314h
var_29C		= word ptr -29Ch
var_224		= word ptr -224h
var_207		= word ptr -207h
var_205		= byte ptr -205h
var_202		= word ptr -202h
var_200		= word ptr -200h
var_1FE		= word ptr -1FEh
var_1FC		= word ptr -1FCh
var_1FA		= word ptr -1FAh
var_1F8		= word ptr -1F8h
var_1F4		= word ptr -1F4h
var_197		= dword ptr -197h
var_193		= dword ptr -193h
var_18F		= dword ptr -18Fh
var_17A		= word ptr -17Ah
var_178		= word ptr -178h
var_14C		= word ptr -14Ch
var_14A		= word ptr -14Ah
var_10C		= word ptr -10Ch
var_10A		= word ptr -10Ah
var_B4		= word ptr -0B4h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= byte ptr -58h
var_57		= byte ptr -57h
var_56		= byte ptr -56h
var_55		= byte ptr -55h
var_54		= byte ptr -54h
var_53		= byte ptr -53h
var_52		= byte ptr -52h
var_51		= byte ptr -51h
var_50		= word ptr -50h
var_4E		= byte ptr -4Eh
var_4D		= word ptr -4Dh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= byte ptr -46h
var_42		= word ptr -42h
var_40		= byte ptr -40h
var_3F		= word ptr -3Fh
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= byte ptr -36h
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 314h
		push	si
		push	di
		mov	si, [bp+arg_0]
		call	TextScrollDisplayB_ApplyHelperD_4555C
		call	Input_Flush_116D1
		mov	byte_4F55C, 0
		mov	ax, [si+2A0h]
		mov	[bp+var_2], ax
		mov	ax, [si+2A2h]
		mov	[bp+var_4], ax
		cmp	[bp+var_2], 0BCh
		jbe	short loc_563BF
		mov	[bp+var_2], 0BCh

loc_563BF:
		cmp	[bp+var_4], 80h
		jbe	short loc_563CB
		mov	[bp+var_4], 80h

loc_563CB:
		mov	al, byte_4CA58
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_56430
		shl	bx, 1
		jmp	cs:off_56D4D[bx]	; switch jump

loc_563DF:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_56430

loc_563FA:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_56430

loc_56415:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_56430

loc_56430:
		push	1Bh
		lea	ax, [bp+var_B4]
		push	ax
		call	Speech_LoadBank_2DA0B
		add	sp, 4
		push	seg stub191
		push	offset sub_479A0
		push	1
		push	16h
		push	4
		lea	ax, [bp+var_10C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub191
		push	offset sub_479A0
		push	1
		push	10h
		push	4
		lea	ax, [bp+var_14C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		lea	ax, [bp+var_1F4]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_1F4], 480h
		mov	[bp+var_193], 100h
		mov	[bp+var_197], 0
		mov	[bp+var_1F4], 498h
		mov	[bp+var_178], 0
		xor	ax, ax
		mov	[bp+var_17A], ax
		movsx	eax, ax
		mov	[bp+var_18F], eax
		push	ds
		push	offset aIff
		push	ds
		push	offset aOptions2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_1F4]
		push	ax
		mov	bx, [bp+var_1F4]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 4B52414Dh
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		xor	di, di
		jmp	short loc_56543

loc_5650E:
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 2
		lea	dx, [bp+var_10C]
		add	bx, dx
		mov	[bx], ax
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 2
		lea	dx, [bp+var_10A]
		add	bx, dx
		mov	[bx], ax
		inc	di

loc_56543:
		cmp	di, 16h
		jl	short loc_5650E
		xor	di, di
		jmp	short loc_56581

loc_5654C:
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 2
		lea	dx, [bp+var_14C]
		add	bx, dx
		mov	[bx], ax
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 2
		lea	dx, [bp+var_14A]
		add	bx, dx
		mov	[bx], ax
		inc	di

loc_56581:
		cmp	di, 10h
		jl	short loc_5654C
		mov	[bp+var_202], 0
		mov	[bp+var_200], 0
		mov	[bp+var_1FE], 0
		mov	[bp+var_1FC], 0
		mov	[bp+var_1FA], 13Fh
		mov	[bp+var_1F8], 0C7h
		push	0
		lea	ax, [bp+var_202]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_202]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	word_4D36E
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_224]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		mov	[bp+var_12], 0
		mov	[bp+var_E], 2
		mov	[bp+var_D], 0
		mov	[bp+var_C], 0
		push	3
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	8Dh
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_1C], 0
		mov	[bp+var_18], 2
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	3
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	8Eh
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	13h
		lea	ax, [bp+var_314]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_30], 0
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	3
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	8Fh
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_3A], 0
		mov	[bp+var_36], 2
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		push	2
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	14h
		lea	ax, [bp+var_314]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	[bp+var_3C], ax
		mov	[bp+var_3F], 0
		lea	ax, word ptr [bp+var_3A]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		push	[bp+var_42]
		mov	al, [bp+var_40]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_3C]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_48]
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		jmp	short loc_567DE

loc_567A7:
		mov	ax, [bp+var_207]
		and	al, 3
		mov	byte ptr [bp+var_62+1], al
		cmp	byte ptr [bp+var_62+1], 3
		jnz	short loc_567C0
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+1Bh], 1
		jmp	short loc_567D1

loc_567C0:
		mov	al, byte ptr [bp+var_62+1]
		mov	ah, 0
		mov	[bp+var_64], ax
		mov	bx, [bp+var_3C]
		mov	ax, [bp+var_64]
		mov	[bx+1Bh], ax

loc_567D1:
		lea	ax, [bp+var_224]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_567DE:
		cmp	[bp+var_207], 14h
		jnb	short loc_567EC
		cmp	[bp+var_205], 0
		jz	short loc_567F1

loc_567EC:
		mov	ax, 1
		jmp	short loc_567F3

loc_567F1:
		xor	ax, ax

loc_567F3:
		mov	ah, 0
		or	ax, ax
		jz	short loc_567A7
		push	[bp+var_3C]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	[bp+var_3C], 0
		jz	short loc_56820
		push	3
		push	[bp+var_3C]
		mov	bx, [bp+var_3C]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_56820

loc_56820:
		mov	[bp+var_207], 0
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_4A], ax
		mov	[bp+var_4D], 0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	[bp+var_4A]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_50]
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	ax, [bp+var_2]
		mov	bx, 0Ah
		xor	dx, dx
		div	bx
		mov	[bp+var_51], al
		mov	ax, [bp+var_4]
		mov	bx, 0Ah
		xor	dx, dx
		div	bx
		mov	[bp+var_54], al
		mov	ax, [bp+var_4]
		mov	bx, 0Ah
		xor	dx, dx
		div	bx
		mov	[bp+var_57], dl
		mov	ax, [bp+var_2]
		mov	bx, 0Ah
		xor	dx, dx
		div	bx
		mov	[bp+var_58], dl
		cmp	[bp+var_57], 5
		jb	short loc_568C1
		mov	[bp+var_55], 1
		mov	al, [bp+var_57]
		add	al, 0FBh
		mov	[bp+var_56], al
		jmp	short loc_568CB

loc_568C1:
		mov	[bp+var_55], 0
		mov	al, [bp+var_57]
		mov	[bp+var_56], al

loc_568CB:
		cmp	[bp+var_58], 5
		jb	short loc_568DF
		mov	[bp+var_52], 1
		mov	al, [bp+var_58]
		add	al, 0FBh
		mov	[bp+var_53], al
		jmp	short loc_568E9

loc_568DF:
		mov	[bp+var_52], 0
		mov	al, [bp+var_58]
		mov	[bp+var_53], al

loc_568E9:
		xor	di, di
		jmp	short loc_5692B

loc_568ED:
		push	2
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	[bp+var_62]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	di

loc_5692B:
		mov	al, [bp+var_51]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_568ED
		mov	al, [bp+var_51]
		mov	ah, 0
		mov	di, ax
		jmp	short loc_5697B

loc_5693D:
		push	1
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	[bp+var_62]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	di

loc_5697B:
		mov	al, [bp+var_51]
		mov	ah, 0
		mov	dl, [bp+var_52]
		mov	dh, 0
		add	ax, dx
		cmp	ax, di
		jg	short loc_5693D
		mov	al, [bp+var_51]
		mov	ah, 0
		mov	dl, [bp+var_52]
		mov	dh, 0
		add	ax, dx
		mov	di, ax
		jmp	short loc_569D9

loc_5699B:
		push	0
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	[bp+var_62]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	di

loc_569D9:
		mov	al, [bp+var_51]
		mov	ah, 0
		mov	dl, [bp+var_52]
		mov	dh, 0
		add	ax, dx
		mov	dl, [bp+var_53]
		mov	dh, 0
		add	ax, dx
		cmp	ax, di
		jg	short loc_5699B
		xor	di, di
		jmp	short loc_56A32

loc_569F4:
		push	5
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	[bp+var_62]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	di

loc_56A32:
		mov	al, [bp+var_54]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_569F4
		mov	al, [bp+var_54]
		mov	ah, 0
		mov	di, ax
		jmp	short loc_56A82

loc_56A44:
		push	4
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	[bp+var_62]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	di

loc_56A82:
		mov	al, [bp+var_54]
		mov	ah, 0
		mov	dl, [bp+var_55]
		mov	dh, 0
		add	ax, dx
		cmp	ax, di
		jg	short loc_56A44
		mov	al, [bp+var_54]
		mov	ah, 0
		mov	dl, [bp+var_55]
		mov	dh, 0
		add	ax, dx
		mov	di, ax
		jmp	short loc_56AE0

loc_56AA2:
		push	3
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	[bp+var_62]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	di

loc_56AE0:
		mov	al, [bp+var_54]
		mov	ah, 0
		mov	dl, [bp+var_55]
		mov	dh, 0
		add	ax, dx
		mov	dl, [bp+var_56]
		mov	dh, 0
		add	ax, dx
		cmp	ax, di
		jg	short loc_56AA2
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_48]
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		lea	ax, [bp+var_224]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		xor	eax, eax
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		mov	[bp+var_5C], 12Ch
		mov	eax, dword_4DE15
		mov	[bp+var_60], eax
		jmp	short loc_56B4F

loc_56B44:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_56B4F
		jmp	short loc_56B6B

loc_56B4F:
		mov	eax, [bp+var_60]
		add	eax, [bp+var_5C]
		cmp	eax, dword_4DE15
		ja	short loc_56B63
		mov	ax, 1
		jmp	short loc_56B65

loc_56B63:
		xor	ax, ax

loc_56B65:
		mov	ah, 0
		or	ax, ax
		jz	short loc_56B44

loc_56B6B:
		lea	ax, [bp+var_314]
		push	ax
		call	sub_4123E
		add	sp, 2
		lea	ax, [bp+var_29C]
		push	ax
		call	sub_4123E
		add	sp, 2
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		call	sub_2DA30
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_35], 0
		jz	short loc_56BED
		cmp	[bp+var_3A], 0
		jz	short loc_56BED
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_56BED

loc_56BED:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		cmp	[bp+var_2B], 0
		jz	short loc_56C25
		cmp	[bp+var_30], 0
		jz	short loc_56C25
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_56C25

loc_56C25:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		cmp	[bp+var_21], 0
		jz	short loc_56C5D
		cmp	[bp+var_26], 0
		jz	short loc_56C5D
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_56C5D

loc_56C5D:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_17], 0
		jz	short loc_56C95
		cmp	[bp+var_1C], 0
		jz	short loc_56C95
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_56C95

loc_56C95:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		cmp	[bp+var_D], 0
		jz	short loc_56CCD
		cmp	[bp+var_12], 0
		jz	short loc_56CCD
		push	0
		mov	al, [bp+var_E]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_56CCD

loc_56CCD:
		mov	[bp+var_12], 0
		mov	[bp+var_D], 0
		mov	[bp+var_C], 0
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	0
		lea	ax, [bp+var_224]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_202]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		mov	[bp+var_1F4], 498h
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_1F4]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_ShowKillMarks_5638A		endp

; START OF FUNCTION CHUNK FOR Gameflow_ShowKillMarks_5638A
off_56D4D	dw offset loc_563DF
		dw offset loc_56415
		dw offset loc_563FA
		dw offset loc_56415
		dw offset loc_56415
; END OF FUNCTION CHUNK FOR Gameflow_ShowKillMarks_5638A

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Second écran des marques de victoires (commande 45, Tactical Operations) : même code
; que Gameflow_ShowKillMarks_5638A, mais charge en plus GAMEFLOW\\OPTSHPS2.PAK et
; GAMEFLOW\\OPTPALS2.PAK et prend d'autres entrées d'images (13 au lieu de 143, 1 au lieu de
; 20).
; ==============================================================================================
Gameflow_ShowKillMarksAlt_56D57		proc far

var_404		= word ptr -404h
var_38C		= word ptr -38Ch
var_314		= word ptr -314h
var_29C		= word ptr -29Ch
var_224		= word ptr -224h
var_207		= word ptr -207h
var_205		= byte ptr -205h
var_202		= word ptr -202h
var_200		= word ptr -200h
var_1FE		= word ptr -1FEh
var_1FC		= word ptr -1FCh
var_1FA		= word ptr -1FAh
var_1F8		= word ptr -1F8h
var_1F4		= word ptr -1F4h
var_197		= dword ptr -197h
var_193		= dword ptr -193h
var_18F		= dword ptr -18Fh
var_17A		= word ptr -17Ah
var_178		= word ptr -178h
var_14C		= word ptr -14Ch
var_14A		= word ptr -14Ah
var_10C		= word ptr -10Ch
var_10A		= word ptr -10Ah
var_B4		= word ptr -0B4h
var_64		= word ptr -64h
var_62		= word ptr -62h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= byte ptr -58h
var_57		= byte ptr -57h
var_56		= byte ptr -56h
var_55		= byte ptr -55h
var_54		= byte ptr -54h
var_53		= byte ptr -53h
var_52		= byte ptr -52h
var_51		= byte ptr -51h
var_50		= word ptr -50h
var_4E		= byte ptr -4Eh
var_4D		= word ptr -4Dh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= byte ptr -46h
var_42		= word ptr -42h
var_40		= byte ptr -40h
var_3F		= word ptr -3Fh
var_3C		= word ptr -3Ch
var_3A		= dword ptr -3Ah
var_36		= byte ptr -36h
var_35		= byte ptr -35h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= byte ptr -2Ch
var_2B		= byte ptr -2Bh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= byte ptr -18h
var_17		= byte ptr -17h
var_16		= dword ptr -16h
var_12		= dword ptr -12h
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 404h
		push	si
		push	di
		mov	si, [bp+arg_0]
		call	TextScrollDisplayB_ApplyHelperD_4555C
		call	Input_Flush_116D1
		mov	byte_4F55C, 0
		mov	ax, [si+2A0h]
		mov	[bp+var_2], ax
		mov	ax, [si+2A2h]
		mov	[bp+var_4], ax
		cmp	[bp+var_2], 0BCh
		jbe	short loc_56D8C
		mov	[bp+var_2], 0BCh

loc_56D8C:
		cmp	[bp+var_4], 80h
		jbe	short loc_56D98
		mov	[bp+var_4], 80h

loc_56D98:
		mov	al, byte_4CA58
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		ja	short loc_56DFD
		shl	bx, 1
		jmp	cs:off_57791[bx]	; switch jump

loc_56DAC:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_56DFD

loc_56DC7:
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_56DFD

loc_56DE2:
		push	ds
		push	offset aPak
		push	ds
		push	offset aMmusic
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		jmp	short loc_56DFD

loc_56DFD:
		push	1Bh
		lea	ax, [bp+var_B4]
		push	ax
		call	Speech_LoadBank_2DA0B
		add	sp, 4
		push	seg stub191
		push	offset sub_479A0
		push	1
		push	16h
		push	4
		lea	ax, [bp+var_10C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub191
		push	offset sub_479A0
		push	1
		push	10h
		push	4
		lea	ax, [bp+var_14C]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		lea	ax, [bp+var_1F4]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_1F4], 480h
		mov	[bp+var_193], 100h
		mov	[bp+var_197], 0
		mov	[bp+var_1F4], 498h
		mov	[bp+var_178], 0
		xor	ax, ax
		mov	[bp+var_17A], ax
		movsx	eax, ax
		mov	[bp+var_18F], eax
		push	ds
		push	offset aIff
		push	ds
		push	offset aOptions2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_1F4]
		push	ax
		mov	bx, [bp+var_1F4]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 4B52414Dh
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		push	0
		push	large 41544144h
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		xor	di, di
		jmp	short loc_56F10

loc_56EDB:
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 2
		lea	dx, [bp+var_10C]
		add	bx, dx
		mov	[bx], ax
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 2
		lea	dx, [bp+var_10A]
		add	bx, dx
		mov	[bx], ax
		inc	di

loc_56F10:
		cmp	di, 16h
		jl	short loc_56EDB
		xor	di, di
		jmp	short loc_56F4E

loc_56F19:
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 2
		lea	dx, [bp+var_14C]
		add	bx, dx
		mov	[bx], ax
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_ReadFieldGroupB_42A67
		add	sp, 2
		mov	bx, di
		shl	bx, 2
		lea	dx, [bp+var_14A]
		add	bx, dx
		mov	[bx], ax
		inc	di

loc_56F4E:
		cmp	di, 10h
		jl	short loc_56F19
		mov	[bp+var_202], 0
		mov	[bp+var_200], 0
		mov	[bp+var_1FE], 0
		mov	[bp+var_1FC], 0
		mov	[bp+var_1FA], 13Fh
		mov	[bp+var_1F8], 0C7h
		push	0
		lea	ax, [bp+var_202]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		lea	ax, [bp+var_202]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	word_4D36E
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_224]
		push	ax
		call	Scene_Create_10E57
		add	sp, 8
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals2
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_B4]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B4]
		push	ax
		lea	ax, [bp+var_404]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		mov	[bp+var_12], 0
		mov	[bp+var_E], 2
		mov	[bp+var_D], 0
		mov	[bp+var_C], 0
		push	3
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	8Dh
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_1C], 0
		mov	[bp+var_18], 2
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		push	3
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	8Eh
		lea	ax, [bp+var_29C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	13h
		lea	ax, [bp+var_38C]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_30], 0
		mov	[bp+var_2C], 2
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		push	3
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	0Dh
		lea	ax, [bp+var_314]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_3A], 0
		mov	[bp+var_36], 2
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		push	2
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	1
		lea	ax, [bp+var_404]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	0
		call	OverlayImageLayer_Construct_F227
		add	sp, 0Ah
		mov	[bp+var_3C], ax
		mov	[bp+var_3F], 0
		lea	ax, word ptr [bp+var_3A]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	100h
		push	0
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		push	[bp+var_42]
		mov	al, [bp+var_40]
		push	ax
		lea	ax, [bp+var_42]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		push	[bp+var_3C]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_48]
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		jmp	short loc_57204

loc_571CD:
		mov	ax, [bp+var_207]
		and	al, 3
		mov	byte ptr [bp+var_62+1], al
		cmp	byte ptr [bp+var_62+1], 3
		jnz	short loc_571E6
		mov	bx, [bp+var_3C]
		mov	word ptr [bx+1Bh], 1
		jmp	short loc_571F7

loc_571E6:
		mov	al, byte ptr [bp+var_62+1]
		mov	ah, 0
		mov	[bp+var_64], ax
		mov	bx, [bp+var_3C]
		mov	ax, [bp+var_64]
		mov	[bx+1Bh], ax

loc_571F7:
		lea	ax, [bp+var_224]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2

loc_57204:
		cmp	[bp+var_207], 14h
		jnb	short loc_57212
		cmp	[bp+var_205], 0
		jz	short loc_57217

loc_57212:
		mov	ax, 1
		jmp	short loc_57219

loc_57217:
		xor	ax, ax

loc_57219:
		mov	ah, 0
		or	ax, ax
		jz	short loc_571CD
		push	[bp+var_3C]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		cmp	[bp+var_3C], 0
		jz	short loc_57246
		push	3
		push	[bp+var_3C]
		mov	bx, [bp+var_3C]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_57246

loc_57246:
		mov	[bp+var_207], 0
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_4A], ax
		mov	[bp+var_4D], 0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_LoadFromResource_34A89
		add	sp, 4
		push	[bp+var_4A]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_50]
		mov	al, [bp+var_4E]
		push	ax
		lea	ax, [bp+var_50]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_CopyInto_34D24
		add	sp, 8
		mov	ax, [bp+var_2]
		mov	bx, 0Ah
		xor	dx, dx
		div	bx
		mov	[bp+var_51], al
		mov	ax, [bp+var_4]
		mov	bx, 0Ah
		xor	dx, dx
		div	bx
		mov	[bp+var_54], al
		mov	ax, [bp+var_4]
		mov	bx, 0Ah
		xor	dx, dx
		div	bx
		mov	[bp+var_57], dl
		mov	ax, [bp+var_2]
		mov	bx, 0Ah
		xor	dx, dx
		div	bx
		mov	[bp+var_58], dl
		cmp	[bp+var_57], 5
		jb	short loc_572E7
		mov	[bp+var_55], 1
		mov	al, [bp+var_57]
		add	al, 0FBh
		mov	[bp+var_56], al
		jmp	short loc_572F1

loc_572E7:
		mov	[bp+var_55], 0
		mov	al, [bp+var_57]
		mov	[bp+var_56], al

loc_572F1:
		cmp	[bp+var_58], 5
		jb	short loc_57305
		mov	[bp+var_52], 1
		mov	al, [bp+var_58]
		add	al, 0FBh
		mov	[bp+var_53], al
		jmp	short loc_5730F

loc_57305:
		mov	[bp+var_52], 0
		mov	al, [bp+var_58]
		mov	[bp+var_53], al

loc_5730F:
		xor	di, di
		jmp	short loc_57351

loc_57313:
		push	2
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	[bp+var_62]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	di

loc_57351:
		mov	al, [bp+var_51]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_57313
		mov	al, [bp+var_51]
		mov	ah, 0
		mov	di, ax
		jmp	short loc_573A1

loc_57363:
		push	1
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	[bp+var_62]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	di

loc_573A1:
		mov	al, [bp+var_51]
		mov	ah, 0
		mov	dl, [bp+var_52]
		mov	dh, 0
		add	ax, dx
		cmp	ax, di
		jg	short loc_57363
		mov	al, [bp+var_51]
		mov	ah, 0
		mov	dl, [bp+var_52]
		mov	dh, 0
		add	ax, dx
		mov	di, ax
		jmp	short loc_573FF

loc_573C1:
		push	0
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_10C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	[bp+var_62]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	di

loc_573FF:
		mov	al, [bp+var_51]
		mov	ah, 0
		mov	dl, [bp+var_52]
		mov	dh, 0
		add	ax, dx
		mov	dl, [bp+var_53]
		mov	dh, 0
		add	ax, dx
		cmp	ax, di
		jg	short loc_573C1
		xor	di, di
		jmp	short loc_57458

loc_5741A:
		push	5
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	[bp+var_62]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	di

loc_57458:
		mov	al, [bp+var_54]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_5741A
		mov	al, [bp+var_54]
		mov	ah, 0
		mov	di, ax
		jmp	short loc_574A8

loc_5746A:
		push	4
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	[bp+var_62]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	di

loc_574A8:
		mov	al, [bp+var_54]
		mov	ah, 0
		mov	dl, [bp+var_55]
		mov	dh, 0
		add	ax, dx
		cmp	ax, di
		jg	short loc_5746A
		mov	al, [bp+var_54]
		mov	ah, 0
		mov	dl, [bp+var_55]
		mov	dh, 0
		add	ax, dx
		mov	di, ax
		jmp	short loc_57506

loc_574C8:
		push	3
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14A]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, di
		shl	bx, 2
		lea	ax, [bp+var_14C]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_62], ax
		push	[bp+var_62]
		lea	ax, [bp+var_224]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	di

loc_57506:
		mov	al, [bp+var_54]
		mov	ah, 0
		mov	dl, [bp+var_55]
		mov	dh, 0
		add	ax, dx
		mov	dl, [bp+var_56]
		mov	dh, 0
		add	ax, dx
		cmp	ax, di
		jg	short loc_574C8
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		push	0
		push	[bp+var_48]
		mov	al, [bp+var_46]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		lea	ax, [bp+var_224]
		push	ax
		call	Scene_Tick_10F4B
		add	sp, 2
		xor	eax, eax
		mov	[bp+var_5C], eax
		mov	[bp+var_60], eax
		mov	[bp+var_5C], 12Ch
		mov	eax, dword_4DE15
		mov	[bp+var_60], eax
		jmp	short loc_57575

loc_5756A:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_57575
		jmp	short loc_57591

loc_57575:
		mov	eax, [bp+var_60]
		add	eax, [bp+var_5C]
		cmp	eax, dword_4DE15
		ja	short loc_57589
		mov	ax, 1
		jmp	short loc_5758B

loc_57589:
		xor	ax, ax

loc_5758B:
		mov	ah, 0
		or	ax, ax
		jz	short loc_5756A

loc_57591:
		lea	ax, [bp+var_38C]
		push	ax
		call	sub_4123E
		add	sp, 2
		lea	ax, [bp+var_29C]
		push	ax
		call	sub_4123E
		add	sp, 2
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		call	sub_2DA30
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		lea	ax, [bp+var_50]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_48]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		lea	ax, [bp+var_42]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_35], 0
		jz	short loc_57613
		cmp	[bp+var_3A], 0
		jz	short loc_57613
		push	0
		mov	al, [bp+var_36]
		push	ax
		lea	ax, word ptr [bp+var_3A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_57613

loc_57613:
		mov	[bp+var_3A], 0
		mov	[bp+var_35], 0
		mov	[bp+var_34], 0
		cmp	[bp+var_2B], 0
		jz	short loc_5764B
		cmp	[bp+var_30], 0
		jz	short loc_5764B
		push	0
		mov	al, [bp+var_2C]
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5764B

loc_5764B:
		mov	[bp+var_30], 0
		mov	[bp+var_2B], 0
		mov	[bp+var_2A], 0
		cmp	[bp+var_21], 0
		jz	short loc_57683
		cmp	[bp+var_26], 0
		jz	short loc_57683
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_57683

loc_57683:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		cmp	[bp+var_17], 0
		jz	short loc_576BB
		cmp	[bp+var_1C], 0
		jz	short loc_576BB
		push	0
		mov	al, [bp+var_18]
		push	ax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_576BB

loc_576BB:
		mov	[bp+var_1C], 0
		mov	[bp+var_17], 0
		mov	[bp+var_16], 0
		cmp	[bp+var_D], 0
		jz	short loc_576F3
		cmp	[bp+var_12], 0
		jz	short loc_576F3
		push	0
		mov	al, [bp+var_E]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_576F3

loc_576F3:
		mov	[bp+var_12], 0
		mov	[bp+var_D], 0
		mov	[bp+var_C], 0
		push	2
		lea	ax, [bp+var_404]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_38C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_314]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_29C]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	0
		lea	ax, [bp+var_224]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		lea	ax, [bp+var_8]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_202]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		mov	[bp+var_1F4], 498h
		lea	ax, [bp+var_1F4]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_1F4]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_ShowKillMarksAlt_56D57		endp

; START OF FUNCTION CHUNK FOR Gameflow_ShowKillMarksAlt_56D57
off_57791	dw offset loc_56DAC
		dw offset loc_56DE2
		dw offset loc_56DC7
		dw offset loc_56DE2
		dw offset loc_56DE2
; END OF FUNCTION CHUNK FOR Gameflow_ShowKillMarksAlt_56D57

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, LUE 2026-11-08 (noms des pilotes). Tableau des victoires (commande 19
; LOOK_AT_KILLBOARD, police boardfnt), équivalent de Gameflow_KillBoard_51049 d'OPTEST. Copie
; d'abord 8 pointeurs de noms depuis DS:08B0h dans un tableau local (mov si, 8B0h / lea di,
; [bp+var_268] / mov cx, 8 / rep movsw), puis pour chaque pilote affiché (fiche de 26 octets,
; [+2A4h] ≠ 0) : pilote 0 = indicatif du joueur (var_258), sinon nom du tableau local. Table
; (dseg, lue dans source/topttst1.asm) : 0 chaîne vide, 1 PRIMETIME, 2 PHOENIX, 3 BASELINE, 4
; ZORRO, 5 TEX, 6 TEFLON, 7 HAWK.
; ==============================================================================================
Gameflow_KillBoard_5779B		proc far

var_286		= word ptr -286h
var_268		= word ptr -268h
var_258		= word ptr -258h
var_244		= word ptr -244h
var_21C		= word ptr -21Ch
var_21A		= word ptr -21Ah
var_202		= word ptr -202h
var_200		= word ptr -200h
var_1EC		= byte ptr -1ECh
var_1E8		= word ptr -1E8h
var_1D8		= word ptr -1D8h
var_1D6		= word ptr -1D6h
var_1D4		= word ptr -1D4h
var_1D0		= word ptr -1D0h
var_1CE		= word ptr -1CEh
var_1CC		= word ptr -1CCh
var_1CA		= word ptr -1CAh
var_1C8		= word ptr -1C8h
var_1C6		= word ptr -1C6h
var_1C2		= word ptr -1C2h
var_1A2		= word ptr -1A2h
var_12A		= word ptr -12Ah
var_B2		= word ptr -0B2h
var_62		= word ptr -62h
var_60		= word ptr -60h
var_52		= word ptr -52h
var_4C		= word ptr -4Ch
var_48		= word ptr -48h
var_46		= word ptr -46h
var_44		= word ptr -44h
var_41		= byte ptr -41h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_2F		= byte ptr -2Fh
var_2E		= word ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= byte ptr -1Ah
var_19		= word ptr -19h
var_16		= dword ptr -16h
var_12		= byte ptr -12h
var_11		= byte ptr -11h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 286h
		push	si
		push	di
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	si, 8A0h
		lea	di, [bp+var_62]
		push	ss
		pop	es
		mov	cx, 8
		rep movsw
		mov	[bp+var_2], 0
		jmp	loc_5787F

loc_577C7:
		xor	cx, cx
		jmp	loc_5786F

loc_577CC:
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, [bx+2A0h]
		mov	bx, cx
		shl	bx, 1
		lea	dx, [bp+var_62]
		add	bx, dx
		push	ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		pop	ax
		add	ax, [bx+2A2h]
		mov	si, ax
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_60]
		add	bx, ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	ax, [bx+2A0h]
		mov	bx, cx
		shl	bx, 1
		lea	dx, [bp+var_60]
		add	bx, dx
		push	ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		pop	ax
		add	ax, [bx+2A2h]
		mov	di, ax
		cmp	di, si
		jle	short loc_5786E
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	ax, [bx]
		mov	[bp+var_44], ax
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_60]
		add	bx, ax
		mov	ax, [bx]
		mov	bx, cx
		shl	bx, 1
		lea	dx, [bp+var_62]
		add	bx, dx
		mov	[bx], ax
		mov	bx, cx
		shl	bx, 1
		lea	ax, [bp+var_60]
		add	bx, ax
		mov	ax, [bp+var_44]
		mov	[bx], ax

loc_5786E:
		inc	cx

loc_5786F:
		mov	ax, 7
		sub	ax, [bp+var_2]
		cmp	ax, cx
		jle	short loc_5787C
		jmp	loc_577CC

loc_5787C:
		inc	[bp+var_2]

loc_5787F:
		cmp	[bp+var_2], 7
		jge	short loc_57888
		jmp	loc_577C7

loc_57888:
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_B2]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_12A]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptpals
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_B2]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_B2]
		push	ax
		lea	ax, [bp+var_1A2]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		mov	[bp+var_C], 0
		mov	[bp+var_8], 2
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	3
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	7Bh
		lea	ax, [bp+var_12A]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, word ptr [bp+var_C]
		push	ax
		lea	ax, [bp+var_1C2]
		push	ax
		call	sub_34FCB
		add	sp, 4
		mov	[bp+var_16], 0
		mov	[bp+var_12], 2
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	16h
		lea	ax, [bp+var_1A2]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		mov	[bp+var_1C], 0
		mov	[bp+var_19], 0
		lea	ax, word ptr [bp+var_16]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_LoadAndUpload_34E04
		add	sp, 4
		mov	[bp+var_1D0], 0
		mov	[bp+var_1CE], 0
		mov	[bp+var_1CC], 0
		mov	[bp+var_1CA], 0
		mov	[bp+var_1C8], 13Fh
		mov	[bp+var_1C6], 0C7h
		push	0
		lea	ax, [bp+var_1D0]
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		push	ds
		push	offset aShp
		push	ds
		push	offset aBoardfnt
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_B2]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_B2]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_2A+2], dx
		mov	word ptr [bp+var_2A], ax
		mov	eax, [bp+var_2A]
		mov	[bp+var_26], eax
		mov	[bp+var_22], 2
		mov	[bp+var_21], 1
		mov	[bp+var_20], 0
		lea	ax, word ptr [bp+var_26]
		push	ax
		lea	ax, [bp+var_1E8]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		mov	[bp+var_1D8], 0
		mov	[bp+var_1D6], 0
		push	2Dh
		lea	ax, [bp+var_1E8]
		push	ax
		mov	bx, [bp+var_1E8]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_1D4], ax
		lea	ax, [bp+var_1E8]
		push	ax
		lea	ax, [bp+var_1D0]
		push	ax
		lea	ax, [bp+var_202]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		lea	ax, [bp+var_1D0]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	0
		push	[bp+var_1C]
		mov	al, [bp+var_1A]
		push	ax
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Upload_34B85
		add	sp, 8
		push	0
		push	word_4D36E
		call	TextScrollDisplayB_ApplyHelperA_45482
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_45522
		mov	bx, [bp+arg_0]
		push	word ptr [bx+0E5h]
		lea	ax, [bp+var_1D0]
		push	ax
		lea	ax, [bp+var_21C]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		mov	bx, [bp+arg_0]
		cmp	byte ptr [bx+0FDh], 0Dh
		jnz	short loc_57A97
		push	8C9h
		lea	ax, [bp+var_244]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_57AA7

loc_57A97:
		push	8DAh
		lea	ax, [bp+var_244]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_57AA7:
		mov	[bp+var_2F], 0
		mov	[bp+var_1EC], 4
		mov	[bp+var_32], 8E9h
		mov	[bp+var_34], 8F0h
		push	[bp+var_32]
		lea	ax, [bp+var_202]
		push	ax
		call	sub_375EF
		add	sp, 4
		mov	[bp+var_36], ax
		push	[bp+var_34]
		lea	ax, [bp+var_202]
		push	ax
		call	sub_375EF
		add	sp, 4
		mov	[bp+var_38], ax
		mov	ax, [bp+arg_0]
		add	ax, 3C1h
		push	ax
		lea	ax, [bp+var_258]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		lea	ax, [bp+var_258]
		push	ax
		call	CRT_Strupr_2E71
		add	sp, 2
		jmp	short loc_57B1C

loc_57B03:
		lea	ax, [bp+var_258]
		push	ax
		call	CRT_Strlen
		add	sp, 2
		dec	ax
		lea	dx, [bp+var_258]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_57B1C:
		lea	ax, [bp+var_258]
		push	ax
		lea	ax, [bp+var_202]
		push	ax
		call	sub_375EF
		add	sp, 4
		cmp	ax, 8Ch
		jle	short loc_57B3A
		cmp	byte ptr [bp+var_258], 0
		jnz	short loc_57B03

loc_57B3A:
		xor	eax, eax
		mov	[bp+var_3C], eax
		mov	[bp+var_40], eax
		mov	[bp+var_3C], 3
		mov	eax, dword_4DE15
		mov	[bp+var_40], eax
		mov	[bp+var_41], 0

loc_57B59:
		mov	eax, [bp+var_40]
		add	eax, [bp+var_3C]
		cmp	eax, dword_4DE15
		ja	short loc_57B6D
		mov	ax, 1
		jmp	short loc_57B6F

loc_57B6D:
		xor	ax, ax

loc_57B6F:
		or	al, al
		jnz	short loc_57B76
		jmp	loc_57D7B

loc_57B76:
		call	sub_11A88
		mov	[bp+var_3C], 3
		mov	eax, dword_4DE15
		mov	[bp+var_40], eax
		mov	[bp+var_44], 0Fh
		mov	[bp+var_46], 3Ch
		lea	ax, [bp+var_1C2]
		push	ax
		call	sub_355B7
		add	sp, 2
		push	[bp+var_32]
		push	2Dh
		mov	ax, 0FAh
		sub	ax, [bp+var_36]
		push	ax
		push	8F4h
		lea	ax, [bp+var_202]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		push	[bp+var_34]
		push	2Dh
		mov	ax, 122h
		sub	ax, [bp+var_38]
		push	ax
		push	8FBh
		lea	ax, [bp+var_202]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		mov	si, 8B0h
		lea	di, [bp+var_268]
		push	ss
		pop	es
		mov	cx, 8
		rep movsw
		mov	[bp+var_2], 0
		jmp	loc_57D29

loc_57BF0:
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	word ptr [bx+2A4h], 0
		jnz	short loc_57C10
		jmp	loc_57D26

loc_57C10:
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		cmp	word ptr [bx], 0
		jnz	short loc_57C33
		lea	ax, [bp+var_258]
		push	ax
		lea	ax, [bp+var_286]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	short loc_57C56

loc_57C33:
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	bx, [bx]
		shl	bx, 1
		lea	ax, [bp+var_268]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_286]
		push	ax
		call	CRT_Strcpy
		add	sp, 4

loc_57C56:
		lea	ax, [bp+var_286]
		push	ax
		push	[bp+var_46]
		push	53h
		push	934h
		lea	ax, [bp+var_202]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		push	0Ah
		lea	ax, [bp+var_4C]
		push	ax
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr [bx+2A2h]
		call	CRT_Itoa_Signed10
		add	sp, 6
		push	0Ah
		lea	ax, [bp+var_52]
		push	ax
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_62]
		add	bx, ax
		mov	ax, [bx]
		mov	dx, 1Ah
		imul	dx
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr [bx+2A0h]
		call	CRT_Itoa_Signed10
		add	sp, 6
		lea	ax, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_202]
		push	ax
		call	sub_375EF
		add	sp, 4
		mov	si, ax
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_202]
		push	ax
		call	sub_375EF
		add	sp, 4
		mov	di, ax
		lea	ax, [bp+var_4C]
		push	ax
		push	[bp+var_46]
		mov	ax, 0FAh
		sub	ax, si
		push	ax
		push	93Bh
		lea	ax, [bp+var_202]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		lea	ax, [bp+var_52]
		push	ax
		push	[bp+var_46]
		mov	ax, 122h
		sub	ax, di
		push	ax
		push	942h
		lea	ax, [bp+var_202]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		mov	ax, [bp+var_44]
		add	[bp+var_46], ax

loc_57D26:
		inc	[bp+var_2]

loc_57D29:
		cmp	[bp+var_2], 8
		jge	short loc_57D32
		jmp	loc_57BF0

loc_57D32:
		cmp	[bp+var_2F], 0
		jz	short loc_57D52
		lea	ax, [bp+var_244]
		push	ax
		push	0AFh
		push	2
		push	949h
		lea	ax, [bp+var_21C]
		push	ax
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah

loc_57D52:
		push	word_4D36C
		call	sub_45695
		add	sp, 2
		lea	ax, [bp+var_1D0]
		push	ax
		push	word_4D36E
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		push	word_4D36C
		call	sub_456A7
		add	sp, 2

loc_57D7B:
		mov	byte ptr [bp+var_48], 0
		lea	ax, [bp+var_48]
		push	ax
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte ptr [bp+var_48], 0
		jnz	short loc_57DB7
		lea	ax, [bp+var_48]
		push	ax
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_57DB5
		lea	ax, [bp+var_4C]
		push	ax
		lea	ax, [bp+var_48]
		push	ax
		call	sub_A981
		add	sp, 4
		jmp	short loc_57DB5

loc_57DB5:
		jmp	short loc_57DB7

loc_57DB7:
		cmp	byte ptr [bp+var_48], 0
		jz	short loc_57DE3
		mov	dx, [bp+var_46]
		mov	bx, [bp+var_44]
		or	dx, dx
		jle	short loc_57DDF
		cmp	dx, 280h
		jge	short loc_57DDF
		cmp	bx, 96h
		jle	short loc_57DDF
		cmp	bx, 0C8h
		jge	short loc_57DDF
		mov	[bp+var_2F], 1
		jmp	short loc_57DE3

loc_57DDF:
		mov	[bp+var_2F], 0

loc_57DE3:
		cmp	[bp+var_2F], 0
		jz	short loc_57E02
		cmp	word_4F7D6, 1
		jnz	short loc_57E00
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	word_4F7D6, 0
		call	TextScrollDisplayB_ApplyHelperC_45522

loc_57E00:
		jmp	short loc_57E19

loc_57E02:
		cmp	word_4F7D6, 0
		jnz	short loc_57E19
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	word_4F7D6, 1
		call	TextScrollDisplayB_ApplyHelperC_45522

loc_57E19:
		cmp	byte ptr [bp+var_48], 2
		jnz	short loc_57E27
		cmp	[bp+var_2F], 0
		jz	short loc_57E27
		jmp	short loc_57E38

loc_57E27:
		cmp	byte ptr [bp+var_4C], 2
		jnz	short loc_57E35
		cmp	byte ptr [bp+var_4C+1], 1
		jnz	short loc_57E35
		jmp	short loc_57E38

loc_57E35:
		jmp	loc_57B59

loc_57E38:
		call	TextScrollDisplayB_ApplyHelperD_4555C
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		lea	ax, [bp+var_21A]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_2E]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		lea	ax, [bp+var_200]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_1E8]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_57EA4
		cmp	[bp+var_26], 0
		jz	short loc_57EA4
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_57EA4

loc_57EA4:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		lea	ax, [bp+var_1D0]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_1C]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		cmp	[bp+var_11], 0
		jz	short loc_57EF5
		cmp	[bp+var_16], 0
		jz	short loc_57EF5
		push	0
		mov	al, [bp+var_12]
		push	ax
		lea	ax, word ptr [bp+var_16]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_57EF5

loc_57EF5:
		mov	[bp+var_16], 0
		mov	[bp+var_11], 0
		mov	[bp+var_10], 0
		push	2
		lea	ax, [bp+var_1C2]
		push	ax
		call	CachedObject_Destruct_351AB
		add	sp, 4
		cmp	[bp+var_7], 0
		jz	short loc_57F3C
		cmp	[bp+var_C], 0
		jz	short loc_57F3C
		push	0
		mov	al, [bp+var_8]
		push	ax
		lea	ax, word ptr [bp+var_C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_57F3C

loc_57F3C:
		mov	[bp+var_C], 0
		mov	[bp+var_7], 0
		mov	[bp+var_6], 0
		push	2
		lea	ax, [bp+var_1A2]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	2
		lea	ax, [bp+var_12A]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Gameflow_KillBoard_5779B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_57F72		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_57F8D
		push	4
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_57F8D

loc_57F8D:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_57F72		endp

; START OF FUNCTION CHUNK FOR sub_57F72
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_57F72
ovr191		ends
