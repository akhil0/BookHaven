<%@ WebHandler Language="C#" Class="AuthorBooksHandler" %>

using System;
using System.Web;
using System.Net;

public class AuthorBooksHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {

        context.Response.ContentType = "application/xml";
        string url1 = "http://www.goodreads.com/author/list/" + context.Request["author_id"];
        string urlquery = url1 + ".xml?key=" + context.Request["key"];
        //Console.WriteLine(urlquery);
        WebClient goodreads = new WebClient();
        string response = goodreads.DownloadString(urlquery);
        context.Response.Write(response);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}