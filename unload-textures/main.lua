local terevaka = require ( "terevaka.terevaka" ) 


MainScene = terevaka.TKScene:new () :init ()

function MainScene:init () 
   self.layer = terevaka.TKLayer: new() :init ()
   return self
end

function MainScene:onLoadScene () 
   -- loading sprite pack
   self.texturePack = terevaka.TKResourceManager.loadTexturePack ( 'main' ) 
   self.layer:fill ({ resourceName='main-layout', texturePack = self.texturePack })
   local openSecondScene = self.layer:findPropById ( 'pink_box' ) 
   openSecondScene.onTouch = function ( self, event ) 
      local app = MyApplication.getSharedApp () 
      app:replaceScene ( app.secondScene ) 
   end
end

function MainScene:onRemoveScene () 
   self.layer:clear () 
   self.texturePack:release () 
end

function MainScene:onTouch ( event ) 
   self:handleTouch ( self.layer, event ) 
end

function MainScene:getRenderTable () 
   return { self.layer:getMOAILayer ()}
end

SecondScene = terevaka.TKScene:new () 
function SecondScene:init () 
   self.layer = terevaka.TKLayer:new () :init ()
   return self
end

function SecondScene:onLoadScene () 
   -- loading sprite pack
   self.texturePack = terevaka.TKResourceManager.loadTexturePack ( 'main' ) 
   
   -- loading scene layer
   self.layer:fill ({ resourceName='second-layout', texturePack = self.texturePack }) 
end

function SecondScene:onRemoveScene () 
   self.layer:clear () 
   self.texturePack:release () 
end

function SecondScene:onTouch ( event ) 
   local app = terevaka.TKApplication:getSharedApp () 
   app:replaceScene ( app.mainScene ) 
end

function SecondScene:getRenderTable () 
   return { self.layer:getMOAILayer ()}
end

-- Creating my application
MyApplication = terevaka.TKApplication:new () 

function MyApplication:onCreate () 
   print ( 'onCreate' ) 
end

function MyApplication:onResume () 
   print ( 'onResume' ) 
end

local app = MyApplication:new () 
terevaka.TKApplication:setSharedApp ( app )  --   <-- call this if you want to access later to your application as a global variable

app.mainScene = MainScene:new () :init ()
app.secondScene = SecondScene:new () :init ()

app:initWithScene ( app.mainScene ) 
