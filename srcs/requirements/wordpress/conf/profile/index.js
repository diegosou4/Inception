const express = require('express'); 
const app = express();
const path = require('path');

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));
app.use(express.static(path.join(__dirname, 'public')));

app.listen(4000, () => {    
    console.log('Server is running on port 4000'); 
});

app.get('/api/profile', (_, res) => {
    res.render('pages/index');
});