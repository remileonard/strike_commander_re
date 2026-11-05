ovr368		segment	para public 'OVERLAY' use16
		assume cs:ovr368
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CDA70		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_CDA94

loc_CDA81:
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		cmp	al, [bp+arg_4]
		jnz	short loc_CDA94
		mov	ax, [bp+arg_2]
		mov	[bx+4], ax
		jmp	short loc_CDAB3

loc_CDA94:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 3Eh
		push	ax
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_CDA81
		push	0A456h
		call	sub_1DDFE
		pop	cx

loc_CDAB3:
		pop	si
		leave
		retf
sub_CDA70		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CDAB6		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	ax, [di]
		mov	[si+33h], ax
		mov	bx, [bp+arg_4]
		mov	ax, [bx]
		mov	[si+35h], ax
		pop	di
		pop	si
		pop	bp
		retf
sub_CDAB6		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CDAD2		proc far

var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_7D3DA
		mov	[bp+var_1], 0
		mov	word ptr [si+37h], 0
		mov	[bp+var_4], 0
		jmp	short loc_CDB1C

loc_CDAF1:
		push	word ptr [si+35h]
		push	word ptr [si+33h]
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 6
		or	al, al
		jz	short loc_CDB1C
		mov	bx, [bp+var_4]
		cmp	byte ptr [bx+7], 0
		jz	short loc_CDB1C
		mov	[bp+var_1], 1
		mov	ax, [bp+var_4]
		mov	[si+37h], ax

loc_CDB1C:
		lea	ax, [bp+var_4]
		push	ax
		mov	ax, si
		add	ax, 3Eh
		push	ax
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_CDAF1
		cmp	[bp+var_1], 0
		jz	short loc_CDB55
		push	word ptr [si+37h]
		push	si
		nop
		push	cs
		call	near ptr sub_CDBBB
		add	sp, 4
		or	di, di
		jz	short loc_CDB6A
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	word_7D3DA, 0
		jmp	short loc_CDB65

loc_CDB55:
		cmp	di, 1
		jz	short loc_CDB6A
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	word_7D3DA, 1

loc_CDB65:
		call	TextScrollDisplayB_ApplyHelperC_6FABB

loc_CDB6A:
		pop	di
		pop	si
		leave
		retf
sub_CDAD2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CDB6E		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, word_7B296
		mov	[bp+var_2], ax
		mov	ax, word_7B298
		mov	[bp+var_4], ax
		mov	ax, [si+33h]
		cmp	ax, [bp+var_2]
		jnz	short loc_CDB94
		mov	ax, [si+35h]
		cmp	ax, [bp+var_4]
		jz	short loc_CDBAE

loc_CDB94:
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_2]
		push	ax
		push	si
		push	cs
		call	near ptr sub_CDAB6
		add	sp, 6
		push	si
		push	cs
		call	near ptr sub_CDAD2
		pop	cx
		mov	al, 1
		jmp	short loc_CDBB0

loc_CDBAE:
		mov	al, 0

loc_CDBB0:
		pop	si
		leave
		retf
sub_CDB6E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CDBB3		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_CDBB3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CDBBB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	0AFh
		push	di
		mov	bx, [di]
		call	dword ptr [bx+0Ch]
		pop	cx
		push	ax
		push	2
		push	3BF4h
		push	word ptr [si+2Dh]
		call	sub_75D4A
		add	sp, 0Ah
		pop	di
		pop	si
		pop	bp
		retf
sub_CDBBB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CDBE5		proc far

var_40		= word ptr -40h
var_30		= word ptr -30h
var_2E		= byte ptr -2Eh
var_20		= word ptr -20h
var_1D		= byte ptr -1Dh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= dword ptr -16h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_8		= word ptr -8
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 40h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_30+1], 12h
		mov	byte ptr [bp+var_30], 1
		mov	[bp+var_2E], 36h
		call	sub_75750
		mov	byte ptr [bp+var_8], 0
		mov	[bp+var_D], 0
		xor	di, di
		push	0
		push	word_7AF7E
		call	TextScrollDisplayB_ApplyHelperA_6FA1B
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_6FABB
		mov	dword ptr [si+19h], 0
		mov	eax, dword_7B29D
		mov	[si+15h], eax
		push	si
		push	cs
		call	near ptr sub_CDB6E
		pop	cx

loc_CDC34:
		call	sub_75755
		mov	eax, [si+15h]
		add	eax, [si+19h]
		cmp	eax, dword_7B29D
		ja	short loc_CDC4D
		mov	ax, 1
		jmp	short loc_CDC4F

loc_CDC4D:
		xor	ax, ax

loc_CDC4F:
		or	al, al
		jnz	short loc_CDC56
		jmp	loc_CDE68

loc_CDC56:
		mov	ax, si
		add	ax, 1Fh
		mov	[bp+var_12], ax
		push	ax
		lea	ax, [bp+var_10]
		push	ax
		call	sub_6735D
		add	sp, 4
		movzx	eax, word ptr [si+10h]
		mov	[bp+var_16], eax
		mov	[si+19h], eax
		mov	eax, dword_7B29D
		mov	[si+15h], eax
		mov	[bp+var_18], 0
		jmp	short loc_CDC9E

loc_CDC87:
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_18]
		push	word ptr [bx+6]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_CDC9E:
		lea	ax, [bp+var_18]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_68976
		add	sp, 4
		or	ax, ax
		jnz	short loc_CDC87
		mov	[bp+var_1A], 0
		mov	[bp+var_1C], 0
		jmp	short loc_CDD3A

loc_CDCC0:
		mov	bx, [bp+var_1A]
		cmp	byte ptr [bx+7], 0
		jz	short loc_CDD3A
		mov	ax, [si+37h]
		cmp	ax, [bp+var_1A]
		jnz	short loc_CDD08
		cmp	word ptr [bx+4], 0
		jz	short loc_CDCF7
		push	word ptr [bx+4]
		nop
		push	cs
		call	near ptr sub_CE113
		pop	cx
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_1A]
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_CDCF7:
		push	[bp+var_1A]
		mov	bx, [bp+var_1A]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		pop	cx
		mov	[bp+var_1C], ax
		jmp	short loc_CDD25

loc_CDD08:
		mov	bx, [bp+var_1A]
		cmp	word ptr [bx+4], 0
		jz	short loc_CDD25
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_CDD25:
		mov	bx, [bp+var_1A]
		cmp	word ptr [bx+4], 0
		jz	short loc_CDD3A
		push	word ptr [bx+4]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		pop	cx

loc_CDD3A:
		lea	ax, [bp+var_1A]
		push	ax
		mov	ax, si
		add	ax, 3Eh
		push	ax
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jz	short loc_CDD53
		jmp	loc_CDCC0

loc_CDD53:
		cmp	[bp+var_1C], 0
		jz	short loc_CDD6F
		push	0AFh
		push	[bp+var_1C]
		push	2
		push	3BFBh
		push	word ptr [si+2Dh]
		call	sub_75D4A
		add	sp, 0Ah

loc_CDD6F:
		push	word_7AF7C
		call	sub_6FC2E
		pop	cx
		call	sub_6828E
		mov	bx, word_7D14D
		cmp	byte ptr [bx+4E1h], 0
		jz	short loc_CDDE7
		lea	ax, [bp+var_40]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		push	0
		push	word ptr [si+39h]
		mov	al, [si+3Bh]
		push	ax
		mov	ax, si
		add	ax, 39h
		push	ax
		call	sub_76259
		add	sp, 8
		mov	byte ptr [bp+var_30], 0
		mov	bx, word_7D14D
		mov	byte ptr [bx+4E1h], 0
		push	word_7AF7C
		push	word ptr [si+13h]
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		call	sub_6828E
		lea	ax, [bp+var_40]
		push	ax
		lea	ax, [bp+var_30]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		jmp	short loc_CDDF6

loc_CDDE7:
		push	word_7AF7C
		push	word ptr [si+13h]
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4

loc_CDDF6:
		push	word_7AF7C
		call	sub_6FC40
		pop	cx
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		pop	cx
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CDE16
		push	si
		push	cs
		call	near ptr sub_CDAD2
		pop	cx

loc_CDE16:
		cmp	[bp+var_D], 0
		jz	short loc_CDE5E
		cmp	word ptr [si+37h], 0
		jz	short loc_CDE5E
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	ax, [bx+20h]
		dec	ax
		cmp	ax, di
		jnz	short loc_CDE4E
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	bx, [si+37h]
		mov	al, [bx+6]
		mov	[bp+var_1D], al
		lea	ax, [bp+var_10]
		push	ax
		call	sub_67383
		pop	cx
		mov	al, [bp+var_1D]

loc_CDE4B:
		jmp	loc_CDF70

loc_CDE4E:
		inc	di
		mov	[bp+var_20], di
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	ax, [bp+var_20]
		mov	[bx+1Bh], ax

loc_CDE5E:
		lea	ax, [bp+var_10]
		push	ax
		call	sub_67383
		pop	cx

loc_CDE68:
		lea	ax, [bp+var_8]
		push	ax
		call	TextScroll_FormatAndApply_6F343
		pop	cx
		cmp	byte ptr [bp+var_8], 0
		jnz	short loc_CDE9A
		lea	ax, [bp+var_8]
		push	ax
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_CDE9A
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_CDE9A

loc_CDE9A:
		cmp	byte ptr [bp+var_8], 0
		jnz	short loc_CDEA3
		jmp	loc_CDF37

loc_CDEA3:
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jz	short loc_CDEAF
		jmp	loc_CDF37

loc_CDEAF:
		mov	al, byte ptr [bp+var_8]
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_CDEC0
		cmp	ax, 3
		jz	short loc_CDF2F
		jmp	short loc_CDF37

loc_CDEC0:
		push	si
		push	cs
		call	near ptr sub_CDB6E
		pop	cx
		cmp	byte ptr [bp+var_8+1], 2
		jnz	short loc_CDED1
		mov	ax, 1
		jmp	short loc_CDED3

loc_CDED1:
		xor	ax, ax

loc_CDED3:
		mov	[si+30h], al
		cmp	word ptr [si+37h], 0
		jz	short loc_CDF2F
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	al, [bx+2Dh]
		mov	[bp+var_E], al
		mov	bx, [si+37h]
		cmp	word ptr [bx+4], 0
		jz	short loc_CDF0F
		mov	bx, [bx+4]
		cmp	byte ptr [bx+1Eh], 0
		jz	short loc_CDF0F
		mov	[bp+var_D], 1
		cmp	[bp+var_E], 0FFh
		jz	short loc_CDF2F
		mov	ah, 0
		push	ax
		call	Music_SetPendingTune_5ED30
		pop	cx
		jmp	short loc_CDF2F

loc_CDF0F:
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		cmp	[bp+var_E], 0FFh
		jz	short loc_CDF26
		mov	al, [bp+var_E]
		mov	ah, 0
		push	ax
		call	Music_SetPendingTune_5ED30
		pop	cx

loc_CDF26:
		mov	bx, [si+37h]
		mov	al, [bx+6]
		jmp	loc_CDE4B

loc_CDF2F:
		push	si
		push	cs
		call	near ptr sub_CDB6E
		pop	cx
		or	al, al

loc_CDF37:
		cmp	byte ptr [bp+var_C], 0
		jnz	short loc_CDF40
		jmp	loc_CDC34

loc_CDF40:
		cmp	byte ptr [bp+var_C], 2
		jz	short loc_CDF49
		jmp	loc_CDC34

loc_CDF49:
		cmp	byte ptr [bp+var_C+1], 1
		jz	short loc_CDF52
		jmp	loc_CDC34

loc_CDF52:
		cmp	byte ptr [si+32h], 0FFh
		jnz	short loc_CDF5B
		jmp	loc_CDC34

loc_CDF5B:
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		call	sub_75750
		call	Keyboard_DrainBufferBIOS_701E1
		mov	al, [si+32h]
		jmp	loc_CDE4B

loc_CDF70:
		pop	di
		pop	si
		leave
		retf
sub_CDBE5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CDF74		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_CDFC8
		mov	word ptr [si], 3960h
		jmp	short loc_CDF9A

loc_CDF8C:
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6

loc_CDF9A:
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_CDF8C
		mov	word ptr [si], 909h
		push	si
		call	sub_68B0D
		pop	cx
		test	di, 1
		jz	short loc_CDFC8
		push	si
		call	sub_3B2
		pop	cx

loc_CDFC8:
		pop	di
		pop	si
		leave
		retf
sub_CDF74		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CDFCC		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_CE043
		mov	word ptr [si], 37B0h
		mov	word ptr [si+0Ah], 37D0h
		push	si
		mov	bx, [si]
		call	dword ptr [bx+14h]
		pop	cx
		push	1B46h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CE022
		cmp	si, word_7A2DC
		jnz	short loc_CE022
		push	1B45h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	1B46h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	word_7D140
		call	sub_3B2
		pop	cx
		mov	word_7A2DC, 0
		jmp	short loc_CE02B

loc_CE022:
		push	word ptr [si+26h]
		call	sub_3B2
		pop	cx

loc_CE02B:
		push	0
		push	si
		call	sub_66AAD
		add	sp, 4
		test	di, 1
		jz	short loc_CE043
		push	si
		call	sub_3B2
		pop	cx

loc_CE043:
		pop	di
		pop	si
		pop	bp
		retf
sub_CDFCC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE047		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+16h], 0
		jz	short loc_CE074
		cmp	dword ptr [si+11h], 0
		jz	short loc_CE074
		push	0
		mov	al, [si+15h]
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_CE074

loc_CE074:
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		pop	si
		pop	bp
		retf
sub_CE047		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TalkingHead_SetBaseFrame_9D32 (sub_9D32 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Image de base +2118 et image affichée +2124 = arg_2.
; ==============================================================================================
TalkingHead_SetBaseFrame_CE08B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+1Dh], 0
		mov	ax, [bp+arg_2]
		mov	[si+1Bh], ax
		pop	si
		pop	bp
		retf
TalkingHead_SetBaseFrame_CE08B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE09F		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+22h], ax
		mov	ax, [bp+arg_4]
		mov	[si+24h], ax
		pop	si
		pop	bp
		retf
sub_CE09F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE0B5		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		push	si
		mov	bx, [si]
		call	dword ptr [bx+4]
		pop	cx
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		pop	cx
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	large 0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_66BEC
		pop	cx
		pop	si
		leave
		retf
sub_CE0B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE113		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+2Ch], 1
		pop	si
		pop	bp
		retf
sub_CE113		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE121		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+2Ch], 0
		pop	si
		pop	bp
		retf
sub_CE121		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE12F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	1B45h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CE186
		cmp	si, word_7A2DC
		jnz	short loc_CE186
		push	1B45h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	1B46h
		call	GameVar_SetFlag_5646D
		pop	cx
		mov	ax, [si+26h]
		mov	word_7D140, ax
		mov	word ptr [si+26h], 3BAEh
		mov	ax, [si+2Ah]
		mov	word_7D142, ax
		mov	word ptr [si+2Ah], 23h
		mov	word ptr [si+28h], 0
		mov	word ptr [si+1Bh], 0
		mov	ax, [si+22h]
		mov	word_7D144, ax
		mov	word ptr [si+22h], 16h

loc_CE186:
		cmp	byte ptr [si+1Dh], 0
		jnz	short loc_CE18F
		jmp	loc_CE29D

loc_CE18F:
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_CE200
		push	1B46h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CE1D4
		cmp	si, word_7A2DC
		jnz	short loc_CE1D4
		mov	ax, word_7D140
		mov	[si+26h], ax
		mov	ax, word_7D142
		mov	[si+2Ah], ax
		mov	word ptr [si+28h], 0
		mov	ax, [si+24h]
		mov	[si+1Bh], ax
		mov	ax, word_7D144
		mov	[si+22h], ax
		push	1B46h
		call	GameVar_ClearFlag_56520
		pop	cx
		mov	word_7A2DC, 0

loc_CE1D4:
		mov	ax, [si+1Bh]
		cmp	ax, [si+22h]
		jb	short loc_CE1E1
		cmp	ax, [si+24h]
		jbe	short loc_CE1E9

loc_CE1E1:
		mov	ax, [si+22h]
		mov	[si+1Bh], ax
		jmp	short loc_CE1F4

loc_CE1E9:
		mov	ax, [si+1Bh]
		cmp	ax, [si+24h]
		jz	short loc_CE1F4
		inc	word ptr [si+1Bh]

loc_CE1F4:
		mov	word ptr [si+28h], 0
		mov	byte ptr [si+2Ch], 0
		jmp	loc_CE29D

loc_CE200:
		cmp	word ptr [si+2Ah], 0
		jz	short loc_CE284
		mov	ax, [si+1Bh]
		cmp	ax, [si+22h]
		ja	short loc_CE26F
		mov	ax, [si+28h]
		shl	ax, 1
		mov	bx, [si+26h]
		add	bx, ax
		mov	ax, [bx]
		mov	[si+1Bh], ax
		inc	word ptr [si+28h]
		mov	ax, [si+28h]
		cmp	ax, [si+2Ah]
		jl	short loc_CE29D
		push	1B46h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_CE268
		cmp	si, word_7A2DC
		jnz	short loc_CE268
		mov	ax, word_7D140
		mov	[si+26h], ax
		mov	ax, word_7D142
		mov	[si+2Ah], ax
		mov	word ptr [si+28h], 0
		mov	word ptr [si+1Bh], 1
		mov	ax, word_7D144
		mov	[si+22h], ax
		push	1B46h
		call	GameVar_ClearFlag_56520
		pop	cx
		mov	word_7A2DC, 0
		jmp	short loc_CE29D

loc_CE268:
		mov	word ptr [si+28h], 0
		jmp	short loc_CE29D

loc_CE26F:
		inc	word ptr [si+1Bh]
		mov	ax, [si+1Bh]
		cmp	ax, [si+20h]
		jb	short loc_CE29D
		mov	bx, [si+26h]
		mov	ax, [bx]
		mov	[si+1Bh], ax
		jmp	short loc_CE29D

loc_CE284:
		inc	word ptr [si+1Bh]
		mov	ax, [si+22h]
		inc	ax
		cmp	ax, [si+1Bh]
		jz	short loc_CE298
		mov	ax, [si+1Bh]
		cmp	ax, [si+20h]
		jb	short loc_CE29D

loc_CE298:
		mov	word ptr [si+1Bh], 1

loc_CE29D:
		pop	si
		pop	bp
		retf
sub_CE12F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_CE2A0		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	large [si+11h]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_6AB8C
		mov	[si+20h], ax
		cmp	word ptr [si+20h], 1
		jle	short loc_CE2D7
		mov	byte ptr [si+1Dh], 1
		mov	word ptr [si+1Bh], 1
		jmp	short loc_CE2DB

loc_CE2D7:
		mov	byte ptr [si+1Dh], 0

loc_CE2DB:
		mov	byte ptr [si+2Ch], 0
		mov	byte ptr [si+1Eh], 0
		mov	ax, [si+20h]
		mov	[si+24h], ax
		mov	[si+22h], ax
		mov	word ptr [si+26h], 0
		mov	word ptr [si+2Ah], 0
		mov	word ptr [si+28h], 0
		mov	byte ptr [si+2Dh], 0FFh
		pop	si
		pop	bp
		retf
sub_CE2A0		endp
ovr368		ends
