const getItemsOpts = {
    schema: {
        response: {
            200: {
                type: 'array',
                items: {
                    type: 'object',
                    required: ['id', 'name', 'description'],
                    properties: {
                        name: {type: 'string'},
                        description: {type: 'string'},
                    },
                },
            }, 
        },
    },
}

module.exports = getItemsOpts