repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local localPlayer = Players.LocalPlayer

-- Cấu hình thông tin GitHub của bạn
local GITHUB_USER = "vinhhello13"
local REPO_NAME = "bananacat"
local BRANCH = "main"

local BASE_URL = "https://raw.githubusercontent.com/" .. GITHUB_USER .. "/" .. REPO_NAME .. "/" .. BRANCH .. "/"
local KEY_URL = BASE_URL .. "keys.json"

-- 1. LẤY MÃ HWID THIẾT BỊ KHÁCH
local successHwid, hwid = pcall(function()
    return RbxAnalyticsService:GetClientId()
end)
hwid = successHwid and hwid or "UNKNOWN_HWID"

-- 2. XÁC THỰC KEY & HWID
local userKey = getgenv().Key

if not userKey or userKey == "" then
    localPlayer:Kick("[Banana Cat Hub]: Bạn chưa nhập Key!")
    return
end

local successKey, keyRaw = pcall(function()
    return game:HttpGet(KEY_URL)
end)

if not successKey then
    localPlayer:Kick("[Banana Cat Hub]: Lỗi kết nối máy chủ xác thực Key!")
    return
end

local keyData = HttpService:JSONDecode(keyRaw)

if not keyData[userKey] then
    localPlayer:Kick("[Banana Cat Hub]: Key không tồn tại hoặc đã hết hạn!")
    return
end

local clientInfo = keyData[userKey]

-- Kiểm tra khóa HWID (1 máy)
if clientInfo.HWID == "" then
    setclipboard(hwid)
    localPlayer:Kick("[Banana Cat Hub]: Key chưa gán máy! Mã HWID đã được copy: " .. hwid .. "\nVui lòng gửi mã này cho Admin để kích hoạt.")
    return
elseif clientInfo.HWID ~= hwid then
    localPlayer:Kick("[Banana Cat Hub]: Key này đã được đăng ký ở thiết bị khác!")
    return
end

print("[Banana Cat Hub]: Xác thực thành công! Đang tải game...")

-- 3. HỆ THỐNG ĐỊNH TUYẾN THEO GAME (GAME DETECTOR ROUTER)
local successUniverse, universeResponse = pcall(function()
    return game:HttpGet("https://apis.roblox.com/universes/v1/places/" .. game.PlaceId .. "/universe")
end)

local UniverseID = 0
if successUniverse then
    local parsed = HttpService:JSONDecode(universeResponse)
    UniverseID = parsed.universeId or 0
end

if game.PlaceId == 1537690962 or game.PlaceId == 4079902982 then
    if getgenv().betabss then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/hlamx/huhu/master/bssrewrite-obfuscated.lua"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BSS-BananaCat.lua"))()
    end
elseif game.PlaceId == 10260193230 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/Seahuhu-BananaCat.lua"))()
elseif game.PlaceId == 7449423635 or game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 122478697296975 or UniverseID == 994732206 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BF-BananaCat.lua"))()
elseif game.PlaceId == 4520749081 or game.PlaceId == 6381829480 or game.PlaceId == 15759515082 or game.PlaceId == 5931540094 then 
    repeat task.wait() until game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("DataLoaded") and game.Players.LocalPlayer:FindFirstChild("DataLoaded").Value
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/KL-BananaCat.lua"))()
elseif game.PlaceId == 18901165922 or game.PlaceId == 19006211286 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/PetsGo.lua"))()
elseif game.PlaceId == 16732694052 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Banana-Cat-Hub/main/Fisch.lua"))()
elseif UniverseID == 5844593548 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/AnimeReborn.lua"))()
elseif UniverseID == 6325068386 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/Bluelock.lua"))()
elseif UniverseID == 7074860883 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/Arise.lua"))()
elseif UniverseID == 7018190066 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/Bananacat-Deadrails.lua"))()
elseif UniverseID == 7436755782 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/GrowAGraden.lua"))()
elseif UniverseID == 7709344486 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/BananaCat-Brainrot.lua"))()
elseif UniverseID == 7671049560 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/theforge.lua"))()
elseif UniverseID == 9186719164 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/refs/heads/main/SailorPiece.lua"))()
elseif UniverseID == 4658598196 then 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TannyIsDeveloper/LittleTemplate/main/Banana-AOTR.lua"))()
elseif UniverseID == 10200395747 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tmuseAI/bnnc/refs/heads/main/gag2main.lua"))()
else
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/AV-BananaCat.lua"))()
end
