function! GetEnvVars()
    execute "normal! :return $\<C-a>')\<C-b>\<C-right>\<Right>\<Del>split('\<CR>"
endfunction
