# -----------------------------------------------------------------------------
# General configuration for Go development.
#
# Will likely turn this into a proper Kakoune plugin at some point, so
# mappings etc are defined in other .kak files
# -----------------------------------------------------------------------------

# Note some Go LSP-related options defined in plugins.kak, in the kak-lsp block

#
# Internal variables
#
declare-option -hidden str current_file
declare-option -hidden str current_file_path

# hook buffer BufOpenFile filetype=go %{
#     echo "Switched to go file ${kak_buffile}"
# }

# Run unit tests in tmux split?

# Show test coverage - spec ranges?

# Switch to alternate file (e.g. from foo.go to foo_test.go)
# -----------------------------------------------------------------------------
define-command go-alternate -docstring "(Go) Switch to alternate file" %{
    evaluate-commands %sh{
        file_root=""
   	    file_suffix=""
   	    if [[ "${kak_buffile}" =~ _test\.go$ ]]; then
   	        file_root=${kak_buffile%_test*}
	        file_suffix='.go'
        elif [[ "${kak_buffile}" =~ \.go$ ]]; then
            file_root=${kak_buffile%.go*}
            file_suffix='_test.go'
        else
            # printf "%s\n" "echo -markup '{Error}Not a Go file'"
            printf "%s\n" "fail 'Not a Go file'"
 	        exit 1
        fi

		if [ ! -f ${file_root}${file_suffix} ]; then
		    printf "%s\n" "fail 'Alternate file does not exist'"
		    exit 1
		fi
		
        # TODO - Check $fileVar exists & is readable
         
        printf "%s\n" "e ${file_root}${file_suffix}"
    }
}

# Run tests in current package
# -----------------------------------------------------------------------------   
define-command go-test -docstring "(Go) Run tests in current package" %{
    # Get current package or directory
    #
    # Run tests with -json flag to parse results
    #
    # Output results into *test* fifo buffer
    #    Highlighters applied to output (e.g. PASS/FAIL?)
    #
    # Echo general results/info box etc?
    # 
    # Phase 1: run tests in current package/folder & output
    #          to *tests* fifi buffer
    evaluate-commands %sh{
        go test .
        if [ $? == 0 ]; then
            printf "%S\n" "echo 'Tests passed'"
        else
            printf "%s\n" "fail 'Tests failed'"
        fi
    }
}
