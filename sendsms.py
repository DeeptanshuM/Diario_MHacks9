from twilio.rest import TwilioRestClient


def send_sms(toNum, cusBody):
	account_sid = "AC7096f7321f93e80a37c3fc6b0aa3b9bf" # Your Account SID from www.twilio.com/console
	auth_token  = "a80c91cbbaab4aee9abeb1eb41fbea94"  # Your Auth Token from www.twilio.com/console
	client = TwilioRestClient(account_sid, auth_token)

	try: 
		message = client.messages.create(body=cusBody,
		to=toNum,    # Replace with your phone number
    	from_="+17735383680") # Replace with your Twilio number

	except TwilioRestException as e:
		print e

	print(message.sid)
