local React = require(script.Parent.Parent.Parent.Libs.React)

return function(props)
	return React.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),

		BackgroundTransparency = 1,
		BorderSizePixel = 0,
	}, {
		UIListLayout = React.createElement("UIListLayout", {
			Padding = UDim.new(0, 5),
			SortOrder = Enum.SortOrder.LayoutOrder,
		}),

		Heading = React.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, 14),

			BackgroundTransparency = 1,
			BorderSizePixel = 0,

			FontFace = Font.new(
				"rbxasset://fonts/families/GothamSSm.json",
				Enum.FontWeight.Medium,
				Enum.FontStyle.Normal
			),
			Text = props.heading,
			TextColor3 = Color3.fromRGB(221, 221, 221),
			TextScaled = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}),

		Description = React.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, 14),

			BackgroundTransparency = 1,
			BorderSizePixel = 0,

			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			Text = props.description,
			TextColor3 = Color3.fromRGB(167, 167, 167),
			TextScaled = true,
			TextXAlignment = Enum.TextXAlignment.Left,
		}),

		Input = React.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 26),

			BackgroundTransparency = 1,
			BorderSizePixel = 0,
		}, {
			Toggle = React.createElement("ImageButton", {
				Size = UDim2.fromOffset(26, 26),

				BackgroundColor3 = Color3.fromRGB(37, 37, 37),
				BorderSizePixel = 0,

				[React.Event.MouseButton1Click] = function()
					props.setValue(not props.value:getValue())
				end,
			}, {
				UICorner = React.createElement("UICorner", {
					CornerRadius = UDim.new(0, 4),
				}),

				UIStroke = React.createElement("UIStroke", {
					Color = Color3.fromRGB(30, 30, 30),
				}),

				Check = React.createElement("ImageLabel", {
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(16, 16),

					BackgroundTransparency = 1,
					BorderSizePixel = 0,

					Image = "http://www.roblox.com/asset/?id=16095906061",
					ImageColor3 = Color3.fromRGB(76, 188, 255),
					ScaleType = Enum.ScaleType.Fit,

					Visible = props.value,
				}),
			}),

			Tip = React.createElement("TextLabel", {
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 35, 0.5, 0),
				Size = UDim2.new(1, -35, 0, 14),

				BackgroundTransparency = 1,
				BorderSizePixel = 0,

				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
				Text = props.tip,
				TextColor3 = Color3.fromRGB(221, 221, 221),
				TextScaled = true,
				TextXAlignment = Enum.TextXAlignment.Left,
			}),
		}),
	})
end
