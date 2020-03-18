function readTextFile(file, callback) {
    var rawFile = new XMLHttpRequest();
    rawFile.overrideMimeType("application/json");
    rawFile.open("GET", file, true);
    rawFile.onreadystatechange = function() {
        if (rawFile.readyState === 4 && rawFile.status == "200") {
            callback(rawFile.responseText);
        }
    }
    rawFile.send(null);
}

function displayWebpage(rText) {
    console.log(rText);
    var date = JSON.parse(rText).date;
    var mediatype = JSON.parse(rText).media_type;
    var explanation = JSON.parse(rText).explanation;
    var title = JSON.parse(rText).title;
    document.getElementById('title').innerHTML = "APOD: " + title;
    var hdurl = JSON.parse(rText).hdurl;
    if (mediatype == "video") {
        console.log("Video!");
        var url = JSON.parse(rText).url;
        document.getElementById('video').src = url;
    } else {
        console.log("Photo");
        var url = JSON.parse(rText).hdurl;
        document.getElementById('media').src = url;
        document.getElementById('info').innerHTML = explanation;
        document.getElementById('date').innerHTML = date;
        document.getElementById('url').href = url;
        document.getElementById('url').innerHTML = "Link to Image";
    }

}

readTextFile("apikey.json", function(text) {
    var data = JSON.parse(text).key;
    console.log(data);
    var http = new XMLHttpRequest()
    var api_url = "https://api.nasa.gov/planetary/apod?api_key=" + data
    http.open("GET", api_url)
    http.send();
    http.onload = () => {
        var rText = http.responseText;
        displayWebpage(rText);
    }
});