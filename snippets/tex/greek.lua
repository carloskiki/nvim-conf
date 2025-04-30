in_mathzone = function()
    -- The `in_mathzone` function requires the VimTeX plugin
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
    -- Greek letters
    s({ trig = "@a", snippetType = "autosnippet", wordTrig = false }, { t("\\alpha"), }, { condition = in_mathzone }),
    s({ trig = "@A", snippetType = "autosnippet", wordTrig = false }, { t("\\alpha"), }, { condition = in_mathzone }),
    s({ trig = "@b", snippetType = "autosnippet", wordTrig = false }, { t("\\beta"), }, { condition = in_mathzone }),
    s({ trig = "@B", snippetType = "autosnippet", wordTrig = false }, { t("\\beta"), }, { condition = in_mathzone }),
    s({ trig = "@c", snippetType = "autosnippet", wordTrig = false }, { t("\\chi"), }, { condition = in_mathzone }),
    s({ trig = "@C", snippetType = "autosnippet", wordTrig = false }, { t("\\chi"), }, { condition = in_mathzone }),
    s({ trig = "@g", snippetType = "autosnippet", wordTrig = false }, { t("\\gamma"), }, { condition = in_mathzone }),
    s({ trig = "@G", snippetType = "autosnippet", wordTrig = false }, { t("\\Gamma"), }, { condition = in_mathzone }),
    s({ trig = "@d", snippetType = "autosnippet", wordTrig = false }, { t("\\delta"), }, { condition = in_mathzone }),
    s({ trig = "@D", snippetType = "autosnippet", wordTrig = false }, { t("\\Delta"), }, { condition = in_mathzone }),
    s({ trig = "@e", snippetType = "autosnippet", wordTrig = false }, { t("\\epsilon"), }, { condition = in_mathzone }),
    s({ trig = "@E", snippetType = "autosnippet", wordTrig = false }, { t("\\epsilon"), }, { condition = in_mathzone }),
    s({ trig = ":e", snippetType = "autosnippet", wordTrig = false }, { t("\\varepsilon"), }, { condition = in_mathzone }),
    s({ trig = ":E", snippetType = "autosnippet", wordTrig = false }, { t("\\varepsilon"), }, { condition = in_mathzone }),
    s({ trig = "@z", snippetType = "autosnippet", wordTrig = false }, { t("\\zeta"), }, { condition = in_mathzone }),
    s({ trig = "@Z", snippetType = "autosnippet", wordTrig = false }, { t("\\zeta"), }, { condition = in_mathzone }),
    s({ trig = "@t", snippetType = "autosnippet", wordTrig = false }, { t("\\theta"), }, { condition = in_mathzone }),
    s({ trig = "@T", snippetType = "autosnippet", wordTrig = false }, { t("\\Theta"), }, { condition = in_mathzone }),
    s({ trig = "@k", snippetType = "autosnippet", wordTrig = false }, { t("\\kappa"), }, { condition = in_mathzone }),
    s({ trig = "@K", snippetType = "autosnippet", wordTrig = false }, { t("\\kappa"), }, { condition = in_mathzone }),
    s({ trig = "@l", snippetType = "autosnippet", wordTrig = false }, { t("\\lambda"), }, { condition = in_mathzone }),
    s({ trig = "@L", snippetType = "autosnippet", wordTrig = false }, { t("\\Lambda"), }, { condition = in_mathzone }),
    s({ trig = "@m", snippetType = "autosnippet", wordTrig = false }, { t("\\mu"), }, { condition = in_mathzone }),
    s({ trig = "@M", snippetType = "autosnippet", wordTrig = false }, { t("\\mu"), }, { condition = in_mathzone }),
    s({ trig = "@r", snippetType = "autosnippet", wordTrig = false }, { t("\\rho"), }, { condition = in_mathzone }),
    s({ trig = "@R", snippetType = "autosnippet", wordTrig = false }, { t("\\rho"), }, { condition = in_mathzone }),
    s({ trig = "@s", snippetType = "autosnippet", wordTrig = false }, { t("\\sigma"), }, { condition = in_mathzone }),
    s({ trig = "@S", snippetType = "autosnippet", wordTrig = false }, { t("\\Sigma"), }, { condition = in_mathzone }),
    s({ trig = "ome", snippetType = "autosnippet", wordTrig = false }, { t("\\omega"), }, { condition = in_mathzone }),
    s({ trig = "@o", snippetType = "autosnippet", wordTrig = false }, { t("\\omega"), }, { condition = in_mathzone }),
    s({ trig = "@O", snippetType = "autosnippet", wordTrig = false }, { t("\\Omega"), }, { condition = in_mathzone }),
    s({ trig = "@p", snippetType = "autosnippet", wordTrig = false }, { t("\\phi"), }, { condition = in_mathzone }),
    s({ trig = "@P", snippetType = "autosnippet", wordTrig = false }, { t("\\Phi"), }, { condition = in_mathzone }),
}
