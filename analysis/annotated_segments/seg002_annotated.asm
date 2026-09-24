seg002		segment	byte public 'CODE' use16
		assume cs:seg002
		assume es:nothing, ss:nothing, ds:seg339, fs:nothing, gs:nothing

; ==============================================================================================
; far, 154 lignes (10440-10593) - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (tag 0x2B4
; confirme = ID=1 via le constructeur sub_742FC, apres correction d'un decalage systematique
; dans la table precedente). Formule complete : appelle sub_EC22 (sync de contexte partage),
; base=5. GARDES SEQUENTIELS (chacun -> sortie score=0 si echoue) : entite+0x13!=0 (tache en
; cours), byte_720C3>byte_72038 (seuil de competence/personnalite), word_72093<=0x14 (20 -
; angle de poursuite), sub_564A(entite) retourne faux, sub_56E5(entite) retourne faux (capteur
; mis en cache, deja documente), byte_720DF!=0 OU byte_720E0!=0. CALCUL PRINCIPAL (si tous les
; gardes passent) : ajuste le score via un jeu complexe de seuils sur word_72093/word_72095
; (angles) et dword_7209B vs dword_7201C (distance/seuil NUMS), avec des ajustements
; +2/-3/-4/-6/-10 selon les paliers d'angle - puis GARDE FINALE sur byte_720DF (si actif,
; soustrait entite->aircraft+0xB0 /2 - meme champ carburant que MVRS_ID13/19 connu). Score
; final borne [0,9].
; ==============================================================================================
MVRS_ID1_ScoreAngularGuarded_3E90:				; DATA XREF: seg339:02B8o
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	word ptr [bp+0Ah]

loc_3E99:				; DATA XREF: seg216:00CEo
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	word ptr [bp-2], 5
		les	bx, [bp+6]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_3EB7
		jmp	loc_3FC1
; ���������������������������������������������������������������������������

loc_3EB7:				; CODE XREF: seg002:0022j
		mov	al, byte_720C3
		cmp	al, byte_72038
		ja	short loc_3EC3
		jmp	loc_3FC1
; ���������������������������������������������������������������������������

loc_3EC3:				; CODE XREF: seg002:002Ej
		cmp	word_72093, 14h
		jle	short loc_3ECD
		jmp	loc_3FC1
; ���������������������������������������������������������������������������

loc_3ECD:				; CODE XREF: seg002:0038j
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TargetInRange
		add	sp, 4
		or	al, al
		jz	short loc_3EE1
		jmp	loc_3FC1
; ���������������������������������������������������������������������������

loc_3EE1:				; CODE XREF: seg002:004Cj
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_InterceptFeasibleCached
		add	sp, 4
		or	al, al
		jz	short loc_3EF8
		jmp	loc_3FC1
; ���������������������������������������������������������������������������

loc_3EF8:				; CODE XREF: seg002:0063j
		cmp	byte_720DF, 0
		jz	short loc_3F09
		cmp	byte_720E0, 0
		jz	short loc_3F09
		jmp	loc_3FC1
; ���������������������������������������������������������������������������

loc_3F09:				; CODE XREF: seg002:006Dj seg002:0074j
		les	bx, [bp+6]
		mov	ax, es:[bx+2]
		sar	ax, 1
		sub	[bp-2],	ax
		cmp	word_72093, 1Eh
		jge	short loc_3F4B
		cmp	word_72095, 5Ah	; 'Z'
		jle	short loc_3F4B
		add	word ptr [bp-2], 2
		cmp	word_72095, 87h	; '�'
		jle	short loc_3F95
		mov	eax, dword_7209B
		cmp	eax, dword_7201C
		jge	short loc_3F3F
		mov	ax, 1
		jmp	short loc_3F41
; ���������������������������������������������������������������������������

loc_3F3F:				; CODE XREF: seg002:00A8j
		xor	ax, ax

loc_3F41:				; CODE XREF: seg002:00ADj
		or	al, al
		jz	short loc_3F95
		add	word ptr [bp-2], 2
		jmp	short loc_3F95
; ���������������������������������������������������������������������������

loc_3F4B:				; CODE XREF: seg002:008Aj seg002:0091j
		cmp	word_72093, 5Ah	; 'Z'
		jle	short loc_3F58
		sub	word ptr [bp-2], 0Ah
		jmp	short loc_3F63
; ���������������������������������������������������������������������������

loc_3F58:				; CODE XREF: seg002:00C0j
		cmp	word_72093, 2Dh	; '-'
		jle	short loc_3F63
		sub	word ptr [bp-2], 4

loc_3F63:				; CODE XREF: seg002:00C6j seg002:00CDj
		cmp	word_72095, 5Ah	; 'Z'
		jge	short loc_3F70
		sub	word ptr [bp-2], 3
		jmp	short loc_3F7B
; ���������������������������������������������������������������������������

loc_3F70:				; CODE XREF: seg002:00D8j
		cmp	word_72095, 2Dh	; '-'
		jge	short loc_3F7B
		sub	word ptr [bp-2], 6

loc_3F7B:				; CODE XREF: seg002:00DEj seg002:00E5j
		mov	eax, dword_7209B
		cmp	eax, dword_7201C
		jle	short loc_3F8B
		mov	ax, 1
		jmp	short loc_3F8D
; ���������������������������������������������������������������������������

loc_3F8B:				; CODE XREF: seg002:00F4j
		xor	ax, ax

loc_3F8D:				; CODE XREF: seg002:00F9j
		or	al, al
		jz	short loc_3F95
		sub	word ptr [bp-2], 3

loc_3F95:				; CODE XREF: seg002:009Dj seg002:00B3j ...
		cmp	byte_720DF, 0
		jz	short loc_3FAE
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	al, es:[bx+0B0h]
		cbw
		sar	ax, 1
		sub	[bp-2],	ax

loc_3FAE:				; CODE XREF: seg002:010Aj
		cmp	word ptr [bp-2], 9
		jle	short loc_3FBB
		mov	word ptr [bp-2], 9
		jmp	short loc_3FC6
; ���������������������������������������������������������������������������

loc_3FBB:				; CODE XREF: seg002:0122j
		cmp	word ptr [bp-2], 0
		jg	short loc_3FC6

loc_3FC1:				; CODE XREF: seg002:0024j seg002:0030j ...
		mov	word ptr [bp-2], 0

loc_3FC6:				; CODE XREF: seg002:0129j seg002:012Fj
		mov	al, [bp-2]
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far - LUE INTEGRALEMENT. Fonction de SCORE pour MVRS ID=0x3 (tag 0x278). Meme famille
; angulaire generique que 0x4/0x5/0x6/0x7/0x8 (base=5, ajuste via word_72093/72095, seuils
; NUMS dword_7201C, gardee par byte_720C3/byte_72038). Borne 0-9.
; ==============================================================================================
MVRS_ID3_ScoreGeneric_3FCB:				; DATA XREF: seg339:off_6D340o
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	word ptr [bp-2], 5
		les	bx, [bp+6]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_3FF2
		jmp	loc_411E
; ���������������������������������������������������������������������������

loc_3FF2:				; CODE XREF: seg002:015Dj
		mov	al, byte_720C3
		cmp	al, byte_72038
		ja	short loc_3FFE
		jmp	loc_411E
; ���������������������������������������������������������������������������

loc_3FFE:				; CODE XREF: seg002:0169j
		cmp	word_72093, 14h
		jle	short loc_4008
		jmp	loc_411E
; ���������������������������������������������������������������������������

loc_4008:				; CODE XREF: seg002:0173j
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TargetInRange
		add	sp, 4
		or	al, al
		jz	short loc_401C
		jmp	loc_411E
; ���������������������������������������������������������������������������

loc_401C:				; CODE XREF: seg002:0187j
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_InterceptFeasibleCached
		add	sp, 4
		or	al, al
		jz	short loc_4033
		jmp	loc_411E
; ���������������������������������������������������������������������������

loc_4033:				; CODE XREF: seg002:019Ej
		cmp	byte_720DF, 0
		jz	short loc_403D
		jmp	loc_411E
; ���������������������������������������������������������������������������

loc_403D:				; CODE XREF: seg002:01A8j
		les	bx, [bp+6]
		mov	ax, es:[bx+2]
		sar	ax, 1
		sub	[bp-2],	ax
		cmp	word_72095, 87h	; '�'
		jle	short loc_4074
		cmp	word_72093, 1Eh
		jge	short loc_4074
		mov	eax, dword_7209B
		cmp	eax, dword_7201C
		jge	short loc_4068
		mov	ax, 1
		jmp	short loc_406A
; ���������������������������������������������������������������������������

loc_4068:				; CODE XREF: seg002:01D1j
		xor	ax, ax

loc_406A:				; CODE XREF: seg002:01D6j
		or	al, al
		jz	short loc_4074
		add	word ptr [bp-2], 7
		jmp	short loc_40BE
; ���������������������������������������������������������������������������

loc_4074:				; CODE XREF: seg002:01BFj seg002:01C6j ...
		cmp	word_72093, 5Ah	; 'Z'
		jle	short loc_4081
		sub	word ptr [bp-2], 0Ah
		jmp	short loc_408C
; ���������������������������������������������������������������������������

loc_4081:				; CODE XREF: seg002:01E9j
		cmp	word_72093, 2Dh	; '-'
		jle	short loc_408C
		sub	word ptr [bp-2], 4

loc_408C:				; CODE XREF: seg002:01EFj seg002:01F6j
		cmp	word_72095, 5Ah	; 'Z'
		jge	short loc_4099
		sub	word ptr [bp-2], 3
		jmp	short loc_40A4
; ���������������������������������������������������������������������������

loc_4099:				; CODE XREF: seg002:0201j
		cmp	word_72095, 2Dh	; '-'
		jge	short loc_40A4
		sub	word ptr [bp-2], 6

loc_40A4:				; CODE XREF: seg002:0207j seg002:020Ej
		mov	eax, dword_7209B
		cmp	eax, dword_7201C
		jle	short loc_40B4
		mov	ax, 1
		jmp	short loc_40B6
; ���������������������������������������������������������������������������

loc_40B4:				; CODE XREF: seg002:021Dj
		xor	ax, ax

loc_40B6:				; CODE XREF: seg002:0222j
		or	al, al
		jz	short loc_40BE
		sub	word ptr [bp-2], 3

loc_40BE:				; CODE XREF: seg002:01E2j seg002:0228j
		mov	eax, dword_720CD
		cmp	eax, dword_720C9
		jge	short loc_40CE
		mov	ax, 1
		jmp	short loc_40D0
; ���������������������������������������������������������������������������

loc_40CE:				; CODE XREF: seg002:0237j
		xor	ax, ax

loc_40D0:				; CODE XREF: seg002:023Cj
		or	al, al
		jz	short loc_40D8
		sub	word ptr [bp-2], 6

loc_40D8:				; CODE XREF: seg002:0242j
		cmp	byte_720DF, 0
		jz	short loc_40F1
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	al, es:[bx+0B0h]
		cbw
		sar	ax, 1
		sub	[bp-2],	ax

loc_40F1:				; CODE XREF: seg002:024Dj
		push	5
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	Pilot_SkillCheck_B7
		add	sp, 6
		or	al, al
		jz	short loc_410B
		add	word ptr [bp-2], 3

loc_410B:				; CODE XREF: seg002:0275j
		cmp	word ptr [bp-2], 9
		jle	short loc_4118
		mov	word ptr [bp-2], 9
		jmp	short loc_4123
; ���������������������������������������������������������������������������

loc_4118:				; CODE XREF: seg002:027Fj
		cmp	word ptr [bp-2], 0
		jg	short loc_4123

loc_411E:				; CODE XREF: seg002:015Fj seg002:016Bj ...
		mov	word ptr [bp-2], 0

loc_4123:				; CODE XREF: seg002:0286j seg002:028Cj
		mov	al, [bp-2]
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 108 lignes (10771-10878) - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (tag 0x278
; confirme = ID=3 via methode d'ancrage sequentiel off_6D32C). Base=5, efface node+0x27 au
; debut. GARDES : tache en cours (entite+0x13), byte_720C3<=byte_72038, word_72093<=0x14 ->
; score=0 direct si echec (PAS de sub_564A/sub_56E5 ici, contrairement a ID=1/2/4/7 - formule
; plus simple). CALCUL : ajustements -3/-6 sur word_72095 (paliers 0x5A/0x2D), +3 ou -3 selon
; dword_7209B vs dword_7201C (deux comparaisons opposees successives). GARDE FINALE : si
; byte_720DF actif, soustrait entite->aircraft+0xB0 /4 (meme champ carburant, division
; differente des autres IDs qui font /2). Score borne [0,9].
; ==============================================================================================
MVRS_ID3_ScoreAngularSimple_4128:				; DATA XREF: seg339:off_6D32Co
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	dx, 5
		les	bx, [bp+6]

loc_4140:
		mov	byte ptr es:[bx+27h], 0

loc_4145:
		cmp	word ptr es:[bx+13h], 0
		jz	short loc_415C

loc_414C:
		mov	al, byte_720C3

loc_414F:
		cmp	al, byte_72038

loc_4153:
		jbe	short loc_415C

loc_4155:
		cmp	word_72093, 14h
		jle	short loc_4160

loc_415C:				; CODE XREF: seg002:02BAj
					; seg002:loc_4153j
		xor	dx, dx
		jmp	short loc_41C9
; ���������������������������������������������������������������������������

loc_4160:				; CODE XREF: seg002:02CAj
		cmp	word_72095, 5Ah	; 'Z'
		jge	short loc_416C
		sub	dx, 3
		jmp	short loc_4176
; ���������������������������������������������������������������������������

loc_416C:				; CODE XREF: seg002:02D5j
		cmp	word_72095, 2Dh	; '-'
		jge	short loc_4176
		sub	dx, 6

loc_4176:				; CODE XREF: seg002:02DAj seg002:02E1j
		cmp	word_72095, 87h	; '�'
		jle	short loc_4197
		mov	eax, dword_7209B
		cmp	eax, dword_7201C
		jg	short loc_418E
		mov	ax, 1
		jmp	short loc_4190
; ���������������������������������������������������������������������������

loc_418E:				; CODE XREF: seg002:02F7j
		xor	ax, ax

loc_4190:				; CODE XREF: seg002:02FCj
		or	al, al
		jz	short loc_4197
		add	dx, 3

loc_4197:				; CODE XREF: seg002:02ECj seg002:0302j
		mov	eax, dword_7209B
		cmp	eax, dword_7201C
		jle	short loc_41A7
		mov	ax, 1
		jmp	short loc_41A9
; ���������������������������������������������������������������������������

loc_41A7:				; CODE XREF: seg002:0310j
		xor	ax, ax

loc_41A9:				; CODE XREF: seg002:0315j
		or	al, al
		jz	short loc_41B0
		sub	dx, 3

loc_41B0:				; CODE XREF: seg002:031Bj
		cmp	byte_720DF, 0
		jz	short loc_41C9
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	al, es:[bx+0B0h]
		cbw
		sar	ax, 2
		sub	dx, ax

loc_41C9:				; CODE XREF: seg002:02CEj seg002:0325j
		cmp	dx, 9
		jle	short loc_41D3
		mov	dx, 9
		jmp	short loc_41D9
; ���������������������������������������������������������������������������

loc_41D3:				; CODE XREF: seg002:033Cj
		or	dx, dx
		jg	short loc_41D9
		xor	dx, dx

loc_41D9:				; CODE XREF: seg002:0341j seg002:0345j
		mov	al, dl
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 192 lignes (10881-11072) - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (tag 0x264
; confirme = ID=4 via constructeur + XREF directe seg339:0268). Base=5, memes gardes
; sequentiels que ID=1 (tache en cours, byte_720C3/72038, word_72093<=0x14, sub_564A,
; sub_56E5, byte_720DF/720E0) MAIS calcul principal DISTINCT : introduit word_720DD (nouvelle
; variable, seuil 0x87), utilise des seuils differents (0x23,0x2D,0x1E,0x5A) avec des
; ajustements +4/+2/-2/-3/-0xA. Section finale UNIQUE a cet ID : compare dword_720CD a DEUX
; seuils differents (dword_720C9, dword_720C5) avec ajustements -8/-2 - probable double palier
; de proximite de menace, absent de la formule d'ID=1. Score borne [0,9].
; ==============================================================================================
MVRS_ID4_ScoreAngularExtended_41DD:				; DATA XREF: seg339:0268o
		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	word ptr [bp-2], 5
		les	bx, [bp+6]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_4204
		jmp	loc_4344
; ���������������������������������������������������������������������������

loc_4204:				; CODE XREF: seg002:036Fj
		mov	al, byte_720C3
		cmp	al, byte_72038
		ja	short loc_4210
		jmp	loc_4344
; ���������������������������������������������������������������������������

loc_4210:				; CODE XREF: seg002:037Bj
		cmp	word_72093, 14h
		jle	short loc_421A
		jmp	loc_4344
; ���������������������������������������������������������������������������

loc_421A:				; CODE XREF: seg002:0385j
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TargetInRange
		add	sp, 4
		or	al, al
		jz	short loc_422E
		jmp	loc_4344
; ���������������������������������������������������������������������������

loc_422E:				; CODE XREF: seg002:0399j
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_InterceptFeasibleCached
		add	sp, 4
		or	al, al
		jz	short loc_4245
		jmp	loc_4344
; ���������������������������������������������������������������������������

loc_4245:				; CODE XREF: seg002:03B0j
		cmp	byte_720DF, 0
		jz	short loc_4256

loc_424C:
		cmp	byte_720E0, 0
		jz	short loc_4256
		jmp	loc_4344
; ���������������������������������������������������������������������������

loc_4256:				; CODE XREF: seg002:03BAj seg002:03C1j
		cmp	word_72095, 23h	; '#'
		jge	short loc_427A
		cmp	word_720DD, 87h	; '�'
		jle	short loc_4273
		cmp	word_72093, 2Dh	; '-'
		jge	short loc_4273
		add	word ptr [bp-2], 4
		jmp	loc_42FB
; ���������������������������������������������������������������������������

loc_4273:				; CODE XREF: seg002:03D3j seg002:03DAj
		sub	word ptr [bp-2], 0Ah
		jmp	loc_42FB
; ���������������������������������������������������������������������������

loc_427A:				; CODE XREF: seg002:03CBj
		cmp	word_72093, 1Eh
		jge	short loc_42B0
		cmp	word_72095, 5Ah	; 'Z'
		jle	short loc_42B0
		add	word ptr [bp-2], 2
		cmp	word_72095, 87h	; '�'
		jle	short loc_42FB
		mov	eax, dword_7209B
		cmp	eax, dword_7201C
		jge	short loc_42A4
		mov	ax, 1
		jmp	short loc_42A6
; ���������������������������������������������������������������������������

loc_42A4:				; CODE XREF: seg002:040Dj
		xor	ax, ax

loc_42A6:				; CODE XREF: seg002:0412j
		or	al, al
		jz	short loc_42FB
		add	word ptr [bp-2], 2
		jmp	short loc_42FB
; ���������������������������������������������������������������������������

loc_42B0:				; CODE XREF: seg002:03EFj seg002:03F6j
		cmp	word_72093, 2Dh	; '-'
		jle	short loc_42BB
		sub	word ptr [bp-2], 2

loc_42BB:				; CODE XREF: seg002:0425j
		cmp	word_72095, 5Ah	; 'Z'
		jge	short loc_42C8
		sub	word ptr [bp-2], 2
		jmp	short loc_42D3
; ���������������������������������������������������������������������������

loc_42C8:				; CODE XREF: seg002:0430j
		cmp	word_72095, 2Dh	; '-'
		jge	short loc_42D3
		sub	word ptr [bp-2], 3

loc_42D3:				; CODE XREF: seg002:0436j seg002:043Dj
		mov	eax, dword_7201C
		shl	eax, 1
		mov	[bp-6],	eax
		mov	[bp-0Ah], eax
		mov	eax, dword_7209B
		cmp	eax, [bp-0Ah]
		jle	short loc_42F1
		mov	ax, 1
		jmp	short loc_42F3
; ���������������������������������������������������������������������������

loc_42F1:				; CODE XREF: seg002:045Aj
		xor	ax, ax

loc_42F3:				; CODE XREF: seg002:045Fj
		or	al, al
		jz	short loc_42FB
		sub	word ptr [bp-2], 3

loc_42FB:				; CODE XREF: seg002:03E0j seg002:03E7j ...
		mov	eax, dword_720CD
		cmp	eax, dword_720C9
		jge	short loc_430B
		mov	ax, 1
		jmp	short loc_430D
; ���������������������������������������������������������������������������

loc_430B:				; CODE XREF: seg002:0474j
		xor	ax, ax

loc_430D:				; CODE XREF: seg002:0479j
		or	al, al
		jz	short loc_4317
		sub	word ptr [bp-2], 8
		jmp	short loc_4331
; ���������������������������������������������������������������������������

loc_4317:				; CODE XREF: seg002:047Fj
		mov	eax, dword_720CD
		cmp	eax, dword_720C5
		jge	short loc_4327
		mov	ax, 1
		jmp	short loc_4329
; ���������������������������������������������������������������������������

loc_4327:				; CODE XREF: seg002:0490j
		xor	ax, ax

loc_4329:				; CODE XREF: seg002:0495j
		or	al, al
		jz	short loc_4331
		sub	word ptr [bp-2], 2

loc_4331:				; CODE XREF: seg002:0485j seg002:049Bj
		cmp	word ptr [bp-2], 9
		jle	short loc_433E
		mov	word ptr [bp-2], 9
		jmp	short loc_4349
; ���������������������������������������������������������������������������

loc_433E:				; CODE XREF: seg002:04A5j
		cmp	word ptr [bp-2], 0

loc_4342:
		jg	short loc_4349

loc_4344:				; CODE XREF: seg002:0371j seg002:037Dj ...
		mov	word ptr [bp-2], 0

loc_4349:				; CODE XREF: seg002:04ACj
					; seg002:loc_4342j
		mov	al, [bp-2]

locret_434C:
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 328 lignes (11075-11402) - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (tag 0x250
; confirme = ID=5 via ancrage sequentiel - CORRIGE : precedemment attribuee a tort a ID=6, y
; compris le lien avec la sequence Immelmann/Split S). Base=3, pose node+0x26=3 des le debut.
; Gardes : tache en cours, sub_564A, byte_720E0. Calcul tres riche : compare
; dword_720CD/720C5, verifie une fenetre temporelle sur dword_720D9 (bornes 0xFFF63C00 et
; 0x4E200 - grandes valeurs suggerant une echelle temporelle en unites fines), ajuste selon
; word_72095/72093/720DD (seuils 0x23/0x91/0x2D/0x5A), compare dword_720BB/720B7
; (bearing/orientation) sous plusieurs formes, lit entite->aircraft+0x8B (NOUVEAU champ,
; compteur/etat non documente ailleurs, formule *3/2 si >=2), appelle sub_56E5 (capteur
; cache). DECLENCHEUR DE LA SEQUENCE ACROBATIQUE : compare dword_72034 (constante NUMS,
; confirmee utilisee dans la sequence Immelmann/Split S) contre entite+0x11->+0x1A - si
; depasse, POSE node+0x26=1 (le sous-mode qui demarre la sequence a 8 phases, AI_SYSTEM.md
; §3.9 - CORRIGE : cette sequence appartient a ID=5, pas ID=6). Score final borne [0,9].
; ==============================================================================================
MVRS_ID5_ScoreSubmodeManeuver_434E:				; DATA XREF: seg339:0254o
		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	word ptr [bp-2], 3
		les	bx, [bp+6]
		mov	byte ptr es:[bx+26h], 3
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_437A
		jmp	loc_45B4
; ���������������������������������������������������������������������������

loc_437A:				; CODE XREF: seg002:04E5j
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TargetInRange
		add	sp, 4
		or	al, al
		jz	short loc_438E
		jmp	loc_45B4
; ���������������������������������������������������������������������������

loc_438E:				; CODE XREF: seg002:04F9j
		cmp	byte_720E0, 0
		jz	short loc_4398
		jmp	loc_45B4
; ���������������������������������������������������������������������������

loc_4398:				; CODE XREF: seg002:0503j
		mov	eax, dword_720CD
		cmp	eax, dword_720C5
		jge	short loc_43A8
		mov	ax, 1
		jmp	short loc_43AA
; ���������������������������������������������������������������������������

loc_43A8:				; CODE XREF: seg002:0511j
		xor	ax, ax

loc_43AA:				; CODE XREF: seg002:0516j
		or	al, al
		jz	short loc_43B1
		jmp	loc_45B4
; ���������������������������������������������������������������������������

loc_43B1:				; CODE XREF: seg002:051Cj
		mov	al, byte_720DF
		mov	ah, 0
		or	ax, ax
		jnz	short loc_43BD
		jmp	loc_45B4
; ���������������������������������������������������������������������������

loc_43BD:				; CODE XREF: seg002:0528j
		les	bx, [bp+6]
		mov	ax, es:[bx+2]
		shl	ax, 1
		sub	[bp-2],	ax
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_43D3
		jmp	loc_449B
; ���������������������������������������������������������������������������

loc_43D3:				; CODE XREF: seg002:053Ej
		mov	eax, dword_720D9
		mov	[bp-1Ah], eax
		cmp	dword ptr [bp-1Ah], 0FFF63C00h
		jge	short loc_43EA
		mov	ax, 1
		jmp	short loc_43EC
; ���������������������������������������������������������������������������

loc_43EA:				; CODE XREF: seg002:0553j
		xor	ax, ax

loc_43EC:				; CODE XREF: seg002:0558j
		or	al, al
		jz	short loc_43F6
		sub	word ptr [bp-2], 7
		jmp	short loc_440F
; ���������������������������������������������������������������������������

loc_43F6:				; CODE XREF: seg002:055Ej
		cmp	dword ptr [bp-1Ah], 4E200h
		jl	short loc_4405
		mov	ax, 1
		jmp	short loc_4407
; ���������������������������������������������������������������������������

loc_4405:				; CODE XREF: seg002:056Ej
		xor	ax, ax

loc_4407:				; CODE XREF: seg002:0573j
		or	al, al
		jz	short loc_440F
		add	word ptr [bp-2], 2

loc_440F:				; CODE XREF: seg002:0564j seg002:0579j
		cmp	word_72095, 23h	; '#'
		jge	short loc_4431
		cmp	word_720DD, 91h	; '�'
		jle	short loc_442B
		cmp	word_72093, 2Dh	; '-'
		jge	short loc_442B

loc_4425:				; CODE XREF: seg002:0605j
		add	word ptr [bp-2], 4
		jmp	short loc_449B
; ���������������������������������������������������������������������������

loc_442B:				; CODE XREF: seg002:058Cj seg002:0593j
		sub	word ptr [bp-2], 0Ah
		jmp	short loc_449B
; ���������������������������������������������������������������������������

loc_4431:				; CODE XREF: seg002:0584j
		cmp	word_72095, 5Ah	; 'Z'
		jle	short loc_449B
		cmp	word_72093, 2Dh	; '-'
		jge	short loc_449B
		mov	eax, dword_7201C
		shl	eax, 1
		mov	[bp-1Eh], eax

loc_444A:
		mov	[bp-22h], eax
		mov	eax, dword_7209B
		cmp	eax, [bp-22h]
		jge	short loc_445D
		mov	ax, 1
		jmp	short loc_445F
; ���������������������������������������������������������������������������

loc_445D:				; CODE XREF: seg002:05C6j
		xor	ax, ax

loc_445F:				; CODE XREF: seg002:05CBj
		or	al, al
		jz	short loc_4474
		add	word ptr [bp-2], 5
		cmp	byte_720DF, 0
		jz	short loc_449B
		add	word ptr [bp-2], 2
		jmp	short loc_449B
; ���������������������������������������������������������������������������

loc_4474:				; CODE XREF: seg002:05D1j
		mov	eax, dword_7209B
		cmp	eax, dword_7201C
		jge	short loc_4484
		mov	ax, 1
		jmp	short loc_4486
; ���������������������������������������������������������������������������

loc_4484:				; CODE XREF: seg002:05EDj
		xor	ax, ax

loc_4486:				; CODE XREF: seg002:05F2j
		or	al, al
		jz	short loc_4497
		add	word ptr [bp-2], 3
		cmp	byte_720DF, 0
		jz	short loc_449B
		jmp	short loc_4425
; ���������������������������������������������������������������������������

loc_4497:				; CODE XREF: seg002:05F8j
		sub	word ptr [bp-2], 2

loc_449B:				; CODE XREF: seg002:0540j seg002:0599j ...
		mov	eax, dword_720BB
		sar	eax, 1
		mov	[bp-6],	eax
		mov	[bp-0Ah], eax
		mov	eax, dword_720B7
		cmp	eax, [bp-0Ah]
		jge	short loc_44B9
		mov	ax, 1
		jmp	short loc_44BB
; ���������������������������������������������������������������������������

loc_44B9:				; CODE XREF: seg002:0622j
		xor	ax, ax

loc_44BB:				; CODE XREF: seg002:0627j
		or	al, al
		jz	short loc_44C5
		sub	word ptr [bp-2], 4
		jmp	short loc_4509
; ���������������������������������������������������������������������������

loc_44C5:				; CODE XREF: seg002:062Dj
		mov	eax, dword_720B7
		cmp	eax, dword_720BB
		jge	short loc_44D5
		mov	ax, 1
		jmp	short loc_44D7
; ���������������������������������������������������������������������������

loc_44D5:				; CODE XREF: seg002:063Ej
		xor	ax, ax

loc_44D7:				; CODE XREF: seg002:0643j
		or	al, al
		jz	short loc_44E1
		sub	word ptr [bp-2], 2
		jmp	short loc_4509
; ���������������������������������������������������������������������������

loc_44E1:				; CODE XREF: seg002:0649j
		mov	eax, dword_720BB
		shl	eax, 1
		mov	[bp-0Eh], eax
		mov	[bp-12h], eax
		mov	eax, dword_720B7
		cmp	eax, [bp-12h]
		jle	short loc_44FF
		mov	ax, 1
		jmp	short loc_4501
; ���������������������������������������������������������������������������

loc_44FF:				; CODE XREF: seg002:0668j
		xor	ax, ax

loc_4501:				; CODE XREF: seg002:066Dj
		or	al, al
		jz	short loc_4509
		add	word ptr [bp-2], 2

loc_4509:				; CODE XREF: seg002:0633j seg002:064Fj ...
		cmp	byte_720DF, 0
		jz	short loc_4557
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+8Bh]
		mov	[bp-18h], al
		cmp	byte ptr [bp-18h], 2
		jb	short loc_453D
		mov	ah, 0
		add	ax, 0FFFEh
		imul	ax, 3
		cwd
		sub	ax, dx
		sar	ax, 1
		add	ax, 3
		add	[bp-2],	ax
		jmp	short loc_4557
; ���������������������������������������������������������������������������

loc_453D:				; CODE XREF: seg002:0696j
		mov	al, [bp-18h]
		mov	ah, 0
		push	ax

loc_4543:
		mov	ax, 2
		pop	dx

loc_4547:
		sub	ax, dx

loc_4549:
		imul	ax, 3
		cwd
		sub	ax, dx
		sar	ax, 1

loc_4551:
		add	ax, 3

loc_4554:
		sub	[bp-2],	ax

loc_4557:				; CODE XREF: seg002:067Ej seg002:06ABj
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_InterceptFeasibleCached
		add	sp, 4
		or	al, al
		jz	short loc_4571
		add	word ptr [bp-2], 4
		jmp	short loc_45A1
; ���������������������������������������������������������������������������

loc_4571:				; CODE XREF: seg002:06D9j
		mov	eax, dword_72034
		mov	[bp-16h], eax
		shl	eax, 8
		les	bx, [bp+6]
		mov	bx, es:[bx+11h]
		cmp	eax, [bx+1Ah]
		jge	short loc_458F
		mov	ax, 1
		jmp	short loc_4591
; ���������������������������������������������������������������������������

loc_458F:				; CODE XREF: seg002:06F8j
		xor	ax, ax

loc_4591:				; CODE XREF: seg002:06FDj
		or	al, al
		jz	short loc_45A1
		sub	word ptr [bp-2], 6
		les	bx, [bp+6]
		mov	byte ptr es:[bx+26h], 1

loc_45A1:				; CODE XREF: seg002:06DFj seg002:0703j
		cmp	word ptr [bp-2], 9
		jle	short loc_45AE
		mov	word ptr [bp-2], 9
		jmp	short loc_45B9
; ���������������������������������������������������������������������������

loc_45AE:				; CODE XREF: seg002:0715j
		cmp	word ptr [bp-2], 0
		jg	short loc_45B9

loc_45B4:				; CODE XREF: seg002:04E7j seg002:04FBj ...
		mov	word ptr [bp-2], 0

loc_45B9:				; CODE XREF: seg002:071Cj seg002:0722j
		mov	al, [bp-2]
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 280 lignes (11405-11684) - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (tag 0x23C
; confirme = ID=6 via ancrage sequentiel - CORRIGE : precedemment melangee avec ID=5/7).
; Base=3, pose node+0x26=3 au debut. GARDE SENSOR : dword_7203D+0xFA000 compare a
; entite+0x11->+0x1A (portee de detection etendue) - si echec ET byte_720DF/720E0 non tous
; deux actifs, sortie score=0. Sinon : tache en cours, byte_720DF, sub_564A. Calcul : fenetre
; temporelle sur dword_720D9 (bornes 0xFFF83000, meme famille que ID=5), seuils
; word_72095/720DD/72093 identiques a ID=5, dword_7201C/7209B. SOUS-MODE DISTINCT : compare
; dword_720CD/720C5, si declenche POSE node+0x26=2 (different du 1 pose par ID=5) et ajoute
; sub_564A comme penalite supplementaire (-6). Compare ensuite dword_720BB/720B7 sous 3 formes
; differentes (bearing) avec ajustements -6/-3/+2. Score borne [0,9].
; ==============================================================================================
MVRS_ID6_ScoreSensorGatedSubmode_45BE:				; DATA XREF: seg339:0240o
		push	bp
		mov	bp, sp
		sub	sp, 1Eh
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	word ptr [bp-2], 3
		les	bx, [bp+6]
		mov	byte ptr es:[bx+26h], 3
		mov	dl, 0
		mov	eax, dword_7203D
		add	eax, 0FA000h
		mov	[bp-6],	eax
		mov	[bp-0Ah], eax
		mov	bx, es:[bx+11h]
		mov	eax, [bx+1Ah]
		cmp	eax, [bp-0Ah]
		jge	short loc_4607
		mov	ax, 1
		jmp	short loc_4609
; ���������������������������������������������������������������������������

loc_4607:				; CODE XREF: seg002:0770j
		xor	ax, ax

loc_4609:				; CODE XREF: seg002:0775j
		or	al, al
		jnz	short loc_461B
		cmp	byte_720DF, 0
		jz	short loc_461D
		cmp	byte_720E0, 0
		jz	short loc_461D

loc_461B:				; CODE XREF: seg002:077Bj
		mov	dl, 1

loc_461D:				; CODE XREF: seg002:0782j seg002:0789j
		les	bx, [bp+6]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_462A
		jmp	loc_47CA
; ���������������������������������������������������������������������������

loc_462A:				; CODE XREF: seg002:0795j
		or	dl, dl
		jz	short loc_4631
		jmp	loc_47CA
; ���������������������������������������������������������������������������

loc_4631:				; CODE XREF: seg002:079Cj
		mov	al, byte_720DF
		mov	ah, 0
		or	ax, ax
		jnz	short loc_463D
		jmp	loc_47CA
; ���������������������������������������������������������������������������

loc_463D:				; CODE XREF: seg002:07A8j
		les	bx, [bp+6]

loc_4640:
		mov	ax, es:[bx+2]
		shl	ax, 1

loc_4646:
		sub	[bp-2],	ax
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_4653
		jmp	loc_471B
; ���������������������������������������������������������������������������

loc_4653:				; CODE XREF: seg002:07BEj
		mov	eax, dword_720D9
		mov	[bp-16h], eax
		cmp	dword ptr [bp-16h], 0FFF83000h
		jle	short loc_466A
		mov	ax, 1
		jmp	short loc_466C
; ���������������������������������������������������������������������������

loc_466A:				; CODE XREF: seg002:07D3j
		xor	ax, ax

loc_466C:				; CODE XREF: seg002:07D8j
		or	al, al
		jz	short loc_4676
		sub	word ptr [bp-2], 7
		jmp	short loc_468F
; ���������������������������������������������������������������������������

loc_4676:				; CODE XREF: seg002:07DEj
		cmp	dword ptr [bp-16h], 0FFF83000h
		jg	short loc_4685
		mov	ax, 1
		jmp	short loc_4687
; ���������������������������������������������������������������������������

loc_4685:				; CODE XREF: seg002:07EEj
		xor	ax, ax

loc_4687:				; CODE XREF: seg002:07F3j
		or	al, al
		jz	short loc_468F
		add	word ptr [bp-2], 2

loc_468F:				; CODE XREF: seg002:07E4j seg002:07F9j
		cmp	word_72095, 23h	; '#'
		jge	short loc_46B1
		cmp	word_720DD, 91h	; '�'
		jle	short loc_46AB
		cmp	word_72093, 2Dh	; '-'
		jge	short loc_46AB

loc_46A5:				; CODE XREF: seg002:0885j
		add	word ptr [bp-2], 4
		jmp	short loc_471B
; ���������������������������������������������������������������������������

loc_46AB:				; CODE XREF: seg002:080Cj seg002:0813j
		sub	word ptr [bp-2], 0Ah
		jmp	short loc_471B
; ���������������������������������������������������������������������������

loc_46B1:				; CODE XREF: seg002:0804j
		cmp	word_72095, 5Ah	; 'Z'
		jle	short loc_471B
		cmp	word_72093, 2Dh	; '-'
		jge	short loc_471B
		mov	eax, dword_7201C
		shl	eax, 1
		mov	[bp-1Ah], eax
		mov	[bp-1Eh], eax
		mov	eax, dword_7209B
		cmp	eax, [bp-1Eh]
		jge	short loc_46DD
		mov	ax, 1
		jmp	short loc_46DF
; ���������������������������������������������������������������������������

loc_46DD:				; CODE XREF: seg002:0846j
		xor	ax, ax

loc_46DF:				; CODE XREF: seg002:084Bj
		or	al, al
		jz	short loc_46F4
		add	word ptr [bp-2], 5
		cmp	byte_720DF, 0
		jz	short loc_471B
		add	word ptr [bp-2], 2
		jmp	short loc_471B
; ���������������������������������������������������������������������������

loc_46F4:				; CODE XREF: seg002:0851j
		mov	eax, dword_7209B
		cmp	eax, dword_7201C
		jge	short loc_4704
		mov	ax, 1
		jmp	short loc_4706
; ���������������������������������������������������������������������������

loc_4704:				; CODE XREF: seg002:086Dj
		xor	ax, ax

loc_4706:				; CODE XREF: seg002:0872j
		or	al, al
		jz	short loc_4717
		add	word ptr [bp-2], 3
		cmp	byte_720DF, 0
		jz	short loc_471B
		jmp	short loc_46A5
; ���������������������������������������������������������������������������

loc_4717:				; CODE XREF: seg002:0878j
		sub	word ptr [bp-2], 2

loc_471B:				; CODE XREF: seg002:07C0j seg002:0819j ...
		mov	eax, dword_720CD
		cmp	eax, dword_720C5
		jle	short loc_472B
		mov	ax, 1
		jmp	short loc_472D
; ���������������������������������������������������������������������������

loc_472B:				; CODE XREF: seg002:0894j
		xor	ax, ax

loc_472D:				; CODE XREF: seg002:0899j
		or	al, al
		jz	short loc_473F
		sub	word ptr [bp-2], 4
		les	bx, [bp+6]
		mov	byte ptr es:[bx+26h], 2
		jmp	short loc_4757
; ���������������������������������������������������������������������������

loc_473F:				; CODE XREF: seg002:089Fj
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TargetInRange
		add	sp, 4
		or	al, al
		jz	short loc_4757
		add	word ptr [bp-2], 6

loc_4757:				; CODE XREF: seg002:08ADj seg002:08C1j
		mov	eax, dword_720BB
		shl	eax, 1
		mov	[bp-0Eh], eax
		mov	[bp-12h], eax
		mov	eax, dword_720B7
		cmp	eax, [bp-12h]
		jle	short loc_4775
		mov	ax, 1
		jmp	short loc_4777
; ���������������������������������������������������������������������������

loc_4775:				; CODE XREF: seg002:08DEj
		xor	ax, ax

loc_4777:				; CODE XREF: seg002:08E3j
		or	al, al
		jz	short loc_4781
		sub	word ptr [bp-2], 6
		jmp	short loc_47B7
; ���������������������������������������������������������������������������

loc_4781:				; CODE XREF: seg002:08E9j
		mov	eax, dword_720B7
		cmp	eax, dword_720BB
		jle	short loc_4791
		mov	ax, 1
		jmp	short loc_4793
; ���������������������������������������������������������������������������

loc_4791:				; CODE XREF: seg002:08FAj
		xor	ax, ax

loc_4793:				; CODE XREF: seg002:08FFj
		or	al, al
		jz	short loc_479D
		sub	word ptr [bp-2], 3
		jmp	short loc_47B7
; ���������������������������������������������������������������������������

loc_479D:				; CODE XREF: seg002:0905j
		mov	eax, dword_720B7
		cmp	eax, dword_720BB
		jge	short loc_47AD
		mov	ax, 1
		jmp	short loc_47AF
; ���������������������������������������������������������������������������

loc_47AD:				; CODE XREF: seg002:0916j
		xor	ax, ax

loc_47AF:				; CODE XREF: seg002:091Bj
		or	al, al
		jz	short loc_47B7
		add	word ptr [bp-2], 2

loc_47B7:				; CODE XREF: seg002:08EFj seg002:090Bj ...
		cmp	word ptr [bp-2], 9
		jle	short loc_47C4
		mov	word ptr [bp-2], 9
		jmp	short loc_47CF
; ���������������������������������������������������������������������������

loc_47C4:				; CODE XREF: seg002:092Bj
		cmp	word ptr [bp-2], 0
		jg	short loc_47CF

loc_47CA:				; CODE XREF: seg002:0797j seg002:079Ej ...
		mov	word ptr [bp-2], 0

loc_47CF:				; CODE XREF: seg002:0932j seg002:0938j
		mov	al, [bp-2]
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 212 lignes (11687-11898) - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (tag 0x228
; confirme = ID=7 via constructeur + XREF directe seg339:022C - CORRIGE : precedemment
; attribuee a tort a ID=8). Base=5. Efface bits 0/1/3 de entite+0x32 au debut. GARDE flags_75
; bit6 (modulateur de menace) OU tache en cours -> score=0. Sinon : si carburant/ressource
; (entite+0x22->+0xB0) <= 13, appelle sub_8C1E (AI_ManeuverSolution_91DF, deja documente) avec
; constante -7 (0xFFF9) - si echoue, branche differente (loc_498F, calcul distance/seuil
; simplifie avec clamp final [1,9]). CALCUL PRINCIPAL (si sub_8C1E reussit) : ajustements
; bases sur word_72093/72095/72097 puis appel Math_AngleBetweenVectors_552E1 avec la constante
; 0x4FA3 (deja croisee dans les sequences de manoeuvre) pour calculer un angle de correction
; complexe (division/multiplication). GARDE byte_720DF+byte_720E0 (ou byte_720E1) : ECRIT UNE
; POSITION D'INTERCEPTION (dword_720D1/D5/D9) dans node+0x26/0x2A/0x2E ET POSE UN BIT sur
; entite+0x32 (bit1 si byte_720E0, bit3 si byte_720E1) - CONFIRME que c'est CETTE fonction
; (pas ID=8) qui ecrit initialement ces bits consultes ailleurs. Score final borne [1,9]
; (PLANCHER A 1, PAS 0 - distinct des autres IDs).
; ==============================================================================================
MVRS_ID7_ScoreManeuverFuelGated_47D4:				; DATA XREF: seg339:022Co
		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	word ptr [bp-2], 5
		les	bx, [bp+6]
		and	byte ptr es:[bx+32h], 0FEh
		and	byte ptr es:[bx+32h], 0FDh
		and	byte ptr es:[bx+32h], 0F7h
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jnz	short loc_481F
		les	bx, [bp+6]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_4827

loc_481F:				; CODE XREF: seg002:0983j
		mov	word ptr [bp-2], 0
		jmp	loc_49BD
; ���������������������������������������������������������������������������

loc_4827:				; CODE XREF: seg002:098Dj
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		cmp	byte ptr es:[bx+0B0h], 0Dh
		jg	short loc_484F
		push	0FFF9h
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]

loc_4840:
		call	Pilot_SkillCheck_B0
		add	sp, 6
		or	al, al
		jnz	short loc_484F
		jmp	loc_498F
; ���������������������������������������������������������������������������

loc_484F:				; CODE XREF: seg002:09A4j seg002:09BAj
		cmp	word_72093, 5Ah	; 'Z'

loc_4854:
		jge	short loc_485E
		les	bx, [bp+6]
		or	byte ptr es:[bx+32h], 1

loc_485E:				; CODE XREF: seg002:loc_4854j
		cmp	word_72095, 6Eh	; 'n'
		jle	short loc_4873
		les	bx, [bp+6]
		or	byte ptr es:[bx+32h], 1
		sub	word ptr [bp-2], 3
		jmp	short loc_487E
; ���������������������������������������������������������������������������

loc_4873:				; CODE XREF: seg002:09D3j
		cmp	word_72095, 32h	; '2'
		jge	short loc_487E
		add	word ptr [bp-2], 3

loc_487E:				; CODE XREF: seg002:09E1j seg002:09E8j
		cmp	word_72097, 5Ah	; 'Z'
		jge	short loc_4889
		add	word ptr [bp-2], 4

loc_4889:				; CODE XREF: seg002:09F3j
		push	4FA3h
		push	ss
		lea	ax, [bp-0Ah]
		push	ax
		call	Math_AngleBetweenVectors_552E1
		add	sp, 6
		mov	eax, [bp-0Ah]
		sar	eax, 8
		mov	[bp-6],	eax
		cmp	dword ptr [bp-6], 2Dh ;	'-'
		jle	short loc_48EA
		add	eax, 0FFFFFFECh
		imul	eax, 6
		mov	ebx, 19h
		cdq
		idiv	ebx
		add	ax, 4
		mov	dx, [bp-2]
		sub	dx, ax
		mov	[bp-2],	dx
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TargetInRange
		add	sp, 4
		or	al, al
		jz	short loc_48E4

loc_48DE:				; CODE XREF: seg002:0A5Fj
		sub	word ptr [bp-2], 4
		jmp	short loc_48F5
; ���������������������������������������������������������������������������

loc_48E4:				; CODE XREF: seg002:0A4Cj
		sub	word ptr [bp-2], 2
		jmp	short loc_48F5
; ���������������������������������������������������������������������������

loc_48EA:				; CODE XREF: seg002:0A1Aj
		cmp	dword ptr [bp-6], 0FFFFFFE2h
		jl	short loc_48DE
		add	word ptr [bp-2], 4

loc_48F5:				; CODE XREF: seg002:0A52j seg002:0A58j
		cmp	byte_720DF, 0
		jz	short loc_4940
		cmp	byte_720E0, 0
		jz	short loc_4940
		mov	eax, dword_720D1
		mov	[bp-0Eh], eax
		mov	eax, [bp-0Eh]
		les	bx, [bp+6]
		mov	es:[bx+26h], eax
		mov	eax, dword_720D5
		mov	[bp-12h], eax
		mov	eax, [bp-12h]
		mov	es:[bx+2Ah], eax
		mov	eax, dword_720D9
		mov	[bp-16h], eax
		mov	eax, [bp-16h]
		mov	es:[bx+2Eh], eax
		or	byte ptr es:[bx+32h], 2
		jmp	short loc_4989
; ���������������������������������������������������������������������������

loc_4940:				; CODE XREF: seg002:0A6Aj seg002:0A71j
		cmp	byte_720DF, 0
		jz	short loc_49BD

loc_4947:
		cmp	byte_720E1, 0

loc_494C:
		jz	short loc_49BD
		mov	eax, dword_720D1
		mov	[bp-1Ah], eax
		mov	eax, [bp-1Ah]
		les	bx, [bp+6]
		mov	es:[bx+26h], eax
		mov	eax, dword_720D5
		mov	[bp-1Eh], eax
		mov	eax, [bp-1Eh]
		mov	es:[bx+2Ah], eax
		mov	eax, dword_720D9
		mov	[bp-22h], eax
		mov	eax, [bp-22h]
		mov	es:[bx+2Eh], eax
		or	byte ptr es:[bx+32h], 8

loc_4989:				; CODE XREF: seg002:0AAEj
		add	word ptr [bp-2], 0Ah
		jmp	short loc_49BD
; ���������������������������������������������������������������������������

loc_498F:				; CODE XREF: seg002:09BCj
		cmp	word_72095, 3Ch	; '<'
		jge	short loc_499D
		cmp	word_72097, 3Ch	; '<'
		jl	short loc_49B3

loc_499D:				; CODE XREF: seg002:0B04j
		mov	eax, dword_7209B
		cmp	eax, dword_7201C
		jle	short loc_49AD
		mov	ax, 1
		jmp	short loc_49AF
; ���������������������������������������������������������������������������

loc_49AD:				; CODE XREF: seg002:0B16j
		xor	ax, ax

loc_49AF:				; CODE XREF: seg002:0B1Bj
		or	al, al
		jz	short loc_49B9

loc_49B3:				; CODE XREF: seg002:0B0Bj
		add	word ptr [bp-2], 2
		jmp	short loc_49BD
; ���������������������������������������������������������������������������

loc_49B9:				; CODE XREF: seg002:0B21j
		sub	word ptr [bp-2], 2

loc_49BD:				; CODE XREF: seg002:0994j seg002:0AB5j ...
		cmp	word ptr [bp-2], 9
		jle	short loc_49CA
		mov	word ptr [bp-2], 9
		jmp	short loc_49D5
; ���������������������������������������������������������������������������

loc_49CA:				; CODE XREF: seg002:0B31j
		cmp	word ptr [bp-2], 1
		jge	short loc_49D5
		mov	word ptr [bp-2], 1

loc_49D5:				; CODE XREF: seg002:0B38j seg002:0B3Ej
		mov	al, [bp-2]
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far - LUE INTEGRALEMENT. Fonction de SCORE pour MVRS ID=0x9 (tag 0x200). TOUJOURS RETOURNE 0
; - type placeholder/desactive, comme 0x15.
; ==============================================================================================
MVRS_ID9_ScorePlaceholder_49DA:				; DATA XREF: seg339:0218o
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		xor	dx, dx
		cmp	dx, 9
		jle	short loc_49F8
		mov	dx, 9
		jmp	short loc_49FE
; ���������������������������������������������������������������������������

loc_49F8:				; CODE XREF: seg002:0B61j
		or	dx, dx
		jg	short loc_49FE
		xor	dx, dx

loc_49FE:				; CODE XREF: seg002:0B66j seg002:0B6Aj
		mov	al, dl
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, ~25 lignes - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (ID=9 confirme via ancrage
; sequentiel). Retourne TOUJOURS 0 (dx force a 0 des le debut, aucune condition n'influence le
; resultat) - authentique emplacement vestige jamais implemente.
; ==============================================================================================
MVRS_ID9_ScorePlaceholder_4A02:				; DATA XREF: seg339:0204o
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		xor	dx, dx
		cmp	dx, 9
		jle	short loc_4A20
		mov	dx, 9
		jmp	short loc_4A26
; ���������������������������������������������������������������������������

loc_4A20:				; CODE XREF: seg002:0B89j
		or	dx, dx
		jg	short loc_4A26
		xor	dx, dx

loc_4A26:				; CODE XREF: seg002:0B8Ej seg002:0B92j
		mov	al, dl
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, ~25 lignes - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (ID=10 confirme via ancrage
; sequentiel). Retourne TOUJOURS 0 (dx force a 0 des le debut, aucune condition n'influence le
; resultat) - authentique emplacement vestige jamais implemente.
; ==============================================================================================
MVRS_ID10_ScorePlaceholder_4A2A:				; DATA XREF: seg339:01F0o
		push	bp
		mov	bp, sp
		sub	sp, 2
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	word ptr [bp-2], 0
		mov	al, [bp-2]
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, ~25 lignes - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (ID=11 confirme via ancrage
; sequentiel). Retourne TOUJOURS 0 (dx force a 0 des le debut, aucune condition n'influence le
; resultat) - authentique emplacement vestige jamais implemente.
; ==============================================================================================
MVRS_ID11_ScorePlaceholder_4A49:				; DATA XREF: seg339:01DCo
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		xor	dx, dx
		cmp	dx, 9
		jle	short loc_4A67
		mov	dx, 9
		jmp	short loc_4A6D
; ���������������������������������������������������������������������������

loc_4A67:				; CODE XREF: seg002:0BD0j
		or	dx, dx
		jg	short loc_4A6D
		xor	dx, dx

loc_4A6D:				; CODE XREF: seg002:0BD5j seg002:0BD9j
		mov	al, dl
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, ~25 lignes - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (ID=12 confirme via ancrage
; sequentiel). Retourne TOUJOURS 0 (dx force a 0 des le debut, aucune condition n'influence le
; resultat) - authentique emplacement vestige jamais implemente.
; ==============================================================================================
MVRS_ID12_ScorePlaceholder_4A71:				; DATA XREF: seg339:01C8o
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		xor	dx, dx
		cmp	dx, 9
		jle	short loc_4A8F
		mov	dx, 9
		jmp	short loc_4A95
; ���������������������������������������������������������������������������

loc_4A8F:				; CODE XREF: seg002:0BF8j
		or	dx, dx
		jg	short loc_4A95
		xor	dx, dx

loc_4A95:				; CODE XREF: seg002:0BFDj seg002:0C01j
		mov	al, dl
		pop	bp
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 258 lignes (12015-12269) - LUE INTEGRALEMENT ET CORRECTEMENT ATTRIBUEE (tag 0x1B0
; confirme = ID=13 via ancrage sequentiel - CORRIGE : precedemment attribuee a ID=0xE/14b).
; Base=1. Lit avion+0x86 (NOUVELLE capacite, probable taux de roulis max, mise a l'echelle
; x256) compare a entite+0x11->+0x1A. Gardes : tache en cours, sub_564A. Calcul RICHE :
; bearing dword_720BB/720B7, seuil dword_7205B, UTILISE dword_72039 ET dword_7202C (les DEUX
; constantes NUMS deja identifiees dans la sequence de manoeuvre a 5 phases Scissors/Rollaway)
; - CONFIRME QUE C'EST ID=13, PAS 0xE, QUI DECLENCHE CETTE SEQUENCE. Contient un calcul de
; type 'temps de virage' (imul x5, idiv par dword_720BB, decalages 0x18) similaire a celui
; documente dans la sequence elle-meme. Lit aussi avion+0x8B (MEME champ que ID=5) pour un
; ajustement final, et sub_56E5 (capteur cache). Score borne [0,9].
; ==============================================================================================
MVRS_ID13_ScoreScissorsRollaway_4A99:				; DATA XREF: seg339:01B4o
		push	bp
		mov	bp, sp
		sub	sp, 40h
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	word ptr [bp-2], 1
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	eax, [bx+86h]
		mov	[bp-0Ah], eax
		shl	eax, 8
		mov	[bp-0Eh], eax
		mov	eax, [bp-0Eh]
		mov	[bp-6],	eax
		les	bx, [bp+6]
		cmp	word ptr es:[bx+13h], 0
		jz	short loc_4B0E
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_TargetInRange
		add	sp, 4
		or	al, al
		jnz	short loc_4B0E
		les	bx, [bp+6]
		mov	bx, es:[bx+11h]
		mov	eax, [bx+1Ah]
		cmp	eax, [bp-6]
		jl	short loc_4B08
		mov	ax, 1
		jmp	short loc_4B0A
; ���������������������������������������������������������������������������

loc_4B08:				; CODE XREF: seg002:0C71j
		xor	ax, ax

loc_4B0A:				; CODE XREF: seg002:0C76j
		or	al, al
		jz	short loc_4B16

loc_4B0E:				; CODE XREF: seg002:0C4Fj seg002:0C60j
		mov	word ptr [bp-2], 0
		jmp	loc_4CB4
; ���������������������������������������������������������������������������

loc_4B16:				; CODE XREF: seg002:0C7Cj
		les	bx, [bp+6]
		mov	ax, es:[bx+2]
		shl	ax, 1
		sub	[bp-2],	ax
		mov	eax, dword_720BB
		cmp	eax, dword_720B7
		jge	short loc_4B32
		mov	ax, 1
		jmp	short loc_4B34
; ���������������������������������������������������������������������������

loc_4B32:				; CODE XREF: seg002:0C9Bj
		xor	ax, ax

loc_4B34:				; CODE XREF: seg002:0CA0j
		or	al, al
		jnz	short loc_4B3B
		jmp	loc_4C0B
; ���������������������������������������������������������������������������

loc_4B3B:				; CODE XREF: seg002:0CA6j
		cmp	dword_7205B, 0FFFE7000h
		jl	short loc_4B4B
		mov	ax, 1
		jmp	short loc_4B4D
; ���������������������������������������������������������������������������

loc_4B4B:				; CODE XREF: seg002:0CB4j
		xor	ax, ax

loc_4B4D:				; CODE XREF: seg002:0CB9j
		or	al, al
		jnz	short loc_4B54
		jmp	loc_4C0B
; ���������������������������������������������������������������������������

loc_4B54:				; CODE XREF: seg002:0CBFj
		mov	eax, dword_72039
		mov	[bp-12h], eax
		shl	eax, 8
		mov	edx, dword_720C5
		add	edx, eax
		mov	[bp-16h], edx
		mov	eax, [bp-16h]
		mov	[bp-1Ah], eax
		sar	eax, 1
		mov	[bp-1Eh], eax
		mov	[bp-22h], eax
		mov	eax, dword_720B7
		cmp	eax, [bp-22h]
		jl	short loc_4B8E
		mov	ax, 1
		jmp	short loc_4B90
; ���������������������������������������������������������������������������

loc_4B8E:				; CODE XREF: seg002:0CF7j
		xor	ax, ax

loc_4B90:				; CODE XREF: seg002:0CFCj
		or	al, al
		jz	short loc_4C0B
		cmp	byte_720DF, 0
		jz	short loc_4C0B
		cmp	byte_720E0, 0
		jnz	short loc_4BA9
		cmp	byte_720E1, 0
		jz	short loc_4C0B

loc_4BA9:				; CODE XREF: seg002:0D10j
		mov	eax, dword_720BB
		cmp	eax, dword_720C9
		jle	short loc_4BB9
		mov	ax, 1
		jmp	short loc_4BBB
; ���������������������������������������������������������������������������

loc_4BB9:				; CODE XREF: seg002:0D22j
		xor	ax, ax

loc_4BBB:				; CODE XREF: seg002:0D27j
		or	al, al
		jz	short loc_4C07
		mov	eax, dword_720B7
		sub	eax, dword_720BB
		mov	[bp-26h], eax
		mov	[bp-2Ah], eax
		imul	eax, 5
		mov	[bp-2Eh], eax
		mov	[bp-32h], eax
		mov	eax, [bp-32h]
		mov	edx, eax
		mov	ecx, dword_720BB
		sar	edx, 18h
		shl	eax, 8
		idiv	ecx
		mov	[bp-36h], eax
		mov	eax, [bp-36h]
		mov	[bp-3Ah], eax
		mov	ax, [bp-39h]
		add	[bp-2],	ax
		jmp	short loc_4C0B
; ���������������������������������������������������������������������������

loc_4C07:				; CODE XREF: seg002:0D2Dj
		add	word ptr [bp-2], 5

loc_4C0B:				; CODE XREF: seg002:0CA8j seg002:0CC1j ...
		mov	eax, dword_7202C
		mov	[bp-3Eh], eax
		shl	eax, 8
		cmp	eax, dword_7209B
		jge	short loc_4C23
		mov	ax, 1
		jmp	short loc_4C25
; ���������������������������������������������������������������������������

loc_4C23:				; CODE XREF: seg002:0D8Cj
		xor	ax, ax

loc_4C25:				; CODE XREF: seg002:0D91j
		or	al, al
		jz	short loc_4C36
		cmp	word_72093, 1Eh
		jge	short loc_4C36
		add	word ptr [bp-2], 5
		jmp	short loc_4C5B
; ���������������������������������������������������������������������������

loc_4C36:				; CODE XREF: seg002:0D97j seg002:0D9Ej
		mov	eax, dword_7209B
		cmp	eax, dword_7201C
		jge	short loc_4C46

loc_4C41:
		mov	ax, 1
		jmp	short loc_4C48
; ���������������������������������������������������������������������������

loc_4C46:				; CODE XREF: seg002:0DAFj
		xor	ax, ax

loc_4C48:				; CODE XREF: seg002:0DB4j
		or	al, al
		jz	short loc_4C5B
		sub	word ptr [bp-2], 5
		cmp	word_72093, 14h
		jge	short loc_4C5B
		sub	word ptr [bp-2], 5

loc_4C5B:				; CODE XREF: seg002:0DA4j seg002:0DBAj ...
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+8Bh]
		mov	[bp-40h], al
		cmp	byte ptr [bp-40h], 2
		jb	short loc_4C85
		mov	ah, 0
		add	ax, 0FFFEh
		shl	ax, 1
		cwd
		sub	ax, dx
		sar	ax, 1
		inc	ax
		add	[bp-2],	ax
		jmp	short loc_4C9C
; ���������������������������������������������������������������������������

loc_4C85:				; CODE XREF: seg002:0DE1j
		mov	al, [bp-40h]
		mov	ah, 0
		push	ax
		mov	ax, 2
		pop	dx
		sub	ax, dx
		shl	ax, 1
		cwd
		sub	ax, dx
		sar	ax, 1
		inc	ax
		sub	[bp-2],	ax

loc_4C9C:				; CODE XREF: seg002:0DF3j
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		call	AI_Sensor_InterceptFeasibleCached
		add	sp, 4
		or	al, al
		jz	short loc_4CB4
		add	word ptr [bp-2], 4

loc_4CB4:				; CODE XREF: seg002:0C83j seg002:0E1Ej
		cmp	word ptr [bp-2], 9
		jle	short loc_4CC1
		mov	word ptr [bp-2], 9
		jmp	short loc_4CCC
; ���������������������������������������������������������������������������

loc_4CC1:				; CODE XREF: seg002:0E28j
		cmp	word ptr [bp-2], 0
		jg	short loc_4CCC
		mov	word ptr [bp-2], 0

loc_4CCC:				; CODE XREF: seg002:0E2Fj seg002:0E35j
		mov	al, [bp-2]
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 150 lignes - LU INTEGRALEMENT. Fonction de SCORE pour MVRS ID=0xF (tag 0x188).
; STRUCTURELLEMENT DIFFERENTE des precedentes : calcul d'INTERCEPTION/ANTICIPATION DE
; TRAJECTOIRE (position via [entite+0x11->vtable+0x3C], sub_57C67 et sub_54876='cosinus
; pondere' pour un calcul de temps/angle d'interception), gardee par le seuil capteur
; dword_7203D et dword_720A7. Score BINAIRE 0/0xA (10, pas 0-9).
; ==============================================================================================
MVRS_ID15b_ScoreIntercept_4CD1:				; DATA XREF: seg339:01A0o
		push	bp
		mov	bp, sp
		sub	sp, 3Ah
		push	si
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		les	bx, [bp+6]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_4D0A
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		cmp	byte ptr [bx+68h], 0FFh
		jz	short loc_4D04
		mov	ax, 1
		jmp	short loc_4D06
; ���������������������������������������������������������������������������

loc_4D04:				; CODE XREF: seg002:0E6Dj
		xor	ax, ax

loc_4D06:				; CODE XREF: seg002:0E72j
		or	al, al
		jz	short loc_4D0F

loc_4D0A:				; CODE XREF: seg002:0E5Fj
		mov	al, 0
		jmp	loc_4E27
; ���������������������������������������������������������������������������

loc_4D0F:				; CODE XREF: seg002:0E78j
		mov	word ptr [bp-2], 0
		les	bx, [bp+6]
		mov	si, es:[bx+11h]
		add	si, 12h
		mov	eax, [si]
		mov	[bp-3Ah], eax
		mov	eax, [si+4]
		mov	[bp-36h], eax
		mov	eax, [si+8]
		mov	[bp-32h], eax
		mov	bx, es:[bx+11h]
		push	word ptr [bx+51h]
		push	ss
		lea	ax, [bp-6]
		push	ax
		call	Physics_ApplyGroundHeightConstraint
		add	sp, 6
		les	bx, [bp+6]

loc_4D4C:
		mov	ax, es:[bx+24h]

loc_4D50:
		mov	dx, es:[bx+22h]
		add	dx, 0E1h ; '�'

loc_4D58:
		mov	[bp-0Ch], ax
		mov	[bp-0Eh], dx
		les	bx, [bp-0Eh]
		mov	eax, es:[bx]
		mov	[bp-0Ah], eax
		les	bx, [bp+6]
		push	word ptr es:[bx+11h]
		mov	bx, es:[bx+11h]
		mov	bx, [bx]
		call	dword ptr [bx+3Ch]
		pop	cx
		push	ax
		push	ss
		lea	ax, [bp-12h]
		push	ax
		call	AI_ComputeGeometrySolution_57C67
		add	sp, 6
		mov	eax, [bp-12h]
		mov	ebx, 2
		cdq
		idiv	ebx
		mov	[bp-16h], eax
		mov	[bp-1Ah], eax
		lea	ax, [bp-1Ah]
		push	ax
		push	ss
		lea	ax, [bp-1Eh]
		push	ax
		call	Math_SinDeg_54876
		add	sp, 6
		mov	eax, [bp-1Eh]
		sar	eax, 1
		mov	[bp-22h], eax
		mov	[bp-26h], eax
		add	eax, 100h
		mov	[bp-2Ah], eax
		mov	[bp-2Eh], eax
		mov	eax, [bp-0Ah]
		mov	edx, [bp-2Eh]
		imul	edx
		shrd	eax, edx, 8
		mov	[bp-0Ah], eax
		mov	eax, [bp-6]
		cmp	eax, [bp-0Ah]
		jl	short loc_4DF0
		mov	ax, 1
		jmp	short loc_4DF2
; ���������������������������������������������������������������������������

loc_4DF0:				; CODE XREF: seg002:0F59j
		xor	ax, ax

loc_4DF2:				; CODE XREF: seg002:0F5Ej
		or	al, al
		jnz	short loc_4E1F
		mov	eax, [bp-32h]
		cmp	eax, dword_7203D
		jge	short loc_4E06
		mov	ax, 1
		jmp	short loc_4E08
; ���������������������������������������������������������������������������

loc_4E06:				; CODE XREF: seg002:0F6Fj
		xor	ax, ax

loc_4E08:				; CODE XREF: seg002:0F74j
		or	al, al
		jz	short loc_4E24
		cmp	dword_720A7, 0
		jge	short loc_4E19
		mov	ax, 1
		jmp	short loc_4E1B
; ���������������������������������������������������������������������������

loc_4E19:				; CODE XREF: seg002:0F82j
		xor	ax, ax

loc_4E1B:				; CODE XREF: seg002:0F87j
		or	al, al
		jz	short loc_4E24

loc_4E1F:				; CODE XREF: seg002:0F64j
		mov	word ptr [bp-2], 0Ah

loc_4E24:				; CODE XREF: seg002:0F7Aj seg002:0F8Dj
		mov	al, [bp-2]

loc_4E27:				; CODE XREF: seg002:0E7Cj
		pop	si
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 87 lignes - LU INTEGRALEMENT. Fonction de SCORE pour MVRS ID=0x10 (tag 0x174). Gardee
; par entite+0x22->0xB->0x68==0xFF ('timer rafraichi', meme champ que la sentinelle
; initialisee dans les applications). Verifie flags_75 bit6 (modulateur de score de menace,
; deja documente en §7) OU un seuil de distance (dword_720CD/720C9) OU un appel direct a
; AI_Sensor_SecondaryAngle_59A5 (deja connue via AIEntity_MasterTick) compare a 0x1E00 (30 en
; 24.8) - CONFIRME un lien direct et fort avec le systeme de detection de menace. Score
; BINAIRE 0/0xA.
; ==============================================================================================
MVRS_ID16_ScoreThreatSensor_4E2A:				; DATA XREF: seg339:018Co
		push	bp
		mov	bp, sp
		sub	sp, 6
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		les	bx, [bp+6]
		cmp	word ptr es:[bx+13h], 0
		jnz	short loc_4E62

loc_4E49:
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]

loc_4E51:
		cmp	byte ptr [bx+68h], 0FFh
		jz	short loc_4E5C
		mov	ax, 1
		jmp	short loc_4E5E
; ���������������������������������������������������������������������������

loc_4E5C:				; CODE XREF: seg002:0FC5j
		xor	ax, ax

loc_4E5E:				; CODE XREF: seg002:0FCAj
		or	al, al
		jz	short loc_4E66

loc_4E62:				; CODE XREF: seg002:0FB7j
		mov	al, 0
		jmp	short locret_4ECB
; ���������������������������������������������������������������������������

loc_4E66:				; CODE XREF: seg002:0FD0j
		mov	word ptr [bp-2], 0
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		mov	bx, es:[bx+0Bh]
		mov	al, [bx+75h]
		shr	ax, 6
		and	ax, 1
		or	al, al
		jnz	short loc_4EC3
		mov	eax, dword_720CD
		cmp	eax, dword_720C9
		jg	short loc_4E93
		mov	ax, 1
		jmp	short loc_4E95
; ���������������������������������������������������������������������������

loc_4E93:				; CODE XREF: seg002:0FFCj
		xor	ax, ax

loc_4E95:				; CODE XREF: seg002:1001j
		or	al, al
		jz	short loc_4EC8
		les	bx, [bp+6]
		push	large dword ptr	es:[bx+22h]
		push	ss
		lea	ax, [bp-6]
		push	ax
		call	AI_Sensor_SecondaryAngle
		add	sp, 8
		cmp	dword ptr [bp-6], 1E00h
		jle	short loc_4EBD
		mov	ax, 1
		jmp	short loc_4EBF
; ���������������������������������������������������������������������������

loc_4EBD:				; CODE XREF: seg002:1026j
		xor	ax, ax

loc_4EBF:				; CODE XREF: seg002:102Bj
		or	al, al
		jz	short loc_4EC8

loc_4EC3:				; CODE XREF: seg002:0FF1j
		mov	word ptr [bp-2], 0Ah

loc_4EC8:				; CODE XREF: seg002:1007j seg002:1031j
		mov	al, [bp-2]

locret_4ECB:				; CODE XREF: seg002:0FD4j
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 59 lignes - LU INTEGRALEMENT. Fonction de SCORE pour MVRS ID=0x13 (tag 0x160,
; l'identifiant SPECIAL avec deux references faibles a la construction). ECHELLE COMPLETEMENT
; DIFFERENTE des autres types (0x100 a 0x900, PAS 0-9/0-10) - retourne une VALEUR CONTINUE,
; pas un petit score discret, basee sur entite+0x22->0xB0 (pourcentage/etat continu, probable
; carburant ou ressource similaire) compare a un seuil fixe (0xC=12). Etant donne l'echelle
; bien plus grande, ce type DOMINERAIT le tournoi de AI_BehaviorStateMachine des qu'actif.
; ==============================================================================================
MVRS_ID19_ScoreFuelOrResource_4ECD:				; DATA XREF: seg339:0178o
		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	dword ptr [bp-4], 0
		cmp	dword ptr [bp-4], 900h
		jle	short loc_4EF9
		mov	ax, 1
		jmp	short loc_4EFB
; ���������������������������������������������������������������������������

loc_4EF9:				; CODE XREF: seg002:1062j
		xor	ax, ax

loc_4EFB:				; CODE XREF: seg002:1067j
		or	al, al
		jz	short loc_4F0D
		mov	dword ptr [bp-8], 900h
		mov	eax, [bp-8]
		jmp	short loc_4F4B
; ���������������������������������������������������������������������������

loc_4F0D:				; CODE XREF: seg002:106Dj
		cmp	dword ptr [bp-4], 100h
		jge	short loc_4F1C
		mov	ax, 1
		jmp	short loc_4F1E
; ���������������������������������������������������������������������������

loc_4F1C:				; CODE XREF: seg002:1085j
		xor	ax, ax

loc_4F1E:				; CODE XREF: seg002:108Aj
		or	al, al
		jz	short loc_4F4F
		les	bx, [bp+6]
		les	bx, es:[bx+22h]
		cmp	byte ptr es:[bx+0B0h], 0Ch
		jl	short loc_4F3F
		mov	dword ptr [bp-0Ch], 0
		mov	eax, [bp-0Ch]
		jmp	short loc_4F4B
; ���������������������������������������������������������������������������

loc_4F3F:				; CODE XREF: seg002:109Fj
		mov	dword ptr [bp-10h], 100h
		mov	eax, [bp-10h]

loc_4F4B:				; CODE XREF: seg002:107Bj seg002:10ADj
		mov	[bp-4],	eax

loc_4F4F:				; CODE XREF: seg002:1090j
		mov	ax, [bp-3]
		leave
		retf
; ���������������������������������������������������������������������������

; ==============================================================================================
; far, 10 lignes - LU INTEGRALEMENT. Fonction de SCORE pour MVRS ID=0x15 (tag 0x138). TOUJOURS
; RETOURNE 0 - un type PLACEHOLDER/DESACTIVE, jamais selectionnable dans le tournoi de
; AI_BehaviorStateMachine quelle que soit la valeur brute du fichier PROF pour cet
; identifiant.
; ==============================================================================================
MVRS_ID21_ScorePlaceholder_4F54:				; DATA XREF: seg339:off_6D200o
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	al, 0
		pop	bp
		retf
; ���������������������������������������������������������������������������

loc_4F6A:				; DATA XREF: seg339:013Co
		push	bp
		mov	bp, sp
		push	word ptr [bp+0Ah]
		push	large dword ptr	[bp+6]
		call	MVRS_SharedContextSyncAndID2Score_EC22
		add	sp, 6
		mov	al, 0
		pop	bp
		retf
seg002		ends
