/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   error.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: asarandi <asarandi@student.42.us.org>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/04/08 15:43:33 by asarandi          #+#    #+#             */
/*   Updated: 2018/04/15 03:41:29 by ztisnes          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

void	fatal_error(t_shell *sh)
{
	clean_up(sh);
	exit(EXIT_FAILURE);
}

void	fatal_error_message(t_shell *sh, char *msg)
{
	msg[0] += 0;
	perror(SHELL_NAME);
	fatal_error(sh);
}
