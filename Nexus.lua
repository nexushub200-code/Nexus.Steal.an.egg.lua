local Players=game:GetService("Players")
local TweenService=game:GetService("TweenService")
local UserInputService=game:GetService("UserInputService")
local Player=Players.LocalPlayer
local PlayerGui=Player:WaitForChild("PlayerGui")
local Old=PlayerGui:FindFirstChild("NexusHubUI")
if Old then Old:Destroy()end

local C={BG=Color3.fromRGB(14,12,19),PANEL=Color3.fromRGB(24,19,28),CARD=Color3.fromRGB(31,25,36),BUTTON=Color3.fromRGB(40,31,43),HOVER=Color3.fromRGB(61,42,52),CRIMSON=Color3.fromRGB(220,35,58),PURPLE=Color3.fromRGB(135,65,185),PURPLE2=Color3.fromRGB(80,38,115),TEXT=Color3.fromRGB(250,247,250),DIM=Color3.fromRGB(170,160,174)}
local Fast=TweenInfo.new(.12,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
local Smooth=TweenInfo.new(.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
local Pop=TweenInfo.new(.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
local CloseAnim=TweenInfo.new(.22,Enum.EasingStyle.Quint,Enum.EasingDirection.In)

local function Tween(o,i,p)local t=TweenService:Create(o,i,p)t:Play()return t end
local function Round(o,r)local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,r)c.Parent=o end
local function Stroke(o,col,thick,trans)local s=Instance.new("UIStroke")s.Color=col s.Thickness=thick or 1 s.Transparency=trans or 0 s.Parent=o end
local function Gradient(o,a,b,rot)local g=Instance.new("UIGradient")g.Color=ColorSequence.new({ColorSequenceKeypoint.new(0,a),ColorSequenceKeypoint.new(1,b)})g.Rotation=rot or 0 g.Parent=o end

local Gui=Instance.new("ScreenGui")
Gui.Name="NexusHubUI"
Gui.ResetOnSpawn=false
Gui.IgnoreGuiInset=true
Gui.DisplayOrder=100
Gui.ZIndexBehavior=Enum.ZIndexBehavior.Global
Gui.Parent=PlayerGui

-- N BUTTON
local FloatingN=Instance.new("TextButton")
FloatingN.Name="NButton"
FloatingN.Size=UDim2.fromOffset(50,50)
FloatingN.Position=UDim2.new(0,8,.5,-25)
FloatingN.BackgroundColor3=C.PANEL
FloatingN.Text="N"
FloatingN.TextColor3=C.TEXT
FloatingN.Font=Enum.Font.GothamBlack
FloatingN.TextSize=22
FloatingN.AutoButtonColor=false
FloatingN.ZIndex=1000
FloatingN.Parent=Gui
Round(FloatingN,16)
Stroke(FloatingN,C.CRIMSON,1.5,.1)
Gradient(FloatingN,C.CRIMSON,C.PURPLE2,45)

local NInner=Instance.new("Frame")
NInner.Size=UDim2.new(1,-8,1,-8)
NInner.Position=UDim2.fromOffset(4,4)
NInner.BackgroundTransparency=1
NInner.ZIndex=1001
NInner.Parent=FloatingN
Round(NInner,13)
Stroke(NInner,Color3.fromRGB(255,80,95),1,.55)

FloatingN.MouseEnter:Connect(function()
	Tween(FloatingN,Fast,{BackgroundColor3=C.HOVER,Size=UDim2.fromOffset(50,50)})
end)

FloatingN.MouseLeave:Connect(function()
	Tween(FloatingN,Fast,{BackgroundColor3=C.PANEL,Size=UDim2.fromOffset(50,50)})
end)

-- MAIN
local Main=Instance.new("Frame")
Main.Name="Main"
Main.Size=UDim2.fromOffset(340,245)
Main.Position=UDim2.new(.5,-170,.5,-122.5)
Main.BackgroundColor3=C.BG
Main.BorderSizePixel=0
Main.ClipsDescendants=true
Main.Active=true
Main.ZIndex=10
Main.Parent=Gui
Round(Main,17)
Stroke(Main,C.CRIMSON,1.4,.2)
Gradient(Main,C.BG,Color3.fromRGB(31,15,25),90)

local Glow=Instance.new("Frame")
Glow.Size=UDim2.new(1,-20,0,2)
Glow.Position=UDim2.fromOffset(10,0)
Glow.BackgroundColor3=C.CRIMSON
Glow.BorderSizePixel=0
Glow.ZIndex=11
Glow.Parent=Main
Round(Glow,2)

-- HEADER
local Header=Instance.new("Frame")
Header.Size=UDim2.new(1,0,0,60)
Header.BackgroundColor3=C.PANEL
Header.BorderSizePixel=0
Header.Active=true
Header.ZIndex=11
Header.Parent=Main
Round(Header,17)
Gradient(Header,Color3.fromRGB(37,17,25),Color3.fromRGB(25,19,31),0)

local Logo=Instance.new("TextLabel")
Logo.Size=UDim2.fromOffset(42,42)
Logo.Position=UDim2.fromOffset(9,9)
Logo.BackgroundColor3=C.CRIMSON
Logo.Text="N"
Logo.TextColor3=C.TEXT
Logo.Font=Enum.Font.GothamBlack
Logo.TextSize=22
Logo.ZIndex=12
Logo.Parent=Header
Round(Logo,12)
Gradient(Logo,C.CRIMSON,C.PURPLE2,45)
Stroke(Logo,Color3.fromRGB(255,80,95),1,.35)

local Title=Instance.new("TextLabel")
Title.Size=UDim2.new(1,-125,0,25)
Title.Position=UDim2.fromOffset(60,6)
Title.BackgroundTransparency=1
Title.Text="Nexus Hub"
Title.TextColor3=C.TEXT
Title.Font=Enum.Font.GothamBlack
Title.TextSize=19
Title.TextXAlignment=Enum.TextXAlignment.Left
Title.ZIndex=12
Title.Parent=Header

local TitleLine=Instance.new("Frame")
TitleLine.Size=UDim2.fromOffset(67,2)
TitleLine.Position=UDim2.fromOffset(61,31)
TitleLine.BackgroundColor3=C.CRIMSON
TitleLine.BorderSizePixel=0
TitleLine.ZIndex=12
TitleLine.Parent=Header
Round(TitleLine,2)
Gradient(TitleLine,C.CRIMSON,C.PURPLE,0)

local Subtitle=Instance.new("TextLabel")
Subtitle.Size=UDim2.new(1,-125,0,14)
Subtitle.Position=UDim2.fromOffset(61,36)
Subtitle.BackgroundTransparency=1
Subtitle.Text="CRIMSON × NEXUS"
Subtitle.TextColor3=C.DIM
Subtitle.Font=Enum.Font.GothamBold
Subtitle.TextSize=8
Subtitle.TextXAlignment=Enum.TextXAlignment.Left
Subtitle.ZIndex=12
Subtitle.Parent=Header

-- X BUTTON
local Close=Instance.new("TextButton")
Close.Size=UDim2.fromOffset(32,30)
Close.Position=UDim2.new(1,-41,0,15)
Close.BackgroundColor3=C.BUTTON
Close.Text="×"
Close.TextColor3=C.TEXT
Close.Font=Enum.Font.GothamBold
Close.TextSize=18
Close.AutoButtonColor=false
Close.ZIndex=13
Close.Parent=Header
Round(Close,9)

Close.MouseEnter:Connect(function()
	Tween(Close,Fast,{BackgroundColor3=C.CRIMSON})
end)

Close.MouseLeave:Connect(function()
	Tween(Close,Fast,{BackgroundColor3=C.BUTTON})
end)

-- SECTION BAR
local SectionBar=Instance.new("Frame")
SectionBar.Size=UDim2.new(1,-18,0,38)
SectionBar.Position=UDim2.fromOffset(9,66)
SectionBar.BackgroundTransparency=1
SectionBar.ZIndex=16
SectionBar.Parent=Main

local SectionLayout=Instance.new("UIListLayout")
SectionLayout.FillDirection=Enum.FillDirection.Horizontal
SectionLayout.HorizontalAlignment=Enum.HorizontalAlignment.Left
SectionLayout.VerticalAlignment=Enum.VerticalAlignment.Center
SectionLayout.Padding=UDim.new(0,6)
SectionLayout.Parent=SectionBar

-- CONTENT
local Content=Instance.new("Frame")
Content.Size=UDim2.new(1,-18,1,-110)
Content.Position=UDim2.fromOffset(9,105)
Content.BackgroundColor3=C.PANEL
Content.BorderSizePixel=0
Content.ClipsDescendants=true
Content.ZIndex=10
Content.Parent=Main
Round(Content,12)
Stroke(Content,C.PURPLE,1,.72)

local SideLine=Instance.new("Frame")
SideLine.Size=UDim2.fromOffset(2,42)
SideLine.Position=UDim2.fromOffset(7,9)
SideLine.BackgroundColor3=C.CRIMSON
SideLine.BorderSizePixel=0
SideLine.ZIndex=15
SideLine.Parent=Content
Round(SideLine,2)

local Pages={}

local function NewPage(name)
	local p=Instance.new("Frame")
	p.Name=name
	p.Size=UDim2.new(1,0,1,0)
	p.BackgroundTransparency=1
	p.Visible=false
	p.ZIndex=11
	p.Parent=Content
	Pages[name]=p
	return p
end

local MainPage=NewPage("Main")

local MiscPage=Instance.new("ScrollingFrame")
MiscPage.Name="Misc"
MiscPage.Size=UDim2.new(1,0,1,0)
MiscPage.BackgroundTransparency=1
MiscPage.BorderSizePixel=0
MiscPage.ClipsDescendants=true
MiscPage.Visible=false
MiscPage.ZIndex=11
MiscPage.ScrollBarThickness=4
MiscPage.ScrollBarImageColor3=C.CRIMSON
MiscPage.ScrollBarImageTransparency=.15
MiscPage.ScrollingDirection=Enum.ScrollingDirection.Y
MiscPage.CanvasSize=UDim2.new(0,0,0,0)
MiscPage.AutomaticCanvasSize=Enum.AutomaticSize.None
MiscPage.Parent=Content

local MiscPadding=Instance.new("UIPadding")
MiscPadding.PaddingBottom=UDim.new(0,15)
MiscPadding.Parent=MiscPage

Pages.Misc=MiscPage

local SettingPage=NewPage("Setting")

-- SECTION BUTTONS
local CurrentPage

local function SectionButton(name,page)
	local b=Instance.new("TextButton")
	b.Name=name
	b.Size=UDim2.fromOffset(100,32)
	b.BackgroundColor3=C.BUTTON
	b.Text=name
	b.TextColor3=C.DIM
	b.Font=Enum.Font.GothamBold
	b.TextSize=11
	b.AutoButtonColor=false
	b.ZIndex=17
	b.Parent=SectionBar
	Round(b,9)
	Stroke(b,C.PURPLE,1,.7)

	b.MouseEnter:Connect(function()
		if CurrentPage~=page then
			Tween(b,Fast,{BackgroundColor3=C.HOVER,TextColor3=C.TEXT})
		end
	end)

	b.MouseLeave:Connect(function()
		if CurrentPage~=page then
			Tween(b,Fast,{BackgroundColor3=C.BUTTON,TextColor3=C.DIM})
		end
	end)

	b.Activated:Connect(function()
		for _,v in ipairs(SectionBar:GetChildren())do
			if v:IsA("TextButton")then
				Tween(v,Fast,{BackgroundColor3=C.BUTTON,TextColor3=C.DIM})
			end
		end

		for _,v in pairs(Pages)do
			v.Visible=false
		end

		Tween(b,Fast,{BackgroundColor3=C.CRIMSON,TextColor3=C.TEXT})
		page.Visible=true
		CurrentPage=page

		if page==MiscPage then
			MiscPage.CanvasPosition=Vector2.new(0,0)
		end
	end)

	return b
end

local MainTab=SectionButton("Main",MainPage)
local MiscTab=SectionButton("Misc",MiscPage)
local SettingTab=SectionButton("Setting",SettingPage)

MainTab.BackgroundColor3=C.CRIMSON
MainTab.TextColor3=C.TEXT
MainPage.Visible=true
CurrentPage=MainPage

-- FEATURE CARD
local function FeatureCard(parent,title,description,y)
	local card=Instance.new("Frame")
	card.Size=UDim2.new(1,-18,0,52)
	card.Position=UDim2.fromOffset(9,y)
	card.BackgroundColor3=C.CARD
	card.BorderSizePixel=0
	card.ZIndex=12
	card.Parent=parent
	Round(card,11)
	Stroke(card,C.PURPLE,1,.72)

	local accent=Instance.new("Frame")
	accent.Size=UDim2.fromOffset(3,34)
	accent.Position=UDim2.fromOffset(7,9)
	accent.BackgroundColor3=C.CRIMSON
	accent.BorderSizePixel=0
	accent.ZIndex=13
	accent.Parent=card
	Round(accent,2)

	local name=Instance.new("TextLabel")
	name.Size=UDim2.new(1,-82,0,20)
	name.Position=UDim2.fromOffset(18,6)
	name.BackgroundTransparency=1
	name.Text=title
	name.TextColor3=C.TEXT
	name.Font=Enum.Font.GothamBold
	name.TextSize=12
	name.TextXAlignment=Enum.TextXAlignment.Left
	name.ZIndex=13
	name.Parent=card

	local desc=Instance.new("TextLabel")
	desc.Size=UDim2.new(1,-82,0,17)
	desc.Position=UDim2.fromOffset(18,27)
	desc.BackgroundTransparency=1
	desc.Text=description
	desc.TextColor3=C.DIM
	desc.Font=Enum.Font.Gotham
	desc.TextSize=8
	desc.TextXAlignment=Enum.TextXAlignment.Left
	desc.ZIndex=13
	desc.Parent=card

	return card
end

-- TOGGLE
local function AddToggle(parent,title,description,y)
	local card=FeatureCard(parent,title,description,y)

	local toggle=Instance.new("TextButton")
	toggle.Size=UDim2.fromOffset(43,23)
	toggle.Position=UDim2.new(1,-55,.5,-11)
	toggle.BackgroundColor3=C.BUTTON
	toggle.Text=""
	toggle.AutoButtonColor=false
	toggle.ZIndex=20
	toggle.Parent=card
	Round(toggle,12)
	Stroke(toggle,C.PURPLE,1,.45)

	local knob=Instance.new("Frame")
	knob.Size=UDim2.fromOffset(17,17)
	knob.Position=UDim2.fromOffset(3,3)
	knob.BackgroundColor3=C.DIM
	knob.BorderSizePixel=0
	knob.ZIndex=21
	knob.Parent=toggle
	Round(knob,9)

	local enabled=false

	toggle.Activated:Connect(function()
		enabled=not enabled

		if enabled then
			Tween(toggle,Smooth,{BackgroundColor3=C.CRIMSON})
			Tween(knob,Smooth,{Position=UDim2.new(1,-20,0,3),BackgroundColor3=C.TEXT})
		else
			Tween(toggle,Smooth,{BackgroundColor3=C.BUTTON})
			Tween(knob,Smooth,{Position=UDim2.fromOffset(3,3),BackgroundColor3=C.DIM})
		end
	end)

	return card
end

-- MISC
local MiscTitle=Instance.new("TextLabel")
MiscTitle.Size=UDim2.new(1,-20,0,22)
MiscTitle.Position=UDim2.fromOffset(15,9)
MiscTitle.BackgroundTransparency=1
MiscTitle.Text="MISC FEATURES"
MiscTitle.TextColor3=C.CRIMSON
MiscTitle.Font=Enum.Font.GothamBlack
MiscTitle.TextSize=12
MiscTitle.TextXAlignment=Enum.TextXAlignment.Left
MiscTitle.ZIndex=15
MiscTitle.Parent=MiscPage

local MiscLine=Instance.new("Frame")
MiscLine.Size=UDim2.new(1,-30,0,1)
MiscLine.Position=UDim2.fromOffset(15,31)
MiscLine.BackgroundColor3=C.PURPLE
MiscLine.BorderSizePixel=0
MiscLine.ZIndex=15
MiscLine.Parent=MiscPage

AddToggle(MiscPage,"Anti AFK","Toggle placeholder",39)
AddToggle(MiscPage,"FPS Booster","Toggle placeholder",97)

-- PING BOOSTER
local PingCard=Instance.new("Frame")
PingCard.Size=UDim2.new(1,-18,0,72)
PingCard.Position=UDim2.fromOffset(9,155)
PingCard.BackgroundColor3=C.CARD
PingCard.BorderSizePixel=0
PingCard.ZIndex=12
PingCard.Parent=MiscPage
Round(PingCard,11)
Stroke(PingCard,C.PURPLE,1,.72)

local PingAccent=Instance.new("Frame")
PingAccent.Size=UDim2.fromOffset(3,48)
PingAccent.Position=UDim2.fromOffset(7,12)
PingAccent.BackgroundColor3=C.CRIMSON
PingAccent.BorderSizePixel=0
PingAccent.ZIndex=13
PingAccent.Parent=PingCard
Round(PingAccent,2)

local PingTitle=Instance.new("TextLabel")
PingTitle.Size=UDim2.new(1,-30,0,19)
PingTitle.Position=UDim2.fromOffset(18,7)
PingTitle.BackgroundTransparency=1
PingTitle.Text="Ping Booster"
PingTitle.TextColor3=C.TEXT
PingTitle.Font=Enum.Font.GothamBold
PingTitle.TextSize=12
PingTitle.TextXAlignment=Enum.TextXAlignment.Left
PingTitle.ZIndex=13
PingTitle.Parent=PingCard

local PingValue=Instance.new("TextLabel")
PingValue.Size=UDim2.fromOffset(40,19)
PingValue.Position=UDim2.new(1,-50,0,7)
PingValue.BackgroundTransparency=1
PingValue.Text="50%"
PingValue.TextColor3=C.CRIMSON
PingValue.Font=Enum.Font.GothamBold
PingValue.TextSize=9
PingValue.TextXAlignment=Enum.TextXAlignment.Right
PingValue.ZIndex=13
PingValue.Parent=PingCard

local SliderBack=Instance.new("Frame")
SliderBack.Size=UDim2.new(1,-38,0,6)
SliderBack.Position=UDim2.fromOffset(19,45)
SliderBack.BackgroundColor3=C.BUTTON
SliderBack.BorderSizePixel=0
SliderBack.ZIndex=13
SliderBack.Parent=PingCard
Round(SliderBack,5)

local SliderFill=Instance.new("Frame")
SliderFill.Size=UDim2.new(.5,0,1,0)
SliderFill.BackgroundColor3=C.CRIMSON
SliderFill.BorderSizePixel=0
SliderFill.ZIndex=14
SliderFill.Parent=SliderBack
Round(SliderFill,5)
Gradient(SliderFill,C.CRIMSON,C.PURPLE,0)

local SliderKnob=Instance.new("TextButton")
SliderKnob.Size=UDim2.fromOffset(16,16)
SliderKnob.Position=UDim2.new(.5,-8,.5,-8)
SliderKnob.BackgroundColor3=C.TEXT
SliderKnob.Text=""
SliderKnob.AutoButtonColor=false
SliderKnob.ZIndex=15
SliderKnob.Parent=SliderBack
Round(SliderKnob,8)
Stroke(SliderKnob,C.CRIMSON,1)

local Sliding=false

local function UpdateSlider(input)
	local x=input.Position.X
	local left=SliderBack.AbsolutePosition.X
	local width=SliderBack.AbsoluteSize.X
	if width<=0 then return end

	local percent=math.clamp((x-left)/width,0,1)

	SliderFill.Size=UDim2.new(percent,0,1,0)
	SliderKnob.Position=UDim2.new(percent,-8,.5,-8)
	PingValue.Text=tostring(math.floor(percent*100+.5)).."%"
end

SliderKnob.InputBegan:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
		Sliding=true
	end
end)

SliderBack.InputBegan:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
		Sliding=true
		UpdateSlider(input)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if Sliding and(input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch)then
		UpdateSlider(input)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
		Sliding=false
	end
end)

-- MAIN PAGE
local MainInfo=Instance.new("TextLabel")
MainInfo.Size=UDim2.new(1,-30,0,40)
MainInfo.Position=UDim2.fromOffset(15,15)
MainInfo.BackgroundTransparency=1
MainInfo.Text="Main"
MainInfo.TextColor3=C.TEXT
MainInfo.Font=Enum.Font.GothamBlack
MainInfo.TextSize=16
MainInfo.TextXAlignment=Enum.TextXAlignment.Left
MainInfo.ZIndex=15
MainInfo.Parent=MainPage

local MainSub=Instance.new("TextLabel")
MainSub.Size=UDim2.new(1,-30,0,30)
MainSub.Position=UDim2.fromOffset(15,43)
MainSub.BackgroundTransparency=1
MainSub.Text="Main features will be added here."
MainSub.TextColor3=C.DIM
MainSub.Font=Enum.Font.Gotham
MainSub.TextSize=10
MainSub.TextXAlignment=Enum.TextXAlignment.Left
MainSub.ZIndex=15
MainSub.Parent=MainPage

-- SETTING PAGE
local SettingInfo=Instance.new("TextLabel")
SettingInfo.Size=UDim2.new(1,-30,0,40)
SettingInfo.Position=UDim2.fromOffset(15,15)
SettingInfo.BackgroundTransparency=1
SettingInfo.Text="Setting"
SettingInfo.TextColor3=C.TEXT
SettingInfo.Font=Enum.Font.GothamBlack
SettingInfo.TextSize=16
SettingInfo.TextXAlignment=Enum.TextXAlignment.Left
SettingInfo.ZIndex=15
SettingInfo.Parent=SettingPage

local SettingSub=Instance.new("TextLabel")
SettingSub.Size=UDim2.new(1,-30,0,30)
SettingSub.Position=UDim2.fromOffset(15,43)
SettingSub.BackgroundTransparency=1
SettingSub.Text="Settings will be added here."
SettingSub.TextColor3=C.DIM
SettingSub.Font=Enum.Font.Gotham
SettingSub.TextSize=10
SettingSub.TextXAlignment=Enum.TextXAlignment.Left
SettingSub.ZIndex=15
SettingSub.Parent=SettingPage

-- MISC CANVAS
local function UpdateMiscCanvas()
	local bottom=0

	for _,v in ipairs(MiscPage:GetChildren())do
		if v:IsA("GuiObject")then
			local y=v.Position.Y.Offset
			local h=v.AbsoluteSize.Y

			if y+h>bottom then
				bottom=y+h
			end
		end
	end

	MiscPage.CanvasSize=UDim2.new(0,0,0,bottom+20)
end

MiscPage.ChildAdded:Connect(function()
	task.defer(UpdateMiscCanvas)
end)

MiscPage.ChildRemoved:Connect(function()
	task.defer(UpdateMiscCanvas)
end)

task.defer(UpdateMiscCanvas)
task.delay(.1,UpdateMiscCanvas)
task.delay(.3,UpdateMiscCanvas)

-- DRAG
local Dragging=false
local DragStart
local StartPos

Header.InputBegan:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
		Dragging=true
		DragStart=input.Position
		StartPos=Main.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if Dragging and(input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch)then
		local Delta=input.Position-DragStart

		Main.Position=UDim2.new(
			StartPos.X.Scale,
			StartPos.X.Offset+Delta.X,
			StartPos.Y.Scale,
			StartPos.Y.Offset+Delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
		Dragging=false
	end
end)

-- OPEN / CLOSE
local Busy=false

local function OpenUI()
	if Busy or Main.Visible then return end

	Busy=true
	Main.Visible=true
	Main.Size=UDim2.fromOffset(0,245)

	Tween(Main,Pop,{
		Size=UDim2.fromOffset(340,245)
	})

	task.delay(.35,function()
		Busy=false
	end)
end

local function CloseUI()
	if Busy or not Main.Visible then return end

	Busy=true
	Dragging=false

	Tween(Main,CloseAnim,{
		Size=UDim2.fromOffset(0,245)
	})

	task.delay(.23,function()
		if Main.Parent then
			Main.Visible=false
			Main.Size=UDim2.fromOffset(340,245)
			Busy=false
		end
	end)
end

Close.Activated:Connect(CloseUI)

FloatingN.Activated:Connect(function()
	if Main.Visible then
		CloseUI()
	else
		OpenUI()
	end
end)

-- FLOATING N DRAG
local NDragging=false
local NStart
local NPos

FloatingN.InputBegan:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
		NDragging=true
		NStart=input.Position
		NPos=FloatingN.Position
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if NDragging and(input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch)then
		local Delta=input.Position-NStart

		FloatingN.Position=UDim2.new(
			NPos.X.Scale,
			NPos.X.Offset+Delta.X,
			NPos.Y.Scale,
			NPos.Y.Offset+Delta.Y
		)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
		NDragging=false
	end
end)

-- INITIAL OPEN
Main.Size=UDim2.fromOffset(0,245)
FloatingN.Visible=true

task.wait(.05)

Tween(Main,Pop,{
	Size=UDim2.fromOffset(340,245)
})
