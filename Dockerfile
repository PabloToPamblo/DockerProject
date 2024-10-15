# Usamos una imagen base de Python
FROM python:3.9-slim

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos el archivo de requerimientos y lo instalamos
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copiamos el código de la aplicación al contenedor
COPY . /app/

# Exponemos el puerto 8000 para el servidor de Django
EXPOSE 8000

# Comando para ejecutar las migraciones y levantar el servidor de desarrollo
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
