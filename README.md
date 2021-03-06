# Parte Pr谩ctica del Examen 3er Trimestre

![Image text](https://github.com/ENGB02/Despliegue-de-Proyecto-Final-1-DAM-Sistemas-Informaticos-Jordi-Arroyo/blob/main/img/docker-compose-1.png)



_1潞 DAM_

_Alumnos implicados :Jordi Arroyo Pons_ 

_Fecha : 10/06/2022_

## link a la imagen de DockerHub : me ha faltado este paso :/


## Indice 

### 1- Introducci贸n.馃搵
### 2- Configuraci贸n del archivo docker-compose.yml.馃搵
### 3- Pasos para el despliegue de la aplicaci贸n. 馃搵
### 4- Preparaci贸n y subida de la imagen a docker hub. 馃搵
### 5- Conclusiones 馃搵
### 6- Annexos (si lo consider谩is necesario) 馃搵

## 1- Introducci贸n.

_A continuaci贸n explicaremos una breve introducci贸n a como configurar el archivo docker-compose.yml dentro de la imagen de Docker , instalando previamente Docker Compose en Docker , como desplegar nuestro Proyecto final realizado en Github como repositorio , explicando paso a paso su despliegue 

Para comenzar debemos instalar Docker

luego deberemos ver si el compose ya est谩 instalado en la imagen o debemos instalarlo , si al ejecutar el comando : 
-鈥榙ocker-compose up鈥? este se levanta es porque est谩n correctamente instalado,
si no deberemos instalarlo con el comando desde la ubicaci贸n : usr/local/bin :
- sudo php composer-setup. php --install-dir= /usr/local/bin --filename= composer
Despu茅s de editar el YML debemos realizar un restart , para que los procesos no se queden 鈥渃ongelados鈥? 
Despu茅s de esto Runeamos

Deberemos editar este archivo como esta en el cap铆tulo 2 , es decir , su configuraci贸n se debe basar en los 3 servidores _

![Image text](https://github.com/ENGB02/Despliegue-de-Proyecto-Final-1-DAM-Sistemas-Informaticos-Jordi-Arroyo/blob/main/img/estructura%20del%20trabajo%20en%20si.PNG) 

Al runear se nos crear谩 la siguiente estructura :

![Image text](https://github.com/ENGB02/Despliegue-de-Proyecto-Final-1-DAM-Sistemas-Informaticos-Jordi-Arroyo/blob/main/img/estructura%20al%20runear%20el%20yaml.PNG) 

Estructura al runear el .yml con el .war , estar谩 compuesto por por la estructura de estos y el repositorio (trabajo introducido en el .war)
Iniciamos el Run de todos estos contenedores y accedemos a sus respectivos host , es decir hacer un conjunto de contenedores para realizar este Login compuesto de PHP , TOMCAT y MYSQL as铆 haciendo su correcto funcionamiento.

## 2- Configuraci贸n del archivo docker-compose.yml.

Nuestro archivo de configuraci贸n de docker-compose.yml. 
la configuraci贸n que se le ha dado es la siguiente :

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


Est谩 basado en 3 imagenes , una basada en mysql (DB) , otra en phpmyadmin (web)  y la 煤ltima en TOMCAT (Servlets)

Cada una tiene su user y pass y su direcci贸n en los puertos , tambi茅n est谩n definidos los vol煤menes donde se situar谩n , su versi贸n del programa en s铆: 

vol煤menes:

MYSQL

- db_vol:/var/lib/mysql
- ./mysql-dump:/docker-entrypoint-initdb.d

Este 煤ltimo nos dirige a nuestro .war que est谩 basado en la p谩gina de login de nuestro repositorio: 

WAR

-./target/LoginWebApp.war:/usr/local/tomcat/webapps/LoginWebApp.war


## 3- Pasos para el despliegue de la aplicaci贸n.


Para comenzar debemos realizar nuestro .war para subir al compose , es decir , con Visual Studio o Netbeans procesar todo el proyecto para obtener este .war

Luego Configurar el .yml , guardarlo , hacer un restart y runearlo junto al .war , as铆 obtendremos la estructura de todo el bloque 

![Image text](https://github.com/ENGB02/Despliegue-de-Proyecto-Final-1-DAM-Sistemas-Informaticos-Jordi-Arroyo/blob/main/img/estructura%20al%20runear%20el%20yaml.PNG)

## 4- Preparaci贸n y subida de la imagen a docker hub.

[Todo esto ejecutado desde cmd]

Para publicar nuestra imagen en Docker Hub necesitamos loguearnos claramente en la cuenta de docker , ejecutando el comando:

'docker login'

Despu茅s tendremos que decidir el nombre del tag qu茅 le vamos a poner , ejecutamos un comando que se formar谩 por el nombre de usuario , nombre del repositorio y la etiqueta tal que as铆 : 

鈥榙ocker tag nombre de la imagen , usuario / tag de la imagen 鈥? 

ejemplo:'docker tag nodejs-webapp 0gis0/nodejs-webapp:v1'

Al tagear esta tendremos que realizar un push para subir nuestra imagen , con el siguiente comando 

' docker push nombre de usuario/nombre del la imagen y su versi贸n' 

ejemplo : 'docker push 0gis0/nodejs-webapp:v1'

al finalizar este proceso podremos entrar en nuestro usuario de Docker hub y podremos ver en el interfaz gr谩fico la subida del repositorio hecha imagen! 


## 5- Conclusiones

Docker en s铆 es una buena herramienta para crear procesos a corto plazo , es decir , que tanto el composed , como Nginx o diversos casos de uso de este nos facilita en general la vida , hemos de decir que es una buen herramienta 煤til que nos servir谩 para el futuro 

En general el proceso de configuraci贸n del .yml y exportar el .war es muy sencillo y pr谩ctico , nos servir谩 para un futuro no muy lejano , 隆gracias!

## 6- Annexos (si lo consider谩is necesario)

# Repositorio de nuestro trabajo en Github :  

![Image text](https://github.com/ENGB02/Despliegue-de-Proyecto-Final-1-DAM-Sistemas-Informaticos-Jordi-Arroyo/blob/main/img/github.PNG)

https://github.com/ZhijunLin7/ProyectoDam



## Autores 鉁掞笍

* **Zhijun Lin** y **Jordi Arroyo** - *Proyecto Final* 
* **Jordi Arroyo** - *Este repositorio* 

Tambi茅n puedes mirar la lista de todos los [contribuyentes](https://github.com/your/project/contributors) qu铆enes han participado en este proyecto. 

## Licencia 馃搫

Este proyecto est谩 bajo la Licencia (Creative Commons) 




