/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isdigit.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arcanava <arcanava@student.42barcel>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/01/09 13:40:40 by arcanava          #+#    #+#             */
/*   Updated: 2024/05/01 15:54:10 by arcanava         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int	ft_isdigit(int c)
{
	return (c >= 48 && c <= 57);
}
int	ft_isnum(char *str)
{
	int is_num;

	is_num = *str != '\0';
	while (*str && is_num)
		is_num = ft_isdigit(*(str++));
	return (is_num);
}
