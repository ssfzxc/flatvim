command! -nargs=0 DeinInstall :call dein#install()

function! s:main()
  " add dein
  execute 'set runtimepath+=' . g:root_dir . '/dein.vim'
  execute 'helptags ' . g:root_dir . '/dein.vim/doc'

  " plugins
  if dein#load_state(g:plugin_dir)
    call dein#begin(g:plugin_dir)

    call dein#add(g:root_dir . '/dein.vim')
    call dein#add('wsdjeg/dein-ui.vim')

    " completion{{{
    call dein#add('neoclide/coc.nvim',
          \ {
          \ 'merged': 0,
          \ 'rev': 'release',
          \ })
    call dein#add('honza/vim-snippets', {'merged': 0, 'depends': 'coc.nvim', 'if': 'has("pythone3")'})
    " }}}

    " edit enhance{{{
    call dein#add('asins/vimcdoc')
    call dein#add('skywind3000/asynctasks.vim')
    call dein#add('skywind3000/asyncrun.vim')
    call dein#add('tpope/vim-repeat')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-commentary')
    call dein#add('luochen1990/rainbow',
          \ { 'on_ft':
            \ [ 
            \ 'html',
            \ 'css',
            \ 'javascript',
            \ 'javascriptreact',
            \ 'go',
            \ 'python',
            \ 'lua',
            \ 'rust',
            \ 'vim',
            \ 'less',
            \ 'stylus',
            \ 'sass',
            \ 'scss',
            \ 'json',
            \ 'ruby',
            \ 'toml'
            \ ]
          \ })
    call dein#add('rhysd/accelerated-jk')
    call dein#add('editorconfig/editorconfig-vim')
    call dein#add('easymotion/vim-easymotion')
    " }}}

    "fuzzyfind{{{
    call dein#add('junegunn/fzf.vim')
    " fzf.vim add root_dir/plugin
    " call dein#add('junegunn/fzf')
    call dein#add('liuchengxu/vista.vim')
    "}}}

    "ui{{{
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    call dein#add('liuchengxu/vim-which-key')
    call dein#add('voldikss/vim-floaterm')
    " call dein#add('Lokaltog/vim-powerline')
    " explorer => coc-explorer
    " theme
    call dein#add('ryanoasis/vim-devicons')
    call dein#add('kyazdani42/nvim-web-devicons')
    call dein#add('gruvbox-community/gruvbox')
    "}}}
    
    "languages{{{
    call dein#add('othree/html5.vim', {'on_ft': 'html'})
    call dein#add('pangloss/vim-javascript', {'on_ft': ['javascript', 'javascriptreact', 'vue']})
    call dein#add('moll/vim-node', {'on_ft': ['javascript', 'javascriptreact', 'vue']})
    call dein#add('posva/vim-vue', {'on_ft': 'vue'})
    call dein#add('groenewege/vim-less', {'on_ft': ['less', 'vue']})
    call dein#add('hail2u/vim-css3-syntax', {'on_ft': ['less', 'vue']})
    call dein#add('cakebaker/scss-syntax.vim', {'on_ft': ['less', 'vue']})
    call dein#add('arzg/vim-sh', {'on_ft': ['sh', 'zsh']})
    call dein#add('rust-lang/rust.vim', {'on_ft': 'rust'})
    "}}}
    
    "filetype{{{
    call dein#add('Shougo/context_filetype.vim')
    call dein#add('plasticboy/vim-markdown', {'on_ft': 'markdown'})
    call dein#add('iamcco/markdown-preview.nvim', {
          \ 'on_ft': ['markdown', 'pandoc.markdown', 'rmd'],
          \ 'build': 'sh -c "cd app & yarn install"'
          \ })
    call dein#add('cespare/vim-toml', {'on_ft': 'toml'})
    call dein#add('chr4/nginx.vim', {'on_ft': 'nginx'})
    call dein#add('kevinoid/vim-jsonc', {'on_ft': 'json'})
    call dein#add('ekalinin/Dockerfile.vim', {'on_ft': ['Dockerfile', 'docker-compose']})
    call dein#add('ron-rs/ron.vim', {'on_ft': 'ron'})
    call dein#add('plasticboy/vim-markdown', {'on_ft': 'markdown'})
    "}}}
    
    "version{{{
    call dein#add('lambdalisue/gina.vim', {'on_cmd': 'Gina'})
    call dein#add('tpope/vim-fugitive', {'on_cmd': [ 'G', 'Git', 'Gfetch', 'Gpush', 'Glog', 'Gclog', 'Gdiffsplit' ]})
    "}}}

    call dein#end()
    call dein#save_state()
  endif

endfunction

call s:main()

