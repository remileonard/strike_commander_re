seg011		segment	byte public 'CODE' use16
		assume cs:seg011
		;org 0Ch
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing
		push	bp
		mov	bp, sp
		pop	bp
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,67L — construit un sous-objet (via sub_5C6F3, type 0x2B), l'attache (sub_6AA34), type
; marqueur 0x130, réinitialise le HUD associé (sub_12931) : constructeur de sous-objet attaché
; (arme externe/store).
; ==============================================================================================
SubObject_Attach	proc far		; CODE XREF: seg010:041FP

var_4		= dword	ptr -4
arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+4], 0FFFFh
		jnz	short loc_1301D
		call	Cursor_SlotAllocate
		les	bx, [bp+arg_0]
		mov	es:[bx+4], ax

loc_1301D:				; CODE XREF: SubObject_Attach+Ej
		les	bx, [bp+arg_0]
		mov	ax, [bp+arg_4]
		mov	es:[bx+2], ax
		push	1
		push	0
		push	2
		push	large 2Bh ; '+'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax
		or	ax, dx
		jz	short loc_13073
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 0C6h ; '�'
		push	dx
		push	bx
		call	VROOMM_StubThunk_6AA34
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 130h

loc_1305F:
		push	word ptr [bp+var_4+2]
		push	bx
		call	AircraftStateBlock_Reset_12931
		add	sp, 4
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_13079
; ���������������������������������������������������������������������������

loc_13073:				; CODE XREF: SubObject_Attach+42j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_13079:				; CODE XREF: SubObject_Attach+70j
		les	bx, [bp+arg_0]
		mov	es:[bx+9], dx
		mov	es:[bx+7], ax
		mov	word ptr es:[bx+0Bh], 0
		xor	eax, eax
		mov	es:[bx+15h], eax
		mov	es:[bx+11h], eax
		mov	es:[bx+0Dh], eax
		mov	byte ptr es:[bx+6], 2
		leave
		retf
SubObject_Attach	endp

; ���������������������������������������������������������������������������

loc_130A3:				; DATA XREF: seg339:off_6D420o
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+0Ah]
		cmp	dword ptr [bp+6], 0
		jz	short loc_130FD
		les	bx, [bp+6]
		mov	word ptr es:[bx], 36Ch
		mov	ax, [bp+6]
		add	ax, 4
		push	word ptr [bp+8]
		push	ax
		call	Cursor_SlotFree
		add	sp, 4
		push	0
		push	large dword ptr	[bp+6]
		call	SubObject_NotifyEvent
		add	sp, 6
		test	si, 1
		jz	short loc_130FD
		mov	eax, [bp+6]
		mov	[bp-4],	eax
		push	0
		push	2
		lea	ax, [bp-4]
		push	ax
		push	5C44h
		call	Memory_TypedFree_5C7B6
		add	sp, 8

loc_130FD:				; CODE XREF: seg011:00C2j seg011:00F0j
		pop	si
		leave
		retf

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far,2015 lignes — la plus grosse fonction de toute la base à ce jour. Encode le HUD
; (sub_12806), vérifie le type d'objet (sub_28642==0x12, constante 'joueur' déjà vue), teste
; de nombreux flags globaux de mode/mission (byte_72A8E, byte_722D0, byte_72DE5,
; byte_72E1D...). Candidat très fort pour la fonction principale de traitement de l'avion du
; JOUEUR (input, cockpit, changement de mode) — beaucoup trop volumineuse pour une passe
; rapide, à traiter en session dédiée avec découpage par blocs. — SESSION DEDIEE (partielle) :
; c'est l'ETAGE D'ENTREE (ni tick physique ni rendu). playerCtx : +0x02 vtable, +0x07 far ptr
; sous-objet controle/HUD (+0x1F=cmd tangage, +0x23=cmd roulis en 24.8, flags +0x1B/1C/1D),
; +0x0B near ptr -> struct JDYN 0xC5 (prouve : [+0x75]=flags_75, [[+0]]->sous-objet A,
; [A+0x20]=flag 'au sol'). Lit Input_GetCalibratedYValue_67499 (tangage, ÷3) / XValue_67481
; (roulis, ÷0x0A) via word_72E6A/word_72E68 (axes joystick/touches curseur ; PAS la souris =
; vue cockpit). Dispatcher clavier : F=volets (flags_75 bit1), B=aerofrein (bit0), L=train
; (bit2, interlock [A+0x20]) avec messages HUD 'Flaps/Brakes ON/OFF'. La manette des gaz (+/-
; et 1..0, MIL 0-5 / AFT 1-5) est traitee AILLEURS. Detail : DATA_MODEL.md §6.2.
; ==============================================================================================
Player_MainUpdate	proc far		; CODE XREF: seg011:124Ep

var_7E		= dword	ptr -7Eh
var_78		= word ptr -78h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= byte ptr -60h
var_5E		= dword	ptr -5Eh
var_5A		= dword	ptr -5Ah
var_56		= dword	ptr -56h
var_52		= dword	ptr -52h
var_4E		= dword	ptr -4Eh
var_4A		= dword	ptr -4Ah
var_46		= dword	ptr -46h
var_42		= dword	ptr -42h
var_3E		= dword	ptr -3Eh
var_3A		= dword	ptr -3Ah
var_36		= dword	ptr -36h
var_32		= dword	ptr -32h
var_2E		= word ptr -2Eh
var_2C		= dword	ptr -2Ch
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= word ptr -24h
var_22		= word ptr -22h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= word ptr -18h
var_16		= dword	ptr -16h
var_12		= dword	ptr -12h
var_E		= dword	ptr -0Eh
var_A		= dword	ptr -0Ah
var_6		= dword	ptr -6
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	si
		mov	byte_70497, 0
		mov	[bp+var_1], 0
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+7]
		call	AircraftStateBits_Clear_12806
		add	sp, 4
		mov	[bp+var_2], 0
		cmp	byte_72A8E, 4
		jnz	short loc_1314A
		mov	bx, word_6E4B2
		cmp	byte ptr [bx+21Eh], 0
		jz	short loc_13145
		mov	al, [bx+1BCh]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13145
		mov	ax, 1
		jmp	short loc_13147
; ���������������������������������������������������������������������������

loc_13145:				; CODE XREF: Player_MainUpdate+34j
					; Player_MainUpdate+3Ej
		xor	ax, ax

loc_13147:				; CODE XREF: Player_MainUpdate+43j
		mov	[bp+var_2], al

loc_1314A:				; CODE XREF: Player_MainUpdate+29j
		push	large [bp+arg_0]
		call	Input_JoyTimestampValid
		add	sp, 4
		cmp	ax, 12h
		jz	short loc_1315D
		jmp	short loc_131D0
; ���������������������������������������������������������������������������

loc_1315D:				; CODE XREF: Player_MainUpdate+59j
		cmp	byte_722D0, 1
		jnz	short loc_13174
		test	byte_722D3, 30h
		jz	short loc_13170
		mov	ax, 1
		jmp	short loc_13172
; ���������������������������������������������������������������������������

loc_13170:				; CODE XREF: Player_MainUpdate+69j
		xor	ax, ax

loc_13172:				; CODE XREF: Player_MainUpdate+6Ej
		jmp	short loc_13189
; ���������������������������������������������������������������������������

loc_13174:				; CODE XREF: Player_MainUpdate+62j
		cmp	byte_72DE5, 1
		jz	short loc_13182
		cmp	byte_72E1D, 1
		jnz	short loc_13187

loc_13182:				; CODE XREF: Player_MainUpdate+79j
		mov	ax, 1
		jmp	short loc_13189
; ���������������������������������������������������������������������������

loc_13187:				; CODE XREF: Player_MainUpdate+80j
		xor	ax, ax

loc_13189:				; CODE XREF: Player_MainUpdate:loc_13172j
					; Player_MainUpdate+85j
		or	al, al
		jz	short loc_13194
		mov	byte_6E4B8, 1
		jmp	short loc_131D0
; ���������������������������������������������������������������������������

loc_13194:				; CODE XREF: Player_MainUpdate+8Bj
		cmp	byte_6E33C, 0
		jz	short loc_131D0
		cmp	byte_722D0, 1
		jnz	short loc_131B2
		test	byte_722D3, 0Ch
		jz	short loc_131AE
		mov	ax, 1
		jmp	short loc_131B0
; ���������������������������������������������������������������������������

loc_131AE:				; CODE XREF: Player_MainUpdate+A7j
		xor	ax, ax

loc_131B0:				; CODE XREF: Player_MainUpdate+ACj
		jmp	short loc_131C7
; ���������������������������������������������������������������������������

loc_131B2:				; CODE XREF: Player_MainUpdate+A0j
		cmp	byte_72DF2, 1
		jz	short loc_131C0
		cmp	byte_72DFE, 1
		jnz	short loc_131C5

loc_131C0:				; CODE XREF: Player_MainUpdate+B7j
		mov	ax, 1
		jmp	short loc_131C7
; ���������������������������������������������������������������������������

loc_131C5:				; CODE XREF: Player_MainUpdate+BEj
		xor	ax, ax

loc_131C7:				; CODE XREF: Player_MainUpdate:loc_131B0j
					; Player_MainUpdate+C3j
		or	al, al
		jz	short loc_131D0
		mov	byte_706AF, 4

loc_131D0:				; CODE XREF: Player_MainUpdate+5Bj
					; Player_MainUpdate+92j ...
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 5
		and	ax, 1

loc_131E0:
		mov	ah, 0

loc_131E2:
		or	ax, ax
		jz	short loc_131E9

loc_131E6:
		jmp	loc_14170
; ���������������������������������������������������������������������������

loc_131E9:				; CODE XREF: Player_MainUpdate+E4j
		push	large [bp+arg_0]
		call	Input_JoyTimestampValid
		add	sp, 4
		sub	ax, 2
		mov	bx, ax
		cmp	bx, 2Fh	; '/'   ; switch 48 cases
		jbe	short loc_13202
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13202:				; CODE XREF: Player_MainUpdate+FDj
		shl	bx, 1
		jmp	cs:off_14173[bx] ; switch jump

loc_13209:				; DATA XREF: seg011:off_14173o
		cmp	byte_6E33C, 0	; case 0x2A
		jnz	short loc_13213
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13213:				; CODE XREF: Player_MainUpdate+10Ej
		cmp	byte_722D0, 1
		jnz	short loc_1322A
		test	byte_722D3, 0Ch
		jz	short loc_13226
		mov	ax, 1
		jmp	short loc_13228
; ���������������������������������������������������������������������������

loc_13226:				; CODE XREF: Player_MainUpdate+11Fj
		xor	ax, ax

loc_13228:				; CODE XREF: Player_MainUpdate+124j
		jmp	short loc_1323F
; ���������������������������������������������������������������������������

loc_1322A:				; CODE XREF: Player_MainUpdate+118j
		cmp	byte_72DF2, 1
		jz	short loc_13238
		cmp	byte_72DFE, 1
		jnz	short loc_1323D

loc_13238:				; CODE XREF: Player_MainUpdate+12Fj
		mov	ax, 1
		jmp	short loc_1323F
; ���������������������������������������������������������������������������

loc_1323D:				; CODE XREF: Player_MainUpdate+136j
		xor	ax, ax

loc_1323F:				; CODE XREF: Player_MainUpdate:loc_13228j
					; Player_MainUpdate+13Bj
		or	al, al
		jz	short loc_13294
		mov	[bp+var_28], 0
		mov	[bp+var_2C], 0
		jmp	short loc_1327E
; ���������������������������������������������������������������������������

loc_13252:				; CODE XREF: Player_MainUpdate+18Fj
		mov	si, [bp+var_28]
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	word ptr [bp+var_2C+2],	dx
		mov	word ptr [bp+var_2C], ax

loc_13261:
		cmp	[bp+var_2C], 0

loc_13266:
		jz	short loc_1327E

loc_13268:
		cmp	byte ptr [si+50h], 0FFh
		jnz	short loc_1327E

loc_1326E:
		les	bx, [bp+arg_0]

loc_13271:
		push	word ptr es:[bx+2]
		push	si
		call	VROOMM_StubThunk_6BFBF
		add	sp, 4

loc_1327E:				; CODE XREF: Player_MainUpdate+150j
					; Player_MainUpdate:loc_13266j	...
		lea	ax, [bp+var_28]
		push	ax
		push	59C3h
		call	World_IterateObjects
		add	sp, 4
		or	ax, ax
		jnz	short loc_13252
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13294:				; CODE XREF: Player_MainUpdate+141j
		cmp	byte_722D0, 1
		jnz	short loc_132AB
		test	byte_722D3, 0C0h
		jz	short loc_132A7
		mov	ax, 1
		jmp	short loc_132A9
; ���������������������������������������������������������������������������

loc_132A7:				; CODE XREF: Player_MainUpdate+1A0j
		xor	ax, ax

loc_132A9:				; CODE XREF: Player_MainUpdate+1A5j
		jmp	short loc_132C0
; ���������������������������������������������������������������������������

loc_132AB:				; CODE XREF: Player_MainUpdate+199j
		cmp	byte_72E00, 1
		jz	short loc_132B9
		cmp	byte_72E21, 1
		jnz	short loc_132BE

loc_132B9:				; CODE XREF: Player_MainUpdate+1B0j
		mov	ax, 1
		jmp	short loc_132C0
; ���������������������������������������������������������������������������

loc_132BE:				; CODE XREF: Player_MainUpdate+1B7j
		xor	ax, ax

loc_132C0:				; CODE XREF: Player_MainUpdate:loc_132A9j
					; Player_MainUpdate+1BCj
		or	al, al
		jnz	short loc_132C7
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_132C7:				; CODE XREF: Player_MainUpdate+1C2j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		mov	[bp+var_28], ax
		mov	bx, [bp+var_28]
		les	bx, [bx+5Ah]
		mov	si, es:[bx+0Dh]
		or	si, si
		jnz	short loc_132E2
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_132E2:				; CODE XREF: Player_MainUpdate+1DDj
		push	ax
		push	si
		call	VROOMM_StubThunk_6BFBF
		add	sp, 4
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_132EF:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x27

loc_132F2:
		les	bx, es:[bx+7]

loc_132F6:
		mov	byte ptr es:[bx+1Eh], 0
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_132FE:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x0
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 1
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1330D:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x1
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 2
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1331C:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x2
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 3
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1332B:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x3
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 4
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1333A:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x4
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 5
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13349:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x5
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 6
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13358:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x6
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 7
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13367:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x7
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 8
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13376:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x8
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 9
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13385:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x9
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 0Ah
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13394:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0xB
		les	bx, es:[bx+7]
		cmp	byte ptr es:[bx+1Eh], 0Ah
		jl	short loc_133A5
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_133A5:				; CODE XREF: Player_MainUpdate+2A0j
		inc	byte ptr es:[bx+1Eh]
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_133AC:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0xA
		les	bx, es:[bx+7]
		cmp	byte ptr es:[bx+1Eh], 0
		jg	short loc_133BD
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_133BD:				; CODE XREF: Player_MainUpdate+2B8j
		dec	byte ptr es:[bx+1Eh]
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_133C4:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		cmp	byte_722D0, 1	; case 0xF
		jnz	short loc_133DB
		test	byte_722D3, 0C0h
		jz	short loc_133D7
		mov	ax, 1
		jmp	short loc_133D9
; ���������������������������������������������������������������������������

loc_133D7:				; CODE XREF: Player_MainUpdate+2D0j
		xor	ax, ax

loc_133D9:				; CODE XREF: Player_MainUpdate+2D5j
		jmp	short loc_133F0
; ���������������������������������������������������������������������������

loc_133DB:				; CODE XREF: Player_MainUpdate+2C9j
		cmp	byte_72E00, 1
		jz	short loc_133E9
		cmp	byte_72E21, 1
		jnz	short loc_133EE

loc_133E9:				; CODE XREF: Player_MainUpdate+2E0j
		mov	ax, 1

loc_133EC:
		jmp	short loc_133F0
; ���������������������������������������������������������������������������

loc_133EE:				; CODE XREF: Player_MainUpdate+2E7j
		xor	ax, ax

loc_133F0:				; CODE XREF: Player_MainUpdate:loc_133D9j
					; Player_MainUpdate:loc_133ECj
		or	al, al

loc_133F2:
		jz	short loc_1340F
		xor	byte_72357, 1
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+2]
		push	large dword ptr	[bx+5Ah]
		call	VROOMM_StubThunk_6C42A
		add	sp, 4
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1340F:				; CODE XREF: Player_MainUpdate:loc_133F2j
		cmp	byte_722D0, 1
		jnz	short loc_13426
		test	byte_722D3, 30h
		jz	short loc_13422
		mov	ax, 1
		jmp	short loc_13424
; ���������������������������������������������������������������������������

loc_13422:				; CODE XREF: Player_MainUpdate+31Bj
		xor	ax, ax

loc_13424:				; CODE XREF: Player_MainUpdate+320j
		jmp	short loc_1343B
; ���������������������������������������������������������������������������

loc_13426:				; CODE XREF: Player_MainUpdate+314j
		cmp	byte_72DE5, 1
		jz	short loc_13434
		cmp	byte_72E1D, 1
		jnz	short loc_13439

loc_13434:				; CODE XREF: Player_MainUpdate+32Bj
		mov	ax, 1
		jmp	short loc_1343B
; ���������������������������������������������������������������������������

loc_13439:				; CODE XREF: Player_MainUpdate+332j
		xor	ax, ax

loc_1343B:				; CODE XREF: Player_MainUpdate:loc_13424j
					; Player_MainUpdate+337j
		or	al, al
		jz	short loc_1344E
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 10h
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1344E:				; CODE XREF: Player_MainUpdate+33Dj
		cmp	byte_722D0, 1
		jnz	short loc_13465
		test	byte_722D3, 0Ch
		jz	short loc_13461
		mov	ax, 1
		jmp	short loc_13463
; ���������������������������������������������������������������������������

loc_13461:				; CODE XREF: Player_MainUpdate+35Aj
		xor	ax, ax

loc_13463:				; CODE XREF: Player_MainUpdate+35Fj
		jmp	short loc_1347A
; ���������������������������������������������������������������������������

loc_13465:				; CODE XREF: Player_MainUpdate+353j
		cmp	byte_72DF2, 1
		jz	short loc_13473
		cmp	byte_72DFE, 1
		jnz	short loc_13478

loc_13473:				; CODE XREF: Player_MainUpdate+36Aj
		mov	ax, 1
		jmp	short loc_1347A
; ���������������������������������������������������������������������������

loc_13478:				; CODE XREF: Player_MainUpdate+371j
		xor	ax, ax

loc_1347A:				; CODE XREF: Player_MainUpdate:loc_13463j
					; Player_MainUpdate+376j
		or	al, al
		jz	short loc_1348D
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 20h
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1348D:				; CODE XREF: Player_MainUpdate+37Cj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 4
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1349C:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		cmp	byte_722D0, 1	; case 0x12
		jnz	short loc_134B3
		test	byte_722D3, 0C0h
		jz	short loc_134AF
		mov	ax, 1
		jmp	short loc_134B1
; ���������������������������������������������������������������������������

loc_134AF:				; CODE XREF: Player_MainUpdate+3A8j
		xor	ax, ax

loc_134B1:				; CODE XREF: Player_MainUpdate+3ADj
		jmp	short loc_134C8
; ���������������������������������������������������������������������������

loc_134B3:				; CODE XREF: Player_MainUpdate+3A1j
		cmp	byte_72E00, 1
		jz	short loc_134C1
		cmp	byte_72E21, 1
		jnz	short loc_134C6

loc_134C1:				; CODE XREF: Player_MainUpdate+3B8j
		mov	ax, 1
		jmp	short loc_134C8
; ���������������������������������������������������������������������������

loc_134C6:				; CODE XREF: Player_MainUpdate+3BFj
		xor	ax, ax

loc_134C8:				; CODE XREF: Player_MainUpdate:loc_134B1j
					; Player_MainUpdate+3C4j
		or	al, al
		jz	short loc_134CF
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_134CF:				; CODE XREF: Player_MainUpdate+3CAj
		cmp	byte_722D0, 1
		jnz	short loc_134E6
		test	byte_722D3, 30h
		jz	short loc_134E2
		mov	ax, 1
		jmp	short loc_134E4
; ���������������������������������������������������������������������������

loc_134E2:				; CODE XREF: Player_MainUpdate+3DBj
		xor	ax, ax

loc_134E4:				; CODE XREF: Player_MainUpdate+3E0j
		jmp	short loc_134FB
; ���������������������������������������������������������������������������

loc_134E6:				; CODE XREF: Player_MainUpdate+3D4j
		cmp	byte_72DE5, 1
		jz	short loc_134F4

loc_134ED:
		cmp	byte_72E1D, 1
		jnz	short loc_134F9

loc_134F4:				; CODE XREF: Player_MainUpdate+3EBj
		mov	ax, 1
		jmp	short loc_134FB
; ���������������������������������������������������������������������������

loc_134F9:				; CODE XREF: Player_MainUpdate+3F2j
		xor	ax, ax

loc_134FB:				; CODE XREF: Player_MainUpdate:loc_134E4j
					; Player_MainUpdate+3F7j
		or	al, al
		jz	short loc_1350E
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 1
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1350E:				; CODE XREF: Player_MainUpdate+3FDj
		cmp	byte_722D0, 1
		jnz	short loc_13525
		test	byte_722D3, 0Ch
		jz	short loc_13521
		mov	ax, 1
		jmp	short loc_13523
; ���������������������������������������������������������������������������

loc_13521:				; CODE XREF: Player_MainUpdate+41Aj
		xor	ax, ax

loc_13523:				; CODE XREF: Player_MainUpdate+41Fj
		jmp	short loc_1353A
; ���������������������������������������������������������������������������

loc_13525:				; CODE XREF: Player_MainUpdate+413j
		cmp	byte_72DF2, 1
		jz	short loc_13533
		cmp	byte_72DFE, 1
		jnz	short loc_13538

loc_13533:				; CODE XREF: Player_MainUpdate+42Aj
		mov	ax, 1
		jmp	short loc_1353A
; ���������������������������������������������������������������������������

loc_13538:				; CODE XREF: Player_MainUpdate+431j
		xor	ax, ax

loc_1353A:				; CODE XREF: Player_MainUpdate:loc_13523j
					; Player_MainUpdate+436j
		or	al, al
		jz	short loc_1354D
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 80h
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1354D:				; CODE XREF: Player_MainUpdate+43Cj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 40h
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1355C:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x25
		les	bx, es:[bx+7]

loc_13563:
		or	byte ptr es:[bx+1Ch], 2
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1356B:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x26
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 4
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1357A:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x20
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 8
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13589:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x1F
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 10h
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_135A1
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_135A1:				; CODE XREF: Player_MainUpdate+49Cj
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 1
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_135D4
		sub	sp, 4
		mov	[bp+var_7E], 200h
		push	ds
		push	offset aFlapsOn	; "Flaps ON"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_135D4:				; CODE XREF: Player_MainUpdate+4B4j
		sub	sp, 4
		mov	[bp+var_7E], 200h
		push	ds
		push	offset aFlapsOff ; "Flaps OFF"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_135F2:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x2E
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 20h
		mov	al, [bp+var_2]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1360A
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1360A:				; CODE XREF: Player_MainUpdate+505j
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1363B
		sub	sp, 4
		mov	[bp+var_7E], 200h
		push	ds
		push	offset aBrakesOn ; "Brakes ON"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1363B:				; CODE XREF: Player_MainUpdate+51Bj
		sub	sp, 4
		mov	[bp+var_7E], 200h
		push	ds
		push	offset aBrakesOff ; "Brakes OFF"
		push	ds
		push	offset word_72A94
		call	VROOMM_StubThunk_6AEF3
		add	sp, 0Ch
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13659:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		les	bx, [bp+arg_0]	; case 0x24
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]

loc_13662:
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_1366E
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1366E:				; CODE XREF: Player_MainUpdate+569j
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Ch], 40h
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_1367D:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		cmp	word_70466, 3	; case 0x1C
		ja	short loc_13687
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13687:				; CODE XREF: Player_MainUpdate+582j
		mov	bx, word_706A0
		mov	al, [bx+6Eh]
		mov	ah, 0
		mov	[bp+var_28], ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jz	short loc_136A8
		jmp	loc_137B4
; ���������������������������������������������������������������������������

loc_136A8:				; CODE XREF: Player_MainUpdate+5A3j
		cmp	[bp+var_28], 0A2h ; '�'
		jz	short loc_136B2
		jmp	loc_137B4
; ���������������������������������������������������������������������������

loc_136B2:				; CODE XREF: Player_MainUpdate+5ADj
		mov	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_136C0
		jmp	loc_137B4
; ���������������������������������������������������������������������������

loc_136C0:				; CODE XREF: Player_MainUpdate+5BBj
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0BFh
		mov	word ptr [bp+var_32], 0
		xor	ax, ax
		mov	[bp+var_2E], ax
		mov	word ptr [bp+var_32+2],	ax
		mov	[bp+var_36], 200h
		mov	eax, [bp+var_36]
		mov	[bp+var_2C], eax
		mov	bx, word_706A0
		mov	al, [bx+6Fh]
		mov	ah, 0
		mov	bx, ax
		push	ax
		mov	ax, word_706A0
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_6C]
		push	ax
		call	Player_ResolveAttachPointN_5305A
		add	sp, 8
		lea	ax, [bp+var_6C]
		mov	[bp+var_2E], ax
		mov	bx, word_706A0
		mov	bx, [bx+72h]
		push	bx
		mov	ax, word_706A0
		add	ax, 1Eh
		push	ax
		push	ss
		lea	ax, [bp+var_78]
		push	ax
		call	Player_ResolveAttachPointN_5305A
		add	sp, 8
		lea	ax, [bp+var_78]
		mov	word ptr [bp+var_32+2],	ax
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+11h], 0
		jnz	short loc_13798
		mov	eax, [bp+arg_0]
		mov	[bp+var_3A], eax
		push	1
		push	0
		push	2
		push	large 0A1h ; '�'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_3E+2],	dx
		mov	word ptr [bp+var_3E], ax
		or	ax, dx
		jz	short loc_13787
		push	large [bp+var_3A]
		push	dx
		push	word ptr [bp+var_3E]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_3E]
		mov	word ptr es:[bx], 326h
		mov	byte ptr es:[bx+21h], 12h
		mov	dx, word ptr [bp+var_3E+2]
		mov	ax, word ptr [bp+var_3E]
		jmp	short loc_1378D
; ���������������������������������������������������������������������������

loc_13787:				; CODE XREF: Player_MainUpdate+660j
		mov	dx, word ptr [bp+var_3E+2]
		mov	ax, word ptr [bp+var_3E]

loc_1378D:				; CODE XREF: Player_MainUpdate+685j
		les	bx, [bp+arg_0]
		mov	es:[bx+13h], dx
		mov	es:[bx+11h], ax

loc_13798:				; CODE XREF: Player_MainUpdate+637j
		lea	ax, [bp+var_32]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+11h]
		les	bx, es:[bx+11h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_137B4:				; CODE XREF: Player_MainUpdate+5A5j
					; Player_MainUpdate+5AFj ...
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	bx, [bx]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13808
		mov	bx, word ptr [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0BFh
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 2

loc_137DF:
		and	ax, 1

loc_137E2:
		or	al, al
		jz	short loc_137F1

loc_137E6:
		mov	bx, word ptr [bp+arg_0]

loc_137E9:
		mov	bx, es:[bx+0Bh]

loc_137ED:
		and	byte ptr [bx+75h], 0FBh

loc_137F1:				; CODE XREF: Player_MainUpdate+6E4j
		cmp	byte_6E33B, 0
		jz	short loc_13800
		mov	byte_6E4B8, 1
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13800:				; CODE XREF: Player_MainUpdate+6F6j
		mov	byte_6E4B9, 1
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13808:				; CODE XREF: Player_MainUpdate+6C4j
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_13816
		jmp	loc_13956	; default
; ���������������������������������������������������������������������������

loc_13816:				; CODE XREF: Player_MainUpdate+711j
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0BFh
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13840
		mov	bx, word ptr [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		or	byte ptr [bx+75h], 4

loc_13840:				; CODE XREF: Player_MainUpdate+733j
		mov	word ptr [bp+var_32], 0
		xor	ax, ax
		mov	[bp+var_2E], ax
		mov	word ptr [bp+var_32+2],	ax
		mov	[bp+var_36], 200h
		mov	eax, [bp+var_36]
		mov	[bp+var_2C], eax
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+2]
		mov	bx, es:[bx+2]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	si, ax
		mov	eax, [si]
		mov	[bp+var_6C], eax
		mov	eax, [si+4]
		mov	[bp+var_68], eax
		mov	eax, [si+8]
		mov	[bp+var_64], eax
		lea	ax, [bp+var_6C]
		mov	[bp+var_2E], ax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+2]
		add	ax, 12h
		mov	word ptr [bp+var_32+2],	ax
		cmp	dword ptr es:[bx+15h], 0
		jnz	short loc_13901
		mov	eax, [bp+arg_0]
		mov	[bp+var_3A], eax
		push	1
		push	0
		push	2
		push	large 5Ah ; 'Z'
		push	5C44h
		call	Memory_TypedFreeWrapper_5C6F3
		add	sp, 0Ch
		mov	word ptr [bp+var_3E+2],	dx
		mov	word ptr [bp+var_3E], ax
		or	ax, dx
		jz	short loc_138F0
		push	large [bp+var_3A]
		push	dx
		push	word ptr [bp+var_3E]
		call	VROOMM_StubThunk_6AB4A
		add	sp, 8
		les	bx, [bp+var_3E]

loc_138DE:
		mov	word ptr es:[bx], 312h
		mov	byte ptr es:[bx+21h], 11h
		mov	dx, word ptr [bp+var_3E+2]
		mov	ax, word ptr [bp+var_3E]
		jmp	short loc_138F6
; ���������������������������������������������������������������������������

loc_138F0:				; CODE XREF: Player_MainUpdate+7C9j
		mov	dx, word ptr [bp+var_3E+2]
		mov	ax, word ptr [bp+var_3E]

loc_138F6:				; CODE XREF: Player_MainUpdate+7EEj
		les	bx, [bp+arg_0]
		mov	es:[bx+17h], dx
		mov	es:[bx+15h], ax

loc_13901:				; CODE XREF: Player_MainUpdate+7A3j
		lea	ax, [bp+var_32]
		push	ax
		les	bx, [bp+arg_0]
		push	large dword ptr	es:[bx+15h]
		les	bx, es:[bx+15h]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 6
		jmp	short loc_13956	; default
; ���������������������������������������������������������������������������

loc_1391C:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		mov	byte_70447, 0	; case 0x2F
		push	0
		call	VROOMM_StubThunk_6AE43
		pop	cx
		mov	[bp+var_28], ax
		push	3
		push	ax
		call	VROOMM_StubThunk_6AE48
		add	sp, 4
		cmp	word_6E4B2, 0
		jz	short loc_13956	; default
		mov	bx, word_6E4B2
		mov	byte ptr [bx+21Fh], 1
		jmp	short loc_13956	; default
; ���������������������������������������������������������������������������

loc_13949:				; CODE XREF: Player_MainUpdate+104j
					; DATA XREF: seg011:off_14173o
		mov	al, byte_72366	; case 0x1D
		mov	ah, 0
		neg	ax
		sbb	ax, ax
		inc	ax
		mov	byte_72366, al

loc_13956:				; CODE XREF: Player_MainUpdate+FFj
					; Player_MainUpdate+104j ...
		cmp	byte_72E01, 1	; default
		jnz	short loc_13961
		mov	al, 1
		jmp	short loc_13963
; ���������������������������������������������������������������������������

loc_13961:				; CODE XREF: Player_MainUpdate+85Bj
		mov	al, 0

loc_13963:				; CODE XREF: Player_MainUpdate+85Fj
		or	al, al
		jz	short loc_13978
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		mov	byte_6E4C7, 1

loc_13978:				; CODE XREF: Player_MainUpdate+865j
		cmp	byte_72DFC, 1
		jnz	short loc_13983
		mov	al, 1
		jmp	short loc_13985
; ���������������������������������������������������������������������������

loc_13983:				; CODE XREF: Player_MainUpdate+87Dj
		mov	al, 0

loc_13985:				; CODE XREF: Player_MainUpdate+881j
		or	al, al
		jz	short loc_139E2
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, es:[bx+27h]
		sar	eax, 8
		cmp	eax, 0
		jge	short loc_139B2
		mov	[bp+var_6], 0
		mov	eax, [bp+var_6]
		mov	es:[bx+27h], eax
		jmp	short loc_139D9
; ���������������������������������������������������������������������������

loc_139B2:				; CODE XREF: Player_MainUpdate+89Dj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, es:[bx+27h]
		sar	eax, 8
		cmp	eax, 10h
		jge	short loc_139D9
		mov	[bp+var_A], 100h
		mov	eax, [bp+var_A]
		add	es:[bx+27h], eax

loc_139D9:				; CODE XREF: Player_MainUpdate+8B0j
					; Player_MainUpdate+8C6j
		mov	[bp+var_1], 1

loc_139DD:
		mov	byte_70497, 1

loc_139E2:				; CODE XREF: Player_MainUpdate+887j
		cmp	byte_72DFB, 1
		jnz	short loc_139ED
		mov	al, 1
		jmp	short loc_139EF
; ���������������������������������������������������������������������������

loc_139ED:				; CODE XREF: Player_MainUpdate+8E7j
		mov	al, 0

loc_139EF:				; CODE XREF: Player_MainUpdate+8EBj
		or	al, al
		jz	short loc_13A4C

loc_139F3:
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, es:[bx+27h]
		sar	eax, 8
		cmp	eax, 0
		jle	short loc_13A1C
		mov	[bp+var_E], 0
		mov	eax, [bp+var_E]
		mov	es:[bx+27h], eax
		jmp	short loc_13A43
; ���������������������������������������������������������������������������

loc_13A1C:				; CODE XREF: Player_MainUpdate+907j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	eax, es:[bx+27h]
		sar	eax, 8
		cmp	eax, 0FFFFFFF0h
		jle	short loc_13A43
		mov	[bp+var_12], 100h
		mov	eax, [bp+var_12]
		sub	es:[bx+27h], eax

loc_13A43:				; CODE XREF: Player_MainUpdate+91Aj
					; Player_MainUpdate+930j
		mov	[bp+var_1], 1
		mov	byte_70497, 1

loc_13A4C:				; CODE XREF: Player_MainUpdate+8F1j
		mov	al, [bp+var_1]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13A6D
		mov	[bp+var_16], 0
		mov	eax, [bp+var_16]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+27h], eax

loc_13A6D:				; CODE XREF: Player_MainUpdate+953j
		les	bx, [bp+arg_0]
		cmp	word ptr es:[bx+4], 0FFFFh
		jnz	short loc_13A7A
		jmp	loc_13DEB
; ���������������������������������������������������������������������������

loc_13A7A:				; CODE XREF: Player_MainUpdate+975j
		cmp	byte_6D460, 0
		jnz	short loc_13A84
		jmp	loc_13DEB
; ���������������������������������������������������������������������������

loc_13A84:				; CODE XREF: Player_MainUpdate+97Fj
		mov	ax, es:[bx+4]
		mov	[bp+var_18], ax
		push	2
		mov	al, byte ptr [bp+var_18]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jz	short loc_13AA2
		jmp	loc_13B83
; ���������������������������������������������������������������������������

loc_13AA2:				; CODE XREF: Player_MainUpdate+99Dj
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		mov	word ptr [bp+var_2C], ax
		push	ax
		call	Joystick_GetAxisMax_67BD8
		pop	cx
		mov	[bp+var_2E], ax
		movsx	eax, [bp+var_2E]
		shl	eax, 8
		mov	[bp+var_2C+2], eax
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		mov	word ptr [bp+var_36+2],	ax
		push	ax
		call	Joystick_GetAxisMin_67BC9
		pop	cx
		mov	word ptr [bp+var_36], ax
		movsx	eax, word ptr [bp+var_36]
		shl	eax, 8
		mov	[bp+var_32], eax

loc_13AE4:
		mov	[bp+var_3A], 0

loc_13AEC:
		mov	eax, [bp+var_2C+2]

loc_13AF0:
		cmp	eax, [bp+var_3A]
		jz	short loc_13AFB
		mov	ax, 1
		jmp	short loc_13AFD
; ���������������������������������������������������������������������������

loc_13AFB:				; CODE XREF: Player_MainUpdate+9F4j
		xor	ax, ax

loc_13AFD:				; CODE XREF: Player_MainUpdate+9F9j
		or	al, al
		jnz	short loc_13B1E
		mov	[bp+var_3E], 0
		mov	eax, [bp+var_32]
		cmp	eax, [bp+var_3E]
		jz	short loc_13B18
		mov	ax, 1
		jmp	short loc_13B1A
; ���������������������������������������������������������������������������

loc_13B18:				; CODE XREF: Player_MainUpdate+A11j
		xor	ax, ax

loc_13B1A:				; CODE XREF: Player_MainUpdate+A16j
		or	al, al
		jz	short loc_13B23

loc_13B1E:				; CODE XREF: Player_MainUpdate+9FFj
		mov	byte_70497, 1

loc_13B23:				; CODE XREF: Player_MainUpdate+A1Cj
		mov	eax, [bp+var_2C+2]
		imul	eax, 10h
		mov	[bp+var_2C+2], eax
		mov	ebx, 20h ; ' '
		cdq
		idiv	ebx
		mov	[bp+var_2C+2], eax
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		mov	eax, [bp+var_32]
		imul	eax, 10h
		mov	[bp+var_32], eax
		mov	ebx, 20h ; ' '
		cdq
		idiv	ebx
		mov	[bp+var_32], eax
		mov	[bp+var_46], eax
		mov	eax, [bp+var_46]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+23h], eax
		jmp	short loc_13BAC
; ���������������������������������������������������������������������������

loc_13B83:				; CODE XREF: Player_MainUpdate+99Fj
		mov	[bp+var_1C], 0
		mov	eax, [bp+var_1C]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		mov	[bp+var_20], 0
		mov	eax, [bp+var_20]
		mov	es:[bx+23h], eax

loc_13BAC:				; CODE XREF: Player_MainUpdate+A81j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		mov	[bp+var_22], ax
		push	1
		mov	al, byte ptr [bp+var_22]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jz	short loc_13BFF
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		mov	[bp+var_24], ax
		push	2
		mov	al, byte ptr [bp+var_24]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13BFF
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jnz	short loc_13BFF
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		mov	byte_6E4C7, 1

loc_13BFF:				; CODE XREF: Player_MainUpdate+AC6j
					; Player_MainUpdate+AE4j ...
		cmp	word_72350, 4
		jz	short loc_13C09
		jmp	loc_13CDD
; ���������������������������������������������������������������������������

loc_13C09:				; CODE XREF: Player_MainUpdate+B04j
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+4]
		mov	[bp+var_26], ax
		push	2
		mov	al, byte ptr [bp+var_26]
		push	ax
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jz	short loc_13C5B
		push	word_72A8F
		mov	bx, word_72A8F
		mov	bx, [bx+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 4
		jnz	short loc_13C67
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, es:[bx+1Dh]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13C67
		or	byte ptr es:[bx+1Bh], 4
		or	byte ptr es:[bx+1Dh], 4
		jmp	short loc_13C67
; ���������������������������������������������������������������������������

loc_13C5B:				; CODE XREF: Player_MainUpdate+B23j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Dh], 0FBh

loc_13C67:				; CODE XREF: Player_MainUpdate+B36j
					; Player_MainUpdate+B4Dj ...
		push	1
		push	1
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jz	short loc_13C9A
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, es:[bx+1Dh]
		shr	ax, 3
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13CA6
		or	byte ptr es:[bx+1Bh], 40h
		or	byte ptr es:[bx+1Dh], 8
		jmp	short loc_13CA6
; ���������������������������������������������������������������������������

loc_13C9A:				; CODE XREF: Player_MainUpdate+B75j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Dh], 0F7h

loc_13CA6:				; CODE XREF: Player_MainUpdate+B8Cj
					; Player_MainUpdate+B98j
		push	2
		push	1
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		or	al, al
		jz	short loc_13CD1
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Dh], 10h
		push	4
		push	59CDh
		call	EntityTracker_SelectByStateCode
		add	sp, 4
		jmp	short loc_13CDD
; ���������������������������������������������������������������������������

loc_13CD1:				; CODE XREF: Player_MainUpdate+BB4j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Dh], 0EFh

loc_13CDD:				; CODE XREF: Player_MainUpdate+B06j
					; Player_MainUpdate+BCFj
		cmp	word_72350, 3
		jz	short loc_13CE7
		jmp	loc_14170
; ���������������������������������������������������������������������������

loc_13CE7:				; CODE XREF: Player_MainUpdate+BE2j
		push	1
		push	0
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4

loc_13CF3:
		mov	ah, 0
		mov	si, ax
		push	2
		push	0
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		add	si, ax
		push	1
		push	1
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		shl	ax, 2
		add	si, ax
		push	2
		push	1
		call	Joystick_TestButtonMasked_67B6C
		add	sp, 4
		mov	ah, 0
		shl	ax, 2
		add	si, ax
		cmp	si, 2
		jnz	short loc_13D68
		push	word_72A8F
		mov	bx, word_72A8F
		mov	bx, [bx+50h]
		call	dword ptr [bx+14h]
		pop	cx
		cmp	al, 4
		jnz	short loc_13D74
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, es:[bx+1Dh]
		shr	ax, 2
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13D74
		or	byte ptr es:[bx+1Dh], 4
		or	byte ptr es:[bx+1Bh], 4
		jmp	short loc_13D74
; ���������������������������������������������������������������������������

loc_13D68:				; CODE XREF: Player_MainUpdate+C30j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Dh], 0FBh

loc_13D74:				; CODE XREF: Player_MainUpdate+C43j
					; Player_MainUpdate+C5Aj ...
		cmp	si, 4
		jnz	short loc_13D9C
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, es:[bx+1Dh]
		shr	ax, 3
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13DA8
		or	byte ptr es:[bx+1Dh], 8
		or	byte ptr es:[bx+1Bh], 40h
		jmp	short loc_13DA8
; ���������������������������������������������������������������������������

loc_13D9C:				; CODE XREF: Player_MainUpdate+C77j
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Dh], 0F7h

loc_13DA8:				; CODE XREF: Player_MainUpdate+C8Ej
					; Player_MainUpdate+C9Aj
		cmp	si, 8
		jnz	short loc_13DDC
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	al, es:[bx+1Dh]
		shr	ax, 4
		and	ax, 1
		mov	ah, 0
		or	ax, ax
		jz	short loc_13DC7
		jmp	loc_14170
; ���������������������������������������������������������������������������

loc_13DC7:				; CODE XREF: Player_MainUpdate+CC2j
		or	byte ptr es:[bx+1Dh], 10h
		push	4
		push	59CDh
		call	EntityTracker_SelectByStateCode
		add	sp, 4
		jmp	loc_14170
; ���������������������������������������������������������������������������

loc_13DDC:				; CODE XREF: Player_MainUpdate+CABj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]

loc_13DE3:
		and	byte ptr es:[bx+1Dh], 0EFh
		jmp	loc_14170
; ���������������������������������������������������������������������������

loc_13DEB:				; CODE XREF: Player_MainUpdate+977j
					; Player_MainUpdate+981j
		cmp	byte_6D461, 0
		jnz	short loc_13DF5
		jmp	loc_13F44
; ���������������������������������������������������������������������������

loc_13DF5:				; CODE XREF: Player_MainUpdate+CF0j
		mov	byte ptr [bp+var_2E], 0
		lea	ax, [bp+var_2E]
		push	ax
		call	TextScroll_FormatAndApply_67204
		pop	cx
		cmp	byte ptr [bp+var_2E], 0
		jnz	short loc_13E2D
		lea	ax, [bp+var_2E]
		push	ax
		call	Input_ReadCombinedAxes
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_13E2B
		lea	ax, [bp+var_32]
		push	ax
		lea	ax, [bp+var_2E]
		push	ax
		call	Input_ReadAxis2Deadzone
		add	sp, 4
		jmp	short loc_13E2D
; ���������������������������������������������������������������������������

loc_13E2B:				; CODE XREF: Player_MainUpdate+D17j
		jmp	short $+2

loc_13E2D:				; CODE XREF: Player_MainUpdate+D07j
					; Player_MainUpdate+D29j
		call	Input_GetCalibratedYValue_67499
		sub	ax, word_6E473
		mov	bx, 3
		cwd
		idiv	bx
		shl	ax, 4
		mov	word ptr [bp+var_36+2],	ax
		movsx	eax, word ptr [bp+var_36+2]
		shl	eax, 8
		mov	[bp+var_3A+2], eax
		mov	[bp+var_3E+2], 2000h
		mov	eax, [bp+var_3A+2]
		mov	edx, eax
		mov	ecx, [bp+var_3E+2]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_42+2], eax
		mov	eax, [bp+var_42+2]
		mov	[bp+var_46+2], eax
		mov	[bp-48h], eax
		mov	eax, [bp-48h]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		call	Input_GetCalibratedXValue_67481
		sub	ax, word_6E471
		mov	bx, 0Ah
		cwd
		idiv	bx
		shl	ax, 4
		mov	word ptr [bp+var_4A], ax
		movsx	eax, word ptr [bp+var_4A]
		shl	eax, 8
		mov	[bp+var_4E], eax
		mov	[bp+var_52], 2000h
		mov	eax, [bp+var_4E]
		mov	edx, eax
		mov	ecx, [bp+var_52]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		mov	[bp+var_5A], eax
		mov	[bp+var_5E], eax
		mov	eax, [bp+var_5E]
		les	bx, [bp+arg_0]

loc_13EE4:
		les	bx, es:[bx+7]
		mov	es:[bx+23h], eax
		mov	eax, es:[bx+1Fh]
		sar	eax, 8
		cmp	eax, 0
		jnz	short loc_13F0B
		mov	eax, es:[bx+23h]
		sar	eax, 8
		cmp	eax, 0
		jz	short loc_13F10

loc_13F0B:				; CODE XREF: Player_MainUpdate+DFAj
		mov	byte_70497, 1

loc_13F10:				; CODE XREF: Player_MainUpdate+E09j
		mov	al, byte ptr [bp+var_28]
		mov	[bp+var_60], al
		test	[bp+var_60], 1
		jz	short loc_13F35
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		or	byte ptr es:[bx+1Bh], 2
		mov	byte_6E4C7, 1
		or	byte ptr es:[bx+1Dh], 20h
		jmp	loc_14170
; ���������������������������������������������������������������������������

loc_13F35:				; CODE XREF: Player_MainUpdate+E1Aj
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Dh], 0DFh
		jmp	loc_14170
; ���������������������������������������������������������������������������

loc_13F44:				; CODE XREF: Player_MainUpdate+CF2j
		cmp	byte_6D462, 0
		jnz	short loc_13F4E
		jmp	loc_14170
; ���������������������������������������������������������������������������

loc_13F4E:				; CODE XREF: Player_MainUpdate+E49j
		mov	byte ptr [bp+var_28+1],	0
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9]
		mov	dx, es:[bx+7]
		add	dx, 23h	; '#'
		mov	[bp+var_2E], ax
		mov	word ptr [bp+var_32+2],	dx
		les	bx, [bp+var_32+2]
		mov	eax, es:[bx]
		mov	[bp+var_2C], eax
		cmp	byte_72E15, 1
		jnz	short loc_13F7C
		mov	al, 1
		jmp	short loc_13F7E
; ���������������������������������������������������������������������������

loc_13F7C:				; CODE XREF: Player_MainUpdate+E76j
		mov	al, 0

loc_13F7E:				; CODE XREF: Player_MainUpdate+E7Aj
		or	al, al
		jz	short loc_13FCC
		cmp	[bp+var_2C], 0
		jge	short loc_13F8E
		mov	ax, 1
		jmp	short loc_13F90
; ���������������������������������������������������������������������������

loc_13F8E:				; CODE XREF: Player_MainUpdate+E87j
		xor	ax, ax

loc_13F90:				; CODE XREF: Player_MainUpdate+E8Cj
		or	al, al
		jz	short loc_13FA6
		mov	[bp+var_36+2], 0
		mov	eax, [bp+var_36+2]
		mov	[bp+var_2C], eax
		jmp	short loc_13FC3
; ���������������������������������������������������������������������������

loc_13FA6:				; CODE XREF: Player_MainUpdate+E92j
		cmp	[bp+var_2C], 1000h
		jge	short loc_13FB5
		mov	ax, 1
		jmp	short loc_13FB7
; ���������������������������������������������������������������������������

loc_13FB5:				; CODE XREF: Player_MainUpdate+EAEj
		xor	ax, ax

loc_13FB7:				; CODE XREF: Player_MainUpdate+EB3j
		or	al, al
		jz	short loc_13FC3
		add	[bp+var_2C], 100h

loc_13FC3:				; CODE XREF: Player_MainUpdate+EA4j
					; Player_MainUpdate+EB9j
		mov	byte ptr [bp+var_28+1],	1
		mov	byte_70497, 1

loc_13FCC:				; CODE XREF: Player_MainUpdate+E80j
		cmp	byte_72E13, 1
		jnz	short loc_13FD7
		mov	al, 1
		jmp	short loc_13FD9
; ���������������������������������������������������������������������������

loc_13FD7:				; CODE XREF: Player_MainUpdate+ED1j
		mov	al, 0

loc_13FD9:				; CODE XREF: Player_MainUpdate+ED5j
		or	al, al
		jz	short loc_14027
		cmp	[bp+var_2C], 0
		jle	short loc_13FE9
		mov	ax, 1
		jmp	short loc_13FEB
; ���������������������������������������������������������������������������

loc_13FE9:				; CODE XREF: Player_MainUpdate+EE2j
		xor	ax, ax

loc_13FEB:				; CODE XREF: Player_MainUpdate+EE7j
		or	al, al
		jz	short loc_14001
		mov	[bp+var_3A+2], 0
		mov	eax, [bp+var_3A+2]
		mov	[bp+var_2C], eax
		jmp	short loc_1401E
; ���������������������������������������������������������������������������

loc_14001:				; CODE XREF: Player_MainUpdate+EEDj
		cmp	[bp+var_2C], 0FFFFF000h
		jle	short loc_14010
		mov	ax, 1
		jmp	short loc_14012
; ���������������������������������������������������������������������������

loc_14010:				; CODE XREF: Player_MainUpdate+F09j
		xor	ax, ax

loc_14012:				; CODE XREF: Player_MainUpdate+F0Ej
		or	al, al
		jz	short loc_1401E
		sub	[bp+var_2C], 100h

loc_1401E:				; CODE XREF: Player_MainUpdate+EFFj
					; Player_MainUpdate+F14j
		mov	byte_70497, 1
		mov	byte ptr [bp+var_28+1],	1

loc_14027:				; CODE XREF: Player_MainUpdate+EDBj
		cmp	byte ptr [bp+var_28+1],	0
		jz	short loc_14047
		mov	eax, [bp+var_2C]
		mov	[bp+var_3E+2], eax
		mov	eax, [bp+var_3E+2]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+23h], eax
		jmp	short loc_1405F
; ���������������������������������������������������������������������������

loc_14047:				; CODE XREF: Player_MainUpdate+F2Bj
		mov	[bp+var_42+2], 0
		mov	eax, [bp+var_42+2]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+23h], eax

loc_1405F:				; CODE XREF: Player_MainUpdate+F45j
		mov	byte ptr [bp+var_42+1],	0
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+9]
		mov	dx, es:[bx+7]
		add	dx, 1Fh
		mov	word ptr [bp+var_4A+2],	ax
		mov	word ptr [bp+var_4A], dx
		les	bx, [bp+var_4A]
		mov	eax, es:[bx]
		mov	[bp+var_46], eax
		cmp	byte_72E18, 1
		jnz	short loc_1408D
		mov	al, 1
		jmp	short loc_1408F
; ���������������������������������������������������������������������������

loc_1408D:				; CODE XREF: Player_MainUpdate+F87j
		mov	al, 0

loc_1408F:				; CODE XREF: Player_MainUpdate+F8Bj
		or	al, al
		jz	short loc_140DD
		cmp	[bp+var_46], 0
		jge	short loc_1409F
		mov	ax, 1
		jmp	short loc_140A1
; ���������������������������������������������������������������������������

loc_1409F:				; CODE XREF: Player_MainUpdate+F98j
		xor	ax, ax

loc_140A1:				; CODE XREF: Player_MainUpdate+F9Dj
		or	al, al
		jz	short loc_140B7
		mov	[bp+var_4E], 0
		mov	eax, [bp+var_4E]
		mov	[bp+var_46], eax
		jmp	short loc_140D4
; ���������������������������������������������������������������������������

loc_140B7:				; CODE XREF: Player_MainUpdate+FA3j
		cmp	[bp+var_46], 1000h
		jge	short loc_140C6
		mov	ax, 1
		jmp	short loc_140C8
; ���������������������������������������������������������������������������

loc_140C6:				; CODE XREF: Player_MainUpdate+FBFj
		xor	ax, ax

loc_140C8:				; CODE XREF: Player_MainUpdate+FC4j
		or	al, al
		jz	short loc_140D4
		add	[bp+var_46], 100h

loc_140D4:				; CODE XREF: Player_MainUpdate+FB5j
					; Player_MainUpdate+FCAj
		mov	byte_70497, 1
		mov	byte ptr [bp+var_42+1],	1

loc_140DD:				; CODE XREF: Player_MainUpdate+F91j
		cmp	byte_72E10, 1
		jnz	short loc_140E8
		mov	al, 1
		jmp	short loc_140EA
; ���������������������������������������������������������������������������

loc_140E8:				; CODE XREF: Player_MainUpdate+FE2j
		mov	al, 0

loc_140EA:				; CODE XREF: Player_MainUpdate+FE6j
		or	al, al
		jz	short loc_14138
		cmp	[bp+var_46], 0
		jle	short loc_140FA
		mov	ax, 1
		jmp	short loc_140FC
; ���������������������������������������������������������������������������

loc_140FA:				; CODE XREF: Player_MainUpdate+FF3j
		xor	ax, ax

loc_140FC:				; CODE XREF: Player_MainUpdate+FF8j
		or	al, al
		jz	short loc_14112
		mov	[bp+var_52], 0
		mov	eax, [bp+var_52]
		mov	[bp+var_46], eax
		jmp	short loc_1412F
; ���������������������������������������������������������������������������

loc_14112:				; CODE XREF: Player_MainUpdate+FFEj
		cmp	[bp+var_46], 0FFFFF000h
		jle	short loc_14121
		mov	ax, 1
		jmp	short loc_14123
; ���������������������������������������������������������������������������

loc_14121:				; CODE XREF: Player_MainUpdate+101Aj
		xor	ax, ax

loc_14123:				; CODE XREF: Player_MainUpdate+101Fj
		or	al, al
		jz	short loc_1412F
		sub	[bp+var_46], 100h

loc_1412F:				; CODE XREF: Player_MainUpdate+1010j
					; Player_MainUpdate+1025j
		mov	byte_70497, 1
		mov	byte ptr [bp+var_42+1],	1

loc_14138:				; CODE XREF: Player_MainUpdate+FECj
		cmp	byte ptr [bp+var_42+1],	0
		jz	short loc_14158
		mov	eax, [bp+var_46]
		mov	[bp+var_56], eax
		mov	eax, [bp+var_56]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax
		jmp	short loc_14170
; ���������������������������������������������������������������������������

loc_14158:				; CODE XREF: Player_MainUpdate+103Cj
		mov	[bp+var_5A], 0
		mov	eax, [bp+var_5A]
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	es:[bx+1Fh], eax

loc_14170:				; CODE XREF: Player_MainUpdate:loc_131E6j
					; Player_MainUpdate+BE4j ...
		pop	si
		leave
		retf
Player_MainUpdate	endp

; ���������������������������������������������������������������������������
off_14173	dw offset loc_132FE	; DATA XREF: Player_MainUpdate+104r
		dw offset loc_1330D	; jump table for switch	statement
		dw offset loc_1331C
		dw offset loc_1332B
		dw offset loc_1333A
		dw offset loc_13349
		dw offset loc_13358
		dw offset loc_13367
		dw offset loc_13376
		dw offset loc_13385
		dw offset loc_133AC
		dw offset loc_13394
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_133C4
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_1349C
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_1367D
		dw offset loc_13949
		dw offset loc_13956
		dw offset loc_13589
		dw offset loc_1357A
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_13659
		dw offset loc_1355C
		dw offset loc_1356B
		dw offset loc_132EF
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_13209
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_13956
		dw offset loc_135F2
		dw offset loc_1391C
; ���������������������������������������������������������������������������

loc_141D3:				; DATA XREF: seg339:0378o
		push	bp
		mov	bp, sp
		sub	sp, 2
		les	bx, [bp+6]
		cmp	word ptr es:[bx+27h], 0
		jz	short loc_141E8
		mov	ax, 1
		jmp	short loc_141EA
; ���������������������������������������������������������������������������

loc_141E8:				; CODE XREF: seg011:11F1j
		xor	ax, ax

loc_141EA:				; CODE XREF: seg011:11F6j
		mov	ah, 0
		or	ax, ax
		jnz	short loc_1422E
		les	bx, [bp+6]
		mov	ax, es:[bx+2]
		mov	[bp-2],	ax
		push	ax
		mov	ax, [bp+6]
		add	ax, 1Ah
		push	word ptr [bp+8]
		push	ax
		call	VROOMM_StubThunk_6B63A
		add	sp, 6
		les	bx, [bp+6]
		mov	bx, es:[bx+2]
		push	word ptr [bx+51h]
		mov	bx, [bp+6]
		mov	bx, es:[bx+2]
		mov	bx, [bx+51h]
		mov	bx, [bx]
		call	dword ptr [bx+48h]
		pop	cx
		les	bx, [bp+6]
		mov	es:[bx+0Bh], ax

loc_1422E:				; CODE XREF: seg011:11FEj
		les	bx, [bp+6]
		cmp	dword ptr es:[bx+0Dh], 0
		jnz	short loc_14260
		push	word ptr [bp+8]
		push	bx
		push	cs
		call	near ptr Player_MainUpdate
		add	sp, 4
		cmp	byte_6E33B, 0
		jz	short loc_14275
		les	bx, [bp+6]
		les	bx, es:[bx+7]
		cmp	byte ptr es:[bx+1Eh], 0
		jz	short loc_14275
		mov	byte ptr es:[bx+1Eh], 2
		jmp	short loc_14275
; ���������������������������������������������������������������������������

loc_14260:				; CODE XREF: seg011:1247j
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+0Dh]
		les	bx, es:[bx+0Dh]
		mov	bx, es:[bx]

loc_1426F:
		call	dword ptr [bx+0Ch]
		add	sp, 4

loc_14275:				; CODE XREF: seg011:1259j seg011:1267j ...
		mov	al, 1
		leave
		retf
seg011		ends
