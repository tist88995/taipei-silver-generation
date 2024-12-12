<#ftl output_format="HTML" />
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="zh-Hant-TW">

<head>
    <#include "*/include/meta.ftl" />
    <script src="<@spring.url "/js/admin/country-code.js" />"></script>
    <script>
        $(function () {
            // rules
            $('#code').rules('add', {
                alphanumeric: true
            });
            $('#sort').rules('add', {
                digits: true
            });

            // 縣市變動時尋找鄉鎮資料
            $('#city').on('change', function () {
                findTowns();
            });

            // when form1 submitting
            $('#form1').submit(function () {
                if ($('#town').val() != "") {
                    $('[name="parent.id"]').val($('#town').val());
                } else if ($('#city').val() != "") {
                    $('[name="parent.id"]').val($('#city').val());
                } else {
                    $('[name="parent.id"]').val("");
                }
            })
        })
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
                    <#if (countryCode.id)??>
                        <#assign action="/admin/country-code/update" />
                    <#else>
                        <#assign action="/admin/country-code/add" />
                    </#if>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <@tist.linkButton href="/admin/country-code/index" title="admin.button.return" />
                        </div>
                        <div class="panel-body">
                            <form id="form1" action="<@spring.url action />" method="post"
                                  class="tist-validate">
                                <input type="hidden" name="${(_csrf.parameterName)!}"
                                       value="${(_csrf.token)!}"/>
                                <@spring.formHiddenInput path="countryCode.id" />
                                <@spring.formHiddenInput path="countryCode.parent.id" />
                                <div class="form-group">
                                    <label class="col-md-2">
                                        <@spring.message "country.parent.name" />
                                    </label>
                                    <#if (countryCode.id)??>
                                        <div class="col-md-10">${(countryCode.parent.name)!}</div>
                                    <#else>
                                        <div class="col-md-5">
                                            <select id="city" class="form-control">
                                                <option value="">
                                                    <@spring.message "admin.form.select-city" />
                                                </option>
                                                <#list countryCodeList as item>
                                                    <option value="${item.id}">${item.name}</option>
                                                </#list>
                                            </select>
                                        </div>
                                        <div class="col-md-5">
                                            <select id="town" class="form-control">
                                                <option value="">
                                                    <@spring.message "admin.form.select-town" />
                                                </option>
                                            </select>
                                        </div>
                                    </#if>
                                </div>
                                <div class="form-group col-md-12 no-margin">
                                    <label class="col-md-2 required">
                                        <@spring.message "country.code" />
                                    </label>
                                    <div class="col-md-10">
                                        <@tist.text path="countryCode.code" attributes='required' />
                                    </div>
                                </div>
                                <div class="form-group col-md-12 no-margin">
                                    <label class="col-md-2 required">
                                        <@spring.message "country.name" />
                                    </label>
                                    <div class="col-md-10">
                                        <@tist.text path="countryCode.name" attributes='required' />
                                    </div>
                                </div>
                                <div class="form-group col-md-12 no-margin">
                                    <label class="col-md-2 required">
                                        <@spring.message "admin.index.sort" />
                                    </label>
                                    <div class="col-md-10">
                                        <@tist.text path="countryCode.sort" attributes='required' />
                                    </div>
                                </div>
                                <div class="form-group col-md-12 no-margin">
                                    <label class="col-md-2">
                                        <@spring.message "admin.config.disabled" />
                                    </label>
                                    <div class="col-md-10">
                                        <@tist.checkboxs path="countryCode.disabled" options=disables />
                                    </div>
                                </div>
                                <#if (countryCode.id)??>
                                    <button type="submit" class="btn btn-raised btn-info">
                                        <@spring.message "admin.button.edit" />
                                    </button>
                                <#else>
                                    <button type="submit" class="btn btn-raised btn-info">
                                        <@spring.message "admin.button.add" />
                                    </button>
                                </#if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <#include "*/include/footer.ftl" />
</div>
</body>
</html>
