-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "80"
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 3
vim.bo.tabstop = 3
vim.o.softtabstop = 3
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 3
vim.bo.shiftwidth = 3
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
-- vim.o.ignorecase = true
-- vim.o.smartcase = true
-- 搜索要高亮
vim.o.hlsearch = true
-- 边输入边搜索
vim.o.incsearch = true
-- 命令行高为2，提供足够的显示空间, 但是这里我改为了1
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行,就是一行太长，要把他折到另一行aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
vim.wo.wrap = true
-- 光标在行首尾时<Left><Right>可以跳到下一行 < >表示的是翻页的方向键
vim.o.whichwrap = '<,>,[,]'
-- 允许隐藏被修改过的buffer 如果不进行设置，那么切换buffer的时候会极其不方便
vim.o.hidden = true
-- 鼠标支持 n:normal v:visual i:insert c:command-line h:help a:all-above r跳过 |hit-enter| 提示 A:在可视模式下自动选择 , 我在这里没有写，就是不用鼠标
vim.o.mouse = ""
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = true
-- smaller updatetime
vim.o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.o.timeoutlen = 500
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "light"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
-- 补全最多显示10行
vim.o.pumheight = 10
-- 永远显示 tabline
vim.o.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = false
--vim.o.path = vim.o.path + \/home\/skt1faker\/my_procedure
--vim.o.path="/home/skt1faker/Github/**"
--print(vim.o.path)
--print(string.format("%s%s,",vim.o.path,"/home/skt1faker/my_procedure/**"))
vim.o.path = string.format("%s,%s", vim.o.path, "/home/skt1faker/my_procedure/**")
vim.o.path = string.format("%s,%s", vim.o.path, "/home/skt1faker/Github/**")


-- display TODO
vim.cmd(
[[
"https://www.easck.com/cos/2022/0616/971378.shtml
    " Highlight TODO, FIXME, NOTE, etc.
autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
]])
