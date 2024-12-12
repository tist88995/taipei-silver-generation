<#ftl output_format="HTML">
<#import "/spring.ftl" as spring />
<#include "*/version.ftl" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-Hant-TW">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Access Denied</title>
    <link href="<@spring.url "/webjars/bootstrap/${bootstrapVersion}/css/bootstrap.min.css" />" rel="stylesheet"/>
    <link href="<@spring.url "/webjars/font-awesome/${fontAwesomeVersion}/css/font-awesome.min.css" />"
          rel="stylesheet"/>
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' type='text/css' rel='stylesheet'/>
</head>
<body style="background-color: #E2E2E2;">
<div class="container">
    <div class="row text-center" style="padding-top: 100px;">
        <span style="font-size: 5em;color: red;">Access Denied</span>
    </div>
</div>
</body>
</html>