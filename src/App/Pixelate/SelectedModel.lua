local Selection = game:GetService("Selection")

local React = require(script.Parent.Parent.Parent.Libs.React)

local function getSelectedModel()
	local selectedInstances = Selection:Get()

	for _, instance in selectedInstances do
		if instance:IsA("Model") then
			return instance
		end
	end

	return
end

return function()
	local selectedModel, setSelectedModel = React.createBinding(nil)

	React.useEffect(function()
		setSelectedModel(getSelectedModel())

		local conn
		conn = Selection.SelectionChanged:Connect(function()
			setSelectedModel(getSelectedModel())
		end)

		return function()
			conn:Disconnect()
		end
	end, {})

	return React.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 20),

		BackgroundTransparency = 1,
		BorderSizePixel = 0,
	}, {
		Icon = React.createElement("ImageLabel", {
			Size = UDim2.fromOffset(16, 16),

			BackgroundTransparency = 1,
			BorderSizePixel = 0,

			Image = "http://www.roblox.com/asset/?id=16095964287",
		}),

		ModelName = React.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 25, 0.5, 0),
			Size = UDim2.new(1, -25, 0, 16),

			BackgroundTransparency = 1,
			BorderSizePixel = 0,

			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			Text = selectedModel:map(function(value)
				return value and value.Name or "Nothing selected"
			end),
			TextColor3 = Color3.fromRGB(167, 167, 167),
			TextSize = 14,
			TextXAlignment = Enum.TextXAlignment.Left,
		}),
	})
end
