seg143		segment	para public 'CODE' use16
		assume cs:seg143
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 4, 0F6h, 0EAh, 71h, 3, 3Bh, 66h

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60317		proc far

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
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_60354
		mov	word ptr [di], 9B2h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 3AE4h
		mov	al, [bp+var_3]
		mov	ah, 0
		mov	[di+4], ax
		mov	word ptr [di+6], 0
		mov	ax, di
		jmp	short loc_60356

loc_60354:
		mov	ax, di

loc_60356:
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_68A21
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_60317		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60367		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0

loc_60376:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jz	short loc_60394
		mov	al, [bp+arg_2]
		mov	ah, 0
		mov	bx, [bp+var_2]
		cmp	ax, [bx+4]
		jnz	short loc_60376

loc_60394:
		cmp	[bp+var_2], 0
		jz	short loc_603A8
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6

loc_603A8:
		pop	si
		leave
		retf
sub_60367		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_603AB		proc far

var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		jmp	short loc_603C5

loc_603B7:
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6

loc_603C5:
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_603B7
		mov	word ptr [si+4], 0
		pop	si
		leave
		retf
sub_603AB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_603E3		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_60406

loc_603F4:
		mov	al, [bp+arg_2]
		mov	ah, 0
		mov	bx, [bp+var_2]
		cmp	ax, [bx+4]
		jnz	short loc_60406
		mov	ax, [bp+var_2]
		jmp	short loc_60419

loc_60406:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_603F4
		xor	ax, ax

loc_60419:
		pop	si
		leave
		retf
sub_603E3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6041C		proc far

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
		jmp	loc_604B9

loc_60437:
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
		ja	short loc_604B6
		shl	bx, 1
		jmp	cs:off_604CC[bx]	; switch jump

loc_60464:
		push	dx
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_6047C
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6047C

loc_60478:
		mov	[bp+var_1], 0

loc_6047C:
		mov	[bp+var_2], 0
		jmp	short loc_604B6

loc_60482:
		push	dx
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_6047C
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_6047C
		jmp	short loc_60478
		jmp	short loc_6047C

loc_6049A:
		push	dx
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_604B6
		jmp	short loc_604B2

loc_604A7:
		push	dx
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_604B6

loc_604B2:
		mov	[bp+var_2], 1

loc_604B6:
		add	si, 3

loc_604B9:
		mov	al, [bp+arg_2]
		mov	ah, 0
		cmp	ax, si
		jle	short loc_604C5
		jmp	loc_60437

loc_604C5:
		mov	al, [bp+var_1]
		pop	di
		pop	si
		leave
		retf
sub_6041C		endp

; START OF FUNCTION CHUNK FOR sub_6041C
off_604CC	dw offset loc_60464
		dw offset loc_60482
		dw offset loc_6049A
		dw offset loc_604A7
; END OF FUNCTION CHUNK FOR sub_6041C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Interpréteur des scripts EFCT de GAMEFLOW.IFF de Pacific Strike
; (équivalent de Gameflow_RunScriptPairs_36CF d'OPTEST). Lit toujours 3 octets : commande,
; octet a, octet b, et le mot a | b << 8 (di). Pas de 3 octets pour les commandes 0, 6, 7, 9,
; 10, 35, 36 (inc var_8 en loc_60AF9 puis add var_8, 2), 2 pour les autres, y compris pendant
; un saut. Même logique de blocs qu'OPTEST : 30 ELSE, 31 ENDIF, 33 OR_GROUP traités avant la
; table ; tests comptés pendant un saut : 9, 10, 20, 21, 22, 28, 32. Table off_60C85 de 42 cas
; (cmp bx, 29h). Détail de chaque commande : analysis/pacific/README.md § 3.3.
; ==============================================================================================
Gameflow_RunScript_604D4		proc far

var_B6		= word ptr -0B6h
var_66		= word ptr -66h
var_16		= word ptr -16h
var_13		= byte ptr -13h
var_12		= word ptr -12h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= byte ptr -0Ch
var_B		= byte ptr -0Bh
var_A		= byte ptr -0Ah
var_9		= byte ptr -9
var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0B6h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	[bp+var_3], 0
		mov	[bp+var_4], 0
		mov	[bp+var_5], 0
		mov	[bp+var_8], 0
		jmp	loc_60C76

loc_604FC:
		cmp	[bp+var_3], 0
		jz	short loc_60505
		jmp	loc_60C81

loc_60505:
		mov	bx, [bp+arg_4]
		add	bx, [bp+var_8]
		mov	al, [bx]
		mov	[bp+var_9], al
		mov	bx, [bp+var_8]
		add	bx, [bp+arg_4]
		mov	al, [bx+1]
		mov	[bp+var_A], al
		mov	bx, [bp+var_8]
		add	bx, [bp+arg_4]
		mov	ah, 0
		mov	bx, [bp+var_8]
		add	bx, [bp+arg_4]
		mov	dl, [bx+2]
		mov	dh, 0
		shl	dx, 8
		add	ax, dx
		mov	di, ax
		mov	bx, [bp+var_8]
		add	bx, [bp+arg_4]
		mov	al, [bx+2]
		mov	[bp+var_B], al
		cmp	[bp+var_2], 0
		jz	short loc_60590
		cmp	[bp+var_9], 9
		jz	short loc_60581
		cmp	[bp+var_9], 0Ah
		jz	short loc_60581
		cmp	[bp+var_9], 14h
		jz	short loc_60581
		cmp	[bp+var_9], 15h
		jz	short loc_60581
		cmp	[bp+var_9], 16h
		jz	short loc_60581
		cmp	[bp+var_9], 1Ch
		jz	short loc_60581
		cmp	[bp+var_9], 20h
		jz	short loc_60581
		cmp	[bp+var_9], 25h
		jz	short loc_60581
		push	0DF88h
		call	sub_1DDFE
		pop	cx

loc_60581:
		cmp	[bp+var_5], 0
		jnz	short loc_6058D
		mov	[bp+var_2], 0
		jmp	short loc_60590

loc_6058D:
		dec	[bp+var_5]

loc_60590:
		cmp	[bp+var_9], 1Eh
		jnz	short loc_605AF
		cmp	[bp+var_4], 0
		jz	short loc_6059F
		jmp	loc_60C72

loc_6059F:
		mov	al, [bp+var_1]
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	[bp+var_1], al
		jmp	loc_60C72

loc_605AF:
		cmp	[bp+var_9], 1Fh
		jnz	short loc_605C8
		cmp	[bp+var_4], 0
		jnz	short loc_605C2
		mov	[bp+var_1], 0
		jmp	loc_60C72

loc_605C2:
		dec	[bp+var_4]
		jmp	loc_60C72

loc_605C8:
		cmp	[bp+var_9], 21h
		jnz	short loc_605DB
		mov	[bp+var_2], 1
		mov	al, [bp+var_A]
		mov	[bp+var_5], al
		jmp	loc_60C72

loc_605DB:
		cmp	[bp+var_1], 0
		jz	short loc_60659
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_60659
		cmp	[bp+var_9], 9
		jz	short loc_60614
		cmp	[bp+var_9], 0Ah
		jz	short loc_60614
		cmp	[bp+var_9], 14h
		jz	short loc_60614
		cmp	[bp+var_9], 15h
		jz	short loc_60614
		cmp	[bp+var_9], 16h
		jz	short loc_60614
		cmp	[bp+var_9], 1Ch
		jz	short loc_60614
		cmp	[bp+var_9], 20h
		jnz	short loc_60617

loc_60614:
		inc	[bp+var_4]

loc_60617:
		cmp	[bp+var_9], 6
		jnz	short loc_60620
		jmp	loc_60AF9

loc_60620:
		cmp	[bp+var_9], 0
		jnz	short loc_60629
		jmp	loc_60AF9

loc_60629:
		cmp	[bp+var_9], 7
		jnz	short loc_60632
		jmp	loc_60AF9

loc_60632:
		cmp	[bp+var_9], 9
		jnz	short loc_6063B
		jmp	loc_60AF9

loc_6063B:
		cmp	[bp+var_9], 23h
		jnz	short loc_60644
		jmp	loc_60AF9

loc_60644:
		cmp	[bp+var_9], 24h
		jnz	short loc_6064D
		jmp	loc_60AF9

loc_6064D:
		cmp	[bp+var_9], 0Ah
		jz	short loc_60656
		jmp	loc_60C72

loc_60656:
		jmp	loc_60AF9

loc_60659:
		mov	al, [bp+var_9]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 29h
		jbe	short loc_60668
		jmp	loc_60C69

loc_60668:
		shl	bx, 1
		jmp	cs:off_60C85[bx]	; switch jump

loc_6066F:
		push	di
		push	si
		call	sub_757EF
		add	sp, 4
		mov	byte ptr [si+4E0h], 1
		jmp	loc_60AF9

loc_60681:
		mov	al, [bp+var_A]
		mov	[bp+var_C], al
		mov	[si+4F1h], al

loc_6068B:
		mov	[bp+var_3], 1
		jmp	loc_60AB8

loc_60692:
		mov	al, [bp+var_A]
		push	ax
		push	si
		call	sub_757F4
		jmp	loc_60C4F

loc_6069F:
		mov	al, [bp+var_A]
		mov	[bp+var_D], al
		mov	[si+4EEh], al
		jmp	loc_60980

loc_606AC:
		mov	al, [si+4EFh]
		mov	ah, 0
		mov	di, ax
		cmp	di, 0Ch
		jl	short loc_606BC
		jmp	loc_6079C

loc_606BC:
		push	0AAh
		call	GameVar_Get_56414
		pop	cx
		neg	ax
		sbb	ax, ax
		inc	ax
		push	ax
		push	0ABh
		call	GameVar_Get_56414
		pop	cx
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	dx
		add	dx, ax
		push	dx
		push	0ACh
		call	GameVar_Get_56414
		pop	cx
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	dx
		add	dx, ax
		push	dx
		push	0ADh
		call	GameVar_Get_56414
		pop	cx
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	dx
		add	dx, ax
		push	dx
		push	0AEh
		call	GameVar_Get_56414
		pop	cx
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	dx
		add	dx, ax
		push	dx
		push	0AFh
		call	GameVar_Get_56414
		pop	cx
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	dx
		add	dx, ax
		push	dx
		push	0B0h
		call	GameVar_Get_56414
		pop	cx
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	dx
		add	dx, ax
		push	dx
		push	0BBh
		call	GameVar_Get_56414
		pop	cx
		neg	ax
		sbb	ax, ax
		inc	ax
		push	ax
		push	0BAh
		call	GameVar_Get_56414
		pop	cx
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	dx
		add	dx, ax
		push	dx
		push	0BCh
		call	GameVar_Get_56414
		pop	cx
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	dx
		add	dx, ax
		push	dx
		push	0BFh
		call	GameVar_Get_56414
		pop	cx
		neg	ax
		sbb	ax, ax
		inc	ax
		pop	dx
		add	dx, ax
		push	dx
		push	198h
		call	GameVar_Get_56414
		pop	cx
		pop	dx
		add	dx, ax
		inc	dx
		pop	ax
		cmp	ax, dx
		jle	short loc_60793
		push	86Ch
		jmp	short loc_60796

loc_60793:
		push	8ACh

loc_60796:
		call	GameVar_SetFlag_5646D
		pop	cx

loc_6079C:
		cmp	di, 12h
		jge	short loc_60803
		cmp	di, 0Bh
		jle	short loc_60803
		push	19Ch
		call	GameVar_Get_56414
		pop	cx
		push	ax
		push	19Dh
		call	GameVar_Get_56414
		pop	cx
		pop	dx
		add	dx, ax
		push	dx
		push	19Eh
		call	GameVar_Get_56414
		pop	cx
		pop	dx
		add	dx, ax
		push	dx
		push	19Fh
		call	GameVar_Get_56414
		pop	cx
		pop	dx
		add	dx, ax
		push	dx
		push	1A0h
		call	GameVar_Get_56414
		pop	cx
		pop	dx
		add	dx, ax
		push	dx
		push	1A1h
		call	GameVar_Get_56414
		pop	cx
		pop	dx
		add	dx, ax
		cmp	dx, 5
		jge	short loc_607FA
		push	86Ch
		jmp	short loc_607FD

loc_607FA:
		push	8ADh

loc_607FD:
		call	GameVar_SetFlag_5646D
		pop	cx

loc_60803:
		cmp	di, 14h
		jge	short loc_60835
		cmp	di, 11h
		jle	short loc_60835
		push	1A2h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_6082C
		push	1A3h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_6082C
		push	86Ch
		jmp	short loc_6082F

loc_6082C:
		push	8AEh

loc_6082F:
		call	GameVar_SetFlag_5646D
		pop	cx

loc_60835:
		cmp	di, 18h
		jge	short loc_6085A
		cmp	di, 13h
		jle	short loc_6085A
		push	1A7h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_60851
		push	86Ch
		jmp	short loc_60854

loc_60851:
		push	8AFh

loc_60854:
		call	GameVar_SetFlag_5646D
		pop	cx

loc_6085A:
		cmp	di, 1Ch
		jge	short loc_608A6
		cmp	di, 17h
		jle	short loc_608A6
		push	1A8h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_6088B
		push	1A9h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_6088B
		push	1AAh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_60898

loc_6088B:
		push	1ABh
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_6089D

loc_60898:
		push	86Ch
		jmp	short loc_608A0

loc_6089D:
		push	8B0h

loc_608A0:
		call	GameVar_SetFlag_5646D
		pop	cx

loc_608A6:
		push	8B1h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	8B2h
		call	GameVar_ClearFlag_56520
		pop	cx
		push	8ACh
		call	GameVar_Get_56414
		pop	cx
		push	ax
		push	8ADh
		call	GameVar_Get_56414
		pop	cx
		pop	dx
		add	dx, ax
		push	dx
		push	8AEh
		call	GameVar_Get_56414
		pop	cx
		pop	dx
		add	dx, ax
		push	dx
		push	8AFh
		call	GameVar_Get_56414
		pop	cx
		pop	dx
		add	dx, ax
		push	dx
		push	8B0h
		call	GameVar_Get_56414
		pop	cx
		pop	dx
		add	dx, ax
		mov	di, dx
		cmp	di, 4
		jge	short loc_60907
		push	8B1h

loc_608FF:
		call	GameVar_SetFlag_5646D
		jmp	loc_60C71

loc_60907:
		cmp	di, 5
		jl	short loc_6090F
		jmp	loc_60C72

loc_6090F:
		push	8B2h
		jmp	short loc_608FF

loc_60914:
		push	di
		call	GameVar_SetFlag_5646D
		jmp	short loc_60922

loc_6091C:
		push	di
		call	GameVar_ClearFlag_56520

loc_60922:
		pop	cx
		jmp	loc_60AF9

loc_60926:
		mov	al, [bp+var_A]
		push	ax
		push	si
		call	sub_75803
		jmp	loc_60C4F

loc_60933:
		push	di
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_60941
		jmp	loc_60AF9

loc_60941:
		jmp	short loc_60954
		jmp	loc_60AF9

loc_60946:
		push	di
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_60954
		jmp	loc_60AF9

loc_60954:
		mov	[bp+var_1], 1
		jmp	loc_60AF9
		jmp	loc_60AF9

loc_6095E:
		mov	byte ptr [si+4E6h], 0
		jmp	loc_6068B

loc_60966:
		mov	al, [bp+var_A]
		mov	[bp+var_E], al
		mov	[si+4EEh], al
		jmp	loc_60C72

loc_60973:
		mov	al, [bp+var_A]
		mov	[bp+var_F], al
		mov	[si+4F0h], al
		jmp	loc_60C72

loc_60980:
		mov	byte ptr [si+4E6h], 1
		jmp	loc_60C72

loc_60988:
		mov	byte ptr [si+4E6h], 2
		mov	[bp+var_3], 1
		jmp	loc_60C72

loc_60994:
		lea	ax, [bp+var_B6]
		push	ax
		push	si
		call	sub_761FB
		add	sp, 4
		cmp	byte ptr [bp+var_B6], 0
		jnz	short loc_609AC
		jmp	loc_60C72

loc_609AC:
		lea	ax, [bp+var_B6]
		push	ax
		push	si
		call	sub_759F5
		add	sp, 4
		push	58h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	33h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	0
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_66]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_66]
		push	ax
		push	si
		call	sub_759F5
		jmp	loc_60C4F

loc_60A00:
		push	si
		call	sub_76200
		pop	cx
		cmp	byte ptr [si+490h], 0
		jnz	short loc_60A11
		jmp	loc_60AB8

loc_60A11:
		mov	byte ptr [si+4E6h], 3
		jmp	loc_60AB8
		jmp	loc_60AB8

loc_60A1C:
		mov	al, [bp+var_A]
		push	ax
		push	si
		call	sub_75D85
		jmp	loc_60AB5

loc_60A29:
		push	si
		call	sub_75E00
		pop	cx
		jmp	loc_60AB8

loc_60A33:
		mov	al, [si+65Eh]
		mov	ah, 0
		or	ax, ax
		jz	short loc_60A40
		jmp	loc_60C72

loc_60A40:
		jmp	loc_60AD1

loc_60A43:
		cmp	byte ptr [si+65Eh], 0
		jnz	short loc_60A4D
		jmp	loc_60C72

loc_60A4D:
		jmp	loc_60AD1

loc_60A50:
		mov	al, [bp+var_A]
		push	ax
		push	si
		call	sub_7594A
		jmp	loc_60C4F

loc_60A5D:
		mov	al, [bp+var_A]
		push	ax
		push	si
		call	sub_76390
		jmp	short loc_60AB5

loc_60A69:
		mov	al, [bp+var_A]
		mov	[si+4E7h], al
		mov	al, [si+4E7h]
		mov	ah, 0
		push	ax
		call	Music_SetPendingTune_5ED30
		jmp	loc_60C71

loc_60A7F:
		mov	al, [bp+var_A]
		mov	[bp+var_10], al
		mov	[si+4F1h], al
		jmp	loc_60C72

loc_60A8C:
		cmp	byte ptr [si+4EBh], 0
		jnz	short loc_60A96
		jmp	loc_60C72

loc_60A96:
		cmp	byte ptr [si+4EDh], 2
		jnz	short loc_60AA0
		jmp	loc_60C72

loc_60AA0:
		push	si
		call	sub_758E5
		jmp	loc_60C71

loc_60AA9:
		mov	al, [bp+var_A]
		mov	ah, 0
		push	ax
		push	si
		call	sub_75DD0

loc_60AB5:
		add	sp, 4

loc_60AB8:
		mov	byte ptr [si+4E0h], 1
		jmp	loc_60C72

loc_60AC0:
		mov	al, [bp+var_A]
		mov	ah, 0
		mov	bx, ax
		cmp	byte ptr [bx+si+4F2h], 1
		jnz	short loc_60AD1
		jmp	loc_60C72

loc_60AD1:
		mov	[bp+var_1], 1
		jmp	loc_60C72

loc_60AD8:
		mov	al, [bp+var_A]
		push	ax
		push	si
		call	sub_758E0
		jmp	loc_60C4F

loc_60AE5:
		mov	al, [bp+var_B]
		mov	ah, 0
		push	ax
		mov	al, [bp+var_A]
		mov	ah, 0
		push	ax
		call	GameVar_Set_564BB
		add	sp, 4

loc_60AF9:
		inc	[bp+var_8]
		jmp	loc_60C72

loc_60AFF:
		inc	[bp+var_8]
		mov	[bp+var_12], 0
		xor	di, di
		jmp	short loc_60B3B

loc_60B0B:
		test	di, 1
		jz	short loc_60B26
		mov	ax, di
		add	ax, 191h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_60B3A
		dec	[bp+var_12]
		jmp	short loc_60B3A

loc_60B26:
		mov	ax, di
		add	ax, 191h
		push	ax
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jnz	short loc_60B3A
		add	[bp+var_12], 2

loc_60B3A:
		inc	di

loc_60B3B:
		mov	al, [si+4EFh]
		mov	ah, 0
		cmp	ax, di
		jg	short loc_60B0B
		mov	di, 0AAh
		jmp	short loc_60B65

loc_60B4A:
		push	di
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_60B64
		push	di
		call	GameVar_Get_56414
		pop	cx
		mov	dx, [bp+var_12]
		sub	dx, ax
		mov	[bp+var_12], dx

loc_60B64:
		inc	di

loc_60B65:
		cmp	di, 0B6h
		jle	short loc_60B4A
		mov	di, 0B9h
		jmp	short loc_60B8D

loc_60B70:
		push	di
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_60B8C
		push	di
		call	GameVar_Get_56414
		pop	cx
		shl	ax, 1
		mov	dx, [bp+var_12]
		add	dx, ax
		mov	[bp+var_12], dx

loc_60B8C:
		inc	di

loc_60B8D:
		cmp	di, 0C2h
		jle	short loc_60B70
		mov	al, [bp+var_A]
		mov	ah, 0
		mov	dx, [bp+var_12]
		add	dx, ax
		mov	al, [bp+var_B]
		mov	ah, 0
		imul	ax, ax, 0Ch
		add	dx, ax
		mov	[bp+var_12], dx
		push	52h
		call	GameVar_Get_56414
		pop	cx
		push	ax
		push	53h
		call	GameVar_Get_56414
		pop	cx
		imul	ax, ax, 0Ch
		pop	di
		add	di, ax
		cmp	[bp+var_12], di
		jge	short loc_60BCC
		mov	ax, di
		inc	ax
		mov	[bp+var_12], ax

loc_60BCC:
		mov	ax, [bp+var_12]
		mov	bx, 0Ch
		cwd
		idiv	bx
		mov	di, ax
		push	ax
		push	53h
		call	GameVar_Set_564BB
		add	sp, 4
		mov	ax, di
		imul	ax, ax, 0Ch
		mov	di, [bp+var_12]
		sub	di, ax
		push	di

loc_60BED:
		push	52h
		jmp	short loc_60C4A

loc_60BF1:
		push	52h
		call	GameVar_Get_56414
		pop	cx
		push	ax
		push	53h
		call	GameVar_Get_56414
		pop	cx
		imul	ax, ax, 0Ch
		pop	di
		add	di, ax
		mov	al, [bp+var_A]
		mov	ah, 0
		add	di, ax
		mov	ax, di
		mov	bx, 0Ch
		cwd
		idiv	bx
		push	ax
		push	53h
		call	GameVar_Set_564BB
		add	sp, 4
		push	53h
		call	GameVar_Get_56414
		pop	cx
		imul	ax, ax, 0Ch
		mov	dx, di
		sub	dx, ax
		push	dx
		jmp	short loc_60BED

loc_60C34:
		mov	al, [bp+var_A]
		mov	[bp+var_13], al
		mov	[si+566h], al
		jmp	short loc_60C72

loc_60C40:
		mov	al, [si+4EFh]
		mov	ah, 0
		push	ax
		push	82h

loc_60C4A:
		call	GameVar_Set_564BB

loc_60C4F:
		add	sp, 4
		jmp	short loc_60C72

loc_60C54:
		push	82h
		call	GameVar_Get_56414
		pop	cx
		mov	[bp+var_16], ax
		mov	al, byte ptr [bp+var_16]
		mov	[si+4EFh], al
		jmp	short loc_60C72

loc_60C69:
		push	0DA18h
		call	sub_1DDFE

loc_60C71:
		pop	cx

loc_60C72:
		add	[bp+var_8], 2

loc_60C76:
		mov	ax, [bp+var_8]
		cmp	ax, [bp+arg_2]
		jnb	short loc_60C81
		jmp	loc_604FC

loc_60C81:
		pop	di
		pop	si
		leave
		retf
Gameflow_RunScript_604D4		endp

; START OF FUNCTION CHUNK FOR Gameflow_RunScript_604D4
off_60C85	dw offset loc_6066F
		dw offset loc_60681
		dw offset loc_60692
		dw offset loc_6069F
		dw offset loc_60C72
		dw offset loc_606AC
		dw offset loc_60914
		dw offset loc_6091C
		dw offset loc_60926
		dw offset loc_60933
		dw offset loc_60946
		dw offset loc_6095E
		dw offset loc_60966
		dw offset loc_60973
		dw offset loc_60980
		dw offset loc_60988
		dw offset loc_60994
		dw offset loc_60A00
		dw offset loc_60A1C
		dw offset loc_60A29
		dw offset loc_60A33
		dw offset loc_60A43
		dw offset loc_60A50
		dw offset loc_60A5D
		dw offset loc_60A69
		dw offset loc_60A7F
		dw offset loc_60A8C
		dw offset loc_60C69
		dw offset loc_60C69
		dw offset loc_60AA9
		dw offset loc_60C72
		dw offset loc_60C72
		dw offset loc_60AC0
		dw offset loc_60C69
		dw offset loc_60AD8
		dw offset loc_60AE5
		dw offset loc_60AFF
		dw offset loc_60BF1
		dw offset loc_60C34
		dw offset loc_60C69
		dw offset loc_60C40
		dw offset loc_60C54
; END OF FUNCTION CHUNK FOR Gameflow_RunScript_604D4

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60CD9		proc far

var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	di, [bp+arg_0]
		push	100h
		push	0
		mov	ax, di
		add	ax, 6AEh
		push	ax
		call	sub_76263
		add	sp, 6
		mov	ax, [di+6B1h]
		mov	[bp+var_2], ax
		mov	ax, [di+6B6h]
		mov	[bp+var_4], ax
		xor	cx, cx
		jmp	loc_60D98

loc_60D0A:
		mov	ax, cx
		imul	ax, ax, 3
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		mov	ah, 0
		imul	ax, ax, 0Bh
		mov	[bp+var_6], ax
		mov	ax, cx
		imul	ax, ax, 3
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx+1]
		mov	ah, 0
		imul	ax, ax, 3Bh
		mov	[bp+var_8], ax
		mov	ax, cx
		imul	ax, ax, 3
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx+2]
		mov	ah, 0
		imul	ax, ax, 1Eh
		mov	[bp+var_A], ax
		mov	ax, [bp+var_6]
		add	ax, [bp+var_8]
		add	ax, [bp+var_A]
		mov	bx, 64h
		cwd
		idiv	bx
		mov	bx, cx
		mov	[bx+di+6B8h], al
		mov	ax, cx
		imul	ax, ax, 3
		mov	bx, [bp+var_4]
		add	bx, ax
		push	bx
		mov	bx, cx
		mov	al, [bx+di+6B8h]
		pop	bx
		mov	[bx+2], al
		mov	dx, cx
		imul	dx, dx, 3
		mov	bx, [bp+var_4]
		add	bx, dx
		mov	[bx+1], al
		mov	dx, cx
		imul	dx, dx, 3
		mov	bx, [bp+var_4]
		add	bx, dx
		mov	[bx], al
		mov	bx, cx
		mov	al, [bx+di+6B8h]
		add	al, 60h
		mov	[bx+di+6B8h], al
		inc	cx

loc_60D98:
		cmp	cx, 100h
		jge	short loc_60DA1
		jmp	loc_60D0A

loc_60DA1:
		pop	di
		pop	si
		leave
		retf
sub_60CD9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60DA5		proc far

var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= word ptr -0Eh
var_C		= byte ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 16h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	bx, word_7AF7E
		mov	ax, [bx]
		mov	bx, [bx+2]
		mov	dx, [bx]
		mov	[bp+var_8], ax
		mov	[bp+var_A], dx
		mov	byte ptr [bp+var_E], 3Fh
		mov	byte ptr [bp+var_E+1], 3Fh
		mov	[bp+var_C], 3Fh
		push	0Ah
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_60E2C
		push	1
		push	0
		push	3
		push	large 0FA00h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_12+2], dx
		mov	word ptr [bp+var_12], ax
		mov	eax, [bp+var_12]
		mov	[di], eax
		mov	byte ptr [di+4], 3
		mov	byte ptr [di+5], 1
		mov	dword ptr [di+6], 0
		mov	dword ptr [di+6], 0FA00h
		mov	ax, di
		jmp	short loc_60E2E

loc_60E2C:
		mov	ax, di

loc_60E2E:
		mov	[si+7B8h], ax
		push	0
		mov	bx, [si+7B8h]
		mov	al, [bx+4]
		push	ax
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_14], dx
		mov	[bp+var_16], ax
		push	si
		push	cs
		call	near ptr sub_60CD9
		pop	cx
		push	100h
		push	0
		lea	ax, [bp+var_E]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_76268
		add	sp, 8
		push	0
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_76259
		add	sp, 8
		xor	dx, dx
		jmp	short loc_60EAA

loc_60E86:
		les	bx, [bp+var_A]
		mov	al, es:[bx]
		les	bx, [bp+var_16]
		mov	es:[bx], al
		les	bx, [bp+var_A]
		mov	ah, 0
		mov	bx, ax
		mov	al, [bx+si+6B8h]
		mov	bx, [bp+var_A]
		mov	es:[bx], al
		inc	[bp+var_A]
		inc	[bp+var_16]
		inc	dx

loc_60EAA:
		cmp	dx, 0FA00h
		jb	short loc_60E86
		push	100h
		push	0
		push	1
		lea	ax, [bp+var_E]
		push	ax
		mov	ax, si
		add	ax, 6A9h
		push	ax
		call	sub_7628B
		add	sp, 0Ah
		lea	ax, [bp+var_6]
		push	ax
		call	sub_7627C
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_60DA5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_60ED7		proc far

var_28		= word ptr -28h
var_18		= word ptr -18h
var_16		= byte ptr -16h
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 28h
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [bp+var_18+1], 12h
		mov	byte ptr [bp+var_18], 1
		mov	[bp+var_16], 36h
		call	sub_6828E
		push	large 60h
		push	0
		mov	ax, si
		add	ax, 6B3h
		push	ax
		call	sub_76259
		add	sp, 8
		push	large 0C0h
		push	0A0h
		mov	ax, si
		add	ax, 6B3h
		push	ax
		call	sub_76259
		add	sp, 8
		call	sub_6828E
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		push	large 40h
		push	40h
		mov	ax, si
		add	ax, 6B3h
		push	ax
		call	sub_76259
		add	sp, 8
		mov	bx, word_7AF7E
		mov	ax, [bx]
		mov	bx, [bx+2]
		mov	dx, [bx]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		push	0
		mov	bx, [si+7B8h]
		mov	al, [bx+4]
		push	ax
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		xor	dx, dx
		jmp	short loc_60F8E

loc_60F7B:
		les	bx, [bp+var_8]
		mov	al, es:[bx]
		les	bx, [bp+var_4]
		mov	es:[bx], al
		inc	[bp+var_4]
		inc	[bp+var_8]
		inc	dx

loc_60F8E:
		cmp	dx, 0FA00h
		jb	short loc_60F7B
		mov	byte ptr [bp+var_18], 0
		lea	ax, [bp+var_28]
		push	ax
		lea	ax, [bp+var_18]
		push	ax
		push	10h
		call	CRT_InstallProtectedHandler
		add	sp, 6
		jmp	short loc_60FC5

loc_60FAC:
		push	1
		push	word ptr [si+6B3h]
		mov	al, [si+6B5h]
		push	ax
		mov	ax, si
		add	ax, 6B3h
		push	ax
		call	sub_76259
		add	sp, 8

loc_60FC5:
		push	2
		mov	ax, si
		add	ax, 6AEh
		push	ax
		mov	ax, si
		add	ax, 6B3h
		push	ax
		call	sub_76277
		add	sp, 6
		or	al, al
		jnz	short loc_60FAC
		cmp	word ptr [si+7B8h], 0
		jz	short loc_6102A
		mov	bx, [si+7B8h]
		cmp	byte ptr [bx+5], 0
		jz	short loc_6100A
		cmp	dword ptr [bx], 0
		jz	short loc_6100A
		push	0
		mov	al, [bx+4]
		push	ax
		push	bx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_6100A

loc_6100A:
		mov	bx, [si+7B8h]
		mov	dword ptr [bx], 0
		mov	byte ptr [bx+5], 0
		mov	dword ptr [bx+6], 0
		push	bx
		call	sub_3B2
		pop	cx
		jmp	short loc_6102A

loc_6102A:
		pop	si
		leave
		retf
sub_60ED7		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6102D		proc far

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
var_34		= word ptr -34h
var_2E		= byte ptr -2Eh
var_19		= byte ptr -19h
var_E		= byte ptr -0Eh
var_D		= word ptr -0Dh
var_B		= word ptr -0Bh
var_9		= word ptr -9
var_7		= word ptr -7
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
		mov	al, [si+4EFh]
		mov	byte_7D14C, al
		mov	byte_7D13E, 0
		cmp	byte ptr [si+4E0h], 0
		jz	short loc_61080
		mov	byte ptr [si+4E0h], 0
		push	851h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_6106E
		mov	byte ptr [si+4E1h], 0
		push	851h
		call	GameVar_ClearFlag_56520
		pop	cx
		jmp	short loc_61073

loc_6106E:
		mov	byte ptr [si+4E1h], 1

loc_61073:
		push	si
		push	cs
		call	near ptr sub_603AB
		pop	cx
		push	si
		call	sub_757EA
		pop	cx

loc_61080:
		mov	al, [si+4F1h]
		mov	[bp+var_2], al
		mov	di, [si+4E2h]
		lea	ax, [bp+var_11A]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_11A], 508h
		mov	[bp+var_B9], 100h
		mov	[bp+var_BD], 0
		mov	[bp+var_11A], 520h
		mov	[bp+var_9E], 0
		xor	ax, ax
		mov	[bp+var_A0], ax
		movsx	eax, ax
		mov	[bp+var_B5], eax
		push	di
		push	word_7AF7E
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_72]
		push	ax
		call	sub_5FF23
		add	sp, 0Ah
		mov	[bp+var_11A], 3A9Ch
		mov	[bp+var_72], 3AB4h
		mov	[bp+var_68], 3AD4h
		mov	[bp+var_B], 909h
		xor	ax, ax
		mov	[bp+var_7], ax
		mov	[bp+var_9], ax
		mov	[bp+var_B], 3A98h
		mov	[bp+var_19], 0
		mov	[bp+var_E], 0
		mov	al, [bp+var_2]
		mov	[bp+var_2E], al
		mov	[bp+var_5], 0FFh
		mov	[bp+var_D], di
		mov	[bp+var_4], 0
		jmp	short loc_61131

loc_6111D:
		mov	bx, [bp+var_4]
		mov	al, [bx+4]
		push	ax
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_75B90
		add	sp, 4

loc_61131:
		lea	ax, [bp+var_4]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_6111D
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_5F4A4
		pop	cx
		cmp	[bp+var_5], 0FFh
		jz	short loc_6115A
		mov	al, [bp+var_5]
		mov	[si+4E7h], al

loc_6115A:
		mov	al, [si+4E7h]
		mov	ah, 0
		push	ax
		call	Music_SetPendingTune_5ED30
		pop	cx
		lea	ax, [bp+var_11A]
		push	ax
		call	sub_75BB8
		pop	cx
		mov	[bp+var_1], al
		push	2
		lea	ax, [bp+var_B]
		push	ax
		nop
		push	cs
		call	near ptr sub_61814
		add	sp, 4
		mov	[bp+var_72], 3964h
		mov	[bp+var_68], 3984h
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	byte_7D3BC, 0
		cmp	[bp+var_45], 0
		jz	short loc_611B5
		mov	ax, [bp+var_45]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	[bp+var_45]
		call	sub_3B2
		pop	cx
		jmp	short loc_611B5

loc_611B5:
		push	2
		lea	ax, [bp+var_34]
		push	ax
		call	sub_75A4D
		add	sp, 4
		lea	ax, [bp+var_39]
		push	ax
		call	sub_7627C
		pop	cx
		lea	ax, [bp+var_53]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	0
		lea	ax, [bp+var_72]
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		mov	[bp+var_11A], 520h
		lea	ax, [bp+var_11A]
		push	ax
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		lea	ax, [bp+var_11A]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		mov	al, [bp+var_1]
		push	ax
		push	si
		push	cs
		call	near ptr sub_603E3
		add	sp, 4
		mov	bx, ax
		push	word ptr [bx+6]
		mov	al, [bp+var_1]
		push	ax
		push	si
		push	cs
		call	near ptr sub_603E3
		add	sp, 4
		mov	bx, ax
		push	word ptr [bx+8]
		push	si
		push	cs
		call	near ptr Gameflow_RunScript_604D4
		add	sp, 6
		pop	di
		pop	si
		leave
		retf
sub_6102D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61233		proc far

var_52		= word ptr -52h
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 52h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	al, [si+4E6h]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 3
		jbe	short loc_61251
		jmp	loc_613EE

loc_61251:
		shl	bx, 1
		jmp	cs:off_61405[bx]	; switch jump

loc_61258:
		push	si
		call	sub_75880
		pop	cx
		mov	[si+4EDh], al
		mov	al, [si+4EDh]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 4
		jbe	short loc_61274
		jmp	loc_613F7

loc_61274:
		shl	bx, 1
		jmp	cs:off_613FB[bx]	; switch jump

loc_6127B:
		cmp	byte ptr [si+4EFh], 1
		jnz	short loc_61285
		jmp	loc_613F7

loc_61285:
		xor	si, si
		push	834h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_61296
		xor	si, si

loc_61296:
		push	835h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_612A6
		mov	si, 6

loc_612A6:
		push	83Ah
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_612B6
		mov	si, 5

loc_612B6:
		push	837h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_612C6
		mov	si, 2

loc_612C6:
		push	838h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_612D6
		mov	si, 4

loc_612D6:
		push	836h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_612E6
		mov	si, 7

loc_612E6:
		push	839h
		call	GameVar_Get_56414
		pop	cx
		or	ax, ax
		jz	short loc_612F6
		mov	si, 8

loc_612F6:
		push	si
		call	sub_76010
		jmp	loc_613F6

loc_612FF:
		push	259h
		jmp	short loc_61307

loc_61304:
		push	258h

loc_61307:
		call	GameVar_SetFlag_5646D
		jmp	loc_613F6

loc_6130F:
		push	58h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	33h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	0
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_52]
		push	ax
		push	si
		call	sub_759F0

loc_61352:
		add	sp, 4
		mov	byte ptr [di], 0
		jmp	loc_613F7

loc_6135B:
		mov	byte ptr [si+4E5h], 2
		mov	bx, [bp+arg_4]
		mov	byte ptr [bx], 1
		jmp	loc_613F7

loc_61369:
		cmp	byte ptr [si+4E5h], 0
		jnz	short loc_6137F
		mov	al, byte_7D13E
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	bx, [bp+arg_6]
		mov	[bx], al

loc_6137F:
		mov	bx, [bp+arg_4]
		mov	byte ptr [bx], 1
		jmp	short loc_613F7

loc_61387:
		mov	al, [si+4F0h]
		mov	[bp+var_1], al
		mov	[si+4EFh], al
		mov	byte ptr [si+4F0h], 0FFh
		jmp	short loc_613F7

loc_61399:
		mov	ax, si
		add	ax, 490h
		push	ax
		push	si
		call	sub_759F0
		add	sp, 4
		push	58h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	33h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	0
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_52]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_52]
		push	ax
		push	si
		call	sub_759F5
		jmp	loc_61352

loc_613EE:
		push	0DA37h
		call	sub_1DDFE

loc_613F6:
		pop	cx

loc_613F7:
		pop	di
		pop	si
		leave
		retf
sub_61233		endp

; START OF FUNCTION CHUNK FOR sub_61233
off_613FB	dw offset loc_6127B
		dw offset loc_612FF
		dw offset loc_61304
		dw offset loc_6130F
		dw offset loc_6135B
off_61405	dw offset loc_61369
		dw offset loc_61258
		dw offset loc_61387
		dw offset loc_61399
; END OF FUNCTION CHUNK FOR sub_61233

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6140D		proc far

var_A2		= word ptr -0A2h
var_60		= word ptr -60h
var_5E		= word ptr -5Eh
var_5C		= word ptr -5Ch
var_5A		= word ptr -5Ah
var_58		= word ptr -58h
var_56		= word ptr -56h
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0A2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		mov	[bp+var_1], 0
		mov	byte ptr [si+7C5h], 0

loc_61425:
		cmp	byte ptr [si+4E5h], 1
		jnz	short loc_61432
		mov	[bp+var_2], 0
		jmp	short loc_6143C

loc_61432:
		push	si
		call	sub_758B5
		pop	cx
		mov	[bp+var_2], al

loc_6143C:
		mov	al, [bp+var_2]
		mov	ah, 0
		mov	bx, ax
		cmp	bx, 5
		jbe	short loc_6144B
		jmp	loc_615E5

loc_6144B:
		shl	bx, 1
		jmp	cs:off_615FA[bx]	; switch jump

loc_61452:
		push	si
		call	sub_75840
		pop	cx
		cmp	byte ptr [si+4E5h], 1
		jz	short loc_61467
		push	si
		call	sub_759C0
		pop	cx

loc_61467:
		mov	[bp+var_1], 1
		jmp	loc_615E5

loc_6146E:
		push	58h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	33h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	0
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_A2]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_A2]
		push	ax
		mov	ax, si
		add	ax, 490h
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	byte ptr [di], 0
		mov	byte ptr [si+4E6h], 5
		mov	[bp+var_1], 1
		jmp	loc_615E5

loc_614CA:
		push	si
		call	sub_76200
		pop	cx
		cmp	byte ptr [si+490h], 0
		jnz	short loc_614DB
		jmp	loc_615E5

loc_614DB:
		mov	byte ptr [di], 0
		mov	byte ptr [si+4E6h], 3
		jmp	short loc_61467

loc_614E5:
		push	si
		call	sub_762E0
		pop	cx
		or	al, al
		jz	short loc_61513
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	byte ptr [si+4EEh], 0FEh
		mov	byte ptr [si+4E6h], 1
		mov	byte ptr [di], 0
		jmp	loc_61467

loc_61513:
		mov	byte_7D13E, 1
		jmp	loc_615E5

loc_6151B:
		push	si
		call	sub_75B30
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		jmp	loc_615E5

loc_61538:
		push	si
		push	cs
		call	near ptr sub_60DA5
		pop	cx
		cmp	word ptr [si+7B8h], 0
		jz	short loc_61589
		mov	bx, [si+7B8h]
		cmp	byte ptr [bx+5], 0
		jz	short loc_61569
		cmp	dword ptr [bx], 0
		jz	short loc_61569
		push	0
		mov	al, [bx+4]
		push	ax
		push	bx
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_61569

loc_61569:
		mov	bx, [si+7B8h]
		mov	dword ptr [bx], 0
		mov	byte ptr [bx+5], 0
		mov	dword ptr [bx+6], 0
		push	bx
		call	sub_3B2
		pop	cx
		jmp	short loc_61589

loc_61589:
		mov	[bp+var_60], 0
		mov	[bp+var_5E], 0
		mov	[bp+var_5C], 0
		mov	[bp+var_5A], 0
		mov	[bp+var_58], 13Fh
		mov	[bp+var_56], 0C7h
		push	0
		lea	ax, [bp+var_60]
		push	ax
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		push	word_7AF7E
		lea	ax, [bp+var_60]
		push	ax
		call	UI_ApplyEncodingHelper_67F02
		add	sp, 4
		push	5
		call	Music_SetPendingTune_5ED30
		pop	cx
		lea	ax, [bp+var_60]
		push	ax
		push	0
		call	sub_755FA
		add	sp, 4
		lea	ax, [bp+var_60]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx

loc_615E5:
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_615F1
		jmp	loc_61425

loc_615F1:
		mov	byte ptr [si+7C5h], 1
		pop	di
		pop	si
		leave
		retf
sub_6140D		endp

; START OF FUNCTION CHUNK FOR sub_6140D
off_615FA	dw offset loc_61452
		dw offset loc_6146E
		dw offset loc_614CA
		dw offset loc_614E5
		dw offset loc_6151B
		dw offset loc_61538
; END OF FUNCTION CHUNK FOR sub_6140D

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61606		proc far

var_5E		= word ptr -5Eh
var_D		= word ptr -0Dh
var_C		= word ptr -0Ch
var_B		= word ptr -0Bh
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_6		= word ptr -6
var_4		= byte ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 5Eh
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+4EDh], 1
		push	100h
		push	0
		lea	ax, [bp+var_6]
		push	ax
		call	sub_76245
		add	sp, 6
		mov	byte ptr [bp+var_A], 0
		mov	byte ptr [bp+var_A+1], 0
		mov	[bp+var_8], 0
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_A]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_76268
		add	sp, 8
		push	0
		push	[bp+var_6]
		mov	al, [bp+var_4]
		push	ax
		lea	ax, [bp+var_6]
		push	ax
		call	sub_76259
		add	sp, 8
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4

loc_6166C:
		mov	byte ptr [bp+var_B], 1
		mov	byte ptr [bp+var_C], 0
		mov	byte ptr [bp+var_D], 0
		lea	ax, [bp+var_D]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_B]
		push	ax
		push	si
		push	cs
		call	near ptr sub_61233
		add	sp, 8
		mov	byte ptr [si+4E6h], 4
		cmp	byte ptr [bp+var_C], 0
		jz	short loc_616AB
		lea	ax, [bp+var_D]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		lea	ax, [bp+var_B]
		push	ax
		push	si
		push	cs
		call	near ptr sub_6140D
		add	sp, 8

loc_616AB:
		mov	byte ptr [si+4E0h], 1
		cmp	byte ptr [si+4E6h], 5
		jnz	short loc_616BC
		mov	byte ptr [si+4E6h], 3

loc_616BC:
		cmp	byte ptr [bp+var_B], 0
		jz	short loc_61735
		push	si
		call	sub_757E5
		pop	cx
		mov	ax, si
		add	ax, 8
		push	ax
		push	word ptr [si+6]
		push	si
		push	cs
		call	near ptr Gameflow_RunScript_604D4
		add	sp, 6
		cmp	byte ptr [si+4E6h], 4
		jz	short loc_616E8
		cmp	byte ptr [si+4E6h], 2
		jnz	short loc_61735

loc_616E8:
		cmp	byte ptr [si+4EFh], 24h
		jz	short loc_61735
		push	58h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	33h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	0
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		lea	ax, [bp+var_5E]
		push	ax
		call	Path_BuildComposite
		add	sp, 0Eh
		lea	ax, [bp+var_5E]
		push	ax
		push	si
		call	sub_759F5
		add	sp, 4

loc_61735:
		mov	byte ptr [si+7C5h], 1
		jmp	short loc_61742

loc_6173C:
		push	si
		push	cs
		call	near ptr sub_6102D
		pop	cx

loc_61742:
		cmp	byte ptr [si+4E6h], 4
		jz	short loc_6173C
		mov	byte ptr [si+7C5h], 0
		cmp	byte ptr [si+4E6h], 1
		jz	short loc_61758
		jmp	loc_6166C

loc_61758:
		cmp	byte ptr [si+4EEh], 0FEh
		jz	short loc_61766
		push	si
		call	sub_75885
		pop	cx

loc_61766:
		push	si
		call	sub_7588A
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		lea	ax, [bp+var_6]
		push	ax
		call	sub_7627C
		pop	cx
		pop	si
		leave
		retf
sub_61606		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6177F		proc far

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
		jz	short loc_617C1
		mov	word ptr [di], 9B2h
		mov	word ptr [di+2], 0
		mov	word ptr [di], 3A94h
		mov	al, [bp+var_3]
		mov	[di+4], al
		mov	ax, [bp+var_6]
		mov	[di+5], ax
		mov	ax, di
		jmp	short loc_617C3

loc_617C1:
		mov	ax, di

loc_617C3:
		mov	[bp+var_2], ax
		push	ax
		push	si
		call	LinkedListB_InsertAtTail_68A21
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
sub_6177F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_617D4		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	[bp+var_2], 0
		jmp	short loc_617F0

loc_617E5:
		mov	bx, [bp+var_2]
		mov	al, [bx+4]
		cmp	al, [bp+arg_2]
		jz	short loc_61801

loc_617F0:
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_617E5

loc_61801:
		cmp	[bp+var_2], 0
		jz	short loc_6180F
		mov	bx, [bp+var_2]
		mov	ax, [bx+5]
		jmp	short loc_61811

loc_6180F:
		xor	ax, ax

loc_61811:
		pop	si
		leave
		retf
sub_617D4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61814		proc far

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
		jz	short loc_61877
		mov	word ptr [si], 3A98h
		jmp	short loc_61849

loc_6182C:
		mov	bx, [bp+var_2]
		push	word ptr [bx+5]
		mov	bx, [bx+5]
		mov	bx, [bx]
		call	dword ptr [bx+14h]
		pop	cx
		push	0
		push	[bp+var_2]
		push	si
		call	LinkedListB_FindAndDispatch_68A46
		add	sp, 6

loc_61849:
		mov	[bp+var_2], 0
		lea	ax, [bp+var_2]
		push	ax
		push	si
		call	LinkedList_Helper_68B4B
		add	sp, 4
		or	ax, ax
		jnz	short loc_6182C
		mov	word ptr [si], 909h
		push	si
		call	sub_68B0D
		pop	cx
		test	di, 1
		jz	short loc_61877
		push	si
		call	sub_3B2
		pop	cx

loc_61877:
		pop	di
		pop	si
		leave
		retf
sub_61814		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6187B		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		or	si, si
		jz	short loc_61899
		mov	word ptr [si], 3A94h
		test	ax, 1
		jz	short loc_61899
		push	si
		call	sub_3B2
		pop	cx

loc_61899:
		pop	si
		pop	bp
		retf
sub_6187B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_6189C		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_618AE
		jmp	loc_61960

loc_618AE:
		mov	word ptr [si], 3A9Ch
		mov	word ptr [si+0A8h], 3AB4h
		mov	word ptr [si+0B2h], 3AD4h
		push	2
		mov	ax, si
		add	ax, 10Fh
		push	ax
		nop
		push	cs
		call	near ptr sub_61814
		add	sp, 4
		mov	word ptr [si+0A8h], 3964h
		mov	word ptr [si+0B2h], 3984h
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	byte_7D3BC, 0
		cmp	word ptr [si+0D5h], 0
		jz	short loc_61905
		mov	ax, [si+0D5h]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	word ptr [si+0D5h]
		call	sub_3B2
		pop	cx
		jmp	short loc_61905

loc_61905:
		push	2
		mov	ax, si
		add	ax, 0E6h
		push	ax
		call	sub_75A4D
		add	sp, 4
		mov	ax, si
		add	ax, 0E1h
		push	ax
		call	sub_7627C
		pop	cx
		mov	ax, si
		add	ax, 0C7h
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	0
		mov	ax, si
		add	ax, 0A8h
		push	ax
		call	Scene_Destruct_666E6
		add	sp, 4
		mov	word ptr [si], 520h
		push	si
		call	ResourceRecord_Helper_6D61E
		pop	cx
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		test	di, 1
		jz	short loc_61960
		push	si
		call	sub_3B2
		pop	cx

loc_61960:
		pop	di
		pop	si
		pop	bp
		retf
sub_6189C		endp

; ----------------------------------------------------------------------

sub_61964		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_66729
sub_61964		endp

; ----------------------------------------------------------------------

sub_61970		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	Layer_MoveBy_6674B
sub_61970		endp

; ----------------------------------------------------------------------

sub_6197C		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FFF6h
		jmp	sub_66721
sub_6197C		endp

; ----------------------------------------------------------------------

sub_61988		proc far
		mov	bx, sp
		add	word ptr ss:[bx+4], 0FF58h
		nop
		nop
		jmp	sub_6189C
sub_61988		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_61995		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_619C4
		mov	word ptr [si], 3AE4h
		cmp	word ptr [si+6], 0
		jz	short loc_619B7
		push	word ptr [si+6]
		call	sub_3B2
		pop	cx

loc_619B7:
		test	di, 1
		jz	short loc_619C4
		push	si
sub_61995		endp

; START OF FUNCTION CHUNK FOR sub_61995
		db 9Ah, 0B2h
; END OF FUNCTION CHUNK FOR sub_61995
seg143		ends
