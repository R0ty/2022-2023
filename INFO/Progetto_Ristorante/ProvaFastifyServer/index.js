const fastify = require('fastify')({
    logger: true,
    ignoreTraillingSlash: true})
const Port = 4000

const getMenu = fastify.register(require('./routes/route'))

const start = async () => {
    try {
        await fastify.listen(Port)
    } catch (error) {
        fastify.log.error(error);
        process.exit(1);
    }
}

start();