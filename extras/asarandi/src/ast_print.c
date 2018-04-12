#include "parse.h"

void	print_ast(t_ast *node)
{
    while (node)
    {
        ft_putstr("[");
        ft_putstr(node->name);
        ft_putstr("]");
        if (node->right)
        {
            ft_putstr("\t->\t[");
            ft_putstr(node->right->name);
            ft_putstr("]");
            ft_putstr("[");
            ft_putnbr(node->right->type);
            ft_putstr("]");
        }
        ft_putstr("\n");
        node = node->next;
    }
}

void	print_trees(t_ast **ast)
{
    int i;

    i = 0;
    while (ast && *ast)
    {
        ft_putstr("***** TREE [");
        ft_putnbr(i++);
        ft_putstr("] *****\n");
        print_ast(*ast);
        ft_putstr("***** END *****\n\n");
        ast++;
    }
}

void	print_error_lexer(void)
{
    ft_putstr("Parse error lexer [CMD invalid]\n");
}

void	print_error_ast(void)
{
    ft_putstr("Parse error ast\n");
}
