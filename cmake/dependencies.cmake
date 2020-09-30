
function(import_lib NAME PATH)
	message("Imported external library: " ${NAME})

	add_library(
		${NAME}

		SHARED
		IMPORTED
	)

	set_target_properties(
		${NAME}

		PROPERTIES IMPORTED_LOCATION
		${PATH}
	)
endfunction()


import_lib(guile /usr/lib/x86_64-linux-gnu/libguile-2.2.so.1)
