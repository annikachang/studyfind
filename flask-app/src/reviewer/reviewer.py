from flask import Blueprint, request, jsonify, make_response, current_app
from flaskext.mysql import MySQL
from src import db

reviewer_blueprint = Blueprint('reviewer_blueprint', __name__)


@reviewer_blueprint.route('/add_new_space', methods=['POST'])
def add_Space():
    current_app.logger.info(request.form)
    cur = db.get_db().cursor()
    name = request.form['name']
    imageURL = request.form['imageURL']
    capacityReq = request.form['capacity']
    capacity = int(capacityReq.strip() or 0)
    location = request.form['location']
    query = f'INSERT INTO Study_Space(name, imageURL, capacity, location) VALUES (\"{name}\", \"{imageURL}\", \"{capacity}\", \"{location}\")'
    cur.execute(query)
    db.get_db().commit()
    return "Success!"
