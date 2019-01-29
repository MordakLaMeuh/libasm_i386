
#ifndef __LIBASM_I386_H__
# define __LIBASM_I386_H__

typedef unsigned int u32;

void _sse2_memcpy(void *dst, void *src, u32 size);
void _sse2_memzero(void *dst, u32 size);

#endif
