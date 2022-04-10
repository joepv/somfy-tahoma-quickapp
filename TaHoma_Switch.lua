----------------------------------------------------------------------------------
-- Somfy TaHoma switch
-- Version 0.9 (April 2022)
-- Copyright (c)2022 Joep Verhaeg <info@joepverhaeg.nl>

-- Full documentation you can find at:
-- https://docs.joepverhaeg.nl/somfy
----------------------------------------------------------------------------------
-- DISCLAIMER:
-- This Quick App has been written in such a way that it respects the Somfy API 
-- guidelines. Your use of the Somfy TaHoma switch Quick App is solely at 
-- your own risk. If your public IP address is blocked by the Somfy API servers, 
-- that is your own responsibility.

-- I (Joep Verhaeg) am not providing any support or advice of any kind. If Somfy 
-- stops offering the API that this Quick App uses, I (Joep Verhaeg) will not be 
-- responsible for the failure of automations made with this Quick App.
----------------------------------------------------------------------------------
-- DESCRIPTION:
-- This Quick App connects your Somfy TaHoma switch connected products to the HC3.
 
-- QUICK SETUP:
-- 1. Configure your devices on the TaHoma switch,
-- 2. Configure the username and password in the Quick App variables.
----------------------------------------------------------------------------------

local function getChildVariable(child, varName)
    for _,v in ipairs(child.properties.quickAppVariables or {}) do
        if (v.name == varName) then 
            return v.value
        end
    end
    return ""
end

class 'RollerShutter'(QuickAppChild)
function RollerShutter:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
end

function RollerShutter:open()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send OPEN command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "open")
    self.parent:SendCommand(deviceURL, label, "open", 99)
    self:updateProperty("value", 99)
end

function RollerShutter:close()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send CLOSE command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "CLOSE")
    self.parent:SendCommand(deviceURL, label, "close", 0)
    self:updateProperty("value", 0)
end

function RollerShutter:stop()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send STOP command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "STOP")
    self.parent:SendCommand(deviceURL, label, "stop", 0)
    self:updateProperty("value", 50)
end

-- Value is type of integer (0-99)
function RollerShutter:setValue(value)
    if value == 123 then
        -- favorite started for the my button.
        local deviceURL = self:getVariable("deviceURL")
        local label = self.name
        self:debug("Send MY BUTTON command for " .. label .. "(" .. deviceURL .. ")")
        self:updateProperty("log", "MY")
        self.parent:SendCommand(deviceURL, label, "my", 50)
        self:updateProperty("value", 50)
    else
        local deviceURL = self:getVariable("deviceURL")
        if string.sub(deviceURL,1,5) == "io://" then
            local label = self.name
            self:debug("Send LEVEL command for " .. label .. "(" .. deviceURL .. ")")
            self:updateProperty("log", "LEVEL")
            local level = 100 - tonumber(value)
            self.parent:SendCommand(deviceURL, label, "setClosure", level)
            self:updateProperty("value", value)
        else
            self:debug("Erro: LEVEL command NOT supported for an RTS device!")
        end
    end
end

class 'ExteriorScreen'(QuickAppChild)
function ExteriorScreen:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
end

function ExteriorScreen:open()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send OPEN command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "open")
    self.parent:SendCommand(deviceURL, label, "open", 99)
    self:updateProperty("value", 99)
end

function ExteriorScreen:close()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send CLOSE command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "CLOSE")
    self.parent:SendCommand(deviceURL, label, "close", 0)
    self:updateProperty("value", 0)
end

function ExteriorScreen:stop()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send STOP command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "STOP")
    self.parent:SendCommand(deviceURL, label, "stop", 0)
    self:updateProperty("value", 50)
end

-- Value is type of integer (0-99)
function ExteriorScreen:setValue(value)
    if value == 123 then
        -- favorite started for the my button.
        local deviceURL = self:getVariable("deviceURL")
        local label = self.name
        self:debug("Send MY BUTTON command for " .. label .. "(" .. deviceURL .. ")")
        self:updateProperty("log", "MY")
        self.parent:SendCommand(deviceURL, label, "my", 50)
        self:updateProperty("value", 50)
    else
        local deviceURL = self:getVariable("deviceURL")
        if string.sub(deviceURL,1,5) == "io://" then
            local label = self.name
            self:debug("Send LEVEL command for " .. label .. "(" .. deviceURL .. ")")
            self:updateProperty("log", "LEVEL")
            local level = 100 - tonumber(value)
            self.parent:SendCommand(deviceURL, label, "setClosure", level)
            self:updateProperty("value", value)
        else
            self:debug("Erro: LEVEL command NOT supported for an RTS device!")
        end
    end
end

class 'Screen'(QuickAppChild)
function Screen:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
end

function Screen:open()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send OPEN command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "open")
    self.parent:SendCommand(deviceURL, label, "open", 99)
    self:updateProperty("value", 99)
end

function Screen:close()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send CLOSE command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "CLOSE")
    self.parent:SendCommand(deviceURL, label, "close", 0)
    self:updateProperty("value", 0)
end

function Screen:stop()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send STOP command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "STOP")
    self.parent:SendCommand(deviceURL, label, "stop", 0)
    self:updateProperty("value", 50)
end

-- Value is type of integer (0-99)
function Screen:setValue(value)
    if value == 123 then
        -- favorite started for the my button.
        local deviceURL = self:getVariable("deviceURL")
        local label = self.name
        self:debug("Send MY BUTTON command for " .. label .. "(" .. deviceURL .. ")")
        self:updateProperty("log", "MY")
        self.parent:SendCommand(deviceURL, label, "my", 50)
        self:updateProperty("value", 50)
    else
        local deviceURL = self:getVariable("deviceURL")
        if string.sub(deviceURL,1,5) == "io://" then
            local label = self.name
            self:debug("Send LEVEL command for " .. label .. "(" .. deviceURL .. ")")
            self:updateProperty("log", "LEVEL")
            local level = 100 - tonumber(value)
            self.parent:SendCommand(deviceURL, label, "setClosure", level)
            self:updateProperty("value", value)
        else
            self:debug("Erro: LEVEL command NOT supported for an RTS device!")
        end
    end
end

class 'Awning'(QuickAppChild)
function Awning:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
end

function Awning:open()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send OPEN command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "open")
    self.parent:SendCommand(deviceURL, label, "open", 99)
    self:updateProperty("value", 99)
end

function Awning:close()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send CLOSE command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "CLOSE")
    self.parent:SendCommand(deviceURL, label, "close", 0)
    self:updateProperty("value", 0)
end

function Awning:stop()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send STOP command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "STOP")
    self.parent:SendCommand(deviceURL, label, "stop", 0)
    self:updateProperty("value", 50)
end

-- Value is type of integer (0-99)
function Awning:setValue(value)
    if value == 123 then
        -- favorite started for the my button.
        local deviceURL = self:getVariable("deviceURL")
        local label = self.name
        self:debug("Send MY BUTTON command for " .. label .. "(" .. deviceURL .. ")")
        self:updateProperty("log", "MY")
        self.parent:SendCommand(deviceURL, label, "my", 50)
        self:updateProperty("value", 50)
    else
        local deviceURL = self:getVariable("deviceURL")
        if string.sub(deviceURL,1,5) == "io://" then
            local label = self.name
            self:debug("Send LEVEL command for " .. label .. "(" .. deviceURL .. ")")
            self:updateProperty("log", "LEVEL")
            local level = 100 - tonumber(value)
            self.parent:SendCommand(deviceURL, label, "setClosure", level)
            self:updateProperty("value", value)
        else
            self:debug("Erro: LEVEL command NOT supported for an RTS device!")
        end
    end
end

class 'Pergola'(QuickAppChild)
function Pergola:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
end

function Pergola:open()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send OPEN command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "open")
    self.parent:SendCommand(deviceURL, label, "open", 99)
    self:updateProperty("value", 99)
end

function Pergola:close()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send CLOSE command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "CLOSE")
    self.parent:SendCommand(deviceURL, label, "close", 0)
    self:updateProperty("value", 0)
end

function Pergola:stop()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send STOP command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "STOP")
    self.parent:SendCommand(deviceURL, label, "stop", 0)
    self:updateProperty("value", 50)
end

-- Value is type of integer (0-99)
function Pergola:setValue(value)
    if value == 123 then
        -- favorite started for the my button.
        local deviceURL = self:getVariable("deviceURL")
        local label = self.name
        self:debug("Send MY BUTTON command for " .. label .. "(" .. deviceURL .. ")")
        self:updateProperty("log", "MY")
        self.parent:SendCommand(deviceURL, label, "my", 50)
        self:updateProperty("value", 50)
    else
        local deviceURL = self:getVariable("deviceURL")
        if string.sub(deviceURL,1,5) == "io://" then
            local label = self.name
            self:debug("Send LEVEL command for " .. label .. "(" .. deviceURL .. ")")
            self:updateProperty("log", "LEVEL")
            local level = 100 - tonumber(value)
            self.parent:SendCommand(deviceURL, label, "setClosure", level)
            self:updateProperty("value", value)
        else
            self:debug("Erro: LEVEL command NOT supported for an RTS device!")
        end
    end
end

class 'GarageDoor'(QuickAppChild)
function GarageDoor:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
end

function GarageDoor:open()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send OPEN command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "open")
    self.parent:SendCommand(deviceURL, label, "open", 99)
    self:updateProperty("value", 99)
end

function GarageDoor:close()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send CLOSE command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "CLOSE")
    self.parent:SendCommand(deviceURL, label, "close", 0)
    self:updateProperty("value", 0)
end

function GarageDoor:stop()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send STOP command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "STOP")
    self.parent:SendCommand(deviceURL, label, "stop", 0)
    self:updateProperty("value", 50)
end

-- Value is type of integer (0-99)
function GarageDoor:setValue(value)
    if value == 123 then
        -- favorite started for the my button.
        local deviceURL = self:getVariable("deviceURL")
        local label = self.name
        self:debug("Send MY BUTTON command for " .. label .. "(" .. deviceURL .. ")")
        self:updateProperty("log", "MY")
        self.parent:SendCommand(deviceURL, label, "my", 50)
        self:updateProperty("value", 50)
    else
        local deviceURL = self:getVariable("deviceURL")
        if string.sub(deviceURL,1,5) == "io://" then
            local label = self.name
            self:debug("Send LEVEL command for " .. label .. "(" .. deviceURL .. ")")
            self:updateProperty("log", "LEVEL")
            local level = 100 - tonumber(value)
            self.parent:SendCommand(deviceURL, label, "setClosure", level)
            self:updateProperty("value", value)
        else
            self:debug("Erro: LEVEL command NOT supported for an RTS device!")
        end
    end
end

class 'Window'(QuickAppChild)
function Window:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
end

function Window:open()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send OPEN command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "open")
    self.parent:SendCommand(deviceURL, label, "open", 99)
    self:updateProperty("value", 99)
end

function Window:close()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send CLOSE command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "CLOSE")
    self.parent:SendCommand(deviceURL, label, "close", 0)
    self:updateProperty("value", 0)
end

function Window:stop()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send STOP command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "STOP")
    self.parent:SendCommand(deviceURL, label, "stop", 0)
    self:updateProperty("value", 50)
end

-- Value is type of integer (0-99)
function Window:setValue(value)
    if value == 123 then
        -- favorite started for the my button.
        local deviceURL = self:getVariable("deviceURL")
        local label = self.name
        self:debug("Send MY BUTTON command for " .. label .. "(" .. deviceURL .. ")")
        self:updateProperty("log", "MY")
        self.parent:SendCommand(deviceURL, label, "my", 50)
        self:updateProperty("value", 50)
    else
        local deviceURL = self:getVariable("deviceURL")
        if string.sub(deviceURL,1,5) == "io://" then
            local label = self.name
            self:debug("Send LEVEL command for " .. label .. "(" .. deviceURL .. ")")
            self:updateProperty("log", "LEVEL")
            local level = 100 - tonumber(value)
            self.parent:SendCommand(deviceURL, label, "setClosure", level)
            self:updateProperty("value", value)
        else
            self:debug("Erro: LEVEL command NOT supported for an RTS device!")
        end
    end
end

class 'VenetianBlind'(QuickAppChild)
function VenetianBlind:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
end

function VenetianBlind:open()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send OPEN command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "open")
    self.parent:SendCommand(deviceURL, label, "open", 99)
    self:updateProperty("value", 99)
end

function VenetianBlind:close()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send CLOSE command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "CLOSE")
    self.parent:SendCommand(deviceURL, label, "close", 0)
    self:updateProperty("value", 0)
end

function VenetianBlind:stop()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send STOP command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "STOP")
    self.parent:SendCommand(deviceURL, label, "stop", 0)
    self:updateProperty("value", 50)
end

-- Value is type of integer (0-99)
function VenetianBlind:setValue(value)
    if value == 123 then
        -- favorite started for the my button.
        local deviceURL = self:getVariable("deviceURL")
        local label = self.name
        self:debug("Send MY BUTTON command for " .. label .. "(" .. deviceURL .. ")")
        self:updateProperty("log", "MY")
        self.parent:SendCommand(deviceURL, label, "my", 50)
        self:updateProperty("value", 50)
    else
        local deviceURL = self:getVariable("deviceURL")
        if string.sub(deviceURL,1,5) == "io://" then
            local label = self.name
            self:debug("Send LEVEL command for " .. label .. "(" .. deviceURL .. ")")
            self:updateProperty("log", "LEVEL")
            local level = 100 - tonumber(value)
            self.parent:SendCommand(deviceURL, label, "setClosure", level)
            self:updateProperty("value", value)
        else
            self:debug("Erro: LEVEL command NOT supported for an RTS device!")
        end
    end
end

class 'ExteriorVenetianBlind'(QuickAppChild)
function ExteriorVenetianBlind:__init(device)
    -- You should not insert code before QuickAppChild.__init.
    QuickAppChild.__init(self, device) 
end

function ExteriorVenetianBlind:open()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send OPEN command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "open")
    self.parent:SendCommand(deviceURL, label, "open", 99)
    self:updateProperty("value", 99)
end

function ExteriorVenetianBlind:close()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send CLOSE command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "CLOSE")
    self.parent:SendCommand(deviceURL, label, "close", 0)
    self:updateProperty("value", 0)
end

function ExteriorVenetianBlind:stop()
    local deviceURL = self:getVariable("deviceURL")
    local label = self.name
    self:debug("Send STOP command for " .. label .. "(" .. deviceURL .. ")")
    self:updateProperty("log", "STOP")
    self.parent:SendCommand(deviceURL, label, "stop", 0)
    self:updateProperty("value", 50)
end

-- Value is type of integer (0-99)
function ExteriorVenetianBlind:setValue(value)
    if value == 123 then
        -- favorite started for the my button.
        local deviceURL = self:getVariable("deviceURL")
        local label = self.name
        self:debug("Send MY BUTTON command for " .. label .. "(" .. deviceURL .. ")")
        self:updateProperty("log", "MY")
        self.parent:SendCommand(deviceURL, label, "my", 50)
        self:updateProperty("value", 50)
    else
        local deviceURL = self:getVariable("deviceURL")
        if string.sub(deviceURL,1,5) == "io://" then
            local label = self.name
            self:debug("Send LEVEL command for " .. label .. "(" .. deviceURL .. ")")
            self:updateProperty("log", "LEVEL")
            local level = 100 - tonumber(value)
            self.parent:SendCommand(deviceURL, label, "setClosure", level)
            self:updateProperty("value", value)
        else
            self:debug("Erro: LEVEL command NOT supported for an RTS device!")
        end
    end
end

function QuickApp:SendCommand(deviceUrl, label, command, level)
    self:debug("Run a command for device " .. label .. " (" .. deviceUrl .. ")...")
    self:debug("Using cookie: " .. self.cookie)
    self.http:request('https://tahomalink.com/enduser-mobile-web/enduserAPI/exec/apply', {
            options = {
                headers = {
                    ["Content-Type"] = "application/json",
                    ["Host"] = "tahomalink.com",
                    ["Connection"] = "keep-alive",
                    ["Accept-Encoding"] = "gzip, deflate",
                    ["Accept"] = "*/*",
                    ["User-Agent"] = "Mozilla/5.0 (iPhone; CPU iPhone OS 12_2_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) FxiOS/98.0 Mobile/15E148 Safari/605.1.15",
                    ["Cookie"] = self.cookie
                },
                method = 'POST',
                data = '{"actions":[{"commands":[{"name":"' .. command .. '","parameters":[' .. tonumber(level)  .. ']}],"deviceURL":"' .. deviceUrl .. '"}], "label": "'.. label ..'"}'
            },
            success = function(response)
                --self:debug(reponse)
                if response.status == 401 then
                    self.retries = self.retries + 1
                    if self.retries <= 1 then
                        self:debug("Got a " .. response.status .. " status, need to reauthenticate!")
                        self:updateView("statusLabel", "text", label .. "reauth...")
                        self:Authenticate(function() self:SendCommand(deviceUrl, label, command, level, cookie) end)
                    elseif response.status == 400 then
                        self:updateView("statusLabel", "text", "error 400")
                        self:debug(json.encode(response))
                    else
                        self:debug("Tried 2 times, I think the password is incorrect!")
                    end
                else
                    self:updateView("statusLabel", "text", "ok")
                    self:debug(json.encode(response))
                end
            end
            ,
            error = function(message)
                self:updateView("statusLabel", "text", "error")
                self:debug("Error:", message)
            end 
        })    
end

function QuickApp:CreateChilds(initChildData)
    self:debug("Create child devices in the HC3...")
    local cdevs = api.get("/devices?parentId="..self.id) or {}
    if #cdevs == 0 then
        for _,c in ipairs(initChildData) do
            local child = self:createChildDevice(
                {
                    name = c.name,
                    type=c.type,
                    initialProperties = {},
                    initialInterfaces = {},
                },
                _G[c.className] -- Fetch class constructor from class name
            )
            child:setVariable("className", c.className)
            child:setVariable("deviceURL", c.deviceURL)
            child:updateProperty("manufacturer", "Somfy")
            local positions = json.decode("[{\"name\":\"MY\",\"label\":\"MY\",\"value\":123}]")
            child:updateProperty("favoritePositions", positions) 
            --child:self:updateProperty("deviceRole", "BlindsWithoutPositioning")
            child.parent = self
            self:debug("Child device " .. child.name .. " created with id: ", child.id)
        end
    else
        for _,child in ipairs(cdevs) do
            local className = getChildVariable(child,"className")
            local childObject = _G[className](child)
            self.childDevices[child.id]=childObject
            childObject.parent = self
        end
    end
end

function QuickApp:GetDevices()
    self:debug("Get the devices from the Tahoma Switch...")
    self.http:request('https://tahomalink.com/enduser-mobile-web/enduserAPI/setup/devices', {
            options = {
                headers = {
                    ["Content-Type"] = "application/x-www-form-urlencoded",
                    ["Host"] = "tahomalink.com",
                    ["Connection"] = "keep-alive",
                    ["Accept-Encoding"] = "gzip, deflate",
                    ["Accept"] = "*/*",
                    ["User-Agent"] = "Mozilla/5.0 (iPhone; CPU iPhone OS 12_2_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) FxiOS/98.0 Mobile/15E148 Safari/605.1.15",
                    ["Cookie"] = self.cookie
                },
                method = 'GET',
            },
            success = function(response)
                --self:debug(json.encode(response))
                local devicetable = json.decode(response.data,{others = {null=false}})
                local initChildData = {}
                for _,device in ipairs(devicetable) do
                    if (device.uiClass == "RollerShutter") or (device.uiClass == "ExteriorScreen") or (device.uiClass == "Screen") or (device.uiClass == "Awning") or (device.uiClass == "Pergola") or (device.uiClass == "GarageDoor") or (device.uiClass == "Window") or (device.uiClass == "VenetianBlind") or (device.uiClass == "ExteriorVenetianBlind") then
                        --and ((device["deviceURL"].startswith("io://")) or (device["deviceURL"].startswith("rts://")))):
                        self:debug("Found device: " .. device.label .. " - " .. device.uiClass .. " - " .. device.deviceURL)
                        -- Set up child table
                        initChildData[#initChildData+1]={name=device.label, className=device.uiClass, type="com.fibaro.rollerShutter",deviceURL=device.deviceURL}
                    end
                end
                self:CreateChilds(initChildData)
            end
            ,
            error = function(message)
                self:debug("error:", message)
            end 
        })
end

function QuickApp:refreshCookie()
    local expiry = self:getVariable("Expiry_Date")
    local now    = os.time(os.date("!*t"))
    if expiry - now < 0 then
        self:debug("Cookie expired, need to reauthenticate!")
        self:Authenticate()
    end

    local s = os.date("%S")
    local timeout = 3600000 - (s * 1000)
    fibaro.setTimeout(timeout, function() -- wait 1 hour
            self:refreshCookie()
        end)
end

function QuickApp:Authenticate(command)
    self:debug("Start authentication...")
    local userId = self:getVariable("userId")
    local userPassword = self:getVariable("userPassword")

    self.http:request('https://tahomalink.com/enduser-mobile-web/enduserAPI/login', {
            options = {
                headers = {
                    ["Content-Type"] = "application/x-www-form-urlencoded",
                    ["Host"] = "tahomalink.com",
                    ["Connection"] = "keep-alive",
                    ["Accept-Encoding"] = "gzip, deflate",
                    ["Accept"] = "*/*",
                    ["User-Agent"] = "Mozilla/5.0 (iPhone; CPU iPhone OS 12_2_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) FxiOS/98.0 Mobile/15E148 Safari/605.1.15"
                },
                data = "userId=" .. userId .. "&userPassword=" .. userPassword,
                method = 'POST',
            },
            success = function(response)
                --self:debug(json.encode(response))
                --self:debug(response.headers["Set-Cookie"])
                self:updateView("statusLabel", "text", "Cookie SET: " .. response.headers["Set-Cookie"]) 
                self:setVariable("Cookie", response.headers["Set-Cookie"])
                self.cookie = response.headers["Set-Cookie"]
                local fiveDaysLater = os.time(os.date("!*t"))+432000 -- current date/time + 5 days (cookie lifetime)
                self:setVariable("Expiry_Date", fiveDaysLater)
                if command then 
                    self:debug("Command received, run it now...")
                    command()
                end
            end
            ,
            error = function(message)
                self:debug("error:", message)
            end 
        })
end

function QuickApp:onInit()
    self:debug("QuickApp: Somfy initialisation...")
    self.childsInitialized = true
    self.retries = 0
    if not api.get("/devices/" .. self.id).enabled then
        self:warning("The Somfy integration is disabled!")
        return
    end
    if (self:getVariable("userId") == "none") then
        self:warning("Please set the userId Quick App variable first!")
        return
    end
    self.http = net.HTTPClient({ timeout = 5000 })
    self:Authenticate(function() self:GetDevices() end)
end