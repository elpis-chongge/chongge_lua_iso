function GetPartStruct(param)
  return {
    id = param.id or "",
    
    next_part = param.next_part or "",
    section_ids = param.section_ids or "",
    title = param.title or "",
    skip_tips = param.skip_tips or "",
    use_static = param.use_static or ""
  }
end

function GetSectionStruct(param)
  return {
    id = param.id or "",
    bg_id = param.bg_id or "",
    dialog_ids = param.dialog_ids or "",
    bg_effect_in = param.bg_effect_in or PLOT_BG_IN_EFFECT.NONE[2],
    bg_effect_out = param.bg_effect_out or PLOT_BG_OUT_EFFECT.NONE[2],
    skip = param.skip or "0"
  }
end

function GetDialogStruct(param)
end
