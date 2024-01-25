local React = require(script.Parent.Parent.Parent.Libs.React)

return function(props)
	return React.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 0, 30),
		LayoutOrder = 1,

		BackgroundColor3 = Color3.fromRGB(0, 162, 255),
		BorderSizePixel = 0,

		[React.Event.MouseButton1Click] = props.onClick,
	}, {
		UICorner = React.createElement("UICorner", {
			CornerRadius = UDim.new(0, 4),
		}),

		Content = React.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, 0, 0, 16),

			BackgroundTransparency = 1,
			BorderSizePixel = 0,

			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			Text = "Convert",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
		}),
	})
end
