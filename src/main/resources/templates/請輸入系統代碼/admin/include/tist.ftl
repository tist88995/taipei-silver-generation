<#ftl output_format="HTML" />
<#assign seqId=0 />
<#--
 * breadCrumbs
 * 
 * 後台麵包屑
 * 
 * @param title 標題
 *
-->
<#macro breadCrumbs returnLink="">
<section class="content-header">
    <#if returnLink != "" >
        <a href="<@spring.url returnLink />" class="btn btn-info">回列表</a>
    </#if>
    <@currentBreadCrumb items=navMenus />
    <ol class="breadcrumb">
        <li><a href="<@spring.url "/admin/index" />" title="回首頁"><i class="fa fa-home fa-fw"></i>首頁</a>
        </li>
        <#if (navMenus)??>
            <@renderbreadCrumb items=navMenus />
        </#if>
    </ol>
</section>
</#macro>
<#macro renderbreadCrumb items>
    <#list items as item>
        <#if item.selected>
            <#if (item.children)?? && item.children?has_content>
                <#if (item.url)??>
                <li><a href="<@spring.url item.url />">${(item.label)!}</a></li>
                <#else>
                <li>${(item.label)!}</li>
                </#if>
                <@renderbreadCrumb items=item.children />
            <#else>
            <li class="active">${(item.label)!}</li>
            </#if>
            <#return />
        </#if>
    </#list>
</#macro>
<#macro currentBreadCrumb items>
    <#list items as item>
        <#if item.selected>
            <#if (item.children)?? && item.children?has_content>
                <@currentBreadCrumb items=item.children />
                <#return />
            <#else>
            <h1><strong><i class="fa fa-chevron-circle-right"
                           aria-hidden="true"></i>${(item.label)!}</strong></h1>
                <#return />
            </#if>
        </#if>
    </#list>
</#macro>
<#--
 * currentMenuName
 * 
 * 目前選單名稱
 * 
 *
-->
<#macro currentMenuName >
    <#if (navMenus)??>
        <@renderLastSelectedItem items=navMenus />
    </#if>
</#macro>

<#macro renderLastSelectedItem items>
    <#list items as item>
        <#if item.selected>
            <#if (item.children)?? && item.children?has_content>
                <@renderLastSelectedItem items=item.children />
            <#else>
                ${(item.label)!}
            </#if>
        </#if>
    </#list>
</#macro>
<#--
 * linkButton
 * 
 * 按鈕樣式的連結
 *
 * @param href 連結
 * @param title i18n標題的key
-->
<#macro linkButton href="" title="">
<a href="<@spring.url href />" class="btn btn-raised btn-info no-margin"
   title="<@spring.message title />"><@spring.message title /></a>
</#macro>

<#--
 * text
 *
 * 後台 form text input，直接設定Bootstrap樣式與整合驗證錯誤訊息
-->
<#macro text path attributes="" class="">
    <@spring.formInput path=path attributes=attributes+' class="form-control ${class}"' />
    <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
</#macro>

<#--
 * textarea
 *
 * 後台 form textarea，直接設定Bootstrap樣式與整合驗證錯誤訊息
-->
<#macro textarea path attributes="" class="">
    <@spring.bind path/>
    <textarea id="${spring.status.expression?replace('[','')?replace(']','')}"
              name="${spring.status.expression}" ${attributes?no_esc} class="form-control ${class}">${spring.status.actualValue!""}</textarea>
    <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
</#macro>

<#--
 * password
 *
 * 後台 form password input，直接設定Bootstrap樣式與整合驗證錯誤訊息
-->
<#macro password path attributes="" class="">
    <@spring.formPasswordInput path=path attributes=attributes+' class="form-control ${class}"' />
    <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
</#macro>

<#--
 * number
 *
 * 後台 form number input，直接設定Bootstrap樣式與整合驗證錯誤訊息
-->
<#macro number path min="" max="" attributes="" class="">
    <#if min?has_content && max?has_content>
        <@spring.formInput path=path attributes=attributes + ' min="' + min +'" max="' + max + '" class="form-control ${class}"' fieldType="number" />
    <#elseif min?has_content>
        <@spring.formInput path=path attributes=attributes + ' min="' + min + '" class="form-control ${class}"' fieldType="number" />
    <#elseif max?has_content>
        <@spring.formInput path=path attributes=attributes + ' max="' + max + '" class="form-control ${class}"' fieldType="number" />
    <#else>
        <@spring.formInput path=path attributes=attributes + ' class="form-control ${class}"' fieldType="number" />
    </#if>
    <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
</#macro>

<#--
 * singleSelect
 * 
 * 單選下拉選單
-->
<#macro singleSelect path options attributes="" class="">
    <@spring.bind path=path />
    <#if options?size == 0 && spring.status.value?? >
        <#local options={spring.status.value:""} />
    </#if>
<div class="selectBtn">
    <@spring.formSingleSelect path=path options=options attributes=attributes+' class="form-control ${class}" style="width:auto"'/>
</div>
    <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
</#macro>

<#--
 * checkboxs
 *
 * 後台 form checkboxs input，直接設定Bootstrap樣式與整合驗證錯誤訊息
-->
<#macro checkboxs path options separator="" attributes="" >
    <@spring.bind path/>
<div class="checkbox no-margin">
    <#list options?keys as value>
        <#assign isSelected = spring.status.value?default("")?contains(value)>
        <#assign seqId++ />
        <input type="checkbox" name="${spring.status.expression}"
               id="${spring.status.expression}_${seqId}" value="${value}"
               <#if isSelected>checked="checked"</#if> ${attributes}/>
        <label for="${spring.status.expression}_${seqId}"
               class="checkbox-inline">${options[value]}</label>

        ${separator}
    </#list>
</div>
    <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
</#macro>

<#--
 * checkbox
 *
 * 後台 form checkboxs input，直接設定Bootstrap樣式與整合驗證錯誤訊息
-->
<#macro checkbox path key value attributes="">
    <@spring.bind path/>
    <#assign isSelected = (spring.status.value!"" == key)>
    <#assign seqId++ />
<input type="checkbox" name="${spring.status.expression}" id="${spring.status.expression}_${seqId}"
       value="${key}"
       <#if isSelected>checked="checked"</#if> ${attributes}/>
<label for="${spring.status.expression}_${seqId}" class="checkbox-inline">${value}</label>
    <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
</#macro>

<#--
 * radioButtons
 *
 * 後台 form radio input，直接設定Bootstrap樣式與整合驗證錯誤訊息
-->
<#macro radioButtons path options separator="" attributes="">
    <@spring.bind path/>
<div class="radioBtn">
    <#list options?keys as value>
        <#assign seqId++ />
        <input type="radio" name="${spring.status.expression}"
               id="${spring.status.expression}_${seqId}" value="${value}"
               <#if (spring.status.value)?? && spring.status.value == value>checked="checked"</#if> ${attributes}/>
        <label for="${spring.status.expression}_${seqId}"
               class="radio-inline">${options[value]}</label>
        ${separator}
    </#list>
</div>
    <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
</#macro>

<#macro switchBox path options separator="" attributes="" iconClass="">
    <@spring.bind path/>
<div class="btn-group" data-toggle="buttons">
    <#list options?keys as value>
        <label for="${spring.status.expression}_${seqId}"
               class="btn btn-primary <#if (spring.status.value)?? && spring.status.value == value>active</#if>">
            <input type="radio" name="${spring.status.expression}"
                   id="${spring.status.expression}_${seqId}" value="${value}"
                   <#if (spring.status.value)?? && spring.status.value == value>checked="checked"</#if> ${attributes}/>
            <#if iconClass = "">${options[value]}<#else><i
                    class="${iconClass}">${options[value]}</i></#if>
        </label>
    </#list>
</div>
</#macro>

<#--
 * singleFile
 *
 * 後台 單檔上傳
-->
<#macro singleFile path attributes="">
<div class="fileupload fileupload-new" data-provides="fileupload">
    <@spring.bind path/>
    <#if (spring.status.value)??>
        <#assign attachId=spring.status.value />
        <@spring.bind path+".name"/>
        <#assign attachName=spring.status.value />
        <a href="<@spring.url "/admin/attach/${attachId}" />" class="btn btn-raised btn-success"
           target="_new">
            <#if attributes?contains("image/") >
                <img class="img-responsive" width="150"
                     src="<@spring.url "/admin/attach/${attachId}" />"/>
            <#else>
                ${attachName}
            </#if>
            <button type="button" class="close delete-file" style="float: none;">×</button>
        </a>
        <@spring.formHiddenInput path=path+".id" />
        <@spring.formHiddenInput path=path+".deleted" />
    <#else>
        <@spring.bind path+".name"/>
        <#assign attachName=(spring.status.value)! />
        <span class="bg-info">${attachName!}</span>
    </#if>
    <span class="btn btn-raised btn-file btn-default">
    <span class="fileupload-new"><@spring.message "admin.file-upload.new" /></span>
    <span class="fileupload-exists"><@spring.message "admin.file-upload.exists" /></span>
        <@spring.formInput path=path+".file" fieldType="file" attributes=attributes/>
    </span>
    <span class="fileupload-preview"></span>
    <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none">×</a>
</div>
</#macro>

<#--
 * multiFile
 *
 * 後台 多檔上傳
-->
<#macro multiFile path attributes="">
    <@spring.bind path/>
    <#if (spring.status.actualValue)?? && spring.status.actualValue?is_sequence && spring.status.actualValue?has_content>
        <#local files=spring.status.actualValue />
    <#else>
        <#local files=[{}]/>
    </#if>
    <#list files as file>
        <@singleFile path=path+"["+file_index+"]" attributes=attributes />
    </#list>
<button type="button"
        class="btn btn-raised btn-sm btn-info tist-more-file"><@spring.message "admin.button.more-file" /></button>
</#macro>

<#--
 * path
 * attributes
 * 
 * 日期輸入框
-->
<#macro dateText path attributes="">
<div class="input-group date date-picker pull-left">
    <@spring.bind path/>
    <#local flashDate=(spring.status.actualValue)! />
    <input type="text" name="${spring.status.expression}" value="${flashDate}" ${attributes}
           class="form-control"/>
    <label for="${spring.status.expression}" class="input-group-addon">
        <i class="glyphicon glyphicon-calendar"></i>
    </label>
    <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
</div>
</#macro>

<#--
 * path
 * attributes
 *
 * 時間輸入框
-->
<#macro clockPicker path attributes="">
<div class="input-group clock-picker">
    <@spring.bind path/>
    <#local flashTime=(spring.status.actualValue)! />
    <input type="text" name="${spring.status.expression}" value="${flashTime}" ${attributes}
           class="form-control"/>
    <span class="input-group-addon">
        <i class="glyphicon glyphicon-time"></i>
    </span>
</div>
</#macro>

<#--
 * pagination
 *
 * 跳頁
-->
<#macro pagination page>
    <#if (page.totalElements > 0) >
    <ul class="pagination">
        <li <#if page.first>class="disabled"</#if>><a href="#">&laquo;</a></li>
        <#if (page.number > 4)>
            <li><a href="#">1</a></li>
        </#if>
        <#list page.number-4 .. page.number +4 as pageNumber>
            <#if (pageNumber >= 0 && pageNumber < page.totalPages)>
                <li<#if page.number == pageNumber> class="active"</#if>><a
                        href="#">${pageNumber+1}</a></li>
            </#if>
        </#list>
        <#if (page.number < page.totalPages -5)>
            <li><a href="#">${page.totalPages}</a></li>
        </#if>
        <li <#if page.last>class="disabled"</#if>><a href="#">&raquo;</a></li>
        <li>
        <span>
        &nbsp;<@spring.message "admin.page.total" /><span class="badge">${page.totalElements}</span>
        </span>

        </li>
    </ul>
    <input type="hidden" name="page" value="${page.number}"/>
    <input type="hidden" name="size" value="${page.size}"/>
    </#if>
</#macro>

<#--
 * address
 *
 * 地址欄位
-->
<#macro address cityPath townPath="" villagePath="" linPath="" addressPath="" attributes="">
    <@singleSelect path=cityPath options=[] class="tist-city-combo pull-left" attributes=attributes />
    <#if attributes?contains("disabled")>
        <@spring.formHiddenInput path=cityPath />
    </#if>
    <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
    <#if townPath != "">
        <@singleSelect path=townPath options=[] class="tist-town-combo pull-left" attributes=attributes />
        <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
        <#if attributes?contains("disabled")>
            <@spring.formHiddenInput path=townPath />
        </#if>
    </#if>
    <#if villagePath != "">
        <@singleSelect path=villagePath options=[] class="tist-village-combo pull-left" attributes=attributes />
        <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
        <#if attributes?contains("disabled")>
            <@spring.formHiddenInput path=villagePath />
        </#if>
    </#if>
    <#if linPath != "">
    <div class="input-group col-md-2">
        <@spring.formInput path=linPath attributes=attributes+' class="form-control pull-left tist-lin"' />
        <#if attributes?contains("disabled")>
            <@spring.formHiddenInput path=linPath />
        </#if>
        <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
        <span class="input-group-addon">鄰</span>
    </div>
    </#if>
    <#if addressPath!= "">
        <@spring.formInput path=addressPath attributes=attributes+' class="form-control pull-left tist-addr"' />
        <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
        <#if attributes?contains("disabled")>
            <@spring.formHiddenInput path=addressPath />
        </#if>
    </#if>
</#macro>

<#--
 * crudButtons
 *
 * 建置作業主頁按鈕
-->
<#macro crudButtons prefix actions=[]>
    <#if actions?seq_contains("add")>
    <a href="<@spring.url "${prefix}/add" />" class="btn btn-raised btn-primary"
       title="<@spring.message "admin.button.add" />">
        <@spring.message "admin.button.add" />
    </a>
    </#if>
    <#if actions?seq_contains("search")>
    <button type="submit" class="btn btn-raised btn-success" formaction="<@spring.url prefix />">
        <@spring.message "admin.button.search" />
    </button>
    </#if>
    <#if actions?seq_contains("export")>
    <button type="submit" class="btn btn-raised btn-info"
            formaction="<@spring.url "${prefix}/export" />">
        <@spring.message "admin.button.export" />
    </button>
    </#if>
    <#if actions?seq_contains("import")>
    <a href="<@spring.url "${prefix}/import" />" class="btn btn-raised btn-warning">
        <@spring.message "admin.button.import" />
    </a>
    </#if>
</#macro>

<#--
 * baseRowButtons
 *
 * 查詢列表操作功能鈕
-->
<#macro baseRowButtons updateUrl="" reportUrl="" deleteUrl="" >
    <#if updateUrl != "">
    <button type="button" class="btn btn-sm btn-raised btn-primary no-margin"
            onclick="location.href='<@spring.url updateUrl />'">
        <i class="glyphicon glyphicon-edit"></i>
        <@spring.message "admin.button.edit" />
    </button>
    </#if>
    <#if reportUrl != "">
    <!--<button type="button" class="btn btn-sm btn-raised btn-info no-margin" onclick="location.href='<@spring.url reportUrl />'">
        <i class="glyphicon glyphicon-print"></i>
        <@spring.message "admin.button.report" />
    </button>-->
    </#if>
    <#if deleteUrl != "" && authorityHelper.manager >
    <button type="button" class="btn btn-sm btn-raised btn-danger delete-item no-margin"
            formaction="<@spring.url deleteUrl />">
        <i class="glyphicon glyphicon-remove"></i>
        <@spring.message "admin.button.delete" />
    </button>
    </#if>
</#macro>

<#macro noResult>
<div class="alert alert-dismissible alert-warning ">
    <button type="button" class="close" data-dismiss="alert">×</button>
    <h4><@spring.message "admin.index.no-result" /></h4>
</div>
</#macro>

<#macro processButtons baseUrl appHelp >
    <#if permitHelper.isGrantedModifyPermissionFor(appHelp)>
    <button formaction="<@spring.url "${baseUrl}/add" />" type="submit"
            class="btn btn-raised btn-info">暫存
    </button>
    </#if>
    <#if appHelp.allowResendToTownshipOffice >
    <button formaction="<@spring.url "${baseUrl}/send-township-office" />" type="submit"
            class="btn btn-raised btn-info">補件重送
    </button>
    </#if>
    <#if appHelp.allowSendToTownshipOffice>
    <button formaction="<@spring.url "${baseUrl}/send-township-office" />" type="submit"
            class="btn btn-raised btn-info save-send">儲存並送件
    </button>
    </#if>
    <#if appHelp.allowTownshipAgree >
    <button formaction="<@spring.url "${baseUrl}/send-central-gov" />" type="submit"
            class="btn btn-raised btn-success send-gov">拋轉
    </button>
    <button formaction="<@spring.url "${baseUrl}/township-office-agree" />" type="submit"
            class="btn btn-raised btn-success close-case">結案
    </button>
    </#if>
    <#if appHelp.allowTownshipReject >
    <!--<button formaction="<@spring.url "${baseUrl}/township-office-reject" />" type="submit" class="btn btn-raised btn-danger">退件</button>-->
    </#if>
</#macro>

<#macro employee departmentPath employeePath attributes="">
    <@singleSelect path=departmentPath options=[] class="tist-department-combo pull-left" attributes=attributes />
    <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
    <@singleSelect path=employeePath options=[] class="tist-employee-combo pull-left" attributes=attributes />
    <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
</#macro>

<#macro answerOptionIsSelected feedback answerIndex optionId outPut>
    <#if (feedback)??>
        <#if feedback.answers?has_content>
            <#if feedback.answers[answerIndex].options?has_content>
                <#if (feedback.answers[answerIndex].options[0].id)??>
                    <#if feedback.answers[answerIndex].options[0].id == optionId>${outPut}</#if>
                </#if>
            </#if>
        </#if>
    </#if>
</#macro>

<#macro locationSingleSelect path options headerLabel headerValue="" attributes="">
    <@spring.bind path/>
    <#assign id = spring.status.expression>
    <#if id == "">
    <select id="${spring.status.expression}" name="${spring.status.expression}" ${attributes}>
    <#else>
    <select id="${id}" name="${spring.status.expression}" ${attributes}>
    </#if>
    <#if headerLabel??>
        <option value="${headerValue}">${headerLabel}</option>
    </#if>
    <#if options?size gt 0>
        <#if spring.status.value?? && spring.status.value?is_boolean>
            <#assign stringStatusValue = spring.status.value?string>
        <#else>
            <#assign stringStatusValue = spring.status.value!"">
        </#if>
        <#if (stringStatusValue)??>
            <#list options?keys as value>
                <option value="${value}"<@spring.checkSelected value />>${options[value]}</option>
            </#list>
        <#else>
            <#list options?keys as val>
                <option value="${value}">${options[value]}</option>
            </#list>
        </#if>
    </#if>
</select>
</#macro>

<#macro monthPicker path attributes="">
<div class="input-group pull-left month-picker-container">
    <@spring.bind path/>
    <#local flashMonth=(spring.status.actualValue)! />
    <input type="text" name="${spring.status.expression}" value="${flashMonth}" ${attributes}
           class="form-control month-picker"/>
    <i class="input-group-addon glyphicon glyphicon-calendar"></i>
    <@spring.showErrors separator="<br/>" classOrStyle="text-danger"/>
</div>
</#macro>