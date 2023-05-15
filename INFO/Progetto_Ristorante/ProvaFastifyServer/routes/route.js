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



      fastify.post('/register/:username/:password', async function (req, res) {
        try {
            if (req.params.username == "" || req.params.password == "") {
                res.status(401).send({ msg: "Please provide all the required information." });
            } else {
                
                const { rows: checkUsername } = await client.query(
                    `SELECT * FROM accounts WHERE username = $1`, [req.params.username],
                );
                if (checkUsername && checkUsername.length > 0) {
                    res.status(500).send({ msg: "Username already in use" });
                } else {
                    let hashedPassword = await bcrypt.hash(req.params.password, 10);
                    const { rows } = await client.query(
                        `INSERT INTO accounts(username, password,) VALUES ($1, $2)`,
                         [req.params.username, hashedPassword ],
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