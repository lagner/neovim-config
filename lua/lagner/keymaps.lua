local keymap = vim.keymap

--
return {
    core_keys = function()
        vim.g.mapleader = ","
        vim.g.maplocalleader = "\\"

        keymap.set('n', '<C-e>', '<C-w>', { noremap = true, silent = true })
        keymap.set('n', '<leader>t', '<esc>:bn<CR>', {})
        keymap.set('n', '<leader>q', '<esc>:b#<bar>bd#<CR>', {})
    end,

    telescope_keys = function(telescope)
        keymap.set('n', '<C-p>', telescope.git_files, {})
        keymap.set('n', '<leader>ff', telescope.find_files, {})
        keymap.set('n', '<leader>fg', telescope.live_grep, {})
        keymap.set('n', '<leader>fb', telescope.buffers, {})
        keymap.set('n', '<leader>fh', telescope.help_tags, {})
    end,

    lsp_keys = function()
    end,

    cmp_keys = function(cmp)
        return {
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-y>"] = cmp.mapping.complete(),
            ["<CR>"] = cmp.mapping(
                cmp.mapping.confirm {
                    behaviour = cmp.SelectBehavior.Insert,
                    select = true,
                },
                { "i", "c" }
            ),
        }
    end,

    oil_keys = function(oil, actions)
        keymap.set("n", "-", oil.open_float)
        return {
            ["g?"] = actions.show_help,
            ["<CR>"] = actions.select,
            ["<C-s>"] = { actions.select, opts = { vertical = true }, desc = "Open the entry in a vertical split" },
            ["<C-h>"] = { actions.select, opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
            ["<C-t>"] = { actions.select, opts = { tab = true }, desc = "Open the entry in new tab" },
            ["<C-p>"] = actions.preview,
            ["<C-c>"] = actions.close,
            ["<C-l>"] = actions.refresh,
            ["-"] = actions.parent,
            ["_"] = actions.open_cwd,
            -- ["`"] = "actions.cd",
            -- ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
            -- ["gs"] = "actions.change_sort",
            -- ["gx"] = "actions.open_external",
            -- ["g."] = "actions.toggle_hidden",
            -- ["g\\"] = "actions.toggle_trash",
        }
    end,

    git_keys = function(gitsigns, bufnr)
        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', '<left>', function()
            if vim.wo.diff then
                vim.cmd.normal({'<left>', bang = true})
            else
                gitsigns.nav_hunk('next')
            end
        end)

        map('n', '<right>', function()
            if vim.wo.diff then
                vim.cmd.normal({'<right>', bang = true})
            else
                gitsigns.nav_hunk('prev')
            end
        end)

        -- Actions
        map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
        map('n', '<leader>hs', gitsigns.stage_hunk)
        map('n', '<leader>hu', gitsigns.undo_stage_hunk)
        map('n', '<leader>hr', gitsigns.reset_hunk)
        map('n', '<leader>hS', gitsigns.stage_buffer)
        map('n', '<leader>hR', gitsigns.reset_buffer)
        map('n', '<leader>hp', gitsigns.preview_hunk)
        -- map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
        -- map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
        -- map('n', '<leader>hd', gitsigns.diffthis)
        -- map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
        -- map('n', '<leader>td', gitsigns.toggle_deleted)

        -- Text object
        -- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end,

    lazygit_keys = function()
        return {
            { "_", "<CMD>LazyGit<CR>", desc = "Open lazygit", },
        }
    end,
}
