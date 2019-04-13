package com.example.myapplication;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;


// this will show how we will show our messages in the list view
public class MessageState extends BaseAdapter {

    List<Message> messages = new ArrayList<Message>();
    Context context;

    public MessageState(Context context) {
        this.context = context;
    }

    public void add(Message message) {
        this.messages.add(message);
        notifyDataSetChanged(); // to render the list we need to notify
    }


    @Override
    public int getCount() {
        return messages.size();
    }

    @Override
    public Object getItem(int i) {
        return messages.get(i);
    }

    //get element of that index number
    @Override
    public long getItemId(int i) {
        return i;
    }

    // This is the backbone of the class, it handles the creation of single ListView row (chat bubble)
    @Override
    public View getView(int i, View convertView, ViewGroup viewGroup) {


        MessageViewHolder holder = new MessageViewHolder();
        LayoutInflater messageInflater = (LayoutInflater) context.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
        Message message = messages.get(i);

        convertView = messageInflater.inflate(R.layout.my_message, null);
        holder.messageBody = (TextView) convertView.findViewById(R.id.message_body);
        convertView.setTag(holder);
        holder.messageBody.setText(message.getText());


        //holder.messageBody.setText(message.getText());

        return convertView;
    }

    private class MessageViewHolder {

        public TextView messageBody;

    }
}
