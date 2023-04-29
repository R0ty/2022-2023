const getItemsOpts = {
    schema: {
        response: {
            200: {
                type: 'array',
                items: {
                    type: 'object',
                    required: ['id','name', 'password'],
                    properties: {
                        name: {type: 'string'},
                        password: {type: 'integer'},
                    },
                },
            }, 
        },
    },
}

module.exports = getItemsOpts