local wk = require("which-key")
wk.register({
    d = { name = "Debugger" },
    f = { name = "Find" },
    g = { name = "Diagnostics" },
    j = { name = "AI" },
    l = { name = "LSP" },
    p = { name = "Project" },
}, { prefix = "<leader>" })
