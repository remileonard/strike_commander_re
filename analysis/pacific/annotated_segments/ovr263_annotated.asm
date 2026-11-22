ovr263		segment	para public 'OVERLAY' use16
		assume cs:ovr263
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E780		proc far
		push	bp
		mov	bp, sp
		inc	word_77719
		pop	bp
		retf
sub_9E780		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E789		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	[bp+var_2], cx
		mov	ax, [bp+var_2]
		cwd
		xor	ax, dx
		sub	ax, dx
		cmp	ax, [si+5Ch]
		jl	short loc_9E7AD
		mov	word ptr [si+5Ah], 0
		jmp	short loc_9E7B0

loc_9E7AD:
		mov	[si+5Ah], cx

loc_9E7B0:
		mov	ax, [si+5Ah]
		mov	bx, [si+2Ch]
		mov	[bx], ax
		push	large [si+2Eh]
		push	large [si+24h]
		call	sub_38D6
		add	sp, 8
		mov	bx, [si+5Ah]
		shl	bx, 2
		push	large [bx+si+32h]
		push	large [si+24h]
		call	CRT_MemFamily_Extra2
		add	sp, 8
		pop	si
		leave
		retf
sub_9E789		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E7E1		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+2Eh], 0
		jz	short loc_9E7FE
		push	large [si+2Eh]
		call	sub_3C0
		add	sp, 4

loc_9E7FE:
		push	large [bp+arg_2]
		call	sub_398A
		add	sp, 4
		inc	ax
		mov	[bp+var_2], ax
		push	1
		push	0
		push	2
		movsx	eax, [bp+var_2]
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+30h], dx
		mov	[si+2Eh], ax
		cmp	dword ptr [si+2Eh], 0
		jz	short loc_9E843
		push	large [bp+arg_2]
		push	large [si+2Eh]
		call	sub_38D6
		add	sp, 8

loc_9E843:
		pop	si
		leave
		retf
sub_9E7E1		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E846		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+2Ch]
		inc	word ptr [bx]
		push	word ptr [bx]
		push	si
		push	cs
		call	near ptr sub_9E789
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_9E846		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E85F		proc far

var_78		= word ptr -78h
var_76		= word ptr -76h
var_6A		= word ptr -6Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	si
		mov	si, [bp+arg_0]
		push	large [si+24h]
		push	ss
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_38D6
		add	sp, 8
		mov	bx, [si+2Ch]
		push	word ptr [bx]
		push	si
		push	cs
		call	near ptr sub_9E789
		add	sp, 4
		cmp	word ptr [si+22h], 0FFFFh
		jnz	short loc_9E896
		push	si
		call	sub_74AA5
		pop	cx
		jmp	short loc_9E8A2

loc_9E896:
		push	word ptr [si+22h]
		push	si
		call	sub_74ABE
		add	sp, 4

loc_9E8A2:
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+1Eh]
		mov	[bp+var_2], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_4], ax
		mov	ax, word_79260
		add	ax, 2
		mov	[bp+var_6], ax
		mov	[bp+var_78], 0
		mov	[bp+var_76], 0
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	si
		mov	ax, word_79260
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	si
		call	sub_74AD7
		pop	cx
		push	word_79260
		push	0FFFFh
		mov	ax, [si+20h]
		lea	dx, [bp+var_6A]
		add	ax, dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		call	sub_74BA9
		add	sp, 0Ah
		push	si
		call	sub_74ADC
		pop	cx
		lea	ax, [bp+var_78]
		push	ax
		mov	ax, word_79260
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		lea	ax, [bp+var_78]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		pop	si
		leave
		retf
sub_9E85F		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E932		proc far

var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= dword ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		mov	si, [bp+arg_0]
		cmp	dword ptr [si+24h], 0
		jz	short loc_9E94F
		push	large [si+24h]
		call	sub_3C0
		add	sp, 4

loc_9E94F:
		push	large [bp+arg_2]
		call	sub_398A
		add	sp, 4
		add	ax, 14h
		mov	[bp+var_2], ax
		push	1
		push	0
		push	2
		movsx	eax, [bp+var_2]
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	[si+26h], dx
		mov	[si+24h], ax
		cmp	dword ptr [si+24h], 0
		jz	short loc_9E996
		push	large [bp+arg_2]
		push	large [si+24h]
		call	sub_38D6
		add	sp, 8

loc_9E996:
		pop	si
		leave
		retf
sub_9E932		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E999		proc far

arg_0		= word ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+5Eh]
		mov	al, [bp+arg_2]
		mov	[bx], al
		push	large [si+2Eh]
		push	large [si+24h]
		call	sub_38D6
		add	sp, 8
		mov	bx, [si+5Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_9E9C7
		push	large dword_7771B
		jmp	short loc_9E9CC

loc_9E9C7:
		push	large dword_7771F

loc_9E9CC:
		push	large [si+24h]
		call	CRT_MemFamily_Extra2
		add	sp, 8
		pop	si
		pop	bp
		retf
sub_9E999		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9E9DB		proc far

var_78		= word ptr -78h
var_76		= word ptr -76h
var_6A		= word ptr -6Ah
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	si
		mov	si, [bp+arg_0]
		push	large [si+24h]
		push	ss
		lea	ax, [bp+var_6A]
		push	ax
		call	sub_38D6
		add	sp, 8
		mov	bx, [si+5Eh]
		mov	al, [bx]
		push	ax
		push	si
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		cmp	word ptr [si+22h], 0FFFFh
		jnz	short loc_9EA13
		push	si
		call	sub_74AA5
		pop	cx
		jmp	short loc_9EA1F

loc_9EA13:
		push	word ptr [si+22h]
		push	si
		call	sub_74ABE
		add	sp, 4

loc_9EA1F:
		mov	ax, [si+16h]
		add	ax, [si+18h]
		add	ax, [si+1Eh]
		mov	[bp+var_2], ax
		mov	ax, [si+16h]
		add	ax, [si+18h]
		mov	[bp+var_4], ax
		mov	ax, word_79260
		add	ax, 2
		mov	[bp+var_6], ax
		mov	[bp+var_78], 0
		mov	[bp+var_76], 0
		push	ax
		lea	ax, [bp+var_78]
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	si
		mov	ax, word_79260
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		push	si
		call	sub_74AD7
		pop	cx
		push	word_79260
		push	0FFFFh
		mov	ax, [si+20h]
		lea	dx, [bp+var_6A]
		add	ax, dx
		push	ax
		push	[bp+var_4]
		push	[bp+var_2]
		call	sub_74BA9
		add	sp, 0Ah
		push	si
		call	sub_74ADC
		pop	cx
		lea	ax, [bp+var_78]
		push	ax
		mov	ax, word_79260
		add	ax, 2
		push	ax
		call	TextFormat_ApplyStyleAttribute_67C41
		add	sp, 4
		lea	ax, [bp+var_78]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		pop	si
		leave
		retf
sub_9E9DB		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_9EAAF		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	bx, [si+5Eh]
		cmp	byte ptr [bx], 0
		jz	short loc_9EAC3
		mov	byte ptr [bx], 0
		jmp	short loc_9EAC9

loc_9EAC3:
		mov	bx, [si+5Eh]
		mov	byte ptr [bx], 1

loc_9EAC9:
		mov	bx, [si+5Eh]
		mov	al, [bx]
		push	ax
		push	si
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		pop	si
		pop	bp
		retf
sub_9EAAF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

; ==============================================================================================
; far. LUE EN PARTIE 2026-11-05. Écran des options du vol (appelé par sub_739C4 avec le bloc
; de réglages, 63B4h = dword_7CAE4, base du segment de données 76730h). Chaque option est un
; widget lié à un champ du bloc (sub_A09BD : liste de valeurs ; sub_A08AE : oui/non). Relevé :
; « Sky Texture » +1Ah (byte_7CAFE), « Water Texture » +1Bh (byte_7CAFF), « Flight Model: »
; +23h (word_7CB07, valeurs Ace / Veteran / Rookie), « Easy Landings » +25h (byte_7CB09), «
; Enemy AI: » +2Dh (byte_7CB11, Ace / Veteran / Rookie). Libellés dans seg008 (base 54F0h).
; ==============================================================================================
Options_FlightOptionsScreen_9EADA		proc far

var_B5E		= word ptr -0B5Eh
var_B50		= word ptr -0B50h
var_B40		= word ptr -0B40h
var_B3E		= word ptr -0B3Eh
var_B3C		= word ptr -0B3Ch
var_B3A		= dword ptr -0B3Ah
var_B36		= word ptr -0B36h
var_B34		= word ptr -0B34h
var_B32		= word ptr -0B32h
var_B30		= word ptr -0B30h
var_B22		= word ptr -0B22h
var_B12		= word ptr -0B12h
var_B10		= word ptr -0B10h
var_B0E		= word ptr -0B0Eh
var_B0C		= dword ptr -0B0Ch
var_B08		= word ptr -0B08h
var_B06		= word ptr -0B06h
var_B04		= word ptr -0B04h
var_B02		= word ptr -0B02h
var_AF4		= word ptr -0AF4h
var_AE4		= word ptr -0AE4h
var_AE2		= word ptr -0AE2h
var_AE0		= word ptr -0AE0h
var_ADE		= dword ptr -0ADEh
var_ADA		= word ptr -0ADAh
var_AD8		= word ptr -0AD8h
var_AD6		= word ptr -0AD6h
var_AD4		= word ptr -0AD4h
var_AC6		= word ptr -0AC6h
var_AB6		= word ptr -0AB6h
var_AB4		= word ptr -0AB4h
var_AB2		= word ptr -0AB2h
var_AB0		= dword ptr -0AB0h
var_AAC		= word ptr -0AACh
var_AAA		= word ptr -0AAAh
var_AA8		= word ptr -0AA8h
var_AA6		= word ptr -0AA6h
var_A98		= word ptr -0A98h
var_A88		= word ptr -0A88h
var_A86		= word ptr -0A86h
var_A84		= word ptr -0A84h
var_A82		= dword ptr -0A82h
var_A7E		= word ptr -0A7Eh
var_A7C		= word ptr -0A7Ch
var_A7A		= word ptr -0A7Ah
var_A78		= word ptr -0A78h
var_A6A		= word ptr -0A6Ah
var_A54		= dword ptr -0A54h
var_A4A		= dword ptr -0A4Ah
var_A1A		= word ptr -0A1Ah
var_A18		= word ptr -0A18h
var_A0A		= word ptr -0A0Ah
var_9F4		= dword ptr -9F4h
var_9EA		= dword ptr -9EAh
var_9BA		= word ptr -9BAh
var_9B8		= word ptr -9B8h
var_9AA		= word ptr -9AAh
var_994		= dword ptr -994h
var_98A		= dword ptr -98Ah
var_95A		= word ptr -95Ah
var_958		= word ptr -958h
var_94A		= word ptr -94Ah
var_934		= dword ptr -934h
var_92A		= dword ptr -92Ah
var_8FA		= word ptr -8FAh
var_8F8		= word ptr -8F8h
var_89A		= word ptr -89Ah
var_88C		= word ptr -88Ch
var_876		= dword ptr -876h
var_86C		= dword ptr -86Ch
var_83C		= word ptr -83Ch
var_83A		= word ptr -83Ah
var_82C		= word ptr -82Ch
var_816		= dword ptr -816h
var_80C		= dword ptr -80Ch
var_7DC		= word ptr -7DCh
var_7DA		= word ptr -7DAh
var_7CC		= word ptr -7CCh
var_7B6		= dword ptr -7B6h
var_7AC		= dword ptr -7ACh
var_77C		= word ptr -77Ch
var_77A		= word ptr -77Ah
var_71C		= word ptr -71Ch
var_70E		= word ptr -70Eh
var_6F8		= dword ptr -6F8h
var_6EE		= dword ptr -6EEh
var_6BE		= word ptr -6BEh
var_6BC		= word ptr -6BCh
var_6AE		= word ptr -6AEh
var_698		= dword ptr -698h
var_68E		= dword ptr -68Eh
var_65E		= word ptr -65Eh
var_65C		= word ptr -65Ch
var_64E		= word ptr -64Eh
var_63E		= word ptr -63Eh
var_63C		= word ptr -63Ch
var_63A		= word ptr -63Ah
var_638		= dword ptr -638h
var_634		= word ptr -634h
var_632		= word ptr -632h
var_630		= word ptr -630h
var_62E		= word ptr -62Eh
var_620		= word ptr -620h
var_60A		= dword ptr -60Ah
var_600		= dword ptr -600h
var_5D0		= word ptr -5D0h
var_5CE		= word ptr -5CEh
var_570		= word ptr -570h
var_512		= word ptr -512h
var_504		= word ptr -504h
var_4EE		= dword ptr -4EEh
var_4E4		= dword ptr -4E4h
var_4B4		= word ptr -4B4h
var_4B2		= word ptr -4B2h
var_454		= word ptr -454h
var_446		= word ptr -446h
var_430		= dword ptr -430h
var_426		= dword ptr -426h
var_3F6		= word ptr -3F6h
var_3F4		= word ptr -3F4h
var_3E6		= word ptr -3E6h
var_3D0		= dword ptr -3D0h
var_3C6		= dword ptr -3C6h
var_396		= word ptr -396h
var_394		= word ptr -394h
var_386		= word ptr -386h
var_370		= dword ptr -370h
var_366		= dword ptr -366h
var_336		= word ptr -336h
var_334		= word ptr -334h
var_326		= word ptr -326h
var_310		= dword ptr -310h
var_306		= dword ptr -306h
var_2D6		= word ptr -2D6h
var_2D4		= word ptr -2D4h
var_276		= word ptr -276h
var_268		= word ptr -268h
var_258		= word ptr -258h
var_252		= dword ptr -252h
var_248		= dword ptr -248h
var_218		= word ptr -218h
var_216		= word ptr -216h
var_1FB		= dword ptr -1FBh
var_1F7		= dword ptr -1F7h
var_1F2		= word ptr -1F2h
var_1EF		= word ptr -1EFh
var_1E0		= word ptr -1E0h
var_1C6		= byte ptr -1C6h
var_1A2		= word ptr -1A2h
var_192		= word ptr -192h
var_190		= word ptr -190h
var_18E		= word ptr -18Eh
var_18A		= word ptr -18Ah
var_162		= dword ptr -162h
var_15E		= dword ptr -15Eh
var_15A		= dword ptr -15Ah
var_156		= dword ptr -156h
var_152		= dword ptr -152h
var_14E		= dword ptr -14Eh
var_14A		= dword ptr -14Ah
var_146		= dword ptr -146h
var_142		= dword ptr -142h
var_13E		= dword ptr -13Eh
var_13A		= dword ptr -13Ah
var_136		= dword ptr -136h
var_132		= dword ptr -132h
var_12E		= dword ptr -12Eh
var_12A		= dword ptr -12Ah
var_125		= byte ptr -125h
var_124		= dword ptr -124h
var_120		= dword ptr -120h
var_11C		= dword ptr -11Ch
var_118		= dword ptr -118h
var_114		= dword ptr -114h
var_110		= word ptr -110h
var_10E		= word ptr -10Eh
var_10C		= word ptr -10Ch
var_10A		= word ptr -10Ah
var_108		= word ptr -108h
var_106		= word ptr -106h
var_104		= word ptr -104h
var_102		= word ptr -102h
var_100		= word ptr -100h
var_FE		= word ptr -0FEh
var_FC		= word ptr -0FCh
var_FA		= word ptr -0FAh
var_F8		= word ptr -0F8h
var_F6		= word ptr -0F6h
var_F4		= word ptr -0F4h
var_F2		= word ptr -0F2h
var_F0		= word ptr -0F0h
var_EE		= word ptr -0EEh
var_EC		= word ptr -0ECh
var_EA		= word ptr -0EAh
var_E8		= word ptr -0E8h
var_E6		= word ptr -0E6h
var_E4		= word ptr -0E4h
var_E2		= word ptr -0E2h
var_E0		= word ptr -0E0h
var_DE		= word ptr -0DEh
var_DC		= word ptr -0DCh
var_DA		= word ptr -0DAh
var_D8		= word ptr -0D8h
var_D6		= word ptr -0D6h
var_D4		= word ptr -0D4h
var_D2		= word ptr -0D2h
var_D0		= word ptr -0D0h
var_CE		= word ptr -0CEh
var_CC		= word ptr -0CCh
var_CA		= word ptr -0CAh
var_C8		= word ptr -0C8h
var_C6		= word ptr -0C6h
var_C4		= word ptr -0C4h
var_C2		= word ptr -0C2h
var_C0		= word ptr -0C0h
var_BE		= word ptr -0BEh
var_BC		= word ptr -0BCh
var_BA		= word ptr -0BAh
var_B8		= dword ptr -0B8h
var_B4		= word ptr -0B4h
var_B2		= word ptr -0B2h
var_B0		= word ptr -0B0h
var_AE		= word ptr -0AEh
var_AC		= word ptr -0ACh
var_AA		= word ptr -0AAh
var_A8		= word ptr -0A8h
var_A6		= word ptr -0A6h
var_A4		= word ptr -0A4h
var_A2		= word ptr -0A2h
var_A0		= word ptr -0A0h
var_9E		= word ptr -9Eh
var_9C		= word ptr -9Ch
var_9A		= word ptr -9Ah
var_98		= word ptr -98h
var_96		= word ptr -96h
var_94		= word ptr -94h
var_92		= word ptr -92h
var_90		= word ptr -90h
var_8E		= word ptr -8Eh
var_8C		= word ptr -8Ch
var_8A		= word ptr -8Ah
var_88		= word ptr -88h
var_86		= word ptr -86h
var_84		= word ptr -84h
var_82		= word ptr -82h
var_80		= word ptr -80h
var_7E		= word ptr -7Eh
var_7C		= word ptr -7Ch
var_7A		= word ptr -7Ah
var_78		= word ptr -78h
var_76		= word ptr -76h
var_74		= word ptr -74h
var_72		= word ptr -72h
var_70		= word ptr -70h
var_6E		= word ptr -6Eh
var_6C		= word ptr -6Ch
var_6A		= word ptr -6Ah
var_68		= word ptr -68h
var_66		= word ptr -66h
var_64		= word ptr -64h
var_62		= word ptr -62h
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
var_18		= word ptr -18h
var_16		= word ptr -16h
var_14		= dword ptr -14h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= dword ptr -0Eh
var_A		= word ptr -0Ah
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= dword ptr -4
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 0B5Eh
		push	si
		push	di
		mov	si, [bp+arg_0]
		push	seg seg008
		push	offset loc_5754
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_132+2], dx
		mov	word ptr [bp+var_132], ax
		push	seg seg008
		push	offset loc_5759
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_12E+2], dx
		mov	word ptr [bp+var_12E], ax
		push	seg seg008
		push	offset loc_5762
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_12A+2], dx
		mov	word ptr [bp+var_12A], ax
		push	seg seg008
		push	offset loc_5733
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_13E+2], dx
		mov	word ptr [bp+var_13E], ax
		push	seg seg008
		push	offset loc_5738
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_13A+2], dx
		mov	word ptr [bp+var_13A], ax
		push	seg seg008
		push	offset loc_573D
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_136+2], dx
		mov	word ptr [bp+var_136], ax
		push	seg seg008
		push	offset loc_5743
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_162+2], dx
		mov	word ptr [bp+var_162], ax
		push	seg seg008
		push	offset loc_5747
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_15E+2], dx
		mov	word ptr [bp+var_15E], ax
		push	seg seg008
		push	offset loc_574F
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_15A+2], dx
		mov	word ptr [bp+var_15A], ax
		push	seg seg008
		push	offset loc_5701
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_156+2], dx
		mov	word ptr [bp+var_156], ax
		push	seg seg008
		push	offset loc_570B
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_152+2], dx
		mov	word ptr [bp+var_152], ax
		push	seg seg008
		push	offset loc_5712
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_14E+2], dx
		mov	word ptr [bp+var_14E], ax
		push	seg seg008
		push	offset loc_571C
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_14A+2], dx
		mov	word ptr [bp+var_14A], ax
		push	seg seg008
		push	offset loc_5724
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_146+2], dx
		mov	word ptr [bp+var_146], ax
		push	seg seg008
		push	offset loc_572C
		call	sub_38FF
		add	sp, 4
		mov	word ptr [bp+var_142+2], dx
		mov	word ptr [bp+var_142], ax
		mov	[bp+var_4], 100h
		lea	ax, word ptr [bp+var_4]
		push	ax
		push	64DEh
		call	Cockpit_PanAzimuthUpdate_2E46C
		add	sp, 4
		cmp	byte_7C9F0, 2
		jnz	short loc_9EC53
		mov	ax, 1
		jmp	short loc_9EC55

loc_9EC53:
		xor	ax, ax

loc_9EC55:
		or	ax, ax
		jz	short loc_9EC82
		cmp	byte_7C9F0, 2
		jnz	short loc_9EC6F
		push	0
		push	62B0h
		call	sub_1E034
		add	sp, 4
		jmp	short loc_9EC6F

loc_9EC6F:
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		jmp	short loc_9EC91

loc_9EC82:
		push	6324h
		push	word_7AF7E
		call	UI_ApplyEncodingHelper_67EE7
		add	sp, 4

loc_9EC91:
		mov	[bp+var_6], 0
		lea	ax, [bp+var_1A2]
		push	ax
		call	GlyphObject_AllocateBuffer_69123
		pop	cx
		mov	[bp+var_14], 0
		mov	[bp+var_10], 2
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aFoptions
		push	ds
		push	offset aFONTS_1
		lea	ax, [bp+var_1F2]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_258]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_258], 508h
		mov	[bp+var_1F7], 100h
		mov	[bp+var_1FB], 0
		mov	[bp+var_258], 0E61h
		push	1
		lea	ax, [bp+var_1F2]
		push	ax
		lea	ax, [bp+var_258]
		push	ax
		mov	bx, [bp+var_258]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_258]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_58], eax
		mov	[bp+var_5C], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_60+2], dx
		mov	word ptr [bp+var_60], ax
		mov	eax, [bp+var_60]
		mov	[bp+var_14], eax
		mov	[bp+var_10], 3
		mov	[bp+var_F], 1
		mov	[bp+var_E], 0
		mov	eax, [bp+var_5C]
		mov	[bp+var_E], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_58]
		push	0
		mov	al, [bp+var_10]
		push	ax
		push	large [bp+var_14]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_258]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_258]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_258]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		lea	ax, word ptr [bp+var_14]
		push	ax
		lea	ax, [bp+var_1A2]
		push	ax
		call	sub_690A8
		add	sp, 4
		mov	[bp+var_192], 1
		mov	[bp+var_190], 0
		mov	[bp+var_18E], 3
		mov	bx, word_79260
		mov	ax, [bx+14h]
		mov	[bp+var_A], ax
		lea	ax, [bp+var_1A2]
		mov	[bx+14h], ax
		push	0FFh
		push	bx
		call	sub_75D09
		jmp	loc_A051C

loc_9EDF1:
		push	53h
		push	6996h
		call	sub_7562F
		add	sp, 4
		push	dx
		push	ax
		push	ds
		push	offset aOptions
		push	ds
		push	offset aFONTS_1
		lea	ax, [bp+var_1F2]
		push	ax
		call	sub_29540
		add	sp, 0Eh
		lea	ax, [bp+var_258]
		push	ax
		call	StreamReader_ConstructVariantA_6BF3A
		pop	cx
		mov	[bp+var_258], 508h
		mov	[bp+var_1F7], 100h
		mov	[bp+var_1FB], 0
		mov	[bp+var_258], 0E61h
		push	1
		lea	ax, [bp+var_1F2]
		push	ax
		lea	ax, [bp+var_258]
		push	ax
		mov	bx, [bp+var_258]
		call	dword ptr [bx+14h]
		add	sp, 6
		lea	ax, [bp+var_258]
		push	ax
		call	StreamReader_GetCapacity_6C5B4
		push	dx
		push	ax
		pop	eax
		pop	cx
		mov	[bp+var_58], eax
		mov	[bp+var_5C], eax
		push	1
		push	0
		push	3
		push	eax
		push	6B04h
		call	Memory_TypedFreeWrapper_6520F
		add	sp, 0Ch
		mov	word ptr [bp+var_60+2], dx
		mov	word ptr [bp+var_60], ax
		mov	eax, [bp+var_60]
		mov	[si], eax
		mov	byte ptr [si+4], 3
		mov	byte ptr [si+5], 1
		mov	dword ptr [si+6], 0
		mov	eax, [bp+var_5C]
		mov	[si+6], eax
		push	large 0FFFFFFFFh
		push	large [bp+var_58]
		push	0
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_258]
		push	ax
		call	StreamReader_ReadTyped_6C4F3
		add	sp, 0Eh
		lea	ax, [bp+var_258]
		push	ax
		call	sub_6C2A4
		pop	cx
		push	0
		lea	ax, [bp+var_258]
		push	ax
		call	StreamReader_ReleaseBuffer_6DFAB
		add	sp, 4
		mov	[bp+var_7], 0
		mov	byte ptr [si+14h], 1
		push	large dword_7CC11
		push	0
		call	sub_74A87
		add	sp, 6
		mov	word ptr [bp+var_58+2], 0
		mov	word ptr [bp+var_58], 0
		mov	word ptr [bp+var_5C+2], 0
		mov	word ptr [bp+var_5C], 0
		mov	word ptr [bp+var_60+2], 0
		mov	word ptr [bp+var_60], 0
		push	large 0C7013Fh
		push	large 0
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C99
		add	sp, 0Ah
		mov	byte ptr [bp+var_1F2], 0
		cmp	[bp+var_1E0], 0
		jnz	short loc_9EF45
		mov	[bp+var_1C6], 0
		jmp	short loc_9EF45

loc_9EF45:
		mov	[bp+var_64], 0Ah
		mov	[bp+var_66], 6Eh
		mov	[bp+var_62], 32h
		mov	di, 20h
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_68], ax
		mov	[bp+var_6A], di
		mov	ax, [bp+var_66]
		mov	[bp+var_6C], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_6E], ax
		mov	ax, si
		add	ax, 29h
		mov	[bp+var_70], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_5827
		push	[bp+var_6E]
		push	[bp+var_6C]
		push	[bp+var_6A]
		push	[bp+var_68]
		lea	ax, [bp+var_276]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_268], 1045h
		mov	ax, [bp+var_70]
		mov	[bp+var_218], ax
		mov	bx, [bp+var_218]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_276]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		push	ss
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	3
		mov	ax, si
		add	ax, 2Dh
		push	ax
		push	seg seg008
		push	offset loc_5836
		push	[bp+var_64]
		push	[bp+var_66]
		push	di
		push	[bp+var_62]
		lea	ax, [bp+var_2D4]
		push	ax
		nop
		push	cs
		call	near ptr sub_A09BD
		add	sp, 16h
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_72], ax
		mov	[bp+var_74], di
		mov	ax, [bp+var_66]
		mov	[bp+var_76], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_78], ax
		mov	ax, si
		add	ax, 2Ah
		mov	[bp+var_7A], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_5840
		push	[bp+var_78]
		push	[bp+var_76]
		push	[bp+var_74]
		push	[bp+var_72]
		lea	ax, [bp+var_334]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_326], 1045h
		mov	ax, [bp+var_7A]
		mov	[bp+var_2D6], ax
		mov	bx, [bp+var_2D6]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_334]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_7C], ax
		mov	[bp+var_7E], di
		mov	ax, [bp+var_66]
		mov	[bp+var_80], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_82], ax
		mov	ax, si
		add	ax, 30h
		mov	[bp+var_84], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_584E
		push	[bp+var_82]
		push	[bp+var_80]
		push	[bp+var_7E]
		push	[bp+var_7C]
		lea	ax, [bp+var_394]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_386], 1045h
		mov	ax, [bp+var_84]
		mov	[bp+var_336], ax
		mov	bx, [bp+var_336]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_394]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_86], ax
		mov	[bp+var_88], di
		mov	ax, [bp+var_66]
		mov	[bp+var_8A], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_8C], ax
		mov	ax, si
		add	ax, 26h
		mov	[bp+var_8E], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_585E
		push	[bp+var_8C]
		push	[bp+var_8A]
		push	[bp+var_88]
		push	[bp+var_86]
		lea	ax, [bp+var_3F4]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_3E6], 1045h
		mov	ax, [bp+var_8E]
		mov	[bp+var_396], ax
		mov	bx, [bp+var_396]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_3F4]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_90], ax
		mov	[bp+var_92], di
		mov	ax, [bp+var_66]
		mov	[bp+var_94], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_96], ax
		mov	ax, si
		add	ax, 25h
		mov	[bp+var_98], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_5870
		push	[bp+var_96]
		push	[bp+var_94]
		push	[bp+var_92]
		push	[bp+var_90]
		lea	ax, [bp+var_454]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_446], 1045h
		mov	ax, [bp+var_98]
		mov	[bp+var_3F6], ax
		mov	bx, [bp+var_3F6]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_454]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		push	ss
		lea	ax, word ptr [bp+var_132]
		push	ax
		push	3
		mov	ax, si
		add	ax, 23h
		push	ax
		push	seg seg008
		push	offset loc_58D4
		push	[bp+var_64]
		push	[bp+var_66]
		push	di
		push	[bp+var_62]
		lea	ax, [bp+var_4B2]
		push	ax
		nop
		push	cs
		call	near ptr sub_A09BD
		add	sp, 16h
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_9A], ax
		mov	[bp+var_9C], di
		mov	ax, [bp+var_66]
		add	ax, 3
		mov	[bp+var_9E], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_A0], ax
		mov	ax, si
		add	ax, 34h
		mov	[bp+var_A2], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_58E2
		push	[bp+var_A0]
		push	[bp+var_9E]
		push	[bp+var_9C]
		push	[bp+var_9A]
		lea	ax, [bp+var_512]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_504], 1045h
		mov	ax, [bp+var_A2]
		mov	[bp+var_4B4], ax
		mov	bx, [bp+var_4B4]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_512]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 5
		add	di, 14h
		push	ss
		lea	ax, word ptr [bp+var_156]
		push	ax
		push	5
		mov	ax, si
		add	ax, 1Fh
		push	ax
		push	seg seg008
		push	offset loc_587E
		push	[bp+var_64]
		push	[bp+var_66]
		push	di
		push	[bp+var_62]
		lea	ax, [bp+var_570]
		push	ax
		nop
		push	cs
		call	near ptr sub_A09BD
		add	sp, 16h
		add	di, 0Ah
		push	ss
		lea	ax, word ptr [bp+var_156]
		push	ax
		push	6
		mov	ax, si
		add	ax, 21h
		push	ax
		push	seg seg008
		push	offset loc_588B
		push	[bp+var_64]
		push	[bp+var_66]
		push	di
		push	[bp+var_62]
		lea	ax, [bp+var_5CE]
		push	ax
		nop
		push	cs
		call	near ptr sub_A09BD
		add	sp, 16h
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_A4], ax
		mov	[bp+var_A6], di
		mov	ax, [bp+var_66]
		mov	[bp+var_A8], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_AA], ax
		mov	ax, si
		add	ax, 28h
		mov	[bp+var_AC], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_5899
		push	[bp+var_AA]
		push	[bp+var_A8]
		push	[bp+var_A6]
		push	[bp+var_A4]
		lea	ax, [bp+var_62E]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_620], 1045h
		mov	ax, [bp+var_AC]
		mov	[bp+var_5D0], ax
		mov	bx, [bp+var_5D0]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_62E]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		push	seg seg008
		push	offset loc_58A7
		lea	ax, [bp+var_18A]
		push	ax
		call	sub_54BE
		add	sp, 6
		mov	ax, [bp+var_62]
		add	ax, 0FFFEh
		mov	[bp+var_AE], ax
		mov	ax, di
		add	ax, 0FFFEh
		mov	[bp+var_B0], ax
		mov	ax, [bp+var_66]
		mov	[bp+var_B2], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_B4], ax
		lea	ax, [bp+var_18A]
		mov	word ptr [bp+var_B8+2], ds
		mov	word ptr [bp+var_B8], ax
		push	[bp+var_B4]
		push	[bp+var_B2]
		push	[bp+var_B0]
		push	[bp+var_AE]
		lea	ax, [bp+var_65C]
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	[bp+var_64E], 0C9Ah
		mov	[bp+var_638], 0
		push	large [bp+var_B8]
		lea	ax, [bp+var_65C]
		push	ax
		call	sub_74B18
		add	sp, 6
		mov	[bp+var_63E], 0
		mov	[bp+var_63C], 0
		mov	ax, word_7921A
		mov	[bp+var_632], ax
		mov	[bp+var_634], ax
		mov	[bp+var_63A], 0FFFFh
		mov	[bp+var_64E], 0E2Dh
		lea	ax, word ptr [bp+var_60]
		mov	[bp+var_630], ax
		add	[bp+var_62], 7Ah
		mov	di, 20h
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_BA], ax
		mov	[bp+var_BC], di
		mov	ax, [bp+var_66]
		mov	[bp+var_BE], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_C0], ax
		mov	ax, si
		add	ax, 16h
		mov	[bp+var_C2], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_5792
		push	[bp+var_C0]
		push	[bp+var_BE]
		push	[bp+var_BC]
		push	[bp+var_BA]
		lea	ax, [bp+var_6BC]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_6AE], 1045h
		mov	ax, [bp+var_C2]
		mov	[bp+var_65E], ax
		mov	bx, [bp+var_65E]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_6BC]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_C4], ax
		mov	[bp+var_C6], di
		mov	ax, [bp+var_66]
		mov	[bp+var_C8], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_CA], ax
		mov	ax, si
		add	ax, 15h
		mov	[bp+var_CC], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_57A2
		push	[bp+var_CA]
		push	[bp+var_C8]
		push	[bp+var_C6]
		push	[bp+var_C4]
		lea	ax, [bp+var_71C]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_70E], 1045h
		mov	ax, [bp+var_CC]
		mov	[bp+var_6BE], ax
		mov	bx, [bp+var_6BE]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_71C]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		push	ss
		lea	ax, word ptr [bp+var_162]
		push	ax
		push	3
		mov	ax, si
		add	ax, 17h
		push	ax
		push	seg seg008
		push	offset loc_57B1
		push	[bp+var_64]
		push	[bp+var_66]
		push	di
		push	[bp+var_62]
		lea	ax, [bp+var_77A]
		push	ax
		nop
		push	cs
		call	near ptr sub_A09BD
		add	sp, 16h
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_CE], ax
		mov	[bp+var_D0], di
		mov	ax, [bp+var_66]
		mov	[bp+var_D2], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_D4], ax
		mov	ax, si
		add	ax, 27h
		mov	[bp+var_D6], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_57D1
		push	[bp+var_D4]
		push	[bp+var_D2]
		push	[bp+var_D0]
		push	[bp+var_CE]
		lea	ax, [bp+var_7DA]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_7CC], 1045h
		mov	ax, [bp+var_D6]
		mov	[bp+var_77C], ax
		mov	bx, [bp+var_77C]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_7DA]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_D8], ax
		mov	[bp+var_DA], di
		mov	ax, [bp+var_66]
		mov	[bp+var_DC], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_DE], ax
		mov	ax, si
		add	ax, 1Ah
		mov	[bp+var_E0], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_57DD
		push	[bp+var_DE]
		push	[bp+var_DC]
		push	[bp+var_DA]
		push	[bp+var_D8]
		lea	ax, [bp+var_83A]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_82C], 1045h
		mov	ax, [bp+var_E0]
		mov	[bp+var_7DC], ax
		mov	bx, [bp+var_7DC]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_83A]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_E2], ax
		mov	[bp+var_E4], di
		mov	ax, [bp+var_66]
		mov	[bp+var_E6], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_E8], ax
		mov	ax, si
		add	ax, 1Bh
		mov	[bp+var_EA], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_57E9
		push	[bp+var_E8]
		push	[bp+var_E6]
		push	[bp+var_E4]
		push	[bp+var_E2]
		lea	ax, [bp+var_89A]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_88C], 1045h
		mov	ax, [bp+var_EA]
		mov	[bp+var_83C], ax
		mov	bx, [bp+var_83C]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_89A]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		push	ss
		lea	ax, word ptr [bp+var_13E]
		push	ax
		push	3
		mov	ax, si
		add	ax, 1Dh
		push	ax
		push	seg seg008
		push	offset loc_57F7
		push	[bp+var_64]
		push	[bp+var_66]
		push	di
		push	[bp+var_62]
		lea	ax, [bp+var_8F8]
		push	ax
		nop
		push	cs
		call	near ptr sub_A09BD
		add	sp, 16h
		add	di, 0Ah
		add	di, 5
		add	di, 14h
		mov	ax, [bp+var_62]
		mov	[bp+var_EC], ax
		mov	[bp+var_EE], di
		mov	ax, [bp+var_66]
		mov	[bp+var_F0], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_F2], ax
		mov	ax, si
		add	ax, 35h
		mov	[bp+var_F4], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_576A
		push	[bp+var_F2]
		push	[bp+var_F0]
		push	[bp+var_EE]
		push	[bp+var_EC]
		lea	ax, [bp+var_958]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_94A], 1045h
		mov	ax, [bp+var_F4]
		mov	[bp+var_8FA], ax
		mov	bx, [bp+var_8FA]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_958]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_F6], ax
		mov	[bp+var_F8], di
		mov	ax, [bp+var_66]
		mov	[bp+var_FA], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_FC], ax
		mov	ax, si
		add	ax, 36h
		mov	[bp+var_FE], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_5770
		push	[bp+var_FC]
		push	[bp+var_FA]
		push	[bp+var_F8]
		push	[bp+var_F6]
		lea	ax, [bp+var_9B8]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_9AA], 1045h
		mov	ax, [bp+var_FE]
		mov	[bp+var_95A], ax
		mov	bx, [bp+var_95A]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_9B8]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_100], ax
		mov	[bp+var_102], di
		mov	ax, [bp+var_66]
		mov	[bp+var_104], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_106], ax
		mov	ax, si
		add	ax, 37h
		mov	[bp+var_108], ax
		push	ds
		push	offset dword_7771B
		push	2
		push	ax
		push	seg seg008
		push	offset loc_577E
		push	[bp+var_106]
		push	[bp+var_104]
		push	[bp+var_102]
		push	[bp+var_100]
		lea	ax, [bp+var_A18]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_A0A], 1045h
		mov	ax, [bp+var_108]
		mov	[bp+var_9BA], ax
		mov	bx, [bp+var_9BA]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_A18]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		add	di, 0Ah
		mov	ax, [bp+var_62]
		mov	[bp+var_10A], ax
		mov	[bp+var_10C], di
		mov	ax, [bp+var_66]
		mov	[bp+var_10E], ax
		mov	ax, [bp+var_64]
		mov	[bp+var_110], ax
		mov	di, si
		add	di, 39h
		push	ds
		push	offset dword_7771B
		push	2
		push	di
		push	seg seg008
		push	offset loc_5785
		push	ax
		push	[bp+var_10E]
		push	[bp+var_10C]
		push	[bp+var_10A]
		lea	ax, [bp+var_A78]
		push	ax
		nop
		push	cs
		call	near ptr sub_A08AE
		add	sp, 16h
		mov	[bp+var_A6A], 1045h
		mov	[bp+var_A1A], di
		mov	bx, [bp+var_A1A]
		mov	al, [bx]
		push	ax
		lea	ax, [bp+var_A78]
		push	ax
		push	cs
		call	near ptr sub_9E999
		add	sp, 4
		push	seg seg008
		push	offset loc_5754
		lea	ax, [bp+var_18A]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_18A]
		mov	word ptr [bp+var_114+2], ds
		mov	word ptr [bp+var_114], ax
		push	large 0A0032h
		push	large 0B4006Eh
		lea	ax, [bp+var_AA6]
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	[bp+var_A98], 0C9Ah
		mov	[bp+var_A82], 0
		push	large [bp+var_114]
		lea	ax, [bp+var_AA6]
		push	ax
		call	sub_74B18
		add	sp, 6
		mov	[bp+var_A88], 0
		mov	[bp+var_A86], 0
		mov	ax, word_7921A
		mov	[bp+var_A7C], ax
		mov	[bp+var_A7E], ax
		mov	[bp+var_A84], 0FFFFh
		mov	[bp+var_A98], 0E2Dh
		lea	ax, word ptr [bp+var_60+2]
		mov	[bp+var_A7A], ax
		push	seg seg008
		push	offset loc_5759
		lea	ax, [bp+var_18A]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_18A]
		mov	word ptr [bp+var_118+2], ds
		mov	word ptr [bp+var_118], ax
		push	large 0A0032h
		push	large 0B400A0h
		lea	ax, [bp+var_AD4]
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	[bp+var_AC6], 0C9Ah
		mov	[bp+var_AB0], 0
		push	large [bp+var_118]
		lea	ax, [bp+var_AD4]
		push	ax
		call	sub_74B18
		add	sp, 6
		mov	[bp+var_AB6], 0
		mov	[bp+var_AB4], 0
		mov	ax, word_7921A
		mov	[bp+var_AAA], ax
		mov	[bp+var_AAC], ax
		mov	[bp+var_AB2], 0FFFFh
		mov	[bp+var_AC6], 0E2Dh
		lea	ax, word ptr [bp+var_5C]
		mov	[bp+var_AA8], ax
		push	seg seg008
		push	offset loc_5762
		lea	ax, [bp+var_18A]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_18A]
		mov	word ptr [bp+var_11C+2], ds
		mov	word ptr [bp+var_11C], ax
		push	large 0A0032h
		push	large 0B400D2h
		lea	ax, [bp+var_B02]
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	[bp+var_AF4], 0C9Ah
		mov	[bp+var_ADE], 0
		push	large [bp+var_11C]
		lea	ax, [bp+var_B02]
		push	ax
		call	sub_74B18
		add	sp, 6
		mov	[bp+var_AE4], 0
		mov	[bp+var_AE2], 0
		mov	ax, word_7921A
		mov	[bp+var_AD8], ax
		mov	[bp+var_ADA], ax
		mov	[bp+var_AE0], 0FFFFh
		mov	[bp+var_AF4], 0E2Dh
		lea	ax, word ptr [bp+var_5C+2]
		mov	[bp+var_AD6], ax
		push	seg seg008
		push	offset loc_58BA
		lea	ax, [bp+var_18A]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_18A]
		mov	word ptr [bp+var_120+2], ds
		mov	word ptr [bp+var_120], ax
		push	large 0A0046h
		push	large 0BE0032h
		lea	ax, [bp+var_B30]
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	[bp+var_B22], 0C9Ah
		mov	[bp+var_B0C], 0
		push	large [bp+var_120]
		lea	ax, [bp+var_B30]
		push	ax
		call	sub_74B18
		add	sp, 6
		mov	[bp+var_B12], 0
		mov	[bp+var_B10], 0
		mov	ax, word_7921A
		mov	[bp+var_B06], ax
		mov	[bp+var_B08], ax
		mov	[bp+var_B0E], 0FFFFh
		mov	[bp+var_B22], 0E2Dh
		lea	ax, word ptr [bp+var_58+2]
		mov	[bp+var_B04], ax
		push	seg seg008
		push	offset loc_58C7
		lea	ax, [bp+var_18A]
		push	ax
		call	sub_54BE
		add	sp, 6
		lea	ax, [bp+var_18A]
		mov	word ptr [bp+var_124+2], ds
		mov	word ptr [bp+var_124], ax
		push	large 0A0046h
		push	large 0BE00C8h
		lea	ax, [bp+var_B5E]
		push	ax
		call	sub_74A8C
		add	sp, 0Ah
		mov	[bp+var_B50], 0C9Ah
		mov	[bp+var_B3A], 0
		push	large [bp+var_124]
		lea	ax, [bp+var_B5E]
		push	ax
		call	sub_74B18
		add	sp, 6
		mov	[bp+var_B40], 0
		mov	[bp+var_B3E], 0
		mov	ax, word_7921A
		mov	[bp+var_B34], ax
		mov	[bp+var_B36], ax
		mov	[bp+var_B3C], 0FFFFh
		mov	[bp+var_B50], 0E2Dh
		lea	ax, [bp+var_6]
		mov	[bp+var_B32], ax
		push	0
		lea	ax, [bp+var_276]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_2D4]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_334]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_394]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_3F4]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_454]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_570]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_5CE]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_62E]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_6BC]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_71C]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_77A]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_7DA]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_83A]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_89A]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_8F8]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_512]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		cmp	word_79E6F, 0
		jz	short loc_9FC02
		push	0
		lea	ax, [bp+var_958]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6

loc_9FC02:
		cmp	word_79E6D, 0
		jz	short loc_9FC1D
		push	0
		lea	ax, [bp+var_9B8]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6

loc_9FC1D:
		cmp	word_79E73, 0
		jz	short loc_9FC4C
		push	0
		lea	ax, [bp+var_A18]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_A78]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6

loc_9FC4C:
		push	0
		lea	ax, [bp+var_4B2]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		push	0
		lea	ax, [bp+var_AA6]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_1EF]
		mov	word ptr [bx+22h], 3Eh
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	0
		lea	ax, [bp+var_AD4]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_1EF]
		mov	word ptr [bx+22h], 3Eh
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	0
		lea	ax, [bp+var_B02]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_1EF]
		mov	word ptr [bx+22h], 3Eh
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	0
		lea	ax, [bp+var_B30]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_1EF]
		mov	word ptr [bx+22h], 3Eh
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	bx
		push	1Fh
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C76
		add	sp, 6
		push	0
		lea	ax, [bp+var_65C]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_1EF]
		mov	word ptr [bx+22h], 3Eh
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	0
		lea	ax, [bp+var_B5E]
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C8A
		add	sp, 6
		mov	bx, [bp+var_1EF]
		mov	word ptr [bx+22h], 3Eh
		mov	word ptr [bx+28h], 0FFFFh
		mov	word ptr [bx+2Ah], 0FFFFh
		push	bx
		push	1
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74C76
		add	sp, 6
		push	1
		push	large 10000h
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		push	si
		call	sub_73950
		add	sp, 0Ch
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74CC6
		jmp	loc_9FF60

loc_9FDA1:
		push	0
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74CE4
		add	sp, 4
		cmp	word ptr [bp+var_60+2], 0
		jz	short loc_9FDC4
		push	si
		nop
		push	cs
		call	near ptr sub_A0806
		pop	cx
		mov	word ptr [bp+var_60+2], 0
		jmp	short loc_9FDEA

loc_9FDC4:
		cmp	word ptr [bp+var_5C], 0
		jz	short loc_9FDD8
		push	si
		nop
		push	cs
		call	near ptr sub_A083E
		pop	cx
		mov	word ptr [bp+var_5C], 0
		jmp	short loc_9FDEA

loc_9FDD8:
		cmp	word ptr [bp+var_5C+2], 0
		jz	short loc_9FE00
		push	si
		nop
		push	cs
		call	near ptr sub_A0876
		pop	cx
		mov	word ptr [bp+var_5C+2], 0

loc_9FDEA:
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74CD5
		pop	cx
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74CD5
		pop	cx

loc_9FE00:
		cmp	word ptr [bp+var_58+2], 0
		jz	short loc_9FE12
		push	si
		call	sub_7395A
		pop	cx
		mov	word ptr [bp+var_58+2], 0

loc_9FE12:
		cmp	word ptr [bp+var_60], 0
		jz	short loc_9FE27
		mov	word ptr [bp+var_60], 0
		mov	byte_77718, 1
		mov	[bp+var_6], 1

loc_9FE27:
		cmp	word ptr [bp+var_58], 0
		jz	short loc_9FE63
		push	si
		call	sub_73969
		pop	cx
		mov	word ptr [bp+var_58], 0
		push	1
		push	large 10000h
		mov	al, [si+4]
		push	ax
		push	large [si]
		push	6B04h
		call	Memory_TypedAllocDispatchB_6534F
		add	sp, 0Ah
		push	dx
		push	ax
		lea	ax, [bp+var_216]
		push	ax
		push	si
		call	sub_73950
		add	sp, 0Ch

loc_9FE63:
		mov	[bp+var_125], 0
		cmp	word ptr [si+1Fh], 1
		jnz	short loc_9FE7F
		mov	al, byte_7D3B8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9FE7F
		inc	word ptr [si+1Fh]
		mov	[bp+var_125], 1

loc_9FE7F:
		cmp	word ptr [si+1Fh], 2
		jz	short loc_9FE91
		cmp	word ptr [si+1Fh], 4
		jz	short loc_9FE91
		cmp	word ptr [si+1Fh], 3
		jnz	short loc_9FEA9

loc_9FE91:
		push	0
		call	sub_524B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9FEA9
		mov	word ptr [si+1Fh], 0
		mov	[bp+var_125], 1

loc_9FEA9:
		cmp	word ptr [si+21h], 1
		jnz	short loc_9FEC0
		mov	al, byte_7D3B8
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9FEC0
		inc	word ptr [si+21h]
		mov	[bp+var_125], 1

loc_9FEC0:
		cmp	word ptr [si+21h], 2
		jnz	short loc_9FEDE
		push	0
		call	sub_524B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9FEDE
		mov	word ptr [si+21h], 0
		mov	[bp+var_125], 1

loc_9FEDE:
		cmp	word ptr [si+21h], 4
		jnz	short loc_9FEE9
		call	sub_738D3

loc_9FEE9:
		cmp	word ptr [si+1Fh], 0
		jnz	short loc_9FF08
		cmp	word ptr [si+21h], 0
		jnz	short loc_9FF08
		inc	word ptr [si+21h]
		cmp	word ptr [si+21h], 5
		jle	short loc_9FF03
		mov	word ptr [si+21h], 0

loc_9FF03:
		mov	[bp+var_125], 1

loc_9FF08:
		cmp	word ptr [si+1Fh], 1
		jnz	short loc_9FF27
		cmp	word ptr [si+21h], 1
		jnz	short loc_9FF27
		inc	word ptr [si+21h]
		cmp	word ptr [si+21h], 5
		jle	short loc_9FF22
		mov	word ptr [si+21h], 0

loc_9FF22:
		mov	[bp+var_125], 1

loc_9FF27:
		cmp	byte ptr [si+28h], 0
		jz	short loc_9FF44
		push	1
		call	sub_524B
		pop	cx
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9FF44
		mov	byte ptr [si+28h], 0
		mov	[bp+var_125], 1

loc_9FF44:
		cmp	[bp+var_125], 0
		jz	short loc_9FF61
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74CD5
		pop	cx
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74CD5

loc_9FF60:
		pop	cx

loc_9FF61:
		cmp	[bp+var_6], 0
		jnz	short loc_9FF73
		mov	al, byte_77718
		mov	ah, 0
		or	ax, ax
		jnz	short loc_9FF73
		jmp	loc_9FDA1

loc_9FF73:
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74CEE
		pop	cx
		cmp	byte ptr [si+5], 0
		jz	short loc_9FF9E
		cmp	dword ptr [si], 0
		jz	short loc_9FF9E
		push	0
		mov	al, [si+4]
		push	ax
		push	si
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_9FF9E

loc_9FF9E:
		mov	dword ptr [si], 0
		mov	byte ptr [si+5], 0
		mov	dword ptr [si+6], 0
		cmp	[bp+var_7], 0
		jz	short loc_9FFBC
		mov	[bp+var_6], 0

loc_9FFBC:
		mov	[bp+var_B50], 0C9Ah
		push	large [bp+var_B3A]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_B3A], 0
		lea	ax, [bp+var_B5E]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	[bp+var_B22], 0C9Ah
		push	large [bp+var_B0C]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_B0C], 0
		lea	ax, [bp+var_B30]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	[bp+var_AF4], 0C9Ah
		push	large [bp+var_ADE]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_ADE], 0
		lea	ax, [bp+var_B02]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	[bp+var_AC6], 0C9Ah
		push	large [bp+var_AB0]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_AB0], 0
		lea	ax, [bp+var_AD4]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	[bp+var_A98], 0C9Ah
		push	large [bp+var_A82]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_A82], 0
		lea	ax, [bp+var_AA6]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	[bp+var_A6A], 1045h
		push	large [bp+var_A54]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_A54], 0
		push	large [bp+var_A4A]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_A4A], 0
		push	0
		lea	ax, [bp+var_A78]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_A0A], 1045h
		push	large [bp+var_9F4]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_9F4], 0
		push	large [bp+var_9EA]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_9EA], 0
		push	0
		lea	ax, [bp+var_A18]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_9AA], 1045h
		push	large [bp+var_994]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_994], 0
		push	large [bp+var_98A]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_98A], 0
		push	0
		lea	ax, [bp+var_9B8]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_94A], 1045h
		push	large [bp+var_934]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_934], 0
		push	large [bp+var_92A]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_92A], 0
		push	0
		lea	ax, [bp+var_958]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		push	2
		lea	ax, [bp+var_8F8]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_88C], 1045h
		push	large [bp+var_876]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_876], 0
		push	large [bp+var_86C]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_86C], 0
		push	0
		lea	ax, [bp+var_89A]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_82C], 1045h
		push	large [bp+var_816]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_816], 0
		push	large [bp+var_80C]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_80C], 0
		push	0
		lea	ax, [bp+var_83A]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_7CC], 1045h
		push	large [bp+var_7B6]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_7B6], 0
		push	large [bp+var_7AC]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_7AC], 0
		push	0
		lea	ax, [bp+var_7DA]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		push	2
		lea	ax, [bp+var_77A]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_70E], 1045h
		push	large [bp+var_6F8]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_6F8], 0
		push	large [bp+var_6EE]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_6EE], 0
		push	0
		lea	ax, [bp+var_71C]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_6AE], 1045h
		push	large [bp+var_698]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_698], 0
		push	large [bp+var_68E]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_68E], 0
		push	0
		lea	ax, [bp+var_6BC]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_64E], 0C9Ah
		push	large [bp+var_638]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_638], 0
		lea	ax, [bp+var_65C]
		push	ax
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		mov	[bp+var_620], 1045h
		push	large [bp+var_60A]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_60A], 0
		push	large [bp+var_600]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_600], 0
		push	0
		lea	ax, [bp+var_62E]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		push	2
		lea	ax, [bp+var_5CE]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		push	2
		lea	ax, [bp+var_570]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_504], 1045h
		push	large [bp+var_4EE]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_4EE], 0
		push	large [bp+var_4E4]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_4E4], 0
		push	0
		lea	ax, [bp+var_512]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		push	2
		lea	ax, [bp+var_4B2]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_446], 1045h
		push	large [bp+var_430]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_430], 0
		push	large [bp+var_426]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_426], 0
		push	0
		lea	ax, [bp+var_454]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_3E6], 1045h
		push	large [bp+var_3D0]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_3D0], 0
		push	large [bp+var_3C6]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_3C6], 0
		push	0
		lea	ax, [bp+var_3F4]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_386], 1045h
		push	large [bp+var_370]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_370], 0
		push	large [bp+var_366]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_366], 0
		push	0
		lea	ax, [bp+var_394]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_326], 1045h
		push	large [bp+var_310]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_310], 0
		push	large [bp+var_306]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_306], 0
		push	0
		lea	ax, [bp+var_334]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		push	2
		lea	ax, [bp+var_2D4]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		mov	[bp+var_268], 1045h
		push	large [bp+var_252]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_252], 0
		push	large [bp+var_248]
		call	sub_3C0
		add	sp, 4
		mov	[bp+var_248], 0
		push	0
		lea	ax, [bp+var_276]
		push	ax
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		push	2
		lea	ax, [bp+var_216]
		push	ax
		call	sub_74CA8

loc_A051C:
		add	sp, 4
		cmp	[bp+var_6], 0
		jnz	short loc_A0528
		jmp	loc_9EDF1

loc_A0528:
		cmp	byte ptr [si+0Fh], 0
		jz	short loc_A054E
		cmp	dword ptr [si+0Ah], 0
		jz	short loc_A054E
		push	0
		mov	al, [si+0Eh]
		push	ax
		mov	ax, si
		add	ax, 0Ah
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A054E

loc_A054E:
		mov	dword ptr [si+0Ah], 0
		mov	byte ptr [si+0Fh], 0
		mov	dword ptr [si+10h], 0
		cmp	[bp+var_F], 0
		jz	short loc_A0586
		cmp	[bp+var_14], 0
		jz	short loc_A0586
		push	0
		mov	al, [bp+var_10]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A0586

loc_A0586:
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		push	si
		call	sub_73978
		pop	cx
		call	TextScrollDisplayB_ApplyHelperD_6FAF5
		push	si
		call	sub_73955
		pop	cx
		cmp	byte_7C9F0, 2
		jnz	short loc_A05B9
		mov	ax, 1
		jmp	short loc_A05BB

loc_A05B9:
		xor	ax, ax

loc_A05BB:
		or	ax, ax
		jz	short loc_A0601
		cmp	byte_7C9F0, 2
		jnz	short loc_A0601
		push	62B0h
		call	sub_1DF08
		pop	cx
		mov	[bp+var_16], ax
		push	1
		push	62B0h
		call	sub_1E034
		add	sp, 4
		push	large 20000h
		push	62B0h
		call	sub_1DF2E
		add	sp, 6
		cmp	[bp+var_16], 0
		jnz	short loc_A0601
		push	62B0h
		call	sub_1DF1C
		pop	cx
		jmp	short loc_A0601

loc_A0601:
		mov	ax, [bp+var_A]
		mov	[bp+var_18], ax
		mov	bx, word_79260
		mov	[bx+14h], ax
		push	67B7h
		call	sub_737D7
		pop	cx
		push	0
		push	2
		mov	eax, [bp+var_132]
		mov	[bp+var_1C], eax
		lea	ax, word ptr [bp+var_1C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_12E]
		mov	[bp+var_20], eax
		lea	ax, word ptr [bp+var_20]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_12A]
		mov	[bp+var_24], eax
		lea	ax, word ptr [bp+var_24]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_13E]
		mov	[bp+var_28], eax
		lea	ax, word ptr [bp+var_28]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_13A]
		mov	[bp+var_2C], eax
		lea	ax, word ptr [bp+var_2C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_136]
		mov	[bp+var_30], eax
		lea	ax, word ptr [bp+var_30]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_162]
		mov	[bp+var_34], eax
		lea	ax, word ptr [bp+var_34]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_15E]
		mov	[bp+var_38], eax
		lea	ax, word ptr [bp+var_38]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_15A]
		mov	[bp+var_3C], eax
		lea	ax, word ptr [bp+var_3C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_156]
		mov	[bp+var_40], eax
		lea	ax, word ptr [bp+var_40]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_152]
		mov	[bp+var_44], eax
		lea	ax, word ptr [bp+var_44]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_14E]
		mov	[bp+var_48], eax
		lea	ax, word ptr [bp+var_48]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_14A]
		mov	[bp+var_4C], eax
		lea	ax, word ptr [bp+var_4C]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_146]
		mov	[bp+var_50], eax
		lea	ax, word ptr [bp+var_50]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		push	0
		push	2
		mov	eax, [bp+var_142]
		mov	[bp+var_54], eax
		lea	ax, word ptr [bp+var_54]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		cmp	[bp+var_F], 0
		jz	short loc_A07DF
		cmp	[bp+var_14], 0
		jz	short loc_A07DF
		push	0
		mov	al, [bp+var_10]
		push	ax
		lea	ax, word ptr [bp+var_14]
		push	ax
		push	6B04h
		call	Memory_TypedFree_652D2
		add	sp, 8
		jmp	short loc_A07DF

loc_A07DF:
		mov	[bp+var_14], 0
		mov	[bp+var_F], 0
		mov	[bp+var_E], 0
		push	2
		lea	ax, [bp+var_1A2]
		push	ax
		call	sub_69368
		add	sp, 4
		pop	di
		pop	si
		leave
		retf
Options_FlightOptionsScreen_9EADA		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A0806		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+25h], 0
		mov	byte ptr [si+26h], 1
		mov	byte ptr [si+29h], 0
		mov	byte ptr [si+2Ah], 0
		mov	byte ptr [si+2Bh], 0
		mov	byte ptr [si+2Ch], 0
		mov	word ptr [si+2Dh], 0
		mov	byte ptr [si+2Fh], 0
		mov	byte ptr [si+30h], 1
		mov	byte ptr [si+31h], 1
		mov	word ptr [si+23h], 0
		pop	si
		pop	bp
		retf
sub_A0806		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A083E		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+25h], 1
		mov	byte ptr [si+26h], 1
		mov	byte ptr [si+29h], 0
		mov	byte ptr [si+2Ah], 1
		mov	byte ptr [si+2Bh], 1
		mov	byte ptr [si+2Ch], 1
		mov	word ptr [si+2Dh], 1
		mov	byte ptr [si+2Fh], 1
		mov	byte ptr [si+30h], 1
		mov	byte ptr [si+31h], 1
		mov	word ptr [si+23h], 1
		pop	si
		pop	bp
		retf
sub_A083E		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A0876		proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		mov	byte ptr [si+25h], 1
		mov	byte ptr [si+26h], 0
		mov	byte ptr [si+29h], 1
		mov	byte ptr [si+2Ah], 1
		mov	byte ptr [si+2Bh], 1
		mov	byte ptr [si+2Ch], 1
		mov	word ptr [si+2Dh], 2
		mov	byte ptr [si+2Fh], 1
		mov	byte ptr [si+30h], 0
		mov	byte ptr [si+31h], 0
		mov	word ptr [si+23h], 2
		pop	si
		pop	bp
		retf
sub_A0876		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A08AE		proc far

var_E		= word ptr -0Eh
var_C		= dword ptr -0Ch
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= dword ptr  10h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		mov	di, [bp+arg_0]
		or	di, di
		jnz	short loc_A08CE
		push	5Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_A08CE
		jmp	loc_A09B7

loc_A08CE:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	word ptr [bp+var_C+2], ds
		mov	word ptr [bp+var_C], 100Dh
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	di
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 0C9Ah
		mov	dword ptr [di+24h], 0
		push	large [bp+var_C]
		push	di
		call	sub_74B18
		add	sp, 6
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+20h], 0
		mov	ax, word_7921A
		mov	[di+2Ah], ax
		mov	[di+28h], ax
		mov	word ptr [di+22h], 0FFFFh
		mov	word ptr [di+0Eh], 0E2Dh
		mov	word ptr [di+2Ch], 0
		mov	word ptr [di+0Eh], 1011h
		mov	word ptr [di+18h], 0
		mov	word ptr [di+16h], 0
		mov	word ptr [di+22h], 3Eh
		mov	ax, 0FFFFh
		mov	[di+2Ah], ax
		mov	[di+28h], ax
		mov	ax, [bp+arg_10]
		mov	[di+5Ch], ax
		mov	dword ptr [di+2Eh], 0
		push	large [bp+arg_A]
		push	di
		nop
		push	cs
		call	near ptr sub_9E932
		add	sp, 6
		push	large [bp+arg_A]
		push	di
		nop
		push	cs
		call	near ptr sub_9E7E1
		add	sp, 6
		mov	[bp+var_E], 0
		jmp	short loc_A09AF

loc_A0989:
		mov	ax, [bp+var_E]
		shl	ax, 2
		les	bx, [bp+arg_12]
		add	bx, ax
		push	large es:[bx]
		call	sub_38FF
		add	sp, 4
		mov	bx, [bp+var_E]
		shl	bx, 2
		mov	[bx+di+34h], dx
		mov	[bx+di+32h], ax
		inc	[bp+var_E]

loc_A09AF:
		mov	ax, [di+5Ch]
		cmp	ax, [bp+var_E]
		jg	short loc_A0989

loc_A09B7:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_A08AE		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A09BD		proc far

var_10		= word ptr -10h
var_E		= dword ptr -0Eh
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
arg_A		= dword ptr  10h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	si, [bp+arg_E]
		or	di, di
		jnz	short loc_A09E0
		push	5Eh
		call	CRT_Malloc16_Retry
		pop	cx
		mov	di, ax
		or	ax, ax
		jnz	short loc_A09E0
		jmp	loc_A0AD9

loc_A09E0:
		mov	ax, [bp+arg_2]
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_4]
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_6]
		mov	[bp+var_6], ax
		mov	ax, [bp+arg_8]
		mov	[bp+var_8], ax
		mov	[bp+var_A], si
		mov	word ptr [bp+var_E+2], ds
		mov	word ptr [bp+var_E], 100Fh
		push	ax
		push	[bp+var_6]
		push	[bp+var_4]
		push	[bp+var_2]
		push	di
		call	sub_74A8C
		add	sp, 0Ah
		mov	word ptr [di+0Eh], 0C9Ah
		mov	dword ptr [di+24h], 0
		push	large [bp+var_E]
		push	di
		call	sub_74B18
		add	sp, 6
		mov	word ptr [di+1Eh], 0
		mov	word ptr [di+20h], 0
		mov	ax, word_7921A
		mov	[di+2Ah], ax
		mov	[di+28h], ax
		mov	word ptr [di+22h], 0FFFFh
		mov	word ptr [di+0Eh], 0E2Dh
		mov	ax, [bp+var_A]
		mov	[di+2Ch], ax
		mov	word ptr [di+0Eh], 1011h
		mov	word ptr [di+18h], 0
		mov	word ptr [di+22h], 3Eh
		mov	ax, 0FFFFh
		mov	[di+2Ah], ax
		mov	[di+28h], ax
		mov	ax, [bp+arg_10]
		mov	[di+5Ch], ax
		mov	dword ptr [di+2Eh], 0
		mov	[di+2Ch], si
		push	large [bp+arg_A]
		push	di
		nop
		push	cs
		call	near ptr sub_9E932
		add	sp, 6
		push	large [bp+arg_A]
		push	di
		nop
		push	cs
		call	near ptr sub_9E7E1
		add	sp, 6
		mov	[bp+var_10], 0
		jmp	short loc_A0AC3

loc_A0A9D:
		mov	ax, [bp+var_10]
		shl	ax, 2
		les	bx, [bp+arg_12]
		add	bx, ax
		push	large es:[bx]
		call	sub_38FF
		add	sp, 4
		mov	bx, [bp+var_10]
		shl	bx, 2
		mov	[bx+di+34h], dx
		mov	[bx+di+32h], ax
		inc	[bp+var_10]

loc_A0AC3:
		mov	ax, [di+5Ch]
		cmp	ax, [bp+var_10]
		jg	short loc_A0A9D
		mov	bx, [di+2Ch]
		push	word ptr [bx]
		push	di
		nop
		push	cs
		call	near ptr sub_9E789
		add	sp, 4

loc_A0AD9:
		mov	ax, di
		pop	di
		pop	si
		leave
		retf
sub_A09BD		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A0ADF		proc far

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
		jz	short loc_A0B6F
		mov	word ptr [si+0Eh], 1011h
		push	large [si+24h]
		call	sub_3C0
		add	sp, 4
		mov	dword ptr [si+24h], 0
		push	large [si+2Eh]
		call	sub_3C0
		add	sp, 4
		mov	dword ptr [si+2Eh], 0
		mov	[bp+var_2], 0
		jmp	short loc_A0B3A

loc_A0B25:
		mov	bx, [bp+var_2]
		shl	bx, 2
		push	large [bx+si+32h]
		call	sub_3C0
		add	sp, 4
		inc	[bp+var_2]

loc_A0B3A:
		mov	ax, [si+5Ch]
		cmp	ax, [bp+var_2]
		jg	short loc_A0B25
		mov	word ptr [si+0Eh], 0C9Ah
		push	large [si+24h]
		call	sub_3C0
		add	sp, 4
		mov	dword ptr [si+24h], 0
		push	si
		call	TextFormat_ReleaseStyleList_67E97
		pop	cx
		test	di, 1
		jz	short loc_A0B6F
		push	si
		call	sub_3B2
		pop	cx

loc_A0B6F:
		pop	di
		pop	si
		leave
		retf
sub_A0ADF		endp

; ----------------------------------------------------------------------

; Attributes: bp-based frame

sub_A0B73		proc far

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_0]
		mov	di, [bp+arg_2]
		or	si, si
		jz	short loc_A0BC7
		mov	word ptr [si+0Eh], 1045h
		push	large [si+24h]
		call	sub_3C0
		add	sp, 4
		mov	dword ptr [si+24h], 0
		push	large [si+2Eh]
		call	sub_3C0
		add	sp, 4
		mov	dword ptr [si+2Eh], 0
		push	0
		push	si
		nop
		push	cs
		call	near ptr sub_A0ADF
		add	sp, 4
		test	di, 1
		jz	short loc_A0BC7
		push	si
		call	sub_3B2
		pop	cx

loc_A0BC7:
		pop	di
		pop	si
		pop	bp
		retf
sub_A0B73		endp
ovr263		ends
