from flask import Blueprint, request, jsonify, make_response, current_app
from flaskext.mysql import MySQL
from src import db

reviewer_blueprint = Blueprint('reviewer_blueprint', __name__)


# CREATE TABLE Review (
#     reviewID INTEGER NOT NULL,
#     starsNum INTEGER CHECK (starsNum >= 1 and starsNum <= 5),
#     comment TEXT,
#     ambienceNum INTEGER CHECK (ambienceNum >= 1 and ambienceNum <= 10),
#     cleanlinessNum INTEGER CHECK (cleanlinessNum >= 1 and cleanlinessNum <= 10),
#     quietnessNum INTEGER CHECK (quietnessNum >= 1 and quietnessNum <= 10),
#     demographic TEXT,
#     spaceID INTEGER NOT NULL,
#     PRIMARY KEY (reviewID),
#     CONSTRAINT fk_12 FOREIGN KEY (spaceID) REFERENCES Study_Space(spaceID)
# );

##insert into Review (starsNum, comment, ambienceNum, cleanlinessNum, quietnessNum, demographic, spaceID)
## values (4, "Open 24/7", 3, 5, 5, null, 3);

@reviewer_blueprint.route('/<spaceID>/addReview', methods=['POST'])
def add_Review(spaceID):
    current_app.logger.info(request.form)
    cur = db.get_db().cursor
    name = request.form['name']
    address = request.form['address']
    starsNum = request.form['starsNum']
    comment = request.form['comment']
    ambienceNum = request.form['ambienceNum']
    cleanlinessNum = request.form['cleanlinessNum']
    quietnessNum = request.form['quietnessNum']
    demographic = request.form[demographic]
    
    query = f'INSERT INTO Review(starsNum, comment, ambienceNum, cleanlinessNum, quietnessNum, demographic, spaceID) VALUES (\"{starsNum}\", \"{comment}\", \"{ambienceNum}\", \"{cleanlinessNum}\", \"{quietnessNum}\", \"{demographic}\")'

    cur.execute (query)
    db.get_db().commit()


