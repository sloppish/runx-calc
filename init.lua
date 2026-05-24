if (runx.api_version or 0) < 1 then
  error("Runx plugin API v1 or newer is required")
end

local function trim(value)
  return value:gsub("^%s+", ""):gsub("%s+$", "")
end

local function calculate(expression)
  return trim(runx.exec_capture("qalc", { "-t", expression }, true))
end

return {
  id = "calc",
  name = "Calculator",
  badge = "CALC",
  stateless = true,

  commands = {
    calc = "search_calc",
  },

  search_calc = function(raw)
    local expression = trim(raw)
    if expression == "" then
      return {}
    end

    local ok, result = pcall(calculate, expression)
    if not ok or result == "" then
      return {}
    end

    return {
      {
        id = "calc:" .. expression,
        title = result,
        style = "compact",
        subtitle = expression,
        score = 1000,
        payload = {
          kind = "copy_result",
          result = result,
        },
      },
    }
  end,

  run = function(payload)
    if payload.kind == "copy_result" then
      runx.copy_text(payload.result)
      return "Copied result"
    end

    error("unknown calc action: " .. tostring(payload.kind))
  end,
}
