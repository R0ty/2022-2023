const { Pool }= require('pg');

const pool = new Pool({
    user: 'manager',
    database: 'ristorante',
    password: 'password',
    port: 5432,
    host: 'localhost',
});

module.exports = {pool}
