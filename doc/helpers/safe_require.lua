--- Require a module, returning nil if (and only if) that module doesn't exist.
--- Any other errors (syntax errors, runtime errors, missing nested dependencies)
--- are propagated normally.
---@param module string The module name to require
---@return any|nil The loaded module, or nil if not found
return function(module)
  local ok, result = pcall(require, module)
  if ok then
    return result
  end

  local not_found_pattern = "module '" .. module:gsub('([%.%-%+%*%?%[%]%^%$%(%)%%])', '%%%1') .. "' not found"
  if result and type(result) == 'string' and result:find(not_found_pattern, 1, true) then
    return nil
  end

  error(result, 2)
end
