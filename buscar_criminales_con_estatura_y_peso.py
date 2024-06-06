import pymongo
from tabulate import tabulate
#Información necesaria para conectarnos a MongoDB
MONGO_HOST="localhost"
MONGO_PORT="27017"
MONGO_TIME_OUT=1000 #Por defecto necesita un time out para realizar la conexión
#Formamos la URL de conexión manualmente
##MONGO_URL="mongodb://"+MONGO_HOST+":"+MONGO_PORT+"/"
MONGO_URL="mongodb+srv://oajv:oajv@cluster0.1omi2ou.mongodb.net/"
MONGO_BASEDATOS="delincuencia"
MONGO_COLECCION="criminales"
def criminales_estatura_peso():
    try:
    #Variable cliente que se va a conectar al cliente de Mongo    cliente=pymongo.MongoClient(MONGO_URL,serverSelectionTimeoutMS=MONGO_TIME_OUT)
    #Pedimos la información de conexión
        cliente.server_info()
    #Mostramos mensaje de conexión correcta
        print("Conexion con mongo exitosa")
        baseDatos=cliente[MONGO_BASEDATOS]
        coleccion=baseDatos[MONGO_COLECCION]
        peso =int(input(f'Busca los criminales con peso mayor a: '))
        estatura =int(input(f'Busca los criminales con estatura menor a: '))
        # Consulta con filtro de estatura y peso
        ##db.criminales.find({$and:[{"peso":{$gt:75}},{"estatura":{$lt:180}}]})
        query = {"$and":[{"peso":{"$gt":peso}},{"estatura":{"$lt":estatura}}]}
        resultados = list(coleccion.find(query))   
    #Cerramos conexión
        cliente.close()
        if resultados:
            print("\nResultados de la consulta:")
            print(tabulate(resultados, headers="keys", tablefmt="grid"))
        else:
            print("\nNo se encontraron resultados para el rango de fechas especificado.")
    except pymongo.errors.ServerSelectionTimeoutError as errorTiempo:
    #Mostramos mensaje en tal caso
        print("Tiempo excedido de carga")
    #También recogemos el posible error de conexión
    except pymongo.errors.ConnectionFailure as errorConexion:
    #Mostramos un mensaje en tal caso
        print("Fallo al conectarse a mongodb"+errorConexion)
criminales_estatura_peso()
