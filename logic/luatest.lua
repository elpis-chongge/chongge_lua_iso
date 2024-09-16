require("Lplus")
require("TrieTree")
require("Utility")
_G.block_word_list = {}
require("SensitiveWords")
local len = #SensitiveWords
print(string.format("屏蔽词库共有%d词条", len))
local testStr = "我爱胡锦涛"
print("被检查词条长度", #GetDivideStringList(testStr))
local profiler = require("profiler")
local newProfiler = profiler()
newProfiler:start()
local ACTrie = require("ACTrie").CreateACTrie()
if SensitiveWords then
  local len = #SensitiveWords
  for i = 1, len do
    ACTrie:Insert(SensitiveWords[i], i)
  end
end
ACTrie:BuildFail()
newProfiler:stop()
local tl, edTime = newProfiler:report()
print("AC自动机 建树消耗时间 ", edTime)
newProfiler:start()
local acResult = ACTrie:FilterBlockedWords(testStr)
newProfiler:stop()
local tl, filterTime = newProfiler:report()
print("AC自动机敏感词过滤消耗的时间: ", filterTime)
newProfiler:start()
_G.BlockWordTrieTree = _G.TrieTree.CreateTrieTree()
if SensitiveWords then
  local len = #SensitiveWords
  for i = 1, len do
    _G.BlockWordTrieTree:Insert(SensitiveWords[i], i)
  end
end
newProfiler:stop()
local tl, edTime = newProfiler:report()
print("Trie 构建trie树消耗时间 ", edTime)
newProfiler:start()
local trieResult = _G.BlockWordTrieTree:FilterBlockedWords(testStr)
newProfiler:stop()
local tl, trieFilterTime = newProfiler:report()
print("Trie 敏感词过滤消耗的时间: ", trieFilterTime)
print("AC自动机过滤后的文本 ", string.gsub(acResult, "*", ""))
print("Trie过滤后的文本 ", string.gsub(trieResult, "*", ""))
print("AC自动机过滤后的文本 ", acResult)
print("Trie过滤后的文本 ", trieResult)
print("AC自动机过滤后是否存在屏蔽字 ", _G.BlockWordTrieTree:IsContainBlockedWord(acResult))
print("Trie过滤后是否存在屏蔽字 ", _G.BlockWordTrieTree:IsContainBlockedWord(trieResult))
