<%@ WebHandler Language="C#" Class="BookReviewHandler" %>

using System;
using System.Web;
using System.Net;

public class BookReviewHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "application/xml";
        WebClient goodreads = new WebClient();
        string url1="https://www.goodreads.com/book/title.xml?&key="+context.Request["key"];
        string url2 = "&title=" + context.Request["title"];
        string finalUrl = url1 + url2;
        string response=goodreads.DownloadString(finalUrl);
        context.Response.Write(response);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}