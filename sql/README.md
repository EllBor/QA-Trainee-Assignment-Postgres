# Инструкция по запуску PostgreSQL через Docker

В данном проекте находится:

- **Dockerfile** – файл с инструкциями для создания Docker-образа на основе официального PostgreSQL.
- **src/init** – папка, содержащая SQL-скрипты для создания базы данных, таблиц, вставки данных. Все SQL-скрипты из этой папки будут автоматически выполнены при первом запуске контейнера.
- **src/manual** – папка, содержащая SQL-скрипты для выполнения запросов и заполнения таблиц сгенерированными данными. Все SQL-скрипты из этой папки нуджно запустить в ручную.

## Предварительные условия

- Убедитесь, что Docker установлен на вашем компьютере.  [Инструкция по установке Docker](https://docs.docker.com/get-docker/).
- Проверьте, что порт **5432** свободен или измените его в команде запуска.

## Шаг 1. Сборка Docker-образа

1. Откройте терминал в корневой директории проекта (там, где находится файл `Dockerfile`).
2. Выполните следующую команду для сборки Docker-образа:

```bash
docker build -t my_postgres .
```

   Это создаст образ с именем my_postgres, в котором все SQL-скрипты из папки src/init будут скопированы в директорию /docker-entrypoint-initdb.d/, а скрипты из папки src/manual - в /manual-sql/.

## Шаг 2. Запуск Docker-контейнера

1. Запустите контейнер с PostgreSQL, выполнив команду:

   ```bash
    docker run -d --name postgres-container \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=password \
    -e POSTGRES_DB=academy \
    -p 5432:5432 \
    my_postgres
   ```

   - POSTGRES_USER=postgres — имя пользователя.
   - POSTGRES_PASSWORD=password — пароль.
   - POSTGRES_DB=academy — создается база данных academy.
   - Порт 5432 пробрасывается наружу.

2. Проверьте, что контейнер запущен:

```bash
docker ps
```

## Шаг 3. Подключение к базе данных

1. При первом запуске контейнера PostgreSQL автоматически выполнит все скрипты из папки /docker-entrypoint-initdb.d/.

2. После запуска контейнера можно подключиться к базе данных через командную строку с использованием psql:

```bash
psql -h localhost -U postgres -W
```

Выполните команду \dt для просмотра списка таблиц.

## Шаг 4. Проверка SQL-запросов

1. В файле querie_1.sql находится SQL-запрос, который возвращает студентов, не сдавших ни одного экзамена.

```bash
psql -h localhost -U postgres -d academy -f src/manual-sql/querie_1.sql
```

2. В файле querie_2.sql находится SQL-запрос, который выводит список студентов с количеством сданных экзаменов (только для тех, кто сдавал экзамены).

```bash
psql -h localhost -U postgres -d academy -f /manual-sql/querie_2.sql
```

3. В файле querie_3.sql находится SQL-запрос, который выводит список курсов со средним баллом по экзаменам, отсортированного по убыванию.

```bash
psql -h localhost -U postgres -d academy -f /manual-sql/querie_3.sql
```

## Шаг 5. Генерация случайных данных

Для наполнения таблицы случайными данными, выполните скрипт generate_data.sql:

```bash
psql -h localhost -U postgres -d academy -f /manual-sql/generate_data.sql
```

## Шаг 6. Завершение работы

1. Для остановки контейнера выполните:

```bash
docker stop postgres-container
```

2. Для удаления контейнера:

```bash
docker rm postgres-container
```

3. При необходимости удалите образ:

```bash
docker rmi my_postgres
```
