local React = require(script.Parent.Parent.Libs.React)

local SelectedModel = require(script.SelectedModel)
local ConvertButton = require(script.ConvertButton)

local function Convert(settingsList: { [string]: number | boolean })
	warn("Converting with the following settings:")

	for key, value in settingsList do
		print(key, value)
	end
end

return function(props)
	local page = props.page

	return React.createElement("Frame", {
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1),
		Size = UDim2.new(1, 0, 1, -36),

		BackgroundTransparency = 1,
		BorderSizePixel = 0,

		Visible = page:map(function(value)
			return value == "Pixelate"
		end),
	}, {
		UIPadding = React.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, 10),
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 10),
		}),

		UIListLayout = React.createElement("UIListLayout", {
			Padding = UDim.new(0, 10),
			SortOrder = Enum.SortOrder.LayoutOrder,
		}),

		SelectedModel = React.createElement(SelectedModel),
		ConvertButton = React.createElement(ConvertButton, {
			onClick = function()
				local keyValuePairs = {}

				for key, settingProps in props.settingsList do
					keyValuePairs[key] = settingProps.value:getValue()
				end

				Convert(keyValuePairs)
			end,
		}),
	})
end
