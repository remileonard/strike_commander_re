#pragma once
#include <SDL.h>
#define MIX_MAX_VOLUME 128
#define MIX_DEFAULT_FORMAT AUDIO_S16SYS
typedef struct Mix_Chunk Mix_Chunk;
extern void (*g_hook)(void *, Uint8 *, int);
extern void *g_hookArg;
inline int Mix_Init(int) {
    return 0;
}
inline void Mix_Quit() {
}
inline int Mix_OpenAudio(int, Uint16, int, int) {
    return 0;
}
inline void Mix_CloseAudio() {
}
inline int Mix_QuerySpec(int *f, Uint16 *fmt, int *c) {
    *f = 44100;
    *fmt = AUDIO_S16SYS;
    *c = 2;
    return 1;
}
inline void Mix_HookMusic(void (*h)(void *, Uint8 *, int), void *a) {
    g_hook = h;
    g_hookArg = a;
}
inline void Mix_ChannelFinished(void (*)(int)) {
}
inline int Mix_HaltChannel(int) {
    return 0;
}
inline void Mix_FreeChunk(Mix_Chunk *) {
}
inline Mix_Chunk *Mix_LoadWAV_RW(SDL_RWops *, int) {
    return nullptr;
}
inline int Mix_PlayChannel(int, Mix_Chunk *, int) {
    return -1;
}
inline int Mix_Playing(int) {
    return 0;
}
inline int Mix_Volume(int, int v) {
    return v;
}
inline const char *Mix_GetError() {
    return "";
}
