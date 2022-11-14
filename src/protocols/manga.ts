export type MangaEntity = {
    id: number,
    serie: string,
    author: string,
    genre: string,
    volume: number,
    status: string,
    image: string,
    rating: string,
    avaliation: string
}

export type NewManga = Omit<MangaEntity, "id" | "status" | "rating" | "avaliation">

export type UpdateManga = Omit<MangaEntity, "serie" | "author" | "genre" | "volume" | "image">