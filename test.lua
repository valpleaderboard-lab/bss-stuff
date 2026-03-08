local HttpService = game:GetService("HttpService")

function send(msg,name)
	request({
		Url = "https://discord.com/api/webhooks/1324084236558532701/QhbB-OUxaScbiaItK9N71Ew5X6iWWsfd2nkPyVBzv5XGV4RppWumNOYyqXh5cmKTuPN1",
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
	})
end

local Events = require(game.ReplicatedStorage.Events)

hookfunction(Events.ClientListen, function(v1,v2)
	send(game:GetService("HttpService"):JSONEncode(v2),v1)
	return Events.ClientListen
end)
