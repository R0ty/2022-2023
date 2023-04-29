const {pool} = require('../db/dbMenu')
const {schema} = require('./schemaMenu')
const {schema2} = require('./schemaOrder')
async function poolRoutes (fastify, options) {

    fastify.get('/getAntipasti', {schema: schema},async (request, reply) => {
        const res =await pool.query('SELECT * FROM starter')
        reply.send(res.rows)
        
    })

    fastify.get('/getPrimi',{schema: schema}, async (request, reply) => {
        const res =await pool.query('SELECT * FROM first')
        reply.send(res.rows)
        
    })

    fastify.get('/getSecondi', {schema: schema},async (request, reply) => {
        const res =await pool.query('SELECT * FROM second')
        reply.send(res.rows)
        
    })

    fastify.get('/getDessert', {schema: schema},async (request, reply) => {
        const res =await pool.query('SELECT * FROM dessert')
        reply.send(res.rows)
        
    })
    fastify.get('/geBevande', {schema: schema},async (request, reply) => {
        const res =await pool.query('SELECT * FROM drink')
        reply.send(res.rows)
        
    })
    fastify.get('/getRisposta', {schema: schema2},async (request, reply) => {
        const res =await pool.query('SELECT * FROM risposta')
        reply.send(res.rows)
        
    })


    fastify.get('/utente', async (request, reply) => {
        const name = request.query.name;
        const password = request.query.password;
      
        // Esegui il controllo delle credenziali dell'utente
        try {
          const result = await pool.query('SELECT * FROM camerieri WHERE name = $1 AND password = $2', [name, password]);
          if (result.rows.length > 0) {
            reply.send({ autenticato: true });
          } else {
            reply.send({ autenticato: false });
          }
        } catch (error) {
          console.error(error);
          reply.send({ error: 'Si è verificato un errore durante il controllo delle credenziali dell\'utente.' });
        }
      });

      
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