TrieTree = {}
local GetDivideStringList = function(sourceString)
  local divideList = {}
  local len = string.len(sourceString)
  local stPos = 1
  local utf8Sign = {
    192,
    224,
    240,
    248,
    252
  }
  while len >= stPos do
    local sign = string.byte(sourceString, stPos)
    local chLen = 1
    for i = 1, 6 do
      if sign < utf8Sign[i] then
        chLen = i
        break
      end
    end
    local ch = string.sub(sourceString, stPos, stPos + chLen - 1)
    stPos = stPos + chLen
    table.insert(divideList, ch)
  end
  return divideList
end

function TrieTree.CreateTree()
  local tree = {}
  
  function tree:Init()
    self.trie = {}
    self.idx = {}
    self.depth = {}
    self.tot = 0
  end
  
  function tree:Insert(sourceStr, id)
    local trie = self.trie
    if trie then
      sourceStr = string.gsub(sourceStr, " ", "")
      local divideStr = GetDivideStringList(sourceStr)
      local len = #divideStr
      local u = 0
      self.depth[u] = 0
      local str
      local string_lower = string.lower
      for i = 1, len do
        str = string_lower(divideStr[i])
        if nil == trie[u] then
          self.tot = self.tot + 1
          trie[u] = {
            [str] = self.tot
          }
          u = self.tot
        elseif nil == trie[u][str] then
          self.tot = self.tot + 1
          trie[u][str] = self.tot
          u = self.tot
        else
          u = trie[u][str]
        end
        self.depth[u] = i
      end
      self.idx[u] = id
    end
  end
  
  function tree:IsContainBlockedWord(sourceStr)
    if nil ~= sourceStr and "" ~= sourceStr then
      sourceStr = string.gsub(sourceStr, " ", "")
      local divideStr = GetDivideStringList(sourceStr)
      if divideStr then
        local len = #divideStr
        for i = 1, len do
          divideStr[i] = string.lower(divideStr[i])
        end
        local nodeID = 0
        local trie = self.trie
        if trie then
          for i = 1, len do
            nodeID = trie[0][divideStr[i]]
            local matchCount = 0
            while nodeID and 0 ~= nodeID do
              matchCount = matchCount + 1
              if self.idx and self.idx[nodeID] then
                return true
              end
              if trie[nodeID] then
                nodeID = trie[nodeID][divideStr[i + matchCount]] or 0
              else
                break
              end
            end
          end
        end
      end
    end
    return false
  end
  
  function tree:FilterBlockedWords(sourceStr)
    local ans = ""
    if nil ~= sourceStr and "" ~= sourceStr then
      local matchStartPos = {}
      local matchEndPos = {}
      local divideStr = GetDivideStringList(sourceStr)
      if divideStr then
        local len = #divideStr
        local currentCh = ""
        local nextCh = ""
        local nodeID = 0
        local strMatchEndPos = 0
        local trie = self.trie
        if trie then
          for i = 1, len do
            currentCh = string.lower(divideStr[i])
            nodeID = trie[0][currentCh] or 0
            local matchCount = 0
            while nodeID and 0 ~= nodeID do
              matchCount = matchCount + 1
              if self.idx and self.idx[nodeID] then
                if not matchStartPos[i] then
                  matchStartPos[i] = 1
                else
                  matchStartPos[i] = matchStartPos[i] + 1
                end
                strMatchEndPos = i + self.depth[nodeID] - 1
                if not matchEndPos[strMatchEndPos] then
                  matchEndPos[strMatchEndPos] = 1
                else
                  matchEndPos[strMatchEndPos] = matchEndPos[strMatchEndPos] + 1
                end
              end
              if trie[nodeID] and divideStr[i + matchCount] then
                nextCh = string.lower(divideStr[i + matchCount])
                nodeID = trie[nodeID][nextCh] or 0
              else
                matchCount = 0
                break
              end
            end
          end
        end
        local stackDepth = 0
        for i = 1, len do
          if matchStartPos[i] then
            stackDepth = stackDepth + matchStartPos[i]
          end
          if stackDepth > 0 then
            divideStr[i] = "*"
          end
          if matchEndPos[i] then
            stackDepth = stackDepth - matchEndPos[i]
          end
        end
        ans = table.concat(divideStr)
      end
    end
    return ans
  end
  
  tree:Init()
  return tree
end
