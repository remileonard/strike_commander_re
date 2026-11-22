ovr259		segment	para public 'OVERLAY' use16
		assume cs:ovr259
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à TextObj_Construct
; (sub_272E8 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,63L — constructeur d'un objet volumineux (0x107 octets, police/texte), initialise
; position, tente un chargement de config (sub_26F2B) : constructeur d'objet de rendu de texte
; formaté avec configuration optionnelle.
; ==============================================================================================
TextObj_Construct		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_6]
		or	si, si
		jnz	short loc_998AE
		push	107h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_998F7

loc_998AE:
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	ax, [bp+arg_2]
		mov	[si], ax
		mov	ax, [bp+arg_4]
		mov	[si+2], ax
		mov	word ptr [si+4], 1
		or	di, di
		jz	short loc_998EE
		push	ds
		push	di
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_998EE
		push	1
		push	di
		mov	ax, si
		add	ax, 6
		push	ax
		mov	bx, [si+6]
		call	dword ptr [bx+14h]
		add	sp, 6

loc_998EE:
		mov	dword ptr [si+103h], 0

loc_998F7:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
TextObj_Construct		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : code identique instruction par instruction à TextObj_CommandInterp
; (sub_27355 de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far,192L — boucle d'interprétation d'un flux de commandes (table de pointeurs à +2,
; cache à +4/+0), lit la commande suivante via sub_63DB5/sub_64062 : interpréteur de flux de
; commandes de rendu (moteur SM-FONT, contrôle de mise en forme du texte).
; ==============================================================================================
TextObj_CommandInterp		proc far

var_A		= word ptr -0Ah
var_8		= dword ptr -8
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	si
		push	di
		mov	si, [bp+arg_0]
		xor	di, di
		mov	ax, [si+4]
		cmp	ax, [si]
		jge	short loc_99923
		mov	ax, [si+4]
		inc	word ptr [si+4]
		shl	ax, 1
		mov	bx, [si+2]
		add	bx, ax
		mov	di, [bx]
		jmp	loc_99A19

loc_99923:
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ValidateState_6C307
		pop	cx
		or	al, al
		jnz	short loc_99936
		jmp	loc_99A19

loc_99936:
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_4], eax
		mov	eax, [si+103h]
		cmp	eax, [bp+var_4]
		jl	short loc_99958
		jmp	loc_99A19

loc_99958:
		push	eax
		push	large 0A0h
		push	ds
		mov	ax, si
		add	ax, 63h
		push	ax
		mov	ax, si
		add	ax, 6
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		push	dx
		push	ax
		pop	eax
		add	sp, 0Eh
		mov	[bp+var_8], eax
		mov	di, si
		add	di, 63h
		xor	cx, cx
		mov	[bp+var_A], 0
		xor	dx, dx

loc_9998B:
		mov	bx, si
		add	bx, dx
		mov	al, [bx+63h]
		cbw
		mov	bx, ax
		or	bx, bx
		jz	short loc_9999E
		cmp	bx, 1Bh
		jnz	short loc_999BA

loc_9999E:
		mov	bx, si
		add	bx, dx
		mov	byte ptr [bx+63h], 0
		or	dx, dx
		jnz	short loc_999AC
		xor	di, di

loc_999AC:
		mov	eax, [bp+var_4]
		mov	[si+103h], eax

loc_999B5:
		mov	cx, 1
		jmp	short loc_999FF

loc_999BA:
		cmp	bx, 0Dh
		jz	short loc_999C4
		cmp	bx, 0Ah
		jnz	short loc_999D9

loc_999C4:
		cmp	byte ptr [di], 0
		jz	short loc_999CE
		mov	[bp+var_A], 1

loc_999CE:
		mov	bx, si
		add	bx, dx
		mov	byte ptr [bx+63h], 0
		inc	dx
		jmp	short loc_999FF

loc_999D9:
		cmp	[bp+var_A], 0
		jnz	short loc_999B5
		or	di, di
		jnz	short loc_999EA
		mov	di, si
		add	di, dx
		add	di, 63h

loc_999EA:
		inc	dx
		mov	ax, dx
		movsx	eax, ax
		cmp	eax, [bp+var_8]
		jnz	short loc_999FF
		mov	bx, si
		add	bx, dx
		mov	byte ptr [bx+63h], 0

loc_999FF:
		or	cx, cx
		jnz	short loc_99A10
		movsx	eax, dx
		cmp	eax, [bp+var_8]
		jge	short loc_99A10
		jmp	loc_9998B

loc_99A10:
		movsx	eax, dx
		add	[si+103h], eax

loc_99A19:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
TextObj_CommandInterp		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_99A1F		proc far

var_8		= dword ptr -8
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		cmp	byte_7755C, 0
		jnz	short loc_99A4C
		inc	byte_7755C
		mov	dword_7CAB6, 0
		mov	byte_7CABA, 2
		mov	byte_7CABB, 0
		mov	dword_7CABC, 0

loc_99A4C:
		cmp	byte_7CABB, 0
		jz	short loc_99A71
		cmp	dword_7CAB6, 0
		jz	short loc_99A71
		push	0
		mov	al, byte_7CABA
		push	ax
		push	6386h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_99A71

loc_99A71:
		mov	dword_7CAB6, 0
		mov	byte_7CABB, 0
		mov	dword_7CABC, 0
		call	sub_93C2
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_4], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		mov	eax, [bp+var_8]
		mov	dword_7CAB6, eax
		mov	byte_7CABA, 3
		mov	byte_7CABB, 1
		mov	dword_7CABC, 0
		mov	eax, [bp+var_4]
		mov	dword_7CABC, eax
		push	0
		mov	al, byte_7CABA
		push	ax
		push	large dword_7CAB6
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		call	sub_93E6
		add	sp, 4
		mov	al, byte_7CABA
		push	ax
		push	large dword_7CAB6
		call	sub_634A4
		push	dx
		push	ax
		pop	eax
		add	sp, 6
		mov	dx, ds
		movzx	edx, dx
		shl	edx, 4
		add	eax, edx
		mov	dword_77550, eax
		push	25h
		call	sub_939B
		pop	cx
		movzx	eax, ax
		mov	dword_77554, eax
		push	20h
		call	sub_939B
		pop	cx
		movzx	eax, ax
		mov	dword_77558, eax
		leave
		retf
sub_99A1F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_99B3B		proc far

var_1B0		= word ptr -1B0h
var_1AA		= word ptr -1AAh
var_A8		= word ptr -0A8h
var_58		= dword ptr -58h
var_54		= dword ptr -54h
var_50		= word ptr -50h
var_4E		= word ptr -4Eh
var_4C		= word ptr -4Ch
var_4A		= dword ptr -4Ah
var_46		= byte ptr -46h
var_45		= byte ptr -45h
var_44		= dword ptr -44h
var_40		= dword ptr -40h
var_3C		= word ptr -3Ch
var_3A		= word ptr -3Ah
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= word ptr -32h
var_30		= word ptr -30h
var_2E		= word ptr -2Eh
var_2C		= word ptr -2Ch
var_2A		= word ptr -2Ah
var_28		= word ptr -28h
var_26		= word ptr -26h
var_24		= byte ptr -24h
var_23		= byte ptr -23h
var_22		= word ptr -22h
var_20		= word ptr -20h
var_1E		= word ptr -1Eh
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= byte ptr -16h
var_15		= byte ptr -15h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 1B0h
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	al, byte_7752A
		mov	ah, 0
		or	ax, ax
		jz	short loc_99B53
		jmp	loc_9A95C

loc_99B53:
		cmp	dword_76A78, 0
		jnz	short loc_99B79
		push	1
		push	0
		push	2
		push	large 4C3h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word_76A7A, dx
		mov	word ptr dword_76A78, ax

loc_99B79:
		push	1
		push	0
		push	2
		push	large 0FFFAh
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word_77491, dx
		mov	word ptr dword_7748F, ax
		mov	byte ptr [si+30h], 0
		mov	byte ptr [si+2Fh], 1
		mov	byte ptr [si+27h], 3
		mov	byte ptr [bp+var_6], 3
		lea	ax, [bp+var_6]
		push	ax
		call	sub_76510
		pop	cx
		cmp	byte ptr [bp+var_6], 13h
		jz	short loc_99BC5
		mov	byte ptr [bp+var_6], 13h
		lea	ax, [bp+var_6]
		push	ax
		call	sub_76515
		pop	cx

loc_99BC5:
		mov	[bp+var_7], 0
		mov	[bp+var_A], 0FFFFh
		mov	[bp+var_B], 0
		mov	[bp+var_E], 0FFFFh
		mov	[bp+var_10], 0FFFFh
		mov	[bp+var_12], 0FFFFh
		mov	[bp+var_14], 0FFFFh
		mov	[bp+var_15], 0
		push	seg seg008
		push	offset loc_5FB6
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_A8]
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		lea	ax, [bp+var_1B0]
		push	ax
		push	cs
		call	near ptr TextObj_Construct
		add	sp, 8
		mov	[bp+var_16], 0
		mov	[bp+var_18], 3

loc_99C1D:
		or	byte_7D2B4, 2
		push	6B20h
		call	sub_68477
		pop	cx
		jmp	loc_99E47

loc_99C2E:
		mov	al, [di]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		cmp	ax, 2Bh
		jnz	short loc_99C40
		jmp	loc_99D89

loc_99C40:
		cmp	ax, 2Dh
		jz	short loc_99C50
		cmp	ax, 3Dh
		jnz	short loc_99C4D
		jmp	loc_99DDE

loc_99C4D:
		jmp	loc_99E47

loc_99C50:
		mov	al, [di+1]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	[bp+var_2], ax
		mov	cx, 0Ch
		mov	bx, offset word_9A9B2

loc_99C64:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_2]
		jz	short loc_99C74
		add	bx, 2
		loop	short loc_99C64
		jmp	loc_99E47

loc_99C74:
		jmp	word ptr cs:[bx+18h] ; switch jump

loc_99C78:
		mov	[bp+var_18], 1
		jmp	loc_99E47

loc_99C80:
		mov	[bp+var_18], 2
		jmp	loc_99E47

loc_99C88:
		mov	[bp+var_18], 3
		jmp	loc_99E47

loc_99C90:
		mov	byte_76D44, 1

loc_99C95:
		mov	byte_79E75, 1
		jmp	loc_99E47

loc_99C9D:
		mov	al, [di+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		cmp	ax, 41h
		jz	short loc_99CAF
		jmp	short loc_99CC5

loc_99CAF:
		mov	[bp+var_15], 1
		mov	al, [bp+var_7]
		cbw
		or	ax, ax
		jz	short loc_99CBE
		jmp	loc_99E47

loc_99CBE:
		mov	[bp+var_7], 41h
		jmp	loc_99E47

loc_99CC5:
		mov	al, [di+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	[bp+var_7], al
		cmp	byte ptr [di+3], 0
		jnz	short loc_99CDC
		jmp	loc_99E47

loc_99CDC:
		push	10h
		lea	ax, word ptr [bp+var_58+2]
		push	ax
		mov	ax, di
		add	ax, 3
		push	ax
		call	sub_301A
		add	sp, 6
		mov	[bp+var_A], ax
		jmp	loc_99E47

loc_99CF6:
		mov	al, [di+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		mov	[bp+var_B], al
		cmp	byte ptr [di+3], 0
		jnz	short loc_99D0D
		jmp	loc_99E47

loc_99D0D:
		mov	al, [di+3]
		cbw
		add	ax, 0FFD0h
		mov	word ptr [bp+var_58+2], ax
		shl	ax, 4
		add	ax, 200h
		mov	[bp+var_E], ax
		cmp	byte ptr [di+4], 0
		jnz	short loc_99D29
		jmp	loc_99E47

loc_99D29:
		mov	al, [di+4]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_10], ax
		cmp	[bp+var_10], 0
		jnz	short loc_99D3E
		mov	[bp+var_10], 0Ah

loc_99D3E:
		cmp	byte ptr [di+5], 0
		jnz	short loc_99D47
		jmp	loc_99E47

loc_99D47:
		mov	al, [di+5]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_12], ax
		cmp	byte ptr [di+6], 0
		jnz	short loc_99D5A
		jmp	loc_99E47

loc_99D5A:
		mov	al, [di+6]
		cbw
		add	ax, 0FFD0h
		mov	[bp+var_14], ax
		jmp	loc_99E47

loc_99D67:
		mov	byte_7752B, 0
		jmp	loc_99E47

loc_99D6F:
		mov	byte_7752C, 0
		jmp	loc_99E47

loc_99D77:
		mov	byte ptr [si+2Fh], 0
		jmp	loc_99E47

loc_99D7E:
		jmp	loc_99C1D

loc_99D81:
		mov	byte_76866, 0
		jmp	loc_99E47

loc_99D89:
		mov	al, [di+1]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		sub	ax, 45h
		mov	bx, ax
		cmp	bx, 0Fh
		jbe	short loc_99DA1
		jmp	loc_99E47

loc_99DA1:
		shl	bx, 1
		jmp	cs:off_9A992[bx]	; switch jump

loc_99DA8:
		mov	al, [di+2]
		cbw
		push	ax
		call	CRT_CtypeLookup
		pop	cx
		cmp	ax, 42h
		jz	short loc_99DBB
		jmp	loc_99E47

loc_99DBB:
		mov	[bp+var_16], 1
		jmp	loc_99E47

loc_99DC2:
		mov	byte_7752B, 1
		jmp	short loc_99E47

loc_99DC9:
		mov	byte_7752C, 1
		jmp	short loc_99E47

loc_99DD0:
		mov	byte_76866, 1
		jmp	short loc_99E47

loc_99DD7:
		mov	byte_79B64, 1
		jmp	short loc_99E47

loc_99DDE:
		mov	ax, di
		inc	ax
		mov	word ptr [bp+var_58+2], ax
		push	ds
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		or	al, al
		jz	short loc_99E47
		push	12Fh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_99E22
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	word ptr [di], 0E99h
		mov	dword ptr [di+0DDh], 0
		mov	dword ptr [di+0E1h], 0
		mov	ax, di
		jmp	short loc_99E24

loc_99E22:
		mov	ax, di

loc_99E24:
		mov	di, ax
		push	word ptr [bp+var_58+2]
		push	ax
		call	StreamReader_OpenAndRegister_6BDCE
		add	sp, 4
		or	al, al
		jnz	short loc_99E47
		or	di, di
		jz	short loc_99E47
		push	3
		push	di
		mov	bx, [di]
		call	dword ptr [bx+4]
		add	sp, 4
		jmp	short loc_99E47

loc_99E47:
		lea	ax, [bp+var_1B0]
		push	ax
		push	cs
		call	near ptr TextObj_CommandInterp
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_99E5A
		jmp	loc_99C2E

loc_99E5A:
		cmp	word_76ADA, 0
		jz	short loc_99E64
		jmp	loc_99F5A

loc_99E64:
		mov	word_7C9F1, 0
		mov	word_7C9F3, 0FFFFh
		mov	byte_7C9F0, 0FFh
		mov	ax, word_7AF7E
		mov	word_7C9E0, ax
		mov	byte_7C9F0, 0
		mov	word_7C9F5, 0
		cmp	[bp+var_18], 2
		jnz	short loc_99EE6
		cmp	byte_7C9F0, 0
		jz	short loc_99E9E
		push	0EEE0h
		call	sub_1DDFE
		pop	cx
		jmp	short loc_99E9E

loc_99E9E:
		mov	byte_7C9F0, 1
		mov	bx, word_7C9E0
		mov	ax, [bx+4]
		mov	[bp+var_1A], ax
		mov	ax, [bx+6]
		mov	[bp+var_1C], ax
		mov	ax, [bx+8]
		mov	[bp+var_1E], ax
		mov	ax, [bx+0Ah]
		mov	[bp+var_20], ax
		mov	ax, [bp+var_1A]
		mov	word_7C9E6, ax
		mov	ax, [bp+var_1C]
		mov	word_7C9E8, ax
		mov	ax, [bp+var_1E]
		mov	word_7C9EA, ax
		mov	ax, [bp+var_20]
		mov	word_7C9EC, ax
		push	0
		push	62B2h
		call	TextRenderer_ApplyFormatChange_67CBE
		add	sp, 4
		jmp	short loc_99F5A

loc_99EE6:
		cmp	[bp+var_18], 3
		jnz	short loc_99F5A
		cmp	byte_7C9F0, 0
		jz	short loc_99EFE
		push	0EEE0h
		call	sub_1DDFE
		pop	cx
		jmp	short loc_99EFE

loc_99EFE:
		mov	byte_7C9F0, 2
		push	62B0h
		call	sub_1DF9E
		pop	cx
		cmp	[bp+var_16], 0
		jz	short loc_99F18
		mov	word_7C9F5, 1

loc_99F18:
		cmp	byte_7C9F0, 2
		jnz	short loc_99F5A
		push	62B0h
		call	sub_1DF08
		pop	cx
		mov	[bp+var_22], ax
		push	1
		push	62B0h
		call	sub_1E034
		add	sp, 4
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		cmp	[bp+var_22], 0
		jnz	short loc_99F5A
		push	62B0h
		call	sub_1DF1C
		pop	cx
		jmp	short loc_99F5A

loc_99F5A:
		cmp	[bp+var_16], 0
		jz	short loc_99F66
		mov	word_7C9F5, 1

loc_99F66:
		cmp	word_76ADA, 0
		jz	short loc_99F75
		push	0
		push	word_76ADA
		jmp	short loc_99F86

loc_99F75:
		cmp	byte_7752B, 0
		jz	short loc_99F91
		push	large 0
		call	PagedMemory_ReadTextResource_4ACD
		pop	cx
		push	ax

loc_99F86:
		push	6B04h
		call	Memory_TypedFreeVariant_65161
		add	sp, 6

loc_99F91:
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_738C4
		pop	cx
		push	6B04h
		call	sub_76400
		pop	cx
		call	sub_64B0E
		push	dx
		push	ax
		pop	eax
		push	eax
		call	sub_6D1E7
		push	dx
		push	ax
		pop	eax
		pop	edx
		add	edx, eax
		mov	ax, seg seg230
		mov	es, ax
		mov	es:0, edx
		mov	es, ax
		cmp	dword ptr es:0, 2DC6C0h
		jge	short loc_99FDD
		mov	byte ptr word_7974E, 1

loc_99FDD:
		mov	ax, seg seg230
		mov	es, ax
		cmp	dword ptr es:0, 1CBB40h
		jle	short loc_99FF3
		mov	ax, 1
		jmp	short loc_99FF5

loc_99FF3:
		xor	ax, ax

loc_99FF5:
		mov	[bp+var_23], al
		mov	ax, seg seg230
		mov	es, ax
		cmp	dword ptr es:0, 1A9860h
		jle	short loc_9A00E
		mov	ax, 1
		jmp	short loc_9A010

loc_9A00E:
		xor	ax, ax

loc_9A010:
		mov	[bp+var_24], al
		push	seg seg008
		push	offset loc_5FBD
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_51B93
		pop	cx
		mov	dx, 32h
		mov	[bp+var_58], 0F4240h
		mov	ax, seg seg230
		mov	es, ax
		cmp	dword ptr es:0, 2DC6C0h
		jge	short loc_9A051
		xor	dx, dx
		jmp	short loc_9A08F

loc_9A051:
		mov	ax, seg seg230
		mov	es, ax
		cmp	dword ptr es:0, 3D0900h
		jge	short loc_9A06C
		mov	[bp+var_58], 493E0h
		jmp	short loc_9A08F

loc_9A06C:
		mov	ax, seg seg230
		mov	es, ax
		cmp	dword ptr es:0, 4C4B40h
		jge	short loc_9A087
		mov	[bp+var_58], 7A120h
		jmp	short loc_9A08F

loc_9A087:
		mov	[bp+var_58], 16E360h

loc_9A08F:
		push	dx
		call	sub_6D014
		pop	cx
		push	large [bp+var_58]
		call	sub_6D1CF
		add	sp, 4
		push	seg seg008
		push	offset loc_5FCF
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_51B93
		pop	cx
		cmp	[bp+var_23], 0
		jnz	short loc_9A0C9
		jmp	loc_9A38B

loc_9A0C9:
		mov	al, [bp+var_7]
		cbw
		mov	[bp+var_4], ax
		mov	cx, 4
		mov	bx, offset word_9A982

loc_9A0D6:
		mov	ax, cs:[bx]
		cmp	ax, [bp+var_4]
		jz	short loc_9A0E6
		add	bx, 2
		loop	short loc_9A0D6
		jmp	loc_9A38B

loc_9A0E6:
		jmp	word ptr cs:[bx+8] ; switch jump

loc_9A0EA:
		mov	byte_79E66, 1
		push	seg seg008
		push	offset loc_5FE2
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	ax, [bp+var_A]
		mov	[bp+var_26], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9A184
		mov	word ptr [di], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+2], ax
		mov	word_7AFA2, di
		mov	word ptr [di], 0E91h
		mov	word ptr [di+8], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+0Ah], ax
		mov	ax, di
		add	ax, 8
		mov	word_7AFA2, ax
		mov	word ptr [di+8], 0D84h
		mov	dword ptr [di+0Ch], 0
		mov	byte ptr [di+10h], 0
		mov	word ptr [di+12h], 0D7Ch
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 12h
		mov	word_7AFA2, ax
		mov	word ptr [di+12h], 0D84h
		mov	dword ptr [di+16h], 0
		mov	byte ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		push	large 0FFFFFFFFh
		push	0FFFFh
		push	[bp+var_26]
		jmp	loc_9A226

loc_9A184:
		mov	ax, di

loc_9A186:
		mov	word_79E67, ax
		mov	word_79E6B, ax
		jmp	loc_9A38B

loc_9A18F:
		mov	byte_79E66, 3
		push	seg seg008
		push	offset loc_5FE9
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	ax, [bp+var_A]
		mov	[bp+var_28], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9A184
		mov	word ptr [di], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+2], ax
		mov	word_7AFA2, di
		mov	word ptr [di], 0E91h
		mov	word ptr [di+8], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+0Ah], ax
		mov	ax, di
		add	ax, 8
		mov	word_7AFA2, ax
		mov	word ptr [di+8], 0D84h
		mov	dword ptr [di+0Ch], 0
		mov	byte ptr [di+10h], 0
		mov	word ptr [di+12h], 0D7Ch
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 12h
		mov	word_7AFA2, ax
		mov	word ptr [di+12h], 0D84h
		mov	dword ptr [di+16h], 0
		mov	byte ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		push	large 0FFFFFFFFh
		push	0FFFFh
		push	[bp+var_28]

loc_9A226:
		lea	ax, [bp+var_A8]
		push	ax
		push	di
		call	sub_5CB7B
		add	sp, 0Ch
		mov	ax, di
		jmp	loc_9A186
		jmp	loc_9A184

loc_9A23C:
		mov	byte_79E66, 2
		push	seg seg008
		push	offset loc_5FEF
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	ax, [bp+var_A]
		mov	[bp+var_2A], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_9A26B
		jmp	loc_9A386

loc_9A26B:
		mov	word ptr [di], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+2], ax
		mov	word_7AFA2, di
		mov	word ptr [di], 0E91h
		mov	word ptr [di+8], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+0Ah], ax
		mov	ax, di
		add	ax, 8
		mov	word_7AFA2, ax
		mov	word ptr [di+8], 0D84h
		mov	dword ptr [di+0Ch], 0
		mov	byte ptr [di+10h], 0
		mov	word ptr [di+12h], 0D7Ch
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 12h
		mov	word_7AFA2, ax
		mov	word ptr [di+12h], 0D84h
		mov	dword ptr [di+16h], 0
		mov	byte ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		push	large 0FFFFFFFFh
		push	0FFFFh
		push	[bp+var_2A]

loc_9A2D6:
		lea	ax, [bp+var_A8]
		push	ax
		push	di
		call	sub_5CB7B
		add	sp, 0Ch
		mov	ax, di
		jmp	loc_9A388
		jmp	loc_9A386

loc_9A2EC:
		mov	byte_79E66, 4
		push	seg seg008
		push	offset loc_5FEF
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	ax, [bp+var_A]
		mov	[bp+var_2C], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9A386
		mov	word ptr [di], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+2], ax
		mov	word_7AFA2, di
		mov	word ptr [di], 0E91h
		mov	word ptr [di+8], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+0Ah], ax
		mov	ax, di
		add	ax, 8
		mov	word_7AFA2, ax
		mov	word ptr [di+8], 0D84h
		mov	dword ptr [di+0Ch], 0
		mov	byte ptr [di+10h], 0
		mov	word ptr [di+12h], 0D7Ch
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 12h
		mov	word_7AFA2, ax
		mov	word ptr [di+12h], 0D84h
		mov	dword ptr [di+16h], 0
		mov	byte ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		push	large 0FFFFFFFFh
		push	0FFFFh
		push	[bp+var_2C]
		jmp	loc_9A2D6

loc_9A386:
		mov	ax, di

loc_9A388:
		mov	word_79E67, ax

loc_9A38B:
		cmp	word_79E67, 0
		jz	short loc_9A39C
		mov	byte_7CB19, 1
		mov	byte_7CB1A, 1

loc_9A39C:
		cmp	[bp+var_24], 0
		jnz	short loc_9A3A5
		jmp	loc_9A52A

loc_9A3A5:
		mov	al, [bp+var_B]
		cbw
		cmp	ax, 50h
		jnz	short loc_9A3B1
		jmp	loc_9A47A

loc_9A3B1:
		cmp	ax, 53h
		jz	short loc_9A3B9
		jmp	loc_9A52A

loc_9A3B9:
		push	seg seg008
		push	offset loc_5FF4
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	ax, [bp+var_E]
		mov	[bp+var_2E], ax
		mov	ax, [bp+var_10]
		mov	[bp+var_30], ax
		mov	ax, [bp+var_12]
		mov	[bp+var_32], ax
		mov	ax, [bp+var_14]
		mov	[bp+var_34], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_9A3F5
		jmp	loc_9A525

loc_9A3F5:
		mov	word ptr [di], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+2], ax
		mov	word_7AFA2, di
		mov	word ptr [di], 0E91h
		mov	word ptr [di+8], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+0Ah], ax
		mov	ax, di
		add	ax, 8
		mov	word_7AFA2, ax
		mov	word ptr [di+8], 0D84h
		mov	dword ptr [di+0Ch], 0
		mov	byte ptr [di+10h], 0
		mov	word ptr [di+12h], 0D7Ch
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 12h
		mov	word_7AFA2, ax
		mov	word ptr [di+12h], 0D84h
		mov	dword ptr [di+16h], 0
		mov	byte ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		push	[bp+var_34]
		push	[bp+var_32]
		push	[bp+var_30]
		push	[bp+var_2E]

loc_9A464:
		lea	ax, [bp+var_A8]
		push	ax
		push	di
		call	sub_5CB7B
		add	sp, 0Ch
		mov	ax, di
		jmp	loc_9A527
		jmp	loc_9A525

loc_9A47A:
		push	seg seg008
		push	offset loc_5FF7
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	ax, [bp+var_E]
		mov	[bp+var_36], ax
		mov	ax, [bp+var_10]
		mov	[bp+var_38], ax
		mov	ax, [bp+var_12]
		mov	[bp+var_3A], ax
		mov	ax, [bp+var_14]
		mov	[bp+var_3C], ax
		push	7Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9A525
		mov	word ptr [di], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+2], ax
		mov	word_7AFA2, di
		mov	word ptr [di], 0E91h
		mov	word ptr [di+8], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+0Ah], ax
		mov	ax, di
		add	ax, 8
		mov	word_7AFA2, ax
		mov	word ptr [di+8], 0D84h
		mov	dword ptr [di+0Ch], 0
		mov	byte ptr [di+10h], 0
		mov	word ptr [di+12h], 0D7Ch
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 12h
		mov	word_7AFA2, ax
		mov	word ptr [di+12h], 0D84h
		mov	dword ptr [di+16h], 0
		mov	byte ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		push	[bp+var_3C]
		push	[bp+var_3A]
		push	[bp+var_38]
		push	[bp+var_36]
		jmp	loc_9A464

loc_9A525:
		mov	ax, di

loc_9A527:
		mov	word_79E69, ax

loc_9A52A:
		cmp	word_79E69, 0
		jz	short loc_9A539
		mov	al, 1
		mov	byte_7CB1C, al
		mov	byte_7CB1B, al

loc_9A539:
		cmp	word_79E6B, 0
		jz	short loc_9A543
		jmp	loc_9A5F6

loc_9A543:
		cmp	[bp+var_15], 0
		jnz	short loc_9A54C
		jmp	loc_9A5F6

loc_9A54C:
		cmp	[bp+var_23], 0
		jnz	short loc_9A555
		jmp	loc_9A5F6

loc_9A555:
		push	seg seg008
		push	offset loc_5FE9
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	7Ch
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9A5F1
		mov	word ptr [di], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+2], ax
		mov	word_7AFA2, di
		mov	word ptr [di], 0E91h
		mov	word ptr [di+8], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+0Ah], ax
		mov	ax, di
		add	ax, 8
		mov	word_7AFA2, ax
		mov	word ptr [di+8], 0D84h
		mov	dword ptr [di+0Ch], 0
		mov	byte ptr [di+10h], 0
		mov	word ptr [di+12h], 0D7Ch
		mov	[di+14h], ax
		mov	ax, di
		add	ax, 12h
		mov	word_7AFA2, ax
		mov	word ptr [di+12h], 0D84h
		mov	dword ptr [di+16h], 0
		mov	byte ptr [di+1Ah], 0
		mov	ax, di
		add	ax, 1Ch
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		push	large 0FFFFFFFFh
		push	large 0FFFFFFFFh
		lea	ax, [bp+var_A8]
		push	ax
		push	di
		call	sub_5CB7B
		add	sp, 0Ch
		mov	ax, di
		jmp	short loc_9A5F3

loc_9A5F1:
		mov	ax, di

loc_9A5F3:
		mov	word_79E6B, ax

loc_9A5F6:
		cmp	word_79E6B, 0
		jz	short loc_9A602
		mov	byte_7CB1A, 1

loc_9A602:
		cmp	[bp+arg_6], 0
		jnz	short loc_9A60B
		jmp	loc_9A6C2

loc_9A60B:
		push	2
		push	[bp+arg_6]
		call	TextRenderer_LoadResourceFile_6E338
		add	sp, 4
		mov	word ptr [bp+var_40+2], dx
		mov	word ptr [bp+var_40], ax
		mov	eax, [bp+var_40]
		mov	[bp+var_4A], eax
		mov	[bp+var_46], 2
		mov	[bp+var_45], 1
		mov	[bp+var_44], 0
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	0
		call	GlyphObject_ConstructWithBuffer_69161
		add	sp, 4
		mov	word_77533, ax
		cmp	[bp+var_45], 0
		jz	short loc_9A66B
		cmp	[bp+var_4A], 0
		jz	short loc_9A66B
		push	0
		mov	al, [bp+var_46]
		push	ax
		lea	ax, word ptr [bp+var_4A]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9A66B

loc_9A66B:
		mov	[bp+var_4A], 0
		mov	[bp+var_45], 0
		mov	[bp+var_44], 0
		mov	bx, word_77533
		mov	word ptr [bx+10h], 1
		mov	word ptr [bx+12h], 0
		push	2Dh
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		add	sp, 4
		mov	bx, word_77533
		mov	[bx+14h], ax
		push	bx
		push	word_7AF7E
		push	0
		call	sub_75D04
		add	sp, 6
		mov	word_77535, ax
		push	0Fh
		push	ax
		call	sub_75D09
		add	sp, 4
		mov	ax, word_77535
		mov	word_79260, ax

loc_9A6C2:
		push	0
		call	sub_524B
		pop	cx
		or	al, al
		jz	short loc_9A6E0
		push	0
		push	0
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_738BF
		add	sp, 6

loc_9A6E0:
		push	1
		call	sub_524B
		pop	cx
		or	al, al
		jz	short loc_9A6FE
		push	0
		push	1
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_738BF
		add	sp, 6

loc_9A6FE:
		mov	byte_76866, 1
		cmp	byte_7CB19, 0
		jnz	short loc_9A70D
		jmp	loc_9A797

loc_9A70D:
		push	seg seg008
		push	offset loc_5FFB
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	ax, word_79E67
		mov	[bp+var_4C], ax
		push	6
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9A792
		mov	word ptr [di], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+2], ax
		mov	word_7AFA2, di
		mov	word ptr [di], 0E89h
		mov	byte_79D65, 1
		mov	byte_79D87, 0
		mov	word_79D66, 0
		mov	ax, [bp+var_4C]
		mov	word_79D6C, ax
		push	ax
		push	693Dh
		call	sub_5C97F
		add	sp, 4
		push	word_79D6C
		push	694Fh
		call	sub_5C97F
		add	sp, 4
		push	di
		call	sub_7540F
		pop	cx
		push	0FFFFh
		lea	ax, [bp+var_A8]
		push	ax
		push	di
		call	sub_75419
		add	sp, 6
		mov	ax, di
		jmp	short loc_9A794

loc_9A792:
		mov	ax, di

loc_9A794:
		mov	word_79E6F, ax

loc_9A797:
		cmp	byte_7CB1A, 0
		jz	short loc_9A812
		mov	ax, word_79E6B
		mov	[bp+var_4E], ax
		push	125h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_9A80D
		mov	word ptr [di], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+2], ax
		mov	word_7AFA2, di
		mov	word ptr [di], 0E81h
		push	seg stub253
		push	offset sub_735A5
		push	large 1001Bh
		push	0Ah
		mov	ax, di
		add	ax, 6
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	seg stub259
		push	offset sub_73851
		push	large 10001h
		push	11h
		mov	ax, di
		add	ax, 114h
		push	ax
		call	CRT_Doprnt_Dispatch
		add	sp, 0Ch
		push	[bp+var_4E]
		push	di
		call	sub_75465
		add	sp, 4
		mov	ax, di
		jmp	short loc_9A80F

loc_9A80D:
		mov	ax, di

loc_9A80F:
		mov	word_79E6D, ax

loc_9A812:
		cmp	byte_7CB1B, 0
		jnz	short loc_9A81C
		jmp	loc_9A8D0

loc_9A81C:
		mov	ax, word_79E69
		mov	[bp+var_50], ax
		push	28h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_9A833
		jmp	loc_9A8CB

loc_9A833:
		mov	word ptr [di], 0D7Ch
		mov	ax, word_7AFA2
		mov	[di+2], ax
		mov	word_7AFA2, di
		mov	word ptr [di], 0E79h
		mov	ax, di
		add	ax, 0Bh
		mov	word ptr [bp+var_54+2], ds
		mov	word ptr [bp+var_54], ax
		cmp	[bp+var_54], 0
		jz	short loc_9A85C
		mov	dx, word ptr [bp+var_54+2]
		jmp	short loc_9A86D

loc_9A85C:
		push	large 0Ah
		call	CRT_Malloc32_Retry
		add	sp, 4
		mov	word ptr [bp+var_54+2], dx
		mov	word ptr [bp+var_54], ax

loc_9A86D:
		or	ax, dx
		jz	short loc_9A891
		les	bx, word ptr [bp+var_54]
		mov	dword ptr es:[bx], 0
		mov	byte ptr es:[bx+4], 2
		mov	byte ptr es:[bx+5], 0
		mov	dword ptr es:[bx+6], 0
		jmp	short loc_9A891

loc_9A891:
		mov	dword ptr [di+18h], 0
		mov	byte ptr [di+1Ch], 2
		mov	byte ptr [di+1Dh], 0
		mov	dword ptr [di+1Eh], 0
		mov	dword ptr [di+5], 0
		mov	word ptr [di+9], 0
		mov	word ptr [di+16h], 0
		push	[bp+var_50]
		push	di
		call	sub_754AA
		add	sp, 4
		mov	ax, di
		jmp	short loc_9A8CD

loc_9A8CB:
		mov	ax, di

loc_9A8CD:
		mov	word_79E71, ax

loc_9A8D0:
		cmp	byte_7CB1C, 0
		jz	short loc_9A8F8
		push	0
		call	sub_5AE86
		pop	cx
		mov	word_79E73, ax
		mov	ax, seg seg230
		mov	es, ax
		cmp	dword ptr es:0, 44AA20h
		jle	short loc_9A8F8
		mov	byte_76D44, 1

loc_9A8F8:
		cmp	byte_7752C, 0
		jz	short loc_9A916
		push	large 78h
		push	seg seg056
		push	offset sub_227F4
		push	6C8Eh
		call	Stopwatch_RegisterTickModuleVariant_6F7A1
		add	sp, 0Ah
		mov	[si+31h], ax

loc_9A916:
		push	seg seg008
		push	offset loc_6002
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	ss
		lea	ax, [bp+var_A8]
		push	ax
		call	Config_LoadOrCreate
		add	sp, 4
		mov	byte_7752E, al
		push	6996h
		call	sub_75625
		pop	cx
		call	sub_56238
		mov	byte_7752A, 1
		push	2
		lea	ax, [bp+var_1AA]
		push	ax
		call	StreamReader_Close_6C110
		add	sp, 4

loc_9A95C:
		push	cs
		call	near ptr sub_99A1F
		push	seg seg008
		push	offset loc_600D
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_A8]
		push	ax
		call	sub_51B93
		pop	cx
		pop	di
		pop	si
		leave
		retf
sub_99B3B		endp

; START OF FUNCTION CHUNK FOR sub_99B3B
word_9A982	dw 41h
		dw 47h
		dw 52h
		dw 57h
off_9A98A	dw offset loc_9A18F
		dw offset loc_9A23C
		dw offset loc_9A0EA
		dw offset loc_9A2EC
off_9A992	dw offset loc_99DC2
		dw offset loc_99E47
		dw offset loc_99E47
		dw offset loc_99E47
		dw offset loc_99E47
		dw offset loc_99E47
		dw offset loc_99DD7
		dw offset loc_99DA8
		dw offset loc_99E47
		dw offset loc_99E47
		dw offset loc_99DD0
		dw offset loc_99E47
		dw offset loc_99E47
		dw offset loc_99E47
		dw offset loc_99E47
		dw offset loc_99DC9
word_9A9B2	dw 31h
		dw 32h
		dw 33h
		dw 35h
		dw 44h
		dw 45h
		dw 4Dh
		dw 4Fh
		dw 52h
		dw 54h
		dw 56h
		dw 57h
off_9A9CA	dw offset loc_99C78
		dw offset loc_99C80
		dw offset loc_99C88
		dw offset loc_99C90
		dw offset loc_99CF6
		dw offset loc_99D67
		dw offset loc_99C9D
		dw offset loc_99D81
		dw offset loc_99C95
		dw offset loc_99D6F
		dw offset loc_99D77
		dw offset loc_99D7E
; END OF FUNCTION CHUNK FOR sub_99B3B

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à CPU_SpeedCalibration (sub_27E61 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,97L — calibration de
; vitesse CPU : vérifie le support SMARTDRV/detect (INT15 AH=12h BX=736Dh), exécute 5 boucles
; de multiplications chronométrées via sub_27144 (le lecteur PIT haute précision) : routine de
; calibration de la vitesse du processeur au démarrage — pertinente pour le problème de
; difficulté IA dépendante du matériel déjà noté dans le projet.
; ==============================================================================================
CPU_SpeedCalibration		proc far

var_10		= byte ptr -10h
var_E		= dword ptr -0Eh
var_A		= dword ptr -0Ah
var_6		= dword ptr -6
var_1		= byte ptr -1

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	ax, 1209h
		mov	bx, 736Dh
		pushf
		push	ds
		int	15h
		sti
		mov	[bp+var_1], bl
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_6], eax
		xor	di, di
		jmp	short loc_9AA28

loc_9AA09:
		xor	ax, ax
		xor	bx, bx
		xor	dx, dx
		xor	si, si
		mov	ax, 0A000h
		mov	ds, ax
		xor	si, si
		mov	cx, 4000h

loc_9AA1B:
		lodsd
		imul	ecx
		shrd	eax, edx, 10h
		loop	short loc_9AA1B
		inc	di

loc_9AA28:
		cmp	di, 5
		jl	short loc_9AA09
		cmp	[bp+var_1], 0
		jz	short loc_9AA3B
		mov	ax, 1209h
		mov	bx, 534Dh
		int	15h

loc_9AA3B:
		pop	ds
		popf
		call	PIT_ReadHighPrecision
		push	dx
		push	ax
		pop	eax
		mov	[bp+var_A], eax
		sub	eax, [bp+var_6]
		imul	eax, eax, 3E8h
		mov	ebx, 1770h
		cdq
		idiv	ebx
		mov	[bp+var_E], eax
		cmp	[bp+var_E], 0D7h
		jg	short loc_9AA74
		mov	[bp+var_10], 0
		jmp	short loc_9AA88

loc_9AA74:
		cmp	[bp+var_E], 0FAh
		jg	short loc_9AA84
		mov	[bp+var_10], 1
		jmp	short loc_9AA88

loc_9AA84:
		mov	[bp+var_10], 2

loc_9AA88:
		mov	al, [bp+var_10]
		pop	di
		pop	si
		leave
		retf
CPU_SpeedCalibration		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9AA8F		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		cmp	byte_7752A, 0
		jnz	short loc_9AAA0
		jmp	loc_9AB45

loc_9AAA0:
		cmp	dword_7748F, 0
		jz	short loc_9AABA
		push	0
		push	2
		push	0D5Fh
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_9AABA:
		cmp	dword_76A78, 0
		jz	short loc_9AAD4
		push	0
		push	2
		push	348h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8

loc_9AAD4:
		cmp	word_77535, 0
		jz	short loc_9AAF4
		mov	ax, word_77535
		add	ax, 2
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		push	word_77535
		call	sub_3B2
		pop	cx
		jmp	short loc_9AAF4

loc_9AAF4:
		mov	word_77535, 0
		cmp	word_77533, 0
		jz	short loc_9AB14
		push	3
		push	word_77533
		mov	bx, word_77533
		mov	bx, [bx]
		call	dword ptr [bx]
		add	sp, 4
		jmp	short loc_9AB14

loc_9AB14:
		mov	word_77533, 0
		cmp	byte_7752C, 0
		jz	short loc_9AB2F
		push	word ptr [si+31h]
		push	6C8Eh
		call	Stopwatch_UnregisterTickModule_6F7DE
		add	sp, 4

loc_9AB2F:
		mov	ax, si
		add	ax, 5
		push	ax
		call	sub_738C9
		pop	cx
		call	StreamReader_DispatchWrite_6BC22
		mov	byte_7752A, 0

loc_9AB45:
		pop	si
		pop	bp
		retf
sub_9AA8F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9AB48		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		push	cs
		call	near ptr sub_9AA8F
		pop	cx
		pop	bp
		retf
sub_9AB48		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9AB56		proc far

var_19C		= word ptr -19Ch
var_196		= word ptr -196h
var_13F		= dword ptr -13Fh
var_13B		= dword ptr -13Bh
var_136		= word ptr -136h
var_122		= word ptr -122h
var_10E		= word ptr -10Eh
var_FB		= word ptr -0FBh
var_E6		= word ptr -0E6h
var_AE		= word ptr -0AEh
var_9E		= word ptr -9Eh
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_96		= word ptr -96h
var_46		= dword ptr -46h
var_42		= dword ptr -42h
var_3E		= dword ptr -3Eh
var_39		= byte ptr -39h
var_38		= word ptr -38h
var_36		= word ptr -36h
var_34		= word ptr -34h
var_32		= dword ptr -32h
var_2E		= byte ptr -2Eh
var_2D		= byte ptr -2Dh
var_2C		= dword ptr -2Ch
var_28		= dword ptr -28h
var_24		= byte ptr -24h
var_23		= byte ptr -23h
var_22		= dword ptr -22h
var_1E		= dword ptr -1Eh
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= dword ptr -12h
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 19Ch
		push	si
		mov	[bp+var_4], 100h
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	64DEh
		call	Cockpit_PanAzimuthUpdate_2E46C
		add	sp, 4
		cmp	byte_7C9F0, 2
		jnz	short loc_9AB81
		mov	ax, 1
		jmp	short loc_9AB83

loc_9AB81:
		xor	ax, ax

loc_9AB83:
		or	ax, ax
		jz	short loc_9ABB0
		cmp	byte_7C9F0, 2
		jnz	short loc_9AB9D
		push	0
		push	62B0h
		call	sub_1E034
		add	sp, 4
		jmp	short loc_9AB9D

loc_9AB9D:
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		jmp	short loc_9ABBF

loc_9ABB0:
		push	6324h
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4

loc_9ABBF:
		push	large dword_7CC11
		push	0
		call	sub_74A87
		add	sp, 6
		mov	[bp+var_6], 0
		mov	[bp+var_8], 0
		mov	[bp+var_12], 0
		mov	[bp+var_E], 2
		mov	[bp+var_D], 0
		mov	[bp+var_C], 0
		mov	[bp+var_1A], 0
		mov	[bp+var_18], 0
		mov	[bp+var_16], 13Fh
		mov	[bp+var_14], 0C7h
		cmp	byte_76D40, 0
		jz	short loc_9AC19
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4

loc_9AC19:
		push	1
		push	0
		push	3
		push	large 0FA00h
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_1E+2], dx
		mov	word ptr [bp+var_1E], ax
		mov	eax, [bp+var_1E]
		mov	[bp+var_12], eax
		mov	[bp+var_E], 3
		mov	[bp+var_D], 1
		mov	[bp+var_C], 0
		mov	[bp+var_C], 0FA00h
		lea	ax, [bp+var_1A]
		push	ax
		push	0
		mov	al, [bp+var_E]
		push	ax
		push	large [bp+var_12]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6AEF8
		add	sp, 8
		push	large dword_7CC11
		push	0
		call	sub_74A87
		add	sp, 6
		mov	[bp+var_28], 0
		mov	[bp+var_24], 2
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		mov	[bp+var_32], 0
		mov	[bp+var_2E], 2
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		push	seg seg008
		push	offset loc_6210
		lea	ax, [bp+var_10E]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	seg seg008
		push	offset loc_6019
		lea	ax, [bp+var_136]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	ss
		lea	ax, [bp+var_136]
		push	ax
		push	ss
		lea	ax, [bp+var_10E]
		push	ax
		push	ds
		push	offset aFONTS_1
		lea	ax, [bp+var_E6]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_19C]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_19C], 508h
		mov	[bp+var_13B], 100h
		mov	[bp+var_13F], 0
		mov	[bp+var_19C], 0E61h
		push	1
		lea	ax, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		mov	bx, [bp+var_19C]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_19C]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_46+2], dx
		mov	word ptr [bp+var_46], ax
		mov	eax, [bp+var_46]
		mov	[bp+var_28], eax
		mov	[bp+var_24], 3
		mov	[bp+var_23], 1
		mov	[bp+var_22], 0
		mov	eax, [bp+var_42]
		mov	[bp+var_22], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_3E]
		push	0
		mov	al, [bp+var_24]
		push	ax
		push	large [bp+var_28]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_19C]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_19C]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		push	seg seg008
		push	offset loc_601E
		lea	ax, [bp+var_10E]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	seg seg008
		push	offset loc_6019
		lea	ax, [bp+var_136]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	ss
		lea	ax, [bp+var_136]
		push	ax
		push	ss
		lea	ax, [bp+var_10E]
		push	ax
		push	ds
		push	offset aFONTS_1
		lea	ax, [bp+var_E6]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_19C]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_19C], 508h
		mov	[bp+var_13B], 100h
		mov	[bp+var_13F], 0
		mov	[bp+var_19C], 0E61h
		push	1
		lea	ax, [bp+var_E6]
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		mov	bx, [bp+var_19C]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_19C]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_3E], eax
		mov	[bp+var_42], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_46+2], dx
		mov	word ptr [bp+var_46], ax
		mov	eax, [bp+var_46]
		mov	[bp+var_32], eax
		mov	[bp+var_2E], 3
		mov	[bp+var_2D], 1
		mov	[bp+var_2C], 0
		mov	eax, [bp+var_42]
		mov	[bp+var_2C], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_3E]
		push	0
		mov	al, [bp+var_2E]
		push	ax
		push	large [bp+var_32]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_19C]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_19C]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_19C]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		lea	ax, [bp+var_AE]
		push	ax
		call	GlyphObject_AllocateBuffer_69123
		pop	cx
		lea	ax, word ptr [bp+var_32]
		push	ax
		lea	ax, [bp+var_AE]
		push	ax
		call	sub_690A8
		add	sp, 4
		mov	[bp+var_9E], 1
		mov	[bp+var_9C], 0
		mov	[bp+var_9A], 3
		mov	bx, word_79260
		mov	ax, [bx+14h]
		mov	[bp+var_34], ax
		lea	ax, [bp+var_AE]
		mov	[bx+14h], ax
		push	0FFh
		push	bx
		call	sub_75D09
		add	sp, 4
		push	large 320082h
		push	large 250042h
		lea	ax, [bp+var_122]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		push	large 320096h
		push	large 250042h
		lea	ax, [bp+var_196]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		push	large 0
		mov	al, [bp+var_24]
		push	ax
		push	large [bp+var_28]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 250042h
		push	word_7AF7E
		call	sub_6A514
		add	sp, 0Ch
		push	seg seg008
		push	offset loc_5917
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 2Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9B013
		lea	ax, [bp+var_96]
		mov	word ptr [bp+var_3E+2], ds
		mov	word ptr [bp+var_3E], ax
		push	large 0B001Eh
		push	large 380038h
		push	si
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 0C9Ah
		mov	dword ptr [si+24h], 0
		push	large [bp+var_3E]
		push	si
		call	sub_74B18
		add	sp, 6
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	ax, word_7921A
		mov	[si+2Ah], ax
		mov	[si+28h], ax
		mov	word ptr [si+22h], 0FFFFh
		mov	word ptr [si+0Eh], 0E2Dh
		lea	ax, [bp+var_8]
		mov	[si+2Ch], ax
		mov	ax, si
		jmp	short loc_9B015

loc_9B013:
		mov	ax, si

loc_9B015:
		push	ax
		lea	ax, [bp+var_122]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_FB]
		mov	word ptr [bx+18h], 0
		mov	word ptr [bx+22h], 0
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	bx
		push	15h
		lea	ax, [bp+var_122]
		push	ax
		call	sub_74C76
		add	sp, 6
		push	seg seg008
		push	offset loc_591B
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	large 2Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_9B0CD
		lea	ax, [bp+var_96]
		mov	word ptr [bp+var_42+2], ds
		mov	word ptr [bp+var_42], ax
		push	large 0B001Eh
		push	large 380060h
		push	si
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [si+0Eh], 0C9Ah
		mov	dword ptr [si+24h], 0
		push	large [bp+var_42]
		push	si
		call	sub_74B18
		add	sp, 6
		mov	word ptr [si+1Eh], 0
		mov	word ptr [si+20h], 0
		mov	ax, word_7921A
		mov	[si+2Ah], ax
		mov	[si+28h], ax
		mov	word ptr [si+22h], 0FFFFh
		mov	word ptr [si+0Eh], 0E2Dh
		lea	ax, [bp+var_6]
		mov	[si+2Ch], ax
		mov	ax, si
		jmp	short loc_9B0CF

loc_9B0CD:
		mov	ax, si

loc_9B0CF:
		push	ax
		lea	ax, [bp+var_122]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_FB]
		mov	word ptr [bx+18h], 0
		mov	word ptr [bx+22h], 0
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	bx
		push	31h
		lea	ax, [bp+var_122]
		push	ax
		call	sub_74C76
		add	sp, 6
		lea	ax, [bp+var_122]
		push	ax
		call	sub_74CC6
		pop	cx
		lea	ax, [bp+var_122]
		push	ax
		call	sub_74AD7
		pop	cx
		push	seg seg008
		push	offset loc_6025
		lea	ax, [bp+var_96]
		push	ax
		call	sub_54BE
		add	sp, 6
		push	word_79260
		push	0FFFFh
		lea	ax, [bp+var_96]
		push	ax
		push	large 3B0070h
		call	sub_74BA9
		add	sp, 0Ah
		lea	ax, [bp+var_122]
		push	ax
		call	sub_74ADC
		pop	cx
		jmp	short loc_9B163

loc_9B154:
		push	0
		lea	ax, [bp+var_122]
		push	ax
		call	sub_74CE4
		add	sp, 4

loc_9B163:
		cmp	[bp+var_6], 0
		jnz	short loc_9B16F
		cmp	[bp+var_8], 0
		jz	short loc_9B154

loc_9B16F:
		lea	ax, [bp+var_122]
		push	ax
		call	sub_74CEE
		pop	cx
		push	2
		lea	ax, [bp+var_196]
		push	ax
		call	sub_74CA8
		add	sp, 4
		push	2
		lea	ax, [bp+var_122]
		push	ax
		call	sub_74CA8
		add	sp, 4
		push	2
		lea	ax, [bp+var_AE]
		push	ax
		call	sub_69368
		add	sp, 4
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		mov	ax, [bp+var_34]
		mov	[bp+var_36], ax
		mov	bx, word_79260
		mov	[bx+14h], ax
		cmp	byte_76D40, 0
		jz	short loc_9B1CE
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4

loc_9B1CE:
		lea	ax, [bp+var_1A]
		push	ax
		push	0
		mov	al, [bp+var_E]
		push	ax
		push	large [bp+var_12]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	word_7AF7E
		call	sub_6ACDA
		add	sp, 8
		cmp	byte_7C9F0, 2
		jnz	short loc_9B201
		mov	ax, 1
		jmp	short loc_9B203

loc_9B201:
		xor	ax, ax

loc_9B203:
		or	ax, ax
		jz	short loc_9B249
		cmp	byte_7C9F0, 2
		jnz	short loc_9B249
		push	62B0h
		call	sub_1DF08
		pop	cx
		mov	[bp+var_38], ax
		push	1
		push	62B0h
		call	sub_1E034
		add	sp, 4
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		cmp	[bp+var_38], 0
		jnz	short loc_9B249
		push	62B0h
		call	sub_1DF1C
		pop	cx
		jmp	short loc_9B249

loc_9B249:
		mov	al, byte ptr [bp+var_8]
		mov	[bp+var_39], al
		cmp	[bp+var_2D], 0
		jz	short loc_9B273
		cmp	[bp+var_32], 0
		jz	short loc_9B273
		push	0
		mov	al, [bp+var_2E]
		push	ax
		lea	ax, word ptr [bp+var_32]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9B273

loc_9B273:
		mov	[bp+var_32], 0
		mov	[bp+var_2D], 0
		mov	[bp+var_2C], 0
		cmp	[bp+var_23], 0
		jz	short loc_9B2AB
		cmp	[bp+var_28], 0
		jz	short loc_9B2AB
		push	0
		mov	al, [bp+var_24]
		push	ax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9B2AB

loc_9B2AB:
		mov	[bp+var_28], 0
		mov	[bp+var_23], 0
		mov	[bp+var_22], 0
		cmp	[bp+var_D], 0
		jz	short loc_9B2E3
		cmp	[bp+var_12], 0
		jz	short loc_9B2E3
		push	0
		mov	al, [bp+var_E]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9B2E3

loc_9B2E3:
		mov	al, [bp+var_39]
		pop	si
		leave
		retf
sub_9AB56		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9B2E9		proc far
		push	bp
		mov	bp, sp
		cmp	byte_7755C, 0
		jz	short loc_9B32F
		cmp	byte_7CABB, 0
		jz	short loc_9B318
		cmp	dword_7CAB6, 0
		jz	short loc_9B318
		push	0
		mov	al, byte_7CABA
		push	ax
		push	6386h
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9B318

loc_9B318:
		mov	dword_7CAB6, 0
		mov	byte_7CABB, 0
		mov	dword_7CABC, 0

loc_9B32F:
		pop	bp
		retf
sub_9B2E9		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9B331		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	word ptr [si+4], 0D7Ch
		mov	ax, word_7AFA2
		mov	[si+6], ax
		mov	ax, si
		add	ax, 4
		mov	word_7AFA2, ax
		mov	word ptr [si+4], 0D84h
		mov	dword ptr [si+8], 0
		mov	byte ptr [si+0Ch], 0
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0FFFFh
		mov	ax, si
		pop	si
		pop	bp
		retf
sub_9B331		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9B36A		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9B3A8
		mov	word ptr [si+0Eh], 0C9Ah
		push	large [si+24h]
		call	sub_3C0
		add	sp, 4
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_9B3A8
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_9B3A8

loc_9B3A8:
		pop	di
		pop	si
		pop	bp
		retf
sub_9B36A		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via vtable
; (DATA XREF seg339) — enveloppe appelant StreamReader_Destruct_638FF. Référencée directement
; par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_9B3AC		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_6E329
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_9B3AC		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9B3BB		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9B3E6
		mov	word ptr [si], 0E61h
		push	0
		push	si
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		test	di, 1
		jz	short loc_9B3E6
		push	si
		call	sub_3B2
		pop	cx

loc_9B3E6:
		pop	di
		pop	si
		pop	bp
		retf
sub_9B3BB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9B3EA		proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jnz	short loc_9B3FF
		jmp	loc_9B4B0

loc_9B3FF:
		mov	word ptr [si], 0E79h
		push	si
		call	sub_754AF
		pop	cx
		cmp	byte ptr [si+1Dh], 0
		jz	short loc_9B430
		cmp	dword ptr [si+18h], 0
		jz	short loc_9B430
		push	0
		mov	al, [si+1Ch]
		push	ax
		mov	ax, si
		add	ax, 18h
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9B430

loc_9B430:
		mov	dword ptr [si+18h], 0
		mov	byte ptr [si+1Dh], 0
		mov	dword ptr [si+1Eh], 0
		mov	ax, si
		add	ax, 0Bh
		mov	dx, ds
		or	ax, dx
		jz	short loc_9B498
		cmp	byte ptr [si+10h], 0
		jz	short loc_9B480
		mov	ax, [si+0Bh]
		or	ax, [si+0Dh]
		jz	short loc_9B480
		push	0
		mov	al, [si+0Fh]
		push	ax
		mov	ax, [si+0Dh]
		mov	dx, [si+0Bh]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		lea	ax, [bp+var_4]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9B480

loc_9B480:
		mov	word ptr [si+0Dh], 0
		mov	word ptr [si+0Bh], 0
		mov	byte ptr [si+10h], 0
		mov	dword ptr [si+11h], 0
		jmp	short loc_9B498

loc_9B498:
		push	0
		push	si
		call	sub_68298
		add	sp, 4
		test	di, 1
		jz	short loc_9B4B0
		push	si
		call	sub_3B2
		pop	cx

loc_9B4B0:
		pop	di
		pop	si
		leave
		retf
sub_9B3EA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via vtable
; (DATA XREF seg339) — enveloppe appelant StreamReader_Destruct_638FF. Référencée directement
; par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_9B4B4		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_754AF
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_9B4B4		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9B4C3		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9B52D
		mov	word ptr [si], 0E81h
		push	si
		call	sub_75474
		pop	cx
		push	seg stub259
		push	offset sub_73810
		push	large 10001h
		push	11h
		mov	ax, si
		add	ax, 114h
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	seg stub253
		push	offset sub_735A0
		push	large 1001Bh
		push	0Ah
		mov	ax, si
		add	ax, 6
		push	ax
		call	CRT_Doprnt_Core
		add	sp, 0Ch
		push	0
		push	si
		call	sub_68298
		add	sp, 4
		test	di, 1
		jz	short loc_9B52D
		push	si
		call	sub_3B2
		pop	cx

loc_9B52D:
		pop	di
		pop	si
		pop	bp
		retf
sub_9B4C3		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via vtable
; (DATA XREF seg339) — enveloppe appelant StreamReader_Destruct_638FF. Référencée directement
; par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_9B531		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_75474
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_9B531		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 1 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AircraftDamageModel_ReleaseStreamAndDestruct_7556A
; (sub_7556A de STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier
; ici. — far, combine ResourceRecord_Helper_645A5 (seg193), StreamReader_ReleaseBuffer_65643
; (seg195), libère l'objet (sub_338).
; ==============================================================================================
AircraftDamageModel_ReleaseStreamAndDestruct_9B540		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9B572
		mov	word ptr [si], 0E89h
		push	si
		call	sub_75423
		pop	cx
		push	0
		push	si
		call	sub_68298
		add	sp, 4
		test	di, 1
		jz	short loc_9B572
		push	si
		call	sub_3B2
		pop	cx

loc_9B572:
		pop	di
		pop	si
		pop	bp
		retf
AircraftDamageModel_ReleaseStreamAndDestruct_9B540		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via vtable
; (DATA XREF seg339) — enveloppe appelant StreamReader_Destruct_638FF. Référencée directement
; par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_9B576		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_75423
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_9B576		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9B585		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9B5E7
		mov	word ptr [si], 0E91h
		push	si
		call	sub_5D36D
		pop	cx
		push	2
		mov	ax, si
		add	ax, 1Ch
		push	ax
		call	StreamReader_Close_6C110
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 12h
		push	ax
		call	sub_1CD03
		add	sp, 4
		push	2
		mov	ax, si
		add	ax, 8
		push	ax
		call	sub_1CD03
		add	sp, 4
		push	0
		push	si
		call	sub_68298
		add	sp, 4
		test	di, 1
		jz	short loc_9B5E7
		push	si
		call	sub_3B2
		pop	cx

loc_9B5E7:
		pop	di
		pop	si
		pop	bp
		retf
sub_9B585		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de OPTEST.EXE : code identique instruction par instruction à
; StreamReader_DestructWrapper_3D231 (sub_3D231 de OPTEST.EXE). Résumé repris de OPTEST.EXE ;
; appelants et contexte à revérifier ici. — Reprise de STRIKE.EXE : code identique instruction
; par instruction à StreamReader_DestructWrapper_659C1 (sub_659C1 de STRIKE.EXE). Résumé
; repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far, référencée via vtable
; (DATA XREF seg339) — enveloppe appelant StreamReader_Destruct_638FF. Référencée directement
; par TextRenderer_Main (sub_27477, seg048).
; ==============================================================================================
StreamReader_DestructWrapper_9B5EB		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		push	ax
		call	sub_5D36D
		pop	cx
		pop	bp
		retf
StreamReader_DestructWrapper_9B5EB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9B5FA		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9B62C
		mov	word ptr [si], 0E99h
		push	si
		call	StreamReader_CloseAndUnregister_6BDAC
		pop	cx
		push	0
		push	si
		call	StreamReader_Close_6C110
		add	sp, 4
		test	di, 1
		jz	short loc_9B62C
		push	si
		call	sub_3B2
		pop	cx

loc_9B62C:
		pop	di
		pop	si
		pop	bp
		retf
sub_9B5FA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9B630		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_9B665
		push	si
		call	Music_ChannelStopSequence_5C915
		pop	cx
		push	2
		mov	ax, si
		add	ax, 4
		push	ax
		call	sub_1CD03
		add	sp, 4
		test	di, 1
		jz	short loc_9B665
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_9B665

loc_9B665:
		pop	di
		pop	si
		pop	bp
		retf
sub_9B630		endp
ovr259		ends
