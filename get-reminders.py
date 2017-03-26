from firebase import firebase
import time

FIREBASE_URL = "https://mhacks9-fead9.firebaseio.com/"
fb_auth = firebase.FirebaseAuthentication("wdeBNz2sf00t3l3UIp53Hv3AzLR3jTU7VMHCUGGS", 'kenandominic123@gmail.com', debug=True, extra=None)

fb = firebase.FirebaseApplication(FIREBASE_URL, fb_auth) # Create a reference to the Firebase Application
users = fb.get('/users', None) # Get  data from firebase


for user in users: 
	for events in user:
		if time.strftime("%c")==events["date"]

print result
