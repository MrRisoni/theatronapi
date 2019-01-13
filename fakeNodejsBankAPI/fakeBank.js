const express  = require('express');
const bodyParser = require('body-parser');
const moment  = require('moment');

const port = process.env.PORT || 3000;
const app = express();
const http = require('http').Server(app);

app.use(bodyParser.json());


app.post('/api/banks/ok', (req, res) => {
    console.log(req.body);
    res.send({
        Error: '',
        ReferenceId : 1234
    });
});


app.post('/api/banks/notok', (req, res) => {
        console.log(req);

    res.send({
        Error: 'Contact sys admin',
        ReferenceId : 1234
    });
});


app.post('/api/banks/empty', (req, res) => {
        console.log(req);

	console.log('sending empty');
    res.send();
});


app.post('/api/banks/timeout', (req, res) => {
    setTimeout( () => {
        res.send({
            Error: '',
            ReferenceId : 1234
        });
    },8000);
});

http.listen(port, (req, res) => {
    console.log('Server listening on port number', port)
});



