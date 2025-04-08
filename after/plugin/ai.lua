if vim.env.LLM_CMP then
    require('minuet').setup {
        provider = 'openai_fim_compatible',
        n_completions = 1, -- recommend for local model for resource saving
        context_window = 512,
        provider_options = {
            openai_fim_compatible = {
                api_key = 'TERM',
                name = 'Llama.cpp',
                end_point = 'http://192.168.1.254:9998/v1/completions',
                -- The model is set by the llama-cpp server and cannot be altered
                -- post-launch.
                model = 'Qwen2.5 Coder Autocomplete',
                optional = {
                    max_tokens = 56,
                    top_p = 0.9,
                },
                template = {
                    prompt = function(context_before_cursor, context_after_cursor, _)
                        return '<|fim_prefix|>'
                            .. context_before_cursor
                            .. '<|fim_suffix|>'
                            .. context_after_cursor
                            .. '<|fim_middle|>'
                    end,
                    suffix = false,
                },
            },
        },
        virtualtext = {
            auto_trigger_ft = { '*' },
            keymap = {
                -- accept whole completion
                accept = '<A-A>',
                -- accept one line
                accept_line = '<A-a>',
                -- accept n lines (prompts for number)
                -- e.g. "A-z 2 CR" will accept 2 lines
                accept_n_lines = '<A-z>',
                -- Cycle to prev completion item, or manually invoke completion
                prev = '<A-[>',
                -- Cycle to next completion item, or manually invoke completion
                next = '<A-]>',
                dismiss = '<A-e>',
            },
        },
    }
end
