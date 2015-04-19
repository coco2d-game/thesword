--
-- Author: Pat Chen
-- Date: 2015-04-18 21:28:22
--
local model = class("LoginModel", cc.mvc.ModelBase)

model.LOGIN_FETCH_BACK = "LOGIN_FETCH_BACK"

model.schema = clone(cc.mvc.ModelBase.schema)
model.schema["userName"] = {"string"}
model.schema["password"] = {"string"}

function model:ctor(properties)
	model.super.ctor(self, properties)--这里请不要用super:ctor方式调用
end

function model:fetch(account, password )
	printf("fetch accont: %s \n password: %s", account, password)
	self:fetchBack()
end

function model:fetchBack()
	printf("model fetch back")
	self:dispatchEvent({name = self.LOGIN_FETCH_BACK})
end

function model:onExit( ... )
	-- self:removeAllEventListeners()
end

return model