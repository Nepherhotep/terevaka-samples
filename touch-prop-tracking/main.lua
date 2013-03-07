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
   local prop = self.layer:getPartition():propForPoint(self.layer:wndToWorld(event.wndX, event.wndY))
   if prop then
      if prop.tap then
	 prop:tap(event)
      end
   end
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
prop.tap = function(self, event)
   self:moveRot( 360, 1.5 )
end