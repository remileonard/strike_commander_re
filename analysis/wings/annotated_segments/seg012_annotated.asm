seg012		segment	para public 'CODE' use16
		assume cs:seg012
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
		db 0Fh, 0A4h, 0C2h, 10h, 66h, 5Bh, 0C9h, 0CBh, 0, 0, 0, 0, 0, 0, 0, 0
seg012		ends
