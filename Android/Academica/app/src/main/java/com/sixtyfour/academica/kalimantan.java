package com.sixtyfour.academica;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;

public class kalimantan extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_kalimantan);



        Button profil = (Button)findViewById(R.id.avatar);
        profil.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(kalimantan.this, profile.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });


        Button btback = (Button)findViewById(R.id.btback);


        btback.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(kalimantan.this, menu_list.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        ImageButton pakaian_kalimantan = (ImageButton)findViewById(R.id.bt_pakaian_kalimantan);
        pakaian_kalimantan.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(kalimantan.this, pakaian_kalimantan.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        ImageButton musik_kalimantan = (ImageButton)findViewById(R.id.bt_musik_kalimantan);
        musik_kalimantan.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(kalimantan.this, musik_nusantara.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

    }
}
