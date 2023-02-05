require('nvim-dap-virtual-text').setup()
local dap, dapui, ts = require("dap"), require("dapui"), require('telescope')
ts.load_extension('dap')

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug: Toggle [B]reakpoint' })
---@diagnostic disable-next-line: param-type-mismatch
vim.keymap.set('n', '<leader>dB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end,
    { desc = '[D]ebug: Set [B]reakpoint' })
---@diagnostic disable-next-line: param-type-mismatch
vim.keymap.set('n', '<leader>dl', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
    { desc = '[D]ebug: Set [L]og point' })
vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = '[D]ebug: Open [R]EPL' })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[D]ebug: [C]ontinue' })
vim.keymap.set('n', '<leader>do', dap.step_over, { desc = '[D]ebug: Step [O]ver' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]ebug: Step [I]nto' })
vim.keymap.set('n', '<leader>du', dap.step_out, { desc = '[D]ebug: Step [U]p' })
vim.keymap.set('n', '<leader>df', ts.extensions.dap.frames, { desc = '[D]ebug: Telescope [F]rames' })
vim.keymap.set('n', '<leader>dv', ts.extensions.dap.variables, { desc = '[D]ebug: Telescope [V]ariables' })

dap.configurations.rust = {
    {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        program = function()
            ---@diagnostic disable-next-line: redundant-parameter, param-type-mismatch
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}
dap.configurations.c = dap.configurations.rust
dap.configurations.cpp = dap.configurations.rust

dapui.setup({
    controls = {
        element = "repl",
        enabled = true,
        icons = {
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = ""
        }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
        border = "single",
        mappings = {
            close = { "q", "<Esc>" }
        }
    },
    force_buffers = true,
    icons = {
        collapsed = "",
        current_frame = "",
        expanded = ""
    },
    layouts = { {
        elements = { {
            id = "scopes",
            size = 0.25
        }, {
            id = "breakpoints",
            size = 0.25
        }, {
            id = "stacks",
            size = 0.25
        }, {
            id = "watches",
            size = 0.25
        } },
        position = "left",
        size = 40
    }, {
        elements = { {
            id = "repl",
            size = 0.5
        }, {
            id = "console",
            size = 0.5
        } },
        position = "bottom",
        size = 10
    } },
    mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
    },
    render = {
        indent = 1,
        max_value_lines = 100
    }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
