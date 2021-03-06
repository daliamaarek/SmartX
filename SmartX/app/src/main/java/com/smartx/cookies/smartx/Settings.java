package com.smartx.cookies.smartx;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import models.User;
import retrofit.Callback;
import retrofit.RestAdapter;
import retrofit.RetrofitError;
import retrofit.client.Response;



public class Settings extends Activity {
    Button changePasswordB;
    int userID;
    String oldPasswordS;
    String newPasswordS;
    String confirmPasswordS;
    EditText oldPassword;
    EditText newPassword;
    EditText confirmPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_settings);
        changePasswordB = (Button) findViewById(R.id.changePasswordButton);
        final SharedPreferences mSharedPreference = PreferenceManager.getDefaultSharedPreferences(getBaseContext());
        userID = (mSharedPreference.getInt("userID", 1));
        EditText oldPassword = (EditText) findViewById(R.id.oldPassword);
        EditText newPassword = (EditText) findViewById(R.id.newPassword);
        EditText confirmPassword = (EditText) findViewById(R.id.passwordConfirm);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_settings, menu);
        return true;
    }

    public void changePassword(View v) {
        oldPasswordS = oldPassword.getText().toString();
        newPasswordS = newPassword.getText().toString();
        confirmPasswordS = confirmPassword.getText().toString();
        if (newPassword.equals(confirmPassword)) {
            RestAdapter adapter = new RestAdapter.Builder().setEndpoint(getResources().getString(R.string.ENDPOINT)).build();
            myAPI api = adapter.create(myAPI.class);

            api.getUser(userID + "", new Callback<User>() {
                @Override
                public void success(User user, Response response) {

                }

                @Override
                public void failure(RetrofitError error) {

                }
            });
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }
}
