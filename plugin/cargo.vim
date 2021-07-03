if exists('g:vim_cargo')
  finish
endif

let vim_cargo=1

autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs setlocal makeprg=cargo

if !exists('g:cargo_command')
  let g:cargo_command = "! cargo {cmd}"
endif

com! -nargs=* CargoBench  call Run('bench ' . <q-args>)
com! -nargs=* CargoBuild  call Run('build ' . <q-args>)
com! -nargs=* CargoCheck  call Run('check ' . <q-args>)
com! -nargs=* CargoClean  call Run('clean ' . <q-args>)
com! -nargs=* CargoDoc    call Run('doc ' . <q-args>)
com! -nargs=* CargoRun    call Run('run ' . <q-args>)
com! -nargs=* CargoTest   call Run('test ' . <q-args>)
com! -nargs=* CargoUpdate call Run('update ' . <q-args>)

autocmd VimEnter * nnoremap <leader>cbe :CargoBench<cr>
autocmd VimEnter * nnoremap <leader>cbu :CargoBuild<cr>
autocmd VimEnter * nnoremap <leader>cc  :CargoClean<cr>
autocmd VimEnter * nnoremap <leader>cd  :CargoDoc<cr>
autocmd VimEnter * nnoremap <leader>cr  :CargoRun<cr>
autocmd VimEnter * nnoremap <leader>ct  :CargoTest<cr>
autocmd VimEnter * nnoremap <leader>cu  :CargoUpdate<cr>

com! -complete=file -nargs=+ CargoNew call cargo#run('new ' . <q-args>)

func! Run(cmd)
  let s:cargo_command = substitute(g:cargo_command, "{cmd}", a:cmd, 'g')
  execute s:cargo_command
endf
