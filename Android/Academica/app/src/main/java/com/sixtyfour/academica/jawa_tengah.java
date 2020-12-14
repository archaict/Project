package com.sixtyfour.academica;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;

public class jawa_tengah extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_jawa_tengah);



        Button profil = (Button)findViewById(R.id.avatar);
        profil.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(jawa_tengah.this, profile.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        Button btback = (Button)findViewById(R.id.btback);


        btback.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(jawa_tengah.this, menu_list.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        ImageButton pakaian_jawa_tengah = (ImageButton)findViewById(R.id.bt_pakaian_jawa);
        pakaian_jawa_tengah.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(jawa_tengah.this, pakaian_jawa.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        ImageButton musik_jawa = (ImageButton)findViewById(R.id.bt_musik_jawa);
        musik_jawa.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(jawa_tengah.this, musik_nusantara.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

    }
}
