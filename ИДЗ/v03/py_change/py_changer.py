import os
import re
import chardet

# Функция для определения кодировки файла
def detect_encoding(filepath):
    with open(filepath, 'rb') as file:
        raw_data = file.read(1024)
    return chardet.detect(raw_data)['encoding']

# Основная функция для изменения схем в .sql файлах
def add_schema_to_sql_files(schema='MySchema'):
    directory = os.path.dirname(os.path.abspath(__file__))
    tables = ["Entrant", "EducationProgram", "Application", "Exam", "RequiredExams"]
    pattern = r'\b({})\b'.format('|'.join(tables))

    for filename in os.listdir(directory):
        if filename.endswith(".sql"):
            filepath = os.path.join(directory, filename)
            
            # Определяем кодировку файла
            encoding = detect_encoding(filepath)
            print(f"Обработка файла {filename} с кодировкой {encoding}")
            
            with open(filepath, 'r', encoding=encoding) as file:
                content = file.read()

            # Заменяем все упоминания таблиц и схемы dbo
            updated_content = re.sub(pattern, lambda m: f"{schema}.{m.group(0)}", content)
            updated_content = updated_content.replace('dbo.', f'{schema}.')

            # Перезаписываем файл с кодировкой utf-8
            with open(filepath, 'w', encoding='utf-8') as file:
                file.write(updated_content)
            print(f"Обновлен файл: {filename}")

# Запуск основной функции
if __name__ == "__main__":
    add_schema_to_sql_files()
