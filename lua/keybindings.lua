-- 参考自https://juejin.cn/book/7051157342770954277/section/7051536642238054430
-- 这里的设置就是：如果接下来输入map，之后会被lua视为vim.api.nvim_set_keymap，这个vim.api.nvim_set_keymap('模式', '按键', '映射为', 'options')表示的是全局映射
-- local 表示的是本地变量
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }
-- 
--n Normal 模式
--i Insert 模式
--v Visual 模式
--t Terminal 模式
--c Command 模式
-- leader 设置为空格
-- 命令行模式链接两条命令的方法使用 command 1 |command 2
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

-- 切换工作目录，当前工作目录使用pwd可以查看
map("n","<F2>", ":cd %:h | pwd<CR>", opt)   -- 切换vim工作目录
map("n","<F3>", ":lcd %:h | pwd<CR>", opt)  -- 切换窗口工作目录

-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl b / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-b>", "9k", opt)      -- before
map("n", "<C-d>", "9j", opt)      -- down

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 在visual 模式里粘贴不要复制
-- map("v", "p", '"_dP', opt)

-- 退出
--map("n", "q", ":q<CR>", opt)
--map("n", "qq", ":q!<CR>", opt)
--map("n", "Q", ":qa!<CR>", opt)

-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>gea", opt)
map("i", "<C-l>", "<ESC>ea", opt)

--map("i", "<C-h>", "<Left>", opt)
--map("i", "<C-l>", "<Right>", opt)
map("i", "<C-k>", "<Up>", opt)
map("i", "<C-j>", "<Down>", opt)

-- buffer 跳转（现在有更好的了）
map("n", "]b", ":bnext<CR>",opt)
map("n", "[b", ":bprevious<CR>",opt)

-- 检查编译效果
map("i", "<C-b>", "<ESC>a",opt)
-- 编译行为
--map("n","<F8>",":!g++ % -g && ./a.out<input <CR>",opt)
--map("n","<F9>",":!gdb -q a.out <CR>",opt)
--function _G.debug()


vim.api.nvim_exec(
[[
map <F9> :call Rungdb() <CR>
func! Rungdb()
	exec  " w "
  exec  "lcd %:h"
	if &filetype == "c"
		exec  " !gcc % -g -o %< "
		exec  " !gdb -q ./%< "
	elseif &filetype == "cpp"
		exec " !g++ % -g && gdb -q a.out"
	elseif &filetype == "py"
		exec "python -m pdb % "
	endif
endfunc 
map <F8> :call CompileRunGcc() <CR>
func! CompileRunGcc()
	exec  " w "
	exec  "!date"
  "exec  "lcd %:h"
	if  &filetype ==  'c'
		exec  " !gcc % -o %< "
		exec  " ! ./%< "
	elseif &filetype ==  'cpp'
		exec  "!g++ % -g -o %:h/a.out && %:h/a.out < %:h/input"
	elseif &filetype ==  'java'  
		exec  " !javac % "  
		exec  " !java %< "
	elseif &filetype ==  'sh'
		exec "!bash ./% "
	elseif &filetype == 'py'
		exec "python %"
	endif
endfunc 
]]
,false)

-- 插件快捷键


-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
-- map("n", "<C-w>", ":Bdelete!<CR>", opt)
--map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
--map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
--map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-f>", ":Telescope find_files<CR>", opt) -- 表示的是在当前文件夹下查找一个文件名为。。。
-- 全局搜索
map("n", "<C-g>", ":Telescope live_grep<CR>", opt) -- 可以通过文件内容进行查找

-- blameline
map("n", "<leader>b", ":ToggleBlameLine<CR>",opt)
map("n", "<leader>sb", ":SingleBlameLine<CR>",opt)

local pluginKeys = {}
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-b>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- nvim-tree
-- alt + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}
-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end
  return {
    -- 出现补全
    ["<C-n>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    -- 取消
    ["<C-p>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close()
    }),
    -- 上一个
    --["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    --["<C-j>"] = cmp.mapping.select_next_item(),
    -- 确认 不要使用回车
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace
    }),
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
        -- 自定义代码段跳转到下一个参数
--    ["<S-Down>"] = cmp.mapping(function(_)
--      if vim.fn["vsnip#available"](1) == 1 then
--        feedkey("<Plug>(vsnip-expand-or-jump)", "")
--      end
--    end, {"i", "s"}),
--
--    -- 自定义代码段跳转到上一个参数
--    ["<S-Up>"] = cmp.mapping(function()
--      if vim.fn["vsnip#jumpable"](-1) == 1 then
--        feedkey("<Plug>(vsnip-jump-prev)", "")
--      end
--    end, {"i", "s"}),

    -- Super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, {"i", "s"}),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, {"i", "s"})
    -- end of super Tab
  }
end

return pluginKeys


