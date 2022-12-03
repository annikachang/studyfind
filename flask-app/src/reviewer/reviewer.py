from flask import Blueprint
from flask import Flask, jsonify
from flaskext.mysql import MySQL
from src import db

reviewer_blueprint = Blueprint('reviewer_blueprint', __name__)

@reviewer_blueprint.route('/form')
def get_all_customers():
    return f'<h1>Review Form</h1>'
