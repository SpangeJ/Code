from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    print("Initializing Flask webpage at port 9000")
    return app.send_static_file("index.html")