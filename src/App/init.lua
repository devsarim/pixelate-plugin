local React = require(script.Parent.Libs.React)

local Navigation = require(script.Navigation)
local Pixelate = require(script.Pixelate)
local Settings = require(script.Settings)
local settingCreator = require(script.Settings.settingCreator)

return function()
	local page, setPage = React.createBinding("Pixelate")

	local settingsList = {
		keepOldModel = settingCreator.boolean(
			false,
			"Keep old model",
			"Keep or destroy selected model",
			"Keep old model"
		),

		scanResolution = settingCreator.number(2, "Scan resolution", "Quality of scan", "2"),
	}

	return React.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),

		BackgroundColor3 = Color3.fromRGB(46, 46, 46),
		BorderSizePixel = 0,
	}, {
		Navigation = React.createElement(Navigation, {
			page = page,
			setPage = setPage,
		}),

		Pixelate = React.createElement(Pixelate, {
			page = page,

			settingsList = settingsList,
		}),

		Settings = React.createElement(Settings, {
			page = page,

			settingsList = settingsList,
		}),
	})
end
