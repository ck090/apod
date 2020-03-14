var app = new Vue({
    el: '#app',
    data: {
        message: 'Hello Vue!',
        rText: ''
    },
    mounted: function() {
        this.displayWebPage()
    },
    methods: {
        displayWebPage: function() {
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
            readTextFile("apikey.json", function(text) {
                var data = JSON.parse(text).key;
                console.log(data);
                var http = new XMLHttpRequest()
                var api_url = "https://api.nasa.gov/planetary/apod?api_key=" + data
                http.open("GET", api_url)
                http.send();
                http.onload = () => {
                    this.rText = http.responseText;
                    console.log(rText);
                }
            });
        }
    }
})