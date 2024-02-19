import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:isu_flutter_interview/data/services/calendar_service.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class CalendarRepository implements ICalendarService {
  CalendarRepository();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[CalendarApi.calendarScope],
  );

  Future<AuthClient> getAuthenticatedClient() async {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication authentication =
        await account!.authentication;
    final AuthClient client = authenticatedClient(
      http.Client(),
      AccessCredentials(
        AccessToken('Bearer', authentication.accessToken!,
            DateTime.now().add(Duration(hours: 1))),
        null,
        _googleSignIn.scopes,
      ),
    );
    return client;
  }

  Future<bool> insertEvent(Event event) async {
    try {
      final client = await getAuthenticatedClient();
      final calendar = CalendarApi(client);
      const String calendarId = "primary";
      final value = await calendar.events.insert(event, calendarId);

      print("ADDED: ${value.status}");
      if (value.status == "confirmed") {
        return true;
      } else {
        print("Unable to add event in google calendar");
        return false;
      }
    } catch (e) {
      print('Error creating event: $e');
      return false;
    }
  }

  @override
  Future<bool> syncGoogleCalendar(Event event) async {
    final result = await insertEvent(event);
    return result;
  }
}
