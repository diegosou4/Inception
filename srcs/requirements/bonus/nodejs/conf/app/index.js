const express = require("express");
const app = express();
const { exec } = require('child_process');
const fs = require("fs");
const http = require("http");
const querystring = require('querystring');
// Verbos HTTP   
// GET
// POST
// PUT
// DELETE

app.use(express.json());




app.post('/api', (req, res) => {
    const { from, to, subject, message } = req.body;
    const email = "diegoaguia33@gmail.com";
    if(!from || !to || !subject || !message) {
        res.status(400).send('Missing parameters');
        return;
    }
    console.log('Received POST request at /api');
    console.log('email:', from);
    console.log('To:', to);
    console.log('Subject:', subject);
    console.log('Message:', message);
    exec(`sendemail -s postfix:25 -f ${email} -t ${to} -u ${subject} -m ${message}`, (err, stdout, stderr) => {
        if(err) {
            console.error('Sendmail error:', err);
            res.send('Error sending email');
            return;
        }
        res.status(200).send('Email sent successfully');
    });
});

app.listen(5002 , () => {
    console.log('Server running on port 5002');
});

