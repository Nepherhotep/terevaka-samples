local terevaka = require("terevaka.terevaka")

MyApplication = terevaka.TKApplication:new()

MainScene = terevaka.TKScene:new()

-- Creating main scene
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

local prop = mainScene:findPropById('main-layout', 'pink_box')
prop:moveRot( 360, 1.5 )