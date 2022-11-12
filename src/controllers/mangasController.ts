import { Request, Response } from 'express';
import { findMangaList } from '../repositories/mangasRepository.js';

async function getMangaList(req: Request, res: Response) {
    const list = (await findMangaList()).rows;
    res.send(list);
}

export {
    getMangaList
}