const express = require("express");
const app = express();
const cors = require('cors');

const fs = require("fs");
const http = require("http");
const querystring = require('querystring');
// Verbos HTTP   
// GET
// POST
// PUT
// DELETE

const options = {
    key: fs.readFileSync('/etc/ssl/private/server.key'),
    cert: fs.readFileSync('/etc/ssl/certs/server.crt')
};




// function setCorsHeaders(req, res, next) {
//     res.setHeader('Access-Control-Allow-Origin', '*');
//     res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE');
//     res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
//     next();
// }
http.createServer(options, (req, res) => {
    res.writeHead(200);
    
    if(req.method === 'POST'){
        res.write('Method POST');
        console.log('Method POST');

    }
    res.end('Hello, world!');
  }).listen(5002);



// app.use((req,res,next) => {  
//     res.setHeader('Access-Control-Allow-Origin', '*');
//     res.header(
//         'Access-Control-Allow-Headers',
//         'Origin, X-Requested-With, Content-Type, Accept'
//     );
//     console.log('Request:', req.method, req.url);
//     next();
// });
// app.post('/', (req, res) => {
//     const querystring = require('querystring');
//     let post={};
//     try
//     {
//         post = querystring.parse(req.body)
//     }      
//     catch(e){
//         console.log(e.stack)
//     }
//     res.write('Ok');
//     res.end();
// });
// app.get('/', (req, res) => {
//     console.log('Received GET request');
//     console.log('Query params:', req.query);    
//     res.send('Hello World Get' );
// });


app.post('/', (req, res) => {
    console.log('Received POST request');
    res.send('Post request received');
});



// function sendEmail(email, subject, message) {

//     exec('sendmail -s postfix:25 -f' + email + ' -t' + email + ' -u' + subject + ' -m' + message, (err, stdout, stderr) => {
//         if (err) {
//             console.error(err);
//             return;
//         }
//         console.log(stdout);
//     });
// }
// Vou ter que fazer uma Api em node js para enviar
// O email no caso um front-end que envia a requisicao para o Back-end
// Que ideia burra minha ne?
// Agora vou ter que fazer