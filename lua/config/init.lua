local options = {
  syntax = "on",
  cmdheight = 1,
  showmode = false,
  expandtab = true,
  shiftwidth = 4,
  tabstop = 4,
  softtabstop = 4,
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  smarttab = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  wrap = true,
  linebreak = true,
  breakindent = true,
  showbreak = ">>>",
  scrolloff = 8,
  fileencoding = "utf-8",
  termguicolors = true,
  number = true,
  relativenumber = true,
  cursorline = true,
  mouse = "a",
  timeoutlen = 500,
  hidden = true,
  updatetime = 200,
  clipboard = { "unnamed" },
  completeopt = { "menu", "menuone", "noselect", "preview" },
  laststatus = 3,
  fillchars = "eob: ",
  undofile = true,
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
  guifont = "JetBrainsMono Nerd Font:h14",
}

vim.opt.whichwrap:append "<,>,[,],h,l"

for k, v in pairs(options) do
  vim.opt[k] = v
end
