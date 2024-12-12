<#ftl output_format="HTML" />
<div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
    <div class="panel panel-success">
        <div class="panel-heading" role="tab" id="tab1">
            <h4 class="panel-title text-center">
            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion1" href="#bbb" aria-expanded="false" aria-controls="bbb">
                                                <strong><i class="fa fa-chevron-down" aria-hidden="true"></i>服務滿意度調查</strong>
                                            </a>
                                        </h4>
        </div>
        <div id="bbb" class="panel-collapse collapse" role="tabpanel" aria-labelledby="tab1">
            <div class="panel-body">
                <p class="bg-warning text-danger">
                    <strong>親愛的市民您好，感謝您的配合。<br>
                                                若您覺得本次市府服務人員服務過程讓您覺得滿意，請在下面滿意度調查中點選「非常滿意<i class="fa fa-smile-o" aria-hidden="true"></i>」，感謝您！
                                                </strong>
                </p>
                <@spring.formHiddenInput path="main.feedback.id" />

                <#if questionnaires?has_content>
                    <input type="hidden" name="feedback.main.id" value="${questionnaires[0].id}" />
                    <#assign answer_index=0 />
                    <#list questionnaires[0].topics as topic>
                        <div class="form-group col-sm-12">
                            <label for="project" class=" col-sx-12 col-sm-2 control-label required">${topic.title}</label>
                            <div class="satisfaction btn-group col-sx-12 col-sm-10" data-toggle="buttons">
                                <@spring.formHiddenInput path="main.feedback.answers[${answer_index}].id" />
                                <#list topic.options as option>
                                    <#if option.label="非常滿意">
                                        <label class="btn btn-warning option1 col-sx-12 col-sm-2 <@tist.answerOptionIsSelected feedback=main.feedback answerIndex=answer_index optionId=option.id outPut=" active " />">
                                            <input type="radio" name="feedback.answers[${answer_index}].options[0].id" value="${option.id}" autocomplete="off" <@tist.answerOptionIsSelected feedback=main.feedback answerIndex=answer_index optionId=option.id outPut="checked" /> />${option.label}
                                        </label>
                                        <#elseif option.label="滿意">
                                            <label class="btn btn-warning option2 col-sx-12 col-sm-2 <@tist.answerOptionIsSelected feedback=main.feedback answerIndex=answer_index optionId=option.id outPut=" active " />">
                                                <input type="radio" name="feedback.answers[${answer_index}].options[0].id" value="${option.id}" autocomplete="off" <@tist.answerOptionIsSelected feedback=main.feedback answerIndex=answer_index optionId=option.id outPut="checked" /> />${option.label}
                                            </label>
                                            <#elseif option.label="普通">
                                                <label class="btn btn-warning option3 col-sx-12 col-sm-2 <@tist.answerOptionIsSelected feedback=main.feedback answerIndex=answer_index optionId=option.id outPut=" active " />">
                                                    <input type="radio" name="feedback.answers[${answer_index}].options[0].id" value="${option.id}" autocomplete="off" <@tist.answerOptionIsSelected feedback=main.feedback answerIndex=answer_index optionId=option.id outPut="checked" /> />${option.label}
                                                </label>
                                                <#elseif option.label="不滿意">
                                                    <label class="btn btn-warning option4 col-sx-12 col-sm-2 <@tist.answerOptionIsSelected feedback=main.feedback answerIndex=answer_index optionId=option.id outPut=" active " />">
                                                        <input type="radio" name="feedback.answers[${answer_index}].options[0].id" value="${option.id}" autocomplete="off" <@tist.answerOptionIsSelected feedback=main.feedback answerIndex=answer_index optionId=option.id outPut="checked" /> />${option.label}
                                                    </label>
                                                    <#elseif option.label="非常不滿意">
                                                        <label class="btn btn-warning option5 col-sx-12 col-sm-2 <@tist.answerOptionIsSelected feedback=main.feedback answerIndex=answer_index optionId=option.id outPut=" active " />">
                                                            <input type="radio" name="feedback.answers[${answer_index}].options[0].id" value="${option.id}" autocomplete="off" <@tist.answerOptionIsSelected feedback=main.feedback answerIndex=answer_index optionId=option.id outPut="checked" /> />${option.label}
                                                        </label>
                                    </#if>
                                </#list>
                                <#assign answer_index++ />
                            </div>
                        </div>
                    </#list>
                </#if>
            </div>
            <div class="panel-footer text-center">
                <@tist.processButtons baseUrl="${appBaseUrl}" appHelp=main />
            </div>
        </div>
    </div>
