local terevaka = require("terevaka.terevaka")

MyApplication = terevaka.TKApplication:new()

MainScene = terevaka.TKScene:new() :init ()

-- Creating main scene
function MainScene:init ()
   -- loading sprite pack
   self.texturePack = terevaka.TKResourceManager.loadDrawable('main')
   
   -- loading scene layer
   self.layer = terevaka.TKLayer:new () :init ()
   self.layer:fill ({ resourceName='main-layout', texturePack = self.texturePack })
   return self
end

function MainScene:onTouch(event)
   self:handleTouch(self.layer, event)
end

function MainScene:getRenderTable ()
   return { self.layer:getMOAILayer ()}
end

local mainScene = MainScene:new () :init ()

SecondScene = terevaka.TKScene:new () :init ()
-- Creating second scene
function SecondScene:init ()
   -- loading sprite pack
   self.texturePack = terevaka.TKResourceManager.loadDrawable('main')
   
   -- loading scene layer
   self.layer = terevaka.TKLayer:new () :init ()
   self.layer:fill ({ resourceName='second-layout', texturePack = self.texturePack })
   return self
end

function SecondScene:onTouch ( event )
   -- any touch switches to main scene
   local app = terevaka.TKApplication:getSharedApp ()
   app:replaceScene ( mainScene )
end

function SecondScene:getRenderTable ()
   return { self.layer:getMOAILayer ()}
end

local secondScene = SecondScene:new () :init ()


-- Creating my application
function MyApplication:onCreate ()
   print ( 'onCreate' )
end

function MyApplication:onResume ()
   print ( 'onResume' )
end

local app = MyApplication:new () :initWithScene ( mainScene )
terevaka.TKApplication:setSharedApp ( app ) --   <-- call this if you want to access later to your application as a global variable

local pinkBox = mainScene.layer:findPropById ( 'pink_box' )
pinkBox.onTouch = function ( self, event )
   app:replaceScene ( secondScene )
end
