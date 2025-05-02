return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    autoformat = true,
    format_on_save = true,
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      pyright = {},
      -- tsserver will be automatically installed with mason and loaded with lspconfig
      -- tsserver = {},
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          -- "--header-insertion=iwyu",
          "--header-insertion=never",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--compile-commands-dir=./",
          -- "--query-driver=/usr/bin/g++",
          -- icx/icpx
          "--query-driver=/opt/intel/oneapi/compiler/*/bin/icx, /opt/intel/oneapi/compiler/*/bin/icpx,/usr/bin/g++,/usr/bin/clang++,*gcc,*clang",
        },
      },
      dockerls = {},
      docker_compose_language_service = {},
    },
    -- you can do any additional lsp server setup here
    -- return true if you don't want this server to be setup with lspconfig
    ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
    setup = {
      tsserver = function(_, opts)
        require("typescript").setup({ server = opts })
        return true
      end,
      clangd = function(_, opts)
        return false -- use lspconfig for clangd setup
      end,
    },
  },
}
