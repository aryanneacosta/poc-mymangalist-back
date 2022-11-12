import express from 'express';
import { getMangaList } from './controllers/mangasController.js';
var server = express();
server.get('/manga', getMangaList);
server.listen(4000, function () {
    console.log("server is listening on port 4000");
});
