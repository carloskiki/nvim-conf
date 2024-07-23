not_mathzone = function()
    -- The `in_mathzone` function requires the VimTeX plugin
    return vim.fn['vimtex#syntax#in_mathzone']() ~= 1
end

in_mathzone = function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
    -- Math Environments
    s(
        { trig = "mk", snippetType = "autosnippet" },
        { t("$"), i(1), t("$") },
        { condition = not_mathzone }
    ),
    s(
        { trig = "dm", snippetType = "autosnippet" },
        { t({ "\\[", "   " }), i(1), t({ "", "\\]" }) },
        { condition = not_mathzone }
    ),
    s(
        { trig = "beg", snippetType = "autosnippet" },
        { t("\\begin{"), i(1), t({"}", "\t"}), i(2), t({"", "\\end{"}), rep(1), t("}") },
        { condition = not_mathzone }
    ),
    -- Text in math
    s("te", { t("\\text{"), i(1), t("}"), i(0) }, { condition = in_mathzone }),
    s({ trig = "text", snippetType = "autosnippet" }, { t("\\text{"), i(1), t("}") }, { condition = in_mathzone }),
    -- Fonts
    s({ trig = "mcal", snippetType = "autosnippet" }, { t("\\mathcal{"), i(1), t("}") }, { condition = in_mathzone }),
    s({ trig = "mbb", snippetType = "autosnippet" }, { t("\\mathbb{"), i(1), t("}"), }, { condition = in_mathzone }),
    s({ trig = "bf", snippetType = "autosnippet" }, { t("\\mathbf{"), i(1), t("}") }, { condition = in_mathzone }),
    s({ trig = "rm", snippetType = "autosnippet" }, { t("\\mathrm{"), i(1), t("}") }, { condition = in_mathzone }),
    -- brackets, aligns, arrays, and matrices
    s({ trig = "set", snippetType = "autosnippet" }, { t("\\{"), i(1), t("\\}") }, { condition = in_mathzone }),
    s({ trig = "lra", snippetType = "autosnippet" }, { t("\\left<"), i(1), t("\\right>") }, { condition = in_mathzone }),
    s({ trig = "lr|", snippetType = "autosnippet" }, { t("\\left|"), i(1), t("\\right|") }, { condition = in_mathzone }),
    s({ trig = "pmat", snippetType = "autosnippet" }, { t({ "\\begin{pmatrix}", "" }), i(1), t({ "", "\\end{pmatrix}" }) },
        { condition = in_mathzone }),
    s({ trig = "bmat", snippetType = "autosnippet" }, { t({ "\\begin{bmatrix}", "" }), i(1), t({ "", "\\end{bmatrix}" }) },
        { condition = in_mathzone }),
    s({ trig = "Bmat", snippetType = "autosnippet" }, { t({ "\\begin{Bmatrix}", "" }), i(1), t({ "", "\\end{Bmatrix}" }) },
        { condition = in_mathzone }),
    s({ trig = "vmat", snippetType = "autosnippet" }, { t({ "\\begin{vmatrix}", "" }), i(1), t({ "", "\\end{vmatrix}" }) },
        { condition = in_mathzone }),
    s({ trig = "Vmat", snippetType = "autosnippet" }, { t({ "\\begin{Vmatrix}", "" }), i(1), t({ "", "\\end{Vmatrix}" }) },
        { condition = in_mathzone }),
    s({ trig = "case", snippetType = "autosnippet" }, { t({ "\\begin{cases}", "" }), i(1), t({ "", "\\end{cases}" }) },
        { condition = in_mathzone }),
    s({ trig = "array", snippetType = "autosnippet" }, { t({ "\\begin{array}", "" }), i(1), t({ "", "\\end{array}" }) },
        { condition = in_mathzone }),
    s({ trig = "matrix", snippetType = "autosnippet" }, { t({ "\\begin{matrix}", "" }), i(1), t({ "", "\\end{matrix}" }) },
        { condition = in_mathzone }),
    s({ trig = "amat", snippetType = "autosnippet" },
        { t("\\left[\\begin{array}{@{}*{"), i(1), t({"}{c}|c@{}}", ""}), i(2), t({"", "\\end{array}\\right]"}) },
        { condition = in_mathzone }),
}
