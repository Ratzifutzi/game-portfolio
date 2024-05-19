Configuration = require(script.Parent.Parent.Configuration)

MarketplaceService = game:GetService("MarketplaceService")

local module = {}

function module.CheckGamepass (userId:number, gamepassId:number)
	if Configuration.FreeGamepassesInStudio and game:GetService("RunService"):IsStudio() then
		return true
	end
	
	return MarketplaceService:UserOwnsGamePassAsync(userId, gamepassId)
end

return module
