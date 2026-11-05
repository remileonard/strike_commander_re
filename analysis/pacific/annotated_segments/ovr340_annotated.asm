ovr340		segment	para public 'OVERLAY' use16
		assume cs:ovr340
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 7 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EjectSeat_LoadFromIFF_A6CA0 (sub_A6CA0 de STRIKE.EXE).
; Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, LUE 2026-10-12.
; LECTEUR DE LA CLASSE EJEC (nom d'après le tag : siège éjectable probable ; ex-
; PlayerComponent_LoadDataChunk). Chunk DATA facultatif : int32 → +0x46 (rôle non établi) ;
; int32 24.8 → +0x57 délai avant libération (s) ; int32 → +0x53 hauteur de libération (entier,
; <<8 → m) ; puis chaîne → +0x4A (String_ConstructFromFarPtrLen) = nom de l'objet libéré
; (parachute probable). Puis MobileObject_LoadDynamicsAndSmoke_9D189 (chunks communs + ALGN,
; dynamique DYNM en +0x36, chunk SMOK). Classe : 91 o, base OMOB, vtable 23A4h, catégorie 22
; (ClassStub_ReturnConst16h_4F2BA) ; méthode +4 = EjectSeat_SpawnInstance_A6D18. | COMPLÉMENT
; 2026-10-12 : int32 +0x46 : rôle non établi (non lu par EjectSeat_SpawnInstance_A6D18,
; EjectSeat_InitInstance_A6DA2 ni EjectSeat_TickReleaseObject_4F351).
; ==============================================================================================
EjectSeat_LoadFromIFF_B9CF0		proc far

arg_0		= dword ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 41544144h
		push	si
		call	ResourceRecord_SeekAndRead_6D7BC
		add	sp, 8
		or	ax, ax
		jz	short loc_B9D58
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+59h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+6Ah], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_6DAF7
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, word ptr [bp+arg_0]
		mov	es:[bx+66h], eax
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 5Dh
		push	word ptr [bp+arg_0+2]
		push	ax
		call	sub_294DB
		add	sp, 6

loc_B9D58:
		push	si
		push	large [bp+arg_0]
		call	sub_7437A
		add	sp, 6
		pop	si
		pop	bp
		retf
EjectSeat_LoadFromIFF_B9CF0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 10 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EjectSeat_SpawnInstance_A6D18 (sub_A6D18 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; méthode +4 de la classe EJEC : crée l'instance (CRT_Malloc16_Retry(0x5C),
; WorldObject_BaseConstruct, Camera_ResetState, vtable 32F6h, +0x55/+0x59 = 0),
; EjectSeat_InitInstance_A6DA2, puis +0x51 = vtable+8 de la dynamique du modèle (+0x36).
; ==============================================================================================
EjectSeat_SpawnInstance_B9D68		proc far

var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= dword ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	61h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_B9DBE
		push	ax
		call	sub_3B1B6
		pop	cx
		mov	word ptr [si+52h], 0
		mov	word ptr [si], 2058h
		push	si
		call	sub_3C494
		pop	cx
		mov	word ptr [si], 2F7Ch
		mov	dword ptr [si+5Ah], 0
		mov	word ptr [si+5Eh], 0
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr sub_B9DF2
		add	sp, 6
		mov	ax, si
		jmp	short loc_B9DC0

loc_B9DBE:
		mov	ax, si

loc_B9DC0:
		mov	si, ax
		push	ax
		push	large [bp+arg_0]
		call	sub_741DE
		add	sp, 6
		or	si, si
		jz	short loc_B9DED
		push	si
		les	bx, word ptr [bp+arg_0]
		push	word ptr es:[bx+49h]
		mov	bx, es:[bx+49h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_6], ax
		mov	[si+52h], ax

loc_B9DED:
		mov	ax, si
		pop	si
		leave
		retf
EjectSeat_SpawnInstance_B9D68		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9DF2		proc far

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 6Ah
		mov	[bp+var_6], ax
		mov	[bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[si+5Ah], eax
		mov	byte ptr [si+60h], 0
		push	large [bp+arg_2]
		push	si
		call	sub_3C4B2
		add	sp, 6
		and	byte ptr [si+2], 0FDh
		or	byte ptr [si+2], 1
		or	byte ptr [si+2], 8
		or	byte ptr [si+2], 40h
		pop	si
		leave
		retf
sub_B9DF2		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_B9E42		proc far

var_A2		= dword ptr -0A2h
var_9E		= dword ptr -9Eh
var_9A		= dword ptr -9Ah
var_96		= dword ptr -96h
var_92		= dword ptr -92h
var_8E		= dword ptr -8Eh
var_8A		= dword ptr -8Ah
var_86		= dword ptr -86h
var_82		= dword ptr -82h
var_7E		= dword ptr -7Eh
var_7A		= dword ptr -7Ah
var_76		= dword ptr -76h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
var_6A		= dword ptr -6Ah
var_66		= dword ptr -66h
var_62		= dword ptr -62h
var_5E		= dword ptr -5Eh
var_5A		= dword ptr -5Ah
var_56		= dword ptr -56h
var_52		= dword ptr -52h
var_4E		= dword ptr -4Eh
var_4A		= word ptr -4Ah
var_48		= word ptr -48h
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_3A		= dword ptr -3Ah
var_36		= dword ptr -36h
var_32		= dword ptr -32h
var_2E		= dword ptr -2Eh
var_2A		= dword ptr -2Ah
var_26		= dword ptr -26h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= dword ptr -18h
var_14		= dword ptr -14h
var_10		= dword ptr -10h
var_C		= dword ptr -0Ch
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 0A2h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	1
		push	1
		push	large [bp+var_4]
		push	65D0h
		call	sub_379D2
		add	sp, 0Ah
		mov	di, ax
		or	di, di
		jnz	short loc_B9E72
		jmp	loc_BA0F7

loc_B9E72:
		mov	eax, [di+0Eh]
		mov	[bp+var_8], eax
		push	0
		mov	[bp+var_C], 0
		mov	eax, [bp+var_C]
		mov	[bp+var_66], eax
		mov	[bp+var_10], 0
		mov	eax, [bp+var_10]
		mov	[bp+var_62], eax
		mov	[bp+var_14], 100h
		mov	eax, [bp+var_14]
		mov	[bp+var_5E], eax
		lea	ax, word ptr [bp+var_66]
		push	ax
		mov	ax, si
		add	ax, 12h
		push	ax
		push	word_79788
		push	ss
		lea	ax, word ptr [bp+var_18]
		push	ax
		call	sub_3664D
		add	sp, 0Ch
		mov	ax, si
		add	ax, 1Ah
		mov	[bp+var_1A], ax
		mov	bx, [bp+var_1A]
		mov	eax, [bp+var_18]
		add	eax, [bx]
		mov	[bp+var_1E], eax
		mov	[bp+var_22], eax
		les	bx, word ptr [bp+var_8]
		mov	eax, es:[bx+66h]
		mov	[bp+var_26], eax
		shl	eax, 8
		cmp	eax, [bp+var_22]
		jge	short loc_B9EFC
		mov	ax, 1
		jmp	short loc_B9EFE

loc_B9EFC:
		xor	ax, ax

loc_B9EFE:
		or	al, al
		jz	short loc_B9F07
		xor	ax, ax
		jmp	loc_BA0F9

loc_B9F07:
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		mov	cx, ax
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_72], eax
		mov	eax, [bx+4]
		mov	[bp+var_6E], eax
		mov	eax, [bx+8]
		mov	[bp+var_6A], eax
		mov	cx, si
		add	cx, 12h
		mov	eax, [si+20h]
		sar	eax, 1
		mov	[bp+var_2A], eax
		mov	[bp+var_2E], eax
		mov	eax, [bp+var_72]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_32], eax
		mov	eax, [bp+var_32]
		mov	[bp+var_36], eax
		mov	eax, [bp+var_6E]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_3A], eax
		mov	eax, [bp+var_3A]
		mov	[bp+var_3E], eax
		mov	eax, [bp+var_6A]
		mov	edx, [bp+var_2E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_42], eax
		mov	eax, [bp+var_42]
		mov	[bp+var_46], eax
		mov	eax, [bp+var_36]
		mov	[bp+var_7E], eax
		mov	eax, [bp+var_3E]
		mov	[bp+var_7A], eax
		mov	eax, [bp+var_46]
		mov	[bp+var_76], eax
		mov	bx, cx
		mov	eax, [bx]
		add	eax, [bp+var_7E]
		mov	[bp+var_8A], eax
		mov	eax, [bx+4]
		add	eax, [bp+var_7A]
		mov	[bp+var_86], eax
		mov	eax, [bx+8]
		add	eax, [bp+var_76]
		mov	[bp+var_82], eax
		mov	eax, [bp+var_8A]
		mov	[bp+var_96], eax
		mov	eax, [bp+var_86]
		mov	[bp+var_92], eax
		mov	eax, [bp+var_82]
		mov	[bp+var_8E], eax
		mov	eax, [bp+var_96]
		mov	[di+12h], eax
		mov	eax, [bp+var_92]
		mov	[di+16h], eax
		mov	eax, [bp+var_8E]
		mov	[di+1Ah], eax
		mov	ax, word ptr [bp+var_8+2]
		mov	dx, word ptr [bp+var_8]
		add	dx, 59h
		mov	[bp+var_48], ax
		mov	[bp+var_4A], dx
		les	bx, [bp+var_4A]
		mov	eax, es:[bx]
		mov	[bp+var_4E], eax
		mov	eax, [bp+var_72]
		mov	edx, [bp+var_4E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_72], eax
		mov	eax, [bp+var_6E]
		mov	edx, [bp+var_4E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6E], eax
		mov	eax, [bp+var_6A]
		mov	edx, [bp+var_4E]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_6A], eax
		push	si
		push	ss
		lea	ax, word ptr [bp+var_A2]
		push	ax
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_A2]
		add	[bp+var_72], eax
		mov	eax, [bp+var_9E]
		add	[bp+var_6E], eax
		mov	eax, [bp+var_9A]
		add	[bp+var_6A], eax
		lea	ax, word ptr [bp+var_72]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+54h]
		add	sp, 4
		push	si
		mov	bx, [si]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	[bp+var_52], 0
		lea	ax, word ptr [bp+var_52]
		push	ax
		mov	[bp+var_56], 0
		lea	ax, word ptr [bp+var_56]
		push	ax
		mov	[bp+var_5A], 0FFFFA600h
		lea	ax, word ptr [bp+var_5A]
		push	ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+2Ch]
		add	sp, 8
		push	di
		push	67ADh
		call	List_AppendIfNonNull_1E24C
		add	sp, 4
		mov	bx, [si+52h]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_BA0F7
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		pop	cx

loc_BA0F7:
		mov	ax, di

loc_BA0F9:
		pop	di
		pop	si
		leave
		retf
sub_B9E42		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_BA0FD		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		push	di
		push	word ptr [si]
		call	sub_74EB0
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_74EF0
		add	sp, 4
		push	di
		push	word ptr [si+14h]
		call	sub_74F09
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_74F54
		add	sp, 4
		push	di
		push	word ptr [si]
		call	sub_74EB0
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
sub_BA0FD		endp
ovr340		ends
