from flask import Flask, render_template, request, session, redirect, url_for, flash,session
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin, login_user, logout_user, login_manager, LoginManager, login_required, current_user
from werkzeug.security import generate_password_hash, check_password_hash
from flask_mail import Mail, Message
from flask import render_template
import time
import requests
import random
import string
import secrets



from email.mime.multipart import MIMEMultipart
from email.mime.image import MIMEImage
from email.mime.text import MIMEText


# MY db connection
local_server= True
app = Flask(__name__)
print(app.name)
app.secret_key='harshithbhaskar'

# Configure Flask-Mail settings
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 465  # Use port 465 for SSL
app.config['MAIL_USERNAME'] = 'agronexumlive@gmail.com'
app.config['MAIL_PASSWORD'] = 'vgntssbcnbrdgjhf'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True
app.config['MAIL_DEFAULT_SENDER'] = ('AgroNexumLive', 'agronexumlive@gmail.com')  # Set a default sender

# Initialize Flask-Mail
mail = Mail(app)

# An extensive blocking for sending automated mails
# Function to send email with dynamic content
def send_dynamic_email(recipient, subject, username, image_url, video_url, html_url):
    msg = Message(subject=subject, recipients=[recipient],sender=('AgroNexumlive', 'agronexumlive@gmail.com'))
    msg.html = render_template(
        html_url,
        username=username,
        image_url=image_url,
        video_url=video_url
    )
    mail.send(msg)

"""def embedded_send_dynamic_email(recipient, subject, username, image_path, video_url, html_template, mail):
    msg = Message(subject=subject, recipients=[recipient], sender=('AgroNexumlive', 'agronexumlive@gmail.com'))
    
    with open(image_path, 'rb') as img_file:
        image = MIMEImage(img_file.read())
        image.add_header('Content-ID', '<image>')
        msg.attach(image)

    msg.html = render_template(html_template, username=username, image_url='cid:image', video_url=video_url)

    mail.send(msg)"""


"""def send_email(recipient, subject, body):
    msg = Message(subject=subject, recipients=[recipient], sender=('AgroNexumlive', 'agronexumlive@gmail.com'))
    msg.body = body
    mail.send(msg)
"""




def generate_otp(length=6):
    alphabet = string.ascii_uppercase + string.digits
    return ''.join(secrets.choice(alphabet) for _ in range(length))


@app.route('/forgot_password', methods=['GET', 'POST'])
def forgot_password():
    if request.method == "POST":
        email = request.form.get('email')
        # Check if email is provided
        if not email:
            flash("Please enter your email to proceed with the OTP Login.", "warning")
            return render_template('forgot_password.html')

        # Generate OTP
        otp = generate_otp()
        # Here, you can update the user's record in the database with the hashed value of the OTP
        # Update the 'user' table accordingly using SQL or an ORM method like SQLAlchemy
        # Store the OTP and email in session
        session['otp'] = otp
        session['email'] = email
        
        # Send OTP to the user's email
        msg = Message('AgroNexumLive Login OTP', recipients=[email], sender='your_email@gmail.com')
        msg.body = f'Hello There, Your One Time Password for logging into AgroNexum Live is: {otp}'
        mail.send(msg)

        flash("An OTP has been sent to your email for your login.", "success")
        return redirect(url_for('verify_otp'))

    return render_template('forgot_password.html')

@app.route('/verify_otp', methods=['GET', 'POST'])
def verify_otp():
    if request.method == "POST":
        entered_otp = request.form.get('otp')
        # Check if entered OTP matches the stored OTP in session
        if 'otp' in session and session['otp'] == entered_otp:
            # If OTP matches, proceed to login with the email provided
            email = session['email']
            user = MyUser.query.filter_by(email=email).first()
            if user:
                # Login the user using the login_user function (assuming you're using Flask-Login)
                login_user(user)
                flash("OTP Login Successful ! You are now officially Logged in.", "success")
                
           
                # Set the session variable to indicate the user is logged in
                session['logged_in'] = True
                # Sending a login acknowledgment email for agrarians
                if user.is_agrarian:
                    subject = "Welcome Back, Agrarian!"
                    image_url = "https://drive.google.com/file/d/1FdDaL6D4mVy_jZbJ4YwzeM-OY7oBwzWD/view?usp=drive_link"  # Replace with the actual image URL
                    news_url = "https://timesofindia.indiatimes.com/topic/agriculture"  # Replace with the actual video URL
                    send_dynamic_email(user.email, subject, user.username, image_url, news_url,'email_template.html')
                    #embedded_send_dynamic_email(recipient_email, subject, username, image_path, video_url, html_template, mail)
                    #embedded_send_dynamic_email('recipient@example.com', 'Welcome Back!', 'John', '/path/to/image.jpg', 'https://example.com/video', 'email_template.html')

                else:
                    subject = "Welcome Back to AgroNexumLive!"
                    image_url = "https://drive.google.com/file/d/1xDcrhp1Dfdfn-z1Rj-jhMT4gOFMAeQy8/view?usp=drive_link"  # Replace with the actual image URL
                    news_url = "https://www.oneindia.com/vegetables-price.html"  # Replace with the actual video URL
                    send_dynamic_email(user.email, subject, user.username, image_url, news_url,'email_template4.html')
                
                return redirect(url_for('index'))  # Redirect to the main page after successful login
            else:
                flash("OOPS! User not found! SIGN UP to Continue", "danger")
                return redirect(url_for('signup'))  # Redirect to login page if user not found

        flash("Invalid OTP. Please try again.", "warning")
        return render_template('verify_otp.html')

    return render_template('verify_otp.html')


# this is for getting unique user access
login_manager=LoginManager(app)
login_manager.login_view='login'

@login_manager.user_loader
def load_user(user_id):
    return MyUser.query.get(int(user_id))

# app.config['SQLALCHEMY_DATABASE_URL']='mysql://username:password@localhost/database_name'
app.config['SQLALCHEMY_DATABASE_URI']='mysql://root:@localhost/farmers'
db=SQLAlchemy(app)

# here we will create db models that is tables
class Test(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    name=db.Column(db.String(100))

class Farming(db.Model):
    fid=db.Column(db.Integer,primary_key=True)
    farmingtype=db.Column(db.String(100))


class Addagroproducts(db.Model):
    username=db.Column(db.String(50))
    email=db.Column(db.String(50))
    pid=db.Column(db.Integer,primary_key=True)
    productname=db.Column(db.String(100))
    productdesc=db.Column(db.String(300))
    price=db.Column(db.Integer)



class Trig(db.Model):
    id=db.Column(db.Integer,primary_key=True)
    fid=db.Column(db.String(100))
    action=db.Column(db.String(100))
    timestamp=db.Column(db.String(100))


class MyUser(UserMixin, db.Model):
    __tablename__ = 'user'  # Explicitly specifying the table name
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50))
    email = db.Column(db.String(50), unique=True)
    password = db.Column(db.String(1000))
    is_agrarian = db.Column(db.Boolean, default=False)
    is_admin = db.Column(db.Boolean, default=False)

class Register(db.Model):
    rid=db.Column(db.Integer,primary_key=True)
    farmername=db.Column(db.String(50))
    adharnumber=db.Column(db.String(50))
    age=db.Column(db.Integer)
    gender=db.Column(db.String(50))
    phonenumber=db.Column(db.String(50))
    address=db.Column(db.String(50))
    farming=db.Column(db.String(50))

    

@app.route('/')
@app.route('/')
def index():
    redirect_message = session.pop('redirect_message', None)
    return render_template('index.html', redirect_message=redirect_message)


@app.route('/farmerdetails')
@login_required
def farmerdetails():
    if current_user.is_agrarian or current_user.is_admin:
        if current_user.is_admin:
            query = Register.query.all()
            return render_template('farmerdetails.html', query=query)
        if current_user.is_agrarian:
            # Fetch the current logged-in user's username
            current_username = current_user.username
        
            # Query to retrieve agrarian details for the current user
            agrarian_details = (
            db.session.query(Register)
            .join(MyUser, MyUser.username == Register.farmername)
            .filter(MyUser.username == current_username)
            .all()
            )
            return render_template('farmerdetails.html', query=agrarian_details)
    else:
        #flash("You don't have permission to view Agrarian Details page.", "warning")
        session['redirect_message'] = "You don't have permission to view Agrarian Details page."
        return redirect(url_for('index'))  # Redirect to the homepage or another suitable route


@app.route('/agroproducts')
def agroproducts():
    # query=db.engine.execute(f"SELECT * FROM `addagroproducts`") 
    query=Addagroproducts.query.all()
    return render_template('agroproducts.html',query=query)

@app.route('/addagroproduct',methods=['POST','GET'])
@login_required
def addagroproduct():
    
        if request.method=="POST":
            username=request.form.get('username')
            email=request.form.get('email')
            productname=request.form.get('productname')
            productdesc=request.form.get('productdesc')
            price=request.form.get('price')
            products=Addagroproducts(username=username,email=email,productname=productname,productdesc=productdesc,price=price)
            db.session.add(products)
            db.session.commit()
            flash("Product Added Successfully","info")
            return redirect('/agroproducts')
    
        return render_template('addagroproducts.html')
       

@app.route('/triggers')
@login_required
def triggers():
    if current_user.is_admin:
        # query=db.engine.execute(f"SELECT * FROM `trig`") 
        query=Trig.query.all()
        return render_template('triggers.html',query=query)
    else:
        session['redirect_message'] = "Only Administrators can view 'Records Created' page."
        return redirect(url_for('index'))  # Redirect to the homepage or another suitable route


@app.route('/addfarming',methods=['POST','GET'])
@login_required
def addfarming():
    if current_user.is_agrarian or current_user.is_admin:
        if request.method=="POST":
            farmingtype=request.form.get('farming')
            query=Farming.query.filter_by(farmingtype=farmingtype).first()
            if query:
                flash("Agricultural Focus Type Already Exists","warning")
                return redirect('/addfarming')
            dep=Farming(farmingtype=farmingtype)
            db.session.add(dep)
            db.session.commit()
            flash("Agricultural Type Added Successfully... ","success")
            return redirect('/addfarming')
        return render_template('farming.html')
    else:
        flash("You don't have permission to access 'Add Produce type' page.", "warning")
        return redirect(url_for('agroproducts'))  # Redirect to the homepage or another suitable route




@app.route("/delete/<string:rid>",methods=['POST','GET'])
@login_required
def delete(rid):
    # db.engine.execute(f"DELETE FROM `register` WHERE `register`.`rid`={rid}")
    post=Register.query.filter_by(rid=rid).first()
    db.session.delete(post)
    db.session.commit()
    flash("Slot Deleted Successful","warning")
    return redirect('/farmerdetails')


@app.route("/edit/<string:rid>",methods=['POST','GET'])
@login_required
def edit(rid):
    user = MyUser.query.filter_by(username=rid).first()
    
    # farming=db.engine.execute("SELECT * FROM `farming`") 
    if request.method=="POST":
        farmername=request.form.get('farmername')
        adharnumber=request.form.get('adharnumber')
        age=request.form.get('age')
        gender=request.form.get('gender')
        phonenumber=request.form.get('phonenumber')
        address=request.form.get('address')
        farmingtype=request.form.get('farmingtype')     
        # query=db.engine.execute(f"UPDATE `register` SET `farmername`='{farmername}',`adharnumber`='{adharnumber}',`age`='{age}',`gender`='{gender}',`phonenumber`='{phonenumber}',`address`='{address}',`farming`='{farmingtype}'")
        post=Register.query.filter_by(rid=rid).first()
        print(post.farmername)
        post.farmername=farmername
        post.adharnumber=adharnumber
        post.age=age
        post.gender=gender
        post.phonenumber=phonenumber
        post.address=address
        post.farming=farmingtype
        db.session.commit()
        flash("Slot is Updated","success")
        return redirect('/farmerdetails')
    posts=Register.query.filter_by(rid=rid).first()
    farming=Farming.query.all()
    return render_template('edit.html',posts=posts,farming=farming)


@app.route('/signup', methods=['POST', 'GET'])
def signup():
    if request.method == "POST":
        username = request.form.get('username')
        email = request.form.get('email')
        password = request.form.get('password')
        is_agrarian = bool(request.form.get('is_agrarian'))

        user = MyUser.query.filter_by(email=email).first()
        if user:
            flash("Kindly Verify! Email Already Exists!", "warning")
            return render_template('/signup.html')

        enc_password = generate_password_hash(password)
        new_user = MyUser(username=username, email=email, password=enc_password, is_agrarian=is_agrarian)
        db.session.add(new_user)
        db.session.commit()

        flash("Signup Successful... Please Login to continue.", "success")
                # Sending email after successful signup
        if new_user.is_agrarian:
            subject = "Welcome to the Elite Club of Agrarian!"
            image_url = "https://agritech.tnau.ac.in/agriculture/agri_nutrientmgt_priceoffertilizers.html"  # Replace with the actual image URL
            news_url = "https://timesofindia.indiatimes.com/topic/agriculture"  # Replace with the actual video URL
            send_dynamic_email(new_user.email, subject, new_user.username, image_url, news_url,'email_template2.html')
        else:
            subject = "Welcome to the World's First Ever Revolutionary Digital Agrarian Marketplace!"
            image_url = "https://rates.goldenchennai.com/vegetable-price/chennai-vegetable-price-today"  # Replace with the actual image URL
            news_url = "http://127.0.0.1:8080/agroproducts"  # Replace with the actual video URL
            send_dynamic_email(new_user.email, subject, new_user.username, image_url, news_url,'email_template3.html')

        return render_template('login.html')

    return render_template('signup.html')

@app.route('/login',methods=['POST','GET'])
def login():
    if request.method == "POST":
        email=request.form.get('email')
        password=request.form.get('password')
        user=MyUser.query.filter_by(email=email).first()

        if user and check_password_hash(user.password,password):
            login_user(user)
            flash("Login Success","primary")
            # Set the session variable to indicate the user is logged in
            session['logged_in'] = True
            # Sending a login acknowledgment email for agrarians
            if user.is_agrarian:
                subject = "Welcome Back, Agrarian!"
                image_url = "https://drive.google.com/file/d/1FdDaL6D4mVy_jZbJ4YwzeM-OY7oBwzWD/view?usp=drive_link"  # Replace with the actual image URL
                news_url = "https://timesofindia.indiatimes.com/topic/agriculture"  # Replace with the actual video URL
                send_dynamic_email(user.email, subject, user.username, image_url, news_url,'email_template.html')
                #embedded_send_dynamic_email(recipient_email, subject, username, image_path, video_url, html_template, mail)
                #embedded_send_dynamic_email('recipient@example.com', 'Welcome Back!', 'John', '/path/to/image.jpg', 'https://example.com/video', 'email_template.html')

            else:
                subject = "Welcome Back to AgroNexumLive!"
                image_url = "https://drive.google.com/file/d/1xDcrhp1Dfdfn-z1Rj-jhMT4gOFMAeQy8/view?usp=drive_link"  # Replace with the actual image URL
                news_url = "https://www.oneindia.com/vegetables-price.html"  # Replace with the actual video URL
                send_dynamic_email(user.email, subject, user.username, image_url, news_url,'email_template4.html')
            return redirect(url_for('index'))
        
        elif user:
            flash("Please Enter The valid Password !","warning")
            return render_template('login.html') 
        else:
            flash("Please Sign Up to continue !","warning")
            return render_template('signup.html')


    return render_template('login.html')

@app.route('/logout')
@login_required
def logout():
    logout_user()
    flash("Logout Successful","warning")
    # Clear the 'logged_in' session variable
    session.pop('logged_in', None)
    return redirect(url_for('login'))



@app.route('/register',methods=['POST','GET'])
@login_required
def register():
    if current_user.is_agrarian or current_user.is_admin:
        farming=Farming.query.all()
        if request.method=="POST":
            farmername=request.form.get('farmername')
            adharnumber=request.form.get('adharnumber')
            age=request.form.get('age')
            gender=request.form.get('gender')
            phonenumber=request.form.get('phonenumber')
            address=request.form.get('address')
            farmingtype=request.form.get('farmingtype')     
            query=Register(farmername=farmername,adharnumber=adharnumber,age=age,gender=gender,phonenumber=phonenumber,address=address,farming=farmingtype)
            db.session.add(query)
            db.session.commit()
            # query=db.engine.execute(f"INSERT INTO `register` (`farmername`,`adharnumber`,`age`,`gender`,`phonenumber`,`address`,`farming`) VALUES ('{farmername}','{adharnumber}','{age}','{gender}','{phonenumber}','{address}','{farmingtype}')")
            # flash("Your Record Has Been Saved","success")
            return redirect('/farmerdetails')
        return render_template('farmer.html',farming=farming)
    else:
       session['redirect_message'] = "You are not an Agrarian !"
       return redirect(url_for('index'))  # Redirect to the homepage or another suitable route
    
@app.route('/test')
def test():
    try:
        Test.query.all()
        return 'My database is Connected'
    except:
        return 'My db is not Connected'


app.run(host='0.0.0.0', port=8080, debug=True)
 
