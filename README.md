# Network-Scan

El objetivo de esta herramenta es detectar si alguna de las direcciones IP dentro de la red accesible tiene visibilidad sobre una IP víctima.

> Esta herramienta está preparada solo para un entorno Linux y modificará la propia direccion IP una vez ejecutemos el script

## Uso
```
$ ./netscan.sh <ip_addr only 3 first groups> <ip_addr target>
```

## Ejemplo
```
$ ./netscan.sh 192.188.1 192.168.3.1
```
