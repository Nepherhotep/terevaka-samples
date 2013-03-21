local terevaka = require("terevaka.terevaka")

MyApplication = terevaka.TKApplication:new()

function MyApplication:onCreate()
   print('onCreate')
end

function MyApplication:onResume()
   print('onResume')
end

local app = MyApplication:new()
terevaka.TKApplication:setSharedApp(app) --   <-- call this if you want to access later to your application as a global variable


MainScene = terevaka.TKScene:new()

function MainScene:init()
   -- loading sprite pack
   self.texturePack = terevaka.TKResourceManager.loadTexturePack('main')
   
   -- loading scene layer
   self.layer = MOAILayer2D.new()
   self:fillLayer({layer = self.layer, resourceName='main-layout', texturePack = self.texturePack})
end

function MainScene:getRenderTable()
   return {self.layer}
end

MOAIGfxDevice.setClearColor(0.7,0.7,0.70,1)
local mainScene = MainScene:new()
mainScene:init()

app:initWithScene(mainScene)
