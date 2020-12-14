package com.sixtyfour.academica;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;

public class pakaian_bali extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pakaian_bali);


        Button profil = (Button)findViewById(R.id.avatar);
        profil.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(pakaian_bali.this, profile.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        ImageButton rumah_bali = (ImageButton)findViewById(R.id.bt_rumah_bali);


        rumah_bali.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(pakaian_bali.this, bali.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        ImageButton musik_bali = (ImageButton)findViewById(R.id.bt_musik_bali);


        musik_bali.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(pakaian_bali.this, musik_nusantara.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        Button btback = (Button)findViewById(R.id.btback);


        btback.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(pakaian_bali.this, menu_list.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

    }
}
