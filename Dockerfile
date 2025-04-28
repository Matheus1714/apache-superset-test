FROM apache/superset:latest

ENV SUPERSET_SECRET_KEY=mysecretkey

# Comando para inicializar o superset
CMD bash -c "
  superset db upgrade &&
  superset fab create-admin --username admin --firstname Admin --lastname User --email admin@superset.com --password admin &&
  superset init &&
  superset load_examples &&
  superset run -h 0.0.0.0 -p 8088
"
