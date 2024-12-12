<#ftl output_format="HTML" />
<#import "/spring.ftl" as spring />
<#include "*/version.ftl" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-Hant-TW">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>臺北市銀髮族服務方案補助平台</title>
    <meta name="_csrf_parameter" content="${(_csrf.parameterName)!}"/>
    <meta name="_csrf_header" content="${(_csrf.headerName)!}"/>
    <meta name="_csrf" content="${(_csrf.token)!}"/>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
          name="viewport">
    <link href="<@spring.url "/webjars/bootstrap/${bootstrapVersion}/css/bootstrap.min.css" />" rel="stylesheet"/>
    <link href="<@spring.url "/webjars/font-awesome/${fontAwesomeVersion}/css/font-awesome.min.css" />"
          rel="stylesheet"/>
    <link rel="stylesheet" href="<@spring.url "/css/admin/AdminTIST.min.css" />">
    <link rel="stylesheet" href="<@spring.url "/css/admin/skin-blue-green.css" />">

    <link href="<@spring.url "/css/admin/style.css" />" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]>
    <script src="<@spring.url "/webjars/html5shiv/${html5shivVersion}/html5shiv.min.js" />"> </script>
    <script src="<@spring.url "/webjars/respond/${respondVersion}/dest/respond.min.js" />"></script>
    <![endif]-->
    <script src="<@spring.url "/webjars/jquery/${jqueryVersion}/jquery.min.js" />"></script>
    <script src="<@spring.url "/webjars/bootstrap-notify/${bootstrapNotifyVersion}/bootstrap-notify.min.js" />"></script>
    <script src="<@spring.url "/js/protection/csrf.js" />"></script>
    <script>
        var com = com || {};
        com.tist = com.tist || {};
        com.tist.BASE_URL = "<@spring.url "" />";
        refreshKaptcha = function () {
            document.getElementById('kaptcha')
                .setAttribute('src', com.tist.BASE_URL + '/images/kaptcha.jpg?t=' + new Date().getTime());
        }
    </script>
</head>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <p><strong>${adminConfig.systemName!}</strong></p>
    </div>
    <div class="login-box-body">
        <form id="form1" action="<@spring.url "/security/forgot-password" />" method="post"
              class="tist-validate">
            <input type="hidden" name="${(_csrf.parameterName)!}" value="${(_csrf.token)!}"/>
            <div class="box-body">
                <div class="form-group has-feedback">
                    <label for="user"><strong>帳號</strong></label>
                    <@spring.formInput path="main.userId" attributes=' class="form-control"' />
                    <@spring.formHiddenInput path="main.name" attributes='value="name" class="form-control"' />
                </div>
                <div class="form-group has-feedback">
                    <label for="password"><strong>信箱</strong></label>
                    <@spring.formInput path="main.email" attributes=' class="form-control"' />
                </div>
                <div class="form-group has-feedback">
                    <label for="pwd">圖形驗證碼</label>
                    <a type="button" onclick="refreshKaptcha()" class="btn btn-sm">
                        <i class="fa fa-refresh"></i>
                    </a>
                    <p class="textGrp captcha">
                        <img id="kaptcha" src="<@spring.url "/images/kaptcha.jpg"/>" alt="驗證碼">
                        <input type="text" id="pwd" name="kaptcha" placeholder="請輸入驗證碼">
                    </p>
                </div>
                <#if invalidInput??>
                    <div class="form-group"><strong>${invalidInput}</strong></div>
                </#if>
                <#if invalidInput?? && invalidInput=="">
                    <div class="form-group"><strong>請於30分鐘內至信箱收取相關資訊</strong></div>
                </#if>
                <button type="submit" class="btn btn-block btn-info">重設密碼</button>
            </div>
        </form>
    </div>
</div>
<footer class="login-footer text-center">
</footer>
</body>

</html>