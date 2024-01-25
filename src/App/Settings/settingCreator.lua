local React = require(script.Parent.Parent.Parent.Libs.React)

return {
	number = function(defaultValue: number, heading: string, description: string, placeholder: string)
		local value, setValue = React.useBinding(defaultValue)

		return {
			type = "number",

			defaultValue = defaultValue,
			heading = heading,
			description = description,
			placeholder = placeholder,

			value = value,
			setValue = setValue,
		}
	end,

	boolean = function(defaultValue: boolean, heading: string, description: string, tip: string)
		local value, setValue = React.useBinding(defaultValue)

		return {
			type = "boolean",

			defaultValue = defaultValue,
			heading = heading,
			description = description,
			tip = tip,

			value = value,
			setValue = setValue,
		}
	end,
}
