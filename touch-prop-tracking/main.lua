local terevaka = require ( "terevaka.terevaka" )

MyApplication = terevaka.TKApplication:new ()

MainScene = terevaka.TKScene:new () :init ()

-- Creating main scene
function MainScene:init ()
   -- loading sprite pack
   self.texturePack = terevaka.TKResourceManager.loadTexturePack ( 'main' )
   
   -- loading scene layer
   self.layer = terevaka.TKLayer:new () :init ()
   self.layer:fill ({ resourceName='main-layout', texturePack = self.texturePack })
end

function MainScene:onTouch ( event )
   self:handleTouch ( self.layer, event )
end

function MainScene:getRenderTable ()
   return { self.layer:getMOAILayer ()}
end

local mainScene = MainScene:new ()
mainScene:init ()

-- Creating my application
function MyApplication:onCreate ()
   print ( 'onCreate' )
end

function MyApplication:onResume ()
   print ( 'onResume' )
end

local app = MyApplication:new ()
terevaka.TKApplication:setSharedApp ( app ) --   <-- call this if you want to access later to your application as a global variable
app:initWithScene ( mainScene )

local pinkBox = mainScene.layer:findPropById ( 'pink_box' )
pinkBox.onTouch = function ( self, event )
   self:moveRot (  -180, 1.5 )
end

local greenBox = mainScene.layer:findPropById ( 'green_box' )
greenBox.onTouch = function ( self, event )
   self:moveRot (  180, 1.5 )
end

local blueBox = mainScene.layer:findPropById ( 'blue_box' )
blueBox.onTouch = function ( self, event )
   self:moveRot (  -360, 1.5 )
end

local brownBox = mainScene.layer:findPropById ( 'brown_box' )
brownBox.onTouch = function ( self, event )
   self:moveRot (  360, 1.5 )
end
