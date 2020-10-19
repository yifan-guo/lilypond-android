package com.gnu.lilypond;

import androidx.appcompat.app.AppCompatActivity;

import android.net.Uri;
import android.os.Bundle;
import android.os.AsyncTask;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.content.Intent;
import java.net.*;
import java.io.*;



public class MainActivity extends AppCompatActivity {

	// We just want one instance of node running in the background.
	//public static boolean _startedNodeAlready = false;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		Intent intent = new Intent(this, NodeService.class);
		startService(intent);

		final Button buttonOpen = (Button) findViewById(R.id.btRequest);
		final TextView textViewStatus = (TextView) findViewById(R.id.tvRequest);

		buttonOpen.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				/*// Network operations should be done in the background.
				new AsyncTask<Void,Void,String>() {
					@Override
					protected String doInBackground(Void... params) {
						String nodeResponse="";
						try {
							URL localNodeServer = new URL("http://localhost:3000/");
							BufferedReader in = new BufferedReader(
									new InputStreamReader(localNodeServer.openStream()));
							String inputLine;
							while ((inputLine = in.readLine()) != null)
								nodeResponse=nodeResponse+inputLine;
							in.close();
						} catch (Exception ex) {
							nodeResponse=ex.toString();
						}
						return nodeResponse;
					}

					@Override
					protected void onPostExecute(String result) {
						textViewStatus.setText(result);
					}
				}.execute();*/
				Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://localhost:3000/"));
				startActivity(browserIntent);
			}
		});

		textViewStatus.setText("Lilypond server started.");
	}

}
