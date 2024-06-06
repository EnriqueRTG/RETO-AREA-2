import pymongo
from datetime import datetime, timezone


MONGO_TIME_OUT = 1000


MONGO_URL="mongodb+srv://oajv:oajv@cluster0.1omi2ou.mongodb.net/"


cliente=pymongo.MongoClient(MONGO_URL,serverSelectionTimeoutMS=MONGO_TIME_OUT)


db = cliente["delincuencia"]


# Crear una colección
coleccion= db["criminales"]


# Insertar un documento
documento = {
    '_id': 1,
   'nombre': 'AARON',
   'apellidos': 'WILLIAMS-BANKS',
   'cuadra': '072XX S SOUTH SHORE DR',
   'delitos': ['agresión sexual', 'robo con violencia'],
   'estatura': 185,
   'peso': 80,
   'f_nacimiento': datetime(1976, 3, 1, 8, 0, 0, tzinfo=timezone.utc)
   }


coleccion.insert_one(documento)


print("Base de datos y colección creadas con éxito")
