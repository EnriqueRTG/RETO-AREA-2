from tabulate import tabulate
import pymongo


MONGO_HOST = "cluster0-shard-00-00.1omi2ou.mongodb.net"
MONGO_PORT = 27017
MONGO_BASEDATOS = "delincuencia"
MONGO_COLECCION = "criminales"
MONGO_USER = "oajv"
MONGO_PASSWORD = "oajv"
MONGO_TIME_OUT = 1000


MONGO_URL = f"mongodb+srv://{MONGO_USER}:{MONGO_PASSWORD}@{MONGO_HOST}/{MONGO_BASEDATOS}"


try:
    cliente = pymongo.MongoClient(MONGO_URL, serverSelectionTimeoutMS=MONGO_TIME_OUT)
    baseDatos = cliente[MONGO_BASEDATOS]
    coleccion = baseDatos[MONGO_COLECCION]
    tipos_de_delitos = coleccion.distinct("delitos")


    print("Tipos de delitos disponibles:")
    for i, tipo in enumerate(tipos_de_delitos):
        print(f"{i + 1}. {tipo}")


    opcion = int(input("\nSeleccione el número correspondiente al tipo de delito: "))
    tipo_seleccionado = tipos_de_delitos[opcion - 1]


    criminales = list(coleccion.find({"delitos": tipo_seleccionado}))


    if criminales:
        print(f"\nCriminales acusados de {tipo_seleccionado}:")
        print(tabulate(criminales, headers="keys", tablefmt="grid"))
    else:
        print(f"No se encontraron criminales acusados de {tipo_seleccionado}.")


    cliente.close()


except pymongo.errors.ServerSelectionTimeoutError as errorTiempo:
    print("Tiempo excedido de carga:", errorTiempo)


except pymongo.errors.ConnectionFailure as errorConexion:
    print("Fallo al conectarse a MongoDB:", errorConexion)
