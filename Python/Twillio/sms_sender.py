from twilio.rest import Client

# Twilio credentials
account_sid = 'your_account_sid'
auth_token = 'your_auth_token'
twilio_phone_number = 'your_twilio_phone_number'

# Reciever:
receiver_phone_number = '+47'

# Create a Twilio client
client = Client(account_sid, auth_token)

# Message content
message_body = 'Test, fra Twillio'
sender_phone_number = twilio_phone_number

# Send SMS
message = client.messages.create(
    body=message_body,
    from_=sender_phone_number,
    to=receiver_phone_number
)

print(f"Message sent successfully! SID: {message.sid}")
