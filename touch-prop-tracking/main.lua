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
   self:moveRot( -180, 1.5 )
end

local greenBox = mainScene:findPropById('main-layout', 'green_box')
greenBox.onTouch = function(self, event)
   self:moveRot( 180, 1.5 )
end

local blueBox = mainScene:findPropById('main-layout', 'blue_box')
blueBox.onTouch = function(self, event)
   self:moveRot( -360, 1.5 )
end

local brownBox = mainScene:findPropById('main-layout', 'brown_box')
brownBox.onTouch = function(self, event)
   self:moveRot( 360, 1.5 )
end
