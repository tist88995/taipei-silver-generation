<#ftl output_format="HTML" />
<aside class="main-sidebar">
    <section class="sidebar">
        <ul class="sidebar-menu">
            <#list navMenus as navMenu>
                <li class="treeview<#if navMenu.selected> active</#if>">
                    <a href="<#if (navMenu.url)??><@spring.url "${(navMenu.url)!}" /><#else>#</#if>"><i class="fa fa-${(navMenu.icon)!}"></i> <span>${(navMenu.label)!}</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <#if navMenu.children?has_content>
                        <ul class="treeview-menu">
                            <#list navMenu.children as item>
                                <li>
                                    <a href="<#if (item.url)??><@spring.url "${(item.url)!}" /><#else>#</#if>">
                                        <i class="fa fa-${(item.icon)!}"></i>${(item.label)!}
                                    </a>
                                </li>
                            </#list>
                        </ul>
                    </#if>
                </li>
            </#list>
        </ul>
    </section>
</aside>
