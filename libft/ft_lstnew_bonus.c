/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstnew_bonus.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aorcha-m <aorcha-m@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/06 17:20:38 by aorcha-m          #+#    #+#             */
/*   Updated: 2023/12/09 13:02:22 by aorcha-m         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/* Create a new node using malloc(3). The member variable 'content' is 
   initialized with the content of the parameter 'content'. The variable 
   'next' is initialized with NULL. */

#include "libft.h"

t_list	*ft_lstnew(void *content)
{
	t_list	*new_node;

	new_node = (t_list *)malloc(sizeof(t_list));
	if (!new_node)
		return (NULL);
	new_node->content = content;
	new_node->next = NULL;
	return (new_node);
}
