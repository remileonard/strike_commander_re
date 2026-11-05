seg094		segment	para public 'CODE' use16
		assume cs:seg094
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 9Ah, 73h, 28h, 0CFh, 56h, 83h, 0C4h, 4, 5Dh, 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B45A		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3B45A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B462		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 2
		pop	bp
		retf
sub_3B462		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B46C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	ax, 68E2h
		pop	bp
		retf
sub_3B46C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B477		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		cmp	word ptr [si+2Dh], 0
		jnz	short loc_3B492
		jmp	loc_3B52C

loc_3B492:
		mov	si, [si+2Dh]
		add	si, 2
		mov	eax, [si]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	eax, [si+4]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [si+8]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		cmp	word ptr [bp+var_4], 0
		jz	short loc_3B4F9
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3B504

loc_3B4F9:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_3B504:
		or	ax, ax
		jz	short loc_3B524
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_C]
		mov	[bx], eax
		mov	eax, [bp+var_14]
		mov	[bx+4], eax
		mov	eax, [bp+var_1C]
		mov	[bx+8], eax
		jmp	short loc_3B524

loc_3B524:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3B568

loc_3B52C:
		cmp	word ptr [bp+var_4], 0
		jz	short loc_3B537
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3B542

loc_3B537:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_3B542:
		or	ax, ax
		jz	short loc_3B562
		mov	bx, word ptr [bp+var_4]
		mov	eax, dword_79CEC
		mov	[bx], eax
		mov	eax, dword_79CF0
		mov	[bx+4], eax
		mov	eax, dword_79CF4
		mov	[bx+8], eax
		jmp	short loc_3B562

loc_3B562:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_3B568:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_3B477		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B571		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		cmp	word ptr [si+2Dh], 0
		jz	short loc_3B5CC
		mov	si, [si+2Dh]
		add	si, 2
		cmp	word ptr [bp+var_4], 0
		jz	short loc_3B59A
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3B5A5

loc_3B59A:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_3B5A5:
		or	ax, ax
		jz	short loc_3B5C4
		mov	eax, [si]
		mov	bx, word ptr [bp+var_4]
		mov	[bx], eax
		mov	eax, [si+4]
		mov	[bx+4], eax
		mov	eax, [si+8]
		mov	[bx+8], eax
		jmp	short loc_3B5C4

loc_3B5C4:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3B608

loc_3B5CC:
		cmp	word ptr [bp+var_4], 0
		jz	short loc_3B5D7
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3B5E2

loc_3B5D7:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_3B5E2:
		or	ax, ax
		jz	short loc_3B602
		mov	bx, word ptr [bp+var_4]
		mov	eax, dword_79CEC
		mov	[bx], eax
		mov	eax, dword_79CF0
		mov	[bx+4], eax
		mov	eax, dword_79CF4
		mov	[bx+8], eax
		jmp	short loc_3B602

loc_3B602:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_3B608:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_3B571		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B611		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3B611		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B619		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+2Dh], 0
		jnz	short loc_3B630
		jmp	loc_3B6C1

loc_3B630:
		mov	eax, [di]
		mov	edx, dword_79778
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [di+4]
		mov	edx, dword_79778
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [di+8]
		mov	edx, dword_79778
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	bx, [si+2Dh]
		mov	eax, [bp+var_24]
		mov	[bx+2], eax
		mov	eax, [bp+var_20]
		mov	[bx+6], eax
		mov	eax, [bp+var_1C]
		mov	[bx+0Ah], eax
		mov	ax, [si+2Dh]
		add	ax, 2
		jmp	short loc_3B6C1

loc_3B6C1:
		pop	di
		pop	si
		leave
		retf
sub_3B619		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B6C5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+2Dh], 0
		jz	short loc_3B6F8
		mov	eax, [di]
		mov	bx, [si+2Dh]
		mov	[bx+2], eax
		mov	eax, [di+4]
		mov	[bx+6], eax
		mov	eax, [di+8]
		mov	[bx+0Ah], eax
		mov	ax, [si+2Dh]
		add	ax, 2
		jmp	short loc_3B6F8

loc_3B6F8:
		pop	di
		pop	si
		pop	bp
		retf
sub_3B6C5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B6FC		proc far

var_C		= word ptr -0Ch
var_8		= word ptr -8
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	ss
		lea	ax, [bp+var_C]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+48h]
		add	sp, 6
		lea	ax, [bp+var_4]
		push	ax
		lea	ax, [bp+var_8]
		push	ax
		lea	ax, [bp+var_C]
		push	ax
		push	si
		call	WorldObject_TranslateBy_36A6C
		add	sp, 8
		pop	si
		leave
		retf
sub_3B6FC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 4 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_NotifyFollowTarget (sub_3CF1D de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,36L — teste
; l'état détruit (sub_3800A) ; si vivant, notifie la caméra de suivi associée (+0x2C,
; vtable[0x3C]) : notification de mise à jour à la caméra de suivi attachée à un objet.
; ==============================================================================================
Camera_NotifyFollowTarget		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	sub_36D52
		pop	cx
		or	al, al
		jz	short loc_3B756
		cmp	word ptr [si+2Dh], 0
		jz	short loc_3B752
		push	word ptr [si+2Dh]
		mov	bx, [si+2Dh]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		jmp	short loc_3B752

loc_3B752:
		mov	al, 1
		jmp	short loc_3B758

loc_3B756:
		mov	al, 0

loc_3B758:
		pop	si
		pop	bp
		retf
Camera_NotifyFollowTarget		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B75B		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3B75B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B763		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 3
		pop	bp
		retf
sub_3B763		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B76D		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		cmp	word ptr [si+52h], 0
		jz	short loc_3B79F
		push	word ptr [si+52h]
		push	large [bp+var_4]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3B7DB

loc_3B79F:
		cmp	word ptr [bp+var_4], 0
		jz	short loc_3B7AA
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3B7B5

loc_3B7AA:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_3B7B5:
		or	ax, ax
		jz	short loc_3B7D5
		mov	bx, word ptr [bp+var_4]
		mov	eax, dword_79CEC
		mov	[bx], eax
		mov	eax, dword_79CF0
		mov	[bx+4], eax
		mov	eax, dword_79CF4
		mov	[bx+8], eax
		jmp	short loc_3B7D5

loc_3B7D5:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_3B7DB:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_3B76D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B7E4		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+52h], 0
		jz	short loc_3B80B
		push	ax
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+28h]
		add	sp, 4
		jmp	short loc_3B80B

loc_3B80B:
		pop	si
		leave
		retf
sub_3B7E4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B80E		proc far

var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 1Ch
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		cmp	word ptr [si+52h], 0
		jnz	short loc_3B829
		jmp	loc_3B8C3

loc_3B829:
		mov	si, [si+52h]
		add	si, 2
		mov	eax, [si]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_8], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_C], eax
		mov	eax, [si+4]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_14], eax
		mov	eax, [si+8]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		cmp	word ptr [bp+var_4], 0
		jz	short loc_3B890
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3B89B

loc_3B890:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_3B89B:
		or	ax, ax
		jz	short loc_3B8BB
		mov	bx, word ptr [bp+var_4]
		mov	eax, [bp+var_C]
		mov	[bx], eax
		mov	eax, [bp+var_14]
		mov	[bx+4], eax
		mov	eax, [bp+var_1C]
		mov	[bx+8], eax
		jmp	short loc_3B8BB

loc_3B8BB:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3B8FF

loc_3B8C3:
		cmp	word ptr [bp+var_4], 0
		jz	short loc_3B8CE
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3B8D9

loc_3B8CE:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_3B8D9:
		or	ax, ax
		jz	short loc_3B8F9
		mov	bx, word ptr [bp+var_4]
		mov	eax, dword_79CEC
		mov	[bx], eax
		mov	eax, dword_79CF0
		mov	[bx+4], eax
		mov	eax, dword_79CF4
		mov	[bx+8], eax
		jmp	short loc_3B8F9

loc_3B8F9:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_3B8FF:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_3B80E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B908		proc far

var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 24h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+52h], 0
		jnz	short loc_3B91F
		jmp	loc_3B9B0

loc_3B91F:
		mov	eax, [di]
		mov	edx, dword_79778
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [di+4]
		mov	edx, dword_79778
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [di+8]
		mov	edx, dword_79778
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_24], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	bx, [si+52h]
		mov	eax, [bp+var_24]
		mov	[bx+2], eax
		mov	eax, [bp+var_20]
		mov	[bx+6], eax
		mov	eax, [bp+var_1C]
		mov	[bx+0Ah], eax
		mov	ax, [si+52h]
		add	ax, 2
		jmp	short loc_3B9B0

loc_3B9B0:
		pop	di
		pop	si
		leave
		retf
sub_3B908		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3B9B4		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		cmp	word ptr [si+52h], 0
		jz	short loc_3B9E6
		push	word ptr [si+52h]
		push	large [bp+var_4]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+2Ch]
		add	sp, 6
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3BA22

loc_3B9E6:
		cmp	word ptr [bp+var_4], 0
		jz	short loc_3B9F1
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3B9FC

loc_3B9F1:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_3B9FC:
		or	ax, ax
		jz	short loc_3BA1C
		mov	bx, word ptr [bp+var_4]
		mov	eax, dword_79CEC
		mov	[bx], eax
		mov	eax, dword_79CF0
		mov	[bx+4], eax
		mov	eax, dword_79CF4
		mov	[bx+8], eax
		jmp	short loc_3BA1C

loc_3BA1C:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_3BA22:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_3B9B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3BA2B		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		cmp	word ptr [si+52h], 0
		jz	short loc_3BA52
		push	ax
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short loc_3BA52

loc_3BA52:
		pop	si
		leave
		retf
sub_3BA2B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3BA55		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		cmp	word ptr [si+52h], 0
		jz	short loc_3BAB0
		mov	si, [si+52h]
		add	si, 2
		cmp	word ptr [bp+var_4], 0
		jz	short loc_3BA7E
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3BA89

loc_3BA7E:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_3BA89:
		or	ax, ax
		jz	short loc_3BAA8
		mov	eax, [si]
		mov	bx, word ptr [bp+var_4]
		mov	[bx], eax
		mov	eax, [si+4]
		mov	[bx+4], eax
		mov	eax, [si+8]
		mov	[bx+8], eax
		jmp	short loc_3BAA8

loc_3BAA8:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3BAEC

loc_3BAB0:
		cmp	word ptr [bp+var_4], 0
		jz	short loc_3BABB
		mov	ax, word ptr [bp+var_4]
		jmp	short loc_3BAC6

loc_3BABB:
		push	0Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	word ptr [bp+var_4], ax

loc_3BAC6:
		or	ax, ax
		jz	short loc_3BAE6
		mov	bx, word ptr [bp+var_4]
		mov	eax, dword_79CEC
		mov	[bx], eax
		mov	eax, dword_79CF0
		mov	[bx+4], eax
		mov	eax, dword_79CF4
		mov	[bx+8], eax
		jmp	short loc_3BAE6

loc_3BAE6:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_3BAEC:
		mov	dx, word ptr [bp+arg_0+2]
		mov	ax, word ptr [bp+arg_0]
		pop	si
		leave
		retf
sub_3BA55		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3BAF5		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		cmp	word ptr [si+52h], 0
		jz	short loc_3BB28
		mov	eax, [di]
		mov	bx, [si+52h]
		mov	[bx+2], eax
		mov	eax, [di+4]
		mov	[bx+6], eax
		mov	eax, [di+8]
		mov	[bx+0Ah], eax
		mov	ax, [si+52h]
		add	ax, 2
		jmp	short loc_3BB28

loc_3BB28:
		pop	di
		pop	si
		pop	bp
		retf
sub_3BAF5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 21 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à WorldObject_IntegrateBodyMotion_3D31D (sub_3D31D de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; LUE INTEGRALEMENT (2026-09-25). Ex-'Camera_ComputeMountedPosition' (FAUX). INTEGRATION DU
; MOUVEMENT de l'objet monde, methode +0x14 (pour l'avion : loc_3E115, vtable seg339
; off_6F880). (1) POSITION : WorldObject_TranslateBy_37D54(objet, vitesse du corps (+0x51 ->
; +8) * dword_7045E). (2) ORIENTATION : Omega = corps->vtable+0x2C (pour JDYN : thunk
; loc_3B6DC -> loc_46B74 = copie de JDYN+4/+8/+0x0C, la vitesse angulaire) ;
; objet->vtable+0x30(Omega * dword_70458) (avion :
; WorldObject_ComposeOrientationAngleArray_3CB0B, rotation de l'orientation par ces
; increments) ; puis avec theta = Omega.c1 * dt : Omega.c2' = Omega.c2 cos + Omega.c0 sin,
; Omega.c0' = Omega.c0 cos - Omega.c2 sin (Math_CosRaw_580A7 / Math_SinRaw_58063 /
; Math_FixedMultiply_58034) ; corps->vtable+0x30(Omega') (JDYN : loc_3B6C5 -> loc_46BC0, ecrit
; JDYN+4/+8/+0x0C). Sans corps : vecteur nul (dword_707F8..70800). dword_7045E (position) et
; dword_70458 (rotation) sont IDENTIQUES : Frame_UpdateTimingAndNotifyTrackedObjects_500F6
; fait toujours dword_7045E = dword_70458 en sortie (loc_50399).
; ==============================================================================================
WorldObject_IntegrateBodyMotion_3BB2C		proc far

var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= dword ptr -1Ch
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 68h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	word ptr [si+52h], 0
		jz	short loc_3BBB8
		mov	di, [si+52h]
		add	di, 2
		mov	eax, [di]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [di+4]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [di+8]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_48], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_50]
		jmp	short loc_3BBD5

loc_3BBB8:
		mov	eax, dword_79CEC
		mov	[bp+var_50], eax
		mov	eax, dword_79CF0
		mov	[bp+var_4C], eax
		mov	eax, dword_79CF4
		mov	[bp+var_48], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_50]

loc_3BBD5:
		lea	ax, word ptr [bp+var_48]
		push	ax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	si
		call	WorldObject_TranslateBy_36A6C
		add	sp, 8
		cmp	word ptr [si+52h], 0
		jz	short loc_3BC0A
		push	word ptr [si+52h]
		push	ss
		lea	ax, word ptr [bp+var_5C]
		push	ax
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+2Ch]
		add	sp, 6
		mov	dx, ss
		lea	ax, word ptr [bp+var_5C]
		jmp	short loc_3BC27

loc_3BC0A:
		mov	eax, dword_79CEC
		mov	[bp+var_5C], eax
		mov	eax, dword_79CF0
		mov	[bp+var_58], eax
		mov	eax, dword_79CF4
		mov	[bp+var_54], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_5C]

loc_3BC27:
		mov	eax, [bp+var_54]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_5C]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_58]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_54]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_38]
		mov	[bp+var_60], eax
		lea	di, word ptr [bp+var_20]
		mov	eax, [di]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_40], eax
		mov	[bp+var_44], eax
		push	eax
		call	sub_59E37
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_44], eax
		push	large [bp+var_40]
		call	Math_CosRaw_59E7D
		push	dx
		push	ax
		pop	eax
		add	sp, 4
		mov	[bp+var_40], eax
		mov	eax, [bp+var_20]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		push	large [bp+var_44]
		push	large [bp+var_1C]
		call	Math_FixedMultiply_59E08
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		add	[bp+var_20], eax
		mov	eax, [bp+var_1C]
		mov	edx, [bp+var_40]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		push	large [bp+var_44]
		push	large [bp+var_3C]
		call	Math_FixedMultiply_59E08
		push	dx
		push	ax
		pop	eax
		add	sp, 8
		sub	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_68]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+30h]
		add	sp, 4
		mov	eax, [bp+var_1C]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_54], eax
		cmp	word ptr [si+52h], 0
		jz	short loc_3BD71
		lea	ax, word ptr [bp+var_5C]
		push	ax
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+30h]
		add	sp, 4
		jmp	short loc_3BD71

loc_3BD71:
		pop	di
		pop	si
		leave
		retf
WorldObject_IntegrateBodyMotion_3BB2C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SmokeTrail_EnableIfModelHasSmok_3D566 (sub_3D566 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; ALLUME LA TRAÎNÉE DE FUMÉE D'UN OBJET (ex-Camera_EnableFollowIfActive, aucun rapport avec
; une caméra) : instance +0x53 = 1 si le modèle (+0x0E) a un chunk SMOK (modèle +0x38 ≠ 0).
; Appelée notamment par Debris_SpawnOrchestratorVariant_9D770 juste après
; World_OnObjectDestroyed_53A94 (l'objet détruit se met à fumer ; son type de fumée +0x54 y
; est remplacé), par Collision_OnTerrainContact_9D910 et par deux fonctions PlayerComponent
; (seg434/seg438).
; ==============================================================================================
SmokeTrail_EnableIfModelHasSmok_3BD75		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		les	bx, [si+0Eh]
		cmp	byte ptr es:[bx+4Bh], 0
		jz	short loc_3BD8A
		mov	byte ptr [si+58h], 1

loc_3BD8A:
		pop	si
		pop	bp
		retf
SmokeTrail_EnableIfModelHasSmok_3BD75		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3BD8D		proc far

var_F2		= dword ptr -0F2h
var_E8		= dword ptr -0E8h
var_E4		= dword ptr -0E4h
var_E0		= dword ptr -0E0h
var_DC		= dword ptr -0DCh
var_D8		= dword ptr -0D8h
var_D4		= dword ptr -0D4h
var_D0		= dword ptr -0D0h
var_CC		= dword ptr -0CCh
var_C8		= dword ptr -0C8h
var_C4		= dword ptr -0C4h
var_C0		= dword ptr -0C0h
var_BC		= dword ptr -0BCh
var_B8		= dword ptr -0B8h
var_B4		= dword ptr -0B4h
var_B0		= dword ptr -0B0h
var_AC		= dword ptr -0ACh
var_A8		= dword ptr -0A8h
var_A4		= dword ptr -0A4h
var_A0		= dword ptr -0A0h
var_9C		= dword ptr -9Ch
var_98		= dword ptr -98h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_74		= dword ptr -74h
var_70		= dword ptr -70h
var_6C		= dword ptr -6Ch
var_68		= dword ptr -68h
var_64		= dword ptr -64h
var_60		= dword ptr -60h
var_5C		= dword ptr -5Ch
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= dword ptr -50h
var_4C		= dword ptr -4Ch
var_48		= dword ptr -48h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= dword ptr -3Ch
var_38		= dword ptr -38h
var_34		= dword ptr -34h
var_30		= dword ptr -30h
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= dword ptr -24h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0E8h
		push	si
		push	di
		mov	si, [bp+arg_0]
		cmp	byte ptr [si+58h], 0
		jnz	short loc_3BDA2
		jmp	loc_3C219

loc_3BDA2:
		cmp	word_79797, 0
		jnz	short loc_3BDAC
		jmp	loc_3C219

loc_3BDAC:
		cmp	word ptr [si+52h], 0
		jz	short loc_3BE2D
		mov	di, [si+52h]
		add	di, 2
		mov	eax, [di]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_4], eax
		mov	eax, [bp+var_4]
		mov	[bp+var_8], eax
		mov	eax, [di+4]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C], eax
		mov	eax, [bp+var_C]
		mov	[bp+var_10], eax
		mov	eax, [di+8]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax
		mov	eax, [bp+var_8]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_50], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_58]
		jmp	short loc_3BE4A

loc_3BE2D:
		mov	eax, dword_79CEC
		mov	[bp+var_58], eax
		mov	eax, dword_79CF0
		mov	[bp+var_54], eax
		mov	eax, dword_79CF4
		mov	[bp+var_50], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_58]

loc_3BE4A:
		mov	ax, [si+10h]
		mov	dx, [si+0Eh]
		add	dx, 4Dh
		mov	[bp+var_1A], ax
		mov	[bp+var_1C], dx
		les	di, [bp+var_1C]
		mov	eax, es:[di]
		mov	[bp+var_64], eax
		mov	eax, es:[di+4]
		mov	[bp+var_60], eax
		mov	eax, es:[di+8]
		mov	[bp+var_5C], eax
		cmp	[bp+var_64], 0
		jnz	short loc_3BE82
		mov	ax, 1
		jmp	short loc_3BE84

loc_3BE82:
		xor	ax, ax

loc_3BE84:
		or	al, al
		jnz	short loc_3BE8B
		jmp	loc_3BFCF

loc_3BE8B:
		cmp	[bp+var_5C], 0
		jnz	short loc_3BE97
		mov	ax, 1
		jmp	short loc_3BE99

loc_3BE97:
		xor	ax, ax

loc_3BE99:
		or	al, al
		jnz	short loc_3BEA0
		jmp	loc_3BFCF

loc_3BEA0:
		mov	di, si
		add	di, 39h
		mov	eax, [di]
		mov	edx, [bp+var_60]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_20], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_24], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_60]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_28], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_2C], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_60]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_30], eax
		mov	eax, [bp+var_30]
		mov	[bp+var_34], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_2C]
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_68], eax
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		add	eax, [bp+var_70]
		mov	[bp+var_7C], eax
		mov	eax, [di+4]
		add	eax, [bp+var_6C]
		mov	[bp+var_78], eax
		mov	eax, [di+8]
		add	eax, [bp+var_68]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_84], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_80], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_4C]
		add	eax, [bp+var_58]
		mov	[bp+var_94], eax
		mov	eax, [bp+var_48]
		add	eax, [bp+var_54]
		mov	[bp+var_90], eax
		mov	eax, [bp+var_44]
		add	eax, [bp+var_50]
		mov	[bp+var_8C], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_8C]
		mov	[bp+var_98], eax
		mov	eax, [bp+var_A0]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_38], eax
		jmp	loc_3C18C

loc_3BFCF:
		mov	ax, si
		add	ax, 2Dh
		mov	word ptr [bp+var_20+2], ax
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		cmp	word ptr [si+52h], 0
		jz	short loc_3C007
		push	word ptr [si+52h]
		push	ss
		lea	ax, word ptr [bp+var_94]
		push	ax
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+24h]
		add	sp, 6
		mov	dx, ss
		lea	ax, word ptr [bp+var_94]
		jmp	short loc_3C028

loc_3C007:
		mov	eax, dword_79CEC
		mov	[bp+var_94], eax
		mov	eax, dword_79CF0
		mov	[bp+var_90], eax
		mov	eax, dword_79CF4
		mov	[bp+var_8C], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_94]

loc_3C028:
		lea	ax, word ptr [bp+var_94]
		push	ax
		lea	ax, word ptr [bp+var_88]
		push	ax
		call	WorldObject_BuildOrientationMatrix_58C53
		add	sp, 4
		mov	eax, [bp+var_64]
		mov	[bp+var_A0], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_98], eax
		mov	ax, si
		add	ax, 2Dh
		push	ax
		lea	ax, word ptr [bp+var_64]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		add	eax, [bp+var_64]
		mov	[bp+var_AC], eax
		mov	eax, [di+4]
		add	eax, [bp+var_60]
		mov	[bp+var_A8], eax
		mov	eax, [di+8]
		add	eax, [bp+var_5C]
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_B8], eax
		mov	eax, [bp+var_A8]
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_B0], eax
		mov	eax, [bp+var_B8]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_B4]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_B0]
		mov	[bp+var_44], eax
		lea	ax, word ptr [bp+var_88]
		push	ax
		lea	ax, word ptr [bp+var_A0]
		push	ax
		call	sub_5A629
		add	sp, 4
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		add	eax, [bp+var_A0]
		mov	[bp+var_C4], eax
		mov	eax, [di+4]
		add	eax, [bp+var_9C]
		mov	[bp+var_C0], eax
		mov	eax, [di+8]
		add	eax, [bp+var_98]
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_C4]
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_C0]
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_D0]
		add	eax, [bp+var_58]
		mov	[bp+var_DC], eax
		mov	eax, [bp+var_CC]
		add	eax, [bp+var_54]
		mov	[bp+var_D8], eax
		mov	eax, [bp+var_C8]
		add	eax, [bp+var_50]
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_DC]
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_D8]
		mov	[bp+var_E4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_E8]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_E4]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_E0]
		mov	[bp+var_38], eax

loc_3C18C:
		push	large [si+0Eh]
		les	bx, [si+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 18h
		jz	short loc_3C1C8
		push	large [si+0Eh]
		les	bx, [si+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 17h
		jz	short loc_3C1C8
		push	large [si+0Eh]
		les	bx, [si+0Eh]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		cmp	al, 1Ah
		jnz	short loc_3C1F1

loc_3C1C8:
		push	si
		sub	sp, 4
		mov	eax, dword_7976E
		mov	[bp+var_F2], eax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		mov	al, [si+59h]
		mov	ah, 0
		push	ax
		push	word_79797
		call	sub_4D6FB
		add	sp, 0Eh
		jmp	short loc_3C219

loc_3C1F1:
		push	0
		sub	sp, 4
		mov	eax, dword_7976E
		mov	[bp+var_F2], eax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		lea	ax, word ptr [bp+var_40]
		push	ax
		mov	al, [si+59h]
		mov	ah, 0
		push	ax
		push	word_79797
		call	sub_4D6FB
		add	sp, 0Eh

loc_3C219:
		pop	di
		pop	si
		leave
		retf
sub_3BD8D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C21D		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	StreamReader_DestructWrapper_3B3C6
		pop	cx
		or	al, al
		jz	short loc_3C24F
		cmp	word ptr [si+52h], 0
		jz	short loc_3C243
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		jmp	short loc_3C243

loc_3C243:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+90h]
		pop	cx
		mov	al, 1
		jmp	short loc_3C251

loc_3C24F:
		mov	al, 0

loc_3C251:
		pop	si
		pop	bp
		retf
sub_3C21D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C254		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		pop	bp
		retf
sub_3C254		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C25C		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 4
		pop	bp
		retf
sub_3C25C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C266		proc far

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
		call	StreamReader_DestructWrapper_3B3C6
		pop	cx
		or	al, al
		jnz	short loc_3C27E
		jmp	loc_3C343

loc_3C27E:
		cmp	byte_76E24, 0
		jz	short loc_3C2C2
		cmp	dword ptr [si+5Ah], 0
		jz	short loc_3C29E
		push	large [si+5Ah]
		les	bx, [si+5Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_3C2A2

loc_3C29E:
		xor	dx, dx
		xor	ax, ax

loc_3C2A2:
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		cmp	word ptr [si+52h], 0
		jz	short loc_3C2C0
		push	dx
		push	ax
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 6
		jmp	short loc_3C337

loc_3C2C0:
		jmp	short loc_3C337

loc_3C2C2:
		cmp	byte ptr [si+5Eh], 0
		jz	short loc_3C2E3
		cmp	dword ptr [si+5Ah], 0
		jz	short loc_3C2E1
		push	large [si+5Ah]
		les	bx, [si+5Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_3C337

loc_3C2E1:
		jmp	short loc_3C337

loc_3C2E3:
		cmp	dword ptr [si+5Ah], 0
		jz	short loc_3C2FC
		push	large [si+5Ah]
		les	bx, [si+5Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_3C2FC

loc_3C2FC:
		cmp	dword ptr [si+5Ah], 0
		jz	short loc_3C315
		push	large [si+5Ah]
		les	bx, [si+5Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+8]
		add	sp, 4
		jmp	short loc_3C319

loc_3C315:
		xor	dx, dx
		xor	ax, ax

loc_3C319:
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		cmp	word ptr [si+52h], 0
		jz	short loc_3C337
		push	dx
		push	ax
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+40h]
		add	sp, 6
		jmp	short loc_3C337

loc_3C337:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+90h]
		pop	cx
		mov	al, 1
		jmp	short loc_3C345

loc_3C343:
		mov	al, 0

loc_3C345:
		pop	si
		leave
		retf
sub_3C266		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C348		proc far
		push	bp
		mov	bp, sp
		mov	al, 2
		pop	bp
		retf
sub_3C348		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C34F		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_3C3B2
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1EACh
		cmp	word ptr es:[bx+48h], 0
		jz	short loc_3C383
		push	3
		push	word ptr es:[bx+48h]
		mov	bx, es:[bx+48h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_3C383

loc_3C383:
		push	0
		push	large [bp+arg_0]
		call	sub_741D9
		add	sp, 6
		test	si, 1
		jz	short loc_3C3B2
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_3C3B2:
		pop	si
		leave
		retf
sub_3C34F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Widget_SetFlagBit0_F898 (sub_F898 de OPTEST.EXE).
; Résumé repris de OPTEST.EXE ; appelants et contexte à revérifier ici. — Reprise de
; STRIKE.EXE : code identique instruction par instruction à Widget_SetFlagBit0_A127B
; (sub_A127B de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, pose le bit 0 du champ de flags (+0x10) d'un widget.
; ==============================================================================================
Widget_SetFlagBit0_3C3B5		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	byte ptr [si+2], 4
		pop	si
		pop	bp
		retf
Widget_SetFlagBit0_3C3B5		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C3C3		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		call	sub_36985
		add	sp, 6
		push	si
		push	cs
		call	near ptr Widget_SetFlagBit0_3C3B5
		pop	cx
		pop	si
		pop	bp
		retf
sub_3C3C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C3E0		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3C423
		mov	word ptr [si], 20ECh
		cmp	word ptr [si+2Dh], 0
		jz	short loc_3C40B
		push	3
		push	word ptr [si+2Dh]
		mov	bx, [si+2Dh]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_3C40B

loc_3C40B:
		push	0
		push	si
		call	sub_7418A
		add	sp, 4
		test	di, 1
		jz	short loc_3C423
		push	si
		call	sub_3B2
		pop	cx

loc_3C423:
		pop	di
		pop	si
		pop	bp
		retf
sub_3C3E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C427		proc far
		push	bp
		mov	bp, sp
		mov	al, 3
		pop	bp
		retf
sub_3C427		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C42E		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_3C491
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1EC4h
		cmp	word ptr es:[bx+49h], 0
		jz	short loc_3C462
		push	3
		push	word ptr es:[bx+49h]
		mov	bx, es:[bx+49h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_3C462

loc_3C462:
		push	0
		push	large [bp+arg_0]
		call	sub_741D9
		add	sp, 6
		test	si, 1
		jz	short loc_3C491
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_3C491:
		pop	si
		leave
		retf
sub_3C42E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C494		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	dword ptr [si+54h], 0
		mov	byte ptr [si+58h], 0
		mov	byte ptr [si+59h], 0
		or	byte ptr [si+2], 4
		pop	si
		pop	bp
		retf
sub_3C494		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C4B2		proc far

var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	large [bp+var_4]
		push	si
		call	sub_36985
		add	sp, 6
		mov	ax, si
		add	ax, 2Dh
		push	ax
		call	Matrix_BuildFromAngle_58B3B
		pop	cx
		push	0
		push	si
		call	sub_7434A
		add	sp, 4
		or	byte ptr [si+2], 10h
		les	bx, word ptr [bp+var_4]
		mov	al, es:[bx+48h]
		push	ax
		push	si
		call	sub_7434A
		add	sp, 4
		push	si
		push	cs
		call	near ptr sub_3C494
		pop	cx
		les	bx, [si+0Eh]
		mov	al, es:[bx+4Ch]
		mov	[si+59h], al
		pop	si
		leave
		retf
sub_3C4B2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C510		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3C553
		mov	word ptr [si], 2058h
		cmp	word ptr [si+52h], 0
		jz	short loc_3C53B
		push	3
		push	word ptr [si+52h]
		mov	bx, [si+52h]
		mov	bx, [bx]
		call	dword ptr [bx+0Ch]
		add	sp, 4
		jmp	short loc_3C53B

loc_3C53B:
		push	0
		push	si
		call	sub_3B2B9
		add	sp, 4
		test	di, 1
		jz	short loc_3C553
		push	si
		call	sub_3B2
		pop	cx

loc_3C553:
		pop	di
		pop	si
		pop	bp
		retf
sub_3C510		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C557		proc far
		push	bp
		mov	bp, sp
		mov	al, 4
		pop	bp
		retf
sub_3C557		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 8 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_DestructTypeC (sub_3DCDB de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,50L — destructeur (type
; 0x24F0) notifiant un sous-composant far (+0x46, vtable[4]) : destructeur d'un troisième type
; de composant caméra (référence far).
; ==============================================================================================
Camera_DestructTypeC		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_3C5C3
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1E94h
		cmp	dword ptr es:[bx+59h], 0
		jz	short loc_3C595
		push	3
		push	large es:[bx+59h]
		les	bx, es:[bx+59h]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		jmp	short loc_3C595

loc_3C595:
		push	0
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_3C42E
		add	sp, 6
		test	si, 1
		jz	short loc_3C5C3
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_3C5C3:
		pop	si
		leave
		retf
Camera_DestructTypeC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à Camera_ResetSecondaryFlag (sub_3DD43 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,15L — remet à
; zéro un flag (+0x59) et positionne le flag de recalcul (+4 bit6) : reset partiel de l'état
; caméra (mode cible secondaire).
; ==============================================================================================
Camera_ResetSecondaryFlag		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+5Eh], 0
		or	byte ptr [si+2], 40h
		pop	si
		pop	bp
		retf
Camera_ResetSecondaryFlag		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à
; Camera_InitWithSecondaryTarget (sub_3DD55 de STRIKE.EXE). Résumé repris de STRIKE.EXE ;
; appelants et contexte à revérifier ici. — far,23L — attache (sub_3DC3D) puis reset
; (sub_3DD43) : initialisation complète de la caméra avec cible secondaire.
; ==============================================================================================
Camera_InitWithSecondaryTarget		proc far

arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	large [bp+arg_2]
		push	si
		push	cs
		call	near ptr sub_3C4B2
		add	sp, 6
		push	si
		push	cs
		call	near ptr Camera_ResetSecondaryFlag
		pop	cx
		pop	si
		pop	bp
		retf
Camera_InitWithSecondaryTarget		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_3C5F4		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_3C639
		mov	word ptr [si], 1FC4h
		cmp	dword ptr [si+5Ah], 0
		jz	short loc_3C622
		push	3
		push	large [si+5Ah]
		les	bx, [si+5Ah]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		jmp	short loc_3C622

loc_3C622:
		push	0
		push	si
		push	cs
		call	near ptr sub_3C510
		add	sp, 4
		test	di, 1
sub_3C5F4		endp
seg094		ends
