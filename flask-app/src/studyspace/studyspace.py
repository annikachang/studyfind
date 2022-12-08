from flask import Blueprint, make_response
from flask import Flask, jsonify
from flaskext.mysql import MySQL
from src import db

studyspace_blueprint = Blueprint('studyspace_blueprint', __name__)

@studyspace_blueprint.route("/", methods=['GET'])
def get_studyspaces():
    cur = db.get_db().cursor()
    cur.execute('select * from Study_Space')
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
       json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)


@studyspace_blueprint.route("/<spaceID>", methods=['GET'])
def get_studyspace(spaceID):
    cur = db.get_db().cursor()
    cur.execute('select * from Study_Space where spaceID = {0}'.format(spaceID))
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
       json_data.append(dict(zip(row_headers, row)))
    return jsonify(json_data)



@studyspace_blueprint.route("/<spaceID>/reviews", methods=['GET'])
def get_review(spaceID):
    cur = db.get_db().cursor()
    cur.execute('select * from Review where spaceID = {0}'.format(spaceID))
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@studyspace_blueprint.route("/<spaceID>/accessibility", methods=['GET'])
def get_accessibility(spaceID):
    cur = db.get_db().cursor()
    cur.execute('select breastfeeding, noFlashingLights, wheelchair from Accessibility where spaceID = {0}'.format(spaceID))
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@studyspace_blueprint.route("/<spaceID>/media_types", methods=['GET'])
def get_media_types(spaceID):
    cur = db.get_db().cursor()
    cur.execute('select * from Media_Types where spaceID = {0}'.format(spaceID))
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@studyspace_blueprint.route("/<spaceID>/items", methods=['GET'])
def get_items(spaceID):
    cur = db.get_db().cursor()
    cur.execute('select * from Item where typeID = {0}'.format(spaceID))
    row_headers = [x[0] for x in cur.description]
    json_data = []
    theData = cur.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

