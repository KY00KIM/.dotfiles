return {
  "nvim-mini/mini.starter",
  version = false, -- wait till new 0.7.0 release to put it back on semver
  event = "VimEnter",
  opts = function()
    local logo = table.concat({
      "                       ................                   ",
      "                     .......................              ",
      "                   ...........''''...........             ",
      "                 ...........''''..................        ",
      "                ...........''......................       ",
      "               ......................................     ",
      "              .............................. ........     ",
      "              .............  .................... ....    ",
      "               ..........   ....... .....'l;,co.. .       ",
      "                 ......    ...........':dO0kxkOd. .  .    ",
      "                  . ...,coollldkkdoodk0KKKK00OOkc         ",
      "                 ;cc:,,:cllox0KKKKKKK0xdolllldkkx.        ",
      "                .lxkoxkkxdoloO00KK00Oxlodxxkxoxkdc        ",
      "                :dxOkclc;;cldxO0KK0Okxlc;;:ocxOkdo.       ",
      "             l: loxk'Ooc' .odok0KXKkxox;c  :X:lkdo..o     ",
      "             dl.loxO0Nc   .oWkkKXXKOxXk.  .:XXkkdo'cd.    ",
      "             dkcloxO0XXkdx0XX00KXXXK0KX0xxOXXKOkdllxO     ",
      "             dOdloxk0KXNNNXXXK00KK0OKXXXNNNXX0OxolokO     ",
      -- "          'ox000OO000KKKXXXXKK0KXXK0KKXXXXXKKK00OO0K0dd;
      -- "          cOOOOOOOOOOOOOOOOOOO0000000000000000000000000k
      -- "          ;OOOOOOOOOOOOOOOOOOOOOOOOOOOO0000000000000000o
      -- "          .kkkkkkkkOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO000000:
      -- "          .kkkkkkkkkkkkkkkkkOOOOOOOOOOOOOOOOOOOOOOOOOOO,
      -- "          .xkkkkkkkkkkkkkkkkkkkkkOOkkkOOOOOOOOOOOOOOOOO.
      -- "           xxxxxxxxxxxkkkkkkkkkO0KKOkkkkkkkkkkkOOOOOOOk.
      -- "           dxxxxxxxxxxxxxxxxxxO00KKOkkkkkkkkkkkkkkkkkkk
      -- "           ddxxxxxxxxxxxxxxxxxxkOOOkxxxxxkkkkkkkkkkkkkx
      -- "          .oddddddddddddxxxxxxxxxxxxxxxxxxxxxxxxxxxkkkx.
      -- "         ..oddddddddddddddddddddxxxxxxxxxxxxxxxxxxxxxxd.
      -- "        ...oddddddddddddddddddddddddddddddxxxxxxxxxxxxd  .
      -- "        ...lodddddddddddddddddddddddddddddddddddddddxdo...
      --   "            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
      --   "            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ",
      --   "            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ",
      --   "            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ",
      --   "            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           ",
      --   "            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           ",
    }, "\n")
    local pad = string.rep(" ", 22)
    local new_section = function(name, action, section)
      return { name = name, action = action, section = pad .. section }
    end

    local starter = require("mini.starter")
    --stylua: ignore
    local config = {
      evaluate_single = true,
      header = logo,
      items = {
        new_section("Find file",       LazyVim.pick(),                        "Telescope"),
        new_section("New file",        "ene | startinsert",                   "Built-in"),
        new_section("Recent files",    LazyVim.pick("oldfiles"),              "Telescope"),
        new_section("Find text",       LazyVim.pick("live_grep"),             "Telescope"),
        new_section("Config",          LazyVim.pick.config_files(),           "Config"),
        new_section("Restore session", [[lua require("persistence").load()]], "Session"),
        new_section("Lazy Extras",     "LazyExtras",                          "Config"),
        new_section("Lazy",            "Lazy",                                "Config"),
        new_section("Quit",            "qa",                                  "Built-in"),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.aligning("center", "center"),
      },
    }
    return config
  end,
  config = function(_, config)
    -- close Lazy and re-open when starter is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniStarterOpened",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    local starter = require("mini.starter")
    starter.setup(config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function(ev)
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local pad_footer = string.rep(" ", 8)
        starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        -- INFO: based on @echasnovski's recommendation (thanks a lot!!!)
        if vim.bo[ev.buf].filetype == "ministarter" then
          pcall(starter.refresh)
        end
      end,
    })
  end,
}
