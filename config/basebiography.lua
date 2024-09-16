BaseBiography = {
  [70610001] = {
    id = 70610001,
    name = function()
      return T(80626001)
    end,
    name_english = function()
      return T(80626101)
    end,
    pre = 0,
    next = {70610002},
    icon = "Biography:BiographyTab_1000",
    back_ground = "UIBackGround:Biography_1000",
    open_condition = {"70020100:1"},
    child_ids = {
      70620101,
      70620102,
      70620103,
      70620104,
      70620105,
      70620106,
      70620107,
      70620108,
      70620109,
      70620110,
      70620111,
      70620112,
      70620113,
      70620114
    },
    sort = 1,
    chapter_icon = "PlotDungeon:PlotChapter_1"
  },
  [70610002] = {
    id = 70610002,
    name = function()
      return T(80626002)
    end,
    name_english = function()
      return T(80626102)
    end,
    pre = 70610001,
    next = {0},
    icon = "Biography:BiographyTab_1001",
    back_ground = "UIBackGround:Biography_1000",
    open_condition = {"70020100:1"},
    child_ids = {
      70620201,
      70620202,
      70620203,
      70620204,
      70620205,
      70620206,
      70620207,
      70620208,
      70620209,
      70620210,
      70620211,
      70620212,
      70620213,
      70620214
    },
    sort = 2,
    chapter_icon = "PlotDungeon:PlotChapter_1"
  }
}
