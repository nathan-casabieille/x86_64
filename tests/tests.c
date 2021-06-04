/*
** EPITECH PROJECT, 2021
** Nathan Casabieille
** File description:
** tests
*/

#include "libasm.h"
#include <stdio.h>
#include <criterion/criterion.h>

Test(libc, strlen)
{
    cr_assert(my_strlen("Hello World") == strlen("Hello World"));
    cr_assert(my_strlen("test\n\0") == strlen("test\n\0"));
    cr_assert(my_strlen("") == strlen(""));
}

Test(libc, strncmp)
{
    cr_assert(my_strncmp("abcdef", "ABCDEF", 4) == strncmp("abcdef", "ABCDEF", 4));
    cr_assert(my_strncmp("not", "equal", 3) == strncmp("not", "equal", 3));
    cr_assert(my_strncmp("too", "much", 100) == strncmp("too", "much", 100));
    cr_assert(my_strncmp("zero", "zero", 0) == strncmp("zero", "zero", 0));
}

Test(libc, strcmp)
{
    cr_assert(my_strcmp("hello", "hello") == strcmp("hello", "hello"));
    cr_assert(my_strcmp("not", "equal") == strcmp("not", "equal"));
    cr_assert(my_strcmp("hello", "hellq") == strcmp("hello", "hellq"));
}

Test(libc, strcasecmp)
{
  cr_assert(my_strcasecmp("HeLlO", "hElLo") == strcasecmp("HeLlO", "hElLo"));
  cr_assert(my_strcasecmp("not", "equal") == strcasecmp("not", "equal"));
  cr_assert(my_strcasecmp("hello", "hellq") == strcasecmp("hello", "hellq"));
}

Test(libc, strchr)
{
    cr_assert(my_strchr("hello world", 'l') == strchr("hello world", 'l'));
    cr_assert(my_strchr("hello world", 'z') == strchr("hello world", 'z'));
}

Test(libc, strstr)
{
    cr_assert(my_strstr("hello world", "lo") == strstr("hello world", "lo"));
    cr_assert(my_strstr("hello world", "ul") == strstr("hello world", "ul"));
}

Test(libc, memset)
{
    int n = 10;
    int arr[n];

    my_memset(arr, 0, (n * sizeof(arr[0])));
    for (int i = 0; i < n; i++) {
        cr_assert(arr[i] == 0);
    }
}

Test(libc, memcpy)
{
    char str1[22] = "Hello World!";
    char str2[22] = "Nothing is impossible";

    my_memcpy(str1, str2, strlen(str2));

    cr_assert(strcmp(str1, str2) == 0);
}

Test(libc, memmove)
{
    char str1[22] = "Hello World!";
    char str2[22] = "Nothing is impossible";

    my_memmove(str1, str2, strlen(str2));

    cr_assert(strcmp(str1, str2) == 0);
}

Test(libc, rindex)
{
    cr_assert(strcmp(my_rindex("hello world", 'o'), "orld") == 0);
    cr_assert(my_rindex("hello world", 'z') == NULL);
}

Test(libc, strpbrk)
{
    char str[] = "This is a sample string";
    char key[] = "aeiou";
    char *pch;
    char *tmp;

    pch = my_strpbrk (str, key);
    while (pch != NULL) {
        tmp = strpbrk(pch + 1, key);
        pch = my_strpbrk(pch + 1, key);
        cr_assert(pch == tmp);
    }
    cr_assert(my_strpbrk(str, "zzz") == strpbrk(str, "zzz"));
    cr_assert(my_strpbrk(str, "") == strpbrk(str, ""));
}

Test(libc, strcspn)
{
    char str[] = "fcba74483";
    char keys[] = "1234567890";

    cr_assert(my_strcspn(str, keys) == strcspn(str, keys));
    cr_assert(my_strcspn(str, "") == strcspn(str, ""));
    cr_assert(my_strcspn(str, "000") == strcspn(str, "000"));
}
