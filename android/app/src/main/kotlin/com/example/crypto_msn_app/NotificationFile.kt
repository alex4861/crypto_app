package com.example.crypto_msn_app

import android.app.Notification.EXTRA_NOTIFICATION_ID
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.graphics.Color
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.core.app.Person
import androidx.core.app.RemoteInput
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry


object NotificationFile {
    fun setNotification(dataMessage: Map<String,Any>, context: Context){
        val person: Person = Person.Builder()
                .setName("Isarn")
                .build()
         val KEY_TEXT_REPLY = "key_text_reply"
         val replyLabel = "Responder"
         val remoteInput: RemoteInput = RemoteInput.Builder(KEY_TEXT_REPLY).run {
             setLabel(replyLabel)
             build()
         }
         val replyPendingIntent: PendingIntent =
                 PendingIntent.getBroadcast(context,
                         0,
                         Intent(),
                         PendingIntent.FLAG_UPDATE_CURRENT)
3
         val action: NotificationCompat.Action =
                 NotificationCompat.Action.Builder(R.drawable.common_full_open_on_phone,
                         "responder", replyPendingIntent)
                         .addRemoteInput(remoteInput)
                         .build()


         val builder = NotificationCompat.Builder(context, "0")
                .setContentTitle("textTitle")
                .setContentText("textContent")
                .setSmallIcon(R.drawable.common_full_open_on_phone)
                .setPriority(NotificationCompat.PRIORITY_MAX)
                 .addAction(action)
                 .setColor(Color.argb(1,0, 100, 85))
                 .addAction(getAction(context))
                 .setStyle(NotificationCompat
                        .MessagingStyle(person)
                        .addMessage(dataMessage["message"].toString(),10202910, person)
                )
        with(NotificationManagerCompat.from(context)) {
            this.notify(0, builder.build())
        }

    }

    fun registerWith(registrar: PluginRegistry.Registrar?, context: Context){
        MethodChannel(registrar?.messenger(), "plugin.register.Notification/notification").setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
            if (call.method == "setNotification"){
                setNotification(call.arguments as Map<String, Any>, context)
                result.success(null)
            }
        }
    }

    private fun getAction(context: Context): NotificationCompat.Action{


        val snoozeIntent = Intent(context, SeeActionBroadcast::class.java).apply {
            putExtra(EXTRA_NOTIFICATION_ID, 0)
        }
        val pendingIntent= PendingIntent.getBroadcast(context, 1, snoozeIntent, PendingIntent.FLAG_UPDATE_CURRENT)
        return NotificationCompat.Action.Builder(R.drawable.common_full_open_on_phone,
                        "Marcar como leído", pendingIntent)
                        .build()


    }
}