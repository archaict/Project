package com.sixtyfour.academica;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

public class SplashScreen extends AppCompatActivity {

    private Handler handler = new Handler();
    private Runnable delayRunnable = new Runnable() {
        @Override
        public void run() {
            Intent i = new Intent(getApplicationContext(), MainActivity.class);
            overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
        }
    };

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        startActivity(new Intent(this,MainActivity.class));
    }
}
