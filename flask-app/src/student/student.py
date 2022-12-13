from flask import Blueprint, request, jsonify, make_response, current_app
from src import db

student_blueprint = Blueprint('student_blueprint', __name__)

@student_blueprint.route("/all_spaces", methods=['GET'])
def get_studyspaces():
    cur = db.get_db().cursor()
    cur.execute('select * from Study_Space')
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
       json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)


@student_blueprint.route('/add_review', methods=['POST'])
def add_Review():
    current_app.logger.info(request.form)
    cur = db.get_db().cursor()
    comment = request.form['comment']
    starsNum = request.form['starsNum']
    ambienceNumReq = request.form['ambienceNum']
    cleanlinessNumReq = request.form['cleanlinessNum']
    quietnessNumReq = request.form['quietnessNum']
    ambienceNum = int(ambienceNumReq.strip(), 0)
    cleanlinessNum = int(cleanlinessNumReq.strip() or 0)
    quietnessNum = int(quietnessNumReq.strip() or 0)
    spaceID = request.form['spaceID']
    query = f'INSERT INTO Review(comment, starsNum, ambienceNum, cleanlinessNum, quietnessNum, spaceID) VALUES (\"{comment}\", \"{starsNum}\", \"{ambienceNum}\", \"{cleanlinessNum}\", \"{quietnessNum}\", \"{spaceID}\")'
    cur.execute(query)
    db.get_db().commit()
    return "Success!"