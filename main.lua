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

local function addRect(group, x, y, r, g, b, a)
  local myBox = display.newRect(x, y, SQUARE_SIZE, SQUARE_SIZE)
  myBox:setFillColor(r, g, b, a)
  group:insert(myBox)
  return group
end

local function createLine(x, y, r, g, b, a)
  local lineGroup, subGroup = createShapeGroups(x, y)

  subGroup = addRect(subGroup, topX, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX, topY + DELTA_SEPARATION, r, g, b, a)
  subGroup = addRect(subGroup, topX, topY + 2 * DELTA_SEPARATION, r, g, b, a)
  subGroup = addRect(subGroup, topX, topY + 3 * DELTA_SEPARATION, r, g, b, a)

  return lineGroup
end

-- Inverse L
local function createInverseL(x, y, r, g, b, a)
  local inverseLGroup, subGroup = createShapeGroups(x, y)

  subGroup = addRect(subGroup, topX, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX + DELTA_SEPARATION, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX, topY + DELTA_SEPARATION, r, g, b, a)
  subGroup = addRect(subGroup, topX, topY + 2 * DELTA_SEPARATION, r, g, b, a)

  return inverseLGroup
end

-- L
local function createL(x, y, r, g, b, a)
  local lGroup, subGroup = createShapeGroups(x, y)

  subGroup = addRect(subGroup, topX, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX + DELTA_SEPARATION, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX + DELTA_SEPARATION, topY + DELTA_SEPARATION, r, g, b, a)
  subGroup = addRect(subGroup, topX + DELTA_SEPARATION, topY + 2 * DELTA_SEPARATION, r, g, b, a)

  return lGroup
end

-- BOX
local function createBox(x, y, r, g, b, a)
  local boxGroup, subGroup = createShapeGroups(x, y)

  subGroup = addRect(subGroup, topX, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX + DELTA_SEPARATION, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX, topY + DELTA_SEPARATION, r, g, b, a)
  subGroup = addRect(subGroup, topX + DELTA_SEPARATION, topY + DELTA_SEPARATION, r, g, b, a)

  return boxGroup
end

-- Z
local function createZ(x, y, r, g, b, a)
  local zGroup, subGroup = createShapeGroups(x, y)

  subGroup = addRect(subGroup, topX, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX + DELTA_SEPARATION, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX + DELTA_SEPARATION, topY + DELTA_SEPARATION, r, g, b, a)
  subGroup = addRect(subGroup, topX + 2 * DELTA_SEPARATION, topY + DELTA_SEPARATION, r, g, b, a)

  return zGroup
end

-- S
local function createS(x, y, r, g, b, a)
  local sGroup, subGroup = createShapeGroups(x, y)

  subGroup = addRect(subGroup, topX + 2 * DELTA_SEPARATION, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX + DELTA_SEPARATION, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX + DELTA_SEPARATION, topY + DELTA_SEPARATION, r, g, b, a)
  subGroup = addRect(subGroup, topX, topY + DELTA_SEPARATION, r, g, b, a)

  return sGroup
end

-- T
local function createT(x, y, r, g, b, a)
  local tGroup, subGroup = createShapeGroups(x, y)

  subGroup = addRect(subGroup, topX, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX + DELTA_SEPARATION, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX + 2 * DELTA_SEPARATION, topY, r, g, b, a)
  subGroup = addRect(subGroup, topX + DELTA_SEPARATION, topY + DELTA_SEPARATION, r, g, b, a)

  return tGroup
end

local t = createT(50, 350, 1, 0.5, 0, 0.8)
local line = createLine(50, 50, 0, 1, 0, 0.8)
local inverseL = createInverseL(50, 150, 1, 0, 0, 0.8)
local l = createL(50, 250, 0, 0, 1, 0.8)
local box = createBox(200, 50, 0, 1, 1, 0.8)
local z = createZ(200, 150, 0.5, 0.5, 0, 0.8)
local s = createS(200, 250, 0.5, 0.2, 0.8, 0.8)
