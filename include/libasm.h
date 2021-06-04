#ifndef HEADER_H_
#define HEADER_H_

#include <stddef.h>

size_t    my_strlen(const char *s);
size_t    my_putstr(const char *s);
char *    my_strtoupper(const char *str);
char *    my_rindex(const char *s, int c);
char *    my_strchr(const char *s, int c);
void *    my_memset(void *s, int c, size_t n);
int       my_strcmp(const char *s1, const char *s2);
size_t    my_strcspn(const char *s, const char *reject);
char *    my_strpbrk(const char *s, const char *accept);
int       my_strcasecmp(const char *s1, const char *s2);
void      my_write(int fd, const void *buf, size_t count);
void *    my_memcpy(void *dest, const void *src, size_t n);
void *    my_memmove(void *dest, const void *src, size_t n);
char *    my_strstr(const char *haystack, const char *needle);
int       my_strncmp(const char *s1, const char *s2, size_t n);

#endif // HEADER_H_
