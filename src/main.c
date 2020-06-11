/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cbilga <cbilga@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/13 16:54:08 by cbilga            #+#    #+#             */
/*   Updated: 2020/03/04 15:03:32 by cbilga           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "rtv1.h"

int	main(int argc, char *argv[])
{
	t_win win;

	init_win(&win);
	if (argc >= 2)
		parse(&win, argv[1]);
	else
		parse_objects_empty(&win);
	turn(&win);
	free_window(&win);
	return (0);
}
