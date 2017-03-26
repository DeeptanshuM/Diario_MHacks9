from firebase import firebase
import time
from datetime import datetime
import sendsms

FIREBASE_URL = "https://mhacks9-fead9.firebaseio.com/"
fb_auth = firebase.FirebaseAuthentication("wdeBNz2sf00t3l3UIp53Hv3AzLR3jTU7VMHCUGGS", 'kenandominic123@gmail.com', debug=True, extra=None)

fb = firebase.FirebaseApplication(FIREBASE_URL, fb_auth) # Create a reference to the Firebase Application
users = fb.get('/users', None) # Get  data from firebase


while True:
	for user in users: 

		print user
		for events in user["Events"]:

			print events
			serverDate = events["date"] + " " + events["time"]
			datetime_sys = now.strftime("%m-%d-%Y %H:%M")

			if datetime_sys <= serverDate:
				song = events["song"]
				phone = user["phone"]
				name = events["name"]
				time = events["time"]
				message = "Hey you have an appointment today named: " + name + "at" + time

				sendsms.send_sms(phone, message)


print result
