local AGS = AwesomeGuildStore

local MultiChoiceFilterBase = AGS.class.MultiChoiceFilterBase

local FILTER_ID = AGS.data.FILTER_ID
local SUB_CATEGORY_ID = AGS.data.SUB_CATEGORY_ID

local UnknownGearFilter = MultiChoiceFilterBase:Subclass()
AGS.class.UnknownGearFilter = UnknownGearFilter

function UnknownGearFilter:New(...)
    return MultiChoiceFilterBase.New(self, ...)
end

function UnknownGearFilter:Initialize()

  local filterIcons = {}
  filterIcons[1] = {
    id = 1,
    label = "Unknown Weapons",
    icon = "EsoUI/Art/CharacterCreate/charactercreate_faceicon_%s.dds",
  }
  filterIcons[2] = {
    id = 2,
    label = "Unknown Armor",
    icon = "EsoUI/Art/CharacterCreate/charactercreate_faceicon_%s.dds",
  }
  filterIcons[3] = {
    id = 3,
    label = "Unknown Jewelry",
    icon = "EsoUI/Art/CharacterCreate/charactercreate_faceicon_%s.dds",
  }

  --!need to get FILTER_ID.UNKNOWN_GEAR_FILTER registered in AGS FilterIds.lua
	--MultiChoiceFilterBase.Initialize(self, FILTER_ID.UNKNOWN_GEAR_FILTER, AGS.class.FilterBase.GROUP_LOCAL, ("Unknown Gear"), filterIcons )
  MultiChoiceFilterBase.Initialize(self, 999, AGS.class.FilterBase.GROUP_LOCAL, ("Unknown Gear"), filterIcons )

  self:SetEnabledSubcategories({
    [SUB_CATEGORY_ID.ALL] = true,
  })
end


function UnknownGearFilter:SetSelected(value, selected, silent)
	MultiChoiceFilterBase.SetSelected(self, value, selected, silent)

end


function UnknownGearFilter:SetValues(selection)

  self:HandleChange(currentSelection)
end


function UnknownGearFilter:Reset(silent)

	MultiChoiceFilterBase.Reset(self, silent)
end

function UnknownGearFilter:FilterLocalResult(itemData)

  return self.localSelection[value]
end

function AGS_UGF.initAGS()
  --!need to get FILTER_ID.UNKNOWN_GEAR_FILTER registered in AGS FilterIds.lua
	--MultiChoiceFilterBase.Initialize(self, FILTER_ID.UNKNOWN_GEAR_FILTER, AGS.class.FilterBase.GROUP_LOCAL, ("Unknown Gear"), filterIcons )
  AGS:RegisterFilter(UnknownGearFilter:New())
  AGS:RegisterFilterFragment(AGS.class.MultiButtonFilterFragment:New(999))
end