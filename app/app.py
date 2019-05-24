from flask import Flask
import os

app = Flask(__name__)

name = os.environ["NAME"]
what_do_you_want = os.environ["WHAT_DO_YOU_WANT"]

@app.route("/")
def hello():
    return "I am the walrus, my name is %s, and I want %s" %(name, what_do_you_want)

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0',port=5000)