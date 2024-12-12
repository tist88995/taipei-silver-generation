<#ftl output_format="HTML" />
<#-- Main Header -->
<header class="main-header">
    <#-- Logo -->
    <a href="<@spring.url '/admin/index' />" class="logo" title="${adminConfig.systemName!}(回首頁)">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>選單</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg">${adminConfig.systemName!}</span>
    </a>
    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"> <span
                    class="sr-only">切換導航</span> </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- User Account Menu -->
                <li class="dropdown user user-menu">
                    <!-- Menu Toggle Button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" title="登入人員下拉選單切換">
                        <#-- The user image in the navbar-->
                        <i class="fa fa-user">&nbsp;</i>
                        <#-- hidden-xs hides the username on small devices so only the image appears. -->
                        <span class="hidden-xs">${(currentUser.name)!}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <#-- The user image in the menu -->
                        <li class="user-header">
                            <i class="fa fa-user fa-5x text-info" aria-hidden="true"></i>
                            <p>
                                ${(currentUser.name)!}
                                <small>登入時間:${(currentUser.lastLoginTime)!}</small>
                            </p>
                        </li>
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="<@spring.url "/admin/profile" />"
                                   class="btn btn-block btn-info" title="基本資料">基本資料</a>
                            </div>
                            <div class="pull-right">
                                <form action="<@spring.url "/admin/logout" />" method="post">
                                    <input type="hidden" name="${(_csrf.parameterName)!}"
                                           value="${(_csrf.token)!}"/>
                                    <button type="submit" class="btn btn-block btn-danger"
                                            title="登出">登出
                                    </button>
                                </form>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>
