local MathUtil = {}
local m_sqrt = math.sqrt
local m_acos = math.acos
local m_sin = math.sin
local m_pi = math.pi

function MathUtil.GetVector3Dot(v1, v2)
  return v1.x * v2.x + v1.y * v2.y + v1.z * v2.z
end

function MathUtil.GetVector3Cross(v1, v2)
  local v3 = {
    x = v1.y * v2.z - v2.y * v1.z,
    y = v2.x * v1.z - v1.x * v2.z,
    z = v1.x * v2.y - v2.x * v1.y
  }
  return v3
end

function MathUtil.GetVector3Module(v)
  return MathUtil.TruncateFloat(m_sqrt(v.x * v.x + v.y * v.y + v.z * v.z))
end

function MathUtil.GetVector3Angle(v1, v2)
  local cos = MathUtil.TruncateFloat(MathUtil.GetVector3Dot(v1, v2) / MathUtil.GetVector3Module(v1) * MathUtil.GetVector3Module(v2))
  return MathUtil.TruncateFloat(m_acos(cos) * 180 / m_pi)
end

function MathUtil.GetNormVector3(vector3, norm)
  local ratio = MathUtil.TruncateFloat(norm / MathUtil.GetVector3Module(vector3))
  return {
    x = vector3.x * ratio,
    y = vector3.y * ratio,
    z = vector3.z * ratio
  }
end

function MathUtil.GetVector3Scale(vector3, scale)
  return {
    x = vector3.x * scale,
    y = vector3.y * scale,
    z = vector3.z * scale
  }
end

function MathUtil.GetVector3Subtract(v1, v2)
  return {
    x = v1.x - v2.x,
    y = v1.y - v2.y,
    z = v1.z - v2.z
  }
end

function MathUtil.GetVector3Add(v1, v2)
  return {
    x = v1.x + v2.x,
    y = v1.y + v2.y,
    z = v1.z + v2.z
  }
end

function MathUtil.RotationWithY(direction, angle)
  local rad = math.rad(angle)
  local x1 = direction.x * math.cos(rad) - direction.z * math.sin(rad)
  local z1 = direction.x * math.sin(rad) + direction.z * math.cos(rad)
  return {
    x = x1,
    y = direction.y,
    z = z1
  }
end

function MathUtil.GetProjection(v1, v2)
  local m_v2 = MathUtil.GetVector3Module(v2)
  local ratio = MathUtil.TruncateFloat(MathUtil.GetVector3Dot(v1, v2) / m_v2 / m_v2)
  return {
    x = v2.x * ratio,
    y = v2.y * ratio,
    z = v2.z * ratio
  }
end

function MathUtil.GetDistanceToLine(p1, p_start, p_end)
  local v = MathUtil.GetVector3Subtract(p_end, p_start)
  if MathUtil.GetVector3Module(v) <= 0 then
    local tempV = MathUtil.GetVector3Subtract(p1, p_start)
    return MathUtil.GetVector3Module(tempV)
  end
  local tempV = MathUtil.GetVector3Subtract(p1, p_start)
  local m_v = MathUtil.GetVector3Module(v)
  local m_tempV = MathUtil.GetVector3Module(tempV)
  local dot = MathUtil.GetVector3Dot(v, tempV)
  if 0 == dot then
    return m_tempV
  end
  local angle = m_acos(MathUtil.TruncateFloat(dot / m_v / m_tempV))
  local h = MathUtil.TruncateFloat(m_sin(angle) * m_tempV)
  return h
end

function MathUtil.FormatFloatNum(num)
  if num <= 0 then
    return 0
  else
    local str = tostring(num)
    local strs = Split(str, ".")
    print("FormatFloatNum", num, str, strs[1], strs[2])
    if #strs > 1 then
      if 0 == tonumber(strs[2]) then
        return tonumber(strs[1])
      else
        return num
      end
    else
      return num
    end
  end
end

function MathUtil.TruncateFloat(num)
  local intPart, fracPart = math.modf(num)
  fracPart = fracPart * 10000 - fracPart * 10000 % 1
  return intPart + fracPart / 10000
end

function MathUtil.TruncateFloatN(num, n, isMirror)
  if isMirror then
    num = -num
  end
  n = 10 ^ n
  local intPart, fracPart = math.modf(num)
  fracPart = fracPart * n - fracPart * n % 1
  num = intPart + fracPart / n
  if isMirror then
    num = -num
  end
  return num
end

return MathUtil
