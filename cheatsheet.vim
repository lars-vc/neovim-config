"===========================================================
"------------------------CheatSheet-------------------------
"===========================================================

"-------------------------TELESCOPE-------------------------
,ff => find_files                  (find file in project)
,fg => live_grep                   (find in project)
,fc => current_buffer_fuzzy_find   (find in current buffer)
,fb => buffers                     (see buffers)
,fh => help_tags                   (see help options)
,fn => neoclip                     (local clipboard)


"------------------------VIMSPECTOR-------------------------
" Begin/End
,dd  => Start               (start debugging)
,dx  => Reset               (quit debugging)
,dX  => ClearBreakpoints    (remove all breakpoints)
" In debug
J    => StepOver       (step over function)
K    => StepOut        (step out of function)
L    => StepInto       (step into function)
,d_  => Restart        (restart execution)
,dn  => Continue       (continue til breakpoint)
,drc => RunToCursor    (run til cursor)
,di  => BalloonEval    (show info about something)
" Setup
,dh  => ToggleBreakpoint               (toggle breakpoint)
,de  => ToggleConditionalBreakpoint    (toggle cond breakpoint, idk)


"----------------------------COC----------------------------
,rn   => coc-rename             (rename variable)
C-A-l => coc-format             (format buffer)
,cd   => coc-definition         (goto definition)
,cy   => coc-type-definition    (goto type definition)
,ci   => coc-implementation     (goto implementation)
,cr   => coc-references         (goto references)
,ct   => show_documentation     (shows type of variable)
