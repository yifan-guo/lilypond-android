
package com.gnu.lilyponddemo;

import java.io.*;
import android.app.Service;
import android.content.Intent;
import android.os.*;
import android.os.Process;
import android.content.res.AssetManager;
import android.content.SharedPreferences;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;



public class NodeService extends Service {
	// Used to load the 'native-lib' library on application startup.
	static {
		System.loadLibrary("native-lib");
		System.loadLibrary("node");
	}

	private Looper serviceLooper;
	private ServiceHandler serviceHandler;


	private final class ServiceHandler extends Handler {
		public ServiceHandler(Looper looper) {
			super(looper);
		}

		@Override
		public void handleMessage(Message msg) {
			// The path where we expect the node project to be at runtime.
			String nodeDir = getApplicationContext().getFilesDir().getAbsolutePath() + "/lilypond-server";
			if (wasAPKUpdated()) {
				// Recursively delete any existing lilypond-server.
				File nodeDirReference = new File(nodeDir);
				if (nodeDirReference.exists()) {
					deleteFolderRecursively(new File(nodeDir));
				}

				// Copy the node project from assets into the application's data path.
				copyAssetFolder(getApplicationContext().getAssets(), "lilypond-server", nodeDir);

				saveLastUpdateTime();
			}

			startNodeWithArguments(new String[] {"node", nodeDir + "/main.js"});
		}

		private boolean wasAPKUpdated() {
			SharedPreferences prefs = getApplicationContext().getSharedPreferences("NODEJS_MOBILE_PREFS", Context.MODE_PRIVATE);
			long previousLastUpdateTime = prefs.getLong("NODEJS_MOBILE_APK_LastUpdateTime", 0);
			long lastUpdateTime = 1;
			try {
				PackageInfo packageInfo = getApplicationContext().getPackageManager().getPackageInfo(getApplicationContext().getPackageName(), 0);
				lastUpdateTime = packageInfo.lastUpdateTime;
			} catch (PackageManager.NameNotFoundException e) {
				e.printStackTrace();
			}
			return (lastUpdateTime != previousLastUpdateTime);
		}

		private void saveLastUpdateTime() {
			long lastUpdateTime = 1;
			try {
				PackageInfo packageInfo = getApplicationContext().getPackageManager().getPackageInfo(getApplicationContext().getPackageName(), 0);
				lastUpdateTime = packageInfo.lastUpdateTime;
			} catch (PackageManager.NameNotFoundException e) {
				e.printStackTrace();
			}
			SharedPreferences prefs = getApplicationContext().getSharedPreferences("NODEJS_MOBILE_PREFS", Context.MODE_PRIVATE);
			SharedPreferences.Editor editor = prefs.edit();
			editor.putLong("NODEJS_MOBILE_APK_LastUpdateTime", lastUpdateTime);
			editor.commit();
		}
	}


	@Override
	public void onCreate() {
		HandlerThread thread = new HandlerThread("ServiceStartArguments", Process.THREAD_PRIORITY_BACKGROUND);
		thread.start();

		serviceLooper = thread.getLooper();
		serviceHandler = new ServiceHandler(serviceLooper);
	}

	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		//Toast.makeText(this, "service starting", Toast.LENGTH_SHORT).show();

		Message msg = serviceHandler.obtainMessage();
		//msg.arg1 = startId;
		serviceHandler.sendMessage(msg);

		return START_STICKY;
	}

	@Override
	public IBinder onBind(Intent intent) {
		return null;
	}


	public native Integer startNodeWithArguments(String[] arguments);


	private static boolean deleteFolderRecursively(File file) {
		try {
			boolean res=true;
			for (File childFile : file.listFiles()) {
				if (childFile.isDirectory()) {
					res &= deleteFolderRecursively(childFile);
				} else {
					res &= childFile.delete();
				}
			}
			res &= file.delete();
			return res;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private static boolean copyAssetFolder(AssetManager assetManager, String fromAssetPath, String toPath) {
		try {
			String[] files = assetManager.list(fromAssetPath);
			boolean res = true;

			if (files.length==0) {
				// If it's a file, it won't have any assets "inside" it.
				res &= copyAsset(assetManager,
						fromAssetPath,
						toPath);
			} else {
				new File(toPath).mkdirs();
				for (String file : files)
				res &= copyAssetFolder(assetManager,
						fromAssetPath + "/" + file,
						toPath + "/" + file);
			}
			return res;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private static boolean copyAsset(AssetManager assetManager, String fromAssetPath, String toPath) {
		InputStream in = null;
		OutputStream out = null;
		try {
			in = assetManager.open(fromAssetPath);
			new File(toPath).createNewFile();
			out = new FileOutputStream(toPath);
			copyFile(in, out);
			in.close();
			in = null;
			out.flush();
			out.close();
			out = null;
			return true;
		} catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	private static void copyFile(InputStream in, OutputStream out) throws IOException {
		byte[] buffer = new byte[1024];
		int read;
		while ((read = in.read(buffer)) != -1) {
			out.write(buffer, 0, read);
		}
	}
}
