
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


#[[#import_lib(guile /usr/lib/x86_64-linux-gnu/libguile-2.2.so.1)
import_lib(guile /usr/local/lib/libguile.so.17)
import_lib(fontconfig /usr/lib/x86_64-linux-gnu/libfontconfig.so.1)
import_lib(pangoft2 /usr/lib/x86_64-linux-gnu/libpangoft2-1.0.so.0)]]
