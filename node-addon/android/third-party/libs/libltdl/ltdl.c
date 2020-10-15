
// placeholders


#include "ltdl.h"



int lt_dlinit ()
{
	return 0;
}


lt_dlhandle lt_dlopenext	(const char *filename)
{
	return 0;
}


const char *lt_dlerror		()
{
	return "__FAKE_LTDL_ERROR__";
}


lt_ptr	    lt_dlsym		(lt_dlhandle handle, const char *name)
{
	return 0;
}


int	    lt_dlclose		(lt_dlhandle handle)
{
	return 0;
}
