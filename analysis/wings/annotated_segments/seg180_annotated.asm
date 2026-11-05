seg180		segment	para public 'DATA' use16
		assume cs:seg180
		assume es:nothing, ss:nothing, ds:dseg, fs:nothing, gs:nothing
byte_58000	db 2Eh, 49h, 46h, 46h, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
seg180		ends
