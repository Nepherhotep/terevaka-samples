local terevaka = require("terevaka.terevaka")

MyApplication = terevaka.TKApplication:new()

MainScene = terevaka.TKScene:new()

-- Creating main scene
function MainScene:init()
   -- loading sprite pack
   self.texturePack = terevaka.TKResourceManager.loadTexturePack('main')
   
   -- loading scene layer
   self.layer = MOAILayer2D.new()
   self:fillLayer({layer = self.layer, resourceName='main-layout', texturePack = self.texturePack})
end

function MainScene:onTouch(event)
   self:handleTouch(self.layer, event)
end

function MainScene:getRenderTable()
   return {self.layer}
end

local mainScene = MainScene:new()
mainScene:init()


SecondScene = terevaka.TKScene:new()
-- Creating second scene
function SecondScene:init()
   -- loading sprite pack
   self.texturePack = terevaka.TKResourceManager.loadTexturePack('main')
   
   -- loading scene layer
   self.layer = MOAILayer2D.new()
   self:fillLayer({layer = self.layer, resourceName='second-layout', texturePack = self.texturePack})
end

function SecondScene:onTouch(event)
   -- any touch switches to main scene
   local app = terevaka.TKApplication:getSharedApp()
   app:replaceScene(mainScene)
end

function SecondScene:getRenderTable()
   return {self.layer}
end

local secondScene = SecondScene:new()
secondScene:init()


-- Creating my application
function MyApplication:onCreate()
   print('onCreate')
end

function MyApplication:onResume()
   print('onResume')
end

local app = MyApplication:new()
terevaka.TKApplication:setSharedApp(app) --   <-- call this if you want to access later to your application as a global variable
app:initWithScene(mainScene)

local pinkBox = mainScene:findPropById('main-layout', 'pink_box')
pinkBox.onTouch = function(self, event)
   app:replaceScene(secondScene)
end
