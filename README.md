# Gestión Bancaria

[![COBOL](https://img.shields.io/badge/Language-COBOL-red?style=flat-square&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCI+PHRleHQgeD0iNiIgeT0iMTgiIGZvbnQtc2l6ZT0iMTQiIGZpbGw9IndoaXRlIj5DPC90ZXh0Pjwvc3ZnPg==)](https://en.wikipedia.org/wiki/COBOL)
[![Status](https://img.shields.io/badge/Status-Active-brightgreen?style=flat-square)](https://github.com/Miniquique/gestionBancaria)
[![License](https://img.shields.io/badge/License-Educational-blue?style=flat-square)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Linux%2FUnix-orange?style=flat-square)](https://www.linux.org/)
[![GnuCOBOL](https://img.shields.io/badge/Compiler-GnuCOBOL-success?style=flat-square)](https://sourceforge.net/projects/gnucobol/)

Sistema de gestión de cuentas bancarias desarrollado en **COBOL** utilizando GnuCOBOL. La aplicación permite crear cuentas, consultar saldos y realizar movimientos (depósitos y retiros) con persistencia de datos en archivos secuenciales.

## 📋 Características

- ✅ **Crear Cuentas**: Registro de nuevas cuentas con número, nombre y saldo inicial
- ✅ **Consultar Cuentas**: Lectura y visualización de datos de cuentas existentes
- ✅ **Movimientos**: Depósitos y retiros con actualización automática de saldos
- ✅ **Persistencia**: Almacenamiento de datos en archivos secuenciales
- **Interfaz Menúes**: Navegación intuitiva mediante menú interactivo
- **Modularidad**: Estructura modular con subprogramas reutilizables

## 🛠️ Tecnología

- **Lenguaje**: COBOL (GnuCOBOL)
- **Sistema de Archivos**: Archivos secuenciales
- **Versionado**: Git
- **Plataforma**: Linux

## 📁 Estructura del Proyecto

```
gestionBancaria/
├── src/
   ├── main.cbl              # Programa 
   ├── cuentas.cbl           # Módulo de       creación de cuentas
   ├── movimiento.cbl        # Módulo de 
   ├── leer.cbl              # Módulo de consulta de cuentas
   └── main                  # Ejecutable compilado
├── data/
│   ├── CUENTAS.dat          # Base de datos de cuentas
│   └── TEMP.dat             # Archivo temporal
├── scripts/
│   └── COPIAR.sh            # Script auxiliar
├── docs/                     # Documentación adicional
└── README.md                 # Este archivo
```

## 🚀 Instalación y Uso

### Requisitos
- GnuCOBOL 2.0 o superior
- Compilador C (gcc)
- Linux/Unix

### Instalación de GnuCOBOL (Debian/Ubuntu)
```bash
sudo apt-get update
sudo apt-get install gnucobol
```

### Compilación
```bash
cd gestionBancaria/src
cobc -x main.cbl cuentas.cbl movimiento.cbl -o main
```

### Ejecución
```bash
./main
```

## 📖 Manual de Uso

1. **Menú Principal**: Al ejecutar, se muestra un menú con las siguientes opciones:
   - `1` - Crear Cuenta
   - `2` - Consultar Cuentas
   - `3` - Realizar Movimiento
   - `4` - Salir

2. **Crear Cuenta**:
   - Ingresa número de cuenta (máximo 6 dígitos)
   - Ingresa nombre del cliente
   - Ingresa saldo inicial

3. **Realizar Movimiento**:
   - Ingresa número de cuenta a modificar
   - Ingresa monto (positivo para depósito, negativo para retiro)
   - Se actualiza automáticamente en la base de datos

## 📊 Estructura de Datos

### Registro de Cuenta
```
NUMERO-CUENTA     : 6 dígitos (0-999999)
NOMBRE-CLIENTE    : 50 caracteres
SALDO-CLIENTE     : 7 dígitos + 2 decimales (formato: 9(7)V99)
```

## 🔧 Componentes del Sistema

### main.cbl
Programa principal que gestiona la interfaz de usuario y distribuye las llamadas a los subprogramas.

### cuentas.cbl
Subprograma encargado de la creación de nuevas cuentas con validación básica.

### movimiento.cbl
Subprograma que procesa depósitos y retiros, modificando saldos y actualizando la base de datos.

### leer.cbl
Subprograma para consultar y mostrar información de cuentas existentes.

## 📝 Notas de Desarrollo

- Los archivos de datos se generan automáticamente en el directorio `data/`
- El programa usa archivos secuenciales para almacenamiento
- Se implementó validación de cuenta existente antes de procesar movimientos
- Los movimientos negativos se restan del saldo, positivos se suman

## 🐛 Conocidas Limitaciones

- No se implementó cifrado de datos
- No hay validación de rango de números
- No se soportan operaciones concurrentes
- Búsqueda lineal en archivos (sin índices)

## 📜 Licencia

Proyecto educativo - Libre para uso personal y académico.

## 👤 Autor

**David Guerrero Ortega** - Proyecto de Gestión de Sistemas Bancarios

---

**Última Actualización**: Abril 2026
