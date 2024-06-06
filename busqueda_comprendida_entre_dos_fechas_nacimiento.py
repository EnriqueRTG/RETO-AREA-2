import pymongo
from dateutil import parser # Para darle un tratamiento mas flexible a las fechas -> pip install python-dateutil
from tabulate import tabulate
from datetime import datetime

#Información necesaria para conectarnos a MongoDB
MONGO_HOST="localhost"
MONGO_PORT="27017"
MONGO_TIME_OUT=1000 #Por defecto necesita un time out para realizar la conexión
#Formamos la URL de conexión manualmente
##MONGO_URL="mongodb://"+MONGO_HOST+":"+MONGO_PORT+"/"
MONGO_URL="mongodb+srv://oajv:oajv@cluster0.1omi2ou.mongodb.net/"
MONGO_BASEDATOS="delincuencia"
MONGO_COLECCION="criminales"    

# Búsqueda comprendida entre dos fechas de nacimiento.
def busqueda_entre_fechas_nacimiento():

    # Configuración de la conexión a MongoDB
    cliente=pymongo.MongoClient(MONGO_URL,serverSelectionTimeoutMS=MONGO_TIME_OUT)
    db = cliente[MONGO_BASEDATOS]
    coleccion = db[MONGO_COLECCION]

    while True:
        try:
            fecha_inicio_str = input("Ingrese una fecha (formato YYYY-MM-DD): ")
            fecha_fin_str = input("Ingrese otra fecha (formato YYYY-MM-DD): ")
            fecha_1 = parser.parse(fecha_inicio_str)
            fecha_2 = parser.parse(fecha_fin_str)

            # Ordenar las fechas automáticamente
            fecha_inicio = min(fecha_1, fecha_2)
            fecha_fin = max(fecha_1, fecha_2)

            break  # Salir del bucle si las fechas son válidas
        except ValueError:
            print("Formato de fecha incorrecto. Use YYYY-MM-DD.")

    # Consulta con filtro de fechas (igual que antes)
    query = {
        "f_nacimiento": {
            "$gte": fecha_inicio,
            "$lte": fecha_fin
        }
    }

    # Ejecutar la consulta y obtener los resultados
    resultados = list(coleccion.find(query))

    cliente.close()  # Cerrar la conexión al finalizar

    if resultados:
        print("\nResultados de la consulta:")
        print(tabulate(resultados, headers="keys", tablefmt="grid"))
    else:
        print("\nNo se encontraron resultados para el rango de fechas especificado.")

# Llamar a la función para ejecutarla
busqueda_entre_fechas_nacimiento()