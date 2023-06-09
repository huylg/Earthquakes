let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/personal/Earthquakes
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 ~/personal/Earthquakes
badd +11 Earthquakes/Models/QuakeError.swift
badd +10 Earthquakes/Models/QuakeLocation.swift
badd +17 EarthquakesTests/TestData.swift
badd +53 Earthquakes/EarthquakesTests/EarthquakesTests.swift
badd +8 .compile
badd +15 Earthquakes/HTTPDataDownloader.swift
badd +58 Earthquakes/Network/QuakeClient.swift
badd +15 Earthquakes/Network/HTTPDataDownloader.swift
badd +2 Earthquakes/Preview\ Content/TestDownloader.swift
badd +9 ~/Library/Developer/Xcode/DerivedData/Earthquakes-aumncijkgleuukdthnsgneukscws/Build/Intermediates.noindex/Earthquakes.build/Debug-iphonesimulator/Earthquakes.build/Objects-normal/arm64/Earthquakes.SwiftFileList
badd +1 ~/Library/Developer/Xcode/DerivedData/Earthquakes-aumncijkgleuukdthnsgneukscws/Build/Intermediates.noindex/Earthquakes.build/Debug-iphonesimulator/EarthquakesTests.build/Objects-normal/arm64/EarthquakesTests.SwiftFileList
badd +77 Earthquakes/Views/Quakes.swift
badd +1 https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/nc73649170.geojson
badd +1 https://earthquake.usgs.gov/earthquakes/feed/v1.0/detail/hv72783692
badd +37 Earthquakes/Views/SelectButton.swift
badd +1947 ~/.local/state/nvim/lsp.log
badd +8 ~/Library/Developer/Xcode/DerivedData/Earthquakes-aumncijkgleuukdthnsgneukscws/Build/Intermediates.noindex/Previews/Earthquakes/Intermediates.noindex/Earthquakes.build/Debug-iphonesimulator/Earthquakes.build/Objects-normal/arm64/Earthquakes.SwiftFileList
badd +18 Earthquakes/Views/ToolbarContent/Quakes+Toolbar.swift
badd +11 Earthquakes/Views/ToolbarContent/EditButton.swift
badd +37 Earthquakes/Views/ToolbarContent/ToolbarStatus.swift
badd +14 Earthquakes/Views/ToolbarContent/DeleteButton.swift
badd +18 Earthquakes/Views/QuakeRow.swift
badd +24 Earthquakes/Views/QuakeMagnitude.swift
badd +26 Earthquakes/QuakeProvider.swift
badd +40 Earthquakes/Models/Quake.swift
badd +17 Earthquakes/Models/Quake+Preview.swift
badd +18 Earthquakes/Views/QuakeDetail.swift
badd +26 Earthquakes/Views/QuakeDetailMap.swift
argglobal
%argdel
$argadd ~/personal/Earthquakes
edit Earthquakes/Views/QuakeDetail.swift
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt Earthquakes/Views/QuakeDetailMap.swift
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 24 - ((11 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 24
normal! 045|
lcd ~/personal/Earthquakes
wincmd w
argglobal
if bufexists(fnamemodify("~/personal/Earthquakes/Earthquakes/Views/QuakeDetailMap.swift", ":p")) | buffer ~/personal/Earthquakes/Earthquakes/Views/QuakeDetailMap.swift | else | edit ~/personal/Earthquakes/Earthquakes/Views/QuakeDetailMap.swift | endif
if &buftype ==# 'terminal'
  silent file ~/personal/Earthquakes/Earthquakes/Views/QuakeDetailMap.swift
endif
balt ~/personal/Earthquakes/Earthquakes/Views/QuakeDetail.swift
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 26 - ((25 * winheight(0) + 29) / 58)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 26
normal! 020|
lcd ~/personal/Earthquakes
wincmd w
2wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
