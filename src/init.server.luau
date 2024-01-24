do
	if not game:GetService("RunService"):IsEdit() then
		return
	end

	local Toolbar = plugin:CreateToolbar("Pixelate")

	local ToggleGuiButton =
		Toolbar:CreateButton("Pixelate", "Show or hide the Pixelate widget", "rbxassetid://16096169652")
	ToggleGuiButton.ClickableWhenViewportHidden = false

	local InterfaceInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, false, true, 300, 500, 300, 500)
	local Interface = plugin:CreateDockWidgetPluginGui("Pixelate", InterfaceInfo)
	Interface.Title = "Pixelate"

	ToggleGuiButton.Click:Connect(function()
		Interface.Enabled = not Interface.Enabled
	end)
end
