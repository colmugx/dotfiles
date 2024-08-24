local function mergeTables(t1, t2)
  local result = {}

  -- 复制第一个表的所有元素
  for k, v in pairs(t1) do
    result[k] = v
  end

  -- 复制第二个表的所有元素，如果键已存在则覆盖
  for k, v in pairs(t2) do
    result[k] = v
  end

  return result
end

return mergeTables
