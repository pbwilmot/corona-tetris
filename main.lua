-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- print( "Hello World!" )

-- local myTextObject = display.newText( "Hello World!", 160, 240, "Arial", 60 )
-- myTextObject:setFillColor( 1, 0, 0 )

-- function screenTap()
--     local r = math.random( 0, 100 )
--     local g = math.random( 0, 100 )
--     local b = math.random( 0, 100 )
--     myTextObject:setFillColor( r/100, g/100, b/100 )
-- end

-- display.currentStage:addEventListener( "tap", screenTap )

local SQUARE_SIZE = 50
local SQUARE_SEPARATION_SIZE = 2

local DELTA_SEPARATION = SQUARE_SIZE + SQUARE_SEPARATION_SIZE
-- Inverse L
local myGroup = display.newGroup()

local topX = 30
local topY = 10

local myBox = display.newRect( topX, topY, SQUARE_SIZE, SQUARE_SIZE )
myBox:setFillColor( 1, 0, 0, 0.8 )
myGroup:insert( myBox )

myBox = display.newRect( topX + DELTA_SEPARATION, topY, SQUARE_SIZE, SQUARE_SIZE )
myBox:setFillColor( 1, 0, 0, 0.8 )
myGroup:insert( myBox )

myBox = display.newRect( topX, topY + DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE )
myBox:setFillColor( 1, 0, 0, 0.8 )
myGroup:insert( myBox )

myBox = display.newRect( topX, topY + 2 * ( DELTA_SEPARATION ) , SQUARE_SIZE, SQUARE_SIZE )
myBox:setFillColor( 1, 0, 0, 0.8 )
myGroup:insert( myBox )


-- L
local myGroup = display.newGroup()

local topX = 150
local topY = 10

local myBox = display.newRect( topX, topY, SQUARE_SIZE, SQUARE_SIZE )
myBox:setFillColor( 0, 0, 1, 0.8 )
myGroup:insert( myBox )

myBox = display.newRect( topX + DELTA_SEPARATION, topY, SQUARE_SIZE, SQUARE_SIZE )
myBox:setFillColor( 0, 0, 1, 0.8 )
myGroup:insert( myBox )

myBox = display.newRect( topX + DELTA_SEPARATION, topY + DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE )
myBox:setFillColor( 0, 0, 1, 0.8 )
myGroup:insert( myBox )

myBox = display.newRect( topX + DELTA_SEPARATION, topY + 2 * ( DELTA_SEPARATION ) , SQUARE_SIZE, SQUARE_SIZE )
myBox:setFillColor( 0, 0, 1, 0.8 )
myGroup:insert( myBox )

-- BOX
local myGroup = display.newGroup()

local topX = 30
local topY = 200

local myBox = display.newRect( topX, topY, SQUARE_SIZE, SQUARE_SIZE )
myBox:setFillColor( 0, 1, 1, 0.8 )
myGroup:insert( myBox )

myBox = display.newRect( topX + DELTA_SEPARATION, topY, SQUARE_SIZE, SQUARE_SIZE )
myBox:setFillColor( 0, 1, 1, 0.8 )
myGroup:insert( myBox )

myBox = display.newRect( topX , topY + DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE )
myBox:setFillColor( 0, 1, 1, 0.8 )
myGroup:insert( myBox )

myBox = display.newRect( topX + DELTA_SEPARATION, topY + DELTA_SEPARATION , SQUARE_SIZE, SQUARE_SIZE )
myBox:setFillColor( 0, 1, 1, 0.8 )
myGroup:insert( myBox )