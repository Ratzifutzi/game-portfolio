oldtext = script.Parent.Text



while true do
	wait(.3)
	script.Parent.Text = oldtext .. "."
	wait(.3)
	script.Parent.Text = oldtext .. ".."
	wait(.3)
	script.Parent.Text = oldtext .. "..."
end