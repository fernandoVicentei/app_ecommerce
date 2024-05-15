# app_ecommerce for Grentidem

Aplicacion ecommerce en Flutter

## Todo lo que se puede encontrar en el proyecto

Esta aplicación tiene las funcionalidades básicas para un ecommerce. Permite buscar productos en tiempo real, presentando los resultados en formato de #Lista y también en formato de #Cuadrícula. Otra funcionalidad es la visualización detallada de cada producto en una ventana aparte, donde se muestra información como el nombre, descripción, precios e imágenes. Por último, cuenta con la capacidad de guardar los últimos 5 productos visitados por el usuario en el #Almacenamiento interno, de modo que si no hay resultados al buscar, se mostrará esta lista de productos guardados

# Componentes utilizados

Todos los elemtnos estan en el directorio de lib

## 

/models/clothes.dart -> Es el objeto que se utiliza en la aplicacion para las diferentes operaciones.
/screens/detail_producto.dart ->Es un componente que tiene la funcion de poder visualizar con mas detalle los datos del producto seleccionado.
/screens/my_search.dart ->Es el componente principal de inicio de la aplicacion, en este dicho componente se realizan las operaciones de busquedas y visualizacion de productos.
/screens/ultimed_visited.dart -> Este componente tiene la funcion de visualizar los productos guardados en el almacenamiento interno.
/utils/api.dart -> Esta clase tiene utilidades reutilizables para la conexion con las apis externas.
/utils/helper.dart -> Este archivo contiene funciones que son reutilizables y en varios componentes del proyecto como ser (recuperar y guardar los productos visitados, verificar que una Url de imagen sea valida).
/test/helper_test.dart -> En este componente, tenemos unas pruebas automatizadas basicas para validar la funcionalidad correcta de ciertos componentes o funciones que necesitamos probar antes de utilizarlas.

# Uso de APIS

Como parte de la prueba se utilizo la siguiente API :

URL DE LA API
https://api.escuelajs.co/api/v1/products

URL DEL PROPIETARIO (Documentacion)
https://fakeapi.platzi.com/

# Sobre la API

La API de Platzi Fake Store se puede utilizar con cualquier tipo de proyecto que necesite productos, usuarios, categorías, autenticación y usuarios en formato JSON. Puede utilizar esta API para crear prototipos de comercio electrónico y aprender a conectarse a una API con las mejores prácticas.

# NOTA

En esta prueba, los productos tiene datos en el idioma Ingles, por ende a la hora de utilizar la app, es necesario buscar productos con palabras en Ingles.

