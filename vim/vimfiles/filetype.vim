	if exists("did_load_csvfiletype")
	  finish
	endif
	let did_load_csvfiletype=1

	augroup filetypedetect
	  au! BufRead,BufNewFile *.csv,*.dat		setfiletype csv
    au BufNewFile,BufRead *.brs           setfiletype brs
	augroup END
