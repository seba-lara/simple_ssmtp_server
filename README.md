
# SSMTP Server — Docker (Alpine)

Imagen Docker minimalista basada en Alpine 3.12 con sSMTP configurado
para envío de correos desde contenedores o scripts, usando Gmail como relay SMTP.

## Stack

- Alpine Linux 3.12
- sSMTP
- mailutils
- Docker

## Uso

### Build

```bash
docker build . -f Dockerfile -t ssmtp_alpine:latest
```

### Run

```bash
docker run -it --rm --network=host ssmtp_alpine:latest bash
```

### Enviar un correo

```bash
ssmtp destinatario@example.com < mail-example
```

## Configuración

Edita `ssmtp.conf` antes del build con tus credenciales SMTP:

```
mailhub=smtp.gmail.com:587
AuthUser=tu_correo@gmail.com
AuthPass=tu_app_password
UseSTARTTLS=yes
```

> **Nota:** Para Gmail, genera una [App Password](https://myaccount.google.com/apppasswords)
> en lugar de usar tu contraseña directa.

## Archivos

| Archivo          | Descripción                                      |
| ---------------- | ------------------------------------------------- |
| `Dockerfile`   | Definición de la imagen                          |
| `ssmtp.conf`   | Configuración del servidor SMTP                  |
| `revaliases`   | Mapeo de usuarios locales a direcciones de correo |
| `mail-example` | Ejemplo de correo en formato texto plano          |
