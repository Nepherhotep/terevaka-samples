local terevaka = require( "terevaka.terevaka" )
local terevaka = require( "terevaka.terevaka" )

MyApplication = terevaka.TKApplication:new ()

MainScene = terevaka.TKScene:new () :init ()

-- Creating main scene
function MainScene:init ()
   -- loading sprite pack
   self.texturePack = terevaka.TKResourceManager.loadDrawable ( 'main' )
   
   -- loading scene layer
   self.layer = terevaka.TKLayer:new () :init ()
   self.layer:fill ({ resourceName='main-layout', texturePack = self.texturePack })
   return self
end

function MainScene:getRenderTable ()
   return { self.layer:getMOAILayer ()}
end

local mainScene = MainScene:new () :init ()

-- Creating my application
function MyApplication:onCreate ()
   print ( 'onCreate' )
end

function MyApplication:onResume ()
   print ( 'onResume' )
end

local app = MyApplication:new () :initWithScene ( mainScene )
terevaka.TKApplication:setSharedApp ( app ) --   <-- call this if you want to access later to your application as a global variable

local prop = mainScene.layer:findPropById ( 'pink_box' )
prop:moveRot( 360, 1.5 )
