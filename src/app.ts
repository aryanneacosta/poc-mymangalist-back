import express from 'express';
import { getMangaList, postManga, updateManga, deleteManga, filterManga } from './controllers/mangasController.js';

const server = express();
server.use(express.json());

server.get('/manga', getMangaList);
server.post('/manga', postManga);
server.put('/rate', updateManga);
server.delete('/delete/:mangaId', deleteManga);
server.get('/genre', filterManga);

server.listen(4000, () => {
    console.log(`server is listening on port 4000`);
})