import { Request, Response } from 'express';
import { findMangaList, insertNewManga, ratingManga, deletingManga, filteringManga } from '../repositories/mangasRepository.js';
import { NewManga, UpdateManga } from '../protocols/manga.js';
import { NewMangaSchema, UpdateMangaSchema } from '../schemas/mangasSchema.js';

async function getMangaList(req: Request, res: Response) {
    const list = (await findMangaList()).rows;
    res.send(list);
}

async function postManga(req: Request, res: Response) {
    const manga = req.body as NewManga;
    const { error } = NewMangaSchema.validate(manga);
    if (error) {
        return res.status(400).send({
            message: error.message
        });
    }

    const newMangaAdded = await insertNewManga(manga);
    res.send(`${newMangaAdded.rowCount} new(s) manga(s) inserted`);
}

async function updateManga(req: Request, res: Response) {
    const update = req.body as UpdateManga;
    const { error } = UpdateMangaSchema.validate(update);
    if (error) {
        return res.status(400).send({
            message: error.message
        });
    }

    const mangaUpdated = await ratingManga(update);
    res.send(`${mangaUpdated.rowCount} manga marcado como lido e avaliado`);
}

async function deleteManga(req: Request, res: Response) {
    const mangaId = req.params.mangaId;

    const mangaDeleted = await deletingManga(Number(mangaId));
    if (mangaDeleted.rowCount === 0) {
        return res.send(`Nenhum manga com esse id foi encontrado`);
    }

    res.send(`${mangaDeleted.rowCount} manga apagado`);
}

async function filterManga(req: Request, res: Response) {
    const { genre } = req.query;

    if (genre !== 'shounen' && genre !== 'shoujo' && genre !== 'seinen' && genre !== 'josei' && genre !== 'ecchi') {
        return res.status(400).send('Insira um gênero de manga válido');
    }
    
    const mangaListByGenre = await filteringManga(String(genre));
    res.send(mangaListByGenre.rows);
}

export {
    getMangaList,
    postManga,
    updateManga,
    deleteManga,
    filterManga
}