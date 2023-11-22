import sqlite3
from faker import Faker

conn = sqlite3.connect('./essaie.db')
cursor = conn.cursor()

cursor.execute('''
    CREATE TABLE IF NOT EXISTS movie (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        adult BOOLEAN,
        budget INTEGER,
        language TEXT,
        popularity REAL,
        status TEXT,
        vote_average REAL,
        vote_count INTEGER
    )
''')

fake = Faker()

for _ in range(200):
    adult = fake.boolean()
    budget = fake.random_int(min=100000, max=10000000)
    language = fake.language_name()
    original_title = fake.catch_phrase() 
    description = fake.text()  
    popularity = fake.random_int(min=-10, max=10)
    status = fake.random_element(elements=('En cours', 'Terminé', 'À venir'))
    title = fake.catch_phrase()
    vote_average = fake.random_int(min=-10, max=10)
    vote_count = fake.random_int(min=1, max=1000000)


    cursor.execute('''
        INSERT INTO "movie" (adult, budget, original_language, original_title, overview, popularity,status, title , vote_average, vote_count) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', (adult, budget, language, original_title, description, popularity, status, title, vote_average, vote_count))


genres = ['Action', 'Comédie', 'Drame', 'Science-fiction', 'Horreur', 'Documentaire', 'Romance', 'Anime', 'Thriller']
for genre in genres:
    cursor.execute('INSERT INTO genre (name) VALUES (?)', (genre,))


conn.commit()
conn.close() #Flemme de Tout faire -_- 