
-- local loginView = require("app.views.LoginView")

local LoginController = import("..controllers.LoginController")
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
	local a = 10
	local pat = pat.PatClass:new()
	a = pat:addNumber(a)
	printInfo("PAT C++ to lua test: %s", a)
    -- cc.ui.UILabel.new({
    --         UILabelType = 2, text = "HelWorld--->", size = 64})
    --     :align(display.CENTER, display.cx, display.cy)
    --     :addTo(self)
    -- local loginLayer = app:createView("LoginView")
    -- self:addChild(loginLayer)
    self.login = LoginController.new()
    self:addChild(self.login)
end

function MainScene:onEnter()
end

function MainScene:onExit()
    self.removeChild(self.login)
end

return MainScene
