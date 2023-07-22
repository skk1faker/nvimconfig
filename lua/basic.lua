-- transport
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
-- 高亮所在列
-- vim.wo.cursorcolumn = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.wo.colorcolumn = "80"
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
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
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置 -- 像我这样的年轻人100ms就够了，我承认，我不行。。。。300ms
vim.o.timeoutlen = 300
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
-- vim.o.listchars = "space:·"
-- vim.o.listchars = "eol:$,tab:>-|,space:_"
vim.o.listchars = "eol:$,tab:>-|,space:_"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
-- 补全最多显示10行
vim.o.pumheight = 10
-- 永远显示 tabline
vim.o.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = true
--vim.o.path = vim.o.path + \/home\/skt1faker\/my_procedure
--vim.o.path="/home/skt1faker/Github/**"
--print(vim.o.path)
--print(string.format("%s%s,",vim.o.path,"/home/skt1faker/my_procedure/**"))
-- vim.o.path = string.format("%s,%s", vim.o.path, "/home/skt1faker/my_procedure/**")
-- path设置
vim.o.path = string.format("%s,%s", vim.o.path, "./**") -- 当前文件夹和子文件夹下的文件
vim.o.suffixesadd = ".c++"
vim.o.suffixesadd = string.format("%s,%s",vim.o.suffixesadd, ".py")
vim.o.suffixesadd = string.format("%s,%s",vim.o.suffixesadd, ".md")
vim.o.tags = "/home/skt1faker/my_procedure/opensource/miniob2022/tags"
-- make行为
vim.o.makeprg = "make"
-- vim.o.path = string.format("%s,%s", vim.o.path, "/home/skt1faker/Github/**")
-- 如何修改
-- https://stackoverflow.com/questions/67579351/how-to-set-my-nvim-cursor-as-a-vertical-line-in-insert-mode
vim.o.guicursor = "i-ci-n-v-c-sm:block,ve:ver25,r-cr-o:hor20"
--https://www.cnblogs.com/welkinwalker/archive/2011/05/30/2063587.html
--～/document/vim折叠设置.pdf
vim.o.foldmethod="syntax"
--manual           手工定义折叠
--indent             更多的缩进表示更高级别的折叠
--expr                用表达式来定义折叠
--syntax             用语法高亮来定义折叠
--diff                  对没有更改的文本进行折叠
--marker            对文中的标志折叠
--"zi 打开关闭折叠
--"zv 查看此行
--zm 关闭折叠
--zM 关闭所有
--zr 打开
--zR 打开所有
--zc 折叠当前行
--zo 打开当前折叠
--zd 删除折叠
--zD 删除所有折叠

vim.cmd([[
" 当新建 .h .c .hpp .cpp .mk .sh等文件时自动调用SetTitle 函数
autocmd BufNewFile *.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh exec ":call SetTitle()" 
" 加入注释 
func SetComment()
    call setline(1,"/*================================================================") 
    call append(line("."),   "*   Copyright (C) ".strftime("%Y")." Wangxinpeng. All rights reserved.")
    call append(line(".")+1, "*   ") 
    call append(line(".")+2, "*   filename：    ".expand("%:t")) 
    call append(line(".")+3, "*   username:     skt1faker")
    call append(line(".")+4, "*   create time:  ".strftime("%H:%M  %Y.%m.%d")) 
    call append(line(".")+5, "    email:        skk1faker@163.com")
    call append(line(".")+6, "*   descripe:     ") 
    call append(line(".")+7, "*")
    call append(line(".")+8, "================================================================*/") 
    call append(line(".")+9, "")
endfunc
" 加入shell,Makefile注释
func SetComment_sh()
    call setline(3, "#================================================================") 
    call setline(4, "#   Copyright (C) ".strftime("%Y")." Sangfor Ltd. All rights reserved.")
    call setline(5, "#   ") 
    call setline(6, "#   文件名称：".expand("%:t")) 
    call setline(7, "#   创 建 者：LuZhenrong")
    call setline(8, "#   创建日期：".strftime("%Y年%m月%d日")) 
    call setline(9, "#   描    述：") 
    call setline(10, "#")
    call setline(11, "#================================================================")
    call setline(12, "")
    call setline(13, "")
endfunc 
" 定义函数SetTitle，自动插入文件头 
func SetTitle()
    if &filetype == 'make' 
        call setline(1,"") 
        call setline(2,"")
        call SetComment_sh()
 
    elseif &filetype == 'sh' 
        call setline(1,"#!/system/bin/sh") 
        call setline(2,"")
        call SetComment_sh()
        
    else
         call SetComment()
         if expand("%:e") == 'hpp' 
          call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H") 
          call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H") 
          call append(line(".")+12, "#ifdef __cplusplus") 
          call append(line(".")+13, "extern \"C\"") 
          call append(line(".")+14, "{") 
          call append(line(".")+15, "#endif") 
          call append(line(".")+16, "") 
          call append(line(".")+17, "#ifdef __cplusplus") 
          call append(line(".")+18, "}") 
          call append(line(".")+19, "#endif") 
          call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H") 
 
         elseif expand("%:e") == 'h' 
          call append(line(".")+10, "#pragma once") 
         elseif &filetype == 'c' 
          call append(line(".")+10,"#include \"".expand("%:t:r").".h\"") 
         "elseif &filetype == 'cpp' 
         elseif expand("%:e") == 'cpp' 
          call append(line(".")+10, "#include<bits/stdc++.h>")
          call append(line(".")+11, "using namespace std;")
          call append(line(".")+12, "#define ll long long")
         endif
    endif
endfunc
  ]])
