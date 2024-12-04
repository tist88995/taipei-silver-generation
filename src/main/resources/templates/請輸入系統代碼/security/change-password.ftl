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
    <script src="<@spring.url "/webjars/bootstrap/${bootstrapVersion}/js/bootstrap.min.js" />"></script>
    <script src="<@spring.url "/webjars/jquery-validation/${jqueryValidationVersion}/dist/jquery.validate.min.js" />"></script>
    <script src="<@spring.url "/webjars/jquery-validation/${jqueryValidationVersion}/dist/additional-methods.min.js" />"></script>
    <script src="<@spring.url "/webjars/jquery-validation/${jqueryValidationVersion}/src/localization/messages_zh_TW.js" />"></script>
    <script src="<@spring.url "/js/admin/validate.js" />"></script>
    <script>
        $(function () {
            $("form").validate({
                errorClass: "text-danger",
                ignore: [":disabled"]
            });
        });
    </script>
    <#include "*/admin/include/password-config.ftl" />
</head>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <p><img src="<@spring.url "/css/images/logo.png" />"></p>
        <p><strong>${adminConfig.systemName!}</strong></p>
    </div>
    <div class="login-box-body">
        <form role="form" action="<@spring.url "/security/change-password" />" method="post">
            <div class="box-body">
                <div class="form-group has-feedback">
                    <label for="password"><strong>舊密碼</strong></label>
                    <input type="password" name="oldPassword" value="" class="form-control" required
                           placeholder="請輸入舊密碼" autocomplete="off"/>
                </div>
                <div class="form-group has-feedback">
                    <label for="password"><strong>新密碼</strong></label>
                    <input type="password" name="password" value="" class="form-control" required placeholder="請輸入新密碼"
                           autocomplete="off"/>
                </div>
                <div class="form-group has-feedback">
                    <label for="password"><strong>新密碼確認</strong></label>
                    <input type="password" name="passwordConfirm" value="" class="form-control" required
                           placeholder="請輸入新密碼" autocomplete="off"/>
                </div>
                <div class="form-group has-feedback">
                    <input type="submit" class="btn btn-primary btn-block" value="確定"/>
                </div>
                <input type="hidden" name="${(_csrf.parameterName)!}" value="${(_csrf.token)!}"/>
                <div id="message" class="text-danger">${(Session.SPRING_SECURITY_LAST_EXCEPTION)!}</div>
            </div>
            <!--
            <div class="row">
                <div class="col-xs-12 text-right"><a href="#"><i class="fa fa-question-circle" aria-hidden="true"></i> 忘記密碼</a></div>
            </div>
            -->
        </form>
    </div>
</div>
<footer class="login-footer text-center">
    <strong>Copyright &copy; 2017 <a href="http://www.tist.com.tw/" title="台灣資服股份有限公司"
                                     target="_blank">台灣資服股份有限公司</a>.</strong> All rights reserved.
</footer>
</body>

</html>
