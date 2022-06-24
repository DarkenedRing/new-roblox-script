local UserInputService = game:GetService("UserInputService")


-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local MainWindow = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local UIGridLayout = Instance.new("UIGridLayout")
local Lol = Instance.new("Frame")
local TextLabel_2 = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainWindow.Name = "MainWindow"
MainWindow.Parent = ScreenGui
MainWindow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainWindow.BackgroundTransparency = 1.000
MainWindow.BorderSizePixel = 0
MainWindow.Position = UDim2.new(0.143121526, 0, 0.211845085, 0)
MainWindow.Size = UDim2.new(0, 200, 0, 400)

TopBar.Name = "TopBar"
TopBar.Parent = MainWindow
TopBar.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(0, 200, 0, 30)

TextLabel.Parent = TopBar
TextLabel.AnchorPoint = Vector2.new(0.100000001, 0)
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.100000001, 0, 0, 0)
TextLabel.Size = UDim2.new(0.400000006, 0, 1, 0)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "Main"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

ImageButton.Parent = TopBar
ImageButton.AnchorPoint = Vector2.new(1, 0)
ImageButton.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
ImageButton.Position = UDim2.new(1, 0, 0, 0)
ImageButton.Size = UDim2.new(0.144999996, 0, 1, 0)
ImageButton.Image = "rbxassetid://3192533593"

UICorner.CornerRadius = UDim.new(0, 20)
UICorner.Parent = ImageButton

UIGridLayout.Parent = MainWindow
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 5, 0, 0)
UIGridLayout.CellSize = UDim2.new(1, 0, 0, 30)

Lol.Name = "Lol"
Lol.Parent = MainWindow
Lol.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
Lol.BorderSizePixel = 0
Lol.Size = UDim2.new(0, 200, 0, 30)

TextLabel_2.Parent = Lol
TextLabel_2.AnchorPoint = Vector2.new(0.100000001, 0)
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.100000001, 0, 0, 0)
TextLabel_2.Size = UDim2.new(0.400000006, 0, 1, 0)
TextLabel_2.Font = Enum.Font.Gotham
TextLabel_2.Text = "Lol"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 14.000
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

TextButton.Parent = Lol
TextButton.AnchorPoint = Vector2.new(0.980000019, 0.5)
TextButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.980000019, 0, 0.5, 0)
TextButton.Size = UDim2.new(0.300000012, 0, 0.699999988, 0)
TextButton.Font = Enum.Font.Gotham
TextButton.Text = "Disabled"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 10.000
TextButton.TextWrapped = true


--------------------------------------------------------------------


local gui = MainWindow

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
	local delta = input.Position - dragStart
	gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

gui.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = gui.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

gui.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		if gui.Visible then
			update(input)
		end
	end
end)

TextButton.AutoButtonColor = false
