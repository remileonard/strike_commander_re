seg115		segment	para public 'CODE' use16
		assume cs:seg115
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0CBh

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4B6F1		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx+4Ah], 14h
		mov	byte ptr es:[bx+4Ch], 0
		pop	bp
		retf
sub_4B6F1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à IFF_LoadInfoChunk (sub_4B90B de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,52L — recherche le
; chunk IFF 'INFO' (0x4F464E49, magic little-endian) et résout ses champs (rayon +0x37, flags
; +0x39/+0x3A) : chargeur du chunk IFF INFO (métadonnées de modèle : rayon de collision,
; flags), appelé depuis le chargeur IFF principal.
; ==============================================================================================
IFF_LoadInfoChunk		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_4B6F1
		add	sp, 4
		push	0
		push	large 4F464E49h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_4B75C
		push	si
		call	ResourceRecord_ReadFieldGroupB_6DACD
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Ah], ax
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Ch], al
		cmp	byte ptr es:[bx+4Ch], 0
		jz	short loc_4B75C
		push	si
		call	ResourceRecord_ReadFinalField_6DBCA
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+4Dh], al

loc_4B75C:
		push	si
		push	large [bp+arg_0]
		call	sub_74370
		add	sp, 6
		pop	si
		pop	bp
		retf
IFF_LoadInfoChunk		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4B76C		proc far

var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	34h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_4B7F4
		mov	word ptr [si], 0DAEh
		mov	dword ptr [si+6], 0
		mov	word ptr [si+4], 0
		mov	byte ptr [si+2], 0
		mov	byte ptr [si+3], 0
		mov	word ptr [si], 15EAh
		push	ax
		call	Debris_BodyReset
		pop	cx
		mov	word ptr [si+2Dh], 0
		mov	word ptr [si], 20ECh
		push	large [bp+var_4]
		push	si
		call	sub_3C3C3
		add	sp, 6
		mov	word ptr [si], 2D40h
		mov	[bp+var_8], 0
		mov	eax, [bp+var_8]
		mov	[si+2Fh], eax
		les	bx, [si+0Eh]
		push	word ptr es:[bx+4Ah]
		mov	ax, si
		add	ax, 2Fh
		push	ax
		call	Timer_SetRelativeFrames_506B2
		add	sp, 4
		or	byte ptr [si+2], 1
		mov	ax, si
		jmp	short loc_4B7F6

loc_4B7F4:
		mov	ax, si

loc_4B7F6:
		mov	si, ax
		or	si, si
		jnz	short loc_4B805
		push	0B003h
		call	sub_1DDFE
		pop	cx

loc_4B805:
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		add	dx, 36h
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		mov	eax, [bp+var_C]
		mov	[si+6], eax
		push	si
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+48h]
		mov	bx, es:[bx+48h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_E], ax
		mov	[si+2Dh], ax
		mov	ax, si
		pop	si
		leave
		retf
sub_4B76C		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4B83B		proc far
		push	bp
		mov	bp, sp
		mov	al, 0Bh
		pop	bp
		retf
sub_4B83B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4B842		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_4B88A
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 1D5Ch
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_3C34F
		add	sp, 6
		test	si, 1
		jz	short loc_4B88A
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_4B88A:
		pop	si
		leave
		retf
sub_4B842		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4B88D		proc far

var_82		= dword ptr -82h
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
		sub	sp, 78h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	ax, si
		add	ax, 2Fh
		push	ax
		call	Timer_Tick_506DD
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4B8BC
		les	bx, [si+0Ah]
		mov	al, es:[bx+8]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_4B8BC
		mov	al, 0
		jmp	loc_4BA94

loc_4B8BC:
		push	si
		call	Camera_NotifyFollowTarget
		pop	cx
		or	al, al
		jnz	short loc_4B8CA
		jmp	loc_4BA92

loc_4B8CA:
		les	bx, [si+0Ah]
		cmp	byte ptr es:[bx+8], 0
		jnz	short loc_4B8D7
		jmp	loc_4BA8E

loc_4B8D7:
		les	bx, [si+0Eh]
		cmp	byte ptr es:[bx+4Ch], 0
		jnz	short loc_4B8E4
		jmp	loc_4BA8E

loc_4B8E4:
		cmp	word_79797, 0
		jnz	short loc_4B8EE
		jmp	loc_4BA8E

loc_4B8EE:
		cmp	word ptr [si+2Dh], 0
		jz	short loc_4B96F
		mov	di, [si+2Dh]
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
		mov	[bp+var_24], eax
		mov	eax, [bp+var_10]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_1C], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_24]
		jmp	short loc_4B98C

loc_4B96F:
		mov	eax, dword_79CEC
		mov	[bp+var_24], eax
		mov	eax, dword_79CF0
		mov	[bp+var_20], eax
		mov	eax, dword_79CF4
		mov	[bp+var_1C], eax
		mov	dx, ss
		lea	ax, word ptr [bp+var_24]

loc_4B98C:
		mov	eax, [bp+var_24]
		mov	[bp+var_30], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_2C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_28], eax
		mov	ax, si
		add	ax, 20h
		push	ax
		lea	ax, word ptr [bp+var_30]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4
		mov	di, si
		add	di, 12h
		mov	eax, [di]
		sub	eax, [bp+var_30]
		mov	[bp+var_54], eax
		mov	eax, [di+4]
		sub	eax, [bp+var_2C]
		mov	[bp+var_50], eax
		mov	eax, [di+8]
		sub	eax, [bp+var_28]
		mov	[bp+var_4C], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_60], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_5C], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_48], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_44], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_40], eax
		mov	eax, [bp+var_48]
		add	eax, [bp+var_24]
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_44]
		add	eax, [bp+var_20]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_40]
		add	eax, [bp+var_1C]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_6C]
		mov	[bp+var_78], eax
		mov	eax, [bp+var_68]
		mov	[bp+var_74], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_70], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_3C], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_38], eax
		mov	eax, [bp+var_70]
		mov	[bp+var_34], eax
		push	0
		sub	sp, 4
		mov	eax, dword_7976E
		mov	[bp+var_82], eax
		lea	ax, word ptr [bp+var_48]
		push	ax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		les	bx, [si+0Eh]
		mov	al, es:[bx+4Dh]
		mov	ah, 0
		push	ax
		push	word_79797
		call	sub_4D6FB
		add	sp, 0Eh

loc_4BA8E:
		mov	al, 1
		jmp	short loc_4BA94

loc_4BA92:
		mov	al, 0

loc_4BA94:
		pop	di
		pop	si
		leave
		retf
sub_4B88D		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BA98		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 0Bh
		pop	bp
		retf
sub_4BA98		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_4BAA2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_4BACD
		mov	word ptr [si], 2D40h
		push	0
		push	si
		call	sub_3C3E0
		add	sp, 4
		test	di, 1
		jz	short loc_4BACD
		push	si
		call	sub_3B2
		pop	cx

loc_4BACD:
		pop	di
		pop	si
		pop	bp
sub_4BAA2		endp
seg115		ends
