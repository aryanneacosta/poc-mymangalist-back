# MyMangaList

It's a place where you can organise your manga reading, keeping all informations about your progress reading and how you liked each one you've read.

# About

You can add your favorite mangas and this API will organize it for you.

- Add manga by series name, author name and other info about it.
- List all manga added.
- List manga by different genres such as shounen, shoujo, seinen, josei and ecchi.
- Rate your manga once you've finished it, including a description on how you've liked it.
- Delete a manga from your database.

# Routes

POST: /manga
Body: { 
  "serie": "SPYxFAMILY", 
  "author": "Tatsuya Endo", 
  "genre": "shounen", 
  "volume": 1, 
  "image": "https://m.media-amazon.com/images/I/71RPJe1eVCL.jpg" 
 }
 
GET: /manga
 
PUT: /rate
Body: {
  "id": 1,
  "status": "read",
  "rating": "5.0",
  "avaliation": "anya gosta de amendoim"
}

DELETE: /delete/:mangaId

GET: /genre?genre=shounen
