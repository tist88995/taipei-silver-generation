<#ftl output_format="HTML" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-Hant-TW">
<head>
    <#include "*/include/meta.ftl" />
    <script src="<@spring.url "/js/admin/department.js" />"></script>
    <script>
        parentIds = ["${(parentIds![""])?join("\",\"")?no_esc}"];
        lockDepartmentParent = ${lockDepartmentParent!"false"};
        showPlaceholder = <#if authorityHelper.manager>true<#else>false</#if>;
    </script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <#include "*/include/nav-top.ftl" />
    <#include "*/include/nav-side.ftl" />
    <div class="content-wrapper" id="content">
        <@tist.breadCrumbs />
        <section class="content">
            <div class="con_main container">
                <div class="con-box">
                    <#if (department.id)??>
                        <#assign action="/admin/department/update" />
                    <#else>
                        <#assign action="/admin/department/add" />
                    </#if>
                    <form role="form" action="<@spring.url action />" method="POST"
                          enctype="multipart/form-data" class="tist-validate">
                        <input type="hidden" name="${(_csrf.parameterName)!}"
                               value="${(_csrf.token)!}"/>
                        <@spring.formHiddenInput path="department.id" />
                        <@spring.formHiddenInput path="department.parent.id" />
                        <ul class="nav nav-tabs">
                            <li class="active">
                                <!--<a href="#">
		                                <@tist.currentMenuName />
		                            </a>-->
                            </li>
                        </ul>
                        <div class="con_main col-md-12">
                            <div class="form-group col-md-12">
                                <label class="col-md-2">
                                    <@spring.message "department.parent" />
                                </label>
                                <div id="parentContainer" class="col-md-10">
                                    <#if (lockDepartmentParent!"false") == "true" >${department.parent.name!}</#if>
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="col-md-2 required">
                                    <@spring.message "department.no" />
                                </label>
                                <div class="col-md-10">
                                    <@tist.text path="department.no" attributes='required' />
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="col-md-2 required">
                                    <@spring.message "department.name" />
                                </label>
                                <div class="col-md-10">
                                    <@tist.text path="department.name" attributes='required' />
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="col-md-2 required">
                                    <@spring.message "department.type" />
                                </label>
                                <div class="col-md-10">
                                    <@tist.checkboxs path="department.types" options=types attributes="required" />
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="col-md-2">
                                    <@spring.message "department.address" />
                                </label>
                                <div class="col-md-10">
                                    <@tist.address cityPath="department.city.id" townPath="department.town.id" villagePath="department.village.id" addressPath="department.address" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <#if (department.id)??>
                                    <button type="submit" class="btn btn-raised btn-info">
                                        <@spring.message "admin.button.edit" />
                                    </button>
                                <#else>
                                    <button type="submit" class="btn btn-raised btn-info">
                                        <@spring.message "admin.button.add" />
                                    </button>
                                </#if>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
    <#include "*/include/footer.ftl" />
</div>
</body>
</html>
