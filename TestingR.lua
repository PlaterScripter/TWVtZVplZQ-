local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
if script:IsA("LocalScript") then
    local player = Players.LocalPlayer
    local gui = Instance.new("ScreenGui")
    gui.Name = "PlaterMenu"
    gui.Parent = player:WaitForChild("PlayerGui")
    local frame = Instance.new("Frame")
    frame.Name = "MainFrame"
    frame.Size = UDim2.new(0, 0, 0, 0) -- Start small (for animation)
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    frame.BackgroundTransparency = 0.3
    frame.ClipsDescendants = true
    frame.Parent = gui

    -- Corner rounding
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = frame
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Text = "Plater's Testing Script"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.Parent = frame
    local buttons = {
        "Test Feature 1",
        "Test Feature 2",
        "Close Menu"
    }

    local buttonInstances = {}

    for i, buttonText in ipairs(buttons) do
        local button = Instance.new("TextButton")
        button.Name = buttonText
        button.Text = buttonText
        button.Font = Enum.Font.Gotham
        button.TextSize = 16
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        button.AutoButtonColor = true
        button.Size = UDim2.new(0.8, 0, 0, 40)
        button.Position = UDim2.new(0.1, 0, 0.2 + (i * 0.15), 0)
        button.Parent = frame

        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 8)
        buttonCorner.Parent = button
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(80, 80, 100)
            }):Play()
        end)

        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(60, 60, 80)
            }):Play()
        end)
        if buttonText == "Close Menu" then
            button.MouseButton1Click:Connect(function()
                TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                    Size = UDim2.new(0, 0, 0, 0)
                }):Play()
                task.wait(0.5)
                gui:Destroy()
            end)
        else
            button.MouseButton1Click:Connect(function()
                print(buttonText .. " clicked!")
            end)
        end

        table.insert(buttonInstances, button)
    end
    TweenService:Create(frame, TweenInfo.new(0.7, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 300, 0, 300)
    }):Play()
end

-- Credits to PlaterScripter lol
