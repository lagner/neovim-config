local opt = vim.opt

-- нажатие Tab в начале строки (если быть точнее, до первого непробельного символа в строке) приведет к добавлению отступа, ширина которого соответствует shiftwidth (независимо от значений в tabstop и softtabstop)
opt.smarttab = true
-- в режиме вставки заменяет символ табуляции на соответствующее количество пробелов. Так же влияет на отступы, добавляемые командами >> и <<.
opt.expandtab = true
-- используется для регулирование ширины отступов в пробелах, добавляемых командами >> и <<
opt.shiftwidth = 4
-- количество пробелов, которыми символ табуляции отображается в тексте. Оказывает влияние как на уже существующие табуляции, так и на новые
opt.tabstop = 4

opt.wrap = true
opt.showmatch = true
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.numberwidth = 4
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 8
opt.list = true


vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"*.h", "*.cpp"},
    callback = function()
        vim.opt.expandtab = false
    end,
})
