import { Request, Response } from "express";
import { findSeriesList } from '../repositories/volumesRepository.js'

async function getSeriesList(req: Request, res: Response) {
    const list = (await findSeriesList()).rows;
    res.send(list);
}

export { 
    getSeriesList
}