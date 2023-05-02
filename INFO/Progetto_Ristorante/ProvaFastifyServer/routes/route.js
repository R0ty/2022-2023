const {pool} = require('../db/dbMenu')
const {schema} = require('./schemaMenu')
const {schema2} = require('./schemaOrder')
async function poolRoutes (fastify, options) {

    fastify.get('/getAntipasti', {schema: schema},async (request, reply) => {
        const res =await pool.query('SELECT * FROM antipasti')
        reply.send(res.rows)
        
    })

    fastify.get('/getPrimi',{schema: schema}, async (request, reply) => {
        const res =await pool.query('SELECT * FROM primi')
        reply.send(res.rows)
        
    })

    fastify.get('/getSecondi', {schema: schema},async (request, reply) => {
        const res =await pool.query('SELECT * FROM secondi')
        reply.send(res.rows)
        
    })

    fastify.get('/getDessert', {schema: schema},async (request, reply) => {
        const res =await pool.query('SELECT * FROM dessert')
        reply.send(res.rows)
        
    })
    fastify.get('/geBevande', {schema: schema},async (request, reply) => {
        const res =await pool.query('SELECT * FROM bevande')
        reply.send(res.rows)
        
    })
    fastify.get('/getOrdinazioni', {schema: schema2},async (request, reply) => {
        const res =await pool.query('SELECT * FROM ordinazioni')
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

      
      fastify.post('/ordinazioni', async (request, reply) => {
        try {
          const items = request.body.items;
          // fai qualcosa con la lista di oggetti JSON qui
          // ad esempio, inseriscili in un database
          for (const item of items) {
            const query = {
              text: 'INSERT INTO ordinazioni (piatto, correzione, tavolo) VALUES ($1, $2, $3)',
              values: [item.name, item.correzione, item.tavolo],
            };
            await pool.query(query);
          }
          reply.send({ message: 'Ordini inseriti correttamente' });
        } catch (error) {
          console.error(error);
          reply.code(500).send({ message: 'Errore nel server' });
        }
      });
      
}



module.exports = poolRoutes