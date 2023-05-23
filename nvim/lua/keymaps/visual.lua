local wk = require("which-key")

-- Leader mappings
wk.register({
    ["/"] = {"gc", "Comment selected block"},
}, { mode = "v", prefix = "<leader>" })
