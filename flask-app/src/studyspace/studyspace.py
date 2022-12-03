from flask import Blueprint
from flask import Flask, jsonify
from flaskext.mysql import MySQL
from src import db

studyspace_blueprint = Blueprint('studyspace_blueprint', __name__)

@studyspace_blueprint.route("/reviews")
def get_reviews():
    cur = db.get_db().cursor()
    cur.execute('select * from Review')
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
       json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)
