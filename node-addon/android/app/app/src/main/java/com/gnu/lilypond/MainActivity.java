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

	static String lyCode = "\\version \"2.20.0\"\n\\relative c' {c1}";

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		// Run nodejs server in a android service to keep it alive when app in the background.
		Intent intent = new Intent(this, NodeService.class);
		startService(intent);

		final Button buttonRequest = (Button) findViewById(R.id.btRequest);
		final Button buttonOpen = (Button) findViewById(R.id.btOpen);
		final TextView textViewStatus = (TextView) findViewById(R.id.tvRequest);

		buttonRequest.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				textViewStatus.setText("Request sent, waiting for response...");

				// Network operations should be done in the background.
				new AsyncTask<Void,Void,String>() {
					@Override
					protected String doInBackground(Void... params) {
						String nodeResponse = "";
						try {
							URL localNodeServer = new URL("http://localhost:3000/");
							HttpURLConnection conn = (HttpURLConnection)localNodeServer.openConnection();
							conn.setRequestMethod("POST");
							conn.setDoInput(true);
							conn.setDoOutput(true);

							OutputStream os = conn.getOutputStream();
							BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(os, "UTF-8"));
							writer.write(lyCode);
							writer.flush();
							writer.close();
							os.close();

							int responseCode = conn.getResponseCode();
							if (responseCode == HttpURLConnection.HTTP_OK)
								nodeResponse = "It worked:\n";
							else
								nodeResponse = "It failed:\n";

							String inputLine;
							BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
							while ((inputLine = br.readLine()) != null)
								nodeResponse = nodeResponse + inputLine;
						} catch (Exception ex) {
							nodeResponse = ex.toString();
						}
						return nodeResponse;
					}

					@Override
					protected void onPostExecute(String result) {
						textViewStatus.setText(result);
					}
				}.execute();
			}
		});

		buttonOpen.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://localhost:3000/"));
				startActivity(browserIntent);
			}
		});

		textViewStatus.setText("Lilypond server started.");
	}

}
