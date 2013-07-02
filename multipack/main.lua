local terevaka = require ( "terevaka.terevaka" )

MyApplication = terevaka.TKApplication:new ()

function MyApplication:onCreate ()
   print ( 'onCreate' )
end

function MyApplication:onResume ()
   print ( 'onResume' )
end

local app = MyApplication:new ()
terevaka.TKApplication:setSharedApp ( app ) --   <-- call this if you want to access later to your application as a global variable


MainScene = terevaka.TKScene:new ()

function MainScene:init ()
   -- loading sprite pack
   self.texturePack = terevaka.TKResourceManager.loadDrawable ( 'main' )
   
   -- loading scene layer
   self.layer = terevaka.TKLayer:new () :init ()
   self.layer:fill ({ resourceName='main-layout', texturePack = self.texturePack })
   self.layer:fill ({ resourceName='main-layout2', texturePack = self.texturePack })
   return self
end

function MainScene:getRenderTable ()
   return { self.layer:getMOAILayer ()}
end

local mainScene = MainScene:new () :init ()

app:initWithScene ( mainScene )
