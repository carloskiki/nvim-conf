local function env(name)
    local lnum_start = vim.fn["vimtex#env#is_inside"](name)[1]
    print(lnum_start)
    return lnum_start ~= 0
end

local function in_matrix()
    return env("bmatrix")
end

return {
    -- Tabs in matrix mode
    s({ trig = "([^%s])", trigEngine = "pattern" }, { f(function(_, snip) return snip.captures[1] .. " & " end), },
        { condition = in_matrix }),
    -- 
}
