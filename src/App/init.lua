local React = require(script.Parent.Libs.React)

local Navigation = require(script.Navigation)

return function()
	local page, setPage = React.createBinding("Pixelate")

	return React.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),

		BackgroundColor3 = Color3.fromRGB(46, 46, 46),
		BorderSizePixel = 0,
	}, {
		Navigaton = React.createElement(Navigation, {
			page = page,
			setPage = setPage,
		}),
	})
end
