/*
** EPITECH PROJECT, 2021
** Nathan Casabieille
** File description:
** tests
*/

#include "libasm.h"
/*
#include <criterion/criterion.h>
#include <criterion/redirect.h>

void cr_redirect_stdout(void)
{
  cr_redirect_stdout();
}

Test(libc, test_strlen)
{
    cr_assert(my_strlen("Hello World") == 11);
}

Test(libc, test_strcasecmp)
{
    cr_assert(my_strcasecmp("hello WORLD", "HELLO world") == 0);
}

Test(libc, test_strcmp)
{
    cr_assert(my_strcmp("hello world", "hello world") == 0);
}

Test(libc, test_putstr, .init=cr_redirect_stdout)
{
    my_putstr("Hello World!\n");
    cr_assert_stdout_eq_str("Hello World!\n");
}
*/

int main()
{
    return (my_strcasecmp("hello WORLD", "HELLO world"));
}
