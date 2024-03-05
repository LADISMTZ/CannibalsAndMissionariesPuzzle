%POSIBLE MOVES
%MD = Misioneros derecha
%MD2 = Misioneros derecha despues del movimiento
%MI = Misioneros izquierda
%MI2 = Misioneros derecha despues del movimiento


%CD = Canivales derecha
%CD2 = Canivales derecha despues del movimiento
%CI = Canivales izquierda
%CI2 = Canivales derecha despues del movimiento

move1([CI,MI,izq,CD,MD],[CI,MI2,der,CD,MD2]):-
	% Dos misioneros de izquierda a derecha.
	MD2 is MD+2,
	MI2 is MI-2.


move2([CI,MI,izq,CD,MD],[CI2,MI,der,CD2,MD]):-
	% Dos canivales de izquierda a derecha.
	CD2 is CD+2,
	CI2 is CI-2.


move3([CI, MI, izq, CD, MD], [CI2, MI2, der, CD2, MD2]):-
	% Un misionero y un canival de izquierda a derecha.
	CD2 is CD + 1,
	CI2 is CI - 1,
	MD2 is MD + 1,
	MI2 is MI - 1.


move4([CI, MI, izq, CD, MD], [CI, MI2, der, CD, MD2]):-
	% Un misioneros de izquierda a derecha.
	MD2 is MD + 1,
	MI2 is MI - 1.


move5([CI, MI, izq, CD, MD], [CI2, MI, der, CD2, MD]):-
	% Un canival de izquierda a derecha.
	CD2 is CD + 1,
	CI2 is CI - 1.


move6([CI, MI, der, CD, MD], [CI, MI2, izq, CD, MD2]):-
	% Dos misioneros de derecha a izquierda.
	MD2 is MD - 2,
	MI2 is MI + 2.


move7([CI, MI, der, CD, MD], [CI2, MI, izq, CD2, MD]):-
	% Dos canivales de derecha a izquierda.
	CD2 is CD - 2,
	CI2 is CI + 2.


move8([CI, MI, der, CD, MD], [CI2, MI2, izq, CD2, MD2]):-
	% Un misionero y un canival de derecha a izquierda.
	CD2 is CD - 1,
	CI2 is CI + 1,
	MD2 is MD - 1,
	MI2 is MI + 1.


move9([CI, MI, der, CD, MD], [CI, MI2, izq, CD, MD2]):-
	% Un misionero de derecha a izquierda.
	MD2 is MD - 1,
	MI2 is MI + 1.


move10([CI, MI, der, CD, MD], [CI2, MI, izq, CD2, MD]):-
	% Un canival de derecha a izquierda.
	CD2 is CD - 1,
	CI2 is CI + 1.




% Define la lista de movimientos para la secuencia de resolucion del problema
movimientos(['move2', 'move10', 'move2', 'move10', 'move1', 'move8', 'move1', 'move10', 'move2', 'move10', 'move2']).

% Regla para ejecutar una secuencia de movimientos
ejecutar_secuencia([], Estado, Estado).%Los argumentos de la regla es una lista, un estado inicial y un estado final
ejecutar_secuencia([Movimiento | Resto], EstadoActual, EstadoFinal) :-
    % Llama al movimiento correspondiente
    call(Movimiento, EstadoActual, NuevoEstado),
    % Continúa con el resto de la secuencia
    ejecutar_secuencia(Resto, NuevoEstado, EstadoFinal).

% Regla para imprimir un estado
imprimir_estado([CI, MI, Side, CD, MD]) :-%Recibe cuantos misioneros y canivales hay de cada lado y de que lado esta el barco
    write('Izquierda: '), write(CI-MI), write(' '), write(Side), write(' Derecha: '), write(CD-MD), nl.

% Regla principal para ejecutar la secuencia de movimientos y mostrar el resultado
principal :-
    % Estado inicial [3 canibales a la izquierda, 3 misioneros a la izquierda, bote izquierda, 0 canibales a la derecha, 0 misioneros a la derecha]
    EstadoInicial = [3, 3, izq, 0, 0],
    % Ejecutar la secuencia de movimientos
    movimientos(Secuencia),%See declara a la lista de moviemintos como secuencia
    ejecutar_secuencia(Secuencia, EstadoInicial, EstadoFinal),%se ejecuta la secuencia con los parametros secuencia, estado inicial y recibiremos un estado final
    % Imprime el estado final
    imprimir_estado(EstadoFinal).

?-principal.
