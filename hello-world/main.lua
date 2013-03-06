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
   self:fillLayer(self.layer, 'main-layout', self.texturePack)
end

function MainScene:getRenderTable()
   return {self.layer}
end

local mainScene = MainScene:new()
mainScene:init()

app:initWithScene(mainScene)
