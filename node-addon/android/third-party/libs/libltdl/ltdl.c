
// placeholders


#include "ltdl.h"

#include <dlfcn.h>



int lt_dlinit ()
{
	return 0;
}


lt_dlhandle lt_dlopenext	(const char *filename)
{
	char path[0x1000];
	strcpy (path, filename);

	// append .so
	size_t len = strlen(path);
	if (path[len - 3] != '.' || path[len - 2] != 's' || path[len - 1] != 'o')
		strcat(path, ".so");

	return (lt_dlhandle)dlopen(path, RTLD_LAZY);
}


const char *lt_dlerror		()
{
	//return "__FAKE_LTDL_ERROR__";
	return dlerror();
}


lt_ptr	    lt_dlsym		(lt_dlhandle handle, const char *name)
{
	return dlsym((void*)handle, name);
}


int	    lt_dlclose		(lt_dlhandle handle)
{
	return dlclose((void*)handle);
}
