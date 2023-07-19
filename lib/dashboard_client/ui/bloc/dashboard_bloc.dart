import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qims_mobile/share/api_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  DashboardBloc(this.flutterLocalNotificationsPlugin) : super(DashboardState()) {
    on<OnDashboardEvent>(_validateToDashboard);
    on<OnNotificationEvent>(_handleNotificationEvent);
  }

  FutureOr<void> _validateToDashboard(OnDashboardEvent event, Emitter<DashboardState> emit) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(
        state.copyWith(
            status: DashboardStateStatus.loading
        )
    );

    try{
      var url = Uri.parse(ApiConstant.klien);
      var request = await http.post(
          url,
          body: {
            'id_klien' : prefs.getString('id_klien'),
            // 'level' : prefs.getString('level'),
          }
      );
      // print('Level : $');


      var response = jsonDecode(request.body);
      // print('print ${response['profil'][0]['nama_klien']}');
      // print('print ${response['cor'][0]['sert']}');
      if(response['status'] == 'fail') {
        emit(
            state.copyWith(
              message:response['error_msg'],
              status: DashboardStateStatus.error,
            )
        );
      } else {
        emit(
            state.copyWith(
              status: DashboardStateStatus.success,
              nama_klien: response['profil'][0]['nama_klien'],
              alamat: response['profil'][0]['alamat'],
              nama_cp: response['profil'][0]['nama_cp'],
              no_hp: response['profil'][0]['no_hp'],
              email: response['profil'][0]['email'],

              jml_sertifikat: response['jml_sertifikat'],
              telah_dijadwalkan: response['telah_dijadwalkan'],
              dijadwalkan: response['dijadwalkan'],
              selesai: response['selesai'],

              no_reg: response['cor'][0]['no_reg'],
              nama_iso: response['cor'][0]['nama_iso'],
              scope: response['cor'][0]['scope'],
              tgl_expire: response['cor'][0]['tgl_expire'],
              tgl_asses: response['cor'][0]['tgl_asses'],
              sert: response['cor'][0]['sert'],
            ));
        // Panggil metode scheduleNotification dari DashboardBloc
        // scheduleNotification(response['cor'][0]['tgl_asses']);
      }
    } catch(error, stacktrace) {
      emit(state.copyWith(status: DashboardStateStatus.error)
      );
    }
  }

  FutureOr<void> _handleNotificationEvent(OnNotificationEvent event, Emitter<DashboardState> emit) {
    // Panggil metode scheduleNotification dari DashboardBloc
    scheduleNotification(event.tglAsses!);
  }

  /// Function to schedule notification
  FutureOr <void> scheduleNotification(String tglAsses) async {
    tz.initializeTimeZones();
    print('Tanggal Assessment $tglAsses');
    //mengubah string tglAsses menjadi DateTime
    DateTime tglAssesDate = DateTime.parse(tglAsses);
    //mendapatkan waktu sekarang
    DateTime now = DateTime.now();
    //Pengecekan tglAsses udah lewat/belum
    if (tglAssesDate.isAfter(now)) {
      // Tgl Asses belum lewat, atur notifikasi berdasarkan tglAsses
      //mengatur zona waktu
      tz.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation('Asia/Jakarta'));
      // String timeZoneName = tz.local.name;
      // Tambahkan logika untuk menentukan waktu notifikasi
      tz.TZDateTime notificationTime = tz.TZDateTime(
        tz.local,
        tglAssesDate.year,
        tglAssesDate.month,
        tglAssesDate.day,
        6, 25, 0,
      );
      print('Tanggal Notifikasi $tglAssesDate');

      //buat jadwal notifikasi
      var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
          'channelId',
          'channelName',
        importance: Importance.high,
        priority: Priority.high,
        playSound: true,
      );
      ///ios
      var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
      );
      await flutterLocalNotificationsPlugin.zonedSchedule(
          0,
          'Notifikasi',
          'Mohon registrasi Surveillance',
          notificationTime,
          androidAllowWhileIdle: true,
          platformChannelSpecifics,
          uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
          matchDateTimeComponents: DateTimeComponents.time,
      );
    }
  }
}
