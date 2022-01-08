vim.cmd([[

" let g:vimspector_enable_mappings = 'HUMAN'

" nmap <leader>dd :call vimspector#Launch()<CR>
" nmap <leader>dx :call vimspectorReset<CR>
" nmap <leader>de :call vimspectorEval
" nmap <leader>dw :call vimspectorWatch
" nmap <leader>dw :callvimspector#StepOver() 

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

]])
