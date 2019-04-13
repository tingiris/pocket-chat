package com.example.myapplication;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;

import static com.example.myapplication.R.layout.chat_screen;
import static com.example.myapplication.R.layout.create_wallet_login;

public class Main2Activity extends AppCompatActivity {

    //Button wllt;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.import_login);

        Button import_W = (Button)findViewById(R.id.import_Button);
        Button create_W = (Button)findViewById(R.id.createWalletButton);

            import_W.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    setContentView(chat_screen);
                }

            } );


            create_W.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View j) {
                    setContentView(create_wallet_login);
                }

            } );

    }



}
