package com.sixtyfour.academica;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;

public class sulsel_pakaian extends AppCompatActivity {



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sulsel_pakaian);



        Button profil = (Button)findViewById(R.id.avatar);
        profil.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(sulsel_pakaian.this, profile.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });



        ImageButton rumah_sulsel = (ImageButton)findViewById(R.id.bt_rumah_sulsel);


        rumah_sulsel.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(sulsel_pakaian.this, sulawesi_selatan.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        ImageButton musik_sulsel = (ImageButton)findViewById(R.id.bt_musik_sulsel);


        musik_sulsel.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(sulsel_pakaian.this, musik_nusantara.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        Button btback = (Button)findViewById(R.id.btback);


        btback.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(sulsel_pakaian.this, menu_list.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

    }
}
