# 📧 SSMTP Server — Docker (Alpine)

![Docker](https://img.shields.io/badge/Docker-Alpine%203.12-2496ED?logo=docker&logoColor=white)
![Area](https://img.shields.io/badge/Area-DevOps%20%2F%20Infraestructura-orange)

Imagen Docker minimalista basada en Alpine 3.12 con sSMTP configurado
para envío de correos desde contenedores o scripts, usando Gmail como relay SMTP.
Desarrollado para el proyecto SMAP como servicio de notificaciones para alertas del sistema.

---

## 📌 Caso de uso

> En entornos donde un contenedor o script necesita enviar notificaciones
> por correo sin levantar un servidor de correo completo, esta imagen provee
> una solución liviana usando sSMTP como relay hacia Gmail.

---

## ⚙️ ¿Cómo funciona?

1. Se construye la imagen con la configuración SMTP incluida.
2. El contenedor expone el comando `ssmtp` para envío de correos.
3. Los correos se envían usando Gmail como relay SMTP con STARTTLS.
4. El archivo `revaliases` mapea usuarios del sistema a direcciones de correo.

---

## 🚀 Uso

**Build**

```bash
docker build . -f Dockerfile -t ssmtp_alpine:latest
```

**Run**

```bash
docker run -it --rm --network=host ssmtp_alpine:latest bash
```

**Enviar un correo**

```bash
ssmtp destinatario@example.com < mail-example
```

---

## ⚙️ Configuración

Edita `ssmtp.conf` antes del build con tus credenciales SMTP:

```
mailhub=smtp.gmail.com:587
AuthUser=tu_correo@gmail.com
AuthPass=tu_app_password
UseSTARTTLS=yes
```

> ⚠️ Para Gmail, genera una [App Password](https://myaccount.google.com/apppasswords)
> en lugar de usar tu contraseña directa. No uses tu contraseña de cuenta.

---

## 🗂️ Estructura del proyecto

```
simple_ssmtp_server/
│
├── Dockerfile        # Definición de la imagen Alpine con sSMTP
├── ssmtp.conf        # Configuración del servidor SMTP
├── revaliases        # Mapeo de usuarios locales a direcciones de correo
├── mail-example      # Ejemplo de correo en formato texto plano
└── README.md
```

---

## 🛠️ Tecnologías

- **Alpine Linux 3.12**
- **sSMTP**
- **mailutils**
- **Docker**
- **Gmail SMTP relay (puerto 587 / STARTTLS)**

---

## 👤 Autor

**Sebastián Lara**
- GitHub: [@seba-lara](https://github.com/seba-lara)
