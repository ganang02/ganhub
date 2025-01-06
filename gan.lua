-- Script Fisch Helper by Gann
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- URL Backend (sesuaikan dengan backend Anda)
local backendURL = "http:api.script.ganangramadhan.my.id"

-- Key Validasi
local isKeyValid = false

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local SubmitButton = Instance.new("TextButton")
local AutoFarmButton = Instance.new("TextButton")
local AutoShakeButton = Instance.new("TextButton")
local AutoFishButton = Instance.new("TextButton")
local AutoSellButton = Instance.new("TextButton")
local TeleportButton = Instance.new("TextButton")

-- GUI Properties
ScreenGui.Parent = game.CoreGui

MainFrame.BackgroundColor3 = Color3.fromRGB(34, 45, 34)
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.Parent = ScreenGui

Title.Text = "Gann Hub"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(0, 128, 0)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Parent = MainFrame

KeyInput.PlaceholderText = "Enter your key"
KeyInput.Font = Enum.Font.SourceSans
KeyInput.TextSize = 18
KeyInput.Size = UDim2.new(0.8, 0, 0.1, 0)
KeyInput.Position = UDim2.new(0.1, 0, 0.15, 0)
KeyInput.Parent = MainFrame

SubmitButton.Text = "Submit Key"
SubmitButton.Size = UDim2.new(0.8, 0, 0.1, 0)
SubmitButton.Position = UDim2.new(0.1, 0, 0.3, 0)
SubmitButton.Parent = MainFrame

AutoFarmButton.Text = "Auto Farm"
AutoFarmButton.Size = UDim2.new(0.8, 0, 0.1, 0)
AutoFarmButton.Position = UDim2.new(0.1, 0, 0.45, 0)
AutoFarmButton.Parent = MainFrame

AutoShakeButton.Text = "Auto Shake"
AutoShakeButton.Size = UDim2.new(0.8, 0, 0.1, 0)
AutoShakeButton.Position = UDim2.new(0.1, 0, 0.55, 0)
AutoShakeButton.Parent = MainFrame

AutoFishButton.Text = "Auto Fish"
AutoFishButton.Size = UDim2.new(0.8, 0, 0.1, 0)
AutoFishButton.Position = UDim2.new(0.1, 0, 0.65, 0)
AutoFishButton.Parent = MainFrame

AutoSellButton.Text = "Auto Sell"
AutoSellButton.Size = UDim2.new(0.8, 0, 0.1, 0)
AutoSellButton.Position = UDim2.new(0.1, 0, 0.75, 0)
AutoSellButton.Parent = MainFrame

TeleportButton.Text = "Teleport"
TeleportButton.Size = UDim2.new(0.8, 0, 0.1, 0)
TeleportButton.Position = UDim2.new(0.1, 0, 0.85, 0)
TeleportButton.Parent = MainFrame

-- Fungsi Get Key
SubmitButton.MouseButton1Click:Connect(function()
    local key = KeyInput.Text
    if key == "" then
        Title.Text = "Please enter a key!"
        return
    end

    local success, response = pcall(function()
        return HttpService:PostAsync(
            backendURL .. "/validate-key",
            HttpService:JSONEncode({ key = key }),
            Enum.HttpContentType.ApplicationJson
        )
    end)

    if success then
        local data = HttpService:JSONDecode(response)
        if data.valid then
            Title.Text = "Key Valid! Enjoy the features."
            isKeyValid = true
        else
            Title.Text = "Invalid Key!"
        end
    else
        Title.Text = "Error connecting to server."
    end
end)

-- Fitur Auto Farm
AutoFarmButton.MouseButton1Click:Connect(function()
    if isKeyValid then
        spawn(function()
            while isKeyValid do
                wait(1)
                -- Logika Auto Farm
                print("Farming...")
            end
        end)
    else
        Title.Text = "Key invalid!"
    end
end)

-- Fitur Auto Shake
AutoShakeButton.MouseButton1Click:Connect(function()
    if isKeyValid then
        spawn(function()
            while isKeyValid do
                wait(0.5)
                -- Logika Auto Shake
                print("Shaking...")
            end
        end)
    else
        Title.Text = "Key invalid!"
    end
end)

-- Fitur Auto Fish
AutoFishButton.MouseButton1Click:Connect(function()
    if isKeyValid then
        spawn(function()
            while isKeyValid do
                wait(2)
                -- Logika Auto Fish
                print("Fishing...")
            end
        end)
    else
        Title.Text = "Key invalid!"
    end
end)

-- Fitur Auto Sell
AutoSellButton.MouseButton1Click:Connect(function()
    if isKeyValid then
        spawn(function()
            while isKeyValid do
                wait(3)
                -- Logika Auto Sell
                print("Selling...")
            end
        end)
    else
        Title.Text = "Key invalid!"
    end
end)

-- Fitur Teleport
TeleportButton.MouseButton1Click:Connect(function()
    if isKeyValid then
        local targetPosition = Vector3.new(0, 100, 0) -- Ubah koordinat sesuai kebutuhan
        LocalPlayer.Character:MoveTo(targetPosition)
        print("Teleporting to", targetPosition)
    else
        Title.Text = "Key invalid!"
    end
end)
