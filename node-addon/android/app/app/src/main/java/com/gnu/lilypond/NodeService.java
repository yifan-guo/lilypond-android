package com.gnu.lilypond;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;



public class NodeService extends Service {
	public NodeService() {
	}

	@Override
	public IBinder onBind(Intent intent) {
		// TODO: Return the communication channel to the service.
		throw new UnsupportedOperationException("Not yet implemented");
	}
}
