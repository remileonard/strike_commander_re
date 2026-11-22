ovr245		segment	para public 'OVERLAY' use16
		assume cs:ovr245
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 3 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à AIManeuver_LoadFormationDataC_7AEE0 (sub_7AEE0 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; même motif que AIManeuver_LoadFormationData_77E78 (seg232) — chargement de données de
; formation.
; ==============================================================================================
AIManeuver_LoadFormationDataC_8A8E0		proc far

var_C		= dword ptr -0Ch
var_8		= dword ptr -8
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		or	si, si
		jnz	short loc_8A8FE
		push	80h
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jnz	short loc_8A8FE
		jmp	loc_8A998

loc_8A8FE:
		mov	ax, si
		add	ax, 20h
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		mov	word ptr [si+50h], 6D0h
		mov	ax, si
		add	ax, 53h
		push	ax
		call	String_ConstructEmpty
		pop	cx
		push	si
		call	sub_73DDD
		pop	cx
		mov	word ptr [si+50h], 700h
		push	1Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jz	short loc_8A96B
		mov	word ptr [di], 698h
		mov	word ptr [di+2], 0
		mov	word ptr [di+4], 0
		mov	byte ptr [di+0Fh], 0
		mov	word ptr [di+10h], 0
		mov	word ptr [di+12h], 0
		mov	byte ptr [di+1Dh], 0
		push	large 0C7013Fh
		push	large 0
		push	ax
		call	sub_73DB0
		add	sp, 0Ah
		mov	ax, di
		jmp	short loc_8A96D

loc_8A96B:
		mov	ax, di

loc_8A96D:
		mov	[si+5Ch], ax
		sub	sp, 4
		mov	[bp+var_8], 0A00h
		sub	sp, 4
		mov	[bp+var_C], 2800h
		push	large 0C350h
		push	word ptr [si+5Ch]
		push	si
		call	sub_73DE2
		add	sp, 10h

loc_8A998:
		mov	ax, si
		pop	di
		pop	si
		pop	bp
		retf
AIManeuver_LoadFormationDataC_8A8E0		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8A99E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		mov	al, 11h
		pop	bp
		retf
sub_8A99E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; Reprise de STRIKE.EXE : même suite d'instructions, 2 opérande(s) différent(s) (adresses de
; données ou constantes) — à vérifier à EntityTracker_RegisterAndSelect (sub_7AFA8 de
; STRIKE.EXE). Résumé repris de STRIKE.EXE ; appelants et contexte à revérifier ici. — far,
; 20L, LUE INTEGRALEMENT. RENOMMEE (ancien 'Kneeboard_UpdateEntry'). CONFIRME DIRECTEMENT
; 0x59CD comme adresse de la liste globale trackee : ajoute l'entite passee en parametre a
; cette liste (EntityTracker_AddEntryObj) PUIS l'applique comme selection active
; (EntityTracker_ApplySelection). Appelee depuis MissionRecord_LoadEntityDatabase_7B035 —
; candidat serieux pour la fonction qui peuple cette liste avec les entites de la mission, a
; lire.
; ==============================================================================================
EntityTracker_RegisterAndSelect		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		push	67B7h
		call	sub_73787
		add	sp, 4
		push	si
		push	67B7h
		call	sub_737D2
		add	sp, 4
		pop	si
		pop	bp
		retf
EntityTracker_RegisterAndSelect		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8A9CA		proc far

var_6		= word ptr -6
var_4		= word ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	si, [bp+arg_0]
		cmp	word ptr [si+5Ch], 0
		jz	short loc_8AA2B
		push	si
		push	62D4h
		call	Camera_CopyState
		add	sp, 4
		mov	ax, [si+5Ch]
		add	ax, 2
		mov	[bp+var_6], ax
		push	ax
		lea	ax, [bp+var_4]
		push	ax
		call	sub_6735D
		add	sp, 4
		push	si
		call	Render_SkyAndSeaBackground_2D6FC
		pop	cx
		push	si
		push	67ADh
		call	sub_1E40E
		add	sp, 4
		push	6496h
		call	sub_292D9
		pop	cx
		push	6496h
		call	sub_292BC
		pop	cx
		lea	ax, [bp+var_4]
		push	ax
		call	sub_67383
		pop	cx

loc_8AA2B:
		pop	si
		leave
		retf
sub_8A9CA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8AA2E		proc far

var_284		= dword ptr -284h
var_27A		= dword ptr -27Ah
var_276		= dword ptr -276h
var_272		= dword ptr -272h
var_26E		= dword ptr -26Eh
var_26A		= dword ptr -26Ah
var_266		= dword ptr -266h
var_262		= dword ptr -262h
var_25E		= dword ptr -25Eh
var_25A		= dword ptr -25Ah
var_256		= dword ptr -256h
var_252		= dword ptr -252h
var_24E		= dword ptr -24Eh
var_24A		= dword ptr -24Ah
var_246		= dword ptr -246h
var_242		= dword ptr -242h
var_23E		= dword ptr -23Eh
var_23A		= dword ptr -23Ah
var_236		= dword ptr -236h
var_232		= dword ptr -232h
var_22E		= dword ptr -22Eh
var_22A		= dword ptr -22Ah
var_226		= dword ptr -226h
var_222		= dword ptr -222h
var_21E		= dword ptr -21Eh
var_21A		= dword ptr -21Ah
var_216		= dword ptr -216h
var_212		= dword ptr -212h
var_20E		= dword ptr -20Eh
var_20A		= dword ptr -20Ah
var_206		= dword ptr -206h
var_202		= dword ptr -202h
var_1FE		= dword ptr -1FEh
var_1FA		= dword ptr -1FAh
var_1F6		= dword ptr -1F6h
var_1F2		= dword ptr -1F2h
var_1EE		= dword ptr -1EEh
var_1EA		= dword ptr -1EAh
var_1E6		= dword ptr -1E6h
var_1E2		= dword ptr -1E2h
var_1DE		= dword ptr -1DEh
var_1DA		= dword ptr -1DAh
var_1D6		= dword ptr -1D6h
var_1D2		= dword ptr -1D2h
var_1CE		= dword ptr -1CEh
var_1CA		= dword ptr -1CAh
var_1C6		= dword ptr -1C6h
var_1C2		= dword ptr -1C2h
var_1BE		= dword ptr -1BEh
var_1BA		= dword ptr -1BAh
var_1B6		= dword ptr -1B6h
var_1B2		= dword ptr -1B2h
var_1AE		= dword ptr -1AEh
var_1AA		= dword ptr -1AAh
var_1A6		= dword ptr -1A6h
var_1A2		= dword ptr -1A2h
var_19E		= dword ptr -19Eh
var_19A		= dword ptr -19Ah
var_196		= dword ptr -196h
var_192		= dword ptr -192h
var_18E		= dword ptr -18Eh
var_18A		= dword ptr -18Ah
var_186		= dword ptr -186h
var_182		= dword ptr -182h
var_17E		= dword ptr -17Eh
var_17A		= dword ptr -17Ah
var_176		= dword ptr -176h
var_172		= dword ptr -172h
var_16E		= dword ptr -16Eh
var_16A		= dword ptr -16Ah
var_166		= dword ptr -166h
var_162		= dword ptr -162h
var_15E		= dword ptr -15Eh
var_15A		= dword ptr -15Ah
var_156		= dword ptr -156h
var_152		= dword ptr -152h
var_14E		= dword ptr -14Eh
var_14A		= dword ptr -14Ah
var_146		= dword ptr -146h
var_142		= dword ptr -142h
var_140		= dword ptr -140h
var_13E		= dword ptr -13Eh
var_13C		= dword ptr -13Ch
var_13A		= dword ptr -13Ah
var_138		= dword ptr -138h
var_136		= dword ptr -136h
var_134		= dword ptr -134h
var_132		= dword ptr -132h
var_130		= dword ptr -130h
var_12E		= dword ptr -12Eh
var_12C		= dword ptr -12Ch
var_12A		= dword ptr -12Ah
var_128		= dword ptr -128h
var_126		= dword ptr -126h
var_124		= dword ptr -124h
var_122		= dword ptr -122h
var_120		= dword ptr -120h
var_11E		= dword ptr -11Eh
var_11C		= dword ptr -11Ch
var_11A		= dword ptr -11Ah
var_118		= dword ptr -118h
var_116		= dword ptr -116h
var_114		= dword ptr -114h
var_112		= dword ptr -112h
var_110		= dword ptr -110h
var_10E		= dword ptr -10Eh
var_10C		= dword ptr -10Ch
var_10A		= dword ptr -10Ah
var_108		= dword ptr -108h
var_106		= dword ptr -106h
var_104		= dword ptr -104h
var_100		= dword ptr -100h
var_FC		= dword ptr -0FCh
var_F8		= dword ptr -0F8h
var_F4		= dword ptr -0F4h
var_F0		= dword ptr -0F0h
var_EC		= dword ptr -0ECh
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
var_B2		= dword ptr -0B2h
var_B0		= dword ptr -0B0h
var_AE		= dword ptr -0AEh
var_AC		= dword ptr -0ACh
var_AA		= dword ptr -0AAh
var_A8		= dword ptr -0A8h
var_A6		= dword ptr -0A6h
var_A4		= dword ptr -0A4h
var_A2		= dword ptr -0A2h
var_A0		= dword ptr -0A0h
var_9E		= dword ptr -9Eh
var_9C		= dword ptr -9Ch
var_9A		= dword ptr -9Ah
var_98		= dword ptr -98h
var_96		= dword ptr -96h
var_94		= dword ptr -94h
var_90		= dword ptr -90h
var_8E		= dword ptr -8Eh
var_8C		= dword ptr -8Ch
var_88		= dword ptr -88h
var_84		= dword ptr -84h
var_80		= dword ptr -80h
var_7C		= dword ptr -7Ch
var_78		= dword ptr -78h
var_76		= dword ptr -76h
var_74		= dword ptr -74h
var_72		= dword ptr -72h
var_6E		= dword ptr -6Eh
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
var_2E		= dword ptr -2Eh
var_2C		= dword ptr -2Ch
var_28		= byte ptr -28h
var_27		= byte ptr -27h
var_26		= dword ptr -26h
var_21		= byte ptr -21h
var_20		= dword ptr -20h
var_1C		= word ptr -1Ch
var_1A		= word ptr -1Ah
var_18		= word ptr -18h
var_16		= word ptr -16h
var_12		= dword ptr -12h
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= dword ptr -0Ch
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= dword ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= byte ptr  8
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 27Ah
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	[bp+var_7], 1
		push	14h
		call	Music_SetPendingTune_5ED30
		pop	cx
		mov	[bp+var_8], 0
		mov	byte_79787, 1
		mov	byte_7975D, 0
		mov	[bp+var_12], 0
		mov	[bp+var_E], 2
		mov	[bp+var_D], 0
		mov	[bp+var_C], 0
		push	0
		push	cs
		call	near ptr AIManeuver_LoadFormationDataC_8A8E0
		pop	cx
		mov	si, ax
		mov	ax, [si+5Ch]
		add	ax, 2
		mov	[bp+var_18], ax
		push	ax
		lea	ax, [bp+var_16]
		push	ax
		call	sub_6735D
		add	sp, 4
		mov	ax, di
		add	ax, 12h
		mov	[bp+var_1A], ax
		mov	bx, [bp+var_1A]
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		push	si
		push	cs
		call	near ptr EntityTracker_RegisterAndSelect
		pop	cx
		push	0
		push	word_77696
		call	sub_735AF
		add	sp, 4
		mov	ax, word_77696
		add	ax, 0F6h
		mov	[bp+var_1C], ax
		mov	bx, [bp+var_1C]
		mov	eax, [bx]
		mov	[bp+var_20], eax
		mov	al, [bx+4]
		mov	[bp+var_21], al
		mov	eax, [bp+var_20]
		mov	[bp+var_12], eax
		mov	al, [bp+var_21]
		mov	[bp+var_E], al
		mov	[bp+var_D], 0
		mov	[bp+var_C], 0
		mov	eax, [bx+6]
		mov	[bp+var_C], eax
		push	14h
		call	Music_SetPendingTune_5ED30
		pop	cx
		cmp	[bp+arg_2], 3
		jnb	short loc_8AB0D
		jmp	loc_8AC01

loc_8AB0D:
		mov	[bp+var_26], 19h
		mov	eax, [bp+var_26]
		mov	[bp+var_6], eax
		mov	[bp+var_28], 1
		jmp	loc_8ABF8

loc_8AB24:
		call	Input_AltKeyDetailToggles_5093D
		mov	[bp+var_28], al
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_2C+2], ax
		mov	bx, word ptr [bp+var_2C+2]
		mov	eax, [bx]
		mov	[si+14h], eax
		mov	eax, [bx+4]
		mov	[si+18h], eax
		mov	eax, [bx+8]
		mov	[si+1Ch], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	AI_ComputeGeometryHelper_58BF2
		add	sp, 4
		call	sub_50F18
		push	large 0
		mov	al, [bp+var_E]
		push	ax
		push	large [bp+var_12]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		push	large 0
		push	word_7AF7C
		call	sub_6A514
		add	sp, 0Ch
		push	62B0h
		call	sub_1E055
		pop	cx
		mov	eax, dword_7976E
		sub	[bp+var_6], eax
		cmp	[bp+var_6], 0
		jg	short loc_8ABAD
		mov	ax, 1
		jmp	short loc_8ABAF

loc_8ABAD:
		xor	ax, ax

loc_8ABAF:
		or	al, al
		jz	short loc_8ABCE
		inc	[bp+var_2]
		mov	ax, [bp+var_2]
		cmp	ax, 8
		jge	short loc_8AC01
		mov	[bp+var_2E], 19h
		mov	eax, [bp+var_2E]
		mov	[bp+var_6], eax

loc_8ABCE:
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_8ABDE
		mov	[bp+var_8], 1
		jmp	short loc_8AC01

loc_8ABDE:
		cmp	byte_77537, 0
		jz	short loc_8ABEB
		mov	[bp+var_8], 1
		jmp	short loc_8AC01

loc_8ABEB:
		cmp	byte_79B9B, 0
		jz	short loc_8ABF8
		mov	[bp+var_8], 1
		jmp	short loc_8AC01

loc_8ABF8:
		cmp	[bp+var_28], 0
		jz	short loc_8AC01
		jmp	loc_8AB24

loc_8AC01:
		mov	al, [bp+arg_4]
		mov	ah, 0
		or	ax, ax
		jz	short loc_8AC0D
		jmp	loc_8B2AF

loc_8AC0D:
		cmp	[bp+arg_2], 1
		jnb	short loc_8AC16
		jmp	loc_8B2AF

loc_8AC16:
		mov	al, [bp+var_8]
		mov	ah, 0
		or	ax, ax
		jz	short loc_8AC22
		jmp	loc_8B2AF

loc_8AC22:
		mov	eax, [di+20h]
		shl	eax, 2
		mov	[bp+var_30], eax
		mov	[bp+var_2C], eax
		shl	eax, 1
		mov	[bp+var_38], eax
		mov	[bp+var_34], eax
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_3C+2], ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	word ptr [bp+var_3C], ax
		mov	bx, word ptr [bp+var_3C]
		mov	eax, [bx]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		mov	eax, [bp+var_40]
		mov	[bp+var_44], eax
		mov	eax, [bx+4]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_48]
		mov	[bp+var_4C], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_50], eax
		mov	eax, [bp+var_50]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_44]
		mov	[bp+var_166], eax
		mov	eax, [bp+var_4C]
		mov	[bp+var_162], eax
		mov	eax, [bp+var_54]
		mov	[bp+var_15E], eax
		mov	bx, word ptr [bp+var_3C+2]
		mov	eax, [bx]
		sub	eax, [bp+var_166]
		mov	[bp+var_172], eax
		mov	eax, [bx+4]
		sub	eax, [bp+var_162]
		mov	[bp+var_16E], eax
		mov	eax, [bx+8]
		sub	eax, [bp+var_15E]
		mov	[bp+var_16A], eax
		mov	eax, [bp+var_172]
		mov	[bp+var_17E], eax
		mov	eax, [bp+var_16E]
		mov	[bp+var_17A], eax
		mov	eax, [bp+var_16A]
		mov	[bp+var_176], eax
		mov	eax, [bp+var_17E]
		mov	[si+14h], eax
		mov	eax, [bp+var_17A]
		mov	[si+18h], eax
		mov	eax, [bp+var_176]
		mov	[si+1Ch], eax
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_58+2], ax
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_58], ax
		mov	bx, word ptr [bp+var_58+2]
		mov	eax, [bx]
		mov	bx, word ptr [bp+var_58]
		sub	eax, [bx]
		mov	[bp+var_1A2], eax
		mov	bx, word ptr [bp+var_58+2]
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+var_58]
		sub	eax, [bx+4]
		mov	[bp+var_19E], eax
		mov	bx, word ptr [bp+var_58+2]
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+var_58]
		sub	eax, [bx+8]
		mov	[bp+var_19A], eax
		mov	eax, [bp+var_1A2]
		mov	[bp+var_1AE], eax
		mov	eax, [bp+var_19E]
		mov	[bp+var_1AA], eax
		mov	eax, [bp+var_19A]
		mov	[bp+var_1A6], eax
		mov	eax, [bp+var_1AE]
		mov	[bp+var_196], eax
		mov	eax, [bp+var_1AA]
		mov	[bp+var_192], eax
		mov	eax, [bp+var_1A6]
		mov	[bp+var_18E], eax
		lea	ax, word ptr [bp+var_196]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		jmp	loc_8B28A

loc_8ADC1:
		mov	[bp+var_5C], 0FFFFFF67h
		mov	[bp+var_60], 0FFFFFEE7h
		mov	[bp+var_64], 66h
		mov	eax, [bp+var_5C]
		mov	[bp+var_1BA], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_1B6], eax
		mov	eax, [bp+var_64]
		mov	[bp+var_1B2], eax
		mov	eax, [bp+var_1BA]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1BA], eax
		mov	eax, [bp+var_1B6]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1B6], eax
		mov	eax, [bp+var_1B2]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1B2], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	word ptr [bp+var_68+2], ax
		mov	bx, word ptr [bp+var_68+2]
		mov	eax, [bx]
		mov	[bp+var_1C6], eax
		mov	eax, [bx+4]
		mov	[bp+var_1C2], eax
		mov	eax, [bx+8]
		mov	[bp+var_1BE], eax
		lea	ax, word ptr [bp+var_1EA]
		push	ax
		call	Formation_ComputeGeometryHelper_58B0C
		pop	cx
		lea	ax, word ptr [bp+var_1C6]
		push	ax
		lea	ax, word ptr [bp+var_1EA]
		push	ax
		call	sub_59B77
		add	sp, 4
		lea	ax, word ptr [bp+var_1EA]
		push	ax
		lea	ax, word ptr [bp+var_1BA]
		push	ax
		call	sub_5A629
		add	sp, 4
		lea	ax, word ptr [bp+var_1BA]
		push	ax
		push	di
		push	si
		call	sub_2CADA
		add	sp, 6
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_68], ax
		mov	bx, word ptr [bp+var_68]
		mov	eax, [bx]
		add	[bp+var_1BA], eax
		mov	eax, [bx+4]
		add	[bp+var_1B6], eax
		mov	eax, [bx+8]
		add	[bp+var_1B2], eax
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_6C+2], ax
		mov	bx, word ptr [bp+var_6C+2]
		mov	eax, [bp+var_1BA]
		sub	eax, [bx]
		mov	[bp+var_202], eax
		mov	eax, [bp+var_1B6]
		sub	eax, [bx+4]
		mov	[bp+var_1FE], eax
		mov	eax, [bp+var_1B2]
		sub	eax, [bx+8]
		mov	[bp+var_1FA], eax
		mov	eax, [bp+var_202]
		mov	[bp+var_1F6], eax
		mov	eax, [bp+var_1FE]
		mov	[bp+var_1F2], eax
		mov	eax, [bp+var_1FA]
		mov	[bp+var_1EE], eax
		push	eax
		push	large [bp+var_1F2]
		push	large [bp+var_1F6]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_6E], eax
		mov	[bp+var_72], eax
		cmp	eax, [bp+var_34]
		jle	short loc_8AF40
		mov	ax, 1
		jmp	short loc_8AF42

loc_8AF40:
		xor	ax, ax

loc_8AF42:
		or	al, al
		jz	short loc_8AFBF
		lea	ax, word ptr [bp+var_34]
		push	ax
		lea	ax, word ptr [bp+var_1F6]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4
		mov	eax, [bp+var_1BA]
		sub	eax, [bp+var_1F6]
		mov	[bp+var_20E], eax
		mov	eax, [bp+var_1B6]
		sub	eax, [bp+var_1F2]
		mov	[bp+var_20A], eax
		mov	eax, [bp+var_1B2]
		sub	eax, [bp+var_1EE]
		mov	[bp+var_206], eax
		mov	eax, [bp+var_20E]
		mov	[bp+var_21A], eax
		mov	eax, [bp+var_20A]
		mov	[bp+var_216], eax
		mov	eax, [bp+var_206]
		mov	[bp+var_212], eax
		mov	eax, [bp+var_21A]
		mov	[si+14h], eax
		mov	eax, [bp+var_216]
		mov	[si+18h], eax
		mov	eax, [bp+var_212]
		mov	[si+1Ch], eax
		jmp	short loc_8B036

loc_8AFBF:
		mov	[bp+var_76], 400h
		mov	eax, [bp+var_1F6]
		mov	edx, eax
		mov	ecx, [bp+var_76]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1F6], eax
		mov	eax, [bp+var_1F2]
		mov	edx, eax
		mov	ecx, [bp+var_76]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1F2], eax
		mov	eax, [bp+var_1EE]
		mov	edx, eax
		mov	ecx, [bp+var_76]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_1EE], eax
		mov	eax, [bp+var_1F6]
		add	[si+14h], eax
		mov	eax, [bp+var_1F2]
		add	[si+18h], eax
		mov	eax, [bp+var_1EE]
		add	[si+1Ch], eax

loc_8B036:
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_78], ax
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_7C+2], ax
		mov	bx, word ptr [bp+var_78]
		mov	eax, [bx]
		mov	bx, word ptr [bp+var_7C+2]
		sub	eax, [bx]
		mov	[bp+var_226], eax
		mov	bx, word ptr [bp+var_78]
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+var_7C+2]
		sub	eax, [bx+4]
		mov	[bp+var_222], eax
		mov	bx, word ptr [bp+var_78]
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+var_7C+2]
		sub	eax, [bx+8]
		mov	[bp+var_21E], eax
		mov	eax, [bp+var_226]
		mov	[bp+var_232], eax
		mov	eax, [bp+var_222]
		mov	[bp+var_22E], eax
		mov	eax, [bp+var_21E]
		mov	[bp+var_22A], eax
		mov	eax, [bp+var_232]
		mov	[bp+var_18A], eax
		mov	eax, [bp+var_22E]
		mov	[bp+var_186], eax
		mov	eax, [bp+var_22A]
		mov	[bp+var_182], eax
		mov	ax, si
		add	ax, 2Ch
		mov	word ptr [bp+var_7C], ax
		push	large [bp+var_182]
		push	large [bp+var_186]
		push	large [bp+var_18A]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_80], eax
		mov	[bp+var_84], eax
		mov	bx, word ptr [bp+var_7C]
		mov	eax, [bx]
		mov	edx, [bp+var_84]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_88], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_8C], eax
		mov	eax, [bx+4]
		mov	edx, [bp+var_84]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_90], eax
		mov	eax, [bp+var_90]
		mov	[bp+var_94], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_84]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_98], eax
		mov	eax, [bp+var_98]
		mov	[bp+var_9C], eax
		mov	eax, [bp+var_8C]
		mov	[bp+var_23E], eax
		mov	eax, [bp+var_94]
		mov	[bp+var_23A], eax
		mov	eax, [bp+var_9C]
		mov	[bp+var_236], eax
		mov	eax, [bp+var_18A]
		mov	ebx, 0Ah
		cdq
		idiv	ebx
		mov	[bp+var_A0], eax
		mov	[bp+var_A4], eax
		mov	eax, [bp+var_186]
		cdq
		idiv	ebx
		mov	[bp+var_A8], eax
		mov	[bp+var_AC], eax
		mov	eax, [bp+var_182]
		cdq
		idiv	ebx
		mov	[bp+var_B0], eax
		mov	[bp+var_B4], eax
		mov	eax, [bp+var_A4]
		mov	[bp+var_24A], eax
		mov	eax, [bp+var_AC]
		mov	[bp+var_246], eax
		mov	eax, [bp+var_B4]
		mov	[bp+var_242], eax
		mov	eax, [bp+var_23E]
		add	eax, [bp+var_24A]
		mov	[bp+var_256], eax
		mov	eax, [bp+var_23A]
		add	eax, [bp+var_246]
		mov	[bp+var_252], eax
		mov	eax, [bp+var_236]
		add	eax, [bp+var_242]
		mov	[bp+var_24E], eax
		mov	eax, [bp+var_256]
		mov	[bp+var_262], eax
		mov	eax, [bp+var_252]
		mov	[bp+var_25E], eax
		mov	eax, [bp+var_24E]
		mov	[bp+var_25A], eax
		mov	eax, [bp+var_262]
		mov	[bp+var_196], eax
		mov	eax, [bp+var_25E]
		mov	[bp+var_192], eax
		mov	eax, [bp+var_25A]
		mov	[bp+var_18E], eax
		lea	ax, word ptr [bp+var_196]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		call	sub_50F18
		push	62B0h
		call	sub_1E055
		pop	cx
		cmp	byte_7769E, 0
		jz	short loc_8B260
		mov	[bp+var_7], 0
		mov	[bp+var_8], 1
		jmp	short loc_8B2AF

loc_8B260:
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, 1
		jnz	short loc_8B270
		mov	[bp+var_8], 1
		jmp	short loc_8B2AF

loc_8B270:
		cmp	byte_77537, 0
		jz	short loc_8B27D
		mov	[bp+var_8], 1
		jmp	short loc_8B2AF

loc_8B27D:
		cmp	byte_79B9B, 0
		jz	short loc_8B28A
		mov	[bp+var_8], 1
		jmp	short loc_8B2AF

loc_8B28A:
		call	Input_AltKeyDetailToggles_5093D
		or	al, al
		jz	short loc_8B2AF
		cmp	byte_79B9B, 0
		jnz	short loc_8B2AF
		mov	al, byte_77699
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8B2AF
		mov	al, [bp+var_8]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_8B2AF
		jmp	loc_8ADC1

loc_8B2AF:
		mov	al, [bp+var_8]
		mov	ah, 0
		or	ax, ax
		jz	short loc_8B2BB
		jmp	loc_8C09B

loc_8B2BB:
		cmp	byte_79B9B, 0
		jz	short loc_8B2C5
		jmp	loc_8C09B

loc_8B2C5:
		mov	[bp+var_30], 380h
		mov	eax, [di+20h]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_34], eax
		mov	eax, [bp+var_34]
		mov	[bp+var_2C], eax
		shl	eax, 3
		mov	[bp+var_3C], eax
		mov	[bp+var_38], eax
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_40+2], ax
		mov	bx, word ptr [bp+var_40+2]
		mov	eax, [bx]
		mov	[bp+var_172], eax
		mov	eax, [bx+4]
		mov	[bp+var_16E], eax
		mov	eax, [bx+8]
		mov	[bp+var_16A], eax
		mov	al, [di+77h]
		and	ax, 1
		mov	byte ptr [bp+var_40+1], al
		push	0C7h
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	[bp+var_48], 100h
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	64DEh
		call	Cockpit_PanAzimuthUpdate_2E46C
		add	sp, 4
		cmp	byte ptr [bp+var_40+1], 0
		jnz	short loc_8B352
		jmp	loc_8B5C1

loc_8B352:
		push	di
		push	ss
		lea	ax, word ptr [bp+var_1A2]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+50h]
		add	sp, 6
		mov	eax, [bp+var_1A2]
		mov	[bp+var_17E], eax
		mov	eax, [bp+var_19E]
		mov	[bp+var_17A], eax
		mov	eax, [bp+var_19A]
		mov	[bp+var_176], eax
		mov	eax, [bp+var_17E]
		mov	[bp+var_196], eax
		mov	eax, [bp+var_17A]
		mov	[bp+var_192], eax
		mov	eax, [bp+var_176]
		mov	[bp+var_18E], eax
		mov	[bp+var_4C], 0A00h
		mov	eax, [bp+var_4C]
		mov	[bp+var_176], eax
		lea	ax, word ptr [bp+var_196]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	[bp+var_50], 299h
		mov	eax, [bp+var_17E]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_17E], eax
		mov	eax, [bp+var_17A]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_17A], eax
		mov	eax, [bp+var_176]
		mov	edx, [bp+var_50]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_176], eax
		push	large [bp+var_176]
		push	large [bp+var_17A]
		push	large [bp+var_17E]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_54], eax
		mov	[bp+var_58], eax
		mov	[bp+var_5C], 0A000h
		cmp	eax, [bp+var_5C]
		jge	short loc_8B441
		mov	ax, 1
		jmp	short loc_8B443

loc_8B441:
		xor	ax, ax

loc_8B443:
		or	al, al
		jz	short loc_8B460
		mov	[bp+var_60], 0A000h
		lea	ax, word ptr [bp+var_60]
		push	ax
		lea	ax, word ptr [bp+var_17E]
		push	ax
		call	Vector_SetLength_57879
		add	sp, 4

loc_8B460:
		mov	eax, [bp+var_17A]
		neg	eax
		mov	[bp+var_64], eax
		mov	[bp+var_68], eax
		mov	[bp+var_196], eax
		mov	eax, [bp+var_17E]
		mov	[bp+var_192], eax
		mov	[bp+var_6C], 0
		mov	eax, [bp+var_6C]
		mov	[bp+var_18E], eax
		lea	ax, word ptr [bp+var_196]
		push	ax
		call	Vector_NormalizeInPlace_57715
		pop	cx
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_6E], ax
		mov	ax, si
		add	ax, 2Ch
		mov	word ptr [bp+var_72+2], ax
		mov	bx, word ptr [bp+var_72+2]
		mov	eax, [bx]
		mov	edx, [bp+var_38]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_74], eax
		mov	eax, [bp+var_74]
		mov	[bp+var_78], eax
		mov	eax, [bx+4]
		mov	edx, [bp+var_38]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_7C], eax
		mov	eax, [bp+var_7C]
		mov	[bp+var_80], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_38]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_84], eax
		mov	eax, [bp+var_84]
		mov	[bp+var_88], eax
		mov	eax, [bp+var_78]
		mov	[bp+var_1AE], eax
		mov	eax, [bp+var_80]
		mov	[bp+var_1AA], eax
		mov	eax, [bp+var_88]
		mov	[bp+var_1A6], eax
		mov	bx, word ptr [bp+var_6E]
		mov	eax, [bx]
		sub	eax, [bp+var_1AE]
		mov	[bp+var_1BA], eax
		mov	eax, [bx+4]
		sub	eax, [bp+var_1AA]
		mov	[bp+var_1B6], eax
		mov	eax, [bx+8]
		sub	eax, [bp+var_1A6]
		mov	[bp+var_1B2], eax
		mov	eax, [bp+var_1BA]
		mov	[bp+var_1C6], eax
		mov	eax, [bp+var_1B6]
		mov	[bp+var_1C2], eax
		mov	eax, [bp+var_1B2]
		mov	[bp+var_1BE], eax
		mov	eax, [bp+var_1C6]
		mov	[si+14h], eax
		mov	eax, [bp+var_1C2]
		mov	[si+18h], eax
		mov	eax, [bp+var_1BE]
		mov	[si+1Ch], eax
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_8C+2], ax
		mov	bx, word ptr [bp+var_8C+2]
		mov	eax, [bx]
		mov	[bp+var_18A], eax
		mov	eax, [bx+4]
		mov	[bp+var_186], eax
		mov	eax, [bx+8]
		mov	[bp+var_182], eax
		mov	[bp+var_8E], 400h
		mov	eax, [bp+var_8E]
		mov	[bp+var_44], eax
		jmp	loc_8B8D7

loc_8B5C1:
		cmp	word_7CAE0, 0
		jnz	short loc_8B5CB
		jmp	loc_8B74E

loc_8B5CB:
		mov	ax, word_7CAE0
		add	ax, 12h
		mov	word ptr [bp+var_104+2], ax
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_104], ax
		mov	bx, word ptr [bp+var_104+2]
		mov	eax, [bx]
		mov	bx, word ptr [bp+var_104]
		sub	eax, [bx]
		mov	[bp+var_226], eax
		mov	bx, word ptr [bp+var_104+2]
		mov	eax, [bx+4]
		mov	bx, word ptr [bp+var_104]
		sub	eax, [bx+4]
		mov	[bp+var_222], eax
		mov	bx, word ptr [bp+var_104+2]
		mov	eax, [bx+8]
		mov	bx, word ptr [bp+var_104]
		sub	eax, [bx+8]
		mov	[bp+var_21E], eax
		mov	eax, [bp+var_226]
		mov	[bp+var_21A], eax
		mov	eax, [bp+var_222]
		mov	[bp+var_216], eax
		mov	eax, [bp+var_21E]
		mov	[bp+var_212], eax
		lea	ax, word ptr [bp+var_21A]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	ax, si
		add	ax, 2Ch
		mov	word ptr [bp+var_106], ax
		mov	bx, word ptr [bp+var_106]
		mov	eax, [bx]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10A], eax
		mov	eax, [bp+var_10A]
		mov	[bp+var_10E], eax
		mov	eax, [bx+4]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_112], eax
		mov	eax, [bp+var_112]
		mov	[bp+var_116], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_11A], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_10E]
		mov	[bp+var_232], eax
		mov	eax, [bp+var_116]
		mov	[bp+var_22E], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_22A], eax
		mov	eax, [bp+var_172]
		sub	eax, [bp+var_232]
		mov	[bp+var_23E], eax
		mov	eax, [bp+var_16E]
		sub	eax, [bp+var_22E]
		mov	[bp+var_23A], eax
		mov	eax, [bp+var_16A]
		sub	eax, [bp+var_22A]
		mov	[bp+var_236], eax
		mov	eax, [bp+var_23E]
		mov	[bp+var_24A], eax
		mov	eax, [bp+var_23A]
		mov	[bp+var_246], eax
		mov	eax, [bp+var_236]
		mov	[bp+var_242], eax
		mov	eax, [bp+var_24A]
		mov	[si+14h], eax
		mov	eax, [bp+var_246]
		mov	[si+18h], eax
		mov	eax, [bp+var_242]
		mov	[si+1Ch], eax
		mov	[bp+var_122], 300h
		mov	eax, [bp+var_122]
		mov	[bp+var_44], eax
		jmp	loc_8B8D7

loc_8B74E:
		mov	ax, di
		add	ax, 12h
		mov	word ptr [bp+var_90], ax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 0Ch
		mov	word ptr [bp+var_94+2], ax
		mov	bx, word ptr [bp+var_94+2]
		mov	eax, [bx]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_96], eax
		mov	eax, [bp+var_96]
		mov	[bp+var_9A], eax
		mov	eax, [bx+4]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_9E], eax
		mov	eax, [bp+var_9E]
		mov	[bp+var_A2], eax
		mov	eax, [bx+8]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_A6], eax
		mov	eax, [bp+var_A6]
		mov	[bp+var_AA], eax
		mov	eax, [bp+var_9A]
		mov	[bp+var_1D2], eax
		mov	eax, [bp+var_A2]
		mov	[bp+var_1CE], eax
		mov	eax, [bp+var_AA]
		mov	[bp+var_1CA], eax
		mov	bx, word ptr [bp+var_90]
		mov	eax, [bx]
		sub	eax, [bp+var_1D2]
		mov	[bp+var_1DE], eax
		mov	eax, [bx+4]
		sub	eax, [bp+var_1CE]
		mov	[bp+var_1DA], eax
		mov	eax, [bx+8]
		sub	eax, [bp+var_1CA]
		mov	[bp+var_1D6], eax
		mov	eax, [bp+var_1DE]
		mov	[bp+var_1EA], eax
		mov	eax, [bp+var_1DA]
		mov	[bp+var_1E6], eax
		mov	eax, [bp+var_1D6]
		mov	[bp+var_1E2], eax
		mov	eax, [bp+var_1EA]
		mov	[si+14h], eax
		mov	eax, [bp+var_1E6]
		mov	[si+18h], eax
		mov	eax, [bp+var_1E2]
		mov	[si+1Ch], eax
		mov	eax, [bp+var_2C]
		shl	eax, 1
		mov	[bp+var_AE], eax
		mov	[bp+var_B2], eax
		add	[si+1Ch], eax
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_104+2], ax
		mov	bx, word ptr [bp+var_104+2]
		mov	eax, [bp+var_172]
		sub	eax, [bx]
		mov	[bp+var_226], eax
		mov	eax, [bp+var_16E]
		sub	eax, [bx+4]
		mov	[bp+var_222], eax
		mov	eax, [bp+var_16A]
		sub	eax, [bx+8]
		mov	[bp+var_21E], eax
		mov	eax, [bp+var_226]
		mov	[bp+var_21A], eax
		mov	eax, [bp+var_222]
		mov	[bp+var_216], eax
		mov	eax, [bp+var_21E]
		mov	[bp+var_212], eax
		lea	ax, word ptr [bp+var_21A]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	[bp+var_106], 280h
		mov	eax, [bp+var_106]
		mov	[bp+var_44], eax

loc_8B8D7:
		mov	byte_7769A, 1
		push	0
		push	di
		call	sub_7418F
		add	sp, 4
		mov	byte ptr [bp+var_B4+1], 1
		jmp	loc_8C07D

loc_8B8EF:
		cmp	byte ptr [bp+var_40+1], 0
		jnz	short loc_8B8F8
		jmp	loc_8BD5E

loc_8B8F8:
		mov	[bp+var_B8], 80h
		mov	eax, [bp+var_17E]
		mov	edx, [bp+var_B8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_BC], eax
		mov	eax, [bp+var_BC]
		mov	[bp+var_C0], eax
		mov	eax, [bp+var_17A]
		mov	edx, [bp+var_B8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_C4], eax
		mov	eax, [bp+var_C4]
		mov	[bp+var_C8], eax
		mov	eax, [bp+var_176]
		mov	edx, [bp+var_B8]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_CC], eax
		mov	eax, [bp+var_CC]
		mov	[bp+var_D0], eax
		mov	eax, [bp+var_C0]
		mov	[bp+var_1F6], eax
		mov	eax, [bp+var_C8]
		mov	[bp+var_1F2], eax
		mov	eax, [bp+var_D0]
		mov	[bp+var_1EE], eax
		mov	eax, [bp+var_1F6]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_D4], eax
		mov	eax, [bp+var_D4]
		mov	[bp+var_D8], eax
		mov	eax, [bp+var_1F2]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_DC], eax
		mov	eax, [bp+var_DC]
		mov	[bp+var_E0], eax
		mov	eax, [bp+var_1EE]
		mov	edx, dword_7976E
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_E4], eax
		mov	eax, [bp+var_E4]
		mov	[bp+var_E8], eax
		mov	eax, [bp+var_D8]
		mov	[bp+var_202], eax
		mov	eax, [bp+var_E0]
		mov	[bp+var_1FE], eax
		mov	eax, [bp+var_E8]
		mov	[bp+var_1FA], eax
		mov	eax, [bp+var_202]
		sub	[bp+var_17E], eax
		mov	eax, [bp+var_1FE]
		sub	[bp+var_17A], eax
		mov	eax, [bp+var_1FA]
		sub	[bp+var_176], eax
		mov	eax, [bp+var_17E]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_EC], eax
		mov	eax, [bp+var_EC]
		mov	[bp+var_F0], eax
		mov	eax, [bp+var_17A]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_F4], eax
		mov	eax, [bp+var_F4]
		mov	[bp+var_F8], eax
		mov	eax, [bp+var_176]
		mov	edx, dword_79774
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_FC], eax
		mov	eax, [bp+var_FC]
		mov	[bp+var_100], eax
		mov	eax, [bp+var_F0]
		mov	[bp+var_20E], eax
		mov	eax, [bp+var_F8]
		mov	[bp+var_20A], eax
		mov	eax, [bp+var_100]
		mov	[bp+var_206], eax
		mov	eax, [bp+var_20E]
		add	[bp+var_18A], eax
		mov	eax, [bp+var_20A]
		add	[bp+var_186], eax
		mov	eax, [bp+var_206]
		add	[bp+var_182], eax
		mov	eax, [bp+var_18A]
		sub	eax, [bp+var_172]
		mov	[bp+var_21A], eax
		mov	eax, [bp+var_186]
		sub	eax, [bp+var_16E]
		mov	[bp+var_216], eax
		mov	eax, [bp+var_182]
		sub	eax, [bp+var_16A]
		mov	[bp+var_212], eax
		mov	eax, [bp+var_21A]
		mov	[bp+var_226], eax
		mov	eax, [bp+var_216]
		mov	[bp+var_222], eax
		mov	eax, [bp+var_212]
		mov	[bp+var_21E], eax
		mov	eax, [bp+var_226]
		mov	[bp+var_108], eax
		mov	eax, [bp+var_222]
		mov	[bp+var_104], eax
		push	large 0
		push	eax
		push	large [bp+var_108]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_110], eax
		mov	[bp+var_10C], eax
		cmp	eax, [bp+var_2C]
		jge	short loc_8BB4A
		mov	ax, 1
		jmp	short loc_8BB4C

loc_8BB4A:
		xor	ax, ax

loc_8BB4C:
		or	al, al
		jnz	short loc_8BB53
		jmp	loc_8BCE1

loc_8BB53:
		mov	eax, [bp+var_196]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_114], eax
		mov	eax, [bp+var_114]
		mov	[bp+var_118], eax
		mov	eax, [bp+var_192]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_11C], eax
		mov	eax, [bp+var_11C]
		mov	[bp+var_120], eax
		mov	eax, [bp+var_18E]
		mov	edx, [bp+var_2C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_124], eax
		mov	eax, [bp+var_124]
		mov	[bp+var_128], eax
		mov	eax, [bp+var_118]
		mov	[bp+var_24A], eax
		mov	eax, [bp+var_120]
		mov	[bp+var_246], eax
		mov	eax, [bp+var_128]
		mov	[bp+var_242], eax
		mov	[bp+var_12C], 5A00h
		mov	eax, [bp+var_10C]
		mov	edx, [bp+var_12C]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_130], eax
		mov	eax, [bp+var_130]
		mov	[bp+var_134], eax
		mov	eax, [bp+var_134]
		mov	edx, eax
		mov	ecx, [bp+var_2C]
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp+var_138], eax
		mov	eax, [bp+var_138]
		mov	[bp+var_13C], eax
		lea	ax, word ptr [bp+var_13C]
		push	ax
		push	ss
		lea	ax, word ptr [bp+var_140]
		push	ax
		call	Math_CosDeg_5666C
		add	sp, 6
		mov	eax, [bp+var_24A]
		mov	edx, [bp+var_140]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24A], eax
		mov	eax, [bp+var_246]
		mov	edx, [bp+var_140]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_246], eax
		mov	eax, [bp+var_242]
		mov	edx, [bp+var_140]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_242], eax
		mov	eax, [bp+var_18A]
		add	eax, [bp+var_24A]
		mov	[bp+var_256], eax
		mov	eax, [bp+var_186]
		add	eax, [bp+var_246]
		mov	[bp+var_252], eax
		mov	eax, [bp+var_182]
		add	eax, [bp+var_242]
		mov	[bp+var_24E], eax
		mov	eax, [bp+var_256]
		mov	[bp+var_262], eax
		mov	eax, [bp+var_252]
		mov	[bp+var_25E], eax
		mov	eax, [bp+var_24E]
		mov	[bp+var_25A], eax
		mov	eax, [bp+var_262]
		mov	[si+14h], eax
		mov	eax, [bp+var_25E]
		mov	[si+18h], eax
		mov	eax, [bp+var_25A]
		mov	[si+1Ch], eax
		jmp	short loc_8BCFC

loc_8BCE1:
		mov	eax, [bp+var_18A]
		mov	[si+14h], eax
		mov	eax, [bp+var_186]
		mov	[si+18h], eax
		mov	eax, [bp+var_182]
		mov	[si+1Ch], eax

loc_8BCFC:
		mov	di, si
		add	di, 14h
		mov	eax, [bp+var_172]
		sub	eax, [di]
		mov	[bp+var_23E], eax
		mov	eax, [bp+var_16E]
		sub	eax, [di+4]
		mov	[bp+var_23A], eax
		mov	eax, [bp+var_16A]
		sub	eax, [di+8]
		mov	[bp+var_236], eax
		mov	eax, [bp+var_23E]
		mov	[bp+var_232], eax
		mov	eax, [bp+var_23A]
		mov	[bp+var_22E], eax
		mov	eax, [bp+var_236]
		mov	[bp+var_22A], eax
		lea	ax, word ptr [bp+var_232]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		jmp	loc_8C035

loc_8BD5E:
		cmp	word_7CAE0, 0
		jnz	short loc_8BD68
		jmp	loc_8C035

loc_8BD68:
		mov	di, word_7CAE0
		add	di, 12h
		mov	ax, si
		add	ax, 14h
		mov	word ptr [bp+var_104+2], ax
		mov	eax, [di]
		mov	bx, word ptr [bp+var_104+2]
		sub	eax, [bx]
		mov	[bp+var_226], eax
		mov	eax, [di+4]
		sub	eax, [bx+4]
		mov	[bp+var_222], eax
		mov	eax, [di+8]
		sub	eax, [bx+8]
		mov	[bp+var_21E], eax
		mov	eax, [bp+var_226]
		mov	[bp+var_21A], eax
		mov	eax, [bp+var_222]
		mov	[bp+var_216], eax
		mov	eax, [bp+var_21E]
		mov	[bp+var_212], eax
		mov	di, si
		add	di, 2Ch
		push	eax
		push	large [bp+var_216]
		push	large [bp+var_21A]
		call	sub_5A065
		push	dx
		push	ax
		pop	eax
		add	sp, 0Ch
		mov	[bp+var_106], eax
		mov	[bp+var_10A], eax
		mov	eax, [di]
		mov	edx, [bp+var_10A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_10E], eax
		mov	eax, [bp+var_10E]
		mov	[bp+var_112], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_10A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_116], eax
		mov	eax, [bp+var_116]
		mov	[bp+var_11A], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_10A]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_11E], eax
		mov	eax, [bp+var_11E]
		mov	[bp+var_122], eax
		mov	eax, [bp+var_112]
		mov	[bp+var_23E], eax
		mov	eax, [bp+var_11A]
		mov	[bp+var_23A], eax
		mov	eax, [bp+var_122]
		mov	[bp+var_236], eax
		mov	eax, [bp+var_21A]
		mov	ebx, 10h
		cdq
		idiv	ebx
		mov	[bp+var_126], eax
		mov	[bp+var_12A], eax
		mov	eax, [bp+var_216]
		cdq
		idiv	ebx
		mov	[bp+var_12E], eax
		mov	[bp+var_132], eax
		mov	eax, [bp+var_212]
		cdq
		idiv	ebx
		mov	[bp+var_136], eax
		mov	[bp+var_13A], eax
		mov	eax, [bp+var_12A]
		mov	[bp+var_24A], eax
		mov	eax, [bp+var_132]
		mov	[bp+var_246], eax
		mov	eax, [bp+var_13A]
		mov	[bp+var_242], eax
		mov	eax, [bp+var_23E]
		add	eax, [bp+var_24A]
		mov	[bp+var_256], eax
		mov	eax, [bp+var_23A]
		add	eax, [bp+var_246]
		mov	[bp+var_252], eax
		mov	eax, [bp+var_236]
		add	eax, [bp+var_242]
		mov	[bp+var_24E], eax
		mov	eax, [bp+var_256]
		mov	[bp+var_232], eax
		mov	eax, [bp+var_252]
		mov	[bp+var_22E], eax
		mov	eax, [bp+var_24E]
		mov	[bp+var_22A], eax
		lea	ax, word ptr [bp+var_232]
		push	ax
		mov	ax, si
		add	ax, 20h
		push	ax
		call	sub_59B77
		add	sp, 4
		mov	eax, [bp+var_2C]
		neg	eax
		mov	[bp+var_13E], eax
		mov	[bp+var_142], eax
		mov	di, si
		add	di, 2Ch
		mov	eax, [di]
		mov	edx, [bp+var_142]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_146], eax
		mov	eax, [bp+var_146]
		mov	[bp+var_14A], eax
		mov	eax, [di+4]
		mov	edx, [bp+var_142]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14E], eax
		mov	eax, [bp+var_14E]
		mov	[bp+var_152], eax
		mov	eax, [di+8]
		mov	edx, [bp+var_142]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_156], eax
		mov	eax, [bp+var_156]
		mov	[bp+var_15A], eax
		mov	eax, [bp+var_14A]
		mov	[bp+var_262], eax
		mov	eax, [bp+var_152]
		mov	[bp+var_25E], eax
		mov	eax, [bp+var_15A]
		mov	[bp+var_25A], eax
		lea	ax, word ptr [bp+var_262]
		push	ax
		sub	sp, 4
		mov	eax, [bp+var_16A]
		mov	[bp+var_284], eax
		push	si
		call	sub_2CB53
		add	sp, 8
		mov	eax, [bp+var_172]
		add	eax, [bp+var_262]
		mov	[bp+var_26E], eax
		mov	eax, [bp+var_16E]
		add	eax, [bp+var_25E]
		mov	[bp+var_26A], eax
		mov	eax, [bp+var_16A]
		add	eax, [bp+var_25A]
		mov	[bp+var_266], eax
		mov	eax, [bp+var_26E]
		mov	[bp+var_27A], eax
		mov	eax, [bp+var_26A]
		mov	[bp+var_276], eax
		mov	eax, [bp+var_266]
		mov	[bp+var_272], eax
		mov	eax, [bp+var_27A]
		mov	[si+14h], eax
		mov	eax, [bp+var_276]
		mov	[si+18h], eax
		mov	eax, [bp+var_272]
		mov	[si+1Ch], eax

loc_8C035:
		call	sub_50F18
		cmp	byte ptr [bp+var_B4+1], 0
		jz	short loc_8C054
		push	0
		push	word_7AF7E
		call	TextFormat_ReleaseAttribute_67F1D
		add	sp, 4
		mov	byte ptr [bp+var_B4+1], 0

loc_8C054:
		push	62B0h
		call	sub_1E055
		pop	cx
		mov	eax, dword_7976E
		sub	[bp+var_44], eax
		mov	al, byte_7CAC3
		mov	ah, 0
		cmp	ax, 1
		jz	short loc_8C09B
		cmp	byte_77537, 0
		jnz	short loc_8C09B
		cmp	byte_79B9B, 0
		jnz	short loc_8C09B

loc_8C07D:
		cmp	[bp+var_44], 0
		jl	short loc_8C089
		mov	ax, 1
		jmp	short loc_8C08B

loc_8C089:
		xor	ax, ax

loc_8C08B:
		or	al, al
		jz	short loc_8C09B
		call	Input_AltKeyDetailToggles_5093D
		or	al, al
		jz	short loc_8C09B
		jmp	loc_8B8EF

loc_8C09B:
		push	si
		push	67B7h
		call	sub_737B4
		add	sp, 4
		mov	al, [bp+var_7]
		mov	[bp+var_27], al
		lea	ax, [bp+var_16]
		push	ax
		call	sub_67383
		pop	cx
		cmp	[bp+var_D], 0
		jz	short loc_8C0DB
		cmp	[bp+var_12], 0
		jz	short loc_8C0DB
		push	0
		mov	al, [bp+var_E]
		push	ax
		lea	ax, word ptr [bp+var_12]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_8C0DB

loc_8C0DB:
		mov	al, [bp+var_27]
		pop	di
		pop	si
		leave
		retf
sub_8AA2E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_8C0E2		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_8C10D
		push	0
		push	si
		call	sub_73E05
		add	sp, 4
		test	di, 1
		jz	short loc_8C10B
		push	si
		call	sub_3B2
		pop	cx
		jmp	short loc_8C10D

loc_8C10B:
		jmp	short loc_8C10D

loc_8C10D:
		pop	di
		pop	si
		pop	bp
		retf
sub_8C0E2		endp
ovr245		ends
