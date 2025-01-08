const express = require("express");
const app = express();
const { exec } = require('child_process');
const path = require('path');
const fs = require('fs');


// Verbos HTTP   
// GET
// POST
// PUT
// DELETE

app.use(express.json());

app.get('/api', (req, res) => {
    console.log('Received GET request at /api');
    exec('wget --user=diegmore --password=42@Lisbon@pal ftp://ftpserver:21/oi.txt', (err, stdout, stderr) => {
    
        if(err) {
            console.error('wget error:', err);
            console.error('stderr:', stderr);
            res.send('Error downloading file');
            return;
        }
        console.log('stdout:', stdout);
        let file = fs.readFileSync('oi.txt', 'utf8');
        let filePath =  'oi.txt';
        console.log('File path:', filePath);
        console.log('File content:', file);
        res.sendFile(filePath);
    });
    res.send('Hello from the server');
});



app.post('/api', (req, res) => {
    let { name ,from, to, subject, message } = req.body;
    const email = "diegoaguia33@gmail.com";
    if( !name ||!from || !to || !subject || !message) {
        res.status(400).send('Missing parameters');
        return;
    }
    console.log('Received POST request at /api');
    console.log('email:', from);
    console.log('To:', to);
    console.log('Subject:', subject);
    console.log('Message:', message);
    message = message + " " + from + " " + name;
    exec(`sendemail -s postfix:25 -f ${email} -t ${to} -u ${subject} -m ${message}`, (err, stdout, stderr) => {
        if(err) {
            console.error('Sendmail error:', err);
            console.error('stderr:', stderr);
            res.send('Error sending email');
            return;
        }
        console.log('stdout:', stdout);
        res.status(200).send('Email sent successfully');
    });
});

app.listen(5002 , () => {
    console.log('Server running on port 5002');
});
