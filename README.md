# preditClickOpenCPU

To be called by OpenCPU for predicting pageviews

Available on

https://public.opencpu.org/ocpu/github/MarkEdmondson1234/predictClickOpenCPU/

and

https://MarkEdmondson1234.ocpu.io/predictClickOpenCPU/

See details: https://www.opencpu.org/api.html#api-ci

## To use

Test at: https://public.opencpu.org/ocpu/test/#

Call via a POST to:

https://public.opencpu.org/ocpu/github/MarkEdmondson1234/predictClickOpenCPU/R/predictMarkov

with params: 

`pageview_names`
`["/","site_search","/da/danmark/musik/tag-til-julekoncert"]`

![Open CPU example](openCPUdemo.png)

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


