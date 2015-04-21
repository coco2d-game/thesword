--
-- Author: Pat Chen
-- Date: 2015-04-19 17:47:29
--
--游戏虚拟控制面板

local controller = class("GameController", function( ... )
	return display.newLayer()
	-- body
end)

function controller:ctor( ... )
	local label = cc.ui.UILabel.new({
		UILabelType = cc.ui.UILabel.LABEL_TYPE_TTF,
        text = "Game controller",
        fontName = "Arial",
        size = 30
	})
	label:setPosition(cc.p(display.cx/2, display.bottom+50))
	self:addChild(label)
	self.registryController()
end

function controller:onExit( ... )
	-- body
end

function controller:registryController( ... )
	-- body
	self._listener = cc.EventListenerController:create()
end
-- "C:\Windows\SysWOW64\wscript"
return controller