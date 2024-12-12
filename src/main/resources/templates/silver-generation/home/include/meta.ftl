<#ftl output_format="HTML" />
<#global htmlEscape=true />
<#setting url_escaping_charset="UTF-8" />
<#import "/spring.ftl" as spring />
<#include "*/version.ftl" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf_parameter" content="${(_csrf.parameterName)!}"/>
<meta name="_csrf_header" content="${(_csrf.headerName)!}"/>
<meta name="_csrf" content="${(_csrf.token)!}"/>

<link rel="shortcut icon" href="<@spring.url "/css/img/favicon.ico" />"/>
<link rel="bookmark" href="<@spring.url "/css/img/favicon.ico" />"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js"></script>

<#--<link href="<@spring.url "/css/home/imagehover.css"/>" rel="stylesheet" media="all">-->
<#--<link href="<@spring.url "/css/home/style.css"/>" rel="stylesheet" type="text/css">-->
<script src="<@spring.url "/js/home/base.js" />"></script>
<script src="<@spring.url "/js/protection/csrf.js" />"></script>

<script>
    com.tist.BASE_URL = "<@spring.url "" />";
</script>
