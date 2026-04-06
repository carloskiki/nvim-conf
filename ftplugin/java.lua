local bundles = {
    vim.fn.glob("~/Bloat/com.microsoft.java.debug.plugin-0.53.2.jar")
}

local config = {
    name = "jdtls",
    cmd = { "jdtls" },

    init_options = {
        bundles = bundles,
    },
}

require('jdtls').start_or_attach(config)
