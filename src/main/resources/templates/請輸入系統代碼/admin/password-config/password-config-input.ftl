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
      <div class="con_main container">
        <div class="con-box">
          <form role="form" action="<@spring.url "/admin/password-config" />" method="POST"
                enctype="multipart/form-data" class="tist-validate">
            <input type="hidden" name="${(_csrf.parameterName)!}" value="${(_csrf.token)!}"/>
            <div class="con_main col-md-12">
              <div class="form-group col-md-12">
                <label class="col-md-2 required">
                  密碼長度
                </label>
                <div class="col-md-10">
                    <@tist.text path="main.passwordLength" attributes='required' />
                </div>
              </div>
              <div class="form-group col-md-12">
                <label class="col-md-2 required">
                  允許字元
                </label>
                <div class="col-md-10">
                    <@tist.text path="main.includeChars" attributes='required' />
                </div>
              </div>
              <div class="form-group col-md-12">
                <label class="col-md-2">
                  密碼更新頻率
                </label>
                <div class="col-md-10">
                  <div class="input-group">
                      <@tist.text path="main.passwordLife" />
                    <span class="input-group-addon">月</span>
                  </div>
                </div>
              </div>
              <div class="form-group col-md-12">
                <label class="col-md-2">
                  密碼嘗試次數
                </label>
                <div class="col-md-10">
                  <div class="input-group">
                      <@tist.text path="main.tryTimes" />
                    <span class="input-group-addon">次</span>
                  </div>
                </div>
              </div>
              <div class="form-group col-md-12">
                <label class="col-md-2">
                  帳號鎖定時間
                </label>
                <div class="col-md-10">
                  <div class="input-group">
                      <@tist.text path="main.lockTime" />
                    <span class="input-group-addon">分鐘</span>
                  </div>
                </div>
              </div>
              <div class="form-group col-md-12">
                <label class="col-md-2">
                  帳號停用期限
                </label>
                <div class="col-md-10">
                  <div class="input-group">
                      <@tist.text path="main.disabledDay" />
                    <span class="input-group-addon">天</span>
                  </div>
                </div>
              </div>
              <div class="form-group col-md-12">
                <label class="col-md-2">
                  第一次登入是否變更密碼
                </label>
                <div class="col-md-10">
                    <@tist.radioButtons path="main.firstLoginChange" options={"true":"是","false":"否"} />
                </div>
              </div>
              <div class="form-group col-md-12">
                <label class="col-md-2">
                  密碼是否禁止輸入帳號
                </label>
                <div class="col-md-10">
                    <@tist.radioButtons path="main.banUsername" options={"true":"是","false":"否"} />
                </div>
              </div>
              <div class="col-md-12">
                <button type="submit" class="btn btn-raised btn-info">
                    <@spring.message "admin.button.edit" />
                </button>
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
