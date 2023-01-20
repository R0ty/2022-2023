const getItemsOpts = {
    schema: {
        response: {
            200: {
                type: 'array',
                items: {
                    type: 'object',
                    required: ['id','ordine', 'tavolo'],
                    properties: {
                        ordine: {type: 'string'},
                        tavolo: {type: 'integer'},
                    },
                },
            }, 
        },
    },
}

module.exports = getItemsOpts