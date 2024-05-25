return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/neodev.nvim",

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    { "j-hui/fidget.nvim", opts = {} },

    -- Autoformatting
    "stevearc/conform.nvim",

    -- Schema information
    "b0o/SchemaStore.nvim",
  },
  config = function()
    require("neodev").setup()

    local capabilities = nil
    if pcall(require, "cmp_nvim_lsp") then
      capabilities = require("cmp_nvim_lsp").default_capabilities()
    end

    -- Enable the following language servers
    --  Add any additional override configuration in the following tables. Available keys are:
    --  - cmd (table): Override the default command used to start the server
    --  - filetypes (table): Override the default list of associated filetypes for the server
    --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
    --  - settings (table): Override the default settings passed when initializing the server.
    --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
    local servers = {
      rust_analyzer = {
        manual_install = true,
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
            },
            procMacro = {
              ignored = {
                leptos_macro = {
                  -- "component",
                  "server",
                },
              },
            },
          },
        },
      },
      lua_ls = {
        manual_install = true,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
              checkThirdParty = false,
              library = {
                "${3rd}/luv/library",
                unpack(vim.api.nvim_get_runtime_file("", true)),
              },
              -- If lua_ls is really slow on your computer, you can try this instead:
              -- library = { vim.env.VIMRUNTIME },
            },
            telemetry = { enable = false },
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
      nil_ls = {
        manual_install = true,
      },
      wgsl_analyzer = {},
      taplo = {},
      bashls = {},
      cssls = {},
      tsserver = {},
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      yamlls = {
        settings = {
          yaml = {
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
          },
        },
      },
    }

    local servers_to_install = vim.tbl_filter(function(key)
      local t = servers[key]
      if type(t) == "table" then
        return not t.manual_install
      else
        return t
      end
    end, vim.tbl_keys(servers))

    require("mason").setup({
      -- Use existing installation of binaries if available
      PATH = "append",
    })
    local ensure_installed = {
      "stylua",
      "lua_ls",
      "tailwindcss-language-server",
    }

    vim.list_extend(ensure_installed, servers_to_install)
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    for name, config in pairs(servers) do
      config = vim.tbl_deep_extend("force", {}, {
        capabilities = capabilities,
      }, config)

      require("lspconfig")[name].setup(config)
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
        map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", function()
          vim.lsp.buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
        end, "[C]ode [A]ction")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
      end,
    })

    -- Autoformatting
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        yaml = { "yamlfmt" },
        nix = { "nixpkgs_fmt" },
        ["_"] = { "trim_whitespace" },
      },
    })

    vim.keymap.set("n", "<leader>f", function()
      require("conform").format({
        lsp_fallback = true,
        async = true,
        quiet = true,
      })
    end, { desc = "[F]ormat buffer" })
  end,
}
