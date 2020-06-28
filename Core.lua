local RealIDCL = LibStub("AceAddon-3.0"):NewAddon("RealIDCL", "AceConsole-3.0")

-- Slash processor
function RealIDCL:SlashProcessor(input)
   local command, commandInput = strsplit(" ", input, 2)
   if command == "b" or command == "broadcast" then
      RealIDCL:Broadcast(commandInput)
   elseif command == "a" or command == "add" then
      local name, note = strsplit(" ", commandInput, 2)
      RealIDCL:Add(name, note)
   else
      RealIDCL:Print("usage: /rid [b, broadcast | a, add]")
      RealIDCL:Print("   b, broadcast <message>              broadcasts a message using Real ID")
      RealIDCL:Print("       Example: /rid b Hey guys hows it going, is there a raid tonight?")
      RealIDCL:Print("   a, add <email> <optional note>      broadcasts a message using Real ID")
      RealIDCL:Print("       Example: /rid a bestfriend1@gmail.com")
      RealIDCL:Print("       Example: /rid a bestfriend2@gmail.com Hey man we went to college together!")
   end
end

function RealIDCL:Broadcast(message)
   BNSetCustomMessage(message)
   print("|c0082C5FF[You] broadcasted: " .. message)
end

function RealIDCL:Add(name, note)
   BNSendFriendInvite(name, note)
   print("|c0082C5FFSent a friend request to " .. name .. ".")
end

-- Initialization handler
function RealIDCL:OnInitialize()
   RealIDCL:RegisterChatCommand("rid", "SlashProcessor")
end

function RealIDCL:OnEnable()
   RealIDCL:Print("Enabled")
end

function RealIDCL:OnDisable()
   RealIDCL:Print("Disabled")
end