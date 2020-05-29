call ale#Set('cds_cdslsp_executable', 'cds-lsp-exec')
call ale#Set('cds_cdslsp_config_path', '')
call ale#Set('cds_cdslsp_use_global', get(g:, 'ale_use_global_executables', 0))

function! ale_linters#cds#cds#GetProjectRoot(buffer) abort
	let l:project_file = ale#path#FindNearestFile(a:buffer, '.cdsrc.json')
	return fnamemodify(l:project_file, ':h')
endfunction

" Register cdslsp as a linter for the `cds` filetype:
call ale#linter#Define('cds', {
\	'name': 'cds-lsp',
\	'lsp': 'stdio',
\	'executable': {b -> ale#node#FindExecutable(b, 'cds_cdslsp', [ 'node_modules/.bin/cds-lsp-exec', ])},
\	'command': '%e --stdio', 
\	'project_root': function('ale_linters#cds#cds#GetProjectRoot'),
\})
