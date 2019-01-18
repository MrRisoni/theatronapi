const axios  = require('axios');

const ppl = [
{


          type: 'ADT',
          seat: 'AVC',
        },
          {

                  type: 'ADT',
                  seat: 'ABD',
                },
]

 axios.post('http://localhost:8080/api/book',  {
          people:ppl})
          .then((responseObj) => {
              const responseData = responseObj.data;




          }).catch((err) => {




      });

