package com.sixtyfour.academica;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;

public class sumsel_pakaian extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sumsel_pakaian);



        Button profil = (Button)findViewById(R.id.avatar);
        profil.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(sumsel_pakaian.this, profile.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });


        ImageButton rumah_sumsel = (ImageButton)findViewById(R.id.bt_rumah_sumsel);


        rumah_sumsel.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(sumsel_pakaian.this, sumatera_selatan.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        ImageButton musik_sumsel = (ImageButton)findViewById(R.id.bt_musik_sumsel);


        musik_sumsel.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(sumsel_pakaian.this, musik_nusantara.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        Button btback = (Button)findViewById(R.id.btback);


        btback.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(sumsel_pakaian.this, menu_list.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

    }
}