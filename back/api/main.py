from flask import Flask, jsonify, request
from flask_cors import CORS
from alchemy.tables.main import SessionLocal
from alchemy.tables.TablesDeclare import Advertisement, Company, Users, Interactions
import hashlib
import  flask_jwt_extended

session = SessionLocal

app = Flask("myapp")
CORS(app)
app.config['SECRET_KEY'] = 'cc53f4fda6d74e53b39f35ffb4895a69'
jwt = flask_jwt_extended.JWTManager(app)

# route principale de l'api permet de vérifier que le serveur est en ligne affiche simplement Hello World!
@app.route("/")
@flask_jwt_extended.jwt_required()
def hello():
    return "Hello, World!"

# Route qui retourne toutes les annonces de la base de données


@app.get('/API/GET/Advert')
def getAds():
    result = session().query(Advertisement).all()
    data = []
    for res in result:
        data.insert(0, res.as_dict())  # convertit le résultat en format Json
    return {"success": "true",
            "data": data}

# Route qui retourne true ou false en fonction du mot de passe rentré pour l'adresse mail correspondante


@app.route('/API/POST/LOGIN', methods=['POST'])
def login():
    msgmail = False
    msgpswd = False
    mail = request.form["mail"]
    password = request.form["password"]
    id = -1
    # on récupère tous les users pour voir si l'adresse mail correspond à un compte enregistré
    list = session().query(Users).all()
    for res in list:
        if (res.mail == mail):
            msgmail = True
            # on regarde si le hash du mdp rentré correspond à celui de la bdd
            if (res.mdp == hashlib.md5(password.encode()).hexdigest()):
                msgpswd = True
                id = res.iduser
    access_token = flask_jwt_extended.create_access_token(identity=mail)

    return {
        "success": "success  ",
        "mail": msgmail,
        "password": msgpswd,
        "id": id,
        "token": access_token
    }
# Route qui permet d'ajouter un utilisateur à la base à partir des données du formulaire d'inscription


@app.route('/API/POST/REGISTER', methods=['POST'])
def register():
    mail = request.form["mail"]
    idcompanytmp = request.form["idcompany"]
    temp = True
    msg = "register done"
    sessionl = session()
    list = sessionl.query(Users).all()
    for data in list:
        if (data.mail == mail):  # on vérifie que l'adresse mail n'est pas déja inscrite
            msg = "already register"
            temp = False
    if (temp):
        # on hash le mdp pour la sécurité
        mdpu = hashlib.md5(request.form["password"].encode()).hexdigest()
        insert = Users()
        insert.userName = request.form["name"],
        insert.userFirstName = request.form["firstName"],
        insert.mail = mail,
        insert.phone = request.form["phone"],
        insert.mdp = mdpu
        if (idcompanytmp != "-1"):
            insert.company = idcompanytmp
        sessionl.add(insert)
        sessionl.commit()  # applique les changements à notre base
    return {
        "success": "success",
        "result": msg
    }
# Route qui ajoute une Annonce à la base à partir des infos du formulaire d'ajout


@app.route('/API/POST/CREATED', methods=['POST'])
@flask_jwt_extended.jwt_required()
def create_advert():
    
    sessionl = session()
    insert = Advertisement()
    id = request.form["idUser"]
    confirm = True
    user = sessionl.query(Users).filter_by(
        iduser=id).first()  # Select the good user
    if user.company is None:  # Verify if user have a company
        confirm = False
    else:
        insert.advertisementName = request.form["advertisementName"]
        insert.advertisementCategory = request.form["advertisementCategory"]
        insert.advertisementDescription = request.form["advertisementDescription"]
        insert.publishedDate = request.form["publishedDate"]
        insert.salary = request.form["salary"]
        insert.contractType = request.form["contractType"]
        insert.advertisementlocation = request.form["advertisementlocation"]
        insert.idcompany = user.company
        sessionl.add(insert)
        sessionl.commit()

    return {"result": confirm}

# Route qui supprime une annonce


@app.route('/API/GET/DELETEADVERT', methods=['GET'])
@flask_jwt_extended.jwt_required()
def delete_advert():
    sessionl = session()
    idAdv = None
    if idAdv is None:
        # args.get permet de réccupérer la/les données envoyé par le client dans l'url via la méthode GET
        idAdv = request.args.get("idAdv")
    # Selectionne l'annonce et la siupprime
    sessionl.query(Advertisement).filter_by(id=idAdv).delete()
    sessionl.commit()  # valide les modifications dans la BDD

    return {"result": True}

# Route pour supprimer un user


@app.route('/API/POST/DELETEUSER', methods=['POST'])
@flask_jwt_extended.jwt_required()
def delete_user():
    sessionl = session()
    idUser = request.form["idUser"]
    sessionl.query(Users).filter_by(iduser=idUser).delete()
    sessionl.commit()

    return {"result": True}

# Route pour récupérer les infos des users


@app.route('/API/GET/GETINFOUSER', methods=['GET'])
@flask_jwt_extended.jwt_required()
def get_info_user():
    sessionl = session()
    idtmp = request.args.get("idUser")
    user = sessionl.query(Users).filter_by(iduser=idtmp).first()

    return user.as_dict()
# Route pour récup tous les users


@app.route('/API/GET/GETUSERS', methods=['GET'])
@flask_jwt_extended.jwt_required()
def get_users():
    sessionl = session()
    users = sessionl.query(Users)
    result = []
    for user in users:
        result.append(user.as_dict())
    return result

# Route modifier Users


@app.route('/API/POST/MODIFYUSER', methods=['POST'])
@flask_jwt_extended.jwt_required()
def update_user():
    sessionl = session()
    idtmp = request.form["idUser"]
    user = sessionl.query(Users).filter_by(iduser=idtmp).first()
    user.userName = request.form["userName"]
    user.userFirstName = request.form["userFirstName"]
    user.mail = request.form["mail"]
    user.phone = request.form["phone"]
    sessionl.commit()

    return {"result": "success"}

# Route modifier Advertisements


@app.route('/API/POST/MODIFYADVERTISEMENT', methods=['POST'])
@flask_jwt_extended.jwt_required()
def update_advertisement():
    sessionl = session()
    idAdv = request.form["id"]
    advert = sessionl.query(Advertisement).filter_by(id=idAdv).first()
    advert.advertisementCategory = request.form["advertisementCategory"]
    advert.advertisementName = request.form["advertisementName"]
    advert.advertisementDescription = request.form["advertisementDescription"]
    advert.salary = request.form["salary"]
    advert.contractType = request.form["contractType"]
    advert.advertisementlocation = request.form["advertisementlocation"]
    sessionl.commit()

    return {"result": "success"}

# Route interactions Postuler


@app.route('/API/POST/CREATEDINTERACTION', methods=['POST'])
@flask_jwt_extended.jwt_required()
def create_interaction():
    sessionl = session()
    insert = Interactions()
    msgPost = request.form["msgPostuler"]
    advert = request.form["advertisement"]
    userID = request.form["userid"]
    confirm = True
    msgResult = "Merci de votre confiance ! Votre candidature va être traitée."
    if (userID != "-1"):
        list = sessionl.query(Interactions).all()
        for res in list:
            if (int(advert) == int(res.advertisement) and int(userID) == int(res.userid)):
                confirm = False
                msgResult = "Vous avez déja postulez à cette offre."

        if (confirm):
            insert.msgPostuler = msgPost
            insert.advertisement = advert
            insert.userid = userID
            sessionl.add(insert)
            sessionl.commit()
    else:
        msgResult = "Vous n'êtes pas connecté, vous ne pouvez postuler à cette offre"

    return {
        "result": "success",
        "msg": msgResult
    }

# Route liste des companies


@app.route("/API/GET/INFOCOMPANYS", methods=["GET"])
@flask_jwt_extended.jwt_required()
def get_company():
    sessionl = session()
    list = sessionl.query(Company).all()
    listofCompany = []
    for res in list:
        listofCompany.append(res.as_dict())

    return listofCompany

# Route créer une company


@app.route("/API/POST/CREATECOMPANY", methods=["POST"])
@flask_jwt_extended.jwt_required()
def create_company():
    sessionl = session()
    insert = Company()
    name = request.form['companyName']
    mail = request.form['mail']
    tmp = True
    msg = "Votre entreprise a bien été créer !"

    list = sessionl.query(Company).all()
    for res in list:
        if (res.companyName == name and res.mail == mail):
            tmp = False
            msg = "Cette entreprise existe déja."

    if (tmp):
        insert.companyName = name
        insert.mail = mail
        sessionl.add(insert)
        sessionl.commit()

    return {
        "result": "success",
        "msg": msg
    }

# Route delete company


@app.route('/API/POST/DELETECOMPANY', methods=['POST'])
@flask_jwt_extended.jwt_required()
def delete_company():
    sessionl = session()
    idCompany = request.form['idcompany']
    sessionl.query(Company).filter_by(idcompany=idCompany).delete()
    sessionl.commit()

    return {"result": "success"}

# Route modify company


@app.route("/API/POST/MODIFYCOMPANY", methods=["POST"])
@flask_jwt_extended.jwt_required()
def modify_company():
    sessionl = session()
    idCompany = request.form['idcompany']
    company = sessionl.query(Company).filter_by(idcompany=idCompany).first()
    company.companyName = request.form['companyName']
    company.mail = request.form['mail']
    sessionl.commit()

    return {"result": "success"}


# Get Info Interaction
@app.route('/API/GET/INFOINTERACTION', methods=['GET'])
@flask_jwt_extended.jwt_required()
def get_info_interaction():
    sessionl = session()
    idUser = request.args.get('userid')
    list = sessionl.query(Interactions).filter_by(userid=idUser)
    listResult = []

    for res in list:
        listResult.append(res.as_dict())

    return listResult


# JWT Authentication
