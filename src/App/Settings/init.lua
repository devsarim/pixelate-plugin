local React = require(script.Parent.Parent.Libs.React)

local NumberInput = require(script.NumberInput)
local BooleanInput = require(script.BooleanInput)

return function(props)
	local page = props.page

	local children = {
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
	}

	for key, settingProps in props.settingsList do
		if settingProps.type == "number" then
			children[key] = React.createElement(NumberInput, settingProps)
		elseif settingProps.type == "boolean" then
			children[key] = React.createElement(BooleanInput, settingProps)
		end
	end

	return React.createElement("Frame", {
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1),
		Size = UDim2.new(1, 0, 1, -36),

		BackgroundTransparency = 1,
		BorderSizePixel = 0,

		Visible = page:map(function(value)
			return value == "Settings"
		end),
	}, children)
end
