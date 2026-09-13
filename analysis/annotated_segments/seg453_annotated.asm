seg453		segment	para public 'OVERLAY' use16
		assume cs:seg453
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, recherche un sous-enregistrement IFF de type « DATA » (tag ASCII 0x41544144,
; ResourceRecord_SeekAndRead_64743, seg193) et charge 3 champs (ReadFieldGroupC_64A7E ×3) plus
; un champ via sub_2B007 — confirme l'existence d'un tag de chunk IFF générique « DATA » en
; complément de FORM/CHUNK (seg339).
; ==============================================================================================
PlayerComponent_LoadDataChunk_A6CA0	proc far		; CODE XREF: VROOMM_StubThunk_6CCF0J

arg_0		= dword	ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		push	0
		push	large 41544144h
		push	si
		call	ResourceRecord_SeekAndRead_64743
		add	sp, 8
		or	ax, ax
		jz	short loc_A6D08
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+46h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+57h], eax
		push	si
		call	ResourceRecord_ReadFieldGroupC_64A7E
		push	dx
		push	ax
		pop	eax
		pop	cx
		les	bx, [bp+arg_0]
		mov	es:[bx+53h], eax
		push	si
		mov	ax, word ptr [bp+arg_0]
		add	ax, 4Ah	; 'J'
		push	word ptr [bp+arg_0+2]
		push	ax
		call	String_ConstructFromFarPtrLen
		add	sp, 6

loc_A6D08:				; CODE XREF: PlayerComponent_LoadDataChunk_A6CA0+1Aj
		push	si
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C1CA
		add	sp, 6
		pop	si
		pop	bp
		retf
PlayerComponent_LoadDataChunk_A6CA0	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, constructeur de la classe dont le destructeur est Dtor_ScalarDeleting_4F316 (seg109,
; même tag vtable 32F6h) : alloue (sub_658, 0x5C octets), initialise deux classes de base
; (sub_3C9BC, sub_3DC27), remet à zéro les champs +0x55/+0x59, appelle
; TriggerObject_InitDerived_A6DA2.
; ==============================================================================================
TriggerObject_Construct_A6D18	proc far		; CODE XREF: VROOMM_StubThunk_6CCF5J

var_6		= word ptr -6
var_4		= dword	ptr -4
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 6
		push	si
		mov	eax, [bp+arg_0]
		mov	[bp+var_4], eax
		push	5Ch ; '\'
		call	CRT_Malloc16_Retry
		pop	cx
		mov	si, ax
		or	ax, ax
		jz	short loc_A6D6E
		push	ax
		call	WorldObject_BaseConstruct
		pop	cx
		mov	word ptr [si+51h], 0
		mov	word ptr [si], 26A4h
		push	si
		call	Camera_ResetState
		pop	cx
		mov	word ptr [si], 32F6h
		mov	dword ptr [si+55h], 0
		mov	word ptr [si+59h], 0
		push	large [bp+var_4]
		push	si
		nop
		push	cs
		call	near ptr TriggerObject_InitDerived_A6DA2
		add	sp, 6
		mov	ax, si
		jmp	short loc_A6D70
; ���������������������������������������������������������������������������

loc_A6D6E:				; CODE XREF: TriggerObject_Construct_A6D18+1Bj
		mov	ax, si

loc_A6D70:				; CODE XREF: TriggerObject_Construct_A6D18+54j
		mov	si, ax
		push	ax

loc_A6D73:
		push	large [bp+arg_0]
		call	VROOMM_StubThunk_6C00E

loc_A6D7C:
		add	sp, 6

loc_A6D7F:
		or	si, si

loc_A6D81:
		jz	short loc_A6D9D
		push	si

loc_A6D84:
		les	bx, [bp+arg_0]

loc_A6D87:
		push	word ptr es:[bx+36h]
		mov	bx, es:[bx+36h]
		mov	bx, [bx]
		call	dword ptr [bx+8]
		add	sp, 4
		mov	[bp+var_6], ax
		mov	[si+51h], ax

loc_A6D9D:				; CODE XREF: TriggerObject_Construct_A6D18:loc_A6D81j
		mov	ax, si
		pop	si
		leave
		retf
TriggerObject_Construct_A6D18	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, appelle sub_3DC3D (fonction précédemment signalée dans les notes méthodologiques du
; projet comme possible source de confusion avec des duplicats — ici utilisée normalement dans
; un chemin de construction).
; ==============================================================================================
TriggerObject_InitDerived_A6DA2	proc far		; CODE XREF: VROOMM_StubThunk_6CCFAJ TriggerObject_Construct_A6D18+4Cp

var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		mov	ax, word ptr [bp+var_4+2]
		mov	dx, word ptr [bp+var_4]
		add	dx, 57h	; 'W'
		mov	word ptr [bp+var_8+2], ax
		mov	word ptr [bp+var_8], dx
		les	bx, [bp+var_8]
		mov	eax, es:[bx]
		mov	[si+55h], eax
		mov	byte ptr [si+5Bh], 0
		push	large [bp+arg_2]
		push	si
		call	Camera_InitAttachedWithTarget_3DC3D
		add	sp, 6
		and	byte ptr [si+4], 0FDh
		or	byte ptr [si+4], 1
		or	byte ptr [si+4], 8
		or	byte ptr [si+4], 40h
		pop	si
		leave
		retf
TriggerObject_InitDerived_A6DA2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; ⚠️ far, 232 lignes, NON DÉTAILLÉE — dispatch vtable multiple
; ([bx+0x4C]/[bx+0x50]/[bx+0x3C]/[bx+0x40]/[bx+0x2C]/[bx+0x18]), spawn d'objet (sub_38B70,
; motif seg109), enregistrement conteneur (sub_21F8D) — même famille que
; TimedTrigger_SpawnAndBindGeometry_9E289 (seg432). Candidat pour session dédiée.
; ==============================================================================================
TriggerObject_SpawnAndBindFull_A6DF2	proc far		; CODE XREF: VROOMM_StubThunk_6CCFFJ

var_78		= dword	ptr -78h
var_74		= dword	ptr -74h
var_70		= dword	ptr -70h
var_6C		= dword	ptr -6Ch
var_68		= dword	ptr -68h
var_64		= dword	ptr -64h
var_60		= dword	ptr -60h
var_5C		= dword	ptr -5Ch
var_58		= dword	ptr -58h
var_54		= dword	ptr -54h
var_50		= dword	ptr -50h
var_4C		= dword	ptr -4Ch
var_48		= dword	ptr -48h
var_44		= dword	ptr -44h
var_40		= dword	ptr -40h
var_3C		= dword	ptr -3Ch
var_38		= dword	ptr -38h
var_34		= dword	ptr -34h
var_30		= dword	ptr -30h
var_2C		= dword	ptr -2Ch
var_28		= dword	ptr -28h
var_24		= dword	ptr -24h
var_20		= dword	ptr -20h
var_1C		= dword	ptr -1Ch
var_18		= dword	ptr -18h
var_14		= dword	ptr -14h
var_10		= dword	ptr -10h
var_C		= dword	ptr -0Ch
var_8		= dword	ptr -8
var_4		= dword	ptr -4
arg_0		= word ptr  6
arg_2		= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 78h
		push	si
		push	di
		mov	di, [bp+arg_0]
		mov	eax, [bp+arg_2]
		mov	[bp+var_4], eax
		push	1
		push	1
		push	large [bp+var_4]
		push	571Ch
		call	Debris_LoadAndInstantiate
		add	sp, 0Ah
		mov	si, ax
		or	si, si
		jnz	short loc_A6E21
		jmp	loc_A7009
; ���������������������������������������������������������������������������

loc_A6E21:				; CODE XREF: TriggerObject_SpawnAndBindFull_A6DF2+2Aj
		mov	eax, [si+0Eh]
		mov	[bp+var_8], eax
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		add	ax, 18h
		mov	cx, ax
		mov	bx, cx
		mov	eax, [bx]
		mov	[bp+var_48], eax
		mov	eax, [bx+4]
		mov	[bp+var_44], eax
		mov	eax, [bx+8]
		mov	[bp+var_40], eax
		mov	cx, di
		add	cx, 12h
		mov	eax, [di+20h]
		sar	eax, 1
		mov	[bp+var_C], eax
		mov	[bp+var_10], eax
		mov	eax, [bp+var_48]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_14], eax

loc_A6E76:
		mov	eax, [bp+var_14]
		mov	[bp+var_18], eax

loc_A6E7E:
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_1C], eax
		mov	eax, [bp+var_1C]
		mov	[bp+var_20], eax
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_10]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_24], eax
		mov	eax, [bp+var_24]
		mov	[bp+var_28], eax
		mov	eax, [bp+var_18]
		mov	[bp+var_54], eax
		mov	eax, [bp+var_20]
		mov	[bp+var_50], eax
		mov	eax, [bp+var_28]
		mov	[bp+var_4C], eax
		mov	bx, cx
		mov	eax, [bx]
		add	eax, [bp+var_54]
		mov	[bp+var_60], eax
		mov	eax, [bx+4]
		add	eax, [bp+var_50]
		mov	[bp+var_5C], eax
		mov	eax, [bx+8]
		add	eax, [bp+var_4C]
		mov	[bp+var_58], eax
		mov	eax, [bp+var_60]
		mov	[bp+var_6C], eax
		mov	eax, [bp+var_5C]
		mov	[bp+var_68], eax
		mov	eax, [bp+var_58]
		mov	[bp+var_64], eax
		mov	eax, [bp+var_6C]
		mov	[si+12h], eax
		mov	eax, [bp+var_68]
		mov	[si+16h], eax
		mov	eax, [bp+var_64]
		mov	[si+1Ah], eax
		mov	ax, word ptr [bp+var_8+2]
		mov	dx, word ptr [bp+var_8]
		add	dx, 46h	; 'F'
		mov	word ptr [bp+var_2C+2],	ax
		mov	word ptr [bp+var_2C], dx

loc_A6F32:
		les	bx, [bp+var_2C]

loc_A6F35:
		mov	eax, es:[bx]

loc_A6F39:
		mov	[bp+var_30], eax

loc_A6F3D:
		mov	eax, [bp+var_48]

loc_A6F41:
		mov	edx, [bp+var_30]

loc_A6F45:
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_48], eax
		mov	eax, [bp+var_44]
		mov	edx, [bp+var_30]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp+var_44], eax
		mov	eax, [bp+var_40]
		mov	edx, [bp+var_30]
		imul	edx

loc_A6F70:
		shrd	eax, edx, 8
		mov	[bp+var_40], eax
		push	di
		push	ss

loc_A6F7B:
		lea	ax, [bp+var_78]
		push	ax
		mov	bx, [di]
		call	dword ptr [bx+4Ch]
		add	sp, 6
		mov	eax, [bp+var_78]
		add	[bp+var_48], eax
		mov	eax, [bp+var_74]
		add	[bp+var_44], eax
		mov	eax, [bp+var_70]
		add	[bp+var_40], eax
		lea	ax, [bp+var_48]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+50h]
		add	sp, 4
		push	di
		mov	bx, [di]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+40h]
		add	sp, 4
		mov	[bp+var_34], 0
		lea	ax, [bp+var_34]
		push	ax
		mov	[bp+var_38], 0
		lea	ax, [bp+var_38]
		push	ax
		mov	[bp+var_3C], 0FFFFA600h
		lea	ax, [bp+var_3C]
		push	ax
		push	si
		mov	bx, [si]
		call	dword ptr [bx+2Ch]
		add	sp, 8
		push	si
		push	59C3h
		call	Container_KeyEquals
		add	sp, 4
		mov	bx, [di+51h]
		mov	al, [bx+20h]
		mov	ah, 0
		or	ax, ax
		jnz	short loc_A7009
		push	bx
		mov	bx, [bx]
		call	dword ptr [bx+18h]
		pop	cx

loc_A7009:				; CODE XREF: TriggerObject_SpawnAndBindFull_A6DF2+2Cj
					; TriggerObject_SpawnAndBindFull_A6DF2+20Ej
		mov	ax, si
		pop	di
		pop	si
		leave
		retf
TriggerObject_SpawnAndBindFull_A6DF2	endp


; ��������������� S U B	R O U T	I N E ���������������������������������������

; Attributes: bp-based frame

; ==============================================================================================
; far, initialise 4 sous-objets composites (sub_6CAC0 ×2, sub_6CB00, sub_6CB19, sub_6CB64)
; puis libère un tampon (Memory_TypedFreeWrapperC_5C6F3).
; ==============================================================================================
TriggerObject_ConstructSubobjects_A700F	proc far		; CODE XREF: VROOMM_StubThunk_6CD04J

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
		call	VROOMM_StubThunk_6CAC0
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB00
		add	sp, 4
		push	di

loc_A7035:
		push	word ptr [si+14h]
		call	VROOMM_StubThunk_6CB19

loc_A703D:
		add	sp, 4
		push	di
		mov	ax, si
		add	ax, 4
		push	ax
		call	VROOMM_StubThunk_6CB64
		add	sp, 4
		push	di
		push	word ptr [si]
		call	VROOMM_StubThunk_6CAC0
		add	sp, 4
		pop	di
		pop	si
		pop	bp
		retf
TriggerObject_ConstructSubobjects_A700F	endp

seg453		ends
