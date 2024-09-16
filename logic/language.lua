local Language = {
  curLanguage = nil,
  curLanguageVoice = nil,
  curVoiceFolder = nil,
  wordConfigName = nil
}
LANGUAGE_ENUM = {
  CN = "cn",
  JP = "jp",
  TC = "tc"
}

function Language.Init()
  Language.curLanguage = LocalizationManager:GetCurLanguageFlag()
  Language.curLanguageVoice = LocalizationManager:GetCurLanguageVoiceFlag()
  Language.curVoiceFolder = string.format("voice_%s", Language.curLanguageVoice)
  Language.wordConfigName = "BaseWord_" .. Language.curLanguage
  Language.plotWordConfigName = "BasePlotWord_" .. Language.curLanguage
end

function Language.UpdateLanguage(language)
  if Language.curLanguage ~= language then
    Language.wordConfigName = "BaseWord_" .. language
    Language.plotWordConfigName = "BasePlotWord_" .. language
    Language.curLanguage = language
  end
end

function Language.UpdateLanguageVoice(language)
  if Language.curLanguageVoice ~= language then
    Language.curVoiceFolder = string.format("voice_%s", language)
    Language.curLanguageVoice = language
  end
end

function Language.ReplaceLanguageVoicePath(path)
  if nil == path then
    return
  end
  if Language.curLanguageVoice ~= "cn" then
    return string.gsub(path, "voice_cn", Language.curVoiceFolder)
  else
    return path
  end
end

Language.Init()
return Language
