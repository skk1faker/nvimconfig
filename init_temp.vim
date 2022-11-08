lua require('/home/skt1faker/.config/nvim/init_invim')
map <F8> :call Rungdb()<CR><CR>
func! Rungdb()
	exec  " w "
	if &filetype == "c"
		exec  " !gcc % -g -o %< "
		exec  " !gdb -q ./%< "
	elseif &filetype == "cpp"
		exec " !g++ % -g && gdb -q a.out"
	elseif &filetype == "py"
		exec "python -m pdb % "
	endif
endfunc 
map <F5> :call CompileRunGcc()<CR><CR>
func! CompileRunGcc()
	exec  " w "
	exec  "! clear && date"
	if  &filetype ==  'c'
		exec  " !gcc % -o %< "
		exec  " ! ./%< "
	elseif &filetype ==  'cpp'
		exec  " !g++ % && ./a.out < input"
	elseif &filetype ==  'java'  
		exec  " !javac % "  
		exec  " !java %< "
	elseif &filetype ==  'sh'
		exec "!bash ./% "
	elseif &filetype == 'py'
		exec "python %"
	endif
endfunc 
