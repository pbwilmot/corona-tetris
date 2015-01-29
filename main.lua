-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- A naive Tetris implementation in corona / lua. Lets see how this goes....
--
-- TODO
-- Shape rotation
-- render loop

SQUARE_SIZE = 20
SQUARE_SEPARATION_SIZE = 2
DELTA_SEPARATION = SQUARE_SIZE + SQUARE_SEPARATION_SIZE

local topX = 0
local topY = 0

local function rotateRight(event)
  event.target:rotate(90)
end

local function rotateLeft(event)
  event.target:rotate(-90)
end

local function createShapeGroups(x, y)
  local parentGroup = display.newGroup()
  local subGroup = display.newGroup()
  parentGroup:insert(subGroup)
  parentGroup:addEventListener('tap', rotateRight)
  parentGroup.x = x
  parentGroup.y = y
  parentGroup.anchorChildren = true
  return parentGroup, subGroup
end

local function createLine(x, y, r, g, b, a)
  local parentGroup, subGroup = createShapeGroups(x, y)

  local myBox = display.newRect(topX, topY, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  subGroup:insert(myBox)

  myBox = display.newRect(topX, topY + DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  subGroup:insert(myBox)

  myBox = display.newRect(topX , topY + 2 * DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  subGroup:insert(myBox)

  myBox = display.newRect(topX , topY + 3 * DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  subGroup:insert(myBox)
  return lineGroup
end

-- Inverse L
local function createInverseL(x, y, r, g, b, a)
  local parentGroup, myGroup = createShapeGroups(x, y)

  local myBox = display.newRect(topX, topY, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX + DELTA_SEPARATION, topY, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX, topY + DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX, topY + 2 * (DELTA_SEPARATION), SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  return parentGroup
end

-- L
local function createL(x, y, r, g, b, a)
  local parentGroup, myGroup = createShapeGroups(x, y)

  local myBox = display.newRect(topX, topY, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX + DELTA_SEPARATION, topY, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX + DELTA_SEPARATION, topY + DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX + DELTA_SEPARATION, topY + 2 * (DELTA_SEPARATION), SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  return parentGroup
end

-- BOX
local function createBox(x, y, r, g, b, a)
  local parentGroup, myGroup = createShapeGroups(x, y)

  local myBox = display.newRect(topX, topY, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX + DELTA_SEPARATION, topY, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX , topY + DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX + DELTA_SEPARATION, topY + DELTA_SEPARATION , SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  return parentGroup
end

-- Z
local function createZ(x, y, r, g, b, a)
  local parentGroup, myGroup = createShapeGroups(x, y)

  local myBox = display.newRect(topX, topY, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX + DELTA_SEPARATION, topY, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX + DELTA_SEPARATION, topY + DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX + 2 * DELTA_SEPARATION, topY + DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)
  return parentGroup
end

-- S
local function createS(x, y, r, g, b, a)
  local parentGroup, myGroup = createShapeGroups(x, y)

  local myBox = display.newRect(topX + 2 * DELTA_SEPARATION, topY, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX + DELTA_SEPARATION, topY, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX + DELTA_SEPARATION, topY + DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)

  myBox = display.newRect(topX, topY + DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  myGroup:insert(myBox)
  return parentGroup
end

-- T
local function createT(x, y, r, g, b, a)
  local parentGroup, myGroup = createShapeGroups(x, y)

  local myBox = display.newRect( topX + 2 * DELTA_SEPARATION, topY, SQUARE_SIZE, SQUARE_SIZE )
  myBox:setFillColor(r, g, b, a)
  myGroup:insert( myBox )

  myBox = display.newRect( topX + DELTA_SEPARATION, topY, SQUARE_SIZE, SQUARE_SIZE )
  myBox:setFillColor(r, g, b, a)
  myGroup:insert( myBox )

  myBox = display.newRect( topX + DELTA_SEPARATION, topY + DELTA_SEPARATION, SQUARE_SIZE, SQUARE_SIZE )
  myBox:setFillColor(r, g, b, a)
  myGroup:insert( myBox )

  myBox = display.newRect( topX, topY, SQUARE_SIZE, SQUARE_SIZE )
  myBox:setFillColor(r, g, b, a)
  myGroup:insert( myBox )
  return parentGroup
end

local t = createT(50, 350, 1, 0.5, 0, 0.8)
local line = createLine(50, 50, 0, 1, 0, 0.8)
local inverseL = createInverseL(50, 150, 1, 0, 0, 0.8)
local l = createL(50, 250, 0, 0, 1, 0.8)
local box = createBox(200, 50, 0, 1, 1, 0.8)
local z = createZ(200, 150, 0.5, 0.5, 0, 0.8)
local s = createS(200, 250, 0.5, 0.2, 0.8, 0.8)
