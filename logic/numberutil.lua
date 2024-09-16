local NumberUtil = {}
local romeList = {
  "Ⅰ",
  "Ⅱ",
  "Ⅲ",
  "Ⅳ",
  "Ⅴ",
  "Ⅵ",
  "Ⅶ",
  "Ⅷ",
  "Ⅸ",
  "Ⅹ"
}

function NumberUtil.IntToRome(number)
  return romeList[number] or ""
end

return NumberUtil
