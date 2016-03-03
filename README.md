# preditClickOpenCPU

## Upload the package to Github then...

Set up a Github webhook so changes appear on OpenCPU

![github webhook](github_webhook.png)

## OpenCPU

This package is then called by OpenCPU for predicting pageviews.

Available on

https://public.opencpu.org/ocpu/github/MarkEdmondson1234/predictClickOpenCPU/

and

https://MarkEdmondson1234.ocpu.io/predictClickOpenCPU/

See details: https://www.opencpu.org/api.html#api-ci

## To use

Test at: https://public.opencpu.org/ocpu/test/#

## Direct result

Call via a POST to:
https://MarkEdmondson1234.ocpu.io/predictClickOpenCPU/R/predictMarkov/json

with params: 

`pageview_names`
`["/example/96","/example/213","/example/107"]`

![Open CPU example](openCPUdemo.png)

### Output JSON

```
{
  "page": ["da/search/tellus/planning-map"],
  "probability": [0.9664]
}
```

## More details on request

Call via a POST without /json to:

https://public.opencpu.org/ocpu/github/MarkEdmondson1234/predictClickOpenCPU/R/predictMarkov

with params: 

`pageview_names`
`["/","site_search","/da/danmark/musik/tag-til-julekoncert"]`



Will produce a temporary session URL.

Then GET that URL:

`GET https://public.opencpu.org/ocpu/tmp/x04c642226d/R/.val`

curl:
`curl https://public.opencpu.org/ocpu/tmp/x04c642226d/R/.val/print`

```
$page
[1] "da/search/tellus/planning-map"

$probability
[1] 0.9663907
```

## Call this from JavaScript

https://www.opencpu.org/jslib.html

https://github.com/jeroenooms/opencpu.js

http://jsfiddle.net/user/opencpu/fiddles/


## GTM script

Adapted from http://jsfiddle.net/opencpu/WVWCR/ 

Install these:
```
<script src="js/jquery.js"></script>
<script src="js/opencpu.js"></script>

```

Call in GTM via:
```
<script src="//code.jquery.com/jquery-1.10.2.min.js"></script> 
<script src="//www.opencpu.org/js/archive/opencpu-0.4.js"></script>
//set CORS to call "predictClickOpenCPU" package on public server
ocpu.seturl("//public.opencpu.org/ocpu/github/MarkEdmondson1234/predictClickOpenCPU/R")

//some example data
//to run with different data, edit and press Run at the top of the page
var mydata = [
  {{from.gtm}}   
];

//call R function: predictClickOpenCPU::predictMarkov(pageview_names=mydata)
function(){
  var req = ocpu.rpc("predictMarkov", {
    pageview_names : mydata
  }, function(output){
    return(output);
  }
  
  )
};

  //optional
  req.fail(function(){
    alert("R returned an error: " + req.responseText); 
  });
```
