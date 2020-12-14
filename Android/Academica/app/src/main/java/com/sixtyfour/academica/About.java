package com.sixtyfour.academica;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class About extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_about);

        Button back = (Button)findViewById(R.id.nxxc_logo);

        back.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(About.this, home_dashboard.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });


    }
}