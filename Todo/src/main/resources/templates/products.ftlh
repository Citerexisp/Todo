<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JUST DO IT</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Общие стили для всего сайта */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            text-align: center;
            padding: 20px;
        }

        h1 {
            margin-top: 50px;
            font-size: 3em;
            color: #333;
        }

        h3 {
            font-size: 1.5em;
            margin-top: 30px;
            color: #555;
        }

        /* Стили таблицы задач */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left; /* Выравнивание по левому краю ячеек */
            font-size: 1.2em;
        }

        th {
            background-color: #f4f4f4;
        }

        /* Стили для кнопки удаления */
        .delete-form input[type="submit"] {
            background-color: #ff4500;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 1em;
        }

        .delete-form input[type="submit"]:hover {
            background-color: #e03d00;
        }

        /* Стили формы создания новой задачи */
        .form-container {
            margin-top: 40px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-container input[type="text"] {
            width: 80%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
        }

        .form-container input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            cursor: pointer;
            font-size: 1.2em;
            margin-top: 15px;
        }

        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }

        /* Стили для изображения */
        figure {
            margin-top: 40px;
            display: flex;
            justify-content: center;
        }

        figure img {
            border-radius: 10px;
            max-width: 100%;
            height: auto;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.2);
        }

        /* Адаптивность для мобильных устройств */
        @media (max-width: 768px) {
            table {
                width: 100%;
            }

            th, td {
                font-size: 1em;
                padding: 10px;
            }

            .form-container input[type="text"] {
                width: 100%;
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
<h1>TODO</h1>
<h3>Ваши дела -></h3>

<table>
    <thead>
    <tr>
        <th>Название задачи</th>
        <th>Статус задачи</th>
        <th>Действия</th>
    </tr>
    </thead>
    <tbody>
    <#list products as product>
        <tr>
            <td>
                <b>
                    <#if product.name??>
                        ${product.name}
                    <#else>
                        Введите название задачи
                    </#if>
                </b>
            </td>
            <td>
                <#if product.status??>
                    ${product.status}
                <#else>
                    Введите статус задачи
                </#if>
            </td>
            <td>
                <form action="/product/delete" method="post" class="delete-form">
                    <input type="hidden" name="id" value="${product.id}">
                    <input type="submit" value="Удалить задачу">
                </form>
            </td>
        </tr>
    </#list>
    </tbody>
</table>

<figure>
    <img src="/images/cat.jpeg" alt="Рыжий кот Кекс лежит у ноутбука." width="1024" height="683">
</figure>

<h3 class="form-container">Создать новую задачу</h3>
<form action="/product/create" method="post" class="form-container">
    Название задачи: <input type="text" name="name"/><br><br>
    Статус задачи: <input type="text" name="status"/><br><br>
    <input type="submit" value="Добавить задачу">
</form>


<footer>
    <p>&copy; 2024 Beautiful Website. All rights reserved.</p>
</footer>

</body>
</html>
