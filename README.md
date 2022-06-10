# Parte Práctica del Examen 3er Trimestre

![Image text](https://github.com/ENGB02/Despliegue-de-Proyecto-Final-1-DAM-Sistemas-Informaticos-Jordi-Arroyo/blob/main/img/docker-compose-1.png)



_1º DAM_

_Alumnos implicados :Jordi Arroyo Pons_ 

_Fecha : 10/06/2022_


## Indice 

## 1- Introducción.

_A continuación explicaremos una breve introducción a como configurar el archivo docker-compose.yml dentro de la imagen de Docker , instalando previamente Docker Compose en Docker , como desplegar nuestro Proyecto final realizado en Github como repositorio , explicando paso a paso su despliegue 

Para comenzar debemos instalar Docker_

_luego deberemos ver si el compose ya está instalado en la imagen o debemos instalarlo , si al ejecutar el comando : 
-‘docker-compose up’ este se levanta es porque están correctamente instalado,
si no deberemos instalarlo con el comando desde la ubicación : usr/local/bin :
- sudo php composer-setup. php --install-dir= /usr/local/bin --filename= composer
Después de editar el YML debemos realizar un restart , para que los procesos no se queden “congelados” 
Después de esto Runeamos

Deberemos editar este archivo como esta en el capítulo 2 , es decir , su configuración se debe basar en los 3 servidores _

![Image text](https://github.com/ENGB02/Despliegue-de-Proyecto-Final-1-DAM-Sistemas-Informaticos-Jordi-Arroyo/blob/main/img/estructura%20del%20trabajo%20en%20si.PNG) estructurs 

_Al runear se nos creará la siguiente estructura :_

![Image text](https://github.com/ENGB02/Despliegue-de-Proyecto-Final-1-DAM-Sistemas-Informaticos-Jordi-Arroyo/blob/main/img/estructura%20al%20runear%20el%20yaml.PNG) estructurs 

_Estructura al runear el .yml con el .war , estará compuesto por por la estructura de estos y el repositorio (trabajo introducido en el .war)
Iniciamos el Run de todos estos contenedores y accedemos a sus respectivos host , es decir hacer un conjunto de contenedores para realizar este Login compuesto de PHP , TOMCAT y MYSQL así haciendo su correcto funcionamiento._

## 2- Configuración del archivo docker-compose.yml.

## 3- Pasos para el despliegue de la aplicación.

## 4- Preparación y subida de la imagen a docker hub.

## 5- Conclusiones

## 6- Annexos (si lo consideráis necesario)



### 1- Introducción.📋
### 2- Configuración del archivo docker-compose.yml.📋
### 3- Pasos para el despliegue de la aplicación. 📋
### 4- Preparación y subida de la imagen a docker hub. 📋
### 5- Conclusiones 📋
### 6- Annexos (si lo consideráis necesario) 📋



## Autores ✒️

* **Zhijun Lin** y **Jordi Arroyo** - *Proyecto Final* 
* **Jordi Arroyo** - *Este repositorio* 

También puedes mirar la lista de todos los [contribuyentes](https://github.com/your/project/contributors) quíenes han participado en este proyecto. 

## Licencia 📄

Este proyecto está bajo la Licencia (Creative Commons) 




