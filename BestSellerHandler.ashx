<%@ WebHandler Language="C#" Class="BestSellerHandler" %>

using System;
using System.Web;
using System.Net;
public class BestSellerHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string finalUrl = String.Empty;
        context.Response.ContentType = "application/xml";
        WebClient bestsellers = new WebClient();
        string url1 = "http://api.nytimes.com/svc/books/v2/lists/"+context.Request["title"];
        string url2= ".xml?&api-key="+context.Request["key"];
        finalUrl = url1 + url2;
        string response = bestsellers.DownloadString(finalUrl);
        context.Response.Write(response);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}