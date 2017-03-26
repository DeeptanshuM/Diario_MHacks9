import spotify

from flask import Flask,request
from twilio import twiml
from twilio.rest import TwilioRestClient

import urllib

client = TwilioRestClient(account='AC7096f7321f93e80a37c3fc6b0aa3b9bf',token='a80c91cbbaab4aee9abeb1eb41fbea94')

app = Flask(__name__)

# A route to respond to SMS messages and kick off a phone call.
@app.route('/sms', methods=['POST'])
def inbound_sms():
    response = twiml.Response()
    response.message('Thanks for texting! Searching for your song now.'
                     'Wait to receive a phone call :)')
 
    # Grab the song title from the body of the text message.
    song_title = urllib.quote(request.form['Body'])
 
    # Grab the relevant phone numbers.
    from_number = request.form['From']
    to_number = request.form['To']
 
    # Create a phone call that uses our other route to play a song from Spotify.
    client.calls.create(to=from_number, from_=to_number,
                        url='http://134ab106.ngrok.io/call?track={}'
                        .format(song_title))
 
    return str(response)
 
 
# A route to handle the logic for phone calls.
@app.route('/call', methods=['POST'])
def outbound_call():
    song_title = request.args.get('track')
    track_url = spotify.get_track_url(song_title)
 
    response = twiml.Response()
    response.play(track_url)
    return str(response)
 
app.run(host='0.0.0.0', debug=True)