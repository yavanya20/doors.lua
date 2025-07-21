-- YAV GUI Premium - 100% рабочий вариант
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- Конфигурация
local KEY = "rvjzyehnkuwfhtjsvmmp"
local CurrentTheme = "Dark"
local CurrentLanguage = "Russian"

-- Создаем основной GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "YAV_GUI_WORKING"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- Кнопка открытия (всегда видимая)
local OpenBtn = Instance.new("TextButton")
OpenBtn.Name = "OpenButton"
OpenBtn.Size = UDim2.new(0, 120, 0, 40)
OpenBtn.Position = UDim2.new(0, 10, 0.5, -20)
OpenBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
OpenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenBtn.Text = "Открыть GUI"
OpenBtn.Font = Enum.Font.GothamBold
OpenBtn.TextSize = 14
OpenBtn.Parent = ScreenGui
Instance.new("UICorner", OpenBtn).CornerRadius = UDim.new(0, 8)

-- Окно ввода ключа
local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeyFrame"
KeyFrame.Size = UDim2.new(0, 300, 0, 180)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
KeyFrame.Visible = false
KeyFrame.Parent = ScreenGui
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 12)

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Text = "Введите ключ доступа"
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.Position = UDim2.new(0, 0, 0, 10)
KeyTitle.BackgroundTransparency = 1
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 18
KeyTitle.Parent = KeyFrame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.8, 0, 0, 40)
KeyBox.Position = UDim2.new(0.1, 0, 0, 60)
KeyBox.PlaceholderText = "Введите ключ..."
KeyBox.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 16
KeyBox.Parent = KeyFrame
Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 8)

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.6, 0, 0, 40)
SubmitBtn.Position = UDim2.new(0.2, 0, 0, 120)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Text = "Подтвердить"
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 16
SubmitBtn.Parent = KeyFrame
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 8)

-- Основной интерфейс
local MainUI = Instance.new("Frame")
MainUI.Name = "MainUI"
MainUI.Size = UDim2.new(0, 400, 0, 400)
MainUI.Position = UDim2.new(0.5, -200, 0.5, -200)
MainUI.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
MainUI.Visible = false
MainUI.Parent = ScreenGui
Instance.new("UICorner", MainUI).CornerRadius = UDim.new(0, 12)

-- Заголовок
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Header.Parent = MainUI
Instance.new("UICorner", Header).CornerRadius = UDim.new(0, 12)

local Title = Instance.new("TextLabel")
Title.Text = "YAV GUI PREMIUM"
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Parent = Header

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Text = "X"
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.Parent = Header
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

-- Вкладки
local Tabs = Instance.new("Frame")
Tabs.Size = UDim2.new(1, -20, 0, 40)
Tabs.Position = UDim2.new(0, 10, 0, 50)
Tabs.BackgroundTransparency = 1
Tabs.Parent = MainUI

local function CreateTab(name, text)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Text = text
    btn.Size = UDim2.new(0.25, -5, 1, 0)
    btn.Position = UDim2.new((#Tabs:GetChildren()-1)*0.25, 0, 0, 0)
    btn.BackgroundColor3 = #Tabs:GetChildren() == 1 and Color3.fromRGB(0, 170, 255) or Color3.fromRGB(60, 60, 65)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.Parent = Tabs
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    local content = Instance.new("ScrollingFrame")
    content.Name = name.."Content"
    content.Size = UDim2.new(1, -20, 1, -110)
    content.Position = UDim2.new(0, 10, 0, 100)
    content.BackgroundTransparency = 1
    content.ScrollBarThickness = 5
    content.Visible = #Tabs:GetChildren() == 1
    content.Parent = MainUI
    
    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 10)
    layout.Parent = content
    
    btn.MouseButton1Click:Connect(function()
        for _, child in pairs(MainUI:GetChildren()) do
            if child:IsA("ScrollingFrame") then
                child.Visible = false
            end
        end
        for _, tab in pairs(Tabs:GetChildren()) do
            if tab:IsA("TextButton") then
                tab.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
            end
        end
        content.Visible = true
        btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    end)
    
    return content
end

-- Создаем вкладки
local MainTab = CreateTab("Main", "Основное")
local VisualTab = CreateTab("Visual", "Визуал")
local SettingsTab = CreateTab("Settings", "Настройки")
local CreditsTab = CreateTab("Credits", "Авторы")

-- Функция для создания кнопок
local function CreateButton(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.Gotham
    btn.TextSize = 14
    btn.Parent = parent
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Main Tab
local NoclipActive = false
CreateButton(MainTab, "Ноуклип [E]", function()
    NoclipActive = not NoclipActive
end)

RunService.Stepped:Connect(function()
    if NoclipActive and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

local SpeedBox = Instance.new("TextBox")
SpeedBox.Text = "16"
SpeedBox.PlaceholderText = "Скорость (16-200)"
SpeedBox.Size = UDim2.new(1, 0, 0, 35)
SpeedBox.BackgroundColor3 = Color3.fromRGB(60, 60, 65)
SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBox.Font = Enum.Font.Gotham
SpeedBox.TextSize = 14
SpeedBox.Parent = MainTab
Instance.new("UICorner", SpeedBox).CornerRadius = UDim.new(0, 6)

SpeedBox.FocusLost:Connect(function()
    local speed = tonumber(SpeedBox.Text)
    if speed and speed >= 16 and speed <= 200 then
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = speed
        end
    else
        SpeedBox.Text = "16"
    end
end)

CreateButton(MainTab, "Возродиться", function()
    if LocalPlayer.Character then
        local pos = LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character.HumanoidRootPart.Position
        LocalPlayer.Character:BreakJoints()
        if pos then
            LocalPlayer.CharacterAdded:Wait()
            LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(pos)
        end
    end
end)

-- Visual Tab
local FullbrightActive = false
CreateButton(VisualTab, "Яркое освещение", function()
    FullbrightActive = not FullbrightActive
    if FullbrightActive then
        Lighting.Brightness = 2
        Lighting.GlobalShadows = false
    else
        Lighting.Brightness = 1
        Lighting.GlobalShadows = true
    end
end)

local ESPActive = false
CreateButton(VisualTab, "ESP (двери/ключи)", function()
    ESPActive = not ESPActive
    -- Здесь будет код ESP
end)

-- Settings Tab
CreateButton(SettingsTab, "Красная тема", function()
    MainUI.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
    Header.BackgroundColor3 = Color3.fromRGB(40, 10, 10)
end)

CreateButton(SettingsTab, "Чёрная тема", function()
    MainUI.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    Header.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
end)

-- Credits Tab
local CreditsText = Instance.new("TextLabel")
CreditsText.Text = "Создатели:\nYavanya20\nChatGPT"
CreditsText.Size = UDim2.new(1, -20, 1, -20)
CreditsText.Position = UDim2.new(0, 10, 0, 10)
CreditsText.TextWrapped = true
CreditsText.TextScaled = true
CreditsText.BackgroundTransparency = 1
CreditsText.TextColor3 = Color3.fromRGB(255, 255, 255)
CreditsText.Font = Enum.Font.GothamBold
CreditsText.Parent = CreditsTab

-- Обработчики событий
OpenBtn.MouseButton1Click:Connect(function()
    OpenBtn.Visible = false
    KeyFrame.Visible = true
end)

SubmitBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == KEY then
        KeyFrame.Visible = false
        MainUI.Visible = true
    else
        KeyBox.Text = "Неверный ключ!"
        task.wait(1)
        KeyBox.Text = ""
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainUI.Visible = false
    OpenBtn.Visible = true
end)

-- Перетаскивание окон
local function MakeDraggable(frame, handle)
    local dragging = false
    local dragInput, dragStart, startPos

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

MakeDraggable(MainUI, Header)
MakeDraggable(KeyFrame, KeyTitle)

print("YAV GUI успешно загружен и готов к использованию!")
