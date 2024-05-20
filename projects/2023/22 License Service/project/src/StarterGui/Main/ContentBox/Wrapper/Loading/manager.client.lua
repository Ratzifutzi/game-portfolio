local ImageGallery = script.Parent["0_ImageGallery"]

script.Parent:GetPropertyChangedSignal("Visible"):Connect(function()
	if not script.Parent.Visible then return nil end
	
	ImageGallery.UIPageLayout.TweenTime = 0
	ImageGallery.UIPageLayout:JumpTo( ImageGallery["0"] )
	
	repeat wait() until ImageGallery.UIPageLayout.CurrentPage == ImageGallery["0"]
	
	ImageGallery.UIPageLayout.TweenTime = 5
end)