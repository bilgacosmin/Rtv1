/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   free_win.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cbilga <cbilga@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/13 16:52:28 by cbilga            #+#    #+#             */
/*   Updated: 2020/03/04 15:03:46 by cbilga           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "rtv1.h"

int		free_window(t_win *win)
{
	int i;

	i = 0;
	while (i < win->nb_obj)
	{
		free(win->objects[i]);
		i++;
	}
	free(win->lights);
	SDL_DestroyTexture(win->texture);
	SDL_DestroyRenderer(win->renderer);
	SDL_DestroyWindow(win->window);
	return (0);
}

void	free_split(char ***split)
{
	int i;

	i = 0;
	while ((*split)[i] != NULL)
	{
		free((*split)[i]);
		i++;
	}
	free(*split);
	*split = NULL;
}

int		error_handling(t_win *win)
{
	free_window(win);
	exit(0);
}
