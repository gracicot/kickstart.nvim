return function(module_name)
  -- Use package.searchpath to check if the module file exists
  -- (available in Lua 5.2+)
  local path, err = package.searchpath(module_name, package.path)
  if not path then
    return nil -- Module file doesn't exist, silently return nil
  end

  -- File exists, so require it normally.
  -- Any syntax/runtime errors inside the file will propagate as expected.
  return require(module_name)
end
