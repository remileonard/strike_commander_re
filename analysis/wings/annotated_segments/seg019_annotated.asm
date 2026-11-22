seg019		segment	para public 'CODE' use16
		assume cs:seg019
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A700		proc far

var_CA		= word ptr -0CAh
var_52		= word ptr -52h
var_2		= byte ptr -2
arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0CAh
		cmp	byte_5FD44, 0
		jz	short loc_A77F
		mov	al, byte_5A544
		cmp	al, [bp+arg_0]
		jnz	short loc_A719
		jmp	loc_A810

loc_A719:
		cmp	word_5FD4F, 0
		jz	short loc_A735
		push	word_5FD51
		mov	bx, word_5FD4F
		push	word ptr [bx+4]
		call	sub_9CC3
		add	sp, 4
		jmp	short loc_A735

loc_A735:
		cmp	byte_5FD4A, 0
		jz	short loc_A75A
		cmp	dword_5FD45, 0
		jz	short loc_A75A
		push	0
		mov	al, byte_5FD49
		push	ax
		push	6025h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_A75A

loc_A75A:
		mov	dword_5FD45, 0
		mov	byte_5FD4A, 0
		mov	dword_5FD4B, 0
		push	602Fh
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		mov	byte_5FD44, 0

loc_A77F:
		mov	al, byte_5CF9C
		mov	[bp+var_2], al
		cmp	[bp+var_2], 0
		jz	short loc_A7B9
		mov	ah, 0
		cmp	ax, 3
		jnz	short loc_A79C
		push	ds
		push	offset aPak
		push	ds
		push	offset aAmusic
		jmp	short loc_A7A4

loc_A79C:
		push	ds
		push	offset aPak
		push	ds
		push	offset aRmusic

loc_A7A4:
		push	ds
		push	offset aDataMidgames
		lea	ax, [bp+var_52]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		mov	byte_5FD44, 1

loc_A7B9:
		mov	al, [bp+arg_0]
		mov	byte_5A544, al
		cmp	byte_5FD44, 0
		jz	short loc_A810
		push	1
		lea	ax, [bp+var_52]
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_548B8
		add	sp, 6
		push	3
		push	6025h
		mov	al, [bp+arg_0]
		mov	ah, 0
		push	ax
		lea	ax, [bp+var_CA]
		push	ax
		call	sub_1ECCB
		add	sp, 8
		push	0
		push	6025h
		push	602Fh
		call	sub_1A769
		add	sp, 6
		push	2
		lea	ax, [bp+var_CA]
		push	ax
		call	IndexedRecordReader_Destruct_5483E
		add	sp, 4

loc_A810:
		leave
		retf
sub_A700		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A812		proc far

var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	[bp+var_3], al
		push	8
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_A84D
		mov	word ptr [di], 0A2Dh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 0A31h
		mov	al, [bp+var_3]
		mov	[di+4], al
		mov	word ptr [di+5], 0
		mov	ax, di
		jmp	short loc_A84F

loc_A84D:
		mov	ax, di

loc_A84F:
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_48623
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_A812		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A860		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0

loc_A86F:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jz	short loc_A88B
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_A86F

loc_A88B:
		cmp	[bp+var_2], 0
		jz	short loc_A89F
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6

loc_A89F:
		pop	si
		leave
		retf
sub_A860		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A8A2		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_A8BC

loc_A8AE:
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6

loc_A8BC:
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_A8AE
		mov	word ptr [si+4], 0
		pop	si
		leave
		retf
sub_A8A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A8DA		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_A8FB

loc_A8EB:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jnz	short loc_A8FB
		mov	ax, [bp+var_2]
		jmp	short loc_A90E

loc_A8FB:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_A8EB
		xor	ax, ax

loc_A90E:
		pop	si
		leave
		retf
sub_A8DA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far (partie, longueur, REQU) : conditions de 3 octets (condition, numéro sur un mot) : 0
; REQUIRE_NOT_SET, 1 REQUIRE_SET, 2 OR_NOT_SET, 3 OR_SET ; rend 1 si visible.
; ==============================================================================================
Gameflow_TestRequ_A911		proc far

var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	ax, [bp+arg_0]
		mov	di, [bp+arg_4]
		mov	[bp+var_1], 1
		mov	[bp+var_2], 0
		xor	si, si
		jmp	loc_A9AE

loc_A92C:
		mov	bx, si
		mov	al, [bx+di]
		mov	[bp+var_3], al
		mov	bx, di
		mov	al, [bx+si+1]
		mov	ah, 0
		mov	dl, [bx+si+2]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	dx, ax
		mov	al, [bp+var_3]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		ja	short loc_A9AB
		shl	bx, 1
		jmp	cs:off_A9C1[bx]	; switch jump

loc_A959:
		push	dx
		call	GameVar_Get_A40C
		pop	cx
		or	ax, ax
		jz	short loc_A971
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A971

loc_A96D:
		mov	[bp+var_1], 0

loc_A971:
		mov	[bp+var_2], 0
		jmp	short loc_A9AB

loc_A977:
		push	dx
		call	GameVar_Get_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_A971
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A971
		jmp	short loc_A96D
		jmp	short loc_A971

loc_A98F:
		push	dx
		call	GameVar_Get_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_A9AB
		jmp	short loc_A9A7

loc_A99C:
		push	dx
		call	GameVar_Get_A40C
		pop	cx
		or	ax, ax
		jz	short loc_A9AB

loc_A9A7:
		mov	[bp+var_2], 1

loc_A9AB:
		add	si, 3

loc_A9AE:
		mov	al, [bp+arg_2]
		mov	ah, 0
		cmp	ax, si
		jle	short loc_A9BA
		jmp	loc_A92C

loc_A9BA:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
Gameflow_TestRequ_A911		endp

; START OF FUNCTION CHUNK FOR Gameflow_TestRequ_A911
off_A9C1	dw offset loc_A959
		dw offset loc_A977
		dw offset loc_A98F
		dw offset loc_A99C
; END OF FUNCTION CHUNK FOR Gameflow_TestRequ_A911

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far (partie, longueur, EFCT) : interpréteur des scripts EFCT, 59 commandes (cmp bx, 3Ah /
; jmp cs:off_AED6[bx]) ; ELSE 30, ENDIF 31, OR_GROUP 33 traités avant ; pas de 3 octets pour
; 0, 6, 7, 9, 10, 19, 50, 51, 55, 2 sinon ; registre [partie+282]. Table complète :
; analysis/wings/README.md § 4.3.
; ==============================================================================================
Gameflow_RunScript_A9C9		proc far

var_AC		= word ptr -0ACh
var_5C		= word ptr -5Ch
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0ACh
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	[bp+var_3], 0
		mov	[bp+var_4], 0
		mov	[bp+var_5], 0
		xor	di, di
		jmp	loc_AEBE

loc_A9EE:
		mov	byte_603DE, 0
		cmp	[bp+var_3], 0
		jz	short loc_A9FC
		jmp	loc_AECA

loc_A9FC:
		mov	bx, [bp+arg_4]
		add	bx, di
		mov	al, [bx]
		mov	[bp+var_6], al
		mov	bx, [bp+arg_4]
		mov	al, [bx+di+1]
		mov	[bp+var_7], al
		mov	al, [bx+di+2]
		mov	[bp+var_8], al
		mov	al, [bx+di+1]
		mov	ah, 0
		mov	dl, [bx+di+2]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	[bp+var_A], ax
		cmp	[bp+var_2], 0
		jz	short loc_AA87
		cmp	[bp+var_6], 9
		jz	short loc_AA78
		cmp	[bp+var_6], 0Ah
		jz	short loc_AA78
		cmp	[bp+var_6], 14h
		jz	short loc_AA78
		cmp	[bp+var_6], 15h
		jz	short loc_AA78
		cmp	[bp+var_6], 1Ch
		jz	short loc_AA78
		cmp	[bp+var_6], 20h
		jz	short loc_AA78
		cmp	[bp+var_6], 23h
		jz	short loc_AA78
		cmp	[bp+var_6], 34h
		jz	short loc_AA78
		cmp	[bp+var_6], 35h
		jz	short loc_AA78
		cmp	[bp+var_6], 36h
		jz	short loc_AA78
		cmp	[bp+var_6], 25h
		jz	short loc_AA78
		push	8D9h
		call	sub_9D78
		pop	cx

loc_AA78:
		cmp	[bp+var_5], 0
		jnz	short loc_AA84
		mov	[bp+var_2], 0
		jmp	short loc_AA87

loc_AA84:
		dec	[bp+var_5]

loc_AA87:
		cmp	[bp+var_6], 1Eh
		jnz	short loc_AAA6
		cmp	[bp+var_4], 0
		jz	short loc_AA96
		jmp	loc_AEBB

loc_AA96:
		mov	al, [bp+var_1]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp+var_1], al
		jmp	loc_AEBB

loc_AAA6:
		cmp	[bp+var_6], 1Fh
		jnz	short loc_AABF
		cmp	[bp+var_4], 0
		jnz	short loc_AAB9
		mov	[bp+var_1], 0
		jmp	loc_AEBB

loc_AAB9:
		dec	[bp+var_4]
		jmp	loc_AEBB

loc_AABF:
		cmp	[bp+var_6], 21h
		jnz	short loc_AAD2
		mov	[bp+var_2], 1
		mov	al, [bp+var_7]
		mov	[bp+var_5], al
		jmp	loc_AEBB

loc_AAD2:
		cmp	[bp+var_1], 0
		jnz	short loc_AADB
		jmp	loc_AB80

loc_AADB:
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_AAE7
		jmp	loc_AB80

loc_AAE7:
		cmp	[bp+var_6], 9
		jz	short loc_AB29
		cmp	[bp+var_6], 0Ah
		jz	short loc_AB29
		cmp	[bp+var_6], 14h
		jz	short loc_AB29
		cmp	[bp+var_6], 15h
		jz	short loc_AB29
		cmp	[bp+var_6], 1Ch
		jz	short loc_AB29
		cmp	[bp+var_6], 20h
		jz	short loc_AB29
		cmp	[bp+var_6], 23h
		jz	short loc_AB29
		cmp	[bp+var_6], 34h
		jz	short loc_AB29
		cmp	[bp+var_6], 35h
		jz	short loc_AB29
		cmp	[bp+var_6], 36h
		jz	short loc_AB29
		cmp	[bp+var_6], 25h
		jnz	short loc_AB2C

loc_AB29:
		inc	[bp+var_4]

loc_AB2C:
		cmp	[bp+var_6], 6
		jnz	short loc_AB35
		jmp	loc_AE4E

loc_AB35:
		cmp	[bp+var_6], 7
		jnz	short loc_AB3E
		jmp	loc_AE4E

loc_AB3E:
		cmp	[bp+var_6], 9
		jnz	short loc_AB47
		jmp	loc_AE4E

loc_AB47:
		cmp	[bp+var_6], 0Ah
		jnz	short loc_AB50
		jmp	loc_AE4E

loc_AB50:
		cmp	[bp+var_6], 13h
		jnz	short loc_AB59
		jmp	loc_AE4E

loc_AB59:
		cmp	[bp+var_6], 0
		jnz	short loc_AB62
		jmp	loc_AE4E

loc_AB62:
		cmp	[bp+var_6], 32h
		jnz	short loc_AB6B
		jmp	loc_AE4E

loc_AB6B:
		cmp	[bp+var_6], 33h
		jnz	short loc_AB74
		jmp	loc_AE4E

loc_AB74:
		cmp	[bp+var_6], 37h
		jz	short loc_AB7D
		jmp	loc_AEBB

loc_AB7D:
		jmp	loc_AE4E

loc_AB80:
		mov	al, [bp+var_6]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3Ah
		jbe	short loc_AB8F
		jmp	loc_AEAD

loc_AB8F:
		shl	bx, 1
		jmp	cs:off_AED6[bx]	; switch jump

loc_AB96:
		push	[bp+var_A]
		push	si
		call	sub_58AB3

loc_AB9F:
		add	sp, 4
		jmp	loc_AE4E

loc_ABA5:
		mov	al, [bp+var_7]
		mov	[si+10Fh], al
		mov	byte ptr [si+0F7h], 1
		jmp	loc_AEBB

loc_ABB4:
		push	word ptr [si+11Ah]
		mov	al, [bp+var_7]
		push	ax
		push	si
		call	sub_58AB8
		add	sp, 6
		jmp	loc_AEBB

loc_ABC8:
		mov	al, [bp+var_7]
		mov	[si+10Ch], al
		jmp	short loc_AC32

loc_ABD1:
		jmp	short loc_AC1E

loc_ABD3:
		push	[bp+var_A]
		call	GameVar_SetFlag_A455
		jmp	short loc_ABE5

loc_ABDD:
		push	[bp+var_A]
		call	GameVar_Clear_A4F0

loc_ABE5:
		pop	cx
		jmp	loc_AE4E

loc_ABE9:
		push	[bp+var_A]
		call	GameVar_Get_A40C
		pop	cx
		or	ax, ax
		jnz	short loc_ABF9
		jmp	loc_AE4E

loc_ABF9:
		jmp	short loc_AC0E
		jmp	loc_AE4E

loc_ABFE:
		push	[bp+var_A]
		call	GameVar_Get_A40C
		pop	cx
		or	ax, ax
		jz	short loc_AC0E
		jmp	loc_AE4E

loc_AC0E:
		mov	[bp+var_1], 1
		jmp	loc_AE4E
		jmp	loc_AE4E

loc_AC18:
		push	900h
		jmp	loc_ADD9

loc_AC1E:
		mov	al, [bp+var_7]
		mov	[si+10Ch], al
		jmp	loc_AEBB

loc_AC28:
		mov	al, [bp+var_7]
		mov	[si+10Eh], al
		jmp	loc_AEBB

loc_AC32:
		mov	byte ptr [si+0FCh], 1
		jmp	loc_AEBB

loc_AC3A:
		push	0
		push	6040h
		call	sub_13C38
		add	sp, 4
		push	si
		call	sub_D20A
		pop	cx
		mov	[bp+var_C], ax
		or	ax, ax
		jz	short loc_AC61
		push	ax
		push	4
		push	si
		call	sub_58AB8
		add	sp, 6

loc_AC61:
		mov	byte ptr [si+0FCh], 2
		jmp	loc_AEBB

loc_AC69:
		mov	byte ptr [bp+var_AC], 0
		lea	ax, [bp+var_AC]
		push	ax
		push	si
		call	sub_BA82
		add	sp, 4
		cmp	byte ptr [bp+var_AC], 0
		jnz	short loc_AC86
		jmp	loc_AEBB

loc_AC86:
		push	ds
		push	offset unk_5A642
		push	ss
		lea	ax, [bp+var_AC]
		push	ax
		push	ds
		push	offset aSaved_2
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_5C]
		push	ax
		push	si
		call	sub_BBDF
		add	sp, 4
		or	al, al
		jnz	short loc_ACB4
		jmp	loc_AEBB

loc_ACB4:
		push	ds
		push	offset aTMP
		push	ds
		push	offset aGensave
		push	ds
		push	offset a__2
		lea	ax, [bp+var_5C]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_5C]
		push	ax
		push	si
		call	sub_BBDF
		jmp	loc_AEB8

loc_ACD9:
		push	0
		push	si
		call	sub_BE70
		add	sp, 4
		cmp	byte ptr [si+0A7h], 0
		jnz	short loc_ACEE
		jmp	loc_AEBB

loc_ACEE:
		mov	byte ptr [si+0FCh], 3
		jmp	loc_AEBB

loc_ACF6:
		mov	al, [bp+var_7]
		push	ax
		push	si
		call	Gameflow_Map_D51A
		jmp	loc_AEB8

loc_AD03:
		mov	al, [bp+var_8]
		mov	ah, 0
		push	ax
		mov	al, [bp+var_7]
		mov	ah, 0
		push	ax
		push	si
		call	Gameflow_KillBoard_C6D9
		add	sp, 6
		jmp	loc_AE4E

loc_AD1B:
		mov	al, [si+36Ah]
		mov	ah, 0
		or	ax, ax
		jz	short loc_AD28
		jmp	loc_AEBB

loc_AD28:
		jmp	loc_AE41

loc_AD2B:
		cmp	byte ptr [si+36Ah], 0
		jnz	short loc_AD35
		jmp	loc_AEBB

loc_AD35:
		jmp	loc_AE41

loc_AD38:
		push	si
		call	sub_D174
		jmp	loc_ADDE

loc_AD41:
		mov	al, [bp+var_7]
		push	ax
		push	6040h
		call	Music_LoadTune_13AF4
		add	sp, 4
		push	6040h
		call	sub_13BB6
		jmp	loc_ADDE

loc_AD5B:
		push	si
		call	Gameflow_ClearFlags760_764_D17C
		jmp	short loc_ADDE

loc_AD63:
		cmp	byte ptr [si+100h], 0
		jnz	short loc_AD6D
		jmp	loc_AEBB

loc_AD6D:
		cmp	byte ptr [si+10Bh], 2
		jnz	short loc_AD77
		jmp	loc_AEBB

loc_AD77:
		push	si
		call	sub_C6D1
		jmp	short loc_ADDE

loc_AD7F:
		cmp	[bp+var_7], 8
		jb	short loc_AD88
		jmp	loc_AEBB

loc_AD88:
		jmp	loc_AE63

loc_AD8B:
		mov	al, [bp+var_7]
		mov	ah, 0
		cmp	ax, [si+292h]
		ja	short loc_AD99
		jmp	loc_AEBB

loc_AD99:
		jmp	loc_AE41

loc_AD9C:
		push	si
		call	Gameflow_ClearFlags261_269_D1B1
		jmp	short loc_ADDE

loc_ADA4:
		mov	al, [bp+var_7]
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+si+21Ch], 1
		jnz	short loc_ADB5
		jmp	loc_AEBB

loc_ADB5:
		jmp	loc_AE41

loc_ADB8:
		mov	al, [bp+var_7]
		push	ax
		push	si
		call	Gameflow_ApplyChange_C426
		jmp	loc_AEB8

loc_ADC5:
		cmp	word ptr [si+0FDh], 0
		jmp	short loc_AE41

loc_ADCC:
		cmp	word ptr [si+0FDh], 0
		jnz	short loc_ADD6
		jmp	loc_AEBB

loc_ADD6:
		push	923h

loc_ADD9:
		call	sub_9D78

loc_ADDE:
		pop	cx
		jmp	loc_AEBB

loc_ADE2:
		mov	al, [si+3D6h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_ADEF
		jmp	loc_AEBB

loc_ADEF:
		jmp	short loc_AE41

loc_ADF1:
		cmp	[bp+var_7], 8
		jb	short loc_ADFA
		jmp	loc_AEBB

loc_ADFA:
		jmp	short loc_AE51

loc_ADFC:
		push	[bp+var_A]
		call	GameVar_Get_A40C
		pop	cx
		jmp	short loc_AE4A

loc_AE07:
		push	word ptr [si+11Ah]
		push	[bp+var_A]
		call	GameVar_Set_A49C
		jmp	loc_AB9F

loc_AE16:
		mov	al, [bp+var_7]
		mov	ah, 0
		cmp	ax, [si+11Ah]
		jnb	short loc_AE24
		jmp	loc_AEBB

loc_AE24:
		jmp	short loc_AE41

loc_AE26:
		mov	al, [bp+var_7]
		mov	ah, 0
		cmp	ax, [si+11Ah]
		jnz	short loc_AE34
		jmp	loc_AEBB

loc_AE34:
		jmp	short loc_AE41

loc_AE36:
		mov	al, [bp+var_7]
		mov	ah, 0
		cmp	ax, [si+11Ah]
		ja	short loc_AEBB

loc_AE41:
		mov	[bp+var_1], 1
		jmp	short loc_AEBB

loc_AE47:
		mov	ax, [bp+var_A]

loc_AE4A:
		mov	[si+11Ah], ax

loc_AE4E:
		inc	di
		jmp	short loc_AEBB

loc_AE51:
		mov	al, [bp+var_7]
		mov	ah, 0
		imul	ax, ax, 1Ah
		mov	bx, ax
		mov	word ptr [bx+si+2B2h], 1
		jmp	short loc_AEBB

loc_AE63:
		mov	al, [bp+var_7]
		mov	ah, 0
		imul	ax, ax, 1Ah
		mov	bx, ax
		mov	word ptr [bx+si+2B2h], 0
		jmp	short loc_AEBB

loc_AE75:
		mov	al, [bp+var_7]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 3
		ja	short loc_AE89
		shl	bx, 1
		jmp	cs:off_AECE[bx]	; switch jump

loc_AE89:
		push	93Ah
		jmp	short loc_AEA0

loc_AE8E:
		push	942h
		jmp	short loc_AEA0

loc_AE93:
		push	94Ah
		jmp	short loc_AEA0

loc_AE98:
		push	952h
		jmp	short loc_AEA0

loc_AE9D:
		push	958h

loc_AEA0:
		mov	ax, si
		add	ax, 3C5h
		push	ax
		call	CRT_Strcpy
		jmp	short loc_AEB8

loc_AEAD:
		push	12h
		push	word_5A545
		call	sub_9D78

loc_AEB8:
		add	sp, 4

loc_AEBB:
		add	di, 2

loc_AEBE:
		mov	al, [bp+arg_2]
		mov	ah, 0
		cmp	ax, di
		jle	short loc_AECA
		jmp	loc_A9EE

loc_AECA:
		pop	di
		pop	si
		leave
		retf
Gameflow_RunScript_A9C9		endp

; START OF FUNCTION CHUNK FOR Gameflow_RunScript_A9C9
off_AECE	dw offset loc_AE8E
		dw offset loc_AE93
		dw offset loc_AE98
		dw offset loc_AE9D
off_AED6	dw offset loc_AB96
		dw offset loc_ABA5
		dw offset loc_ABB4
		dw offset loc_ABC8
		dw offset loc_AEBB
		dw offset loc_ABD1
		dw offset loc_ABD3
		dw offset loc_ABDD
		dw offset loc_AEBB
		dw offset loc_ABE9
		dw offset loc_ABFE
		dw offset loc_AC18
		dw offset loc_AC1E
		dw offset loc_AC28
		dw offset loc_AC32
		dw offset loc_AC3A
		dw offset loc_AC69
		dw offset loc_ACD9
		dw offset loc_ACF6
		dw offset loc_AD03
		dw offset loc_AD1B
		dw offset loc_AD2B
		dw offset loc_AEAD
		dw offset loc_AD38
		dw offset loc_AD41
		dw offset loc_AD5B
		dw offset loc_AD63
		dw offset loc_AD7F
		dw offset loc_AD8B
		dw offset loc_AD9C
		dw offset loc_AEBB
		dw offset loc_AEBB
		dw offset loc_ADA4
		dw offset loc_AEAD
		dw offset loc_ADB8
		dw offset loc_ADC5
		dw offset loc_ADCC
		dw offset loc_ADE2
		dw offset loc_AEBB
		dw offset loc_AEAD
		dw offset loc_AEAD
		dw offset loc_AEAD
		dw offset loc_AEAD
		dw offset loc_AEAD
		dw offset loc_ADF1
		dw offset loc_AEAD
		dw offset loc_AEAD
		dw offset loc_AEAD
		dw offset loc_AEAD
		dw offset loc_AEAD
		dw offset loc_ADFC
		dw offset loc_AE07
		dw offset loc_AE16
		dw offset loc_AE26
		dw offset loc_AE36
		dw offset loc_AE47
		dw offset loc_AE51
		dw offset loc_AE63
		dw offset loc_AE75
; END OF FUNCTION CHUNK FOR Gameflow_RunScript_A9C9

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_AF4C		proc far

var_11A		= word ptr -11Ah
var_BD		= dword ptr -0BDh
var_B9		= dword ptr -0B9h
var_B5		= dword ptr -0B5h
var_A0		= word ptr -0A0h
var_9E		= word ptr -9Eh
var_72		= word ptr -72h
var_68		= word ptr -68h
var_53		= word ptr -53h
var_45		= word ptr -45h
var_39		= word ptr -39h
var_33		= byte ptr -33h
var_1E		= byte ptr -1Eh
var_13		= byte ptr -13h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 11Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [si+10Dh]
		mov	byte_5F8E4, al
		mov	byte_603DE, 0
		cmp	byte ptr [si+0F7h], 0
		jz	short loc_AF7D
		mov	byte ptr [si+0F7h], 0
		push	si
		push	cs
		call	near ptr sub_A8A2
		pop	cx
		push	si
		call	sub_58AAE
		pop	cx

loc_AF7D:
		mov	al, [si+10Fh]
		mov	[bp+var_2], al
		mov	di, [si+0F8h]
		lea	ax, [bp+var_11A]
		push	ax
		call	StreamReader_ConstructVariantA_52440
		pop	cx
		mov	[bp+var_11A], 9B5h
		mov	[bp+var_B9], 100h
		mov	[bp+var_BD], 0
		mov	[bp+var_11A], 9CDh
		mov	[bp+var_9E], 0
		xor	ax, ax
		mov	[bp+var_A0], ax
		movsx	eax, ax
		mov	[bp+var_B5], eax
		push	di
		push	word_5DD44
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_72]
		push	ax
		call	sub_17084
		add	sp, 0Ah
		mov	[bp+var_11A], 9E5h
		mov	[bp+var_72], 9FDh
		mov	[bp+var_68], 0A1Dh
		mov	[bp+var_10], 492h
		xor	ax, ax
		mov	[bp+var_C], ax
		mov	[bp+var_E], ax
		mov	[bp+var_10], 9B1h
		push	100h
		push	0
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	[bp+var_1E], 0
		mov	[bp+var_13], 0
		mov	al, [bp+var_2]
		mov	[bp+var_33], al
		mov	[bp+var_5], 0FFh
		mov	[bp+var_12], di
		mov	[bp+var_4], 0
		jmp	short loc_B03F

loc_B02B:
		mov	bx, [bp+var_4]
		mov	al, [bx+4]
		push	ax
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_17EAA
		add	sp, 4

loc_B03F:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_B02B
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_1803F
		pop	cx
		mov	al, [bp+var_5]
		push	ax
		push	6040h
		call	Music_LoadTune_13AF4
		add	sp, 4
		push	6040h
		call	sub_13BB6
		pop	cx
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_1892F
		pop	cx
		mov	[bp+var_1], al
		lea	ax, [bp+var_A]
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		lea	ax, [bp+var_10]
		push	ax
		nop
		push	cs
		call	near ptr sub_B6E1
		add	sp, 4
		mov	[bp+var_72], 981h
		mov	[bp+var_68], 9A1h
		call	TextScrollDisplayB_ApplyHelperD_571DE
		mov	byte_6065A, 0
		cmp	[bp+var_45], 0
		jz	short loc_B0CB
		mov	ax, [bp+var_45]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	[bp+var_45]
		call	sub_33B
		pop	cx
		jmp	short loc_B0CB

loc_B0CB:
		push	2
		lea	ax, [bp+var_39]
		push	ax
		call	sub_16E11
		add	sp, 4
		lea	ax, [bp+var_53]
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	0
		lea	ax, [bp+var_72]
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		mov	[bp+var_11A], 9CDh
		lea	ax, [bp+var_11A]
		push	ax
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		lea	ax, [bp+var_11A]
		push	ax
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		mov	al, [bp+var_1]
		push	ax
		push	si
		push	cs
		call	near ptr sub_A8DA
		add	sp, 4
		mov	bx, ax
		push	word ptr [bx+5]
		mov	al, [bp+var_1]
		push	ax
		push	si
		push	cs
		call	near ptr sub_A8DA
		add	sp, 4
		mov	bx, ax
		mov	al, [bx+7]
		push	ax
		push	si
		push	cs
		call	near ptr Gameflow_RunScript_A9C9
		add	sp, 6
		cmp	byte ptr [si+0F7h], 0
		jz	short loc_B151
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4

loc_B151:
		pop	di
		pop	si
		leave
		retf
sub_AF4C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far : boucle du déroulement (scènes, sprites, scripts EFCT par Gameflow_RunScript_A9C9) ;
; [partie+252] = 1 → Gameflow_WriteOp2Misn_681AA puis retour du code de sortie (CRT_Exit dans
; l'appelant).
; ==============================================================================================
Gameflow_MainLoop_B155		proc far

var_5E		= word ptr -5Eh
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 5Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	byte ptr [si+10Bh], 1
		push	100h
		push	0
		lea	ax, [bp+var_8]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	byte ptr [bp+var_C], 0
		mov	byte ptr [bp+var_C+1], 0
		mov	byte ptr [bp+var_A], 0
		push	[bp+var_8]
		mov	al, [bp+var_6]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Palette_FillRange_46CC8
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		push	0
		push	[bp+var_8]
		mov	al, [bp+var_6]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		lea	ax, [bp+var_8]
		push	ax
		call	sub_46E08
		pop	cx

loc_B1C8:
		mov	[bp+var_3], 1
		mov	[bp+var_4], 0
		mov	[bp+var_5], 0
		mov	al, [si+0FCh]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		jbe	short loc_B1E4
		jmp	loc_B317

loc_B1E4:
		shl	bx, 1
		jmp	cs:off_B59A[bx]	; switch jump

loc_B1EB:
		push	si
		call	sub_58AC2
		pop	cx
		mov	[si+10Bh], al
		mov	al, [si+10Bh]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 0Ah
		jbe	short loc_B207
		jmp	loc_B325

loc_B207:
		shl	bx, 1
		jmp	cs:off_B584[bx]	; switch jump

loc_B20E:
		push	0
		push	0Ch

loc_B212:
		push	si
		call	sub_58AB8
		add	sp, 6
		jmp	loc_B325

loc_B21E:
		push	0
		push	6

loc_B222:
		push	si
		call	sub_58AB8
		add	sp, 6
		jmp	short loc_B2A4

loc_B22D:
		push	0
		push	0Eh
		jmp	short loc_B222

loc_B233:
		push	0
		push	0Fh
		jmp	short loc_B222

loc_B239:
		push	0
		push	9
		jmp	short loc_B222

loc_B23F:
		push	0
		push	0Dh
		jmp	short loc_B212

loc_B245:
		push	ds
		push	offset aTMP
		push	ds
		push	offset aGensave
		push	ds
		push	offset a__2
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_5E]
		push	ax
		push	si
		call	sub_BFE1
		add	sp, 4
		mov	[bp+var_3], 0
		jmp	loc_B325

loc_B271:
		mov	byte ptr [si+0FBh], 2
		jmp	short loc_B2A4

loc_B278:
		cmp	byte ptr [si+0FBh], 0
		jnz	short loc_B2A4
		call	sub_595D0
		cmp	byte_5B471, 0
		jz	short loc_B292
		call	sub_595D5
		jmp	short loc_B297

loc_B292:
		call	sub_595A0

loc_B297:
		mov	al, byte_603DE
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp+var_5], al

loc_B2A4:
		mov	[bp+var_4], 1
		jmp	short loc_B325

loc_B2AA:
		mov	al, [si+10Eh]
		mov	[si+10Dh], al
		mov	byte ptr [si+10Eh], 0FFh
		jmp	short loc_B325

loc_B2B9:
		push	ds
		push	offset unk_5A684
		push	ds
		mov	ax, si
		add	ax, 0A7h
		push	ax
		push	ds
		push	offset aSaved_2
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_5E]
		push	ax
		push	si
		call	sub_BFE1
		add	sp, 4
		push	ds
		push	offset aTMP
		push	ds
		push	offset aGensave
		push	ds
		push	offset a__2
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_5E]
		push	ax
		push	si
		call	sub_BBDF
		add	sp, 4
		mov	[bp+var_3], 0
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		jmp	short loc_B322

loc_B317:
		push	25h
		push	word_5A545
		call	sub_9D78

loc_B322:
		add	sp, 4

loc_B325:
		mov	byte ptr [si+0FCh], 4
		cmp	[bp+var_4], 0
		jnz	short loc_B333
		jmp	loc_B4DA

loc_B333:
		push	100h
		push	0
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_Alloc_46A29
		add	sp, 6
		mov	byte ptr [bp+var_E], 0
		mov	byte ptr [bp+var_E+1], 0
		mov	byte ptr [bp+var_C], 0
		push	[bp+var_A]
		mov	al, byte ptr [bp+var_8]
		push	ax
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_FillRange_46CC8
		add	sp, 8
		push	0
		push	[bp+var_A]
		mov	al, byte ptr [bp+var_8]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		call	Palette_Upload_46BA1
		add	sp, 8
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		lea	ax, [bp+var_A]
		push	ax
		call	sub_46E08
		pop	cx

loc_B394:
		mov	[bp+var_6], 1
		cmp	byte ptr [si+0FBh], 1
		jnz	short loc_B3A5
		mov	byte ptr [bp+var_8], 0
		jmp	short loc_B3B5

loc_B3A5:
		mov	al, [bp+var_5]
		push	ax
		push	si
		call	sub_58B15
		add	sp, 4
		mov	byte ptr [bp+var_8], al

loc_B3B5:
		mov	al, byte ptr [bp+var_8]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 6
		jbe	short loc_B3C4
		jmp	loc_B4CE

loc_B3C4:
		shl	bx, 1
		jmp	cs:off_B576[bx]	; switch jump

loc_B3CB:
		push	si
		call	sub_58A9F
		pop	cx
		cmp	byte ptr [si+0FBh], 1
		jnz	short loc_B3DC
		jmp	loc_B4CE

loc_B3DC:
		mov	byte_5BD3A, 1
		push	si
		call	sub_58B10
		pop	cx
		mov	byte_5BD3A, 0
		jmp	loc_B4CE

loc_B3F0:
		push	ds
		push	offset aTMP
		push	ds
		push	offset aGensave
		push	ds
		push	offset a__2
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_5E]
		push	ax
		push	si
		call	sub_BFE1
		add	sp, 4
		mov	[bp+var_3], 0
		push	0
		push	6040h
		call	sub_13C38
		add	sp, 4
		push	0
		push	word_5DD44
		call	TextFormat_ReleaseAttribute_47B53
		add	sp, 4
		jmp	loc_B4CE

loc_B437:
		cmp	byte ptr [si+0A7h], 0
		jnz	short loc_B441
		jmp	loc_B4CA

loc_B441:
		mov	[bp+var_3], 0
		mov	byte ptr [si+0FCh], 3
		jmp	loc_B4CE
		jmp	short loc_B4CA

loc_B44F:
		cmp	byte ptr [si+0A7h], 0
		jz	short loc_B4CA
		mov	byte ptr [si+10Ch], 0FEh
		mov	byte ptr [si+0FCh], 1
		mov	[bp+var_3], 0
		mov	di, 2
		jmp	short loc_B4CE
		jmp	short loc_B4CA

loc_B46B:
		push	si
		call	sub_1368D
		pop	cx
		or	al, al
		jz	short loc_B4CA
		push	965h
		mov	ax, si
		add	ax, 0A7h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	byte ptr [si+10Ch], 0FEh
		mov	byte ptr [si+0FCh], 1
		mov	[bp+var_3], 0
		push	7
		call	sub_59780
		pop	cx
		jmp	short loc_B4CE
		jmp	short loc_B4CA

loc_B4A1:
		push	si
		call	sub_25873
		pop	cx
		jmp	short loc_B4CA

loc_B4AA:
		cmp	byte_5B471, 0
		jz	short loc_B4B8
		call	sub_595D5
		jmp	short loc_B4BD

loc_B4B8:
		call	sub_595A0

loc_B4BD:
		mov	al, byte_603DE
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp+var_5], al

loc_B4CA:
		mov	[bp+var_6], 0

loc_B4CE:
		mov	al, [bp+var_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_B4DA
		jmp	loc_B394

loc_B4DA:
		mov	byte ptr [si+0F7h], 1
		cmp	[bp+var_3], 0
		jz	short loc_B539
		push	si
		call	sub_58AA9
		pop	cx
		mov	ax, si
		add	ax, 7
		push	ax
		mov	al, [si+6]
		push	ax
		push	si
		push	cs
		call	near ptr Gameflow_RunScript_A9C9
		add	sp, 6
		cmp	byte ptr [si+0FCh], 4
		jz	short loc_B50C
		cmp	byte ptr [si+0FCh], 2
		jnz	short loc_B539

loc_B50C:
		push	ds
		push	offset aTMP
		push	ds
		push	offset aGensave
		push	ds
		push	offset a__2
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_Concat3_1F089
		add	sp, 0Eh
		lea	ax, [bp+var_5E]
		push	ax
		push	si
		call	sub_BBDF
		add	sp, 4
		jmp	short loc_B539

loc_B533:
		push	si
		push	cs
		call	near ptr sub_AF4C
		pop	cx

loc_B539:
		cmp	byte ptr [si+0FCh], 4
		jz	short loc_B533
		push	0
		push	6040h
		call	sub_13C38
		add	sp, 4
		cmp	byte ptr [si+0FCh], 1
		jz	short loc_B557
		jmp	loc_B1C8

loc_B557:
		cmp	byte ptr [si+10Ch], 0FEh
		jz	short loc_B565
		push	si
		call	sub_58AC7
		pop	cx

loc_B565:
		push	si
		call	sub_58ACC
		pop	cx
		mov	[bp+var_2], di
		mov	ax, [bp+var_2]
		pop	di
		pop	si
		leave
		retf
Gameflow_MainLoop_B155		endp

; START OF FUNCTION CHUNK FOR Gameflow_MainLoop_B155
off_B576	dw offset loc_B3CB
		dw offset loc_B3F0
		dw offset loc_B437
		dw offset loc_B46B
		dw offset loc_B44F
		dw offset loc_B4A1
		dw offset loc_B4AA
off_B584	dw offset loc_B20E
		dw offset loc_B20E
		dw offset loc_B21E
		dw offset loc_B239
		dw offset loc_B23F
		dw offset loc_B245
		dw offset loc_B271
		dw offset loc_B325
		dw offset loc_B325
		dw offset loc_B22D
		dw offset loc_B233
off_B59A	dw offset loc_B278
		dw offset loc_B1EB
		dw offset loc_B2AA
		dw offset loc_B2B9
; END OF FUNCTION CHUNK FOR Gameflow_MainLoop_B155

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B5A2		proc far
		push	bp
		mov	bp, sp
		mov	dword_5FD45, 0
		mov	byte_5FD49, 2
		mov	byte_5FD4A, 0
		mov	dword_5FD4B, 0
		mov	word_5FD53, 96Dh
		mov	ax, word_5DD68
		mov	word_5FD55, ax
		mov	word_5DD68, 6033h
		mov	word_5FD53, 975h
		mov	dword_5FD57, 0
		mov	byte_5FD5B, 0
		mov	word_5FD4F, 0
		mov	word_5FD51, 0FFFFh
		pop	bp
		retf
sub_B5A2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B5F5		proc far
		push	bp
		mov	bp, sp
		push	602Fh
		call	Music_ChannelStopSequence_1A6AA
		pop	cx
		push	2
		push	6033h
		call	sub_19116
		add	sp, 4
		cmp	byte_5FD4A, 0
		jz	short loc_B633
		cmp	dword_5FD45, 0
		jz	short loc_B633
		push	0
		mov	al, byte_5FD49
		push	ax
		push	6025h
		push	67B0h
		call	Memory_TypedFree_448A4
		add	sp, 8
		jmp	short loc_B633

loc_B633:
		mov	dword_5FD45, 0
		mov	byte_5FD4A, 0
		mov	dword_5FD4B, 0
		pop	bp
		retf
sub_B5F5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B64C		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_B668

loc_B65D:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jz	short loc_B679

loc_B668:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_B65D

loc_B679:
		cmp	[bp+var_2], 0
		jz	short loc_B687
		mov	bx, [bp+var_2]
		mov	ax, [bx+5]
		jmp	short loc_B689

loc_B687:
		xor	ax, ax

loc_B689:
		pop	si
		leave
		retf
sub_B64C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B68C		proc far

var_6		= word ptr -6
var_3		= byte ptr -3
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, [bp+arg_2]
		mov	[bp+var_3], al
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		push	7
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_B6CE
		mov	word ptr [di], 0A2Dh
		mov	word ptr [di+2], 0
		mov	word ptr [di], 97Dh
		mov	al, [bp+var_3]
		mov	[di+4], al
		mov	ax, [bp+var_6]
		mov	[di+5], ax
		mov	ax, di
		jmp	short loc_B6D0

loc_B6CE:
		mov	ax, di

loc_B6D0:
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_48623
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_B68C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B6E1		proc far

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
		jz	short loc_B744
		mov	word ptr [si], 9B1h
		jmp	short loc_B716

loc_B6F9:
		mov	bx, [bp+var_2]
		push	word ptr [bx+5]
		mov	bx, [bx+5]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_48648
		add	sp, 6

loc_B716:
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_4874D
		add	sp, 4
		or	ax, ax
		jnz	short loc_B6F9
		mov	word ptr [si], 492h
		push	si
		call	sub_4870F
		pop	cx
		test	di, 1
		jz	short loc_B744
		push	si
		call	sub_33B
		pop	cx

loc_B744:
		pop	di
		pop	si
		leave
		retf
sub_B6E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B748		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_B766
		mov	word ptr [si], 97Dh
		test	ax, 1
		jz	short loc_B766
		push	si
		call	sub_33B
		pop	cx

loc_B766:
		pop	si
		pop	bp
		retf
sub_B748		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B769		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B7DD
		mov	word ptr [si], 981h
		mov	word ptr [si+0Ah], 9A1h
		call	TextScrollDisplayB_ApplyHelperD_571DE
		mov	byte_6065A, 0
		cmp	word ptr [si+2Dh], 0
		jz	short loc_B7A9
		mov	ax, [si+2Dh]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	word ptr [si+2Dh]
		call	sub_33B
		pop	cx
		jmp	short loc_B7A9

loc_B7A9:
		push	2
		mov	ax, si
		add	ax, 39h
		push	ax
		call	sub_16E11
		add	sp, 4
		mov	ax, si
		add	ax, 1Fh
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	0
		push	si
		call	Scene_Destruct_45CB8
		add	sp, 4
		test	di, 1
		jz	short loc_B7DD
		push	si
		call	sub_33B
		pop	cx

loc_B7DD:
		pop	di
		pop	si
		pop	bp
		retf
sub_B769		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B7E1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_B7E1		endp

; ----------------------------------------------------------------------

sub_B7E9		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_45CFB
sub_B7E9		endp

; ----------------------------------------------------------------------

sub_B7F5		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_45D1D
sub_B7F5		endp

; ----------------------------------------------------------------------

sub_B801		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_45CF3
sub_B801		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de PACIFIC.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AircraftDamageModel_ReleaseStreamAndDestruct_85499
; (sub_85499 de PACIFIC.EXE). Résumé repris de PACIFIC.EXE ; appelants et contexte à
; revérifier ici. — Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s)
; différent(s) (adresses de données ou constantes) — à vérifier à
; AircraftDamageModel_ReleaseStreamAndDestruct_7556A (sub_7556A de STRIKE.EXE). Résumé repris
; de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, combine
; ResourceRecord_Helper_645A5 (seg193), StreamReader_ReleaseBuffer_65643 (seg195), libère
; l'objet (sub_338).
; ==============================================================================================
AircraftDamageModel_ReleaseStreamAndDestruct_B80D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B83F
		mov	word ptr [si], 9CDh
		push	si
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		test	di, 1
		jz	short loc_B83F
		push	si
		call	sub_33B
		pop	cx

loc_B83F:
		pop	di
		pop	si
		pop	bp
		retf
AircraftDamageModel_ReleaseStreamAndDestruct_B80D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B843		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_B855
		jmp	loc_B907

loc_B855:
		mov	word ptr [si], 9E5h
		mov	word ptr [si+0A8h], 9FDh
		mov	word ptr [si+0B2h], 0A1Dh
		mov	ax, si
		add	ax, 110h
		push	ax
		call	sub_46E08
		pop	cx
		push	2
		mov	ax, si
		add	ax, 10Ah
		push	ax
		nop
		push	cs
		call	near ptr sub_B6E1
		add	sp, 4
		mov	word ptr [si+0A8h], 981h
		mov	word ptr [si+0B2h], 9A1h
		call	TextScrollDisplayB_ApplyHelperD_571DE
		mov	byte_6065A, 0
		cmp	word ptr [si+0D5h], 0
		jz	short loc_B8B8
		mov	ax, [si+0D5h]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	word ptr [si+0D5h]
		call	sub_33B
		pop	cx
		jmp	short loc_B8B8

loc_B8B8:
		push	2
		mov	ax, si
		add	ax, 0E1h
		push	ax
		call	sub_16E11
		add	sp, 4
		mov	ax, si
		add	ax, 0C7h
		push	ax
		call	TextFormat_ReleaseStyleList_47ACD
		pop	cx
		push	0
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	Scene_Destruct_45CB8
		add	sp, 4
		mov	word ptr [si], 9CDh
		push	si
		call	ResourceRecord_Helper_53B24
		pop	cx
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_544B1
		add	sp, 4
		test	di, 1
		jz	short loc_B907
		push	si
		call	sub_33B
		pop	cx

loc_B907:
		pop	di
		pop	si
		pop	bp
		retf
sub_B843		endp

; ----------------------------------------------------------------------

sub_B90B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_45CFB
sub_B90B		endp

; ----------------------------------------------------------------------

sub_B917		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_45D1D
sub_B917		endp

; ----------------------------------------------------------------------

sub_B923		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_45CF3
sub_B923		endp

; ----------------------------------------------------------------------

sub_B92F		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FF58h
		nop
		nop
		jmp	sub_B843
sub_B92F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B93C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_B95A
		mov	word ptr [si], 0A2Dh
		test	ax, 1
		jz	short loc_B95A
		push	si
		call	sub_33B
		pop	cx

loc_B95A:
		pop	si
		pop	bp
		retf
sub_B93C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B95D		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_B98C
		mov	word ptr [si], 0A31h
		cmp	word ptr [si+5], 0
		jz	short loc_B97F
		push	word ptr [si+5]
		call	sub_33B
		pop	cx

loc_B97F:
		test	di, 1
		jz	short loc_B98C
		push	si
		call	sub_33B
		pop	cx

loc_B98C:
		pop	di
		pop	si
		pop	bp
		retf
sub_B95D		endp
seg019		ends
