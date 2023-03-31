AddEventHandler('txAdmin:events:playerKicked', function(eventData) --Log Kicked Player

    local target = eventData.target
    local author = eventData.author
    local reason = eventData.reason

    local message = "Name: **" .. GetPlayerName(target) .. "** \nID: **" .. target .. "**\nAuthor: **" .. author .. "** \nReason: **" .. reason .. "**"

    sendToDiscord('Player Kicked', message, 16738816)

end)

AddEventHandler('txAdmin:events:playerWarned', function(eventData) --Log Warned Player

    local target = eventData.target
    local author = eventData.author
    local reason = eventData.reason
    local id = eventData.actionId

    local message = "Name: **" .. GetPlayerName(target) .. "** \nID: **" .. target .. "**\nAuthor: **" .. author .. "** \nReason: **" .. reason ..  "**\nAction ID: **" .. id .. "**"

    sendToDiscord('Player Warned', message, 16776960)

end)

AddEventHandler('txAdmin:events:playerBanned', function(eventData) --Log Banned Player
    local playername = eventData.targetName
    local author = eventData.author
    local reason = eventData.reason
    local id = eventData.actionId
    local exp = eventData.expiration
    local targetIds = eventData.targetIds
    local kickmessage = eventData.kickMessage

    -- Extract IDs from targetIds
    local steamId, licenseId, discordId, fivemId, license2Id = nil, nil, nil, nil, nil
    for _, id in ipairs(targetIds) do
        if string.sub(id, 1, 6) == "steam:" then
            steamId = string.sub(id, 7)
        elseif string.sub(id, 1, 8) == "license:" then
            licenseId = string.sub(id, 9)
        elseif string.sub(id, 1, 8) == "discord:" then
            discordId = string.sub(id, 9)
        elseif string.sub(id, 1, 6) == "fivem:" then
            fivemId = string.sub(id, 7)
        elseif string.sub(id, 1, 9) == "license2:" then
            license2Id = string.sub(id, 10)
        end
    end

    if not exp then
        exp = 'Permanent Ban'
    else
        exp = '<t:' .. tostring(exp) .. ':F>, <t:' .. tostring(exp) .. ':R>'
    end 

    local message = "Name: **" .. playername .. "** \nAuthor: **" .. author .. "** \nReason: **" .. reason .. "**\nID: **" .. id .. "**\nExpires: **" .. exp .. "**"
    if steamId then
        message = message .. "\nSteam ID: **" .. steamId .. "**"
    end
    if licenseId then
        message = message .. "\nLicense ID: **" .. licenseId .. "**"
    end
    if discordId then
        message = message .. "\nDiscord ID: **" .. discordId .. "**"
    end
    if fivemId then
        message = message .. "\nFiveM ID: **" .. fivemId .. "**"
    end
    if license2Id then
        message = message .. "\nLicense 2 ID: **" .. license2Id .. "**"
    end

    if kickmessage then
        message = message .. "\nKick Message: **" .. kickmessage .. "**"
    end
    
    sendToDiscord('Player Banned', message, 16711680)
end)

AddEventHandler('txAdmin:events:actionRevoked', function(eventData) --Log Unbanned Player
    local type = eventData.actionType
    local playername = eventData.playerName
    local author = eventData.actionAuthor
    local reason = eventData.actionReason
    local id = eventData.actionId
    local targetIds = eventData.playerIds
    local revokeAuthor = eventData.revokedBy

    -- Extract IDs from targetIds
    local steamId, licenseId, discordId, fivemId, license2Id = nil, nil, nil, nil, nil
    if targetIds then
        for _, id in ipairs(targetIds) do
            if string.sub(id, 1, 6) == "steam:" then
                steamId = string.sub(id, 7)
            elseif string.sub(id, 1, 8) == "license:" then
                licenseId = string.sub(id, 9)
            elseif string.sub(id, 1, 8) == "discord:" then
                discordId = string.sub(id, 9)
            elseif string.sub(id, 1, 6) == "fivem:" then
                fivemId = string.sub(id, 7)
            elseif string.sub(id, 1, 9) == "license2:" then
                license2Id = string.sub(id, 10)
            end
        end
    end

    local message = "Name: **" .. playername .. "** \nAction Author: **" .. author .. "** \nReason: **" .. reason .. "**\nID: **" .. id .. "**"
    if steamId then
        message = message .. "\nSteam ID: **" .. steamId .. "**"
    end
    if licenseId then
        message = message .. "\nLicense ID: **" .. licenseId .. "**"
    end
    if discordId then
        message = message .. "\nDiscord ID: **" .. discordId .. "**"
    end
    if fivemId then
        message = message .. "\nFiveM ID: **" .. fivemId .. "**"
    end
    if license2Id then
        message = message .. "\nLicense 2 ID: **" .. license2Id .. "**"
    end

    if revokeAuthor then
        message = message .. "\nRevoked By: **" .. revokeAuthor .. "**"
    end
    
    -- Check if type is "ban" before sending to Discord
    if type == "ban" then
        sendToDiscord('Player Unbanned', message, 65280)
    end
end)

AddEventHandler('txAdmin:events:actionRevoked', function(eventData) --Log Revoked Warning
    local type = eventData.actionType
    local playername = eventData.playerName
    local author = eventData.actionAuthor
    local reason = eventData.actionReason
    local id = eventData.actionId
    local targetIds = eventData.playerIds
    local revokeAuthor = eventData.revokedBy

    -- Extract IDs from targetIds
    local steamId, licenseId, discordId, fivemId, license2Id = nil, nil, nil, nil, nil
    if targetIds then
        for _, id in ipairs(targetIds) do
            if string.sub(id, 1, 6) == "steam:" then
                steamId = string.sub(id, 7)
            elseif string.sub(id, 1, 8) == "license:" then
                licenseId = string.sub(id, 9)
            elseif string.sub(id, 1, 8) == "discord:" then
                discordId = string.sub(id, 9)
            elseif string.sub(id, 1, 6) == "fivem:" then
                fivemId = string.sub(id, 7)
            elseif string.sub(id, 1, 9) == "license2:" then
                license2Id = string.sub(id, 10)
            end
        end
    end

    local message = "Name: **" .. playername .. "** \nAction Author: **" .. author .. "** \nReason: **" .. reason .. "**\nID: **" .. id .. "**"
    if steamId then
        message = message .. "\nSteam ID: **" .. steamId .. "**"
    end
    if licenseId then
        message = message .. "\nLicense ID: **" .. licenseId .. "**"
    end
    if discordId then
        message = message .. "\nDiscord ID: **" .. discordId .. "**"
    end
    if fivemId then
        message = message .. "\nFiveM ID: **" .. fivemId .. "**"
    end
    if license2Id then
        message = message .. "\nLicense 2 ID: **" .. license2Id .. "**"
    end

    if revokeAuthor then
        message = message .. "\nRevoked By: **" .. revokeAuthor .. "**"
    end
    
    -- Check if type is "warn" before sending to Discord
    if type == "warn" then
        sendToDiscord('Warning Revoked', message, 65280)
    end
end)

AddEventHandler('txAdmin:events:healedPlayer', function(eventData) --Log Healed Player

    local target = eventData.id

    if target == -1 then
        playername = 'Everyone'
        playerid = 'Everyone'
    else
        playername = GetPlayerName(target)
        playerid = target
    end

    local message = "Name: **" .. playername .. "**\nServer ID: **" .. playerid .. "**\n"

    sendToDiscord('Player Healed', message, 65280)

end)

AddEventHandler('txAdmin:events:announcement', function(eventData) --Log Server Announcement

    local author = eventData.author
    local msg = eventData.message

    local message = "Author: **" .. author .. "**\nMessage: **" .. msg .. "**"

    sendToDiscord('Announcement', message, 255)

end)

AddEventHandler('txAdmin:events:playerDirectMessage', function(eventData) --Log Server Shutdown

    local author = eventData.author
    local msg = eventData.message
    local target = eventData.target

    local message = "Author: **" .. author .. "**\nMessage: **" .. msg .. "**\nDelay: **" .. msg .. "**" 

    sendToDiscord('Direct Message', message, 65535)

end)

AddEventHandler('txAdmin:events:skippedNextScheduledRestart', function(eventData) --Log Skipped Scheduled Restarts

    local remain = eventData.secondsRemaining
    local temp = eventData.temporary
    if temp == true then
        type = 'Temporary Scheduled Restart'
    else
        type = 'Permanent Scheduled Restart'
    end

    local message = "Restart Type: **" .. type .. "**\nTime Remaining: **" .. remain .. "s**"

    sendToDiscord('Server Restart Skipped', message, 16776960)

end)

AddEventHandler('txAdmin:events:whitelistPlayer', function(eventData) --Log Added Whitelisted Players

    local action = eventData.action
    local license = eventData.license
    local playerName = eventData.playerName
    local admin = eventData.adminName

    local message = "Player: **" .. playerName .. "**\nLicense: **" .. license .. "**\nGranted by: **" .. admin .. "**"

    -- Check if action is "added" before sending to Discord
    if action == "added" then
        sendToDiscord('Whitelist Added', message, 65280)
    end

end)

AddEventHandler('txAdmin:events:whitelistPlayer', function(eventData) --Log Removed Whitelisted Players

    local action = eventData.action
    local license = eventData.license
    local playerName = eventData.playerName
    local admin = eventData.adminName

    local message = "Player: **" .. playerName .. "**\nLicense: **" .. license .. "**\nRevoked by: **" .. admin .. "**"

    -- Check if action is "added" before sending to Discord
    if action == "removed" then
        sendToDiscord('Whitelist Removed', message, 16711680)
    end

end)

AddEventHandler('txAdmin:events:whitelistPreApproval', function(eventData) --Logs Added Whitelist Preapprovals

    local action = eventData.action
    local identifier = eventData.identifier
    local playername = eventData.playerName
    local admin = eventData.adminName

    local message = "Player Name: **" .. playername .. "**\nIdentifier: **" .. identifier .. "**\nGranted by: **" .. admin .. "**"

    if action == "added" then
        sendToDiscord('Whitelist Preapproval Added', message, 65280)
    end
end)

AddEventHandler('txAdmin:events:whitelistPreApproval', function(eventData) --Logs Removed Whitelist Preapprovals

    local action = eventData.action
    local identifier = eventData.identifier
    local admin = eventData.adminName

    local message = "Identifier: **" .. identifier .. "**\nGranted by: **" .. admin .. "**"

    if action == "removed" then
        sendToDiscord('Whitelist Preapproval Removed', message, 16711680)
    end
end)

AddEventHandler('txAdmin:events:whitelistRequest', function(eventData) --Logs Whitelist Requests

    local playername = eventData.playerName
    local requestid = eventData.requestId
    local action = eventData.action
    local license = eventData.license

    local message = "Player Name: **" .. playername .. "**\nRequest ID: **" .. requestid .. "**\nLicense ID: **" .. license .. "**"

    if action == "requested" then
        sendToDiscord('Whitelist Request', message, 16776960)
    end
end)

AddEventHandler('txAdmin:events:whitelistRequest', function(eventData) --Logs Whitelist Request Approvals

    local playername = eventData.playerName
    local requestid = eventData.requestId
    local action = eventData.action
    local license = eventData.license
    local admin = eventData.adminName

    local message = "Player Name: **" .. playername .. "**\nRequest ID: **" .. requestid .. "**\nLicense ID: **" .. license .. "**\nApproved by: **" .. admin .. "**"

    if action == "approved" then
        sendToDiscord('Whitelist Request Approved', message, 65280)
    end
end)

AddEventHandler('txAdmin:events:whitelistRequest', function(eventData) --Logs Whitelist Request Denials

    local playername = eventData.playerName
    local requestid = eventData.requestId
    local action = eventData.action
    local license = eventData.license
    local admin = eventData.adminName

    local message = "Player Name: **" .. playername .. "**\nRequest ID: **" .. requestid .. "**\nLicense ID: **" .. license .. "**\nDenied by: **" .. admin .. "**"

    if action == "denied" then
        sendToDiscord('Whitelist Request Denied', message, 16711680)
    end
end)

AddEventHandler('txAdmin:events:whitelistRequest', function(eventData) --Logs Whitelist Request All Denials

    local action = eventData.action
    local admin = eventData.adminName

    local message = "Denied by: **" .. admin .. "**"

    if action == "deniedAll" then
        sendToDiscord('Whitelist Requests All Denied', message, 16711680)
    end
end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData) --Log Scheduled Restart Notifications

    local remaining = eventData.secondsRemaining
    local messagesent = eventData.translatedMessage

    local message = "Time Remaining: **" .. remaining .. "s**\nMessage: **" .. messagesent .. "**"

    sendToDiscord('Scheduled Restart Notification', message, 16776960)
end)

AddEventHandler('txAdmin:events:serverShuttingDown', function(eventData) --Log Server Shutdown

    local author = eventData.author
    local shutdownmessage = eventData.message
    local delay = eventData.delay

    local message = "Commanded by: **" .. author .. "**\nMessage: **" .. shutdownmessage .. "**\nDelay: **" .. delay .. "**"

    sendToDiscord('Server Shutdown', message, 16711680)

end)

function sendToDiscord(header, message, color)
    local webhook = Config.txAdminWebhook
    local name = Config.Username
    local avatar = Config.avatar
    local connect = {
          {
              ["title"] = header,
              ["description"] = message,
              ["color"] = color
          }
      }
      PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, avatar_url = avatar, embeds = connect}), { ['Content-Type'] = 'application/json' })
end