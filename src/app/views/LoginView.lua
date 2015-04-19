--
-- Author: Pat Chen
-- Date: 2015-04-17 22:05:56
--
local view = class("LoginView",function()
	return display.newNode()
	-- body
end)
local model = nil
function view:ctor(model)
    local cls = model.class
	self.model = model
    self.model:addEventListener(cls.LOGIN_FETCH_BACK, handler(self, self.onFetchBack))
    -- cc.EventProxy.new(model, self)
    --     :addEventListener(cls.LOGIN_FETCH_BACK, handler(self, self.onFetchBack))
	self:onEnter()
end

function view:onEnter()
	local layerColor = CCLayerColor:create(cc.c4b(100, 0, 100, 100), display.width, display.height)
    self:addChild(layerColor)
    local account = "请输入您的账号"
    local pwd = "请输入您的密码"
    
    local szEditBox = cc.size(360, 50)
    local ptEditBox = cc.pAdd(cc.p(display.cx, display.cy), cc.p(0, 100))
    local editBox = cc.ui.UIInput.new({
        image = "EditBoxBg.png",
        imagePressed = "EditBoxBg.png",
    	imageDisabled = "EditBoxBg.png",
        size = szEditBox,
        x = ptEditBox.x,
        y = ptEditBox.y,
        listener = function(event, editbox)
            if event == "began" then
                self:onEditBoxBegan(editbox)
            elseif event == "ended" then
                self:onEditBoxEnded(editbox)
            elseif event == "return" then
                self:onEditBoxReturn(editbox)
            elseif event == "changed" then
                self:onEditBoxChanged(editbox)
            else
                printf("EditBox event %s", tostring(event))
            end
        end
    })
    editBox:setPlaceHolder(account)
    -- editBox:setPlaceholderFontColor(cc.c3b(250, 0, 0))
    editBox:setMaxLength(12)
    -- editBox:setInputMode(kEditBoxInputModeAny)
    -- editBox:setReturnType(kKeyboardReturnTypeDone)
    self:addChild(editBox)
    -- self.m_edtAccount = editBox
    
    ptEditBox = cc.pAdd(cc.p(display.cx, display.cy), cc.p(0, 30))
    local peditBox = cc.ui.UIInput.new({
        image = "EditBoxBg.png",
        size = szEditBox,
        x = ptEditBox.x,
        y = ptEditBox.y,
        listener = function(event, editbox)
            if event == "began" then
                self:onEditBoxBegan(editbox)
            elseif event == "ended" then
                self:onEditBoxEnded(editbox)
            elseif event == "return" then
                self:onEditBoxReturn(editbox)
            elseif event == "changed" then
                self:onEditBoxChanged(editbox)
            else
                printf("EditBox event %s", tostring(event))
            end
        end
    })
    peditBox:setPlaceHolder(pwd)
    peditBox:setMaxLength(12)
    peditBox:setInputFlag(0)
    self:addChild(peditBox)

    local accountBg = CCLayerColor:create(cc.c4b(100, 100, 200, 200), szEditBox.width, szEditBox.height)
    accountBg:setPosition(cc.pSub(cc.p(editBox:getPosition()), cc.p(editBox:getContentSize().width/2, editBox:getContentSize().height/2)))
    self:addChild(accountBg, -1)
    
    local cipherBg = CCLayerColor:create(cc.c4b(100, 100, 200, 200), szEditBox.width, szEditBox.height)
    cipherBg:setPosition(cc.pSub(cc.p(peditBox:getPosition()), cc.p(peditBox:getContentSize().width/2, peditBox:getContentSize().height/2)))
    self:addChild(cipherBg, -1)

    local PUSH_BUTTON_IMAGES = {
        normal = nil,
        pressed = nil,
        disabled = nil,
    }
    local btnLogin = cc.ui.UIPushButton.new(PUSH_BUTTON_IMAGES, {scale9 = true})
    btnLogin:setAnchorPoint(0.5, 0.5)
    btnLogin:setPosition(cc.pSub(cc.p(display.cx, display.cy), cc.p(80, 60)))
    btnLogin:setButtonLabel("normal", cc.ui.UILabel.new({
        UILabelType = cc.ui.UILabel.LABEL_TYPE_TTF,
        text = "登陆",
        fontName = "Arial",
        size = 30
    }))
    btnLogin:onButtonClicked(handler(self, self.onBtn_Login))
    self:addChild(btnLogin)


end

-- 登陆按钮
function view:onBtn_Login(event)
    -- self:joinGame()
    self.model:fetch();
end

function view:onFetchBack( ... )
    print("login view receive fetch back;")
end

function view:onExit()
    local cls = self.model.class
	self.model.removeEventListener(cls.LOGIN_FETCH_BACK)
end

function view:onEditBoxBegan(editBox)
	-- body
end
function view:onEditBoxEnded(editBox)
	-- body
end
function view:onEditBoxReturn(editBox)
	-- body
end
function view:onEditBoxChanged(editBox)
	-- body
end

return  view