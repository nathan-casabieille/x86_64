#ifndef HEADER_H_
#define HEADER_H_

#include <stddef.h>

size_t strlen(const char *s);
size_t putstr(const char *s);
char *strchr(const char *s, int c);
int strcmp(const char *s1, const char *s2);
int strcasecmp(const char *s1, const char *s2);
char *strstr(char *haystack, const char *needle);
int strncmp(const char *s1, const char *s2, size_t n);

#endif // HEADER_H_
