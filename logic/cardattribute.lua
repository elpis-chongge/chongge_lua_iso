CardAttribute = {}
ATTR_ENUM = {
  hp = "hp",
  max_hp = "max_hp",
  atk = "atk",
  def = "def",
  crt = "crt",
  blk = "blk",
  eva = "eva",
  crt_int = "crt_int",
  blk_int = "blk_int",
  spd_move = "spd_move",
  spd_atk = "spd_atk",
  range_atk = "range_atk",
  block_max = "block_max",
  stoic = "stoic",
  shield = "shield",
  max_rage = "max_rage",
  rage = "rage",
  rage_time = "rage_time",
  rage_atk = "rage_atk",
  rage_hit = "rage_hit",
  rage_kill = "rage_kill",
  block_count = "block_count",
  restraint_add = "restraint_add",
  restraint_sub = "restraint_sub",
  treat_add = "treat_add",
  be_treat_add = "be_treat_add",
  damage_add = "damage_add",
  damage_sub = "damage_sub",
  spd_move_enhance = "spd_move_enhance",
  spd_atk_enhance = "spd_atk_enhance",
  tenacity = "tenacity",
  shield_special = "shield_special"
}
local AttrNameToId = {}
local AttrIdToName = {}

function CardAttribute.InitAttrEnum()
  AttrNameToId = {}
  local configData = TableData.GetTable("BaseAttribute")
  if configData then
    for i, v in pairs(configData) do
      AttrNameToId[v.name] = v.id
      AttrIdToName[v.id] = v.name
    end
  end
end

CardAttribute.InitAttrEnum()

function CardAttribute.GetIdByName(name)
  return AttrNameToId[name]
end

function CardAttribute.GetNameById(attributeId)
  return AttrIdToName[attributeId]
end
