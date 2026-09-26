# Comprobación diaria de Supabase

Se ejecuta todos los días a las **07:23 de Mérida (13:23 UTC)** mediante GitHub Actions.
También admite ejecución manual desde Actions → Comprobación diaria de Supabase → Run workflow.

Realiza tres consultas a `nutricion_database_healthcheck()`. La función devuelve `1`,
no consulta tablas, no modifica datos y utiliza los permisos del llamante.
El proceso emplea únicamente la clave pública `anon` ya utilizada por la aplicación.
No necesita token personal de Supabase, contraseña de base de datos ni clave de servicio.

Variables de Actions del repositorio:

- `SUPABASE_HEALTH_URL`: URL del proyecto.
- `SUPABASE_HEALTH_PUBLIC_KEY`: clave pública del proyecto.

El trabajo falla de forma visible si no obtiene la respuesta esperada tras tres intentos.
Los resultados y tiempos quedan en el resumen de cada ejecución. Las notificaciones por
correo dependen de las preferencias de GitHub del propietario; no se han modificado.

## Límites

- Las ejecuciones programadas pueden retrasarse o no ejecutarse por condiciones de GitHub.
- En repositorios públicos, GitHub desactiva tareas programadas después de 60 días sin
  actividad del repositorio. Revisar Actions antes de ese plazo y reactivar la tarea si aparece deshabilitada.
- La actividad diaria puede evitar la pausa del plan Free de Supabase, pero no garantiza
  disponibilidad permanente. Supabase Pro excluye la pausa por inactividad.
- Este control no reemplaza un respaldo, no restaura un proyecto pausado y no comprueba
  todos los módulos clínicos.
- No realiza commits artificiales ni cambia expedientes para generar actividad.

Fuentes:

- https://supabase.com/docs/guides/platform/free-project-pausing
- https://docs.github.com/en/actions/reference/workflows-and-actions/events-that-trigger-workflows#schedule

Para suspender el control: Actions → Comprobación diaria de Supabase → Disable workflow.
