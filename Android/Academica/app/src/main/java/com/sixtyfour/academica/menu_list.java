package com.sixtyfour.academica;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class menu_list extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu_list);


        Button profil = (Button)findViewById(R.id.avatar);
        profil.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(menu_list.this, profile.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });


        Button sumsel = (Button)findViewById(R.id.btsumsel);


        sumsel.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(menu_list.this, sumatera_selatan.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        Button bali = (Button)findViewById(R.id.btbali);


        bali.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(menu_list.this, bali.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });


        Button jawa = (Button)findViewById(R.id.btjawa);


        jawa.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(menu_list.this, jawa_tengah.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

       Button kalimantan = (Button)findViewById(R.id.btkalimantan);

        kalimantan.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(menu_list.this, kalimantan.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });

        Button sulawesi = (Button)findViewById(R.id.btsulawesi);


        sulawesi.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(menu_list.this, sulawesi_selatan.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });










        Button btback = (Button)findViewById(R.id.btback);


        btback.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                Intent i = new Intent(menu_list.this, home_dashboard.class);
                startActivity(i);
                overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out);
            }
        });


    }
}