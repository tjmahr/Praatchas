# # Demo: print each item in fileList
# @strings_iter("fileList", "initialize")
# 
# while strings_iter.has_next
#	@strings_iter("fileList", "next")
#	# "Do stuff" part
#	appendInfoLine: strings_iter.next$;
# endwhile

# An iterator for a list of strings
procedure strings_iter(.list$, .method$)
	selectObject: "Strings '.list$'"
	
	if .method$ = "initialize"
		.length = Get number of strings
		.index = 0
	endif
	
	if .method$ = "next"
		.index = .index + 1
		.next$ = Get string: .index
	endif
	
	if .method$ = "has_next"
		# .has_next is updated whenever procedure is invoked
	endif
	
	if .index < .length
		.has_next = 1
	else
		.has_next = 0
	endif
endproc
