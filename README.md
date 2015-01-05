pinpon
======

manager de torneos de tenis de mesa

El propósito de este desarrollo es hacer un mánager libre (con licencia gpl) y multiplataforma (GNU Linux/windows)

Se utilizará el lenguaje pascal, el compilador que se usará es free pascal; ver http://www.freepascal.org/

POR HACER:

procedimientos para armar la llave 
-- se trabajará con la hipotesis de que la fase de zonas a finalizado y se dispone de un array ordenado con los jugadores participantes.

-- el array estará ordenado según la clasificación obtenida en las zonas. (1 zona a, 1 zona b, 1 zona c, ..., segundo zona c, segundo zona b, segundo zona a, tercero zona a, tercero zona b, tercero zona c) 
nota: notar el sistema serpiente

-- el array contará con: nombre del jugador, puesto y zona de clasificación, club

-- el primer criterio de exclusión será la zona, el segundo, de ser posible, será el club.

-- los jugadores mejores clasificados en la lleve tienen prioridad en los bys, asi, de haber un by es para el clasificado 1 en la zona a, y el clasificado 2 en la zona c tiene prioridad sobre el 2 de la b


   

