from bottle import Bottle, install, run, template, get, post, request, static_file, error, redirect, view
from bottle_sqlite import SQLitePlugin
import logging
import json

logger = logging.getLogger("readings")

app = Bottle()

app.install(SQLitePlugin(dbfile="/home/hany/readings.db"))

@app.error(404)
@view("error404")
def error404(error):
    '''
    The generic error page found in the template error404.tpl under
    views is returned if a 404 - nor found error is generated
    '''
    return

@app.route('/about')
@view("about")
def about():
    return

@app.route("/json")
def jsonview(db):
    c = db.execute("SELECT rowid, systolic, diastolic, heartrate, date, notes FROM Readings")
    r = [dict((c.description[i][0], value) \
               for i, value in enumerate(row)) for row in c.fetchall()]
    return json.dumps(r)

@app.route("/delete/<id:int>")
def delete(id, db):
    db.execute("DELETE FROM Readings WHERE rowid = ?", (id,))
    redirect("/readings")

@app.route("/edit/<id:int>")
@view("edit")
def edit(id, db):
    c = db.execute("SELECT rowid, systolic, diastolic, heartrate, date, notes  FROM Readings WHERE rowid = ?", (id,))
    row = c.fetchone()
    return dict(row=row)

@app.route("/update", method="POST")
def update(db):
    logger.info("update invoked")
    id = request.forms.get("rowid")
    systolic = request.forms.get("systolic")
    diastolic = request.forms.get("diastolic")
    heartrate = request.forms.get("heartrate")
    date = request.forms.get("datetime")
    notes = request.forms.get("notes")

    db.execute("UPDATE Readings set systolic = ?, diastolic = ?, heartrate = ?, date = ?, notes = ? WHERE rowid = ?", (systolic,diastolic,heartrate,date,notes,id,))
    redirect("/readings");

@app.route('/')
@app.route("/readings", method="GET")
@view("readings")
def readings(db):
    c = db.execute("SELECT rowid, systolic, diastolic, heartrate, date, notes FROM Readings")
    #res = '<table><tr><td>Systolic</td><td>Diastolic</td><td>Heart Rate Date/Time</td></tr>'
    #for row in c:
    #    res += '<tr><td>' + str(row['systolic']) + '</td><td>' + str(row['diastolic']) + '</td><td>' + str(row['heartrate']) + '</td><td>' + str(row['date']) + '</td></tr>'
    #res += '</table>'

    #res += "<br /><br /><a href=/add>Add Reading</a>"
    #return res
    return dict(c=c)

@app.route("/add", method="GET")
@view("add")
def add():
    #return '''
    #    <form action="/add" method="post">
    #        Systolic: <input name="systolic" type="text" /><br /><br />
    #        Diastolic: <input name="diastolic" type="text" /><br /><br />
    #        Heart Rate: <input name="heartrate" type="text" /><br /><br />
    #        Date/Time: <input name="datetime" type="text" /><br /><br />
    #        <input value="Add" type="submit" />
    #    </form>
    #'''
    return

@app.route("/add", method="POST")
def do_add(db):
    systolic = request.forms.get("systolic")
    diastolic = request.forms.get("diastolic")
    heartrate = request.forms.get("heartrate")
    date = request.forms.get("datetime")
    notes = request.forms.get("notes")
    db.execute("INSERT INTO Readings (systolic, diastolic, heartrate, date, notes) VALUES (?,?,?,?,?)", (systolic,diastolic,heartrate,date,notes))
    redirect("/readings")



#@app.route("/login", method="GET")
#def login():
#    return '''
#        <form action="/login" method="post">
#            Username: <input name="username" type="text" />
#            Password: <input name="password" type="password" />
#            <input value="Login" type="submit" />
#        </form>
#    '''

#def do_login():
#    username = request.forms.get("username")
#    password = request.forms.get("password")
#    if username == "hany" and password == "zany":
#        return "<p>credentials ok</p>"
#    else:
#        return "<p>invalid credentials</p>"

@app.route("/edit/static/<filename:path>")
@app.route("/static/<filename:path>")
def serve_static(filename):
    return static_file(filename, root="/home/hany/views/")


#@app.route('/')
#@app.route('/hello/<name>')
#def hello(name="Hany"):
#    return template("Hello {{name}}!", name=name)

run(app, host='192.168.0.16', port=8080, debug=True)
