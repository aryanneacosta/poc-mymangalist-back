import { QueryResult } from 'pg';
import { connection } from '../database/database.js';
import { MangaEntity, NewManga, UpdateManga } from '../protocols/manga.js';

async function findMangaList() : Promise<QueryResult<MangaEntity>> {
    return connection.query('SELECT * FROM mangas;');
}

async function insertNewManga(manga: NewManga): Promise<QueryResult> {
    return connection.query('INSERT INTO mangas (serie, author, genre, volume, image)  VALUES ($1, $2, $3, $4, $5);', [manga.serie, manga.author, manga.genre, manga.volume, manga.image]);
    
}

export {
    findMangaList,
    insertNewManga
}