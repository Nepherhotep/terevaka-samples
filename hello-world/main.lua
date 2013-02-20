local terevaka = require("terevaka.terevaka")

MyApplication = terevaka.TKApplication:new()

function MyApplication:onCreate()

end

function MyApplication:onStart()

end

function MyApplication:onResume()

end


local app = MyApplication:new()
terevaka.TKApplication:setSharedApp(app) --   <-- call this if you want to access later to your application as a global variable
app:initWithScene(game_scene.GameScene:new())
