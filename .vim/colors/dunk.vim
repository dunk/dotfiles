" Vim color file

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="dunk"






hi x016_Grey0 ctermfg=16
hi x017_NavyBlue ctermfg=17
hi x018_DarkBlue ctermfg=18
hi x019_Blue3 ctermfg=19
hi x020_Blue3 ctermfg=20
hi x021_Blue1 ctermfg=21
hi x022_DarkGreen ctermfg=22
hi x023_DeepSkyBlue4 ctermfg=23
hi x024_DeepSkyBlue4 ctermfg=24
hi x025_DeepSkyBlue4 ctermfg=25
hi x026_DodgerBlue3 ctermfg=26
hi x027_DodgerBlue2 ctermfg=27
hi x028_Green4 ctermfg=28
hi x029_SpringGreen4 ctermfg=29
hi x030_Turquoise4 ctermfg=30
hi x031_DeepSkyBlue3 ctermfg=31
hi x032_DeepSkyBlue3 ctermfg=32
hi x033_DodgerBlue1 ctermfg=33
hi x034_Green3 ctermfg=34
hi x035_SpringGreen3 ctermfg=35
hi x036_DarkCyan ctermfg=36
hi x037_LightSeaGreen ctermfg=37
hi x038_DeepSkyBlue2 ctermfg=38
hi x039_DeepSkyBlue1 ctermfg=39
hi x040_Green3 ctermfg=40
hi x041_SpringGreen3 ctermfg=41
hi x042_SpringGreen2 ctermfg=42
hi x043_Cyan3 ctermfg=43
hi x044_DarkTurquoise ctermfg=44
hi x045_Turquoise2 ctermfg=45
hi x046_Green1 ctermfg=46
hi x047_SpringGreen2 ctermfg=47
hi x048_SpringGreen1 ctermfg=48
hi x049_MediumSpringGreen ctermfg=49
hi x050_Cyan2 ctermfg=50
hi x051_Cyan1 ctermfg=51
hi x052_DarkRed ctermfg=52
hi x053_DeepPink4 ctermfg=53
hi x054_Purple4 ctermfg=54
hi x055_Purple4 ctermfg=55
hi x056_Purple3 ctermfg=56
hi x057_BlueViolet ctermfg=57 
hi x058_Orange4 ctermfg=58
hi x059_Grey37 ctermfg=59
hi x060_MediumPurple4 ctermfg=60
hi x061_SlateBlue3 ctermfg=61
hi x062_SlateBlue3 ctermfg=62
hi x063_RoyalBlue1 ctermfg=63
hi x064_Chartreuse4 ctermfg=64
hi x065_DarkSeaGreen4 ctermfg=65
hi x066_PaleTurquoise4 ctermfg=66
hi x067_SteelBlue ctermfg=67
hi x068_SteelBlue3 ctermfg=68
hi x069_CornflowerBlue ctermfg=69
hi x070_Chartreuse3 ctermfg=70
hi x071_DarkSeaGreen4 ctermfg=71
hi x072_CadetBlue ctermfg=72
hi x073_CadetBlue ctermfg=73
hi x074_SkyBlue3 ctermfg=74
hi x075_SteelBlue1 ctermfg=75
hi x076_Chartreuse3 ctermfg=76
hi x077_PaleGreen3 ctermfg=77
hi x078_SeaGreen3 ctermfg=78
hi x079_Aquamarine3 ctermfg=79
hi x080_MediumTurquoise ctermfg=80
hi x081_SteelBlue1 ctermfg=81
hi x082_Chartreuse2 ctermfg=82
hi x083_SeaGreen2 ctermfg=83
hi x084_SeaGreen1 ctermfg=84
hi x085_SeaGreen1 ctermfg=85
hi x086_Aquamarine1 ctermfg=86
hi x087_DarkSlateGray2 ctermfg=87
hi x088_DarkRed ctermfg=88
hi x089_DeepPink4 ctermfg=89
hi x090_DarkMagenta ctermfg=90
hi x091_DarkMagenta ctermfg=91
hi x092_DarkViolet ctermfg=92
hi x093_Purple ctermfg=93
hi x094_Orange4 ctermfg=94
hi x095_LightPink4 ctermfg=95
hi x096_Plum4 ctermfg=96
hi x097_MediumPurple3 ctermfg=97
hi x098_MediumPurple3 ctermfg=98
hi x099_SlateBlue1 ctermfg=99
hi x100_Yellow4 ctermfg=100
hi x101_Wheat4 ctermfg=101
hi x102_Grey53 ctermfg=102
hi x103_LightSlateGrey ctermfg=103
hi x104_MediumPurple ctermfg=104
hi x105_LightSlateBlue ctermfg=105
hi x106_Yellow4 ctermfg=106
hi x107_DarkOliveGreen3 ctermfg=107
hi x108_DarkSeaGreen ctermfg=108
hi x109_LightSkyBlue3 ctermfg=109
hi x110_LightSkyBlue3 ctermfg=110
hi x111_SkyBlue2 ctermfg=111
hi x112_Chartreuse2 ctermfg=112
hi x113_DarkOliveGreen3 ctermfg=113
hi x114_PaleGreen3 ctermfg=114
hi x115_DarkSeaGreen3 ctermfg=115
hi x116_DarkSlateGray3 ctermfg=116
hi x117_SkyBlue1 ctermfg=117
hi x118_Chartreuse1 ctermfg=118 
hi x119_LightGreen ctermfg=119
hi x120_LightGreen ctermfg=120
hi x121_PaleGreen1 ctermfg=121
hi x122_Aquamarine1 ctermfg=122
hi x123_DarkSlateGray1 ctermfg=123
hi x124_Red3 ctermfg=124
hi x125_DeepPink4 ctermfg=125
hi x126_MediumVioletRed ctermfg=126
hi x127_Magenta3 ctermfg=127
hi x128_DarkViolet ctermfg=128
hi x129_Purple ctermfg=129
hi x130_DarkOrange3 ctermfg=130
hi x131_IndianRed ctermfg=131
hi x132_HotPink3 ctermfg=132
hi x133_MediumOrchid3 ctermfg=133
hi x134_MediumOrchid ctermfg=134
hi x135_MediumPurple2 ctermfg=135
hi x136_DarkGoldenrod ctermfg=136
hi x137_LightSalmon3 ctermfg=137
hi x138_RosyBrown ctermfg=138
hi x139_Grey63 ctermfg=139
hi x140_MediumPurple2 ctermfg=140
hi x141_MediumPurple1 ctermfg=141
hi x142_Gold3 ctermfg=142
hi x143_DarkKhaki ctermfg=143
hi x144_NavajoWhite3 ctermfg=144
hi x145_Grey69 ctermfg=145
hi x146_LightSteelBlue3 ctermfg=146
hi x147_LightSteelBlue ctermfg=147
hi x148_Yellow3 ctermfg=148
hi x149_DarkOliveGreen3 ctermfg=149
hi x150_DarkSeaGreen3 ctermfg=150
hi x151_DarkSeaGreen2 ctermfg=151
hi x152_LightCyan3 ctermfg=152
hi x153_LightSkyBlue1 ctermfg=153
hi x154_GreenYellow ctermfg=154
hi x155_DarkOliveGreen2 ctermfg=155 guifg=#afff5f "rgb=175,255,9
hi x156_PaleGreen1 ctermfg=156
hi x157_DarkSeaGreen2 ctermfg=157
hi x158_DarkSeaGreen1 ctermfg=158
hi x159_PaleTurquoise1 ctermfg=159
hi x160_Red3 ctermfg=160
hi x161_DeepPink3 ctermfg=161
hi x162_DeepPink3 ctermfg=162
hi x163_Magenta3 ctermfg=163
hi x164_Magenta3 ctermfg=164
hi x165_Magenta2 ctermfg=165
hi x166_DarkOrange3 ctermfg=166
hi x167_IndianRed ctermfg=167
hi x168_HotPink3 ctermfg=168
hi x169_HotPink2 ctermfg=169
hi x170_Orchid ctermfg=170
hi x171_MediumOrchid1 ctermfg=171
hi x172_Orange3 ctermfg=172
hi x173_LightSalmon3 ctermfg=173
hi x174_LightPink3 ctermfg=174
hi x175_Pink3 ctermfg=175
hi x176_Plum3 ctermfg=176
hi x177_Violet ctermfg=177
hi x178_Gold3 ctermfg=178
hi x179_LightGoldenrod3 ctermfg=179
hi x180_Tan ctermfg=180
hi x181_MistyRose3 ctermfg=181
hi x182_Thistle3 ctermfg=182
hi x183_Plum2 ctermfg=183
hi x184_Yellow3 ctermfg=184
hi x185_Khaki3 ctermfg=185
hi x186_LightGoldenrod2 ctermfg=186
hi x187_LightYellow3 ctermfg=187
hi x188_Grey84 ctermfg=188
hi x189_LightSteelBlue1 ctermfg=189
hi x190_Yellow2 ctermfg=190
hi x191_DarkOliveGreen1 ctermfg=191
hi x192_DarkOliveGreen1 ctermfg=192
hi x193_DarkSeaGreen1 ctermfg=193
hi x194_Honeydew2 ctermfg=194
hi x195_LightCyan1 ctermfg=195
hi x196_Red1 ctermfg=196
hi x197_DeepPink2 ctermfg=197
hi x198_DeepPink1 ctermfg=198
hi x199_DeepPink1 ctermfg=199
hi x200_Magenta2 ctermfg=200
hi x201_Magenta1 ctermfg=201
hi x202_OrangeRed1 ctermfg=202
hi x203_IndianRed1 ctermfg=203
hi x204_IndianRed1 ctermfg=204
hi x205_HotPink ctermfg=205
hi x206_HotPink ctermfg=206
hi x207_MediumOrchid1 ctermfg=207
hi x208_DarkOrange ctermfg=208
hi x209_Salmon1 ctermfg=209
hi x210_LightCoral ctermfg=210
hi x211_PaleVioletRed1 ctermfg=211
hi x212_Orchid2 ctermfg=212
hi x213_Orchid1 ctermfg=213
hi x214_Orange1 ctermfg=214
hi x215_SandyBrown ctermfg=215
hi x216_LightSalmon1 ctermfg=216
hi x217_LightPink1 ctermfg=217
hi x218_Pink1 ctermfg=218
hi x219_Plum1 ctermfg=219
hi x220_Gold1 ctermfg=220
hi x221_LightGoldenrod2 ctermfg=221
hi x222_LightGoldenrod2 ctermfg=222
hi x223_NavajoWhite1 ctermfg=223
hi x224_MistyRose1 ctermfg=224
hi x225_Thistle1 ctermfg=225
hi x226_Yellow1 ctermfg=226
hi x227_LightGoldenrod1 ctermfg=227
hi x228_Khaki1 ctermfg=228
hi x229_Wheat1 ctermfg=229
hi x230_Cornsilk1 ctermfg=230
hi x231_Grey100 ctermfg=231
hi x232_Grey3 ctermfg=232
hi x233_Grey7 ctermfg=233
hi x234_Grey11 ctermfg=234
hi x235_Grey15 ctermfg=235
hi x236_Grey19 ctermfg=236
hi x237_Grey23 ctermfg=237
hi x238_Grey27 ctermfg=238
hi x239_Grey30 ctermfg=239
hi x240_Grey35 ctermfg=240
hi x241_Grey39 ctermfg=241
hi x242_Grey42 ctermfg=242
hi x243_Grey46 ctermfg=243
hi x244_Grey50 ctermfg=244
hi x245_Grey54 ctermfg=245
hi x246_Grey58 ctermfg=246
hi x247_Grey62 ctermfg=247
hi x248_Grey66 ctermfg=248
hi x249_Grey70 ctermfg=249
hi x250_Grey74 ctermfg=250
hi x251_Grey78 ctermfg=251
hi x252_Grey82 ctermfg=252
hi x253_Grey85 ctermfg=253
hi x254_Grey89 ctermfg=254
hi x255_Grey93 ctermfg=255













hi Normal	guifg=White guibg=grey20
"        
"        " highlight groups
"        hi Cursor	guibg=khaki guifg=slategrey
"        "hi CursorIM
"        "hi Directory
"        "hi DiffAdd
"        "hi DiffChange
"        "hi DiffDelete
"        "hi DiffText
"        "hi ErrorMsg
"        hi VertSplit	guibg=#c2bfa5 guifg=grey50 gui=none
"        hi Folded	guibg=grey30 guifg=gold
"        hi FoldColumn	guibg=grey30 guifg=tan
"        hi IncSearch	guifg=slategrey guibg=khaki
"        "hi LineNr
"        hi ModeMsg	guifg=goldenrod
"        hi MoreMsg	guifg=SeaGreen
"        hi NonText	guifg=LightBlue guibg=grey30
"        hi Question	guifg=springgreen
"        hi Search	guibg=peru guifg=wheat
"        hi SpecialKey	guifg=yellowgreen
"        hi StatusLine	guibg=#c2bfa5 guifg=black gui=none
"        hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none
"        hi Title	guifg=indianred
"        hi Visual	gui=none guifg=khaki guibg=olivedrab
"        "hi VisualNOS
"        hi WarningMsg	guifg=salmon
"        "hi WildMenu
"        "hi Menu
"        "hi Scrollbar
"        "hi Tooltip
"        
"        " syntax highlighting groups
hi Comment	guifg=SkyBlue
"        hi Constant	guifg=#ffa0a0
"        hi Identifier	guifg=palegreen
"        hi Statement	guifg=khaki
"        hi PreProc	guifg=indianred
"        hi Type		guifg=darkkhaki
"        hi Special	guifg=navajowhite
"        "hi Underlined
"        hi Ignore	guifg=grey40
"        "hi Error
"        hi Todo		guifg=orangered guibg=yellow2
"        
"        " color terminal definitions
"        hi SpecialKey	ctermfg=darkgreen
"        hi NonText	cterm=bold ctermfg=darkblue
"        hi Directory	ctermfg=darkcyan
"        hi ErrorMsg	cterm=bold ctermfg=7 ctermbg=1
"        hi IncSearch	cterm=NONE ctermfg=yellow ctermbg=green
"        hi Search	cterm=NONE ctermfg=grey ctermbg=blue
"        hi MoreMsg	ctermfg=darkgreen
"        hi ModeMsg	cterm=NONE ctermfg=brown
"        hi LineNr	ctermfg=3
"        hi Question	ctermfg=green
"        hi StatusLine	cterm=bold,reverse
"        hi StatusLineNC cterm=reverse
"        hi VertSplit	cterm=reverse
"        hi Title	ctermfg=5
"        hi Visual	cterm=reverse
"        hi VisualNOS	cterm=bold,underline
"        hi WarningMsg	ctermfg=1
"        hi WildMenu	ctermfg=0 ctermbg=3
"        hi Folded	ctermfg=darkgrey ctermbg=NONE
"        hi FoldColumn	ctermfg=darkgrey ctermbg=NONE
"        hi DiffAdd	ctermbg=4
"        hi DiffChange	ctermbg=5
"        hi DiffDelete	cterm=bold ctermfg=4 ctermbg=6
"        hi DiffText	cterm=bold ctermbg=1
"hi Comment	ctermfg=darkblue
"hi Constant	ctermfg=darkgreen
"" Special seems to just do \n in the file I was looking at
"hi Special	ctermfg=yellow
"hi Identifier	ctermfg=red
"hi Statement	ctermfg=red
"" PreProc seems to highlight 'import' and 'from'
"hi PreProc	ctermfg=5
"        hi Type		ctermfg=2
"        hi Underlined	cterm=underline ctermfg=5
"        hi Ignore	cterm=bold ctermfg=7
"        hi Ignore	ctermfg=darkgrey
"        hi Error	cterm=bold ctermfg=7 ctermbg=1
"
"hi Comment ctermfg=darkblue
hi Comment ctermfg=240
hi Constant ctermfg=darkgreen
"hi Statement ctermfg=88
hi Statement ctermfg=57
hi PreProc ctermfg=89
hi Type ctermfg=lightgreen
hi Special ctermfg=lightgreen

hi Identifier ctermfg=27
hi pythonFunction ctermfg=184
" hi pythonConditional ctermfg=33 ctermbg=91
" hi pythonConditional ctermfg=white ctermbg=160
hi pythonConditional ctermfg=white ctermbg=88

" hi pythonString ctermfg=darkgrey
hi pythonString ctermfg=29
hi pythonTripleQuotes ctermfg=29
hi pythonQuotes ctermfg=29

" hi LineNr ctermfg=92
hi LineNr ctermfg=240

" Settings for pytest plugin
hi PytestPlatform ctermfg=6
hi PytestPythonFile ctermfg=6
hi PytestErrors ctermfg=9
