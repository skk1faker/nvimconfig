
-- NOTE
-- TODO 
-- FIXME
-- BUG
-- ERROR
vim.cmd(
[[
"https://www.easck.com/cos/2022/0616/971378.shtml
 " Highlight TODO , FIXME, NOTE, etc.
 "http://www.codebelief.com/article/2017/05/vim-advanced-usage-custom-highlight-groups/
 " https://juejin.cn/post/6844903480239325192
augroup myError
  autocmd!
  autocmd Syntax * syntax match myError /\v\_.<(ERROR|BUG).*/hs=s+1 containedin=.*Comment
augroup END

highlight link myError Error


if has("autocmd")
    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif
]])
