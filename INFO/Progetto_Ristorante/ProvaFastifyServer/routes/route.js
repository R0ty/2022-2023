const {pool} = require('../db/dbMenu')
const {schema} = require('./schemaMenu')
const {schema2} = require('./schemaOrder')
const bcrypt = require('bcrypt')
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

      fastify.post('/ordinazioni', async (request, reply) => {
        try {
          const items = request.body; // Array di oggetti ricevuti dal payload JSON
      
          // Connessione al database PostgreSQL
          const client = await pool.connect();
      
          // Inserimento degli oggetti nel database
          for (const item of items) {
            const query = 'INSERT INTO ordinazioni (piatto, correzione, tavolo) VALUES ($1, $2, $3)';
            await client.query(query, [item.piatto, item.correzione, item.tavolo]);
          }
      
          // Rilascio del client della connessione al database
          client.release();
      
          reply.code(200).send({ message: 'Oggetti inseriti con successo' });
        } catch (err) {
          console.error(err);
          reply.code(500).send({ message: 'Errore durante l\'inserimento degli oggetti' });
        }
      });
      
      
    fastify.post('/utente', async (request, reply) => {
      const {name, password} = request.body ;
    
      // Esegui il controllo delle credenziali dell'utente
      try {
        const {rows: result} = await pool.query('SELECT * FROM camerieri WHERE name = $1', [name]);
        if (result.length > 0) {
          const isMatch = await bcrypt.compare(password, result[0].password
          )
          if(isMatch){
            reply.send({ autenticato: true });
          }else {
            reply.send({ autenticato: false });
          }
        }else {
          reply.send({ autenticato: false });
        }
      } catch (error) {
        console.error(error);
        reply.send({ error: 'Si è verificato un errore durante il controllo delle credenziali dell\'utente.' });
      }
    });

      fastify.post('/register/:name/:password', async function (req, res) {
        try {
            if (req.params.name == "" || req.params.password == "") {
                res.status(401).send({ msg: "Please provide all the required information." });
            } else {
                
                const { rows: checkUsername } = await pool.query(
                    `SELECT * FROM camerieri WHERE name = $1`, [req.params.name],
                );
                if (checkUsername && checkUsername.length > 0) {
                    res.status(500).send({ msg: "Username already in use" });
                } else {
                    let hashedPassword = await bcrypt.hash(req.params.password, 10);
                    const { rows } = await pool.query(
                        `INSERT INTO camerieri(name, password) VALUES ($1, $2)`,
                         [req.params.name, hashedPassword ],
                    )
                    console.log(rows)
                    res.status(200).send({ msg: "Successfully Registered. Please log in." });
                }
            }
        } catch (error) {
            throw error
        }
    })


      
}



module.exports = poolRoutes