return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            { "<F5>", function() require("dap").continue() end, desc = "DAP continue" },
            { "<F10>", function() require("dap").step_over() end, desc = "DAP step over" },
            { "<F11>", function() require("dap").step_into() end, desc = "DAP step into" },
            { "<F12>", function() require("dap").step_out() end, desc = "DAP step out" },
            { "<leader>b", function() require("dap").toggle_breakpoint() end, desc = "DAP toggle breakpoint" },
        },
        dependencies = {
            {
                "leoluz/nvim-dap-go",
                config = function()
                    require("dap-go").setup({
                        dap_configurations = {
                            {
                                -- Must be "go" or it will be ignored by the plugin
                                type = "go",
                                name = "Attach remote",
                                mode = "remote",
                                request = "attach",
                            },
                        },
                        delve = {
                            -- Path to the `dlv` executable used for debugging.
                            path = "dlv",
                            initialize_timeout_sec = 20,
                            -- "${port}" tells nvim-dap to pick a random free port.
                            port = "${port}",
                            args = {},
                            build_flags = "",
                        },
                    })
                end,
            },
        },
    },
}
