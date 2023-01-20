const {pool} = require('../db/dbMenu')
const {schema} = require('./schemaMenu')
const {schema2} = require('./schemaOrder')
async function poolRoutes (fastify, options) {

    fastify.get('/getStarter', {schema: schema},async (request, reply) => {
        const res =await pool.query('SELECT * FROM starter')
        reply.send(res.rows)
        
    })

    fastify.get('/getFirst',{schema: schema}, async (request, reply) => {
        const res =await pool.query('SELECT * FROM first')
        reply.send(res.rows)
        
    })

    fastify.get('/getSecond', {schema: schema},async (request, reply) => {
        const res =await pool.query('SELECT * FROM second')
        reply.send(res.rows)
        
    })

    fastify.get('/getDessert', {schema: schema},async (request, reply) => {
        const res =await pool.query('SELECT * FROM dessert')
        reply.send(res.rows)
        
    })
    fastify.get('/getDrink', {schema: schema},async (request, reply) => {
        const res =await pool.query('SELECT * FROM drink')
        reply.send(res.rows)
        
    })
    fastify.get('/getRisposta', {schema: schema2},async (request, reply) => {
        const res =await pool.query('SELECT * FROM risposta')
        reply.send(res.rows)
        
    })

    fastify.post('/post/:ordine/:tavolo', async (request,reply) => {
        const ordine = request.params.ordine
        const tavolo = request.params.tavolo  
        const query = {text: 'INSERT INTO risposta (ordine, tavolo) VALUES ($1, $2)',
        values: [ordine, tavolo],
    }
    
        try {
            const {rows} = await pool.query(query)
            console.log(rows)
            reply.code(201, 'Order received')
            return {created: true}
            
        } catch (err) {
                throw new Error(err)
        }
           
    }
    )
}



module.exports = poolRoutes