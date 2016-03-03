*Traducción al español a partir de la Guía original de https://github.com/Plailect/OTP*

## Introducción

Esta guía te llevará por todos los pasos para downgradear a la versión 2.1 para obtener el OTP, el cual ha sido bloqueado para su obtención con la salida de la versión 3.X (sin algún truco de hardware).

**Esta guía servirá para New 3DS, Old 3DS y 2DS en las regiones U, E, y J. Las regiones C, K, y T lanzadas con la versión 4.X, que es después del bloqueo del OTP, como tales *no pueden* ser downgradeadas lo suficiente para usar esta guía.**

Las regiones C, K, y T podrían ser capaces de cambiarse a las regiones U, E o J temporalmente, pero eso está fuera del alcanze de esta guía.

El método para volvar el OTP sin un hardmod (relativamente) de forma segura, fue originalmente creado por @github/Plailect y fue influenciado por conversaciones con AHP_Person, Normmatt, y Vappy. La guía está basada en las notas personales de @github/Plailect que puedes ver [aquí](https://www.irccloud.com/pastebin/SfsLwHWS/OTP+Notes) y fueron creadas de principio a fin en alrededor de 14 días.

Esta guía fue traducida por mi (knildark) y con aportes obtenidos de [Albus Percibal]( https://plus.google.com/103887204870368587707) en su [blog](http://a9lh3ds.blogspot.cl/), pero originalmente fue escrita por @github/Plailect en [Plailect/OTP](https://github.com/Plailect/OTP) con el proceso de refinado y desarrollo de software de los chicos en #Cakey on Freenode. Ve el final de esta página para todos los créditos, esta guía no existiría sin él ni ellos.

## FAQ / TL;DR

+ *¿Qué es el OTP?* -
  El OTP es una región única de la consola donde la llaves específicas de la consola al parecer son guardadas, aunque esto es desconocido cómo se logra. Para más información leer acá: https://3dbrew.org/wiki/OTP_Registers

+ *¿Qué puedo hacer con mi OTP?* -
  El OTP es el requerimiento principal para usar Arm9loaderHax, el cual te permite, entre otras cosas, 100% de chance inicio, velocidad de inicio de la emuNAND casi tan rápida como una SysNAND regular (usando algo como AuReiNand). Actualmente, esto permite ejecutar cosas como Decrypt9 para des-brickear tu mismo la consola sin necesidad de un hardmod o otras herramientas.

+ *¿Por qué tenemos que downgradear para obtenerlo?* -
  Desde la versión 3.0, el OTP es bloqueado antes de que inicie la sysNAND. Hay un exploit único en la New 3DS que funciona en 9.6, pero requiere hardware adicional. La solución que estamos usando es downgradear la emuNAND (para asegurarnos que no hagamos un downgrade incompleto) a 2.1, y luego flasheamos la emuNAND en la sysNAND para obtener el OTP.

+ *¿En qué versión debería tener mi consola?* -
  Esta guía asume que estás en 9.2; cualquier versión menor debería funcionar, pero corre bajo tu propio riesgo.

+ *¿Cual es la chance de un brickeo?* -
  Esta guía debería funcionar de forma segura sin un hardmod siempre y cuando sigas todas las intrucciones al pie de la letra.

## Empezar!

*Abre el enlace apropiado a tu consola abajo:*

New 3DS | Old 3DS / 2DS
:---: | :---:
[Pronto!](#) | [Click Aquí](https://github.com/knildark/OTP/blob/master/Old_3DS_Spider.md)

Pack .zip | SHA-256
:---: | :---:
New_3DS_Cubic_E | bee76141509a07ce61852ec25d9d68b6deaa2cf2d85842442a3029bb680da599
New_3DS_Cubic_J | 197dadeb35cd9ef3e3e37c5e71df062e8e940215a0c3ec9eb98c90d8e0d8cc0f
New_3DS_Cubic_U | 1b5accc5a1f31eac6da8c6c952b3608768d1267ecb21423b360541c3c817172c
New_3DS_Spider_E | 4e5e00b4bc106a05ac72401960efffa0537f48b3922f781b52800857b2ad73e9
New_3DS_Spider_J | d131900dda23087a08c5fc9ea07bc9cad989fdbfe4c551b0c0096b46dd3f9834
New_3DS_Spider_U | 0c764dc9816e3cee588e99c12857c623d77f986f20ff6d550a86b54123a6c538
Old_3DS_Cubic_E | 32debaf3d87205ac8de2d60a53028ba524d3b1544ca966299bd2090003140a9c
Old_3DS_Cubic_J | 809d6b07e229a40a02d9e1800ad1e6381073959d4cac567c31cdbe52174c96a4
Old_3DS_Cubic_U | d524166320b396e880f8c20b75e5c1a6e2ac5d51a6e7d1bf98c7d6388c5f8ebe
Old_3DS_Spider_E | b421d0265a26f0bdedaaf0112ecb1c9bbe0a5a2d4cd2a29dd7f09e0e5de51fa1
Old_3DS_Spider_J | 00ad5a9450ee8679311c2ee72a5aa092feaf490f606a4c16c64b5560d81af709
Old_3DS_Spider_U | 12f690d6d1ed58e851d86b9c664e7be59994d997f57ffb85aabcf1746cb65e14
