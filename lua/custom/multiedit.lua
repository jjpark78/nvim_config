
vim.cmd([[
  let g:VM_maps                                = {}
  let g:VM_default_mappings                    = 0
  let g:VM_maps['Find Under']                  = '<A-d>'
  let g:VM_maps['Find Subword Under']          = '<A-n>'
  let g:VM_maps["Select All"]                  = '<A-a>'
  let g:VM_maps["Start Regex Search"]          = '\\/'
  let g:VM_maps["Add Cursor Down"]             = '<C-j>'
  let g:VM_maps["Add Cursor Up"]               = '<C-k>'
  let g:VM_maps["Add Cursor At Pos"]           = '\\\'

  let g:VM_maps["Visual Regex"]                = '\\/'
  let g:VM_maps["Visual All"]                  = '\\A'
  let g:VM_maps["Visual Add"]                  = '\\a'
  let g:VM_maps["Visual Find"]                 = '\\f'
  let g:VM_maps["Visual Cursors"]              = '\\c'
]])
