import Joi from "joi";

export const NewMangaSchema =  Joi.object({
    serie: Joi.string().required(),
    author: Joi.string().required(),
    genre: Joi.string().valid('shounen', 'shoujo', 'seinen', 'josei', 'ecchi').required(),
    volume: Joi.number().required(),
    image: Joi.string().required()
});

export const UpdateMangaSchema = Joi.object({
    id: Joi.number().required(),
    status: Joi.string().valid('read', 'unread').required(),
    rating: Joi.string().valid('0.0', '0.5', '1.0', '1.5', '2.0', '2.5', '3.0', '3.5', '4.0', '4.5', '5.0').required(),
    avaliation: Joi.string().required()
});