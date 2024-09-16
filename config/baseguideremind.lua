BaseGuideRemind = {
  [70700000] = {
    id = 70700000,
    window_name = "HomeWindow",
    ctrl_id = "MiddleZone/AdventureBtn",
    level_range = {5, 40},
    wait_time = 3,
    bubble_state = 1,
    bubble_pos = {0, 0},
    bubble_text = function()
      return T(80010000)
    end
  },
  [70700001] = {
    id = 70700001,
    window_name = "ArenaWindow",
    ctrl_id = "BattleInfo/Enemy2",
    level_range = {12, 40},
    wait_time = 2,
    bubble_state = 1,
    bubble_pos = {0, 0},
    bubble_text = function()
      return T(80010000)
    end
  }
}
