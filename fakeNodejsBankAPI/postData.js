const axios = require('axios');


const postObj = {
    people: [{

                    type: 'ADT',
                    seat: 'AVC',
                },
                {

                    type: 'ADT',
                    seat: 'ABD',
                },
            ],
    credit: {
        number: '411111111111111',
        cvv: '123',
        type: 'VIDE',
        cardHolder: 'ARTHUR MILLER',
        expMonth: '12',
        expYear: '22',
    },
    performance: {
        id: 1,
        date: '2019-01-25'
    },
    contact: {
        mail: 'test@test.gr',
        surname: 'CHEKOV',
        name: 'ANTON',
        gender: 'M',
        prefix: '30',
        mobile: '1234567890'
    }
}

axios.post('http://localhost:8080/api/book', postObj)
    .then((responseObj) => {
        const responseData = responseObj.data;




    }).catch((err) => {




    });