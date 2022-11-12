import { connection } from "../database/database.js";

async function findSeriesList() {
    return connection.query('SELECT * FROM series;');
}

export {
    findSeriesList
}