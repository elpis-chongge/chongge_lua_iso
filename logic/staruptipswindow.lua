require("Card_StarUpTipsWindowByName")
local StarUpTipsWindow = {}
local uis, contentPane, msg, bgPrefab, startPos, backEffect

function StarUpTipsWindow.ReInitData()
end

function StarUpTipsWindow.OnInit(bridgeObj)
  bridgeObj:SetViewAsync(WinResConfig.StarUpTipsWindow.package, WinResConfig.StarUpTipsWindow.comName, function(com)
    contentPane = com
    contentPane:Center()
    uis = GetCard_StarUpTipsWindowUis(contentPane)
    if bridgeObj.argTable[1] then
      msg = bridgeObj.argTable[1]
    end
    backEffect = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/starrank/FX_ui_starrank_back.prefab")
    bgPrefab = ResourceManager.Instantiate("Assets/Art/Effects/Prefab/UI_prefab/starrank/FX_ui_starup_rank_5.prefab")
    local tran = LuaUtil.FindChild(bgPrefab.transform, "timeline", true)
    startPos = CardMgr.cardConfigData.grade_max - CardMgr.cardConfigData.star
    if msg.curStar > CardMgr.cardConfigData.star then
      startPos = startPos - (msg.curStar - CardMgr.cardConfigData.star)
    end
    LuaUtil.SetTimeLine(tran.gameObject, string.format("Assets/Art/Animation/StarUp/UI_starup_%s_timeline.playable", msg.curStar + startPos))
    local camera = bgPrefab:GetComponentInChildren(typeof(Camera), true)
    camera.gameObject:GetOrAddComponent(typeof(CS.AutoAdaptScreen))
    StarUpTipsWindow.InitInfo()
    SoundUtil.PlayUISfx(SOUND_EVENT_ENUM.CARD_STAR_UP)
  end)
end

function StarUpTipsWindow.LoadCardTexture()
  local fashionId = CardMgr.cardInfoData.fashionId
  local fashionConfig = TableData.GetConfig(fashionId, "BaseFashion")
  if fashionConfig.show_spine then
    UIUtil.SetCardShowSpineAutoAlpha(fashionId, uis.Main.CardShow.CardShowLoader, uis.Main.CardShow.CardShowHolder)
  end
  UIUtil.SetObjectToUI(backEffect, uis.Main.BackGround.BackGroundHolder)
  LuaUtil.SetLocalPos(backEffect, 667, -375, 0)
  StarUpTipsWindow.ShowStarEffect(backEffect)
end

function StarUpTipsWindow.ShowStarEffect()
  if backEffect then
    local func = function(root)
      if root then
        local star
        for i = 1, 5 do
          star = root:Find("star_" .. i)
          if star then
            if 5 == i then
              star:Find("lead_par (1)").gameObject:SetActive(false)
              star:Find("lead_par (2)").gameObject:SetActive(true)
              star:Find("lead_par (3)").gameObject:SetActive(false)
            else
              star:Find("lead_par (1)").gameObject:SetActive(i > CardMgr.cardInfoData.grade - 1)
            end
          end
        end
      end
    end
    local root = LuaUtil.FindChild(backEffect.transform, "GameObject (2)", true)
    root = LuaUtil.FindChild(root, "mesh_loft_circle_2", true)
    func(root)
    root = LuaUtil.FindChild(backEffect.transform, "GameObject (3)", true)
    root = LuaUtil.FindChild(root, "mesh_loft_circle_2", true)
    func(root)
  end
end

function StarUpTipsWindow.InitInfo()
  local data = TableData.GetConfig(msg.skillId, "BaseSkill")
  if data then
    uis.Main.SkillInfoAni.OpenTxt.text = T(803)
    uis.Main.SkillInfoAni.PicLoader.url = UIUtil.GetResUrl(data.icon)
    uis.Main.SkillInfoAni.NameTxt.text = data.name and data.name() or ""
    local skillLevelUpConfig = TableData.GetConfig(data.id * 1000 + 1, "BaseSkillLevelUp")
    if skillLevelUpConfig and skillLevelUpConfig.des then
      function uis.Main.SkillInfoAni.WordList.itemRenderer(i, item)
        UIUtil.SetText(item, skillLevelUpConfig.des())
      end
      
      uis.Main.SkillInfoAni.WordList.numItems = 1
    end
    uis.Main.SkillInfoAni.root.alpha = 0
    LeanTween.delayedCall(1.53, function()
      StarUpTipsWindow.ShowStar(msg.curStar)
    end)
    LeanTween.delayedCall(2.0, function()
      StarUpTipsWindow.ShowStar(msg.curStar + 1)
      uis.Main.BackGround.BackGroundLoader.url = UIUtil.GetBackgroundUrl(FEATURE_ENUM.CARD_AWAKE)
      StarUpTipsWindow.LoadCardTexture()
      PlayUITrans(uis.Main.root, "up")
      uis.Main.SkillInfoAni.root.alpha = 1
      StarUpTipsWindow.InitBtn()
    end)
  end
end

function StarUpTipsWindow.ShowStar(lv)
  local root = LuaUtil.FindChild(bgPrefab.transform, "starrank_grp", true)
  for i = 1, 5 do
    local star = root:Find("star" .. i)
    if i <= startPos then
      star.gameObject:SetActive(false)
    else
      star.gameObject:SetActive(true)
      star:Find("starrank_2").gameObject:SetActive(true)
      star:Find("starrank_1").gameObject:SetActive(i < lv + startPos)
    end
  end
end

function StarUpTipsWindow.InitBtn()
  uis.Main.TouchScreenBtn.onClick:Set(function()
    UIMgr:CloseWindow(WinResConfig.StarUpTipsWindow.name)
    CardStarUpWindow.RefreshStarUp()
  end)
end

function StarUpTipsWindow.OnShown()
end

function StarUpTipsWindow.OnHide()
end

function StarUpTipsWindow.OnClose()
  ResourceManager.DestroyGameObject(bgPrefab)
  bgPrefab = nil
  uis = nil
  contentPane = nil
  msg = nil
  startPos = nil
  backEffect = nil
end

function StarUpTipsWindow.HandleMessage(msgId, para)
end

return StarUpTipsWindow
