package general;

import hello.bookPojos.Card;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;

import com.google.gson.Gson;


public class HttpRequests {

    public String url;


    public HttpRequests(String uri)
    {
        this.url = uri;
    }


    public HttpResponse makeRequest(Card pl)
    {
        try {
            HttpClient httpClient = HttpClientBuilder.create().build();
            HttpPost post = new HttpPost(this.url);
            Gson gson = new Gson();

            StringEntity postingString = new StringEntity(gson.toJson(pl));//gson.tojson() converts your pojo to json
            post.setEntity(postingString);
            post.setHeader("Content-type", "application/json");
            return httpClient.execute(post);
        }
        catch (Exception ex)
        {
            System.out.println(ex.getMessage());
            return null;
        }
    }
}
