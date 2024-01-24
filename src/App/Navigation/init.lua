local React = require(script.Parent.Parent.Libs.React)

local Button = require(script.Button)

return function(props)
	local page, setPage = props.page, props.setPage

	return React.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 36),

		BackgroundTransparency = 1,
		BorderSizePixel = 0,
	}, {
		Pixelate = React.createElement(Button, {
			anchorPoint = Vector2.new(0, 0),
			position = UDim2.fromScale(0, 0),

			page = page,
			setPage = setPage,
			target = "Pixelate",
		}),

		Settings = React.createElement(Button, {
			anchorPoint = Vector2.new(1, 0),
			position = UDim2.fromScale(1, 0),

			page = page,
			setPage = setPage,
			target = "Settings",
		}),
	})
end
