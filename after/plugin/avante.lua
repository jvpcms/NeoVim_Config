local md = require("render-markdown")
local avante = require("avante")

md.setup({
    file_types = { "markdown", "Avante" },
})

avante.setup({
    provider = "gemini",
    providers = {
        gemini = {
            model = "gemini-3-pro-preview",
            extra_request_body = {
                temperature = 0,
                max_tokens = 4096,
            },
        },
    },
})
