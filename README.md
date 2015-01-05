pinpon
======

manager de torneos de tenis de mesa

El propósito de este desarrollo es hacer un mánager libre (con licencia gpl) y multiplataforma (GNU Linux/windows)

Se utilizará el lenguaje pascal, el compilador que se usará es free pascal; ver http://www.freepascal.org/

POR HACER:

Procedimientos para armar la llave 
-- se trabajará con la hipotesis de que la fase de zonas a finalizado y se dispone de un array ordenado con los jugadores participantes.

-- el array estará ordenado según la clasificación obtenida en las zonas. (1 zona a, 1 zona b, 1 zona c, ..., segundo zona c, segundo zona b, segundo zona a, tercero zona a, tercero zona b, tercero zona c) 
nota: notar el sistema serpiente

-- el array contará con: nombre del jugador, puesto y zona de clasificación, club

-- el primer criterio de exclusión será la zona, el segundo, de ser posible, será el club.

-- los jugadores mejores clasificados en la lleve tienen prioridad en los bys, asi, de haber un by es para el clasificado 1 en la zona a, y el clasificado 2 en la zona c tiene prioridad sobre el 2 de la b

GUI para la inscripción de jugadores
-- se utilizará lazarus con componentes de las paletas estándares.

Armado de zonas
-- las zonas serán de 3 jugadores, si es necesario se crearán zonas de 4 jugadores
-- cada zona generará un archivo PDF para imprimir, podrá incluir gráficos se recomendará usar gráficos en blanco y negro para no generar gastos de tinta color.

Carga de resultados de las zonas.
-- se implementará un sistema procedimiento para agilizar la carga de resultados (si el partido termina 11-2, 11-13, 11-7 solo se ingresará: el jugador ganador y los valores, 2, -11, 7)


INOVACIÓN
Se implementará un servicio para que todas las personas que lo soliciten bajen a sus teléfonos celulares la llave en disputa, ese servicio no requerirá login, será anonimo (no se guardarán mac address, ips, y no se grabarán cookies en el dispositivo del jugador), y será gratuito. Podrá incluir publicidad de los auspiciantes del torneo/club.
El tráfico total de la publicidad jamás deberá superar al de la llave.


   

