package com.sixtyfour.academica;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;

public class bali extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bali);


        Button profil = (Button)findViewById(R.id.avatar);
        profil.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(bali.this, profile.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        Button btback = (Button)findViewById(R.id.btback);


        btback.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(bali.this, menu_list.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        ImageButton pakaian_bali = (ImageButton)findViewById(R.id.bt_pakaian_bali);
        pakaian_bali.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(bali.this, pakaian_bali.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        ImageButton musik_bali = (ImageButton)findViewById(R.id.bt_musik_bali);
        musik_bali.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(bali.this, musik_nusantara.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

    }
}
