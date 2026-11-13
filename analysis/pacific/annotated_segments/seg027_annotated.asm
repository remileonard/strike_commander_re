seg027		segment	para public 'CODE' use16
		assume cs:seg027
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_116E0		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]
		call	sub_9EE2
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		and	byte ptr es:[bx+1Ch], 0F7h
		mov	al, 0
		and	byte ptr es:[bx+1Ch], 0EFh
		mov	dx, ax
		shl	al, 4
		or	es:[bx+1Ch], al
		and	dx, 1
		and	byte ptr es:[bx+1Ch], 0FBh
		mov	ax, dx
		shl	dl, 2
		or	es:[bx+1Ch], dl
		and	ax, 1
		and	byte ptr es:[bx+1Dh], 0FBh
		mov	dx, ax
		shl	al, 2
		or	es:[bx+1Dh], al
		and	dx, 1
		and	byte ptr es:[bx+1Dh], 0FDh
		mov	ax, dx
		shl	dl, 1
		or	es:[bx+1Dh], dl
		and	ax, 1
		and	byte ptr es:[bx+1Dh], 0FEh
		mov	dx, ax
		or	es:[bx+1Dh], al
		and	dx, 1
		and	byte ptr es:[bx+1Ch], 7Fh
		mov	ax, dx
		shl	dl, 7
		or	es:[bx+1Ch], dl
		and	ax, 1
		and	byte ptr es:[bx+1Ch], 0BFh
		mov	dx, ax
		shl	al, 6
		or	es:[bx+1Ch], al
		and	dx, 1
		and	byte ptr es:[bx+1Ch], 0DFh
		mov	ax, dx
		shl	dl, 5
		or	es:[bx+1Ch], dl
		and	ax, 1
		and	byte ptr es:[bx+1Ch], 0FDh
		mov	dx, ax
		shl	al, 1
		or	es:[bx+1Ch], al
		and	dx, 1
		and	byte ptr es:[bx+1Bh], 7Fh
		mov	ax, dx
		shl	dl, 7
		or	es:[bx+1Bh], dl
		and	ax, 1
		and	byte ptr es:[bx+1Bh], 0BFh
		mov	dx, ax
		shl	al, 6
		or	es:[bx+1Bh], al
		and	dx, 1
		and	byte ptr es:[bx+1Bh], 0DFh
		mov	ax, dx
		shl	dl, 5
		or	es:[bx+1Bh], dl
		and	ax, 1
		and	byte ptr es:[bx+1Bh], 0EFh
		mov	dx, ax
		shl	al, 4
		or	es:[bx+1Bh], al
		and	dx, 1
		and	byte ptr es:[bx+1Bh], 0F7h
		mov	ax, dx
		shl	dl, 3
		or	es:[bx+1Bh], dl
		and	ax, 1
		and	byte ptr es:[bx+1Bh], 0FBh
		mov	dx, ax
		shl	al, 2
		or	es:[bx+1Bh], al
		and	dx, 1
		and	byte ptr es:[bx+1Bh], 0FDh
		mov	ax, dx
		shl	dl, 1
		or	es:[bx+1Bh], dl
		and	ax, 1
		and	byte ptr es:[bx+1Bh], 0FEh
		or	es:[bx+1Bh], al
		pop	bp
		retf
sub_116E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1180E		proc far

arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		push	large [bp+arg_0]
		call	WorldObjectA_ResetPositionVector_9EE7
		add	sp, 4
		push	large [bp+arg_0]
		push	cs
		call	near ptr sub_116E0
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+1Eh], 0
		xor	ax, ax
		mov	es:[bx+23h], ax
		mov	es:[bx+21h], ax
		mov	es:[bx+1Fh], ax
		push	word ptr [bp+arg_0+2]
		push	bx
		push	cs
		call	near ptr sub_116E0
		add	sp, 4
		pop	bp
		retf
sub_1180E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_1184B		proc far

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	1
		push	0
		push	2
		push	large 25h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jz	short loc_1189C
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 3C8h
		push	dx
		push	bx
		call	WorldObjectA_ResetPositionVector_9EE7
		add	sp, 4
		les	bx, [bp+var_4]
		mov	word ptr es:[bx], 440h
		push	[bp+var_2]
		push	bx
		push	cs
		call	near ptr sub_1180E
		add	sp, 4
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	short loc_118A2

loc_1189C:
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]

loc_118A2:
		leave
		retf
sub_1184B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_118A4		proc far

var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jz	short loc_118EC
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 440h
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_9FA2
		add	sp, 6
		test	si, 1
		jz	short loc_118EC
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_118EC:
		pop	si
		leave
		retf
sub_118A4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 19 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à SubObject_NotifyEvent (sub_12A22 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,132L — notifie
; via vtable trois références attachées (+0x7,+0x11,+0x15) d'un événement (code 3) :
; propagation d'un événement (probable destruction/largage) vers des sous-objets attachés
; (armement externe?).
; ==============================================================================================
SubObject_NotifyEvent		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		cmp	[bp+arg_0], 0
		jnz	short loc_11903
		jmp	loc_11A18

loc_11903:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx], 5C2h
		cmp	dword ptr es:[bx+7], 0
		jz	short loc_11931
		cmp	dword ptr es:[bx+7], 0
		jz	short loc_11931
		push	3
		push	large es:[bx+7]
		les	bx, es:[bx+7]
		mov	bx, es:[bx]
		call	dword ptr [bx+4]
		add	sp, 6
		jmp	short loc_11931

loc_11931:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_11959
		cmp	dword ptr es:[bx+15h], 0
		jz	short loc_11959
		push	3
		push	large es:[bx+15h]
		les	bx, es:[bx+15h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_11959

loc_11959:
		les	bx, word ptr [bp+arg_0]
		cmp	dword ptr es:[bx+11h], 0
		jz	short loc_11981
		cmp	dword ptr es:[bx+11h], 0
		jz	short loc_11981
		push	3
		push	large es:[bx+11h]
		les	bx, es:[bx+11h]
		mov	bx, es:[bx]
		call	dword ptr [bx]
		add	sp, 6
		jmp	short loc_11981

loc_11981:
		les	bx, word ptr [bp+arg_0]
		mov	word ptr es:[bx+1Ah], 5BEh
		mov	ax, word ptr [bp+arg_0]
		add	ax, 1Ah
		push	word ptr [bp+arg_0+2]
		push	ax
		call	RadioQueue_RemoveByPos
		add	sp, 4
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+21h], 0
		jz	short loc_119CF
		cmp	dword ptr es:[bx+1Ch], 0
		jz	short loc_119CF
		push	0
		mov	al, es:[bx+20h]
		push	ax
		mov	eax, es:[bx+1Ch]
		mov	[bp+var_4], eax
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_119CF

loc_119CF:
		les	bx, word ptr [bp+arg_0]
		mov	dword ptr es:[bx+1Ch], 0
		mov	byte ptr es:[bx+21h], 0
		mov	dword ptr es:[bx+22h], 0
		push	0
		push	word ptr [bp+arg_0+2]
		push	bx
		call	sub_9FF1
		add	sp, 6
		test	si, 1
		jz	short loc_11A18
		mov	eax, [bp+arg_0]
		mov	[bp+var_8], eax
		push	0
		push	2
		lea	ax, word ptr [bp+var_8]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_11A18:
		pop	si
		leave
		retf
SubObject_NotifyEvent		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11A1B		proc far

var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 18h
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_4], 0
		push	si
		mov	bx, [si]
		call	dword ptr [bx]
		pop	cx
		mov	bx, ax
		mov	es, dx
		mov	al, es:[bx+43h]
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_11A45
		jmp	loc_11B06

loc_11A45:
		cmp	ax, 2
		jz	short loc_11A4D
		jmp	loc_11C39

loc_11A4D:
		mov	[bp+var_6], si
		push	1
		push	0
		push	2
		push	large 0C0h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_8], dx
		mov	[bp+var_A], ax
		or	ax, dx
		jnz	short loc_11A74
		jmp	loc_11AFD

loc_11A74:
		les	bx, [bp+var_A]
		mov	word ptr es:[bx], 3ACh
		mov	byte ptr es:[bx+6], 0
		mov	word ptr es:[bx+4], 0FFFFh
		push	dx
		push	bx
		call	sub_9FDC
		add	sp, 4
		les	bx, [bp+var_A]
		mov	word ptr es:[bx], 5C2h
		mov	ax, [bp+var_A]
		add	ax, 1Ah
		push	[bp+var_8]
		push	ax
		call	sub_736DA
		add	sp, 4
		les	bx, [bp+var_A]
		mov	word ptr es:[bx+1Ah], 59Ah
		mov	dword ptr es:[bx+7], 0
		mov	word ptr es:[bx+2], 0
		xor	eax, eax
		mov	es:[bx+15h], eax
		mov	es:[bx+11h], eax
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+6], 0
		mov	word ptr es:[bx], 59Eh
		push	[bp+var_6]
		push	[bp+var_8]
		push	bx
		call	sub_11EDD
		add	sp, 6
		mov	dx, [bp+var_8]
		mov	ax, [bp+var_A]

loc_11AFA:
		jmp	loc_11C33

loc_11AFD:
		mov	dx, [bp+var_8]
		mov	ax, [bp+var_A]
		jmp	loc_11C33

loc_11B06:
		mov	[bp+var_C], si
		push	1
		push	0
		push	2
		push	large 1FBh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[bp+var_E], dx
		mov	[bp+var_10], ax
		or	ax, dx
		jnz	short loc_11B2D
		jmp	loc_11C2D

loc_11B2D:
		les	bx, [bp+var_10]
		mov	word ptr es:[bx], 3ACh
		mov	byte ptr es:[bx+6], 0
		mov	word ptr es:[bx+4], 0FFFFh
		push	dx
		push	bx
		call	sub_9FDC
		add	sp, 4
		les	bx, [bp+var_10]
		mov	word ptr es:[bx], 5C2h
		mov	ax, [bp+var_10]
		add	ax, 1Ah
		push	[bp+var_E]
		push	ax
		call	sub_736DA
		add	sp, 4
		les	bx, [bp+var_10]
		mov	word ptr es:[bx+1Ah], 59Ah
		mov	dword ptr es:[bx+7], 0
		mov	word ptr es:[bx+2], 0
		xor	eax, eax
		mov	es:[bx+15h], eax
		mov	es:[bx+11h], eax
		mov	es:[bx+0Dh], eax
		mov	word ptr es:[bx+0Bh], 0
		mov	byte ptr es:[bx+6], 0
		mov	word ptr es:[bx], 420h
		mov	[bp+var_14], 19h
		mov	eax, [bp+var_14]
		add	dword_76C68, eax
		mov	eax, dword_76C68
		mov	[bp+var_18], eax
		mov	eax, [bp+var_18]
		mov	es:[bx+0E2h], eax
		mov	byte ptr es:[bx+0E6h], 3
		mov	al, 0
		mov	es:[bx+0E1h], al
		mov	es:[bx+0E0h], al
		mov	es:[bx+0DFh], al
		mov	es:[bx+0DEh], al
		mov	word ptr es:[bx+0FBh], 0
		mov	word ptr es:[bx+123h], 0
		mov	word ptr es:[bx+131h], 0
		mov	word ptr es:[bx+133h], 0
		mov	word ptr es:[bx+1F1h], 0
		mov	word ptr es:[bx+1F3h], 0
		mov	word ptr es:[bx+1F5h], 0
		mov	word ptr es:[bx+1F7h], 0
		push	[bp+var_C]
		push	[bp+var_E]
		push	bx
		call	sub_72FAA
		add	sp, 6
		mov	dx, [bp+var_E]
		mov	ax, [bp+var_10]
		jmp	loc_11AFA

loc_11C2D:
		mov	dx, [bp+var_E]
		mov	ax, [bp+var_10]

loc_11C33:
		mov	word ptr [bp+var_4+2], dx
		mov	word ptr [bp+var_4], ax

loc_11C39:
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]
		pop	si
		leave
		retf
sub_11A1B		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_11C42		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		cmp	dword ptr es:[bx+0Dh], 0
		jz	short loc_11C6B
		les	bx, es:[bx+0Dh]
		cmp	byte ptr es:[bx+0Ch], 12h
		jz	short loc_11C6B
		les	bx, [bp+arg_0]
		push	large es:[bx+0Dh]
		call	sub_103CB
		add	sp, 4

loc_11C6B:
		les	bx, [bp+arg_0]
		push	large es:[bx+7]
		push	cs
		call	near ptr sub_116E0
		add	sp, 4
		les	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		mov	byte ptr es:[bx+1Eh], 4
		xor	ax, ax
		mov	es:[bx+23h], ax
		mov	es:[bx+21h], ax
		mov	es:[bx+1Fh], ax
		les	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		and	byte ptr [bx+92h], 0FBh
		mov	bx, [bp+arg_0]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+92h]
		shr	ax, 1
		and	ax, 1
		and	ax, 1
		mov	bx, [bp+arg_0]
		les	bx, es:[bx+7]
		and	byte ptr es:[bx+1Ch], 0DFh
		shl	al, 5
		or	es:[bx+1Ch], al
		pop	bp
		retf
sub_11C42		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-13 (fin). Lit les 10 octets d'ATRB vers le profil (+154, +156, +155, +157,
; +153, +158, +159, +160, +161, +162 ; le 10e borné à 3) ; niveau [profil+152] = 2 si l'octet
; 5 (+153) > 12, 1 si > 6, sinon 0. Avec le profil à l'entité +26 (sub_84340), ce niveau est
; [entité+178], qui choisit la recherche de cible de Targeting_AcquireTarget_FF8B.
; ==============================================================================================
PilotProfile_LoadATRB_11CC8		proc far

var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= byte ptr -4
var_3		= byte ptr -3
var_2		= byte ptr -2
var_1		= byte ptr -1
arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		mov	si, [bp+arg_4]
		push	si
		push	large [bp+arg_0]
		call	sub_736E9
		add	sp, 6
		push	0
		push	large 5F49415Fh
		push	si
		call	ResourceRecord_SeekAndReadB_6D82B
		add	sp, 8
		or	ax, ax
		jnz	short loc_11CF7
		jmp	loc_11E10

loc_11CF7:
		push	0
		push	large 42525441h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jnz	short loc_11D0F
		jmp	loc_11DB1

loc_11D0F:
		cmp	dword ptr [si+72h], 0Ah
		jz	short loc_11D19
		jmp	loc_11DB1

loc_11D19:
		push	large 0Ah
		push	ss
		lea	ax, [bp+var_A]
		push	ax
		push	si
		call	ResourceRecord_ReadFieldGroupA_6DA92
		add	sp, 0Ah
		les	bx, word ptr [bp+arg_0]
		mov	al, byte ptr [bp+var_A]
		mov	es:[bx+9Ah], al
		mov	al, byte ptr [bp+var_A+1]
		mov	es:[bx+9Ch], al
		mov	al, [bp+var_8]
		mov	es:[bx+9Bh], al
		mov	al, [bp+var_7]
		mov	es:[bx+9Dh], al
		mov	al, [bp+var_6]
		mov	es:[bx+99h], al
		mov	al, [bp+var_5]
		mov	es:[bx+9Eh], al
		mov	al, [bp+var_4]
		mov	es:[bx+9Fh], al
		mov	al, [bp+var_3]
		mov	es:[bx+0A0h], al
		mov	al, [bp+var_2]
		mov	es:[bx+0A1h], al
		mov	al, [bp+var_1]
		mov	es:[bx+0A2h], al
		cmp	byte ptr es:[bx+0A2h], 3
		jbe	short loc_11D8B
		mov	byte ptr es:[bx+0A2h], 3

loc_11D8B:
		les	bx, word ptr [bp+arg_0]
		mov	al, [bp+var_6]
		mov	es:[bx+0A3h], al
		mov	al, [bp+var_5]
		mov	es:[bx+0A4h], al
		mov	al, [bp+var_4]
		mov	es:[bx+0A5h], al
		mov	eax, [si+76h]
		mov	[si+65h], eax
		jmp	loc_11E47

loc_11DB1:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+9Ah], 8
		mov	byte ptr es:[bx+9Ch], 8
		mov	byte ptr es:[bx+9Bh], 8
		mov	byte ptr es:[bx+9Dh], 8
		mov	byte ptr es:[bx+99h], 0Ah
		mov	byte ptr es:[bx+9Eh], 0Ah
		mov	byte ptr es:[bx+9Fh], 0Ah
		mov	byte ptr es:[bx+0A0h], 8
		mov	byte ptr es:[bx+0A1h], 8
		mov	byte ptr es:[bx+0A2h], 0
		mov	al, es:[bx+99h]
		mov	es:[bx+0A3h], al
		mov	al, es:[bx+9Eh]
		mov	es:[bx+0A4h], al
		mov	al, es:[bx+9Fh]
		mov	es:[bx+0A5h], al
		jmp	short loc_11E47

loc_11E10:
		les	bx, word ptr [bp+arg_0]
		mov	al, 0
		mov	es:[bx+9Bh], al
		mov	es:[bx+0A2h], al
		mov	es:[bx+0A1h], al
		mov	es:[bx+0A0h], al
		mov	es:[bx+9Fh], al
		mov	es:[bx+9Eh], al
		mov	es:[bx+9Dh], al
		mov	es:[bx+9Ch], al
		mov	es:[bx+9Ah], al
		mov	es:[bx+99h], al

loc_11E47:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+99h], 0Ch
		jle	short loc_11E5A
		mov	byte ptr es:[bx+98h], 2
		jmp	short loc_11E76

loc_11E5A:
		les	bx, word ptr [bp+arg_0]
		cmp	byte ptr es:[bx+99h], 6
		jle	short loc_11E6D
		mov	byte ptr es:[bx+98h], 1
		jmp	short loc_11E76

loc_11E6D:
		les	bx, word ptr [bp+arg_0]
		mov	byte ptr es:[bx+98h], 0

loc_11E76:
		pop	si
		leave
		retf
PilotProfile_LoadATRB_11CC8		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE 2026-11-05. Compétences d'un profil de pilote ([+0A3h], [+0A4h], [+0A5h]) décalées
; de byte_7CB11 (« Enemy AI: » : 0 Ace, 1 Veteran, 2 Rookie) vers la droite -> [+99h], [+9Eh],
; [+9Fh] ; niveau [+98h] = 2 si [+99h] > 12, 1 si > 6, sinon 0 (suite non lue). Équivalent de
; PilotProfile_RescaleSkillByDifficulty_12FC9 de STRIKE.
; ==============================================================================================
PilotProfile_RescaleSkillByEnemyAI_11E79		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		mov	al, es:[bx+0A3h]
		cbw
		mov	cl, byte_7CB11
		sar	ax, cl
		mov	es:[bx+99h], al
		mov	al, es:[bx+0A4h]
		cbw
		sar	ax, cl
		mov	es:[bx+9Eh], al
		mov	al, es:[bx+0A5h]
		cbw
		sar	ax, cl
		mov	es:[bx+9Fh], al
		cmp	byte ptr es:[bx+99h], 0Ch
		jle	short loc_11EBA
		mov	byte ptr es:[bx+98h], 2
		jmp	short loc_11ED6

loc_11EBA:
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx+99h], 6
		jle	short loc_11ECD
		mov	byte ptr es:[bx+98h], 1
		jmp	short loc_11ED6

loc_11ECD:
		les	bx, [bp+arg_0]
PilotProfile_RescaleSkillByEnemyAI_11E79		endp
seg027		ends
