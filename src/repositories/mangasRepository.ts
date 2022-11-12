import { connection } from '../database/database.js';

async function findMangaList() {
    return connection.query('SELECT * FROM volumes;');
}

export {
    findMangaList
}