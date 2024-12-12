<#ftl output_format="HTML" />
<#global htmlEscape=true />
<#setting url_escaping_charset="UTF-8" />
<#import "/spring.ftl" as spring />
<#import "tist.ftl" as tist />
<#include "*/version.ftl" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>臺北市銀髮族服務方案補助平台</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
      name="viewport">
<meta name="_csrf_parameter" content="${(_csrf.parameterName)!}"/>
<meta name="_csrf_header" content="${(_csrf.headerName)!}"/>
<meta name="_csrf" content="${(_csrf.token)!}"/>

<link href="<@spring.url "/webjars/bootstrap/${bootstrapVersion}/css/bootstrap.min.css" />" rel="stylesheet"/>
<link href="<@spring.url "/webjars/font-awesome/${fontAwesomeVersion}/css/font-awesome.min.css" />" rel="stylesheet"/>
<link href="<@spring.url "/webjars/ionicons/${ioniconsVersion}/css/ionicons.min.css" />" rel="stylesheet"/>
<link href="<@spring.url "/webjars/jstree/${jstreeVersion}/themes/default/style.min.css" />" rel="stylesheet"/>
<link href="<@spring.url "/webjars/fontawesome-iconpicker/${fontawesomeIconpickerVersion}/dist/css/fontawesome-iconpicker.min.css" />"
      rel="stylesheet"/>

<link href="<@spring.url "/css/libs/bootstrap-fileupload/2.3.1/bootstrap-fileupload.min.css" />" rel="stylesheet"/>
<link href="<@spring.url "/css/libs/bootstrap-datepicker/2.0/datepicker.css" />" rel="stylesheet"/>
<link href="<@spring.url "/css/libs/bootstrap-clockpicker/0.0.7/bootstrap-clockpicker.min.css" />" rel="stylesheet"/>
<link href="<@spring.url "/css/admin/AdminTIST.min.css" />" rel="stylesheet"/>
<link href="<@spring.url "/css/admin/skin-blue-green.css" />" rel="stylesheet"/>
<link href="<@spring.url "/css/admin/style.css" />" rel="stylesheet"/>
<link href="<@spring.url "/css/admin/base.css" />" rel="stylesheet"/>
<link href="<@spring.url "/css/admin/style-plus.css" />" rel="stylesheet"/>

<script src="<@spring.url "/webjars/jquery/${jqueryVersion}/jquery.min.js" />"></script>
<script src="<@spring.url "/webjars/bootstrap/${bootstrapVersion}/js/bootstrap.min.js" />"></script>
<script src="<@spring.url "/webjars/jquery-validation/${jqueryValidationVersion}/dist/jquery.validate.min.js" />"></script>
<script src="<@spring.url "/webjars/jquery-validation/${jqueryValidationVersion}/dist/additional-methods.min.js" />"></script>
<script src="<@spring.url "/webjars/jquery-validation/${jqueryValidationVersion}/src/localization/messages_zh_TW.js" />"></script>
<script src="<@spring.url "/webjars/jstree/${jstreeVersion}/jstree.min.js" />"></script>
<script src="<@spring.url "/webjars/bootstrap-notify/${bootstrapNotifyVersion}/bootstrap-notify.min.js" />"></script>
<script src="<@spring.url "/webjars/fontawesome-iconpicker/${fontawesomeIconpickerVersion}/dist/js/fontawesome-iconpicker.min.js" />"></script>
<script src="<@spring.url "/webjars/ckeditor/${ckeditorVersion}/standard/ckeditor.js" />"></script>
<script src="<@spring.url "/webjars/js-cookie/${jsCookieVersion}/js.cookie.js" />"></script>


<script src="<@spring.url "/js/libs/bootstrap-fileupload/2.3.1/bootstrap-fileupload.js" />"></script>
<script src="<@spring.url "/js/libs/bootstrap-datepicker/2.0/bootstrap-datepicker.js" />"></script>
<script src="<@spring.url "/js/libs/bootstrap-datepicker/2.0/locales/bootstrap-datepicker.zh-TW.js" />"></script>
<script src="<@spring.url "/js/libs/bootstrap-clockpicker/0.0.7/bootstrap-clockpicker.js" />"></script>
<script src="<@spring.url "/js/admin/app.min.js" />"></script>
<script src="<@spring.url "/js/admin/validate.js" />"></script>
<script src="<@spring.url "/js/admin/base.js" />"></script>

<!--[if le IE 9]-->
<script src="<@spring.url "/js/admin/ie-compitable.js" />"></script>
<script src="<@spring.url "/webjars/html5shiv/${html5shivVersion}/html5shiv.min.js" />"></script>
<script src="<@spring.url "/webjars/respond/${respondVersion}/dest/respond.min.js" />"></script>
<!--[endif]-->
<script>
    com.tist.BASE_URL = "<@spring.url "" />";
</script>
<script src="<@spring.url "/js/protection/csrf.js" />"></script>