local React = require(script.Parent.Parent.Parent.Libs.React)

return function(props)
	local textBoxRef = React.useRef(nil)

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

			LayoutOrder = -1,

			BackgroundTransparency = 1,
			BorderSizePixel = 0,

			FontFace = Font.new(
				"rbxasset://fonts/families/GothamSSm.json",
				Enum.FontWeight.Medium,
				Enum.FontStyle.Normal
			),
			Text = props.heading,
			TextScaled = true,
			TextColor3 = Color3.fromRGB(221, 221, 221),
			TextXAlignment = Enum.TextXAlignment.Left,
		}),

		Description = React.createElement("TextLabel", {
			Size = UDim2.new(1, 0, 0, 14),

			BackgroundTransparency = 1,
			BorderSizePixel = 0,

			Text = props.description,
			TextColor3 = Color3.fromRGB(167, 167, 167),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextScaled = true,
			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
		}),

		Input = React.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 32),

			LayoutOrder = 1,

			BackgroundColor3 = Color3.fromRGB(37, 37, 37),
			BorderSizePixel = 0,
		}, {
			UICorner = React.createElement("UICorner", {
				CornerRadius = UDim.new(0, 4),
			}),

			UIStroke = React.createElement("UIStroke", {
				Color = Color3.fromRGB(30, 30, 30),
			}),

			Box = React.createElement("TextBox", {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.new(1, -16, 0, 14),

				BackgroundTransparency = 1,
				BorderSizePixel = 0,

				PlaceholderColor3 = Color3.fromRGB(94, 94, 94),
				PlaceholderText = props.placeholder,

				FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
				Text = "",
				TextColor3 = Color3.fromRGB(221, 221, 221),
				TextScaled = true,
				TextXAlignment = Enum.TextXAlignment.Left,

				[React.Event.Changed] = function()
					local textBox = textBoxRef.current
					textBox.Text = textBox.Text:gsub("%D+", "")

					local currentInput = tonumber(textBox.Text)
					if not currentInput then
						props.setValue(props.defaultValue)
						return
					end

					props.setValue(currentInput)
				end,

				ref = textBoxRef,
			}),
		}),
	})
end
