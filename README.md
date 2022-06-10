# Parte Práctica del Examen 3er Trimestre

![Image text](https://github.com/ENGB02/Despliegue-de-Proyecto-Final-1-DAM-Sistemas-Informaticos-Jordi-Arroyo/blob/main/img/docker-compose-1.png)



_1º DAM_

_Alumnos implicados :Jordi Arroyo Pons_ 

_Fecha : 10/06/2022_

## link a la imagen de DockerHub : me ha faltado este paso :/


## Indice 

### 1- Introducción.📋
### 2- Configuración del archivo docker-compose.yml.📋
### 3- Pasos para el despliegue de la aplicación. 📋
### 4- Preparación y subida de la imagen a docker hub. 📋
### 5- Conclusiones 📋
### 6- Annexos (si lo consideráis necesario) 📋

## 1- Introducción.

_A continuación explicaremos una breve introducción a como configurar el archivo docker-compose.yml dentro de la imagen de Docker , instalando previamente Docker Compose en Docker , como desplegar nuestro Proyecto final realizado en Github como repositorio , explicando paso a paso su despliegue 

Para comenzar debemos instalar Docker

luego deberemos ver si el compose ya está instalado en la imagen o debemos instalarlo , si al ejecutar el comando : 
-‘docker-compose up’ este se levanta es porque están correctamente instalado,
si no deberemos instalarlo con el comando desde la ubicación : usr/local/bin :
- sudo php composer-setup. php --install-dir= /usr/local/bin --filename= composer
Después de editar el YML debemos realizar un restart , para que los procesos no se queden “congelados” 
Después de esto Runeamos

Deberemos editar este archivo como esta en el capítulo 2 , es decir , su configuración se debe basar en los 3 servidores _

![Image text](https://github.com/ENGB02/Despliegue-de-Proyecto-Final-1-DAM-Sistemas-Informaticos-Jordi-Arroyo/blob/main/img/estructura%20del%20trabajo%20en%20si.PNG) 

Al runear se nos creará la siguiente estructura :

![Image text](https://github.com/ENGB02/Despliegue-de-Proyecto-Final-1-DAM-Sistemas-Informaticos-Jordi-Arroyo/blob/main/img/estructura%20al%20runear%20el%20yaml.PNG) 

Estructura al runear el .yml con el .war , estará compuesto por por la estructura de estos y el repositorio (trabajo introducido en el .war)
Iniciamos el Run de todos estos contenedores y accedemos a sus respectivos host , es decir hacer un conjunto de contenedores para realizar este Login compuesto de PHP , TOMCAT y MYSQL así haciendo su correcto funcionamiento.

## 2- Configuración del archivo docker-compose.yml.

Nuestro archivo de configuración de docker-compose.yml. 
la configuración que se le ha dado es la siguiente :

version: '3.3'
services:
   db:
     image: mysql:5.7
     volumes:
       - db_vol:/var/lib/mysql
       - ./mysql-dump:/docker-entrypoint-initdb.d
     environment:
       MYSQL_ROOT_PASSWORD: root
       MYSQL_DATABASE: testdb1
       MYSQL_USER: testuser
       MYSQL_PASSWORD: root
     ports:
       - 3306:3306
   phpmyadmin:
    depends_on:
      - db
    image: phpmyadmin/phpmyadmin
    ports:
      - '8081:80'
    environment:
      PMA_HOST: db
      MYSQL_ROOT_PASSWORD: root
   web:
    build:
      context: .      
    depends_on:
      - db
    image: tomcat
    volumes:
            - ./target/LoginWebApp.war:/usr/local/tomcat/webapps/LoginWebApp.war
    ports:
      - '8082:8080'
    environment:
      MYSQL_ROOT_PASSWORD: root
      MYSQL_DATABASE: testdb1
      MYSQL_USER: testuser
      MYSQL_PASSWORD: root
volumes:
    db_vol:  


Está basado en 3 imagenes , una basada en mysql (DB) , otra en phpmyadmin (web)  y la última en TOMCAT (Servlets)

Cada una tiene su user y pass y su dirección en los puertos , también están definidos los volúmenes donde se situarán , su versión del programa en sí: 

volúmenes:

MYSQL

- db_vol:/var/lib/mysql
- ./mysql-dump:/docker-entrypoint-initdb.d

Este último nos dirige a nuestro .war que está basado en la página de login de nuestro repositorio: 

WAR

-./target/LoginWebApp.war:/usr/local/tomcat/webapps/LoginWebApp.war


## 3- Pasos para el despliegue de la aplicación.


Para comenzar debemos realizar nuestro .war para subir al compose , es decir , con Visual Studio o Netbeans procesar todo el proyecto para obtener este .war

Luego Configurar el .yml , guardarlo , hacer un restart y runearlo junto al .war , así obtendremos la estructura de todo el bloque 

![Image text](https://github.com/ENGB02/Despliegue-de-Proyecto-Final-1-DAM-Sistemas-Informaticos-Jordi-Arroyo/blob/main/img/estructura%20al%20runear%20el%20yaml.PNG)

## 4- Preparación y subida de la imagen a docker hub.

[Todo esto ejecutado desde cmd]

Para publicar nuestra imagen en Docker Hub necesitamos loguearnos claramente en la cuenta de docker , ejecutando el comando:

'docker login'

Después tendremos que decidir el nombre del tag qué le vamos a poner , ejecutamos un comando que se formará por el nombre de usuario , nombre del repositorio y la etiqueta tal que así : 

‘docker tag nombre de la imagen , usuario / tag de la imagen ‘ 

ejemplo:'docker tag nodejs-webapp 0gis0/nodejs-webapp:v1'

Al tagear esta tendremos que realizar un push para subir nuestra imagen , con el siguiente comando 

' docker push nombre de usuario/nombre del la imagen y su versión' 

ejemplo : 'docker push 0gis0/nodejs-webapp:v1'

al finalizar este proceso podremos entrar en nuestro usuario de Docker hub y podremos ver en el interfaz gráfico la subida del repositorio hecha imagen! 


## 5- Conclusiones

Docker en sí es una buena herramienta para crear procesos a corto plazo , es decir , que tanto el composed , como Nginx o diversos casos de uso de este nos facilita en general la vida , hemos de decir que es una buen herramienta útil que nos servirá para el futuro 

En general el proceso de configuración del .yml y exportar el .war es muy sencillo y práctico , nos servirá para un futuro no muy lejano , ¡gracias!

## 6- Annexos (si lo consideráis necesario)

# Repositorio de nuestro trabajo en Github :  

![Image text](https://github.com/ENGB02/Despliegue-de-Proyecto-Final-1-DAM-Sistemas-Informaticos-Jordi-Arroyo/blob/main/img/github.PNG)

https://github.com/ZhijunLin7/ProyectoDam



## Autores ✒️

* **Zhijun Lin** y **Jordi Arroyo** - *Proyecto Final* 
* **Jordi Arroyo** - *Este repositorio* 

También puedes mirar la lista de todos los [contribuyentes](https://github.com/your/project/contributors) quíenes han participado en este proyecto. 

## Licencia 📄

Este proyecto está bajo la Licencia (Creative Commons) 




