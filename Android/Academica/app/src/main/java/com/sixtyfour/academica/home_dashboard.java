package com.sixtyfour.academica;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class home_dashboard extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home_dashboard);


        Button musik_nusa = (Button)findViewById(R.id.btmusiknusa);


        musik_nusa.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(home_dashboard.this, musik_nusantara.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        Button profil = (Button)findViewById(R.id.avatar);
        profil.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(home_dashboard.this, profile.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        Button rumahnusa = (Button)findViewById(R.id.btrumahnusa);


        rumahnusa.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(home_dashboard.this, menu_list.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        final Button about = (Button)findViewById(R.id.btabout);


        about.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(home_dashboard.this, About.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

    }
}