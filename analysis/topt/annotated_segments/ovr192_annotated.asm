ovr192		segment	para public 'OVERLAY' use16
		assume cs:ovr192
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Chargement par défaut de l'écran d'armement (chunk LOAD dont le 1er octet = argument),
; code identique (suite d'instructions) à Gameflow_ApplyDefaultLoadout_51830 d'OPTEST : mêmes
; plages de points d'emport (GAMEFLOW_SYSTEM.md § 5.3).
; ==============================================================================================
Gameflow_ApplyDefaultLoadout_57FA0		proc far

var_B0		= word ptr -0B0h
var_53		= dword ptr -53h
var_4F		= dword ptr -4Fh
var_4B		= dword ptr -4Bh
var_3E		= word ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_7		= byte ptr -7
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_4], 0FFh
		jnz	short loc_57FB4
		jmp	loc_58220

loc_57FB4:
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_B0], 480h
		mov	[bp+var_4F], 100h
		mov	[bp+var_53], 0
		mov	[bp+var_B0], 498h
		mov	[bp+var_34], 0
		xor	ax, ax
		mov	[bp+var_36], ax
		movsx	eax, ax
		mov	[bp+var_4B], eax
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_B0]
		push	ax
		mov	bx, [bp+var_B0]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 44414F4Ch
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_58029
		push	16h
		push	950h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_58029:
		mov	[bp+var_6], 0
		jmp	short loc_58055

loc_5802F:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_7], al
		mov	al, [bp+var_7]
		cmp	al, [bp+arg_4]
		jnz	short loc_5804D
		mov	[bp+var_6], 1
		jmp	short loc_5806E

loc_5804D:
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax

loc_58055:
		push	1
		push	large 44414F4Ch
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_5802F

loc_5806E:
		mov	al, [bp+var_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_58084
		push	17h
		push	950h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_58084:
		jmp	loc_581BE

loc_58087:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_4], al
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_5], al
		cmp	[bp+var_4], 0
		jz	short loc_580B3
		cmp	[bp+var_4], 1
		jnz	short loc_580C1

loc_580B3:
		mov	[bp+var_1], 0
		mov	[bp+var_2], 2
		mov	[bp+var_3], 1
		jmp	short loc_58123

loc_580C1:
		cmp	[bp+var_4], 6
		jnz	short loc_580D5
		mov	[bp+var_1], 2
		mov	[bp+var_2], 3
		mov	[bp+var_3], 1
		jmp	short loc_58123

loc_580D5:
		cmp	[bp+var_4], 8
		jnz	short loc_580E9
		mov	[bp+var_1], 1
		mov	[bp+var_2], 2
		mov	[bp+var_3], 2
		jmp	short loc_58123

loc_580E9:
		cmp	[bp+var_4], 5
		jz	short loc_580F5
		cmp	[bp+var_4], 4
		jnz	short loc_58103

loc_580F5:
		mov	[bp+var_1], 2
		mov	[bp+var_2], 3
		mov	[bp+var_3], 6
		jmp	short loc_58123

loc_58103:
		cmp	[bp+var_4], 7
		jnz	short loc_58117
		mov	[bp+var_1], 2
		mov	[bp+var_2], 3
		mov	[bp+var_3], 2
		jmp	short loc_58123

loc_58117:
		mov	[bp+var_1], 2
		mov	[bp+var_2], 3
		mov	[bp+var_3], 3

loc_58123:
		mov	al, [bp+var_5]
		mov	ah, 0
		mov	dl, [bp+var_4]
		mov	dh, 0
		shl	dx, 1
		mov	bx, dx
		cmp	ax, [bx+si+262h]
		jbe	short loc_58147
		mov	al, [bp+var_4]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	al, [bx+si+262h]
		mov	[bp+var_5], al

loc_58147:
		test	[bp+var_5], 1
		jz	short loc_58150
		dec	[bp+var_5]

loc_58150:
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	cx, ax
		jmp	short loc_581B5

loc_58159:
		cmp	[bp+var_5], 0
		jnz	short loc_58161
		jmp	short loc_581BE

loc_58161:
		mov	bx, cx
		shl	bx, 1
		cmp	byte ptr [bx+si+274h], 0FFh
		jnz	short loc_581B4
		mov	bx, cx
		shl	bx, 1
		mov	al, [bp+var_4]
		mov	[bx+si+274h], al
		mov	al, [bp+var_5]
		mov	ah, 0
		mov	dl, [bp+var_3]
		mov	dh, 0
		shl	dx, 1
		cmp	ax, dx
		jle	short loc_581A1
		mov	bx, cx
		shl	bx, 1
		mov	al, [bp+var_3]
		mov	[bx+si+275h], al
		mov	al, [bp+var_3]
		shl	al, 1
		mov	dl, [bp+var_5]
		sub	dl, al
		mov	[bp+var_5], dl
		jmp	short loc_581B4

loc_581A1:
		mov	al, [bp+var_5]
		mov	ah, 0
		sar	ax, 1
		mov	bx, cx
		shl	bx, 1
		mov	[bx+si+275h], al
		mov	[bp+var_5], 0

loc_581B4:
		inc	cx

loc_581B5:
		mov	al, [bp+var_2]
		mov	ah, 0
		cmp	ax, cx
		jge	short loc_58159

loc_581BE:
		test	[bp+var_3E], 1
		jz	short loc_581D9
		mov	eax, [bp+var_3A]
		dec	eax
		cmp	eax, [bp+var_4B]
		jnz	short loc_581D7
		inc	[bp+var_4B]
		jmp	short loc_581D7

loc_581D7:
		jmp	short loc_581D9

loc_581D9:
		mov	eax, [bp+var_4B]
		cmp	eax, [bp+var_3A]
		jl	short loc_581E8
		mov	ax, 1
		jmp	short loc_581EA

loc_581E8:
		xor	ax, ax

loc_581EA:
		or	ax, ax
		jnz	short loc_581F1
		jmp	loc_58087

loc_581F1:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_B0], 498h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_58220:
		pop	si
		leave
		retf
Gameflow_ApplyDefaultLoadout_57FA0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Chargement par défaut du second écran d'armement (commande 43) : même code que
; Gameflow_ApplyDefaultLoadout_57FA0, seules les plages de points d'emport changent (premier,
; dernier, maximum par côté) : armes 0 et 1 (AIM-9J, AIM-9M) 0, 0, 1 ; arme 8 (AIM-120) 1, 1,
; 1 ; armes 4 à 7 et autres 0, 255, 0 (mov [bp+var_2], 0FFh).
; ==============================================================================================
Gameflow_ApplyDefaultLoadoutAlt_58223		proc far

var_B0		= word ptr -0B0h
var_53		= dword ptr -53h
var_4F		= dword ptr -4Fh
var_4B		= dword ptr -4Bh
var_3E		= word ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= word ptr -36h
var_34		= word ptr -34h
var_7		= byte ptr -7
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0B0h
		push	si
		mov	si, [bp+arg_0]
		cmp	[bp+arg_4], 0FFh
		jnz	short loc_58237
		jmp	loc_584A3

loc_58237:
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_B0], 480h
		mov	[bp+var_4F], 100h
		mov	[bp+var_53], 0
		mov	[bp+var_B0], 498h
		mov	[bp+var_34], 0
		xor	ax, ax
		mov	[bp+var_36], ax
		movsx	eax, ax
		mov	[bp+var_4B], eax
		push	1
		push	[bp+arg_2]
		lea	ax, [bp+var_B0]
		push	ax
		mov	bx, [bp+var_B0]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	0
		push	large 44414F4Ch
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndReadB_427C5
		add	sp, 8
		or	ax, ax
		jnz	short loc_582AC
		push	16h
		push	950h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_582AC:
		mov	[bp+var_6], 0
		jmp	short loc_582D8

loc_582B2:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_7], al
		mov	al, [bp+var_7]
		cmp	al, [bp+arg_4]
		jnz	short loc_582D0
		mov	[bp+var_6], 1
		jmp	short loc_582F1

loc_582D0:
		mov	eax, [bp+var_3A]
		mov	[bp+var_4B], eax

loc_582D8:
		push	1
		push	large 44414F4Ch
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_SeekAndRead_42756
		add	sp, 8
		or	ax, ax
		jnz	short loc_582B2

loc_582F1:
		mov	al, [bp+var_6]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_58307
		push	17h
		push	950h
		call	Runtime_FatalErrorHandler_36797
		add	sp, 4

loc_58307:
		jmp	loc_58441

loc_5830A:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_4], al
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_ReadFinalField_42B64
		add	sp, 2
		mov	[bp+var_5], al
		cmp	[bp+var_4], 0
		jz	short loc_58336
		cmp	[bp+var_4], 1
		jnz	short loc_58344

loc_58336:
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	[bp+var_3], 1
		jmp	short loc_583A6

loc_58344:
		cmp	[bp+var_4], 6
		jnz	short loc_58358
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0FFh
		mov	[bp+var_3], 0
		jmp	short loc_583A6

loc_58358:
		cmp	[bp+var_4], 8
		jnz	short loc_5836C
		mov	[bp+var_1], 1
		mov	[bp+var_2], 1
		mov	[bp+var_3], 1
		jmp	short loc_583A6

loc_5836C:
		cmp	[bp+var_4], 5
		jz	short loc_58378
		cmp	[bp+var_4], 4
		jnz	short loc_58386

loc_58378:
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0FFh
		mov	[bp+var_3], 0
		jmp	short loc_583A6

loc_58386:
		cmp	[bp+var_4], 7
		jnz	short loc_5839A
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0FFh
		mov	[bp+var_3], 0
		jmp	short loc_583A6

loc_5839A:
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0FFh
		mov	[bp+var_3], 0

loc_583A6:
		mov	al, [bp+var_5]
		mov	ah, 0
		mov	dl, [bp+var_4]
		mov	dh, 0
		shl	dx, 1
		mov	bx, dx
		cmp	ax, [bx+si+262h]
		jbe	short loc_583CA
		mov	al, [bp+var_4]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		mov	al, [bx+si+262h]
		mov	[bp+var_5], al

loc_583CA:
		test	[bp+var_5], 1
		jz	short loc_583D3
		dec	[bp+var_5]

loc_583D3:
		mov	al, [bp+var_1]
		mov	ah, 0
		mov	cx, ax
		jmp	short loc_58438

loc_583DC:
		cmp	[bp+var_5], 0
		jnz	short loc_583E4
		jmp	short loc_58441

loc_583E4:
		mov	bx, cx
		shl	bx, 1
		cmp	byte ptr [bx+si+274h], 0FFh
		jnz	short loc_58437
		mov	bx, cx
		shl	bx, 1
		mov	al, [bp+var_4]
		mov	[bx+si+274h], al
		mov	al, [bp+var_5]
		mov	ah, 0
		mov	dl, [bp+var_3]
		mov	dh, 0
		shl	dx, 1
		cmp	ax, dx
		jle	short loc_58424
		mov	bx, cx
		shl	bx, 1
		mov	al, [bp+var_3]
		mov	[bx+si+275h], al
		mov	al, [bp+var_3]
		shl	al, 1
		mov	dl, [bp+var_5]
		sub	dl, al
		mov	[bp+var_5], dl
		jmp	short loc_58437

loc_58424:
		mov	al, [bp+var_5]
		mov	ah, 0
		sar	ax, 1
		mov	bx, cx
		shl	bx, 1
		mov	[bx+si+275h], al
		mov	[bp+var_5], 0

loc_58437:
		inc	cx

loc_58438:
		mov	al, [bp+var_2]
		mov	ah, 0
		cmp	ax, cx
		jge	short loc_583DC

loc_58441:
		test	[bp+var_3E], 1
		jz	short loc_5845C
		mov	eax, [bp+var_3A]
		dec	eax
		cmp	eax, [bp+var_4B]
		jnz	short loc_5845A
		inc	[bp+var_4B]
		jmp	short loc_5845A

loc_5845A:
		jmp	short loc_5845C

loc_5845C:
		mov	eax, [bp+var_4B]
		cmp	eax, [bp+var_3A]
		jl	short loc_5846B
		mov	ax, 1
		jmp	short loc_5846D

loc_5846B:
		xor	ax, ax

loc_5846D:
		or	ax, ax
		jnz	short loc_58474
		jmp	loc_5830A

loc_58474:
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		mov	[bp+var_B0], 498h
		lea	ax, [bp+var_B0]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_B0]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4

loc_584A3:
		pop	si
		leave
		retf
Gameflow_ApplyDefaultLoadoutAlt_58223		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. Écran d'armement de la commande 22 (WEAPON_LOADOUT), même code que
; Gameflow_WeaponLoadout_51AB3 d'OPTEST (comparaison des suites d'instructions : seules les
; variables de pile diffèrent) sauf : au départ en vol (sprite 12), mov byte ptr [bx+6], 0
; (partie +6 = 0) en plus de [+233] = 1 et [+239] = 1. Chargement par défaut :
; Gameflow_ApplyDefaultLoadout_57FA0.
; ==============================================================================================
Gameflow_WeaponLoadout_584A6		proc far

var_35E		= word ptr -35Eh
var_32C		= word ptr -32Ch
var_2CF		= dword ptr -2CFh
var_2CB		= dword ptr -2CBh
var_2C7		= dword ptr -2C7h
var_2B2		= word ptr -2B2h
var_2B0		= word ptr -2B0h
var_284		= word ptr -284h
var_27A		= word ptr -27Ah
var_265		= word ptr -265h
var_257		= word ptr -257h
var_254		= byte ptr -254h
var_24A		= word ptr -24Ah
var_244		= byte ptr -244h
var_22F		= byte ptr -22Fh
var_224		= byte ptr -224h
var_223		= word ptr -223h
var_221		= word ptr -221h
var_21F		= word ptr -21Fh
var_21D		= word ptr -21Dh
var_21B		= word ptr -21Bh
var_216		= byte ptr -216h
var_214		= word ptr -214h
var_210		= byte ptr -210h
var_20D		= byte ptr -20Dh
var_207		= byte ptr -207h
var_204		= byte ptr -204h
var_201		= byte ptr -201h
var_1F5		= byte ptr -1F5h
var_1F4		= byte ptr -1F4h
var_1F3		= byte ptr -1F3h
var_1F2		= byte ptr -1F2h
var_1F1		= byte ptr -1F1h
var_1F0		= byte ptr -1F0h
var_1E9		= byte ptr -1E9h
var_1E8		= byte ptr -1E8h
var_1E7		= byte ptr -1E7h
var_1E6		= byte ptr -1E6h
var_1E5		= byte ptr -1E5h
var_1E4		= byte ptr -1E4h
var_1DD		= byte ptr -1DDh
var_1DC		= byte ptr -1DCh
var_1DB		= byte ptr -1DBh
var_1DA		= byte ptr -1DAh
var_1D9		= byte ptr -1D9h
var_1D8		= byte ptr -1D8h
var_1D1		= byte ptr -1D1h
var_1D0		= byte ptr -1D0h
var_1CF		= byte ptr -1CFh
var_1CE		= byte ptr -1CEh
var_1CD		= byte ptr -1CDh
var_1CC		= byte ptr -1CCh
var_1C5		= byte ptr -1C5h
var_1C2		= byte ptr -1C2h
var_1B9		= byte ptr -1B9h
var_1B8		= byte ptr -1B8h
var_1B7		= byte ptr -1B7h
var_1B6		= byte ptr -1B6h
var_1B5		= byte ptr -1B5h
var_1B4		= byte ptr -1B4h
var_1B0		= byte ptr -1B0h
var_1AD		= byte ptr -1ADh
var_1AC		= byte ptr -1ACh
var_1AA		= word ptr -1AAh
var_42		= word ptr -42h
var_30		= word ptr -30h
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= word ptr -1Ah
var_17		= byte ptr -17h
var_16		= word ptr -16h
var_15		= word ptr -15h
var_E		= word ptr -0Eh
var_6		= byte ptr -6
var_4		= byte ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 35Eh
		push	si
		push	di
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	si, 962h
		lea	di, [bp+var_30]
		push	ss
		pop	es
		mov	cx, 9
		rep movsw
		mov	[bp+var_2], 0
		jmp	short loc_584F2

loc_584D1:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	byte ptr [bx+274h], 0FFh
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	byte ptr [bx+275h], 0
		inc	[bp+var_2]

loc_584F2:
		cmp	[bp+var_2], 4
		jl	short loc_584D1
		mov	al, [bp+arg_2]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 44h
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr Gameflow_ApplyDefaultLoadout_57FA0
		add	sp, 6
		mov	[bp+var_2], 0
		jmp	short loc_58555

loc_58514:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+274h], 0FFh
		jz	short loc_58552
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+275h]
		mov	ah, 0
		shl	ax, 1
		mov	dx, [bp+var_2]
		shl	dx, 1
		mov	bx, [bp+arg_0]
		add	bx, dx
		mov	dl, [bx+274h]
		mov	dh, 0
		shl	dx, 1
		lea	bx, [bp+var_30]
		add	dx, bx
		mov	bx, dx
		add	[bx], ax

loc_58552:
		inc	[bp+var_2]

loc_58555:
		cmp	[bp+var_2], 4
		jl	short loc_58514
		mov	[bp+var_2], 0
		jmp	short loc_5858B

loc_58562:
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_30]
		add	bx, ax
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	si, [bp+arg_0]
		add	si, ax
		mov	ax, [si+262h]
		sub	ax, [bx]
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	dx, [bp+var_42]
		add	bx, dx
		mov	[bx], ax
		inc	[bp+var_2]

loc_5858B:
		cmp	[bp+var_2], 9
		jl	short loc_58562
		mov	[bp+var_2], 0
		jmp	short loc_585AA

loc_58598:
		mov	al, byte ptr [bp+var_2]
		add	al, 1Dh
		lea	dx, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, dx
		mov	[bx], al
		inc	[bp+var_2]

loc_585AA:
		cmp	[bp+var_2], 8
		jl	short loc_58598
		mov	[bp+var_6], 74h
		mov	[bp+var_2], 0
		jmp	short loc_585CD

loc_585BB:
		mov	al, byte ptr [bp+var_2]
		add	al, 75h
		lea	dx, [bp+var_16]
		mov	bx, [bp+var_2]
		add	bx, dx
		mov	[bx], al
		inc	[bp+var_2]

loc_585CD:
		cmp	[bp+var_2], 8
		jl	short loc_585BB
		mov	byte ptr [bp+var_214+1], 25h
		mov	[bp+var_210], 26h
		mov	[bp+var_20D], 49h
		mov	[bp+var_207], 27h
		mov	[bp+var_204], 28h
		mov	[bp+var_201], 4Ah
		mov	[bp+var_1F5], 29h
		mov	[bp+var_1F4], 2Ah
		mov	[bp+var_1F3], 2Bh
		mov	[bp+var_1F2], 2Ch
		mov	[bp+var_1F1], 2Dh
		mov	[bp+var_1F0], 2Eh
		mov	[bp+var_1E9], 2Fh
		mov	[bp+var_1E8], 30h
		mov	[bp+var_1E7], 31h
		mov	[bp+var_1E6], 32h
		mov	[bp+var_1E5], 33h
		mov	[bp+var_1E4], 34h
		mov	[bp+var_1DD], 35h
		mov	[bp+var_1DC], 36h
		mov	[bp+var_1DB], 37h
		mov	[bp+var_1DA], 38h
		mov	[bp+var_1D9], 39h
		mov	[bp+var_1D8], 3Ah
		mov	[bp+var_1D1], 3Bh
		mov	[bp+var_1D0], 3Ch
		mov	[bp+var_1CF], 3Dh
		mov	[bp+var_1CE], 3Eh
		mov	[bp+var_1CD], 3Fh
		mov	[bp+var_1CC], 40h
		mov	[bp+var_1C5], 41h
		mov	[bp+var_1C2], 42h
		mov	[bp+var_1B9], 43h
		mov	[bp+var_1B8], 44h
		mov	[bp+var_1B7], 45h
		mov	[bp+var_1B6], 46h
		mov	[bp+var_1B5], 47h
		mov	[bp+var_1B4], 48h
		mov	[bp+var_1B0], 71h
		mov	[bp+var_1AD], 72h
		mov	[bp+var_1AC], 73h
		mov	[bp+var_17], 0FFh
		mov	bx, [bp+arg_0]
		mov	ax, [bx+0E5h]
		mov	[bp+var_1A], ax
		lea	ax, [bp+var_32C]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_32C], 480h
		mov	[bp+var_2CB], 100h
		mov	[bp+var_2CF], 0
		mov	[bp+var_32C], 498h
		mov	[bp+var_2B0], 0
		xor	ax, ax
		mov	[bp+var_2B2], ax
		movsx	eax, ax
		mov	[bp+var_2C7], eax
		push	[bp+var_1A]
		push	word_4D36E
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_284]
		push	ax
		call	sub_7A04
		add	sp, 0Ah
		mov	[bp+var_32C], 4B0h
		mov	[bp+var_284], 4C8h
		mov	[bp+var_27A], 4E8h
		mov	[bp+var_221], 1E4h
		xor	ax, ax
		mov	[bp+var_21D], ax
		mov	[bp+var_21F], ax
		mov	[bp+var_221], 47Ch
		push	100h
		push	0
		lea	ax, [bp+var_21B]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_22F], 0
		mov	[bp+var_224], 0
		mov	[bp+var_244], 0Fh
		mov	[bp+var_216], 0FFh
		mov	ax, [bp+var_1A]
		mov	[bp+var_223], ax
		push	0
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_870B
		add	sp, 4
		mov	al, byte_49538
		mov	ah, 0
		or	ax, ax
		jnz	short loc_58783
		mov	al, [bp+var_216]
		mov	ah, 0
		push	ax
		call	sub_2D974
		add	sp, 2

loc_58783:
		mov	[bp+var_2], 0
		jmp	short loc_587BD

loc_5878A:
		lea	ax, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8657
		add	sp, 4
		push	ax
		mov	ax, [bp+var_2]
		mov	dx, 28h
		imul	dx
		lea	dx, [bp+var_1AA]
		add	ax, dx
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		inc	[bp+var_2]

loc_587BD:
		cmp	[bp+var_2], 9
		jl	short loc_5878A
		jmp	loc_58C4B

loc_587C6:
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_85BE
		add	sp, 2
		push	0Ch
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8543
		add	sp, 4
		mov	bx, [bp+arg_0]
		cmp	byte ptr [bx+0FDh], 14h
		jnz	short loc_5880C
		push	14h
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8543
		add	sp, 4
		push	7Dh
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_85CD
		add	sp, 4
		jmp	short loc_5881B

loc_5880C:
		push	0Bh
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8543
		add	sp, 4

loc_5881B:
		mov	[bp+var_2], 0
		jmp	short loc_58894

loc_58822:
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_42]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_58891
		lea	ax, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8543
		add	sp, 4
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_42]
		add	bx, ax
		push	word ptr [bx]
		mov	ax, [bp+var_2]
		mov	dx, 28h
		imul	dx
		lea	dx, [bp+var_1AA]
		add	ax, dx
		push	ax
		push	990h
		lea	ax, [bp+var_35E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		lea	ax, [bp+var_35E]
		push	ax
		lea	ax, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_86A2
		add	sp, 6

loc_58891:
		inc	[bp+var_2]

loc_58894:
		cmp	[bp+var_2], 9
		jl	short loc_58822
		mov	[bp+var_2], 0
		jmp	loc_589C5

loc_588A2:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+274h], 0FFh
		jnz	short loc_588B6
		jmp	loc_589C2

loc_588B6:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+275h]
		mov	[bp+var_1C], al
		cmp	[bp+var_1C], 3
		jbe	short loc_588D1
		mov	[bp+var_1C], 3

loc_588D1:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_2]
		shl	dx, 1
		add	dx, [bp+var_2]
		add	al, dl
		add	al, [bp+var_1C]
		mov	[bp+var_1B], al
		mov	al, [bp+var_1B]
		mov	ah, 0
		lea	dx, [bp+var_214]
		add	ax, dx
		mov	bx, ax
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_85CD
		add	sp, 4
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_30]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+202h]
		push	998h
		lea	ax, [bp+var_35E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_16]
		add	bx, ax
		mov	al, [bx]
		mov	[bp+var_1D], al
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_15]
		add	bx, ax
		mov	al, [bx]
		mov	[bp+var_1E], al
		mov	al, [bp+var_1D]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8543
		add	sp, 4
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8543
		add	sp, 4
		lea	ax, [bp+var_35E]
		push	ax
		mov	al, [bp+var_1D]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_86A2
		add	sp, 6
		lea	ax, [bp+var_35E]
		push	ax
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_86A2
		add	sp, 6

loc_589C2:
		inc	[bp+var_2]

loc_589C5:
		cmp	[bp+var_2], 4
		jge	short loc_589CE
		jmp	loc_588A2

loc_589CE:
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_9243
		add	sp, 2
		mov	[bp+var_17], al
		mov	[bp+var_4], 0FFh
		mov	[bp+var_1B], 0
		mov	[bp+var_1C], 0
		mov	[bp+var_2], 0
		jmp	short loc_58A0F

loc_589F1:
		lea	ax, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		cmp	al, [bp+var_17]
		jnz	short loc_58A0C
		mov	al, byte ptr [bp+var_2]
		mov	[bp+var_4], al
		mov	[bp+var_1B], 1
		jmp	short loc_58A15

loc_58A0C:
		inc	[bp+var_2]

loc_58A0F:
		cmp	[bp+var_2], 9
		jl	short loc_589F1

loc_58A15:
		mov	[bp+var_2], 0
		jmp	short loc_58A4E

loc_58A1C:
		lea	ax, [bp+var_16]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		cmp	al, [bp+var_17]
		jnz	short loc_58A4B
		mov	ax, [bp+var_2]
		cwd
		sub	ax, dx
		sar	ax, 1
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	[bp+var_4], al
		mov	[bp+var_1B], 1
		mov	[bp+var_1C], 1
		jmp	short loc_58A54

loc_58A4B:
		inc	[bp+var_2]

loc_58A4E:
		cmp	[bp+var_2], 8
		jl	short loc_58A1C

loc_58A54:
		mov	al, [bp+var_1B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_58A60
		jmp	loc_58C5A

loc_58A60:
		cmp	[bp+var_254], 0
		jnz	short loc_58A70
		cmp	[bp+var_1C], 0
		jnz	short loc_58A70
		jmp	loc_58B01

loc_58A70:
		mov	[bp+var_2], 3
		jmp	short loc_58AF5

loc_58A77:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		cmp	al, [bp+var_4]
		jnz	short loc_58AF2
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		dec	byte ptr [bx+275h]
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_42]
		add	ax, dx
		mov	bx, ax
		add	word ptr [bx], 2
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_30]
		add	ax, dx
		mov	bx, ax
		sub	word ptr [bx], 2
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+275h], 0
		jnz	short loc_58AF0
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	byte ptr [bx+274h], 0FFh

loc_58AF0:
		jmp	short loc_58AFE

loc_58AF2:
		dec	[bp+var_2]

loc_58AF5:
		cmp	[bp+var_2], 0
		jl	short loc_58AFE
		jmp	loc_58A77

loc_58AFE:
		jmp	loc_58C4B

loc_58B01:
		cmp	[bp+var_4], 0
		jz	short loc_58B0D
		cmp	[bp+var_4], 1
		jnz	short loc_58B19

loc_58B0D:
		mov	[bp+var_1D], 0
		mov	cl, 2
		mov	[bp+var_1E], 1
		jmp	short loc_58B71

loc_58B19:
		cmp	[bp+var_4], 6
		jnz	short loc_58B2B
		mov	[bp+var_1D], 2
		mov	cl, 3
		mov	[bp+var_1E], 1
		jmp	short loc_58B71

loc_58B2B:
		cmp	[bp+var_4], 8
		jnz	short loc_58B3D
		mov	[bp+var_1D], 1
		mov	cl, 2
		mov	[bp+var_1E], 2
		jmp	short loc_58B71

loc_58B3D:
		cmp	[bp+var_4], 5
		jz	short loc_58B49
		cmp	[bp+var_4], 4
		jnz	short loc_58B55

loc_58B49:
		mov	[bp+var_1D], 2
		mov	cl, 3
		mov	[bp+var_1E], 6
		jmp	short loc_58B71

loc_58B55:
		cmp	[bp+var_4], 7
		jnz	short loc_58B67
		mov	[bp+var_1D], 2
		mov	cl, 3
		mov	[bp+var_1E], 2
		jmp	short loc_58B71

loc_58B67:
		mov	[bp+var_1D], 2
		mov	cl, 3
		mov	[bp+var_1E], 3

loc_58B71:
		mov	al, [bp+var_1D]
		mov	ah, 0
		mov	[bp+var_2], ax
		jmp	loc_58C3F

loc_58B7C:
		mov	al, [bp+var_4]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_42]
		add	ax, dx
		mov	bx, ax
		cmp	word ptr [bx], 1
		ja	short loc_58B92
		jmp	loc_58C3C

loc_58B92:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+274h], 0FFh
		jz	short loc_58BE3
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		cmp	al, [bp+var_4]
		jz	short loc_58BB9
		jmp	loc_58C3C

loc_58BB9:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+275h]
		cmp	al, [bp+var_1E]
		jnb	short loc_58C3C
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+274h], 8
		jnz	short loc_58BE3
		cmp	[bp+var_2], 1
		jz	short loc_58C3C

loc_58BE3:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bp+var_4]
		mov	[bx+274h], al
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		inc	byte ptr [bx+275h]
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_42]
		add	ax, dx
		mov	bx, ax
		sub	word ptr [bx], 2
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_30]
		add	ax, dx
		mov	bx, ax
		add	word ptr [bx], 2
		jmp	short loc_58C4B

loc_58C3C:
		inc	[bp+var_2]

loc_58C3F:
		mov	al, cl
		mov	ah, 0
		cmp	ax, [bp+var_2]
		jl	short loc_58C4B
		jmp	loc_58B7C

loc_58C4B:
		cmp	[bp+var_17], 0Bh
		jz	short loc_58C5A
		cmp	[bp+var_17], 0Ch
		jz	short loc_58C5A
		jmp	loc_587C6

loc_58C5A:
		cmp	[bp+var_17], 0Ch
		jnz	short loc_58C79
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx+6], 0
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx+0E9h], 1
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx+0EFh], 1
		jmp	short loc_58C87

loc_58C79:
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4

loc_58C87:
		cmp	[bp+var_17], 0Ch
		jz	short loc_58C90
		jmp	loc_58D3D

loc_58C90:
		lea	ax, [bp+var_21B]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_221]
		push	ax
		call	sub_6EDA
		add	sp, 4
		mov	[bp+var_284], 44Ch
		mov	[bp+var_27A], 46Ch
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	byte_4F77A, 0
		cmp	[bp+var_257], 0
		jz	short loc_58CE7
		mov	ax, [bp+var_257]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	[bp+var_257]
		call	sub_39C
		add	sp, 2
		jmp	short loc_58CE7

loc_58CE7:
		push	2
		lea	ax, [bp+var_24A]
		push	ax
		call	sub_77A1
		add	sp, 4
		lea	ax, [bp+var_265]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_284]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		mov	[bp+var_32C], 498h
		lea	ax, [bp+var_32C]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_32C]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
		jmp	loc_58DE7

loc_58D3D:
		lea	ax, [bp+var_21B]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_221]
		push	ax
		call	sub_6EDA
		add	sp, 4
		mov	[bp+var_284], 44Ch
		mov	[bp+var_27A], 46Ch
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	byte_4F77A, 0
		cmp	[bp+var_257], 0
		jz	short loc_58D94
		mov	ax, [bp+var_257]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	[bp+var_257]
		call	sub_39C
		add	sp, 2
		jmp	short loc_58D94

loc_58D94:
		push	2
		lea	ax, [bp+var_24A]
		push	ax
		call	sub_77A1
		add	sp, 4
		lea	ax, [bp+var_265]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_284]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		mov	[bp+var_32C], 498h
		lea	ax, [bp+var_32C]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_32C]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
Gameflow_WeaponLoadout_584A6		endp

; START OF FUNCTION CHUNK FOR Gameflow_WeaponLoadout_584A6

loc_58DE7:
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR Gameflow_WeaponLoadout_584A6

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far, LU 2026-11-02 (par comparaison avec Gameflow_WeaponLoadout_584A6, 997 lignes contre
; 989). Écran d'armement de la commande 43 (Tactical Operations). Différences : chargement par
; défaut Gameflow_ApplyDefaultLoadoutAlt_58223 ; plages de points d'emport (AIM-9J/M : point
; 0, 1 par côté ; AIM-120 : point 1, 1 par côté ; autres armes : début 0, fin 255, 0 par côté)
; ; au départ en vol mov byte ptr [bx+6], 1 (partie +6 = 1) ; textes « %s (%d) » / « Remove %s
; (%d) » pris en dseg 2471 et 2479 (mêmes chaînes) ; quelques constantes d'affichage
; différentes ([bp+var_244] = 32 au lieu de 15, push 1 au lieu de push 0 avant sub_870B) et
; liste d'armes construite sans la boucle sur 9 armes — rôle de ces différences d'affichage
; non établi.
; ==============================================================================================
Gameflow_WeaponLoadoutAlt_58DEB		proc far

var_35E		= word ptr -35Eh
var_32C		= word ptr -32Ch
var_2CF		= dword ptr -2CFh
var_2CB		= dword ptr -2CBh
var_2C7		= dword ptr -2C7h
var_2B2		= word ptr -2B2h
var_2B0		= word ptr -2B0h
var_284		= word ptr -284h
var_27A		= word ptr -27Ah
var_265		= word ptr -265h
var_257		= word ptr -257h
var_254		= byte ptr -254h
var_24A		= word ptr -24Ah
var_244		= byte ptr -244h
var_22F		= byte ptr -22Fh
var_224		= byte ptr -224h
var_223		= word ptr -223h
var_221		= word ptr -221h
var_21F		= word ptr -21Fh
var_21D		= word ptr -21Dh
var_21B		= word ptr -21Bh
var_216		= byte ptr -216h
var_214		= word ptr -214h
var_210		= byte ptr -210h
var_20D		= byte ptr -20Dh
var_207		= byte ptr -207h
var_204		= byte ptr -204h
var_201		= byte ptr -201h
var_1F5		= byte ptr -1F5h
var_1F4		= byte ptr -1F4h
var_1F3		= byte ptr -1F3h
var_1F2		= byte ptr -1F2h
var_1F1		= byte ptr -1F1h
var_1F0		= byte ptr -1F0h
var_1E9		= byte ptr -1E9h
var_1E8		= byte ptr -1E8h
var_1E7		= byte ptr -1E7h
var_1E6		= byte ptr -1E6h
var_1E5		= byte ptr -1E5h
var_1E4		= byte ptr -1E4h
var_1DD		= byte ptr -1DDh
var_1DC		= byte ptr -1DCh
var_1DB		= byte ptr -1DBh
var_1DA		= byte ptr -1DAh
var_1D9		= byte ptr -1D9h
var_1D8		= byte ptr -1D8h
var_1D1		= byte ptr -1D1h
var_1D0		= byte ptr -1D0h
var_1CF		= byte ptr -1CFh
var_1CE		= byte ptr -1CEh
var_1CD		= byte ptr -1CDh
var_1CC		= byte ptr -1CCh
var_1C5		= byte ptr -1C5h
var_1C2		= byte ptr -1C2h
var_1B9		= byte ptr -1B9h
var_1B8		= byte ptr -1B8h
var_1B7		= byte ptr -1B7h
var_1B6		= byte ptr -1B6h
var_1B5		= byte ptr -1B5h
var_1B4		= byte ptr -1B4h
var_1B0		= byte ptr -1B0h
var_1AD		= byte ptr -1ADh
var_1AC		= byte ptr -1ACh
var_1AA		= word ptr -1AAh
var_182		= word ptr -182h
var_6A		= word ptr -6Ah
var_42		= word ptr -42h
var_30		= word ptr -30h
var_1E		= byte ptr -1Eh
var_1D		= byte ptr -1Dh
var_1C		= byte ptr -1Ch
var_1B		= byte ptr -1Bh
var_1A		= word ptr -1Ah
var_17		= byte ptr -17h
var_16		= word ptr -16h
var_15		= word ptr -15h
var_E		= word ptr -0Eh
var_6		= byte ptr -6
var_4		= byte ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 35Eh
		push	si
		push	di
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	si, 974h
		lea	di, [bp+var_30]
		push	ss
		pop	es
		mov	cx, 9
		rep movsw
		mov	[bp+var_2], 0
		jmp	short loc_58E37

loc_58E16:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	byte ptr [bx+274h], 0FFh
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	byte ptr [bx+275h], 0
		inc	[bp+var_2]

loc_58E37:
		cmp	[bp+var_2], 4
		jl	short loc_58E16
		mov	al, [bp+arg_2]
		push	ax
		mov	ax, [bp+arg_0]
		add	ax, 44h
		push	ax
		push	[bp+arg_0]
		push	cs
		call	near ptr Gameflow_ApplyDefaultLoadoutAlt_58223
		add	sp, 6
		mov	[bp+var_2], 0
		jmp	short loc_58E9A

loc_58E59:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+274h], 0FFh
		jz	short loc_58E97
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+275h]
		mov	ah, 0
		shl	ax, 1
		mov	dx, [bp+var_2]
		shl	dx, 1
		mov	bx, [bp+arg_0]
		add	bx, dx
		mov	dl, [bx+274h]
		mov	dh, 0
		shl	dx, 1
		lea	bx, [bp+var_30]
		add	dx, bx
		mov	bx, dx
		add	[bx], ax

loc_58E97:
		inc	[bp+var_2]

loc_58E9A:
		cmp	[bp+var_2], 4
		jl	short loc_58E59
		mov	[bp+var_2], 0
		jmp	short loc_58ED0

loc_58EA7:
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_30]
		add	bx, ax
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	si, [bp+arg_0]
		add	si, ax
		mov	ax, [si+262h]
		sub	ax, [bx]
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	dx, [bp+var_42]
		add	bx, dx
		mov	[bx], ax
		inc	[bp+var_2]

loc_58ED0:
		cmp	[bp+var_2], 9
		jl	short loc_58EA7
		mov	[bp+var_2], 0
		jmp	short loc_58EEF

loc_58EDD:
		mov	al, byte ptr [bp+var_2]
		add	al, 1Dh
		lea	dx, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, dx
		mov	[bx], al
		inc	[bp+var_2]

loc_58EEF:
		cmp	[bp+var_2], 8
		jl	short loc_58EDD
		mov	[bp+var_6], 74h
		mov	[bp+var_2], 0
		jmp	short loc_58F12

loc_58F00:
		mov	al, byte ptr [bp+var_2]
		add	al, 75h
		lea	dx, [bp+var_16]
		mov	bx, [bp+var_2]
		add	bx, dx
		mov	[bx], al
		inc	[bp+var_2]

loc_58F12:
		cmp	[bp+var_2], 8
		jl	short loc_58F00
		mov	byte ptr [bp+var_214+1], 25h
		mov	[bp+var_210], 26h
		mov	[bp+var_20D], 49h
		mov	[bp+var_207], 27h
		mov	[bp+var_204], 28h
		mov	[bp+var_201], 4Ah
		mov	[bp+var_1F5], 29h
		mov	[bp+var_1F4], 2Ah
		mov	[bp+var_1F3], 2Bh
		mov	[bp+var_1F2], 2Ch
		mov	[bp+var_1F1], 2Dh
		mov	[bp+var_1F0], 2Eh
		mov	[bp+var_1E9], 2Fh
		mov	[bp+var_1E8], 30h
		mov	[bp+var_1E7], 31h
		mov	[bp+var_1E6], 32h
		mov	[bp+var_1E5], 33h
		mov	[bp+var_1E4], 34h
		mov	[bp+var_1DD], 35h
		mov	[bp+var_1DC], 36h
		mov	[bp+var_1DB], 37h
		mov	[bp+var_1DA], 38h
		mov	[bp+var_1D9], 39h
		mov	[bp+var_1D8], 3Ah
		mov	[bp+var_1D1], 3Bh
		mov	[bp+var_1D0], 3Ch
		mov	[bp+var_1CF], 3Dh
		mov	[bp+var_1CE], 3Eh
		mov	[bp+var_1CD], 3Fh
		mov	[bp+var_1CC], 40h
		mov	[bp+var_1C5], 41h
		mov	[bp+var_1C2], 42h
		mov	[bp+var_1B9], 43h
		mov	[bp+var_1B8], 44h
		mov	[bp+var_1B7], 45h
		mov	[bp+var_1B6], 46h
		mov	[bp+var_1B5], 47h
		mov	[bp+var_1B4], 48h
		mov	[bp+var_1B0], 71h
		mov	[bp+var_1AD], 72h
		mov	[bp+var_1AC], 73h
		mov	[bp+var_17], 0FFh
		mov	bx, [bp+arg_0]
		mov	ax, [bx+0E5h]
		mov	[bp+var_1A], ax
		lea	ax, [bp+var_32C]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_32C], 480h
		mov	[bp+var_2CB], 100h
		mov	[bp+var_2CF], 0
		mov	[bp+var_32C], 498h
		mov	[bp+var_2B0], 0
		xor	ax, ax
		mov	[bp+var_2B2], ax
		movsx	eax, ax
		mov	[bp+var_2C7], eax
		push	[bp+var_1A]
		push	word_4D36E
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_284]
		push	ax
		call	sub_7A04
		add	sp, 0Ah
		mov	[bp+var_32C], 4B0h
		mov	[bp+var_284], 4C8h
		mov	[bp+var_27A], 4E8h
		mov	[bp+var_221], 1E4h
		xor	ax, ax
		mov	[bp+var_21D], ax
		mov	[bp+var_21F], ax
		mov	[bp+var_221], 47Ch
		push	100h
		push	0
		lea	ax, [bp+var_21B]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_22F], 0
		mov	[bp+var_224], 0
		mov	[bp+var_244], 20h
		mov	[bp+var_216], 0FFh
		mov	ax, [bp+var_1A]
		mov	[bp+var_223], ax
		push	1
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_870B
		add	sp, 4
		mov	al, byte_49538
		mov	ah, 0
		or	ax, ax
		jnz	short loc_590C8
		mov	al, [bp+var_216]
		mov	ah, 0
		push	ax
		call	sub_2D974
		add	sp, 2

loc_590C8:
		mov	al, byte ptr [bp+var_E]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8657
		add	sp, 4
		push	ax
		lea	ax, [bp+var_1AA]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, byte ptr [bp+var_E+1]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8657
		add	sp, 4
		push	ax
		lea	ax, [bp+var_182]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		mov	al, [bp+var_6]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8657
		add	sp, 4
		push	ax
		lea	ax, [bp+var_6A]
		push	ax
		call	CRT_Strcpy
		add	sp, 4
		jmp	loc_595AC

loc_59127:
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_85BE
		add	sp, 2
		push	0Ch
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8543
		add	sp, 4
		mov	bx, [bp+arg_0]
		cmp	byte ptr [bx+0FDh], 14h
		jnz	short loc_5916D
		push	14h
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8543
		add	sp, 4
		push	7Dh
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_85CD
		add	sp, 4
		jmp	short loc_5917C

loc_5916D:
		push	0Bh
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8543
		add	sp, 4

loc_5917C:
		mov	[bp+var_2], 0
		jmp	short loc_591F5

loc_59183:
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_42]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_591F2
		lea	ax, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8543
		add	sp, 4
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_42]
		add	bx, ax
		push	word ptr [bx]
		mov	ax, [bp+var_2]
		mov	dx, 28h
		imul	dx
		lea	dx, [bp+var_1AA]
		add	ax, dx
		push	ax
		push	9A7h
		lea	ax, [bp+var_35E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		lea	ax, [bp+var_35E]
		push	ax
		lea	ax, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_86A2
		add	sp, 6

loc_591F2:
		inc	[bp+var_2]

loc_591F5:
		cmp	[bp+var_2], 9
		jl	short loc_59183
		mov	[bp+var_2], 0
		jmp	loc_59326

loc_59203:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+274h], 0FFh
		jnz	short loc_59217
		jmp	loc_59323

loc_59217:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+275h]
		mov	[bp+var_1C], al
		cmp	[bp+var_1C], 3
		jbe	short loc_59232
		mov	[bp+var_1C], 3

loc_59232:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		mov	dx, 0Ch
		imul	dx
		mov	dx, [bp+var_2]
		shl	dx, 1
		add	dx, [bp+var_2]
		add	al, dl
		add	al, [bp+var_1C]
		mov	[bp+var_1B], al
		mov	al, [bp+var_1B]
		mov	ah, 0
		lea	dx, [bp+var_214]
		add	ax, dx
		mov	bx, ax
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_85CD
		add	sp, 4
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_30]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		shl	ax, 1
		mov	bx, ax
		push	word ptr [bx+202h]
		push	9AFh
		lea	ax, [bp+var_35E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_16]
		add	bx, ax
		mov	al, [bx]
		mov	[bp+var_1D], al
		mov	bx, [bp+var_2]
		shl	bx, 1
		lea	ax, [bp+var_15]
		add	bx, ax
		mov	al, [bx]
		mov	[bp+var_1E], al
		mov	al, [bp+var_1D]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8543
		add	sp, 4
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_8543
		add	sp, 4
		lea	ax, [bp+var_35E]
		push	ax
		mov	al, [bp+var_1D]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_86A2
		add	sp, 6
		lea	ax, [bp+var_35E]
		push	ax
		mov	al, [bp+var_1E]
		push	ax
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_86A2
		add	sp, 6

loc_59323:
		inc	[bp+var_2]

loc_59326:
		cmp	[bp+var_2], 4
		jge	short loc_5932F
		jmp	loc_59203

loc_5932F:
		lea	ax, [bp+var_32C]
		push	ax
		call	sub_9243
		add	sp, 2
		mov	[bp+var_17], al
		mov	[bp+var_4], 0FFh
		mov	[bp+var_1B], 0
		mov	[bp+var_1C], 0
		mov	[bp+var_2], 0
		jmp	short loc_59370

loc_59352:
		lea	ax, [bp+var_E]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		cmp	al, [bp+var_17]
		jnz	short loc_5936D
		mov	al, byte ptr [bp+var_2]
		mov	[bp+var_4], al
		mov	[bp+var_1B], 1
		jmp	short loc_59376

loc_5936D:
		inc	[bp+var_2]

loc_59370:
		cmp	[bp+var_2], 9
		jl	short loc_59352

loc_59376:
		mov	[bp+var_2], 0
		jmp	short loc_593AF

loc_5937D:
		lea	ax, [bp+var_16]
		mov	bx, [bp+var_2]
		add	bx, ax
		mov	al, [bx]
		cmp	al, [bp+var_17]
		jnz	short loc_593AC
		mov	ax, [bp+var_2]
		cwd
		sub	ax, dx
		sar	ax, 1
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	[bp+var_4], al
		mov	[bp+var_1B], 1
		mov	[bp+var_1C], 1
		jmp	short loc_593B5

loc_593AC:
		inc	[bp+var_2]

loc_593AF:
		cmp	[bp+var_2], 8
		jl	short loc_5937D

loc_593B5:
		mov	al, [bp+var_1B]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_593C1
		jmp	loc_595BB

loc_593C1:
		cmp	[bp+var_254], 0
		jnz	short loc_593D1
		cmp	[bp+var_1C], 0
		jnz	short loc_593D1
		jmp	loc_59462

loc_593D1:
		mov	[bp+var_2], 3
		jmp	short loc_59456

loc_593D8:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		cmp	al, [bp+var_4]
		jnz	short loc_59453
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		dec	byte ptr [bx+275h]
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_42]
		add	ax, dx
		mov	bx, ax
		add	word ptr [bx], 2
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_30]
		add	ax, dx
		mov	bx, ax
		sub	word ptr [bx], 2
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+275h], 0
		jnz	short loc_59451
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	byte ptr [bx+274h], 0FFh

loc_59451:
		jmp	short loc_5945F

loc_59453:
		dec	[bp+var_2]

loc_59456:
		cmp	[bp+var_2], 0
		jl	short loc_5945F
		jmp	loc_593D8

loc_5945F:
		jmp	loc_595AC

loc_59462:
		cmp	[bp+var_4], 0
		jz	short loc_5946E
		cmp	[bp+var_4], 1
		jnz	short loc_5947A

loc_5946E:
		mov	[bp+var_1D], 0
		mov	cl, 0
		mov	[bp+var_1E], 1
		jmp	short loc_594D2

loc_5947A:
		cmp	[bp+var_4], 6
		jnz	short loc_5948C
		mov	[bp+var_1D], 0
		mov	cl, 0FFh
		mov	[bp+var_1E], 0
		jmp	short loc_594D2

loc_5948C:
		cmp	[bp+var_4], 8
		jnz	short loc_5949E
		mov	[bp+var_1D], 1
		mov	cl, 1
		mov	[bp+var_1E], 1
		jmp	short loc_594D2

loc_5949E:
		cmp	[bp+var_4], 5
		jz	short loc_594AA
		cmp	[bp+var_4], 4
		jnz	short loc_594B6

loc_594AA:
		mov	[bp+var_1D], 0
		mov	cl, 0FFh
		mov	[bp+var_1E], 0
		jmp	short loc_594D2

loc_594B6:
		cmp	[bp+var_4], 7
		jnz	short loc_594C8
		mov	[bp+var_1D], 0
		mov	cl, 0FFh
		mov	[bp+var_1E], 0
		jmp	short loc_594D2

loc_594C8:
		mov	[bp+var_1D], 0
		mov	cl, 0FFh
		mov	[bp+var_1E], 0

loc_594D2:
		mov	al, [bp+var_1D]
		mov	ah, 0
		mov	[bp+var_2], ax
		jmp	loc_595A0

loc_594DD:
		mov	al, [bp+var_4]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_42]
		add	ax, dx
		mov	bx, ax
		cmp	word ptr [bx], 1
		ja	short loc_594F3
		jmp	loc_5959D

loc_594F3:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+274h], 0FFh
		jz	short loc_59544
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		cmp	al, [bp+var_4]
		jz	short loc_5951A
		jmp	loc_5959D

loc_5951A:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+275h]
		cmp	al, [bp+var_1E]
		jnb	short loc_5959D
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		cmp	byte ptr [bx+274h], 8
		jnz	short loc_59544
		cmp	[bp+var_2], 1
		jz	short loc_5959D

loc_59544:
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bp+var_4]
		mov	[bx+274h], al
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		inc	byte ptr [bx+275h]
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_42]
		add	ax, dx
		mov	bx, ax
		sub	word ptr [bx], 2
		mov	ax, [bp+var_2]
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		mov	al, [bx+274h]
		mov	ah, 0
		shl	ax, 1
		lea	dx, [bp+var_30]
		add	ax, dx
		mov	bx, ax
		add	word ptr [bx], 2
		jmp	short loc_595AC

loc_5959D:
		inc	[bp+var_2]

loc_595A0:
		mov	al, cl
		mov	ah, 0
		cmp	ax, [bp+var_2]
		jl	short loc_595AC
		jmp	loc_594DD

loc_595AC:
		cmp	[bp+var_17], 0Bh
		jz	short loc_595BB
		cmp	[bp+var_17], 0Ch
		jz	short loc_595BB
		jmp	loc_59127

loc_595BB:
		cmp	[bp+var_17], 0Ch
		jnz	short loc_595DA
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx+6], 1
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx+0E9h], 1
		mov	bx, [bp+arg_0]
		mov	byte ptr [bx+0EFh], 1
		jmp	short loc_595E8

loc_595DA:
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4

loc_595E8:
		cmp	[bp+var_17], 0Ch
		jz	short loc_595F1
		jmp	loc_5969E

loc_595F1:
		lea	ax, [bp+var_21B]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_221]
		push	ax
		call	sub_6EDA
		add	sp, 4
		mov	[bp+var_284], 44Ch
		mov	[bp+var_27A], 46Ch
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	byte_4F77A, 0
		cmp	[bp+var_257], 0
		jz	short loc_59648
		mov	ax, [bp+var_257]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	[bp+var_257]
		call	sub_39C
		add	sp, 2
		jmp	short loc_59648

loc_59648:
		push	2
		lea	ax, [bp+var_24A]
		push	ax
		call	sub_77A1
		add	sp, 4
		lea	ax, [bp+var_265]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_284]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		mov	[bp+var_32C], 498h
		lea	ax, [bp+var_32C]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_32C]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	al, 1
		pop	di
		pop	si
		leave
		retf
		jmp	loc_59748

loc_5969E:
		lea	ax, [bp+var_21B]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_221]
		push	ax
		call	sub_6EDA
		add	sp, 4
		mov	[bp+var_284], 44Ch
		mov	[bp+var_27A], 46Ch
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	byte_4F77A, 0
		cmp	[bp+var_257], 0
		jz	short loc_596F5
		mov	ax, [bp+var_257]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	[bp+var_257]
		call	sub_39C
		add	sp, 2
		jmp	short loc_596F5

loc_596F5:
		push	2
		lea	ax, [bp+var_24A]
		push	ax
		call	sub_77A1
		add	sp, 4
		lea	ax, [bp+var_265]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_284]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		mov	[bp+var_32C], 498h
		lea	ax, [bp+var_32C]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_32C]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		mov	al, 0
		pop	di
		pop	si
		leave
		retf
Gameflow_WeaponLoadoutAlt_58DEB		endp

; START OF FUNCTION CHUNK FOR Gameflow_WeaponLoadoutAlt_58DEB

loc_59748:
		pop	di
		pop	si
		leave
		retf
; END OF FUNCTION CHUNK FOR Gameflow_WeaponLoadoutAlt_58DEB

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5974C		proc far

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= byte ptr  0Ah
arg_6		= byte ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	[bp+var_1], 0
		mov	[bp+var_2], 0
		mov	ax, [bp+arg_2]
		add	ax, 0C7h
		mov	[bp+var_8], ax
		push	[bp+var_8]
		lea	ax, [bp+var_6]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	0
		push	0
		push	0
		push	[bp+arg_8]
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	di, ax
		cmp	[bp+arg_4], 0
		jz	short loc_59797
		mov	word ptr [di+1Bh], 5

loc_59797:
		mov	al, [bp+arg_6]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 8
		ja	short loc_5980D
		shl	bx, 1
		jmp	cs:off_599AC[bx]	; switch jump

loc_597AB:
		mov	[bp+var_1], 4Fh
		mov	[bp+var_2], 4Bh
		jmp	short loc_5980D

loc_597B5:
		cmp	[bp+arg_4], 0
		jz	short loc_597C5
		mov	[bp+var_1], 52h
		mov	[bp+var_2], 4Fh
		jmp	short loc_597CD

loc_597C5:
		mov	[bp+var_1], 49h
		mov	[bp+var_2], 4Dh

loc_597CD:
		jmp	short loc_5980D

loc_597CF:
		cmp	[bp+arg_4], 0
		jz	short loc_597DF
		mov	[bp+var_1], 54h
		mov	[bp+var_2], 52h
		jmp	short loc_597E7

loc_597DF:
		mov	[bp+var_1], 4Dh
		mov	[bp+var_2], 51h

loc_597E7:
		jmp	short loc_5980D

loc_597E9:
		cmp	[bp+arg_4], 0
		jz	short loc_597F9
		mov	[bp+var_1], 56h
		mov	[bp+var_2], 54h
		jmp	short loc_59801

loc_597F9:
		mov	[bp+var_1], 51h
		mov	[bp+var_2], 53h

loc_59801:
		jmp	short loc_5980D

loc_59803:
		mov	[bp+var_1], 53h
		mov	[bp+var_2], 55h
		jmp	short loc_5980D

loc_5980D:
		mov	al, [bp+var_1]
		push	ax
		push	[bp+arg_2]
		call	sub_8543
		add	sp, 4
		mov	al, [bp+var_2]
		push	ax
		push	[bp+arg_2]
		call	sub_8560
		add	sp, 4
		mov	[bp+var_A], 0
		jmp	short loc_59856

loc_59832:
		mov	bx, [bp+var_A]
		mov	al, [bx+6]
		cmp	al, [bp+var_1]
		jnz	short loc_59844
		mov	bx, [bp+var_A]
		mov	byte ptr [bx+7], 1

loc_59844:
		mov	bx, [bp+var_A]
		mov	al, [bx+6]
		cmp	al, [bp+var_2]
		jnz	short loc_59856
		mov	bx, [bp+var_A]
		mov	byte ptr [bx+7], 0

loc_59856:
		lea	ax, [bp+var_A]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 0E2h
		push	ax
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_59832
		call	TextScrollDisplayB_ApplyHelperD_4555C
		jmp	loc_59966

loc_59875:
		mov	[bp+var_A], 0
		jmp	short loc_59894

loc_5987C:
		push	0
		push	0
		mov	bx, [bp+var_A]
		push	word ptr [bx+6]
		mov	bx, [bp+var_A]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_59894:
		lea	ax, [bp+var_A]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 0ACh
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_5987C
		mov	[bp+var_C], 0
		jmp	short loc_598F9

loc_598B2:
		mov	bx, [bp+var_C]
		cmp	byte ptr [bx+7], 0
		jz	short loc_598F9
		mov	bx, [bp+var_C]
		cmp	word ptr [bx+4], 0
		jz	short loc_598DC
		push	0
		push	0
		mov	bx, [bp+var_C]
		push	word ptr [bx+4]
		mov	bx, [bp+var_C]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_598DC:
		mov	bx, [bp+var_C]
		cmp	word ptr [bx+4], 0
		jz	short loc_598F9
		mov	bx, [bp+var_C]
		push	word ptr [bx+4]
		mov	bx, [bp+var_C]
		mov	bx, [bx+4]
		mov	bx, [bx]
		call	dword ptr [bx+1Ch]
		add	sp, 2

loc_598F9:
		lea	ax, [bp+var_C]
		push	ax
		mov	ax, [bp+arg_2]
		add	ax, 0E2h
		push	ax
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_598B2
		push	0
		push	0
		push	di
		mov	bx, [di]
		call	dword ptr [bx+10h]
		add	sp, 6
		push	word_4D36C
		mov	bx, [bp+arg_2]
		push	word ptr [bx+0BBh]
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		cmp	[bp+arg_4], 0
		jz	short loc_59945
		mov	ax, [di+1Bh]
		dec	ax
		mov	[bp+var_E], ax
		mov	ax, [bp+var_E]
		mov	[di+1Bh], ax
		jmp	short loc_59952

loc_59945:
		mov	ax, [di+1Bh]
		inc	ax
		mov	[bp+var_10], ax
		mov	ax, [bp+var_10]
		mov	[di+1Bh], ax

loc_59952:
		mov	ax, [bp+arg_2]
		add	ax, 0A8h
		push	ax
		mov	bx, [bp+arg_2]
		mov	bx, [bx+0A8h]
		call	dword ptr [bx+1Ch]
		add	sp, 2

loc_59966:
		cmp	[bp+arg_4], 0
		jz	short loc_59975
		cmp	word ptr [di+1Bh], 0
		jz	short loc_59975
		jmp	loc_59875

loc_59975:
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_59987
		cmp	word ptr [di+1Bh], 5
		jz	short loc_59987
		jmp	loc_59875

loc_59987:
		call	TextScrollDisplayB_ApplyHelperC_45522
		or	di, di
		jz	short loc_5999C
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_5999C

loc_5999C:
		lea	ax, [bp+var_6]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2
		pop	di
		pop	si
		leave
		retf
sub_5974C		endp

; START OF FUNCTION CHUNK FOR sub_5974C
off_599AC	dw offset loc_597AB
		dw offset loc_5980D
		dw offset loc_597B5
		dw offset loc_5980D
		dw offset loc_597CF
		dw offset loc_5980D
		dw offset loc_597E9
		dw offset loc_5980D
		dw offset loc_59803
; END OF FUNCTION CHUNK FOR sub_5974C

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_599BE		proc far

var_340		= word ptr -340h
var_326		= word ptr -326h
var_30C		= word ptr -30Ch
var_2F2		= word ptr -2F2h
var_2F0		= word ptr -2F0h
var_2DC		= byte ptr -2DCh
var_2D8		= word ptr -2D8h
var_2C0		= word ptr -2C0h
var_263		= dword ptr -263h
var_25F		= dword ptr -25Fh
var_25B		= dword ptr -25Bh
var_246		= word ptr -246h
var_244		= word ptr -244h
var_218		= word ptr -218h
var_20E		= word ptr -20Eh
var_1F9		= word ptr -1F9h
var_1EB		= word ptr -1EBh
var_1E8		= byte ptr -1E8h
var_1E6		= byte ptr -1E6h
var_1DE		= word ptr -1DEh
var_1D8		= byte ptr -1D8h
var_1C3		= byte ptr -1C3h
var_1B8		= byte ptr -1B8h
var_1B7		= word ptr -1B7h
var_1B5		= word ptr -1B5h
var_1B3		= word ptr -1B3h
var_1B1		= word ptr -1B1h
var_1AF		= word ptr -1AFh
var_1AA		= byte ptr -1AAh
var_1A8		= word ptr -1A8h
var_130		= word ptr -130h
var_E0		= word ptr -0E0h
var_D6		= word ptr -0D6h
var_CC		= word ptr -0CCh
var_C2		= word ptr -0C2h
var_C1		= dword ptr -0C1h
var_BD		= word ptr -0BDh
var_BB		= word ptr -0BBh
var_B9		= byte ptr -0B9h
var_B8		= dword ptr -0B8h
var_B0		= byte ptr -0B0h
var_AF		= dword ptr -0AFh
var_A7		= byte ptr -0A7h
var_A6		= dword ptr -0A6h
var_9E		= byte ptr -9Eh
var_9D		= dword ptr -9Dh
var_95		= byte ptr -95h
var_94		= dword ptr -94h
var_8C		= byte ptr -8Ch
var_8B		= dword ptr -8Bh
var_83		= byte ptr -83h
var_82		= dword ptr -82h
var_7A		= byte ptr -7Ah
var_79		= dword ptr -79h
var_68		= byte ptr -68h
var_67		= dword ptr -67h
var_5F		= byte ptr -5Fh
var_5E		= dword ptr -5Eh
var_56		= byte ptr -56h
var_55		= dword ptr -55h
var_4D		= byte ptr -4Dh
var_4C		= dword ptr -4Ch
var_44		= word ptr -44h
var_42		= dword ptr -42h
var_3E		= byte ptr -3Eh
var_3D		= byte ptr -3Dh
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_33		= byte ptr -33h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_17		= byte ptr -17h
var_16		= word ptr -16h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 340h
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	[bp+var_A], 0
		mov	[bp+var_6], 2
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		mov	eax, [si+27Ch]
		sub	eax, [si+284h]
		mov	[bp+var_E], eax
		mov	[bp+var_12], 0
		mov	[bp+var_13], 0
		push	seg stub192
		push	offset sub_479EA
		push	1
		push	0Eh
		push	9
		lea	ax, [bp+var_C2]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		mov	[bp+var_16], 0
		jmp	short loc_59A4B

loc_59A2A:
		mov	ax, [bp+var_16]
		mov	dx, 9
		imul	dx
		lea	dx, word ptr [bp+var_C1]
		add	ax, dx
		mov	bx, [bp+var_16]
		shl	bx, 2
		mov	edx, [bx+250h]
		mov	bx, ax
		mov	[bx], edx
		inc	[bp+var_16]

loc_59A4B:
		cmp	[bp+var_16], 0Eh
		jl	short loc_59A2A
		push	seg stub192
		push	offset sub_479E5
		push	1
		push	3
		push	0Ah
		lea	ax, [bp+var_E0]
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		lea	ax, [bp+var_1A8]
		push	ax
		call	IndexedRecordReader_ConstructVariantA_4331C
		add	sp, 2
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_130]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	1
		lea	ax, [bp+var_130]
		push	ax
		lea	ax, [bp+var_1A8]
		push	ax
		mov	bx, [bp+var_1A8]
		call	dword ptr [bx+14h]
		add	sp, 6
		push	2
		lea	ax, [bp+var_E0]
		push	ax
		push	9Bh
		lea	ax, [bp+var_1A8]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	2
		lea	ax, [bp+var_D6]
		push	ax
		push	9Ch
		lea	ax, [bp+var_1A8]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	2
		lea	ax, [bp+var_CC]
		push	ax
		push	9Dh
		lea	ax, [bp+var_1A8]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		push	3
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	9Ah
		lea	ax, [bp+var_1A8]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_1A8]
		push	ax
		call	sub_4123E
		add	sp, 2
		cmp	[bp+arg_2], 1
		jnz	short loc_59B49
		xor	cx, cx
		jmp	short loc_59B44

loc_59B18:
		mov	ax, cx
		mov	dx, 9
		imul	dx
		lea	dx, word ptr [bp+var_C1]
		add	ax, dx
		mov	bx, ax
		mov	eax, [bx]
		shl	eax, 1
		push	eax
		mov	ax, cx
		mov	dx, 9
		imul	dx
		lea	dx, word ptr [bp+var_C1]
		add	ax, dx
		mov	bx, ax
		pop	eax
		mov	[bx], eax
		inc	cx

loc_59B44:
		cmp	cx, 0Eh
		jl	short loc_59B18

loc_59B49:
		mov	[bp+var_17], 1
		mov	ax, [si+0E5h]
		mov	[bp+var_1A], ax
		lea	ax, [bp+var_2C0]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_2C0], 480h
		mov	[bp+var_25F], 100h
		mov	[bp+var_263], 0
		mov	[bp+var_2C0], 498h
		mov	[bp+var_244], 0
		xor	ax, ax
		mov	[bp+var_246], ax
		movsx	eax, ax
		mov	[bp+var_25B], eax
		push	[bp+var_1A]
		push	word_4D36E
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_218]
		push	ax
		call	sub_7A04
		add	sp, 0Ah
		mov	[bp+var_2C0], 4B0h
		mov	[bp+var_218], 4C8h
		mov	[bp+var_20E], 4E8h
		mov	[bp+var_1B5], 1E4h
		xor	ax, ax
		mov	[bp+var_1B1], ax
		mov	[bp+var_1B3], ax
		mov	[bp+var_1B5], 47Ch
		push	100h
		push	0
		lea	ax, [bp+var_1AF]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_1C3], 0
		mov	[bp+var_1B8], 0
		mov	[bp+var_1D8], 1Eh
		mov	[bp+var_1AA], 0FFh
		mov	ax, [bp+var_1A]
		mov	[bp+var_1B7], ax
		lea	ax, [bp+var_2C0]
		mov	[bp+var_1C], ax
		push	0
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_870B
		add	sp, 4
		push	ds
		push	offset aShp
		push	ds
		push	offset aCalcfont
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_130]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_130]
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
		lea	ax, [bp+var_2D8]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		lea	ax, [bp+var_2D8]
		mov	[bp+var_2C], ax
		push	0Bh
		push	[bp+var_2C]
		mov	bx, [bp+var_2C]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+10h], 1
		mov	bx, [bp+var_2C]
		mov	word ptr [bx+12h], 0
		push	2Dh
		push	[bp+var_2C]
		mov	bx, [bp+var_2C]
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, [bp+var_2C]
		mov	[bx+14h], ax
		push	[bp+var_2C]
		lea	ax, [bp+var_1F9]
		push	ax
		lea	ax, [bp+var_2F2]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		mov	[bp+var_2DC], 4
		push	0
		push	0
		lea	ax, [bp+var_2F2]
		push	ax
		push	0
		call	TextLayer_Construct_F542
		add	sp, 8
		mov	[bp+var_2E], ax
		push	0
		push	0
		lea	ax, [bp+var_2F2]
		push	ax
		push	0
		call	TextLayer_Construct_F542
		add	sp, 8
		mov	[bp+var_30], ax
		push	0
		push	0
		lea	ax, [bp+var_2F2]
		push	ax
		push	0
		call	TextLayer_Construct_F542
		add	sp, 8
		mov	[bp+var_32], ax
		push	[bp+var_2E]
		lea	ax, [bp+var_218]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_30]
		lea	ax, [bp+var_218]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		push	[bp+var_32]
		lea	ax, [bp+var_218]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	al, [si+0FDh]
		mov	[bp+var_33], al
		mov	al, [bp+var_33]
		mov	[bp+var_1E6], al
		jmp	loc_5A79D

loc_59D49:
		xor	di, di
		jmp	loc_59EF7

loc_59D4E:
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		cmp	byte ptr [bx], 0
		jge	short loc_59D74
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 0

loc_59D74:
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		cmp	byte ptr [bx], 63h
		jle	short loc_59D9A
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		mov	byte ptr [bx], 63h

loc_59D9A:
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		cmp	byte ptr [bx], 0
		jnz	short loc_59DB1
		jmp	loc_59EF6

loc_59DB1:
		mov	al, [di+234h]
		push	ax
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		mov	[bp+var_44], 0
		jmp	loc_59EDE

loc_59DCB:
		mov	bx, [bp+var_44]
		mov	al, [bx+6]
		cmp	al, [di+234h]
		jz	short loc_59DDA
		jmp	loc_59EDE

loc_59DDA:
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		cmp	byte ptr [bx], 9
		jle	short loc_59E65
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		mov	al, [bx]
		cbw
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	ax
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+2A4h]
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+288h]
		mov	al, [di+242h]
		mov	ah, 0
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_E0]
		add	ax, dx
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		push	ax
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		pop	ax
		mov	[bx], ax
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_44]
		push	word ptr [bx+4]
		call	LayerGroup_Add_33BD0
		add	sp, 4

loc_59E65:
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_C2]
		add	ax, dx
		mov	bx, ax
		mov	al, [bx]
		cbw
		mov	bx, 0Ah
		cwd
		idiv	bx
		push	dx
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+2DCh]
		mov	bx, di
		shl	bx, 1
		push	word ptr [bx+2C0h]
		mov	al, [di+242h]
		mov	ah, 0
		mov	dx, 0Ah
		imul	dx
		lea	dx, [bp+var_E0]
		add	ax, dx
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		push	ax
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		pop	ax
		mov	[bx], ax
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_44]
		push	word ptr [bx+4]
		call	LayerGroup_Add_33BD0
		add	sp, 4
		jmp	short loc_59EF6

loc_59EDE:
		lea	ax, [bp+var_44]
		push	ax
		lea	ax, [bp+var_1DE]
		push	ax
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jz	short loc_59EF6
		jmp	loc_59DCB

loc_59EF6:
		inc	di

loc_59EF7:
		cmp	di, 0Eh
		jge	short loc_59EFF
		jmp	loc_59D4E

loc_59EFF:
		cmp	byte ptr [si+0FDh], 0Dh
		jnz	short loc_59F17
		push	0Dh
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		jmp	short loc_59F26

loc_59F17:
		push	1Dh
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4

loc_59F26:
		cmp	[bp+var_17], 1
		jz	short loc_59F3B
		push	57h
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4

loc_59F3B:
		cmp	[bp+var_17], 9
		jz	short loc_59F50
		push	58h
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4

loc_59F50:
		mov	al, [bp+var_17]
		mov	ah, 0
		dec	ax
		mov	bx, ax
		cmp	bx, 8
		jbe	short loc_59F60
		jmp	loc_5A044

loc_59F60:
		shl	bx, 1
		jmp	cs:off_5A9D0[bx]	; switch jump

loc_59F67:
		push	49h
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		push	4Ah
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		push	4Bh
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		push	4Ch
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		jmp	loc_5A044

loc_59FA6:
		push	4Dh
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		push	4Eh
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		push	4Fh
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		push	50h
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		jmp	short loc_5A044

loc_59FE4:
		push	51h
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		push	52h
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		jmp	short loc_5A044

loc_5A004:
		push	53h
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		push	54h
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		jmp	short loc_5A044

loc_5A024:
		push	55h
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		push	56h
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_8543
		add	sp, 4
		jmp	short loc_5A044

loc_5A044:
		push	0Ah
		lea	ax, [bp+var_30C]
		push	ax
		push	large [bp+var_E]
		call	CRT_Itoa_BaseVariant
		add	sp, 8
		push	0Ah
		lea	ax, [bp+var_326]
		push	ax
		push	large [bp+var_12]
		call	CRT_Itoa_BaseVariant
		add	sp, 8
		push	0Ah
		lea	ax, [bp+var_340]
		push	ax
		mov	eax, [bp+var_E]
		sub	eax, [bp+var_12]
		push	eax
		call	CRT_Itoa_BaseVariant
		add	sp, 8
		cmp	[bp+var_E], 0
		jz	short loc_5A09A
		push	9C7h
		lea	ax, [bp+var_30C]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_5A09A:
		cmp	[bp+var_12], 0
		jz	short loc_5A0B1
		push	9CBh
		lea	ax, [bp+var_326]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_5A0B1:
		mov	eax, [bp+var_E]
		sub	eax, [bp+var_12]
		jz	short loc_5A0CB
		push	9CFh
		lea	ax, [bp+var_340]
		push	ax
		call	CRT_Strcat
		add	sp, 4

loc_5A0CB:
		lea	ax, [bp+var_30C]
		push	ax
		lea	ax, [bp+var_2F2]
		push	ax
		call	sub_375EF
		add	sp, 4
		mov	[bp+var_36], ax
		mov	ax, 127h
		sub	ax, [bp+var_36]
		mov	[bp+var_38], ax
		mov	bx, [bp+var_2E]
		mov	ax, [bp+var_38]
		mov	[bx+0Ch], ax
		mov	bx, [bp+var_2E]
		mov	word ptr [bx+0Eh], 23h
		lea	ax, [bp+var_30C]
		push	ax
		push	[bp+var_2E]
		call	TextLayer_SetText_F608
		add	sp, 4
		lea	ax, [bp+var_326]
		push	ax
		lea	ax, [bp+var_2F2]
		push	ax
		call	sub_375EF
		add	sp, 4
		mov	[bp+var_36], ax
		mov	ax, 127h
		sub	ax, [bp+var_36]
		mov	[bp+var_3A], ax
		mov	bx, [bp+var_30]
		mov	ax, [bp+var_3A]
		mov	[bx+0Ch], ax
		mov	bx, [bp+var_30]
		mov	word ptr [bx+0Eh], 29h
		lea	ax, [bp+var_326]
		push	ax
		push	[bp+var_30]
		call	TextLayer_SetText_F608
		add	sp, 4
		lea	ax, [bp+var_340]
		push	ax
		lea	ax, [bp+var_2F2]
		push	ax
		call	sub_375EF
		add	sp, 4
		mov	[bp+var_36], ax
		mov	ax, 127h
		sub	ax, [bp+var_36]
		mov	[bp+var_3C], ax
		mov	bx, [bp+var_32]
		mov	ax, [bp+var_3C]
		mov	[bx+0Ch], ax
		mov	bx, [bp+var_32]
		mov	word ptr [bx+0Eh], 2Fh
		lea	ax, [bp+var_340]
		push	ax
		push	[bp+var_32]
		call	TextLayer_SetText_F608
		add	sp, 4
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_9243
		add	sp, 2
		mov	[bp+var_3D], al
		mov	al, [bp+var_1E8]
		mov	[bp+var_3E], al
		mov	eax, [bp+var_E]
		sub	eax, [bp+var_12]
		add	eax, 3E8h
		mov	[bp+var_42], eax
		mov	al, [bp+var_3D]
		mov	ah, 0
		sub	ax, 0Dh
		mov	bx, ax
		cmp	bx, 59h
		jbe	short loc_5A1C3
		jmp	loc_5A64A

loc_5A1C3:
		shl	bx, 1
		jmp	cs:off_5A91C[bx]	; switch jump

loc_5A1CA:
		mov	[bp+var_13], 1
		jmp	loc_5A64A

loc_5A1D1:
		mov	[bp+var_13], 1
		jmp	loc_5A64A

loc_5A1D8:
		cmp	[bp+var_3E], 0
		jz	short loc_5A1F8
		cmp	byte ptr [bp+var_C2], 0
		jz	short loc_5A1F6
		dec	byte ptr [bp+var_C2]
		mov	eax, [bp+var_C1]
		sub	[bp+var_12], eax
		dec	word ptr [si+262h]

loc_5A1F6:
		jmp	short loc_5A214

loc_5A1F8:
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_C1]
		jl	short loc_5A214
		inc	byte ptr [bp+var_C2]
		mov	eax, [bp+var_C1]
		add	[bp+var_12], eax
		inc	word ptr [si+262h]

loc_5A214:
		jmp	loc_5A64A

loc_5A217:
		cmp	[bp+var_3E], 0
		jz	short loc_5A237
		cmp	[bp+var_B9], 0
		jz	short loc_5A235
		dec	[bp+var_B9]
		mov	eax, [bp+var_B8]
		sub	[bp+var_12], eax
		dec	word ptr [si+264h]

loc_5A235:
		jmp	short loc_5A253

loc_5A237:
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_B8]
		jl	short loc_5A253
		inc	[bp+var_B9]
		mov	eax, [bp+var_B8]
		add	[bp+var_12], eax
		inc	word ptr [si+264h]

loc_5A253:
		jmp	loc_5A64A

loc_5A256:
		cmp	[bp+var_3E], 0
		jz	short loc_5A276
		cmp	[bp+var_B0], 0
		jz	short loc_5A274
		dec	[bp+var_B0]
		mov	eax, [bp+var_AF]
		sub	[bp+var_12], eax
		dec	word ptr [si+272h]

loc_5A274:
		jmp	short loc_5A292

loc_5A276:
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_AF]
		jl	short loc_5A292
		inc	[bp+var_B0]
		mov	eax, [bp+var_AF]
		add	[bp+var_12], eax
		inc	word ptr [si+272h]

loc_5A292:
		jmp	loc_5A64A

loc_5A295:
		cmp	[bp+var_3E], 0
		jz	short loc_5A2B5
		cmp	[bp+var_9E], 0
		jz	short loc_5A2B3
		dec	[bp+var_9E]
		mov	eax, [bp+var_9D]
		sub	[bp+var_12], eax
		dec	word ptr [si+270h]

loc_5A2B3:
		jmp	short loc_5A2D1

loc_5A2B5:
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_9D]
		jl	short loc_5A2D1
		inc	[bp+var_9E]
		mov	eax, [bp+var_9D]
		add	[bp+var_12], eax
		inc	word ptr [si+270h]

loc_5A2D1:
		jmp	loc_5A64A

loc_5A2D4:
		cmp	[bp+var_3E], 0
		jz	short loc_5A2F4
		cmp	[bp+var_A7], 0
		jz	short loc_5A2F2
		dec	[bp+var_A7]
		mov	eax, [bp+var_A6]
		sub	[bp+var_12], eax
		dec	word ptr [si+266h]

loc_5A2F2:
		jmp	short loc_5A310

loc_5A2F4:
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_A6]
		jl	short loc_5A310
		inc	[bp+var_A7]
		mov	eax, [bp+var_A6]
		add	[bp+var_12], eax
		inc	word ptr [si+266h]

loc_5A310:
		jmp	loc_5A64A

loc_5A313:
		cmp	[bp+var_3E], 0
		jz	short loc_5A330
		cmp	[bp+var_7A], 0
		jz	short loc_5A32E
		dec	[bp+var_7A]
		mov	eax, [bp+var_79]
		sub	[bp+var_12], eax
		dec	word ptr [si+26Eh]

loc_5A32E:
		jmp	short loc_5A349

loc_5A330:
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_79]
		jl	short loc_5A349
		inc	[bp+var_7A]
		mov	eax, [bp+var_79]
		add	[bp+var_12], eax
		inc	word ptr [si+26Eh]

loc_5A349:
		jmp	loc_5A64A

loc_5A34C:
		cmp	[bp+var_3E], 0
		jz	short loc_5A36C
		cmp	[bp+var_95], 0
		jz	short loc_5A36A
		dec	[bp+var_95]
		mov	eax, [bp+var_94]
		sub	[bp+var_12], eax
		dec	word ptr [si+26Ah]

loc_5A36A:
		jmp	short loc_5A388

loc_5A36C:
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_94]
		jl	short loc_5A388
		inc	[bp+var_95]
		mov	eax, [bp+var_94]
		add	[bp+var_12], eax
		inc	word ptr [si+26Ah]

loc_5A388:
		jmp	loc_5A64A

loc_5A38B:
		cmp	[bp+var_3E], 0
		jz	short loc_5A3AB
		cmp	[bp+var_8C], 0
		jz	short loc_5A3A9
		dec	[bp+var_8C]
		mov	eax, [bp+var_8B]
		sub	[bp+var_12], eax
		dec	word ptr [si+26Ch]

loc_5A3A9:
		jmp	short loc_5A3C7

loc_5A3AB:
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_8B]
		jl	short loc_5A3C7
		inc	[bp+var_8C]
		mov	eax, [bp+var_8B]
		add	[bp+var_12], eax
		inc	word ptr [si+26Ch]

loc_5A3C7:
		jmp	loc_5A64A

loc_5A3CA:
		cmp	[bp+var_3E], 0
		jz	short loc_5A3EA
		cmp	[bp+var_83], 0
		jz	short loc_5A3E8
		dec	[bp+var_83]
		mov	eax, [bp+var_82]
		sub	[bp+var_12], eax
		dec	word ptr [si+268h]

loc_5A3E8:
		jmp	short loc_5A406

loc_5A3EA:
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_82]
		jl	short loc_5A406
		inc	[bp+var_83]
		mov	eax, [bp+var_82]
		add	[bp+var_12], eax
		inc	word ptr [si+268h]

loc_5A406:
		jmp	loc_5A64A

loc_5A409:
		cmp	[bp+var_3E], 0
		jz	short loc_5A42C
		cmp	[bp+var_68], 0
		jz	short loc_5A42A
		dec	[bp+var_68]
		mov	eax, [bp+var_67]
		sub	[bp+var_12], eax
		sub	word ptr [si+26Eh], 2
		sub	word ptr [si+26Ch], 18h

loc_5A42A:
		jmp	short loc_5A44B

loc_5A42C:
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_67]
		jl	short loc_5A44B
		inc	[bp+var_68]
		mov	eax, [bp+var_67]
		add	[bp+var_12], eax
		add	word ptr [si+26Eh], 2
		add	word ptr [si+26Ch], 18h

loc_5A44B:
		jmp	loc_5A64A

loc_5A44E:
		cmp	[bp+var_3E], 0
		jz	short loc_5A471
		cmp	[bp+var_5F], 0
		jz	short loc_5A46F
		dec	[bp+var_5F]
		mov	eax, [bp+var_5E]
		sub	[bp+var_12], eax
		sub	word ptr [si+262h], 6
		sub	word ptr [si+264h], 6

loc_5A46F:
		jmp	short loc_5A490

loc_5A471:
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_5E]
		jl	short loc_5A490
		inc	[bp+var_5F]
		mov	eax, [bp+var_5E]
		add	[bp+var_12], eax
		add	word ptr [si+262h], 6
		add	word ptr [si+264h], 6

loc_5A490:
		jmp	loc_5A64A

loc_5A493:
		cmp	[bp+var_3E], 0
		jz	short loc_5A4B1
		cmp	[bp+var_56], 0
		jz	short loc_5A4AF
		dec	[bp+var_56]
		mov	eax, [bp+var_55]
		sub	[bp+var_12], eax
		sub	word ptr [si+266h], 0Ah

loc_5A4AF:
		jmp	short loc_5A4CB

loc_5A4B1:
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_55]
		jl	short loc_5A4CB
		inc	[bp+var_56]
		mov	eax, [bp+var_55]
		add	[bp+var_12], eax
		add	word ptr [si+266h], 0Ah

loc_5A4CB:
		jmp	loc_5A64A

loc_5A4CE:
		cmp	[bp+var_3E], 0
		jz	short loc_5A4EC
		cmp	[bp+var_4D], 0
		jz	short loc_5A4EA
		dec	[bp+var_4D]
		mov	eax, [bp+var_4C]
		sub	[bp+var_12], eax
		sub	word ptr [si+262h], 0Ch

loc_5A4EA:
		jmp	short loc_5A506

loc_5A4EC:
		mov	eax, [bp+var_42]
		cmp	eax, [bp+var_4C]
		jl	short loc_5A506
		inc	[bp+var_4D]
		mov	eax, [bp+var_4C]
		add	[bp+var_12], eax
		add	word ptr [si+262h], 0Ch

loc_5A506:
		jmp	loc_5A64A

loc_5A509:
		lea	ax, word ptr [bp+var_A]
		push	ax
		mov	al, [bp+var_17]
		push	ax
		push	0
		push	[bp+var_1C]
		push	si
		push	cs
		call	near ptr sub_5974C
		add	sp, 0Ah
		mov	al, [bp+var_17]
		add	al, 0FEh
		mov	[bp+var_17], al
		jmp	loc_5A64A

loc_5A529:
		lea	ax, word ptr [bp+var_A]
		push	ax
		mov	al, [bp+var_17]
		push	ax
		push	1
		push	[bp+var_1C]
		push	si
		push	cs
		call	near ptr sub_5974C
		add	sp, 0Ah
		mov	al, [bp+var_17]
		add	al, 2
		mov	[bp+var_17], al
		jmp	loc_5A64A

loc_5A549:
		dec	byte ptr [bp+var_C2]
		mov	eax, [bp+var_C1]
		sub	[bp+var_12], eax
		dec	word ptr [si+262h]
		jmp	loc_5A64A

loc_5A55D:
		dec	[bp+var_B9]
		mov	eax, [bp+var_B8]
		sub	[bp+var_12], eax
		dec	word ptr [si+264h]
		jmp	loc_5A64A

loc_5A571:
		dec	[bp+var_B0]
		mov	eax, [bp+var_AF]
		sub	[bp+var_12], eax
		dec	word ptr [si+272h]
		jmp	loc_5A64A

loc_5A585:
		dec	[bp+var_A7]
		mov	eax, [bp+var_A6]
		sub	[bp+var_12], eax
		dec	word ptr [si+266h]
		jmp	loc_5A64A

loc_5A599:
		dec	[bp+var_9E]
		mov	eax, [bp+var_9D]
		sub	[bp+var_12], eax
		dec	word ptr [si+270h]
		jmp	loc_5A64A

loc_5A5AD:
		dec	[bp+var_95]
		mov	eax, [bp+var_94]
		sub	[bp+var_12], eax
		dec	word ptr [si+26Ah]
		jmp	loc_5A64A

loc_5A5C1:
		dec	[bp+var_8C]
		mov	eax, [bp+var_8B]
		sub	[bp+var_12], eax
		dec	word ptr [si+26Ch]
		jmp	short loc_5A64A

loc_5A5D4:
		dec	[bp+var_83]
		mov	eax, [bp+var_82]
		sub	[bp+var_12], eax
		dec	word ptr [si+268h]
		jmp	short loc_5A64A

loc_5A5E7:
		dec	[bp+var_7A]
		mov	eax, [bp+var_79]
		sub	[bp+var_12], eax
		dec	word ptr [si+26Eh]
		jmp	short loc_5A64A

loc_5A5F8:
		dec	[bp+var_68]
		mov	eax, [bp+var_67]
		sub	[bp+var_12], eax
		sub	word ptr [si+26Eh], 2
		sub	word ptr [si+26Ch], 18h
		jmp	short loc_5A64A

loc_5A60F:
		dec	[bp+var_5F]
		mov	eax, [bp+var_5E]
		sub	[bp+var_12], eax
		sub	word ptr [si+262h], 6
		sub	word ptr [si+264h], 6
		jmp	short loc_5A64A

loc_5A626:
		dec	[bp+var_56]
		mov	eax, [bp+var_55]
		sub	[bp+var_12], eax
		sub	word ptr [si+266h], 0Ah
		jmp	short loc_5A64A

loc_5A638:
		dec	[bp+var_4D]
		mov	eax, [bp+var_4C]
		sub	[bp+var_12], eax
		sub	word ptr [si+262h], 0Ch
		jmp	short loc_5A64A

loc_5A64A:
		xor	di, di
		jmp	loc_5A788

loc_5A64F:
		mov	[bp+var_44], 0
		jmp	short loc_5A664

loc_5A656:
		mov	bx, [bp+var_44]
		mov	al, [bx+6]
		cmp	al, [di+234h]
		jnz	short loc_5A664
		jmp	short loc_5A679

loc_5A664:
		lea	ax, [bp+var_44]
		push	ax
		lea	ax, [bp+var_1DE]
		push	ax
		call	LinkedList_Helper_36740
		add	sp, 4
		or	ax, ax
		jnz	short loc_5A656

loc_5A679:
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_5A700
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_44]
		push	word ptr [bx+4]
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_5A6ED
		push	3
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_5A6ED

loc_5A6ED:
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BD]
		add	ax, dx
		mov	bx, ax
		mov	word ptr [bx], 0

loc_5A700:
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_5A787
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	bx, [bp+var_44]
		push	word ptr [bx+4]
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_5A774
		push	3
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx]
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_5A774

loc_5A774:
		mov	ax, di
		mov	dx, 9
		imul	dx
		lea	dx, [bp+var_BB]
		add	ax, dx
		mov	bx, ax
		mov	word ptr [bx], 0

loc_5A787:
		inc	di

loc_5A788:
		cmp	di, 0Eh
		jge	short loc_5A790
		jmp	loc_5A64F

loc_5A790:
		lea	ax, [bp+var_2C0]
		push	ax
		call	sub_85BE
		add	sp, 2

loc_5A79D:
		mov	al, [bp+var_13]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5A7A9
		jmp	loc_59D49

loc_5A7A9:
		mov	eax, [bp+var_12]
		add	[si+284h], eax
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		lea	ax, [bp+var_2F0]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	2
		lea	ax, [bp+var_2D8]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_5A800
		cmp	[bp+var_26], 0
		jz	short loc_5A800
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5A800

loc_5A800:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		lea	ax, [bp+var_1AF]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_1B5]
		push	ax
		call	sub_6EDA
		add	sp, 4
		mov	[bp+var_218], 44Ch
		mov	[bp+var_20E], 46Ch
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	byte_4F77A, 0
		cmp	[bp+var_1EB], 0
		jz	short loc_5A86B
		mov	ax, [bp+var_1EB]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	[bp+var_1EB]
		call	sub_39C
		add	sp, 2
		jmp	short loc_5A86B

loc_5A86B:
		push	2
		lea	ax, [bp+var_1DE]
		push	ax
		call	sub_77A1
		add	sp, 4
		lea	ax, [bp+var_1F9]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_218]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		mov	[bp+var_2C0], 498h
		lea	ax, [bp+var_2C0]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_2C0]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		push	2
		lea	ax, [bp+var_1A8]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		push	seg stub192
		push	offset sub_479E0
		push	1
		push	3
		push	0Ah
		lea	ax, [bp+var_E0]
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		cmp	[bp+var_5], 0
		jz	short loc_5A904
		cmp	[bp+var_A], 0
		jz	short loc_5A904
		push	0
		mov	al, [bp+var_6]
		push	ax
		lea	ax, word ptr [bp+var_A]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5A904

loc_5A904:
		mov	[bp+var_A], 0
		mov	[bp+var_5], 0
		mov	[bp+var_4], 0
		pop	di
		pop	si
		leave
		retf
sub_599BE		endp

; START OF FUNCTION CHUNK FOR sub_599BE
off_5A91C	dw offset loc_5A1CA
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A1D1
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A64A
		dw offset loc_5A1D8
		dw offset loc_5A217
		dw offset loc_5A256
		dw offset loc_5A295
		dw offset loc_5A2D4
		dw offset loc_5A313
		dw offset loc_5A34C
		dw offset loc_5A38B
		dw offset loc_5A3CA
		dw offset loc_5A64A
		dw offset loc_5A409
		dw offset loc_5A44E
		dw offset loc_5A493
		dw offset loc_5A4CE
		dw offset loc_5A509
		dw offset loc_5A529
		dw offset loc_5A549
		dw offset loc_5A55D
		dw offset loc_5A571
		dw offset loc_5A585
		dw offset loc_5A599
		dw offset loc_5A5AD
		dw offset loc_5A5C1
		dw offset loc_5A5D4
		dw offset loc_5A5E7
		dw offset loc_5A64A
		dw offset loc_5A5F8
		dw offset loc_5A60F
		dw offset loc_5A626
		dw offset loc_5A638
off_5A9D0	dw offset loc_59F67
		dw offset loc_5A044
		dw offset loc_59FA6
		dw offset loc_5A044
		dw offset loc_59FE4
		dw offset loc_5A044
		dw offset loc_5A004
		dw offset loc_5A044
		dw offset loc_5A024
; END OF FUNCTION CHUNK FOR sub_599BE

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5A9E2		proc far

var_728		= word ptr -728h
var_726		= word ptr -726h
var_712		= byte ptr -712h
var_70E		= word ptr -70Eh
var_6B1		= dword ptr -6B1h
var_6AD		= dword ptr -6ADh
var_6A9		= dword ptr -6A9h
var_694		= word ptr -694h
var_692		= word ptr -692h
var_666		= word ptr -666h
var_662		= word ptr -662h
var_65C		= word ptr -65Ch
var_647		= word ptr -647h
var_639		= word ptr -639h
var_634		= byte ptr -634h
var_62C		= word ptr -62Ch
var_626		= byte ptr -626h
var_611		= byte ptr -611h
var_606		= byte ptr -606h
var_605		= word ptr -605h
var_603		= word ptr -603h
var_601		= word ptr -601h
var_5FF		= word ptr -5FFh
var_5FD		= word ptr -5FDh
var_5F8		= byte ptr -5F8h
var_5F6		= word ptr -5F6h
var_5F4		= word ptr -5F4h
var_5D6		= word ptr -5D6h
var_5C6		= word ptr -5C6h
var_54E		= word ptr -54Eh
var_53E		= word ptr -53Eh
var_53C		= word ptr -53Ch
var_53A		= word ptr -53Ah
var_536		= word ptr -536h
var_4E6		= word ptr -4E6h
var_4AA		= word ptr -4AAh
var_46E		= word ptr -46Eh
var_432		= word ptr -432h
var_3F6		= word ptr -3F6h
var_3BA		= word ptr -3BAh
var_37E		= byte ptr -37Eh
var_342		= byte ptr -342h
var_306		= word ptr -306h
var_2CA		= word ptr -2CAh
var_28E		= byte ptr -28Eh
var_252		= byte ptr -252h
var_216		= word ptr -216h
var_1DA		= word ptr -1DAh
var_19E		= word ptr -19Eh
var_162		= word ptr -162h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_2E		= byte ptr -2Eh
var_2D		= byte ptr -2Dh
var_2C		= word ptr -2Ch
var_29		= byte ptr -29h
var_28		= word ptr -28h
var_26		= dword ptr -26h
var_22		= byte ptr -22h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= byte ptr -14h
var_13		= byte ptr -13h
var_12		= dword ptr -12h
var_D		= byte ptr -0Dh
var_C		= byte ptr -0Ch
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 728h
		push	si
		push	di
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		mov	si, 986h
		lea	di, [bp+var_A]
		push	ss
		pop	es
		mov	cx, 5
		rep movsw
		mov	[bp+var_B], 2
		mov	[bp+var_C], 0
		mov	[bp+var_D], 0
		push	ds
		push	offset aShp
		push	ds
		push	offset aLedgfont
		push	ds
		push	offset aDataFonts
		lea	ax, [bp+var_536]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		push	2
		lea	ax, [bp+var_536]
		push	ax
		call	TextRenderer_LoadResourceFile_437A9
		add	sp, 4
		mov	word ptr [bp+var_1C+2], dx
		mov	word ptr [bp+var_1C], ax
		mov	eax, [bp+var_1C]
		mov	[bp+var_18], eax
		mov	[bp+var_14], 2
		mov	[bp+var_13], 1
		mov	[bp+var_12], 0
		lea	ax, word ptr [bp+var_18]
		push	ax
		lea	ax, [bp+var_54E]
		push	ax
		call	GlyphObject_ConstructWithBuffer_36D56
		add	sp, 4
		mov	[bp+var_53E], 1
		mov	[bp+var_53C], 0
		push	2Dh
		lea	ax, [bp+var_54E]
		push	ax
		mov	bx, [bp+var_54E]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	[bp+var_53A], ax
		push	ds
		push	offset aPak
		push	ds
		push	offset aOptshps
		push	ds
		push	offset aDataGameflow
		lea	ax, [bp+var_536]
		push	ax
		call	Path_Build_11125
		add	sp, 0Eh
		mov	[bp+var_26], 0
		mov	[bp+var_22], 2
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	1
		lea	ax, [bp+var_536]
		push	ax
		lea	ax, [bp+var_5C6]
		push	ax
		call	IndexedRecordReader_ConstructVariantB_4334C
		add	sp, 6
		push	3
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	29h
		lea	ax, [bp+var_5C6]
		push	ax
		call	Pak_LoadEntry_10D03
		add	sp, 8
		lea	ax, [bp+var_5C6]
		push	ax
		call	sub_4123E
		add	sp, 2
		push	0
		push	0
		push	0
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	0
		call	ImageLayer_Construct_34078
		add	sp, 0Ah
		mov	[bp+var_28], ax
		mov	[bp+var_29], 0
		mov	bx, [bp+arg_0]
		mov	ax, [bx+0E5h]
		mov	[bp+var_2C], ax
		lea	ax, [bp+var_70E]
		push	ax
		call	StreamReader_ConstructVariantA_40ED4
		add	sp, 2
		mov	[bp+var_70E], 480h
		mov	[bp+var_6AD], 100h
		mov	[bp+var_6B1], 0
		mov	[bp+var_70E], 498h
		mov	[bp+var_692], 0
		xor	ax, ax
		mov	[bp+var_694], ax
		movsx	eax, ax
		mov	[bp+var_6A9], eax
		push	[bp+var_2C]
		push	word_4D36E
		push	0FFh
		push	0Ah
		lea	ax, [bp+var_666]
		push	ax
		call	sub_7A04
		add	sp, 0Ah
		mov	[bp+var_70E], 4B0h
		mov	[bp+var_666], 4C8h
		mov	[bp+var_65C], 4E8h
		mov	[bp+var_603], 1E4h
		xor	ax, ax
		mov	[bp+var_5FF], ax
		mov	[bp+var_601], ax
		mov	[bp+var_603], 47Ch
		push	100h
		push	0
		lea	ax, [bp+var_5FD]
		push	ax
		call	Palette_Alloc_34A1A
		add	sp, 6
		mov	[bp+var_611], 0
		mov	[bp+var_606], 0
		mov	[bp+var_626], 80h
		mov	[bp+var_5F8], 0FFh
		mov	ax, [bp+var_2C]
		mov	[bp+var_605], ax
		push	0
		lea	ax, [bp+var_70E]
		push	ax
		call	sub_870B
		add	sp, 4
		lea	ax, [bp+var_54E]
		push	ax
		lea	ax, [bp+var_647]
		push	ax
		lea	ax, [bp+var_728]
		push	ax
		call	Widget_ApplyStyleAndAllocate_36FD2
		add	sp, 6
		mov	[bp+var_712], 4
		mov	bx, [bp+arg_0]
		mov	al, [bx+0FDh]
		mov	[bp+var_2D], al
		mov	al, [bp+var_2D]
		mov	[bp+var_634], al
		jmp	loc_5B153

loc_5AC03:
		mov	bx, [bp+arg_0]
		cmp	byte ptr [bx+0FDh], 0Dh
		jnz	short loc_5AC1E
		push	0Dh
		lea	ax, [bp+var_70E]
		push	ax
		call	sub_8543
		add	sp, 4
		jmp	short loc_5AC2D

loc_5AC1E:
		push	1Dh
		lea	ax, [bp+var_70E]
		push	ax
		call	sub_8543
		add	sp, 4

loc_5AC2D:
		cmp	[bp+var_B], 2
		jz	short loc_5AC36
		jmp	loc_5AD75

loc_5AC36:
		push	7Eh
		lea	ax, [bp+var_70E]
		push	ax
		call	sub_8543
		add	sp, 4
		mov	[bp+var_29], 18h
		push	9DCh
		lea	ax, [bp+var_4E6]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	bx, [bp+arg_0]
		mov	eax, [bx+27Ch]
		mov	bx, [bp+arg_0]
		add	eax, [bx+288h]
		push	eax
		push	9EAh
		lea	ax, [bp+var_4AA]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		push	9EEh
		lea	ax, [bp+var_46E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	bx, [bp+arg_0]
		push	large [bx+288h]
		push	9FFh
		lea	ax, [bp+var_432]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		push	0A03h
		lea	ax, [bp+var_3F6]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	bx, [bp+arg_0]
		push	large [bx+284h]
		push	0A0Bh
		lea	ax, [bp+var_3BA]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	[bp+var_37E], 0
		mov	[bp+var_342], 0
		push	0A0Fh
		lea	ax, [bp+var_306]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	bx, [bp+arg_0]
		mov	eax, [bx+27Ch]
		mov	bx, [bp+arg_0]
		sub	eax, [bx+284h]
		push	eax
		push	0A1Ch
		lea	ax, [bp+var_2CA]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		mov	[bp+var_28E], 0
		mov	[bp+var_252], 0
		push	0A20h
		lea	ax, [bp+var_216]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	bx, [bp+arg_0]
		push	large [bx+280h]
		push	0A2Eh
		lea	ax, [bp+var_1DA]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		push	0A32h
		lea	ax, [bp+var_19E]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	bx, [bp+arg_0]
		mov	eax, [bx+27Ch]
		mov	bx, [bp+arg_0]
		sub	eax, [bx+280h]
		mov	bx, [bp+arg_0]
		sub	eax, [bx+284h]
		push	eax
		push	0A3Ch
		lea	ax, [bp+var_162]
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 8
		jmp	short loc_5ADF2

loc_5AD75:
		push	7Fh
		lea	ax, [bp+var_70E]
		push	ax
		call	sub_8543
		add	sp, 4
		mov	[bp+var_29], 12h
		xor	si, si
		jmp	short loc_5ADED

loc_5AD8C:
		mov	bx, si
		shl	bx, 1
		push	word ptr [bx+202h]
		mov	ax, si
		shl	ax, 1
		mov	dx, 3Ch
		imul	dx
		lea	dx, [bp+var_4E6]
		add	ax, dx
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 4
		mov	ax, si
		shl	ax, 1
		mov	dx, 3Ch
		imul	dx
		lea	dx, [bp+var_4E6]
		add	ax, dx
		push	ax
		call	CRT_Strupr_2E71
		add	sp, 2
		mov	ax, si
		shl	ax, 1
		mov	bx, [bp+arg_0]
		add	bx, ax
		push	word ptr [bx+262h]
		push	0A40h
		mov	ax, si
		shl	ax, 1
		mov	dx, 3Ch
		imul	dx
		lea	dx, [bp+var_4AA]
		add	ax, dx
		push	ax
		call	CRT_Msg_Sprintf1
		add	sp, 6
		inc	si

loc_5ADED:
		cmp	si, 9
		jl	short loc_5AD8C

loc_5ADF2:
		xor	si, si
		jmp	loc_5AEB1

loc_5ADF7:
		mov	al, byte ptr [bp+si+var_A]
		mov	ah, 0
		push	ax
		push	44h
		lea	ax, [bp+var_728]
		push	ax
		push	0
		call	TextLayer_Construct_F542
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		shl	bx, 1
		lea	dx, [bp+var_5F6]
		add	bx, dx
		mov	[bx], ax
		mov	ax, si
		shl	ax, 1
		mov	dx, 3Ch
		imul	dx
		lea	dx, [bp+var_4E6]
		add	ax, dx
		push	ax
		mov	bx, si
		shl	bx, 1
		shl	bx, 1
		lea	ax, [bp+var_5F6]
		add	bx, ax
		push	word ptr [bx]
		call	TextLayer_SetText_F608
		add	sp, 4
		mov	ax, si
		shl	ax, 1
		mov	dx, 3Ch
		imul	dx
		lea	dx, [bp+var_4AA]
		add	ax, dx
		push	ax
		lea	ax, [bp+var_728]
		push	ax
		call	sub_375EF
		add	sp, 4
		mov	di, ax
		mov	al, byte ptr [bp+si+var_A]
		mov	ah, 0
		push	ax
		mov	ax, 0DAh
		sub	ax, di
		push	ax
		lea	ax, [bp+var_728]
		push	ax
		push	0
		call	TextLayer_Construct_F542
		add	sp, 8
		mov	bx, si
		shl	bx, 1
		shl	bx, 1
		lea	dx, [bp+var_5F4]
		add	bx, dx
		mov	[bx], ax
		mov	ax, si
		shl	ax, 1
		mov	dx, 3Ch
		imul	dx
		lea	dx, [bp+var_4AA]
		add	ax, dx
		push	ax
		mov	bx, si
		shl	bx, 1
		shl	bx, 1
		lea	ax, [bp+var_5F4]
		add	bx, ax
		push	word ptr [bx]
		call	TextLayer_SetText_F608
		add	sp, 4
		inc	si

loc_5AEB1:
		mov	al, [bp+var_29]
		mov	ah, 0
		cwd
		sub	ax, dx
		sar	ax, 1
		cmp	ax, si
		jle	short loc_5AEC2
		jmp	loc_5ADF7

loc_5AEC2:
		cmp	[bp+var_B], 2
		jnz	short loc_5AF23
		xor	di, di
		jmp	short loc_5AF1E

loc_5AECC:
		mov	al, byte ptr [bp+di+var_A]
		mov	ah, 0
		push	ax
		push	0DEh
		lea	ax, [bp+var_728]
		push	ax
		push	0
		call	TextLayer_Construct_F542
		add	sp, 8
		mov	bx, di
		shl	bx, 1
		lea	dx, [bp+var_5D6]
		add	bx, dx
		mov	[bx], ax
		mov	ax, di
		shl	ax, 1
		mov	dx, 3Ch
		imul	dx
		lea	dx, [bp+var_4E6]
		add	ax, dx
		mov	bx, ax
		cmp	byte ptr [bx], 0
		jz	short loc_5AF1D
		push	0A44h
		mov	bx, di
		shl	bx, 1
		lea	ax, [bp+var_5D6]
		add	bx, ax
		push	word ptr [bx]
		call	TextLayer_SetText_F608
		add	sp, 4

loc_5AF1D:
		inc	di

loc_5AF1E:
		cmp	di, 8
		jl	short loc_5AECC

loc_5AF23:
		xor	si, si
		jmp	short loc_5AF41

loc_5AF27:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5F6]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_666]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		inc	si

loc_5AF41:
		mov	al, [bp+var_29]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_5AF27
		cmp	[bp+var_D], 0
		jnz	short loc_5AF53
		jmp	loc_5AFF7

loc_5AF53:
		cmp	[bp+var_B], 1
		jz	short loc_5AF5C
		jmp	loc_5AFF7

loc_5AF5C:
		lea	ax, [bp+var_647]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	[bp+var_28]
		lea	ax, [bp+var_666]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		xor	di, di
		jmp	short loc_5AFD2

loc_5AF81:
		mov	[bp+var_34], di
		mov	bx, [bp+var_28]
		mov	ax, [bp+var_34]
		mov	[bx+1Bh], ax
		mov	[bp+var_36], 0
		jmp	short loc_5AFAC

loc_5AF94:
		push	0
		push	0
		mov	bx, [bp+var_36]
		push	word ptr [bx+6]
		mov	bx, [bp+var_36]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_5AFAC:
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_662]
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_5AF94
		push	word_4D36C
		push	word_4D36E
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		inc	di

loc_5AFD2:
		cmp	di, 5
		jl	short loc_5AF81
		push	[bp+var_28]
		lea	ax, [bp+var_666]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		mov	[bp+var_D], 0
		lea	ax, [bp+var_32]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2

loc_5AFF7:
		lea	ax, [bp+var_70E]
		push	ax
		call	sub_9243
		add	sp, 2
		mov	[bp+var_2E], al
		mov	al, [bp+var_2E]
		mov	ah, 0
		cmp	ax, 7Eh
		jz	short loc_5B026
		jg	short loc_5B01F
		cmp	ax, 0Dh
		jz	short loc_5B03A
		cmp	ax, 1Dh
		jz	short loc_5B03A
		jmp	short loc_5B040

loc_5B01F:
		cmp	ax, 7Fh
		jz	short loc_5B030
		jmp	short loc_5B040

loc_5B026:
		mov	[bp+var_B], 1
		mov	[bp+var_D], 1
		jmp	short loc_5B040

loc_5B030:
		mov	[bp+var_B], 2
		mov	[bp+var_D], 1
		jmp	short loc_5B040

loc_5B03A:
		mov	[bp+var_C], 1
		jmp	short loc_5B040

loc_5B040:
		cmp	[bp+var_D], 0
		jnz	short loc_5B049
		jmp	loc_5B0ED

loc_5B049:
		cmp	[bp+var_B], 2
		jz	short loc_5B052
		jmp	loc_5B0ED

loc_5B052:
		lea	ax, [bp+var_647]
		push	ax
		lea	ax, [bp+var_32]
		push	ax
		call	sub_3499B
		add	sp, 4
		push	[bp+var_28]
		lea	ax, [bp+var_666]
		push	ax
		call	LayerGroup_Add_33BD0
		add	sp, 4
		mov	di, 4
		jmp	short loc_5B0C9

loc_5B078:
		mov	[bp+var_34], di
		mov	bx, [bp+var_28]
		mov	ax, [bp+var_34]
		mov	[bx+1Bh], ax
		mov	[bp+var_36], 0
		jmp	short loc_5B0A3

loc_5B08B:
		push	0
		push	0
		mov	bx, [bp+var_36]
		push	word ptr [bx+6]
		mov	bx, [bp+var_36]
		mov	bx, [bx+6]
		mov	bx, [bx]
		call	dword ptr [bx+10h]
		add	sp, 6

loc_5B0A3:
		lea	ax, [bp+var_36]
		push	ax
		lea	ax, [bp+var_662]
		push	ax
		call	LinkedList_Helper_3656B
		add	sp, 4
		or	ax, ax
		jnz	short loc_5B08B
		push	word_4D36C
		push	word_4D36E
		call	UI_ApplyEncodingHelper_35A92
		add	sp, 4
		dec	di

loc_5B0C9:
		or	di, di
		jge	short loc_5B078
		push	[bp+var_28]
		lea	ax, [bp+var_666]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		mov	[bp+var_D], 0
		lea	ax, [bp+var_32]
		push	ax
		call	SmallObject_UnregisterFromList_349C1
		add	sp, 2

loc_5B0ED:
		xor	si, si
		jmp	short loc_5B13D

loc_5B0F1:
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5F6]
		add	bx, ax
		push	word ptr [bx]
		lea	ax, [bp+var_666]
		push	ax
		call	LayerGroup_Remove_33C0D
		add	sp, 4
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5F6]
		add	bx, ax
		cmp	word ptr [bx], 0
		jz	short loc_5B13C
		push	3
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5F6]
		add	bx, ax
		push	word ptr [bx]
		mov	bx, si
		shl	bx, 1
		lea	ax, [bp+var_5F6]
		add	bx, ax
		mov	bx, [bx]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_5B13C

loc_5B13C:
		inc	si

loc_5B13D:
		mov	al, [bp+var_29]
		mov	ah, 0
		cmp	ax, si
		jg	short loc_5B0F1
		lea	ax, [bp+var_70E]
		push	ax
		call	sub_85BE
		add	sp, 2

loc_5B153:
		mov	al, [bp+var_C]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_5B15F
		jmp	loc_5AC03

loc_5B15F:
		cmp	[bp+var_28], 0
		jz	short loc_5B176
		push	3
		push	[bp+var_28]
		mov	bx, [bp+var_28]
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_5B176

loc_5B176:
		push	0
		push	word_4D36E
		call	TextFormat_ReleaseAttribute_35AAD
		add	sp, 4
		lea	ax, [bp+var_726]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		lea	ax, [bp+var_5FD]
		push	ax
		call	Palette_Destruct_34DEC
		add	sp, 2
		push	2
		lea	ax, [bp+var_603]
		push	ax
		call	sub_6EDA
		add	sp, 4
		mov	[bp+var_666], 44Ch
		mov	[bp+var_65C], 46Ch
		call	TextScrollDisplayB_ApplyHelperD_4555C
		mov	byte_4F77A, 0
		cmp	[bp+var_639], 0
		jz	short loc_5B1E8
		mov	ax, [bp+var_639]
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	[bp+var_639]
		call	sub_39C
		add	sp, 2
		jmp	short loc_5B1E8

loc_5B1E8:
		push	2
		lea	ax, [bp+var_62C]
		push	ax
		call	sub_77A1
		add	sp, 4
		lea	ax, [bp+var_647]
		push	ax
		call	TextFormat_ReleaseStyleList_35A27
		add	sp, 2
		push	0
		lea	ax, [bp+var_666]
		push	ax
		call	Scene_Destruct_33D48
		add	sp, 4
		mov	[bp+var_70E], 498h
		lea	ax, [bp+var_70E]
		push	ax
		call	ResourceRecord_Helper_425B8
		add	sp, 2
		push	0
		lea	ax, [bp+var_70E]
		push	ax
		call	StreamReader_ReleaseBuffer_42F45
		add	sp, 4
		push	2
		lea	ax, [bp+var_5C6]
		push	ax
		call	IndexedRecordReader_Destruct_432D2
		add	sp, 4
		cmp	[bp+var_21], 0
		jz	short loc_5B268
		cmp	[bp+var_26], 0
		jz	short loc_5B268
		push	0
		mov	al, [bp+var_22]
		push	ax
		lea	ax, word ptr [bp+var_26]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5B268

loc_5B268:
		mov	[bp+var_26], 0
		mov	[bp+var_21], 0
		mov	[bp+var_20], 0
		push	2
		lea	ax, [bp+var_54E]
		push	ax
		call	GlyphObject_ScalarDeletingDtorA_36F5D
		add	sp, 4
		cmp	[bp+var_13], 0
		jz	short loc_5B2AF
		cmp	[bp+var_18], 0
		jz	short loc_5B2AF
		push	0
		mov	al, [bp+var_14]
		push	ax
		lea	ax, word ptr [bp+var_18]
		push	ax
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5B2AF

loc_5B2AF:
		mov	[bp+var_18], 0
		mov	[bp+var_13], 0
		mov	[bp+var_12], 0
		pop	di
		pop	si
		leave
		retf
sub_5A9E2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_5B2C7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5B2E2
		push	9
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_5B2EF

loc_5B2E2:
		mov	byte ptr [si], 0
		mov	word ptr [si+5], 0
		mov	word ptr [si+7], 0

loc_5B2EF:
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_5B2C7		endp

; START OF FUNCTION CHUNK FOR sub_5B2C7
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR sub_5B2C7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; ResourceHandle_Construct_53F9F (sub_53F9F de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — far, LUE 2026-10-17. Construit un descripteur de
; bloc mémoire de ressource de 10 octets (alloué si pointeur nul) : +0 handle (dword) = 0, +4
; type de mémoire = 2, +5 drapeau « possédé » = 0, +6 taille (dword) = 0.
; ==============================================================================================
ResourceHandle_Construct_5B2F7		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_5B312
		push	0Ah
		call	CRT_Malloc16_Retry
		add	sp, 2
		mov	si, ax
		or	ax, ax
		jz	short loc_5B329

loc_5B312:
		mov	dword ptr [si], 0
		mov	byte ptr [si+4], 2
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0

loc_5B329:
		mov	ax, si
		pop	si
		pop	bp
		retf
ResourceHandle_Construct_5B2F7		endp

; START OF FUNCTION CHUNK FOR ResourceHandle_Construct_5B2F7
		pop	si
		pop	bp
		retf
; END OF FUNCTION CHUNK FOR ResourceHandle_Construct_5B2F7

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à ResourceHandle_Destruct_53FD9 (sub_53FD9 de
; OPTEST.EXE). Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — far,
; LUE 2026-10-17. Si le descripteur possède un bloc (+5 non nul, +0 non nul) :
; Memory_TypedFree_2B8A4 ; remet +0, +5, +6 à zéro ; libère l'objet si bit 1 de l'argument.
; ==============================================================================================
ResourceHandle_Destruct_5B331		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_5B382
		cmp	byte ptr [si+5], 0
		jz	short loc_5B360
		cmp	dword ptr [si], 0
		jz	short loc_5B360
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	6C14h
		call	Memory_TypedFree_32934
		add	sp, 8
		jmp	short loc_5B360

loc_5B360:
		mov	dword ptr [si], 0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		test	di, 1
		jz	short loc_5B382
		push	si
		call	sub_39C
		add	sp, 2

loc_5B382:
		pop	di
		pop	si
		pop	bp
		retf
ResourceHandle_Destruct_5B331		endp
ovr192		ends
