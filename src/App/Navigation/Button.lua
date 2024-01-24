local React = require(script.Parent.Parent.Parent.Libs.React)

return function(props)
	local page, setPage = props.page, props.setPage
	local target = props.target

	return React.createElement("ImageButton", {
		AnchorPoint = props.anchorPoint,
		Position = props.position,
		Size = UDim2.fromScale(0.5, 1),

		BackgroundColor3 = Color3.fromRGB(53, 53, 53),
		BorderSizePixel = 0,

		[React.Event.MouseButton1Click] = function()
			setPage(target)
		end,
	}, {
		BorderRight = React.createElement("Frame", {
			AnchorPoint = Vector2.new(1, 0),
			Position = UDim2.fromScale(1, 0),
			Size = UDim2.new(0, 2, 1, 0),

			BackgroundColor3 = Color3.fromRGB(34, 34, 34),
			BorderSizePixel = 0,

			Visible = page:map(function(value)
				return value == target
			end),
		}),

		BorderTop = React.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 2),

			BackgroundColor3 = Color3.fromRGB(0, 162, 255),
			BorderSizePixel = 0,

			ZIndex = 2,
			Visible = page:map(function(value)
				return value == target
			end),
		}),

		BorderBottom = React.createElement("Frame", {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			Size = UDim2.new(1, 0, 0, 2),

			BackgroundColor3 = Color3.fromRGB(34, 34, 34),
			BorderSizePixel = 0,

			Visible = page:map(function(value)
				return value ~= target
			end),
		}),

		BorderLeft = React.createElement("Frame", {
			Size = UDim2.new(0, 2, 1, 0),

			BackgroundColor3 = Color3.fromRGB(34, 34, 34),
			BorderSizePixel = 0,

			Visible = page:map(function(value)
				return value == target
			end),
		}),

		Content = React.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			Size = UDim2.new(1, 0, 0, 16),

			BackgroundTransparency = 1,
			BorderSizePixel = 0,

			FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json"),
			Text = target,
			TextColor3 = Color3.fromRGB(167, 167, 167),
			TextScaled = true,
		}),
	})
end
