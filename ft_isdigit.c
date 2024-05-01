/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isdigit.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arcanava <arcanava@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/09 13:40:40 by arcanava          #+#    #+#             */
/*   Updated: 2024/05/01 18:28:12 by arcanava         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_isdigit(int c)
{
	return (c >= 48 && c <= 57);
}

int	ft_isnum(char *str)
{
	int	is_num;
	int	symbols;

	symbols = 0;
	while (*str && (*str == '+' || *str == '-') && symbols == 0)
	{
		symbols++;
		str++;
	}
	is_num = ft_isdigit(*str);
	while (*str && is_num && symbols <= 1)
		is_num = ft_isdigit(*(str++));
	return (is_num);
}
