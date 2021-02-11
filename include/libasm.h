#ifndef HEADER_H_
#define HEADER_H_

#include <stddef.h>

size_t    my_strlen(const char *s);
size_t    my_putstr(const char *s);
char *    my_strchr(const char *s, int c);
int       my_strcmp(const char *s1, const char *s2);
int       my_strcasecmp(const char *s1, const char *s2);
void      my_write(int fd, const void *buf, size_t count);
char *    my_strstr(const char *haystack, const char *needle);
int       my_strncmp(const char *s1, const char *s2, size_t n);

#endif // HEADER_H_
