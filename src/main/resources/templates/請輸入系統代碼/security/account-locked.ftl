<#ftl output_format="HTML" />
<#import "/spring.ftl" as spring />
<#include "/version.ftl" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>台灣資服系統框架</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="<@spring.url "/webjars/bootstrap/${bootstrapVersion}/css/bootstrap.min.css" />" rel="stylesheet"/>
    <link href="<@spring.url "/webjars/font-awesome/${fontAwesomeVersion}/css/font-awesome.min.css" />"
          rel="stylesheet"/>
    <link rel="stylesheet" href="<@spring.url "/css/admin/AdminTIST.min.css" />">
    <link rel="stylesheet" href="<@spring.url "/css/admin/skin-drak-green.css" />">
    <link href="<@spring.url "/css/admin/style.css" />" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
    <script src="<@spring.url "/webjars/html5shiv/${html5shivVersion}/html5shiv.min.js" />"></script>
    <script src="<@spring.url "/webjars/respond/${respondVersion}/dest/respond.min.js" />"></script>
    <![endif]-->
    <script src="<@spring.url "/webjars/jquery/${jqueryVersion}/jquery.min.js" />"></script>
</head>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <p><img src="<@spring.url "/css/images/logo.png" />"></p>
        <p><strong>${adminConfig.systemName!}</strong></p>
    </div>
    <div class="login-box-body">
        <div class="box-body">
            <div id="message" class="text-danger">${(Session.SPRING_SECURITY_LAST_EXCEPTION)!}</div>
        </div>
    </div>
</div>
<footer class="login-footer text-center">
    <strong>Copyright &copy; 2017 <a href="http://www.tist.com.tw/" title="台灣資服股份有限公司"
                                     target="_blank">台灣資服股份有限公司</a>.</strong> All rights reserved.
</footer>
</body>

</html>
