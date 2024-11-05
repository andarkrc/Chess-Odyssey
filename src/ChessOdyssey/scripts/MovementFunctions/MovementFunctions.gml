///@function generateJesterOptions
///@param direction_check
///@param weight
function generateJesterOptions(direction_check, weight){
	var dr = [-1, 0, 1, 0];
	var dc = [0, 1, 0, -1];
	if(weight >= 1)
	{
		if(piece == "")
		{
			validMove = true;
		}
		if(piece != "" && pieceType == "Enemy")
		{
			validAttack = true;
		}
	
		with(oGrid)
		{
			if(row == other.row + dr[direction_check])
			{
				if(column == other.column + dc[direction_check])
				{
					generateJesterOptions(direction_check, weight-1);
				}
			}
		}
	}
}

///@function generateAssassinOptions
///@param direction_check
///@param weight
function generateAssassinOptions(direction_check, weight){
	var dr = [-1, -1, 1, 1];
	var dc = [-1, 1, 1, -1];
	
	if(weight >= 1)
	{
		if(direction_check != 4)
		{
			with(oGrid)
			{
				if(row == other.row + dr[direction_check] && column == other.column + dc[direction_check])
				{
					if(piece == "")
					{
						validMove = true;
					}
					else
					{
						if(pieceType == "Enemy")
						{
							validAttack = true;
						}
						return -1;
					}
					generateAssassinOptions(direction_check, weight);
				}
			}
		}
		else
		{
			with(oGrid)
			{
				if(row == other.row-1 && column == other.column)
				{
					if(piece == "")
					{
						validMove = true;
					}
				}
				if(row == other.row+1 && column == other.column)
				{
					if(piece == "")
					{
						validMove = true;
					}
				}
				if(row == other.row && column == other.column-1)
				{
					if(piece == "")
					{
						validMove = true;
					}
				}
				if(row == other.row && column == other.column+1)
				{
					if(piece == "")
					{
						validMove = true;
					}
				}
			}
		}
	}
}

///@function generateKingOptions
///@param direction_check
function generateKingOptions(direction_check){
	var dr = [-1, -1, 0, 1, 1, 1, 0, -1];
	var dc = [0, 1, 1, 1, 0, -1, -1, -1];
	with(oGrid)
	{
		if(row == other.row + dr[direction_check] && column == other.column + dc[direction_check])
		{
			if(piece == "")
			{
				validMove = true;
			}
			if(piece != "" && pieceType == "Enemy")
			{
				validAttack = true;
			}
		}
	}
}

///@function generateSoldierOptions
function generateSoldierOptions(){
	if(row > 1)
		{
			with(oGrid)
			{
				if(column == other.column && row == other.row - 1)
				{
					if(piece == "")
					{
						validMove = true;
					}
				}
			}
			if(column > 1)
			{
				with(oGrid)
				{
					if(column == other.column-1 && row == other.row - 1)
					{
						if(piece != "" && pieceType = "Enemy")
						{
							validAttack = true;
						}
					}
				}
			}
			if(column < 10)
			{
				with(oGrid)
				{
					if(column == other.column+1 && row == other.row - 1)
					{
						if(piece != "" && pieceType = "Enemy")
						{
							validAttack = true;
						}
					}
				}
			}
		}
}

///@function generateChariotOptions
///@param direction_check
function generateChariotOptions(direction_check){
	
	var dr = [-1, 0, 1, 0];
	var dc = [0, 1, 0, -1];
	
	if(piece == "")
	{
		validMove = true;
	}
	if(piece != "" && pieceType == "Enemy")
	{
		validAttack = true;
		return -1;
	}
	if(pieceType == "My" && (row != oGameHandler.selectedGrid.row || column != oGameHandler.selectedGrid.column))
	{
		return -1;
	}
	
	with(oGrid)
	{
		if(row == other.row + dr[direction_check])
		{
			if(column == other.column + dc[direction_check])
			{
				generateChariotOptions(direction_check);
			}
		}
	}
}

///@function generatePaladinOptions
///@param direction_check
function generatePaladinOptions(direction_check){
	var dr = [-1, -1, 1, 1];
	var dc = [-1, 1, 1, -1];
		
	if(piece == "")
	{
		validMove = true;
	}
	if(piece != "" && pieceType == "Enemy")
	{
		validAttack = true;
		return -1;
	}
	if(pieceType == "My" && (row != oGameHandler.selectedGrid.row || column != oGameHandler.selectedGrid.column))
	{
		return -1;
	}
	
	with(oGrid)
	{
		if(row == other.row + dr[direction_check])
		{
			if(column == other.column + dc[direction_check])
			{
				generatePaladinOptions(direction_check);
			}
		}
	}
}

///@function generateGeneralOptions
///@param direction_check
function generateGeneralOptions(direction_check){
	var dr = [-1, -1, 0, 1, 1, 1, 0, -1];
	var dc = [0, 1, 1, 1, 0, -1, -1, -1];
	
	if(piece == "")
	{
		validMove = true;
	}
	if(piece != "" && pieceType == "Enemy")
	{
		validAttack = true;
		return -1;
	}
	if(pieceType == "My" && (row != oGameHandler.selectedGrid.row || column != oGameHandler.selectedGrid.column))
	{
		return -1;
	}
	
	with(oGrid)
	{
		if(row == other.row + dr[direction_check])
		{
			if(column == other.column + dc[direction_check])
			{
				generateGeneralOptions(direction_check);
			}
		}
	}
}

///@function generateKnightOptions
///@param direction_check
function generateKnightOptions(direction_check){
	var dr = [-2, -1, 1, 2, 2, 1, -1, -2];
	var dc = [1, 2, 2, 1, -1, -2, -2, -1];
	
	with(oGrid)
	{
		if(row == other.row + dr[direction_check])
		{
			if(column == other.column + dc[direction_check])
			{
				if(piece == "")
				{
					validMove = true;
				}
				if(piece != "" && pieceType == "Enemy")
				{
					validAttack = true;
					return -1;
				}
				if(pieceType == "My" && (row != oGameHandler.selectedGrid.row || column != oGameHandler.selectedGrid.column))
				{
					return -1;
				}
			}
		}
	}	
}

///@function generateArcherOptions
function generateArcherOptions(){
	with(oGrid)
	{
		if(column == other.column && row == other.row-2)
		{
			if(piece != "" && pieceType == "Enemy")
			{
				validAttack = true;
			}
		}
		
		if(column == other.column-1 && row == other.row)
		{
			if(piece == "")
			{
				validMove = true;
			}
		}
		if(column == other.column+1 && row == other.row)
		{
			if(piece == "")
			{
				validMove = true;
			}
		}
		if(column == other.column && row == other.row+1)
		{
			if(piece == "")
			{
				validMove = true;
			}
		}
		if(column == other.column && row == other.row-1)
		{
			if(piece == "")
			{
				validMove = true;
			}
		}
	}
}

///@function generateMusketeerOptions
function generateMusketeerOptions(){
	with(oGrid)
	{
		if(column == other.column && row == other.row-2)
		{
			if(piece != "" && pieceType == "Enemy")
			{
				validAttack = true;
			}
		}
		if(column == other.column && row == other.row-3)
		{
			if(piece != "" && pieceType == "Enemy")
			{
				validAttack = true;
			}
		}
		if(column == other.column-1 && row == other.row-2)
		{
			if(piece != "" && pieceType == "Enemy")
			{
				validAttack = true;
			}
		}
		if(column == other.column+1 && row == other.row-2)
		{
			if(piece != "" && pieceType == "Enemy")
			{
				validAttack = true;
			}
		}
		if(column == other.column-1 && row == other.row)
		{
			if(piece == "")
			{
				validMove = true;
			}
		}
		if(column == other.column+1 && row == other.row)
		{
			if(piece == "")
			{
				validMove = true;
			}
		}
		if(column == other.column && row == other.row+1)
		{
			if(piece == "")
			{
				validMove = true;
			}
		}
		if(column == other.column && row == other.row-1)
		{
			if(piece == "")
			{
				validMove = true;
			}
		}
	}
}
		
///@function generateElephantOptions
function generateElephantOptions(){
	var dr = [-2, -2, -2, -1, 0, 1, 2, 2, 2, 1, 0, -1];
	var dc = [-1, 0, 1, 2, 2, 2, 1, 0, -1, -2, -2, -2];
	var i = 0;
	for(i = 0; i<=11; i++)
	{
		with(oGrid)
		{
			if(row == other.row + dr[i] && column == other.column + dc[i])
			{
				if(piece == "")
				{
					validMove = true;
				}
				if(piece != "" && pieceType == "Enemy")
				{
					validAttack = true;
				}
			}
		}
	}
}
