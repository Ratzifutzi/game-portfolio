HTTPService = game:GetService("HttpService")

Tokens = require(script.Tokens)

local module = {}

local url = "https://hooks.hyra.io/"

function module.sendPlainMessage (tokenName:string, message:string)
	print("Sending message to hook " .. tokenName)
	
	local data = HTTPService:JSONEncode({
		["content"] = tostring(message)
	})
	
	local response = HTTPService:PostAsync(Tokens[tokenName], data)
	
	return response
end

function module.sendAdvancedEmbedMessage (tokenName:string, data:any)
	print("Sending message to hook " .. tokenName)
	
	local response = HTTPService:PostAsync(Tokens[tokenName], data)

	return response
end

function module.sendSimpleEmbedMessage (tokenName:string, title:string, description:string, color:string)
	print("Sending message to hook " .. tokenName)

	local data = HTTPService:JSONEncode({
		['embeds'] = {{
			['title'] = "**"..title.."**",
			['description'] = description,
			["color"] = tonumber("0x" .. color)
		}
		},
	})

	local response = HTTPService:PostAsync(Tokens[tokenName], data)

	return response
end

return module
