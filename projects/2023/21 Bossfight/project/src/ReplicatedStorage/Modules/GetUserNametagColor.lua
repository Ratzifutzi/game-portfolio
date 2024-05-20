local BC = BrickColor.new

local ChatColors = {
	BC("Bright red").Color,
    BC("Bright blue").Color,
  	BC("Earth green").Color,
  	BC("Bright violet").Color,
  	BC("Bright orange").Color,
  	BC("Bright yellow").Color,
  	BC("Light reddish violet").Color,
  	BC("Brick yellow").Color,
}

function getChatColorsIndex(username)
	local usernameLength = #username
	local totalValue = 0
	
	for i = 1, usernameLength do  -- A loop that looks at each letter in the username
		local letter = string.sub(username, i, i) -- Gets an individual letter
		local letterValue = string.byte(letter) -- Gets a number representation of the letter
		local iReversed = usernameLength - i + 1 -- When i = 1, iReversed is just the username length. The more i increases, the more iReversed decreases
		if usernameLength % 2 == 1 then -- Checks if usernameLength is an odd number
			iReversed = iReversed - 1			
		end
		if iReversed % 4 >= 2 then -- Some more gibberish to make the algorithm more complex
			letterValue = -letterValue 			
		end 
		totalValue += letterValue -- Same as doing: totalValue = totalValue + letterValue
	end 
	
	local index = (totalValue % #ChatColors) + 1 -- Makes a number from 1 to 8 depending on totalValue, because there are 8 colors
	return index
end 

-----------------------------------------------------------------------------------------------

local module = function(username)
	local index = getChatColorsIndex(username)
	local color = ChatColors[index]
	return color
end

return module