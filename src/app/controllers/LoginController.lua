--
-- Author: Pat Chen
-- Date: 2015-04-18 21:13:00
--
local LoginView = import("..views.LoginView")
local LoginModel = import("..models.LoginModel")

local controller = class("LoginController", function( ... )
	return display.newNode()
end)

function controller:ctor( ... )
	local loginModel = LoginModel.new({userID = '123456'})
	local loginView = LoginView.new(loginModel)
	self:addChild(loginView)
	loginModel:addEventListener(LoginModel.LOGIN_FETCH_BACK, handler(self, self.joinGame))
end

function controller:joinGame( ... )
	print("login controller receive fetch call back")
end

function controller:onExit( ... )
	-- body
end

return controller