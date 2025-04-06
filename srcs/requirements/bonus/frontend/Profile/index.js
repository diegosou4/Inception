const express = require('express');
const path = require('path');

const app = express();  

app.use(express.static('public'));


app.get('/', (req, res) => {
    console.log("Teste do get do front");
});

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});


