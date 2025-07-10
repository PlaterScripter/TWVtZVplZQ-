-- Infinite Stamina GUI for Forsaken
-- Client-side script by Plater

local Player = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

-- Create main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "InfiniteStaminaGUI"
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 8)
Corner.Parent = MainFrame

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Position = UDim2.new(0.15, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Infinite Stamina"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = TitleBar

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -30, 0, 0)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 14
MinimizeButton.Parent = TitleBar

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 8)
MinimizeCorner.Parent = MinimizeButton

-- Content
local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -20, 1, -50)
Content.Position = UDim2.new(0, 10, 0, 40)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(1, 0, 0, 40)
ToggleButton.Position = UDim2.new(0, 0, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = "Infinite Stamina: OFF"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.Gotham
ToggleButton.TextSize = 14
ToggleButton.Parent = Content

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 6)
ToggleCorner.Parent = ToggleButton

local Credits = Instance.new("TextLabel")
Credits.Name = "Credits"
Credits.Size = UDim2.new(1, 0, 0, 20)
Credits.Position = UDim2.new(0, 0, 1, -20)
Credits.BackgroundTransparency = 1
Credits.Text = "Created by Plater"
Credits.TextColor3 = Color3.fromRGB(150, 150, 150)
Credits.Font = Enum.Font.Gotham
Credits.TextSize = 12
Credits.Parent = Content

local MinimizedFrame = Instance.new("Frame")
MinimizedFrame.Name = "MinimizedFrame"
MinimizedFrame.Size = UDim2.new(0, 50, 0, 30)
MinimizedFrame.Position = UDim2.new(0, 20, 0, 20)
MinimizedFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MinimizedFrame.BorderSizePixel = 0
MinimizedFrame.Visible = false
MinimizedFrame.Parent = ScreenGui

local MinimizedCorner = Instance.new("UICorner")
MinimizedCorner.CornerRadius = UDim.new(0, 8)
MinimizedCorner.Parent = MinimizedFrame

local MinimizedText = Instance.new("TextLabel")
MinimizedText.Name = "MinimizedText"
MinimizedText.Size = UDim2.new(1, 0, 1, 0)
MinimizedText.BackgroundTransparency = 1
MinimizedText.Text = "IS"
MinimizedText.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizedText.Font = Enum.Font.GothamBold
MinimizedText.TextSize = 14
MinimizedText.Parent = MinimizedFrame

local Notification = Instance.new("Frame")
Notification.Name = "Notification"
Notification.Size = UDim2.new(0, 300, 0, 60)
Notification.Position = UDim2.new(0.5, -150, 0, 20)
Notification.AnchorPoint = Vector2.new(0.5, 0)
Notification.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Notification.BorderSizePixel = 0
Notification.Visible = false
Notification.Parent = ScreenGui

local NotificationCorner = Instance.new("UICorner")
NotificationCorner.CornerRadius = UDim.new(0, 8)
NotificationCorner.Parent = Notification

local NotificationText = Instance.new("TextLabel")
NotificationText.Name = "NotificationText"
NotificationText.Size = UDim2.new(1, -20, 1, -20)
NotificationText.Position = UDim2.new(0, 10, 0, 10)
NotificationText.BackgroundTransparency = 1
NotificationText.Text = "For unminimize click Shift and Alt, for mobiles, tap the screen three times fastly"
NotificationText.TextColor3 = Color3.fromRGB(255, 255, 255)
NotificationText.Font = Enum.Font.Gotham
NotificationText.TextSize = 12
NotificationText.TextWrapped = true
NotificationText.Parent = Notification

local isMinimized = false
local isEnabled = false
local mobileTapCount = 0
local lastTapTime = 0

local function enableInfiniteStamina()
    isEnabled = true
    ToggleButton.Text = "Infinite Stamina: ON"
    ToggleButton.BackgroundColor3 = Color3.fromRGB(80, 180, 80)
    
    local character = Player.Character or Player.CharacterAdded:Wait()
    
    if character:FindFirstChild("Stamina") then
        character.Stamina.Value = 100 -- Set to max
        character.Stamina:GetPropertyChangedSignal("Value"):Connect(function()
            if isEnabled then
                character.Stamina.Value = 100
            end
        end)
    end
    
    local humanoid = character:WaitForChild("Humanoid")
    if humanoid:FindFirstChild("Stamina") then
        humanoid.Stamina.Value = humanoid.MaxStamina
        humanoid:GetPropertyChangedSignal("Stamina"):Connect(function()
            if isEnabled then
                humanoid.Stamina = humanoid.MaxStamina
            end
        end)
    end
end

local function disableInfiniteStamina()
    isEnabled = false
    ToggleButton.Text = "Infinite Stamina: OFF"
    ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
end

ToggleButton.MouseButton1Click:Connect(function()
    if isEnabled then
        disableInfiniteStamina()
    else
        enableInfiniteStamina()
    end
end)

MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = true
    MainFrame.Visible = false
    MinimizedFrame.Visible = true
    
    Notification.Visible = true
    wait(5)
    Notification.Visible = false
end)

local function unminimize()
    isMinimized = false
    MainFrame.Visible = true
    MinimizedFrame.Visible = false
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if isMinimized and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) then
        unminimize()
    end
end)

UserInputService.TouchStarted:Connect(function()
    if not isMinimized then return end
    
    local currentTime = tick()
    if currentTime - lastTapTime < 0.5 then
        mobileTapCount = mobileTapCount + 1
    else
        mobileTapCount = 1
    end
    lastTapTime = currentTime
    
    if mobileTapCount >= 3 then
        unminimize()
        mobileTapCount = 0
    end
end)

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
