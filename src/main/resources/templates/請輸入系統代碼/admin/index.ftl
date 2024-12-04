<#ftl output_format="HTML" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <#include "*/include/meta.ftl" />
</head>
<body class="hold-transition skin-blue sidebar-collapse sidebar-mini">
    <div class="wrapper">
        <#include "*/include/nav-top.ftl" />
        <#include "*/include/nav-side.ftl" />
        <div class="content-wrapper" id="content">
            <@tist.breadCrumbs />
            <section class="content">
                <div class="index container">
                    <div class="row">
<#list navMenus as navMenu>
    <#if navMenu.children?has_content>
        <#list navMenu.children as item>
            <#if item.largeIcon??>
                <div class="col-xs-6 col-sm-4 col-md-3">
                    <a href="<@spring.url item.url />"<#if item.url?contains("sso")> target="_new"</#if>>
                        <img src="<@spring.url item.largeIcon />" alt="連結至${item.label}" class="img-responsive"/>
                    </a>
                    <h4>${item.label}</h4>
                </div>
            </#if>
        </#list>
    </#if>
</#list>
			        </div>
		        </div>
                <!--con_footer-->
                <div class="con_footer">
                    <nav>
                        <ul class="pager">
                            <li><a href="#top"><i class="fa fa-long-arrow-up" aria-hidden="true"></i>Top</a></li>
                        </ul>
                    </nav>
                </div>
                <!--con_footer end-->
            </section>
        </div>
        <!-- /.content -->
        <#include "*/include/footer.ftl" />
    </div>
</body>
</html>