" Vim syntax file
" Language:	R (GNU S)
" Maintainer:	Tom Payne <tom@tompayne.org>
" Last Change:  2003 May 11
" Filenames:	*.r
" URL:		http://www.tompayne.org/vim/syntax/r.vim
"
" Modified by Jeremy Stephens and Will Gray.
"
" Options:
"       You can set these options in your vimrc file.
"
"       For set option do: let OPTION_NAME = 1
"       For clear option do: let OPTION_NAME = 0
"
" For highlighting internal/primitive functions:
"       r_package_internal
"
" For highlighting package 'base' functions:
"       r_package_base
"
" For highlighting package 'graphics' functions:
"       r_package_graphics
"
" For highlighting package 'stats' functions:
"       r_package_stats
"
" For highlighting package 'tools' functions:
"       r_package_tools
"
" For highlighting package 'methods' functions:
"       r_package_methods
"
" For highlighting package 'utils' functions:
"       r_package_utils
"
" If you want all possible R package highlighting:
"       r_package_all

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if version >= 600
  setlocal iskeyword=@,48-57,_,.
else
  set iskeyword=@,48-57,_,.
endif

if !exists("r_package_all")
  let r_package_all = 1
endif
if exists("r_package_all") && r_package_all != 0
  if !exists("r_package_internal")
    let r_package_internal = 1
  endif
  if !exists("r_package_base")
    let r_package_base = 1
  endif
  if !exists("r_package_methods")
    let r_package_methods = 1
  endif
  if !exists("r_package_graphics")
    let r_package_graphics = 1
  endif
  if !exists("r_package_stats")
    let r_package_stats = 1
  endif
  if !exists("r_package_utils")
    let r_package_utils = 1
  endif
  if !exists("r_package_tools")
    let r_package_tools = 1
  endif
endif

syn case match

" Comment
syn match rComment /\#.*/

" Constant
" string enclosed in double quotes
syn region rString matchgroup=rStringDelimiter start=/"/ skip=/\\\\\|\\"/ end=/"/
" string enclosed in single quotes
syn region rString matchgroup=rStringDelimiter start=/'/ skip=/\\\\\|\\'/ end=/'/
" number with no fractional part or exponent
syn match rNumber /\d\+/
" floating point number with integer and fractional parts and optional exponent
syn match rFloat /\d\+\.\d*\([Ee][-+]\=\d\+\)\=/
" floating point number with no integer part and optional exponent
syn match rFloat /\.\d\+\([Ee][-+]\=\d\+\)\=/
" floating point number with no fractional part and optional exponent
syn match rFloat /\d\+[Ee][-+]\=\d\+/

" same but for negatives...
" number with no fractional part or exponent
syn match rNumber /-\d\+/
" floating point number with integer and fractional parts and optional exponent
syn match rFloat /-\d\+\.\d*\([Ee][-+]\=\d\+\)\=/
" floating point number with no integer part and optional exponent
syn match rFloat /-\.\d\+\([Ee][-+]\=\d\+\)\=/
" floating point number with no fractional part and optional exponent
syn match rFloat /-\d\+[Ee][-+]\=\d\+/

" Identifier
" identifier with leading letter and optional following keyword characters
syn match rIdentifier /\a\k*/
" identifier with leading period, one or more digits, and at least one non-digit keyword character
syn match rIdentifier /\.\d*\K\k*/

" syn match rFunction /\a\k*(/me=e-1 nextgroup=rParenRegion
syn match rFunction /function(/me=e-1 nextgroup=rParenRegion

" Statement
syn keyword rStatement   break next return
syn keyword rConditional if else
syn keyword rRepeat      for in repeat while

" Constant
syn keyword rConstant LETTERS letters month.ab month.name pi
syn keyword rConstant NULL
syn keyword rBoolean  FALSE TRUE
syn keyword rNumber   NA

syn match rArrow /<\{1,2}-/
syn match rArrow /->\{1,2}/

" Type
" syn keyword rType array category character complex double integer list logical matrix numeric vector data.frame function 

" Special
syn match rDelimiter /[,;:]/

" Error
syn region rParenRegion matchgroup=rParenDelimiter start=/(/ end=/)/ transparent contains=ALLBUT,rError,rBraceError,rCurlyError
syn region rCurlyRegion matchgroup=rCurlyDelimiter start=/{/ end=/}/ transparent contains=ALLBUT,rError,rBraceError,rParenError fold
syn region rBraceRegion matchgroup=rBraceDelimiter start=/\[/ end=/]/ transparent contains=ALLBUT,rError,rCurlyError,rParenError
syn match rError      /[)\]}]/
syn match rBraceError /[)}]/ contained
syn match rCurlyError /[)\]]/ contained
syn match rParenError /[\]}]/ contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_r_syn_inits")
  if version < 508
    let did_r_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink rComment                 Comment      
  HiLink rConstant                Constant
  HiLink rString                  String
  HiLink rNumber                  Number
  HiLink rBoolean                 Boolean
  HiLink rFloat                   Float
  HiLink rStatement               Statement
  HiLink rBaseStatement           Statement                 
  HiLink rStatsStatement          Statement                 
  HiLink rGraphicsStatement       Statement                               
  HiLink rToolsStatement          Statement                               
  HiLink rMethodsStatement        Statement                               
  HiLink rUtilsStatement          Statement                               
  HiLink rPrimitiveStatement      Statement                               
  HiLink rConditional             Conditional
  HiLink rRepeat                  Repeat
 "  HiLink rIdentifier              Identifier
  HiLink rFunction                Identifier
  HiLink rArrow                   Statement
  HiLink rType	                  Type
 " HiLink rDelimiter               Delimiter
   HiLink rStringDelimiter         String
 "  HiLink rParenDelimiter          Delimiter
 "  HiLink rCurlyDelimiter          Delimiter
 "  HiLink rBraceDelimiter          Delimiter
  HiLink rError                   Error
  HiLink rParenError              Error
  HiLink rCurlyError              Error
  HiLink rBraceError              Error
  delcommand HiLink
endif

let b:current_syntax="r"
" vim: ts=8 sw=2
