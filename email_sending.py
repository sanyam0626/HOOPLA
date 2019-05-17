import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


def email_send(email, password, verify):
    msg = MIMEMultipart()
    msg['From'] = 'sanyam.moudgil26@gmail.com'
    msg['To'] = email
    msg['Subject'] = "Registeration"
    body = "ThankYou for registering with us \n"+"\n"+"Your Login Credentials are: \n"+"Username: "+email+"\n"+"Password: "+password+"\n"\
           +\
           "Please verify your email by clicking on the verification link below \n"+"Verification Link: "+verify
    msg.attach(MIMEText(body, 'plain'))
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login('sanyam.moudgil26@gmail.com', 'deepikasharma')
    text = msg.as_string()
    server.sendmail(msg['From'], msg['To'], text)
    server.quit()


def otpsend(otp, usermail, subject, message):
    msg = MIMEMultipart()
    msg['From'] = 'sanyam.moudgil26@gmail.com'
    msg['To'] = usermail
    msg['Subject'] = subject
    body = message+"\n"+"Your One Time Password is = "+str(otp)
    msg.attach(MIMEText(body, 'plain'))
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login('sanyam.moudgil26@gmail.com', 'deepikasharma')
    text = msg.as_string()
    server.sendmail(msg['From'], msg['To'], text)
    server.quit()


def password_send(password, usermail, subject, message):
    msg = MIMEMultipart()
    msg['From'] = 'sanyam.moudgil26@gmail.com'
    msg['To'] = usermail
    msg['Subject'] = subject
    body = message + "\n" + "Your New Password is = " + str(password)
    msg.attach(MIMEText(body, 'plain'))
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login('sanyam.moudgil26@gmail.com', 'deepikasharma')
    text = msg.as_string()
    server.sendmail(msg['From'], msg['To'], text)
    server.quit()