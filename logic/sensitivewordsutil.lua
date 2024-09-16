SensitiveWordsUtil = {}
local BlockWordTrieTree

function SensitiveWordsUtil.InitWords()
  if SensitiveWords == nil then
    require("SensitiveWords")
    local len = #SensitiveWords
    print(string.format("屏蔽词库共有%d词条", len))
    SensitiveWordsUtil.BuildWordTree()
  end
end

function SensitiveWordsUtil.BuildWordTree()
  require("TrieTree")
  local tree = TrieTree.CreateTree()
  BlockWordTrieTree = tree
  local words = SensitiveWords
  if words then
    local len = #words
    for i = 1, len do
      tree:Insert(words[i], i)
    end
  end
end

function SensitiveWordsUtil.FilterWord(originWord)
  local trieResult = BlockWordTrieTree:FilterBlockedWords(originWord)
  return trieResult
end

function SensitiveWordsUtil.IsContainBlockedWord(originWord)
  return BlockWordTrieTree:IsContainBlockedWord(originWord)
end
