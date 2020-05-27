# -----------------------------------------------------------------------------
# General configuration for Go development.
#
# Will likely turn this into a proper Kakoune plugin at some point, so
# mappings etc are defined in other .kak files
# -----------------------------------------------------------------------------

# Note some Go LSP-related options defined in plugins.kak, in the kak-lsp block

# Ideas
    # Run unit tests in tmux split?
    # Show test coverage - spec ranges?

# Additional Go syntax highlighting (test coverge, dependency files)
# -----------------------------------------------------------------------------
provide-module go-deps-syntax %{
    # add-highlighter shared/go-deps-syntax regions

    # Dependency file highlighters (go.mod/sum files)
    add-highlighter shared/godeps regions
    # Comments
    add-highlighter shared/godeps/comments region "//" '\n' fill comment
    # Hash
    add-highlighter shared/godeps/hash region "h1:" '\n' fill yellow

	add-highlighter shared/godeps/default default-region group
    # Module keywords
    add-highlighter shared/godeps/default/ regex go|module|require|replace|exclude 0:keyword
    # Versions/pseudo-versions etc
    add-highlighter shared/godeps/default/ regex v(\d+\.)?(\d+\.)?(\d+)([^\s]+|[^\n]+) 0:cyan
    # Dependencies - this specifically matches dependencies at the start of the line (prefixed by
    # tab chars) which has the nice effect of leaving replacements & exclusions un-highlighted
    add-highlighter shared/godeps/default/ regex \t?([a-zA-Z0-9_\-]+\.[a-zA-Z0-9_\-]+)([^\s]+) 0:green
    # Replace symbol
    add-highlighter shared/godeps/default/ regex (=>) 0:yellow
    
	
    # Define faces for test coverage output; overridable
    # set-face global Covered green
    # set-face global NotCovered red
    # set-face global Uninstrumented blue
    
    # # Test coverge highlighters
    # add-highlighter shared/go/coverage group
    # add-highlighter shared/go/coverage/ fill Uninstrumented
    # add-highlighter shared/go/coverage/ ranges go_covered_range
    # add-highlighter shared/go/coverage/ ranges go_notcovered_range
}

hook global WinSetOption filetype=(godepfile) %{
    require-module go-deps-syntax

    add-highlighter window/godeps ref godeps

    hook -once -always window WinSetOption filetype=.* %{
        remove-highlighter window/godeps
    }
}

hook global BufCreate .+\.(mod|sum) %{
    set-option buffer filetype godepfile
}

# Switch to alternate file (e.g. rom foo.go to foo_test.go, go.mod to go.sum)
# -----------------------------------------------------------------------------
define-command go-alternate -docstring "(Go) Switch to alternate file" %{
    evaluate-commands %sh{
        file_root=""
   	    file_suffix=""
   	    if [[ "${kak_bufname}" =~ _test\.go$ ]]; then
   	        file_root=${kak_bufname%_test*}
	        file_suffix='.go'
        elif [[ "${kak_bufname}" =~ \.go$ ]]; then
            file_root=${kak_bufname%.go*}
            file_suffix='_test.go'
        elif [[ "${kak_buffile}" =~ go\.mod$ ]]; then
            file_suffix='go.sum'
        elif [[ "${kak_buffile}" =~ go\.sum$ ]]; then
            file_suffix='go.mod'
        else
            printf "%s\n" "fail 'Not a Go file'"
 	        exit
        fi

		if [ ! -f ${file_root}${file_suffix} ]; then
		    printf "%s\n" "fail '${file_root##*/}${file_suffix} does not exist'"
		    exit
		fi
		
        # TODO - Check alt file is readable?
         
        printf "%s\n" "edit ${file_root}${file_suffix}"
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
    #          to *tests* fifo buffer
    evaluate-commands %sh{
        # Get diectory current buffer file is in & filename
        # bufname
        cur_dir=${kak_buffile%/*}

        # TODO - temporary
        go test ${cur_dir} > /dev/null 2>&1
        # Get output, put into fifo buffer + apply highlighters

        if [ $? == 0 ]; then
            printf "%s\n" "echo -markup '{green}Tests passed'"
        else
            printf "%s\n" "fail 'Tests failed'"
        fi
    }
}

# Whether coverage highlights are being displayed
# TODO: Rename this, not quite happy with it
declare-option bool go_coverage false

# Range spec for code covered by a test
declare-option -hidden range-specs go_covered_range
# Range spec fof code not covered by a test
declare-option -hidden range-specs go_notcovered_range

# Define faces for test coverage output
set-face global Covered green
set-face global NotCovered red
set-face global Uninstrumented blue

# Display test coverage in the current buffer
# -----------------------------------------------------------------------------
define-command go-coverage -docstring "(Go) Show test coverage for the currently open file" %{
    evaluate-commands %sh{
        # If already displaying coverage
        if [ "${kak_opt_go_coverage}" = "true" ]; then
            printf "%s\n" "set-option window go_coverage false"
            exit
        fi
        
        # Run coverage test for current directory
        go test ${kak_buffile%/*} -coverprofile=cover.out > /dev/null 2>&1

		# Set up coverage highlighters
		printf "%s\n" "set-option window go_covered_range %val{timestamp}"
		printf "%s\n" "set-option window go_notcovered_range %val{timestamp}"
		
		# Loop through coerage file and apply faces to range-specs
		IFS=":, "
		grep ${kak_bufname##*/} cover.out | while read -r file start end freq covered; do
			if [ $covered == "1" ]; then
    			range="go_covered_range"
    			face="Covered"
            else
    			range="go_notcovered_range"
    			face="NotCovered"
            fi
		    printf "%s\n" "set-option -add window ${range} '${start},${end}|${face}'"	
		done
		
		# Clean up and apply highlighters
		rm -f cover.out
        printf "%s\n" "set-option window go_coverage true"
    }
}

# Create shared group for coverage highlighters, and add them to it
add-highlighter shared/test_coverage group
add-highlighter shared/test_coverage/ fill Uninstrumented
add-highlighter shared/test_coverage/ ranges go_covered_range
add-highlighter shared/test_coverage/ ranges go_notcovered_range

# Hooks to apply coverage highlights based on coverage option value
hook global WinSetOption go_coverage=true %{
    add-highlighter window/test_coverage ref test_coverage

	# Remove highlighters
    hook -once -always window WinSetOption go_coverage=false %{
        remove-highlighter window/test_coverage
	}
}
