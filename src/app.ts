import express from 'express';
import { getMangaList } from './controllers/mangasController.js';
import { getSeriesList } from './controllers/volumesController.js';

const server = express();

server.get('/manga', getMangaList);
server.get('/series', getSeriesList);

server.listen(4000, () => {
    console.log(`server is listening on port 4000`);
})