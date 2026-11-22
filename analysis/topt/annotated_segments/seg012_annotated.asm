seg012		segment	para public 'CODE' use16
		assume cs:seg012
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_77A1		proc far

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
		jz	short loc_77FE
		mov	word ptr [si], 138Ah
		mov	[bp+var_2], 0
		jmp	short loc_77D1

loc_77BE:
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_3663B
		add	sp, 6
		mov	[bp+var_2], 0

loc_77D1:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_77BE
		mov	word ptr [si], 1E4h
		push	si
		call	sub_36702
		add	sp, 2
		test	di, 1
		jz	short loc_77FE
		push	si
		call	sub_39C
		add	sp, 2

loc_77FE:
		pop	di
		pop	si
		leave
		retf
sub_77A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7802		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_38B8C
		mov	[si+20h], ax
		cmp	word ptr [si+20h], 1
		jle	short loc_783B
		mov	byte ptr [si+1Dh], 1
		mov	word ptr [si+1Bh], 1
		jmp	short loc_783F

loc_783B:
		mov	byte ptr [si+1Dh], 0

loc_783F:
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
sub_7802		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7866		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+16h], 0
		jz	short loc_7893
		cmp	dword ptr [si+11h], 0
		jz	short loc_7893
		push	0
		mov	al, [si+15h]
		push	ax
		mov	ax, si
		add	ax, 11h
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_7893

loc_7893:
		mov	dword ptr [si+11h], 0
		mov	byte ptr [si+16h], 0
		mov	dword ptr [si+17h], 0
		pop	si
		pop	bp
		retf
sub_7866		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à TalkingHead_SetBaseFrame_9D32 (sub_9D32 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Image de base +2118 et image affichée +2124 = arg_2.
; ==============================================================================================
TalkingHead_SetBaseFrame_78AA		proc far

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
TalkingHead_SetBaseFrame_78AA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_78BE		proc far

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
sub_78BE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_78D4		proc far

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
		add	sp, 2
		mov	[bp+var_2], ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+8]
		add	sp, 2
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_6], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_8], ax
		push	0
		push	0
		mov	al, [si+15h]
		push	ax
		push	word ptr [si+13h]
		push	word ptr [si+11h]
		push	6C14h
		call	Memory_TypedAllocDispatchB_329B1
		add	sp, 0Ah
		push	dx
		push	ax
		push	[bp+var_8]
		push	[bp+var_6]
		push	word_4D36C
		call	Shape_DrawSpans_38514
		add	sp, 0Ch
		push	si
		call	Layer_DrawAtOwnPos_3424E
		add	sp, 2
		pop	si
		leave
		retf
sub_78D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_793B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+2Ch], 1
		pop	si
		pop	bp
		retf
sub_793B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7949		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+2Ch], 0
		pop	si
		pop	bp
		retf
sub_7949		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7957		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+1Dh], 0
		jnz	short loc_7967
		jmp	loc_79F8

loc_7967:
		cmp	byte ptr [si+2Ch], 0
		jz	short loc_799B
		mov	ax, [si+1Bh]
		cmp	ax, [si+22h]
		jb	short loc_797D
		mov	ax, [si+1Bh]
		cmp	ax, [si+24h]
		jbe	short loc_7985

loc_797D:
		mov	ax, [si+22h]
		mov	[si+1Bh], ax
		jmp	short loc_7990

loc_7985:
		mov	ax, [si+1Bh]
		cmp	ax, [si+24h]
		jz	short loc_7990
		inc	word ptr [si+1Bh]

loc_7990:
		mov	word ptr [si+28h], 0
		mov	byte ptr [si+2Ch], 0
		jmp	short loc_79F8

loc_799B:
		cmp	word ptr [si+2Ah], 0
		jz	short loc_79DF
		mov	ax, [si+1Bh]
		cmp	ax, [si+22h]
		ja	short loc_79CA
		mov	ax, [si+28h]
		shl	ax, 1
		mov	bx, [si+26h]
		add	bx, ax
		mov	ax, [bx]
		mov	[si+1Bh], ax
		inc	word ptr [si+28h]
		mov	ax, [si+28h]
		cmp	ax, [si+2Ah]
		jl	short loc_79C8
		mov	word ptr [si+28h], 0

loc_79C8:
		jmp	short loc_79DD

loc_79CA:
		inc	word ptr [si+1Bh]
		mov	ax, [si+1Bh]
		cmp	ax, [si+20h]
		jb	short loc_79DD
		mov	bx, [si+26h]
		mov	ax, [bx]
		mov	[si+1Bh], ax

loc_79DD:
		jmp	short loc_79F8

loc_79DF:
		inc	word ptr [si+1Bh]
		mov	ax, [si+22h]
		inc	ax
		cmp	ax, [si+1Bh]
		jz	short loc_79F3
		mov	ax, [si+1Bh]
		cmp	ax, [si+20h]
		jb	short loc_79F8

loc_79F3:
		mov	word ptr [si+1Bh], 1

loc_79F8:
		push	si
		call	sub_33C79
		add	sp, 2
		pop	si
		pop	bp
		retf
sub_7957		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7A04		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_8]
		or	si, si
		jnz	short loc_7A29
		push	40h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jnz	short loc_7A29
		jmp	loc_7ABE

loc_7A29:
		push	[bp+arg_6]
		mov	al, [bp+arg_4]
		push	ax
		push	[bp+arg_2]
		push	si
		call	LayerGroup_Construct_33CB2
		add	sp, 8
		mov	word ptr [si], 44Ch
		mov	word ptr [si+0Ah], 46Ch
		mov	word ptr [si+1Fh], 0
		mov	word ptr [si+21h], 0
		mov	byte ptr [si+2Ch], 0
		mov	word ptr [si+3Ah], 1E4h
		xor	ax, ax
		mov	[si+3Eh], ax
		mov	[si+3Ch], ax
		mov	word ptr [si+3Ah], 138Ah
		mov	word ptr [si+23h], 0
		mov	word ptr [si+25h], 0
		mov	word ptr [si+27h], 13Fh
		mov	word ptr [si+29h], 0C7h
		push	0
		mov	ax, si
		add	ax, 1Fh
		push	ax
		call	TextRenderer_ApplyFormatChange_3584E
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 1Fh
		push	ax
		push	0
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		mov	[si+2Dh], ax
		mov	[bp+var_2], di
		mov	bx, [si+2Dh]
		mov	ax, [bp+var_2]
		mov	[bx+14h], ax
		mov	word ptr [si+37h], 0
		mov	byte ptr [si+30h], 0
		mov	byte ptr [si+31h], 0
		mov	byte ptr [si+32h], 0FFh
		mov	byte ptr [si+39h], 0

loc_7ABE:
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
sub_7A04		endp

; START OF FUNCTION CHUNK FOR sub_7A04
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_7A04

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7AC8		proc far

var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	bx, [bp+var_4]
		mov	ax, [bx]
		mov	[bp+var_C], ax
		mov	bx, [bp+var_4]
		mov	ax, [bx+2]
		mov	[bp+var_A], ax
		mov	bx, [bp+var_4]
		mov	ax, [bx+4]
		mov	[bp+var_8], ax
		mov	bx, [bp+var_4]
		mov	ax, [bx+6]
		mov	[bp+var_6], ax
		mov	al, [bp+arg_4]
		mov	[bp+var_D], al
		mov	ax, [bp+arg_6]
		mov	[bp+var_10], ax
		push	16h
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_7B8E
		mov	ax, [bp+var_C]
		mov	[bp+var_18], ax
		mov	ax, [bp+var_A]
		mov	[bp+var_16], ax
		mov	ax, [bp+var_8]
		mov	[bp+var_14], ax
		mov	ax, [bp+var_6]
		mov	[bp+var_12], ax
		mov	word ptr [di], 4F8h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 135Eh
		mov	ax, [bp+var_18]
		mov	[di+6], ax
		mov	ax, [bp+var_16]
		mov	[di+8], ax
		mov	ax, [bp+var_14]
		mov	[di+0Ah], ax
		mov	ax, [bp+var_12]
		mov	[di+0Ch], ax
		push	[bp+var_10]
		call	CRT_Strdup
		add	sp, 2
		mov	[di+4], ax
		mov	word ptr [di+0Eh], 4F8h
		mov	word ptr [di+10h], 0
		mov	word ptr [di+0Eh], 134Ah
		mov	word ptr [di], 1362h
		mov	word ptr [di+0Eh], 1376h
		mov	byte ptr [di+15h], 0
		mov	word ptr [di+12h], 0
		mov	al, [bp+var_D]
		mov	[di+14h], al
		mov	ax, di
		jmp	short loc_7B90

loc_7B8E:
		mov	ax, di

loc_7B90:
		mov	[bp+var_1A], ax
		cmp	[bp+var_1A], 0
		jz	short loc_7BA1
		mov	ax, [bp+var_1A]
		add	ax, 0Eh
		jmp	short loc_7BA4

loc_7BA1:
		mov	ax, [bp+var_1A]

loc_7BA4:
		mov	[bp+var_2], ax
		push	[bp+var_2]
		mov	ax, si
		add	ax, 3Ah
		push	ax
		call	LinkedListB_InsertAtTail_36616
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_7AC8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7BBC		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h
arg_C		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_A], ax
		mov	al, [bp+arg_A]
		mov	[bp+var_B], al
		mov	ax, [bp+arg_C]
		mov	[bp+var_E], ax
		push	1Ch
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	di, ax
		or	ax, ax
		jz	short loc_7C5C
		mov	bx, [bp+var_4]
		mov	eax, [bx]
		mov	[di], eax
		mov	bx, [bp+var_6]
		mov	eax, [bx]
		mov	[di+4], eax
		mov	bx, [bp+var_8]
		mov	eax, [bx]
		mov	[di+8], eax
		mov	bx, [bp+var_A]
		mov	eax, [bx]
		mov	[di+0Ch], eax
		mov	word ptr [di+10h], 4F8h
		mov	word ptr [di+12h], 0
		mov	word ptr [di+10h], 134Ah
		mov	word ptr [di+18h], 1322h
		mov	word ptr [di+10h], 1336h
		mov	byte ptr [di+17h], 0
		mov	word ptr [di+14h], 0
		push	[bp+var_E]
		call	CRT_Strdup
		add	sp, 2
		mov	[di+1Ah], ax
		mov	al, [bp+var_B]
		mov	[di+16h], al
		mov	ax, di
		jmp	short loc_7C5E

loc_7C5C:
		mov	ax, di

loc_7C5E:
		mov	[bp+var_10], ax
		cmp	[bp+var_10], 0
		jz	short loc_7C6F
		mov	ax, [bp+var_10]
		add	ax, 10h
		jmp	short loc_7C72

loc_7C6F:
		mov	ax, [bp+var_10]

loc_7C72:
		mov	[bp+var_2], ax
		push	[bp+var_2]
		mov	ax, si
		add	ax, 3Ah
		push	ax
		call	LinkedListB_InsertAtTail_36616
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_7BBC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7C8A		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_2], 0
		jmp	short loc_7CB4

loc_7C9F:
		mov	bx, [bp+var_2]
		mov	al, [bx+6]
		cmp	al, [bp+arg_4]
		jnz	short loc_7CB4
		mov	bx, [bp+var_2]
		mov	[bx+4], di
		pop	di
		pop	si
		leave
		retf

loc_7CB4:
		lea	ax, [bp+var_2]
		push	ax
		mov	ax, si
		add	ax, 3Ah
		push	ax
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_7C9F
		push	0
		push	word_49CCC
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_7C8A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7CDC		proc far

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
sub_7CDC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7CF8		proc far

var_4		= word ptr -4
var_1		= byte ptr -1
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, word_4F7D6
		mov	[bp+var_1], 0
		mov	word ptr [si+37h], 0
		mov	[bp+var_4], 0
		jmp	short loc_7D42

loc_7D17:
		push	word ptr [si+35h]
		push	word ptr [si+33h]
		push	[bp+var_4]
		mov	bx, [bp+var_4]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 6
		or	al, al
		jz	short loc_7D42
		mov	bx, [bp+var_4]
		cmp	byte ptr [bx+7], 0
		jz	short loc_7D42
		mov	[bp+var_1], 1
		mov	ax, [bp+var_4]
		mov	[si+37h], ax

loc_7D42:
		lea	ax, [bp+var_4]
		push	ax
		mov	ax, si
		add	ax, 3Ah
		push	ax
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_7D17
		cmp	[bp+var_1], 0
		jz	short loc_7D82
		push	word ptr [si+37h]
		push	si
		nop
		push	cs
		call	near ptr sub_7DE8
		add	sp, 4
		or	di, di
		jz	short loc_7D7E
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	word_4F7D6, 0
		call	TextScrollDisplayB_ApplyHelperC_45522

loc_7D7E:
		pop	di
		pop	si
		leave
		retf

loc_7D82:
		cmp	di, 1
		jz	short loc_7D97
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	word_4F7D6, 1
		call	TextScrollDisplayB_ApplyHelperC_45522

loc_7D97:
		pop	di
		pop	si
		leave
		retf
sub_7CF8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7D9B		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	ax, word_4DE0E
		mov	[bp+var_2], ax
		mov	ax, word_4DE10
		mov	[bp+var_4], ax
		mov	ax, [si+33h]
		cmp	ax, [bp+var_2]
		jnz	short loc_7DC1
		mov	ax, [si+35h]
		cmp	ax, [bp+var_4]
		jz	short loc_7DE0

loc_7DC1:
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_2]
		push	ax
		push	si
		push	cs
		call	near ptr sub_7CDC
		add	sp, 6
		push	si
		push	cs
		call	near ptr sub_7CF8
		add	sp, 2
		mov	al, 1
		pop	si
		leave
		retf
		jmp	short loc_7DE5

loc_7DE0:
		mov	al, 0
		pop	si
		leave
		retf
sub_7D9B		endp

; START OF FUNCTION CHUNK FOR sub_7D9B

loc_7DE5:
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_7D9B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7DE8		proc far

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
		add	sp, 2
		push	ax
		push	2
		push	1305h
		push	word ptr [si+2Dh]
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah
		pop	di
		pop	si
		pop	bp
		retf
sub_7DE8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_7E14		proc far

var_8C		= word ptr -8Ch
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_2C		= dword ptr -2Ch
var_28		= byte ptr -28h
var_27		= byte ptr -27h
var_26		= dword ptr -26h
var_22		= word ptr -22h
var_1F		= byte ptr -1Fh
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= dword ptr -1Ah
var_16		= word ptr -16h
var_14		= word ptr -14h
var_11		= byte ptr -11h
var_10		= word ptr -10h
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_8		= word ptr -8
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8Ch
		push	si
		push	di
		mov	si, [bp+arg_0]
		call	Input_Flush_116D1
		mov	byte ptr [bp+var_8], 0
		mov	[bp+var_D], 0
		mov	[bp+var_10], 0
		push	0
		push	word_4D36E
		call	TextScrollDisplayB_ApplyHelperA_45482
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperC_45522
		mov	dword ptr [si+19h], 0
		mov	eax, dword_4DE15
		mov	[si+15h], eax
		push	si
		push	cs
		call	near ptr sub_7D9B
		add	sp, 2

loc_7E5D:
		call	sub_11A88
		mov	eax, [si+15h]
		add	eax, [si+19h]
		cmp	eax, dword_4DE15
		ja	short loc_7E76
		mov	ax, 1
		jmp	short loc_7E78

loc_7E76:
		xor	ax, ax

loc_7E78:
		or	al, al
		jnz	short loc_7E7F
		jmp	loc_8057

loc_7E7F:
		mov	ax, si
		add	ax, 1Fh
		mov	[bp+var_16], ax
		push	[bp+var_16]
		lea	ax, [bp+var_14]
		push	ax
		call	sub_3499B
		add	sp, 4
		movzx	eax, word ptr [si+10h]
		mov	[bp+var_1A], eax
		mov	eax, [bp+var_1A]
		mov	[si+19h], eax
		mov	eax, dword_4DE15
		mov	[si+15h], eax
		mov	[bp+var_1C], 0
		jmp	short loc_7ED0

loc_7EB6:
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_1C]
		push	word ptr [bx+6]
		mov	bx, [bp+var_1C]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_7ED0:
		lea	ax, [bp+var_1C]
		push	ax
		mov	ax, si
		add	ax, 4
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_7EB6
		mov	[bp+var_1E], 0
		xor	di, di
		jmp	loc_7F86

loc_7EF0:
		mov	bx, [bp+var_1E]
		cmp	byte ptr [bx+7], 0
		jnz	short loc_7EFC
		jmp	loc_7F86

loc_7EFC:
		mov	ax, [si+37h]
		cmp	ax, [bp+var_1E]
		jnz	short loc_7F46
		mov	bx, [bp+var_1E]
		cmp	word ptr [bx+4], 0
		jz	short loc_7F34
		mov	bx, [bp+var_1E]
		push	word ptr [bx+4]
		push	cs
		call	near ptr sub_793B
		add	sp, 2
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_1E]
		push	word ptr [bx+4]
		mov	bx, [bp+var_1E]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_7F34:
		push	[bp+var_1E]
		mov	bx, [bp+var_1E]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 2
		mov	di, ax
		jmp	short loc_7F69

loc_7F46:
		mov	bx, [bp+var_1E]
		cmp	word ptr [bx+4], 0
		jz	short loc_7F69
		push	word ptr [si+0Eh]
		push	word ptr [si+0Ch]
		mov	bx, [bp+var_1E]
		push	word ptr [bx+4]
		mov	bx, [bp+var_1E]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_7F69:
		mov	bx, [bp+var_1E]
		cmp	word ptr [bx+4], 0
		jz	short loc_7F86
		mov	bx, [bp+var_1E]
		push	word ptr [bx+4]
		mov	bx, [bp+var_1E]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 2

loc_7F86:
		lea	ax, [bp+var_1E]
		push	ax
		mov	ax, si
		add	ax, 3Ah
		push	ax
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jz	short loc_7F9F
		jmp	loc_7EF0

loc_7F9F:
		or	di, di
		jz	short loc_7FB7
		push	0AFh
		push	di
		push	2
		push	130Ch
		push	word ptr [si+2Dh]
		call	Widget_RenderComplexLayoutWrapper_375C2
		add	sp, 0Ah

loc_7FB7:
		push	word_4D36C
		call	sub_45695
		add	sp, 2
		push	word_4D36C
		push	word ptr [si+13h]
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		push	word_4D36C
		call	sub_456A7
		add	sp, 2
		push	si
		mov	bx, [si]
		call	dword ptr [bx+1Ch]
		add	sp, 2
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_7FF8
		push	si
		push	cs
		call	near ptr sub_7CF8
		add	sp, 2

loc_7FF8:
		cmp	[bp+var_D], 0
		jz	short loc_804B
		cmp	word ptr [si+37h], 0
		jz	short loc_804B
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	ax, [bx+20h]
		dec	ax
		cmp	ax, [bp+var_10]
		jnz	short loc_8036
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	bx, [si+37h]
		mov	al, [bx+6]
		mov	[bp+var_1F], al
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		mov	al, [bp+var_1F]
		pop	di
		pop	si
		leave
		retf
		jmp	short loc_804B

loc_8036:
		inc	[bp+var_10]
		mov	ax, [bp+var_10]
		mov	[bp+var_22], ax
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	ax, [bp+var_22]
		mov	[bx+1Bh], ax

loc_804B:
		lea	ax, [bp+var_14]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2

loc_8057:
		lea	ax, [bp+var_8]
		push	ax
		call	TextScroll_FormatAndApply_44826
		add	sp, 2
		cmp	byte ptr [bp+var_8], 0
		jnz	short loc_808F
		lea	ax, [bp+var_8]
		push	ax
		call	sub_AB45
		add	sp, 2
		mov	ah, 0
		or	ax, ax
		jnz	short loc_808D
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		call	sub_A981
		add	sp, 4
		jmp	short loc_808D

loc_808D:
		jmp	short loc_808F

loc_808F:
		cmp	byte ptr [bp+var_8], 0
		jnz	short loc_8098
		jmp	loc_8260

loc_8098:
		mov	al, [bp+var_D]
		mov	ah, 0
		or	ax, ax
		jz	short loc_80A4
		jmp	loc_8260

loc_80A4:
		mov	al, byte ptr [bp+var_8]
		mov	ah, 0
		cmp	ax, 2
		jz	short loc_80B9
		cmp	ax, 3
		jnz	short loc_80B6
		jmp	loc_8252

loc_80B6:
		jmp	loc_8260

loc_80B9:
		push	si
		push	cs
		call	near ptr sub_7D9B
		add	sp, 2
		cmp	byte ptr [bp+var_8+1], 2
		jnz	short loc_80CC
		mov	ax, 1
		jmp	short loc_80CE

loc_80CC:
		xor	ax, ax

loc_80CE:
		mov	[si+30h], al
		cmp	word ptr [si+37h], 0
		jz	short loc_8138
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		mov	al, [bx+2Dh]
		mov	[bp+var_11], al
		mov	bx, [si+37h]
		cmp	word ptr [bx+4], 0
		jz	short loc_8112
		mov	bx, [si+37h]
		mov	bx, [bx+4]
		cmp	byte ptr [bx+1Eh], 0
		jz	short loc_8112
		mov	[bp+var_D], 1
		cmp	[bp+var_11], 0FFh
		jz	short loc_8110
		mov	al, [bp+var_11]
		mov	ah, 0
		push	ax
		call	sub_2D974
		add	sp, 2

loc_8110:
		jmp	short loc_8135

loc_8112:
		call	TextScrollDisplayB_ApplyHelperD_4555C
		cmp	[bp+var_11], 0FFh
		jz	short loc_812B
		mov	al, [bp+var_11]
		mov	ah, 0
		push	ax
		call	sub_2D974
		add	sp, 2

loc_812B:
		mov	bx, [si+37h]
		mov	al, [bx+6]
		pop	di
		pop	si
		leave
		retf

loc_8135:
		jmp	loc_8252

loc_8138:
		cmp	byte ptr [si+39h], 1
		jz	short loc_8141
		jmp	loc_8252

loc_8141:
		cmp	word ptr [si+33h], 90h
		jnb	short loc_814B
		jmp	loc_8252

loc_814B:
		cmp	word ptr [si+35h], 3Ah
		jnb	short loc_8154
		jmp	loc_8252

loc_8154:
		cmp	word ptr [si+33h], 0A3h
		jbe	short loc_815E
		jmp	loc_8252

loc_815E:
		cmp	word ptr [si+35h], 3Fh
		jbe	short loc_8167
		jmp	loc_8252

loc_8167:
		mov	[bp+var_3C], 129Fh
		mov	[bp+var_2C], 0
		mov	[bp+var_28], 2
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0
		mov	[bp+var_3A], 0
		mov	[bp+var_3C], 12AFh
		push	word_4CA5B
		lea	ax, [bp+var_3C]
		push	ax
		call	VoicePlayer_SetDriver_B978
		add	sp, 4
		push	ds
		push	offset aVoc
		push	ds
		push	offset a2tw016
		push	ds
		push	offset aF
		lea	ax, [bp+var_8C]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		lea	ax, [bp+var_8C]
		push	ax
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_C97E
		add	sp, 4
		push	0FFFFh
		lea	ax, [bp+var_3C]
		push	ax
		call	sub_CB9D
		add	sp, 4
		jmp	short loc_81F9

loc_81D8:
		call	Input_CheckSkip_11B90
		or	al, al
		jz	short loc_81F9
		cmp	[bp+var_3A], 0
		jz	short loc_81F7
		mov	bx, [bp+var_3A]
		push	word ptr [bx+4]
		call	sub_506B
		add	sp, 2
		jmp	short loc_81F7

loc_81F7:
		jmp	short loc_8209

loc_81F9:
		lea	ax, [bp+var_3C]
		push	ax
		call	VoicePlayer_IsPlaying_CEB0
		add	sp, 2
		or	al, al
		jnz	short loc_81D8

loc_8209:
		mov	[bp+var_3C], 129Fh
		lea	ax, [bp+var_3C]
		push	ax
		call	VoicePlayer_Stop_BACF
		add	sp, 2
		cmp	[bp+var_27], 0
		jz	short loc_823E
		cmp	[bp+var_2C], 0
		jz	short loc_823E
		push	0
		mov	al, [bp+var_28]
		push	ax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_823E

loc_823E:
		mov	[bp+var_2C], 0
		mov	[bp+var_27], 0
		mov	[bp+var_26], 0

loc_8252:
		push	si
		push	cs
		call	near ptr sub_7D9B
		add	sp, 2
		or	al, al
		jz	short loc_8260
		jmp	short loc_8260

loc_8260:
		cmp	byte ptr [bp+var_C], 0
		jz	short loc_828E
		cmp	byte ptr [bp+var_C], 2
		jnz	short loc_828E
		cmp	byte ptr [bp+var_C+1], 1
		jnz	short loc_828E
		cmp	byte ptr [si+32h], 0FFh
		jz	short loc_828E
		call	TextScrollDisplayB_ApplyHelperD_4555C
		call	Input_Flush_116D1
		call	Keyboard_DrainBufferBIOS_45C38
		mov	al, [si+32h]
		pop	di
		pop	si
		leave
		retf

loc_828E:
		jmp	loc_7E5D
sub_7E14		endp

; START OF FUNCTION CHUNK FOR sub_7E14
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_7E14

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8295		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_82F3
		mov	word ptr [si+18h], 1322h
		mov	word ptr [si+10h], 1336h
		cmp	word ptr [si+14h], 0
		jz	short loc_82D9
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 2
		cmp	word ptr [si+14h], 0
		jz	short loc_82D9
		push	3
		push	word ptr [si+14h]
		mov	bx, [si+14h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_82D9

loc_82D9:
		push	word ptr [si+1Ah]
		call	sub_330E8
		add	sp, 2
		test	di, 1
		jz	short loc_82F3
		push	si
		call	sub_39C
		add	sp, 2

loc_82F3:
		pop	di
		pop	si
		pop	bp
		retf
sub_8295		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_82F7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+1Ah]
		pop	si
		pop	bp
		retf
sub_82F7		endp

; START OF FUNCTION CHUNK FOR sub_82F7
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_82F7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8307		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+1Ah], ax
		pop	si
		pop	bp
		retf
sub_8307		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8317		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	[bp+arg_2]
		push	si
		call	sub_1152B
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_8317		endp

; START OF FUNCTION CHUNK FOR sub_8317
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_8317

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8330		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+var_2]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_4]
		mov	[bp+var_6], ax
		lea	ax, [bp+var_8]
		push	ax
		push	si
		call	sub_1152B
		add	sp, 4
		pop	si
		leave
		retf
sub_8330		endp

; START OF FUNCTION CHUNK FOR sub_8330
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_8330

; ----------------------------------------------------------------------

sub_8365		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_8307
sub_8365		endp

; ----------------------------------------------------------------------

sub_8371		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_82F7
sub_8371		endp

; ----------------------------------------------------------------------

sub_837D		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_8330
sub_837D		endp

; ----------------------------------------------------------------------

sub_8389		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_8317
sub_8389		endp

; ----------------------------------------------------------------------

sub_8395		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF0h
		nop
		nop
		jmp	sub_8295
sub_8395		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_83A1		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_83C3
		mov	word ptr [si], 134Ah
		test	di, 1
		jz	short loc_83C3
		push	si
		call	sub_39C
		add	sp, 2

loc_83C3:
		pop	di
		pop	si
		pop	bp
		retf
sub_83A1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_83C7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_83F4
		mov	word ptr [si], 135Eh
		push	word ptr [si+4]
		call	sub_330E8
		add	sp, 2
		test	di, 1
		jz	short loc_83F4
		push	si
		call	sub_39C
		add	sp, 2

loc_83F4:
		pop	di
		pop	si
		pop	bp
		retf
sub_83C7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_83F8		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_8459
		mov	word ptr [si], 1362h
		mov	word ptr [si+0Eh], 1376h
		cmp	word ptr [si+12h], 0
		jz	short loc_843B
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		add	sp, 2
		cmp	word ptr [si+12h], 0
		jz	short loc_843B
		push	3
		push	word ptr [si+12h]
		mov	bx, [si+12h]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_843B

loc_843B:
		mov	word ptr [si], 135Eh
		push	word ptr [si+4]
		call	sub_330E8
		add	sp, 2
		test	di, 1
		jz	short loc_8459
		push	si
		call	sub_39C
		add	sp, 2

loc_8459:
		pop	di
		pop	si
		pop	bp
		retf
sub_83F8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_845D		proc far

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
		mov	cx, [di]
		mov	ax, [di+2]
		mov	[bp+var_2], ax
		cmp	[si+0Ah], cx
		jl	short loc_847D
		cmp	[si+6], cx
		jle	short loc_8481

loc_847D:
		mov	dl, 0
		jmp	short loc_8483

loc_8481:
		mov	dl, 1

loc_8483:
		or	dl, dl
		jz	short loc_849F
		mov	ax, [si+0Ch]
		cmp	ax, [bp+var_2]
		jle	short loc_849B
		mov	ax, [si+8]
		cmp	ax, [bp+var_2]
		jge	short loc_849B
		mov	dl, 1
		jmp	short loc_849D

loc_849B:
		mov	dl, 0

loc_849D:
		jmp	short loc_849F

loc_849F:
		mov	al, dl
		pop	di
		pop	si
		leave
		retf
sub_845D		endp

; START OF FUNCTION CHUNK FOR sub_845D
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR sub_845D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_84A9		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	di, [bp+arg_4]
		cmp	[si+0Ah], cx
		jl	short loc_84C1
		cmp	[si+6], cx
		jle	short loc_84C5

loc_84C1:
		mov	dl, 0
		jmp	short loc_84C7

loc_84C5:
		mov	dl, 1

loc_84C7:
		or	dl, dl
		jz	short loc_84DD
		cmp	[si+0Ch], di
		jle	short loc_84D9
		cmp	[si+8], di
		jge	short loc_84D9
		mov	dl, 1
		jmp	short loc_84DB

loc_84D9:
		mov	dl, 0

loc_84DB:
		jmp	short loc_84DD

loc_84DD:
		mov	al, dl
		pop	di
		pop	si
		pop	bp
		retf
sub_84A9		endp

; START OF FUNCTION CHUNK FOR sub_84A9
		pop	di
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_84A9

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_84E7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [si+4]
		pop	si
		pop	bp
		retf
sub_84E7		endp

; START OF FUNCTION CHUNK FOR sub_84E7
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_84E7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_84F7		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[si+4], ax
		pop	si
		pop	bp
		retf
sub_84F7		endp

; ----------------------------------------------------------------------

sub_8507		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
		jmp	sub_84F7
sub_8507		endp

; ----------------------------------------------------------------------

sub_8513		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
		jmp	sub_84E7
sub_8513		endp

; ----------------------------------------------------------------------

sub_851F		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
		jmp	sub_84A9
sub_851F		endp

; ----------------------------------------------------------------------

sub_852B		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
		jmp	sub_845D
sub_852B		endp

; ----------------------------------------------------------------------

sub_8537		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF2h
		nop
		nop
sub_8537		endp
seg012		ends
