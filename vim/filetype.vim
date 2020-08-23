    " my filetype file
    if exists("did_load_filetypes")
      finish
    endif
    augroup filetypedetect
      au! BufRead,BufNewFile *.r     setfiletype python
      au! BufRead,BufNewFile *.R      setfiletype python
    augroup END

     au BufNewFile,BufRead *.R     setf r
     au BufNewFile,BufRead *.R     set syntax=r

