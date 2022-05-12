local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local SPEED_MULTIPLIER = 30
local JUMP_POWER = 158
local JUMP_GAP = 0.3

local character = game.Players.LocalPlayer.Character

for i,v in ipairs(character:GetDescendants()) do
   if v:IsA("BasePart") then
       v.CanCollide = false
   end
end

local ball = character.HumanoidRootPart
--VVV skid VVV--
ignore=Instance.new("Folder",ball.Parent)
lazy=Instance.new("Model",ignore)
humz=Instance.new("Humanoid",lazy)
bruh=Instance.new("Part",lazy)
bruh.Name="Head"
bruh.Size=Vector3.new(0.001,0.001,0.001)
bruh.Anchored=true
lazy.Name="Ball Script V.1 - By 1mm0rtAl1ty @wewerweweqwews"
bruh.Transparency=0.99

--^^^ skid ^^^--
ball.Shape = Enum.PartType.Ball
ball.Transparency=0.9
ball.Size = Vector3.new(5,5,5)
ball.Material="Neon"

sz=Instance.new("Sound",ball)
sz.Name="Apply"
sz.SoundId="rbxassetid://12221944"
sz.Pitch=1.2
sz.Volume=2
sz:Play()
local humanoid = character:WaitForChild("Humanoid")
local params = RaycastParams.new()
params.FilterType = Enum.RaycastFilterType.Blacklist
params.FilterDescendantsInstances = {character}

local tc = RunService.RenderStepped:Connect(function(delta)
   ball.CanCollide = true
   humanoid.PlatformStand = true
if UserInputService:GetFocusedTextBox() then return end
if UserInputService:IsKeyDown("W") then
ball.RotVelocity -= Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER


end
if UserInputService:IsKeyDown("A") then
ball.RotVelocity -= Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER

end
if UserInputService:IsKeyDown("S") then
ball.RotVelocity += Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER
ball.BrickColor=BrickColor.new("Bright green")

end
if UserInputService:IsKeyDown("D") then
ball.RotVelocity += Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER

end
sz1=Instance.new("Sound",ball)
sz1.Name="pause"
sz1.SoundId="rbxassetid://12222054"
sz1.Pitch=1
sz1.Volume=2

sz2=Instance.new("Sound",ball)
sz2.Name="unpause"
sz2.SoundId="rbxassetid://12222054"
sz2.Pitch=1.1
sz2.Volume=2

if UserInputService:IsKeyDown("P") then
ball.Anchored=true
ball.BrickColor=BrickColor.new("Black")
sz1:Play()
else
ball.Anchored=false
ball.BrickColor=BrickColor.new("Bright blue")

end
ball.RotVelocity = ball.RotVelocity - Vector3.new(0,ball.RotVelocity.Y/50,0)
end)

UserInputService.JumpRequest:Connect(function()
local result = workspace:Raycast(
ball.Position,
Vector3.new(
0,
-((ball.Size.Y/2)+JUMP_GAP),
0
),
params
)
if result then
ball.Velocity = ball.Velocity + Vector3.new(0,JUMP_POWER,0)
ball.BrickColor=BrickColor.new("Cyan")
else wait(0.1)
ball.BrickColor=BrickColor.new("Bright blue")
end
end)
ball.BrickColor=BrickColor.new("Bright blue")
Camera.CameraSubject = ball
humanoid.Died:Connect(function() workspace.Gravity = 196.2 tc:Disconnect() end)
workspace.Gravity=60
rollsound=Instance.new("Sound",ball)
rollsound.SoundId="rbxassetid://22917014"
rollsound.Volume=1
rollsound.PlaybackSpeed=0
rollsound.Playing=true
rollsound.Looped=true
while task.wait() do
bruh.Position=ball.Position
bruh.CanCollide=false
rollsound.PlaybackSpeed = ball.Velocity.Magnitude * 0.035
end

