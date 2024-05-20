local ContentProvider = game:GetService("ContentProvider")
local Players = game:GetService("Players")

local SPEAKER_ID = 386990744

local content, isReady = Players:GetUserThumbnailAsync( SPEAKER_ID, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size352x352 )

script.Parent.Icon.Image = content
script.Parent.Texts.SpeakerName.Text = string.format( script.Parent.Texts.SpeakerName.Text, Players:GetNameFromUserIdAsync( SPEAKER_ID ) )
ContentProvider:PreloadAsync( { script.Parent.Icon } )