/**
 * @fileOverview form \u547d\u540d\u7a7a\u95f4\u5165\u53e3
 * @ignore
 */(function(){var e="bui/form/";define("bui/form",["bui/common",e+"fieldcontainer",e+"form",e+"row",e+"fieldgroup",e+"horizontal",e+"rules",e+"field",e+"fieldgroup"],function(t){var n=t("bui/common"),r=n.namespace("Form"),i=t(e+"tips");return n.mix(r,{Tips:i,TipItem:i.Item,FieldContainer:t(e+"fieldcontainer"),Form:t(e+"form"),Row:t(e+"row"),Group:t(e+"fieldgroup"),HForm:t(e+"horizontal"),Rules:t(e+"rules"),Field:t(e+"field"),FieldGroup:t(e+"fieldgroup")}),r})})(),define("bui/form/tips",["bui/common","bui/overlay"],function(e){var t=e("bui/common"),n=t.prefix,r=e("bui/overlay").Overlay,i="data-tip",s=n+"form-tip-container",o=r.extend({initializer:function(){var e=this,t=e.get("render");if(!t){var n=$(e.get("trigger")).parent();e.set("render",n)}},renderUI:function(){var e=this;e.resetVisible()},resetVisible:function(){var e=this,t=$(e.get("trigger"));t.val()?e.set("visible",!1):(e.set("align",{node:$(e.get("trigger")),points:["cl","cl"]}),e.set("visible",!0))},bindUI:function(){var e=this,t=$(e.get("trigger"));e.get("el").on("click",function(){e.hide(),t.focus()}),t.on("click focus",function(){e.hide()}),t.on("blur",function(){e.resetVisible()})}},{ATTRS:{trigger:{},text:{},iconCls:{},tpl:{value:'<span class="{iconCls}"></span><span class="tip-text">{text}</span>'}}},{xclass:"form-tip"}),u=function(e){if(this.constructor!==u)return new u(e);u.superclass.constructor.call(this,e),this._init()};return u.ATTRS={form:{},items:{valueFn:function(){return[]}}},t.extend(u,t.Base),t.augment(u,{_init:function(){var e=this,n=$(e.get("form"));n.length&&(t.each($.makeArray(n[0].elements),function(t){var n=$(t).attr(i);n&&e._initFormElement(t,$.parseJSON(n))}),n.addClass(s))},_initFormElement:function(e,t){t&&(t.trigger=e);var n=this,r=n.get("items"),i=new o(t);r.push(i)},getItem:function(e){var n=this,r=n.get("items"),i=null;return t.each(r,function(t){if($(t.get("trigger")).attr("name")===e)return i=t,!1}),i},resetVisible:function(){var e=this,n=e.get("items");t.each(n,function(e){e.resetVisible()})},render:function(){var e=this,n=e.get("items");t.each(n,function(e){e.render()})},destroy:function(){var e=this,n=e.get(n);t.each(n,function(e){e.destroy()})}}),u.Item=o,u}),define("bui/form/basefield",["bui/common","bui/form/tips","bui/form/valid","bui/form/remote"],function(e){var t=e("bui/common"),n=t.Component,r=e("bui/form/tips").Item,i=e("bui/form/valid"),s=e("bui/form/remote"),o=t.prefix+"form-field-error",u="data-error",a=n.View.extend([s.View,i.View],{renderUI:function(){var e=this,t=e.get("control");if(!t){var n=e.get("controlTpl"),r=e.getControlContainer();if(n){var t=$(n).appendTo(r);e.set("control",t)}}else e.set("controlContainer",t.parent())},clearErrors:function(){var e=this,t=e.get("msgEl");t&&(t.remove(),e.set("msgEl",null)),e.get("el").removeClass(o)},showError:function(e,n){var r=this,i=r.get("control"),s=t.substitute(n,{error:e}),u=$(s);u.appendTo(i.parent()),r.set("msgEl",u),r.get("el").addClass(o)},getControlContainer:function(){var e=this,n=e.get("el"),r=e.get("controlContainer");return r&&t.isString(r)&&(r=n.find(r)),r&&r.length?r:n},getLoadingContainer:function(){return this.getControlContainer()},_uiSetName:function(e){var t=this;t.get("control").attr("name",e)}},{ATTRS:{error:{},controlContainer:{},msgEl:{},control:{}}}),f=n.Controller.extend([s,i],{initializer:function(){var e=this;e.on("afterRenderUI",function(){var t=e.get("tip");t&&(t.trigger=e.getTipTigger(),t.autoRender=!0,t=new r(t),e.set("tip",t))})},bindUI:function(){var e=this,t=e.get("validEvent"),n=e.get("changeEvent"),r=e.get("firstValidEvent"),i=e.getInnerControl();i.is("select")&&(t="change"),i.on(t,function(){var t=e.getControlValue(i);e.validControl(t)}),r&&i.on(r,function(){if(!e.get("hasValid")){var t=e.getControlValue(i);e.validControl(t)}}),e.on(n,function(){e.onValid()}),e.on("remotecomplete",function(t){e._setError(t.error)})},onValid:function(){var e=this,t=e.getControlValue();t=e.parseValue(t),e.isCurrentValue(t)||(e.setInternal("value",t),e.onChange())},onChange:function(){this.fire("change")},isCurrentValue:function(e){return e==this.get("value")},_clearError:function(){this.set("error",null),this.get("view").clearErrors()},_setError:function(e){this.set("error",e),this.showErrors()},getControlValue:function(e){var t=this;return e=e||t.getInnerControl(),e.val()},getControlContainer:function(){return this.get("view").getControlContainer()},getRemoteParams:function(){var e=this,t={};return t[e.get("name")]=e.getControlValue(),t},setControlValue:function(e){var t=this,n=t.getInnerControl();n.val(e)},parseValue:function(e){return e},valid:function(){var e=this;e.validControl()},validControl:function(e){var t=this,n;return e=e||t.getControlValue(),preError=t.get("error"),n=t.getValidError(e),t.setInternal("hasValid",!0),n?(t._setError(n),t.fire("error",{msg:n,value:e}),preError!==n&&t.fire("validchange",{valid:!1})):(t._clearError(),t.fire("valid"),preError&&t.fire("validchange",{valid:!0})),!n},focus:function(){this.getInnerControl().focus()},change:function(){var e=this.getInnerControl();e.change()},blur:function(){this.getInnerControl().blur()},isValid:function(){var e=this;return e.get("hasValid")||e.validControl(),!e.get("error")},getError:function(){return this.get("error")},getErrors:function(){var e=this.getError();return e?[e]:[]},clearErrors:function(e){var t=this;t._clearError(),e&&t.getControlValue()!=t.get("value")&&t.setControlValue(t.get("value"))},getInnerControl:function(){return this.get("view").get("control")},getTipTigger:function(){return this.getInnerControl()},destructor:function(){var e=this,t=e.get("tip");t&&t.destroy&&t.destroy()},setInnerWidth:function(e){var t=this,n=t.getInnerControl(),r=n.outerWidth()-n.width();n.width(e-r)},_resetTip:function(){var e=this,t=e.get("tip");t&&t.resetVisible()},resetTip:function(){this._resetTip()},_uiSetValue:function(e){var t=this;t.setControlValue(e),t.get("rendered")&&(t.validControl(),t.onChange()),t._resetTip()},_uiSetDisabled:function(e){var n=this,r=n.getInnerControl(),i=n.get("children");r.attr("disabled",e),n.get("rendered")&&(e&&n.clearErrors(),e||n.valid()),t.each(i,function(t){t.set("disabled",e)})},_uiSetWidth:function(e){var t=this;e!=null&&t.get("forceFit")&&t.setInnerWidth(e)}},{ATTRS:{hasValid:{value:!1},forceFit:{value:!1},tip:{},changeEvent:{value:"valid"},firstValidEvent:{value:"blur"},validEvent:{value:"keyup change"},name:{view:!0},showError:{view:!0,value:!0},value:{view:!0},label:{},controlContainer:{view:!0},control:{view:!0},controlTpl:{view:!0,value:'<input type="text"/>'},events:{value:{error:!1,valid:!1,change:!0,validchange:!0}},tpl:{value:"<label>{label}</label>"},xview:{value:a}},PARSER:{control:function(e){var t=e.find("input,select,textarea");return t.length?t:e},disabled:function(e){return!!e.attr("disabled")},value:function(e){var t=this,n="select,input,textarea",r=t.get("value");return r||(e.is(n)?(r=e.val(),!r&&e.is("select")&&(r=e.attr("value"))):r=e.find(n).val()),r},name:function(e){var t=this,n="select,input,textarea",r=t.get("name");return r||(e.is(n)?r=e.attr("name"):r=e.find(n).attr("name")),r}}},{xclass:"form-field"});return f.View=a,f}),define("bui/form/textfield",["bui/form/basefield"],function(e){var t=e("bui/form/basefield"),n=t.extend({},{xclass:"form-field-text"});return n}),define("bui/form/numberfield",["bui/form/basefield"],function(e){var t=e("bui/form/basefield"),n=t.extend({parseValue:function(e){if(e==""||e==null)return null;if(BUI.isNumber(e))return e;var t=this,n=t.get("allowDecimals");return e=e.replace(/\,/g,""),n?parseFloat(parseFloat(e).toFixed(t.get("decimalPrecision"))):parseInt(e,10)},_uiSetMax:function(e){this.addRule("max",e)},_uiSetMin:function(e){this.addRule("min",e)}},{ATTRS:{max:{},min:{},decorateCfgFields:{value:{min:!0,max:!0}},validEvent:{value:"keyup change"},defaultRules:{value:{number:!0}},allowDecimals:{value:!0},decimalPrecision:{value:2},step:{value:1}}},{xclass:"form-field-number"});return n}),define("bui/form/hiddenfield",["bui/form/basefield"],function(e){var t=e("bui/form/basefield"),n=t.extend({},{ATTRS:{controlTpl:{value:'<input type="hidden"/>'},tpl:{value:""}}},{xclass:"form-field-hidden"});return n}),define("bui/form/readonlyfield",["bui/form/basefield"],function(e){var t=e("bui/form/basefield"),n=t.extend({},{ATTRS:{controlTpl:{value:'<input type="text" readonly="readonly"/>'}}},{xclass:"form-field-readonly"});return n}),define("bui/form/selectfield",["bui/common","bui/form/basefield"],function(e){function r(e,n,r){e.children().remove();var s=r.get("emptyText");s&&r.get("showBlank")&&i("",s,e),t.each(n,function(t){i(t.value,t.text,e)})}function i(e,t,n){var r='<option value="'+e+'">'+t+"</option>";$(r).appendTo(n)}var t=e("bui/common"),n=e("bui/form/basefield"),s=n.extend({renderUI:function(){var e=this,t=e.getInnerControl(),n=e.get("select");if(e.get("srcNode")&&t.is("select"))return;$.isPlainObject(n)&&e._initSelect(n)},_initSelect:function(e){var n=this,r=n.get("items");t.use("bui/select",function(t){e.render=n.getControlContainer(),e.valueField=n.getInnerControl(),e.autoRender=!0,e=new t.Select(e),n.set("select",e),n.set("isCreate",!0),n.get("children").push(e),e.on("change",function(t){var r=e.getSelectedValue();n.set("value",r)})})},setItems:function(e){var n=this,i=n.get("select");if($.isPlainObject(e)){var s=[];t.each(e,function(e,t){s.push({value:t,text:e})}),e=s}var o=n.getInnerControl();o.is("select")&&(r(o,e,n),n.setControlValue(n.get("value")),n.getControlValue()||n.setInternal("value","")),i&&(i.set?i.set("items",e):i.items=e)},setControlValue:function(e){var t=this,n=t.get("select"),r=t.getInnerControl();r.val(e),n&&n.set&&n.getSelectedValue()!==e&&n.setSelectedValue(e)},getSelectedText:function(){var e=this,t=e.get("select"),n=e.getInnerControl();if(n.is("select")){var r=n[0],i=r.options[r.selectedIndex];return i?i.text:""}return t.getSelectedText()},getTipTigger:function(){var e=this,t=e.get("select");return t&&t.rendered?t.get("el").find("input"):e.get("el")},_uiSetItems:function(e){e&&this.setItems(e)},setInnerWidth:function(e){var t=this,n=t.getInnerControl(),r=t.get("select"),i=n.outerWidth()-n.width();n.width(e-i),r&&r.set&&r.set("width",e)}},{ATTRS:{items:{},controlTpl:{value:'<input type="hidden"/>'},showBlank:{value:!0},emptyText:{value:"\u8bf7\u9009\u62e9"},select:{value:{}}},PARSER:{emptyText:function(e){if(!this.get("showBlank"))return"";var t=e.find("option"),n=this.get("emptyText");return t.length&&(n=$(t[0]).text()),n}}},{xclass:"form-field-select"});return s}),define("bui/form/datefield",["bui/common","bui/form/basefield","bui/calendar"],function(e){var t=e("bui/common"),n=e("bui/form/basefield"),r=t.Date,i=n.extend({renderUI:function(){var e=this,t=e.get("datePicker");$.isPlainObject(t)&&e.initDatePicker(t),(t.get&&t.get("showTime")||t.showTime)&&e.getInnerControl().addClass("calendar-time")},initDatePicker:function(e){var n=this;t.use("bui/calendar",function(t){e.trigger=n.getInnerControl(),e.autoRender=!0,e=new t.DatePicker(e),n.set("datePicker",e),n.set("isCreatePicker",!0),n.get("children").push(e)})},setControlValue:function(e){var n=this,i=n.getInnerControl();t.isDate(e)&&(e=r.format(e,n._getFormatMask())),i.val(e)},_getFormatMask:function(){var e=this,t=e.get("datePicker");return t.get("showTime")?"yyyy-mm-dd HH:MM:ss":"yyyy-mm-dd"},parseValue:function(e){return t.isNumber(e)?new Date(e):r.parse(e)},isCurrentValue:function(e){return r.isEquals(e,this.get("value"))},_uiSetMax:function(e){this.addRule("max",e);var t=this,n=t.get("datePicker");n&&(n.set?n.set("maxDate",e):n.maxDate=e)},_uiSetMin:function(e){this.addRule("min",e);var t=this,n=t.get("datePicker");n&&(n.set?n.set("minDate",e):n.minDate=e)}},{ATTRS:{controlTpl:{value:'<input type="text" class="calendar"/>'},defaultRules:{value:{date:!0}},max:{},min:{},value:{setter:function(e){return t.isNumber(e)?new Date(e):e}},datePicker:{shared:!1,value:{}},isCreatePicker:{value:!0}},PARSER:{datePicker:function(e){return e.hasClass("calendar-time")?{showTime:!0}:{}}}},{xclass:"form-field-date"});return i}),define("bui/form/checkfield",["bui/form/basefield"],function(e){var t=e("bui/form/basefield"),n=t.extend({onValid:function(){var e=this,t=e._getControlChecked();e.setInternal("checked",t),e.fire("change"),t?e.fire("checked"):e.fire("unchecked")},_setControlChecked:function(e){var t=this,n=t.getInnerControl();n.attr("checked",!!e)},_getControlChecked:function(){var e=this,t=e.getInnerControl();return!!t.attr("checked")},_uiSetValue:function(e){},_uiSetWidth:function(e){},_uiSetChecked:function(e){var t=this;t._setControlChecked(e),t.get("rendered")&&t.onValid()}},{ATTRS:{validEvent:{value:"click"},checked:{value:!1},events:{value:{checked:!1,unchecked:!1}}},PARSER:{checked:function(e){return!!e.attr("checked")}}},{xclass:"form-check-field"});return n}),define("bui/form/checkboxfield",["bui/form/checkfield"],function(e){var t=e("bui/form/checkfield"),n=t.extend({},{ATTRS:{controlTpl:{view:!0,value:'<input type="checkbox"/>'},controlContainer:{value:".checkbox"},tpl:{value:'<label><span class="checkbox"></span>{label}</label>'}}},{xclass:"form-field-checkbox"});return n}),define("bui/form/radiofield",["bui/form/checkfield"],function(e){var t=e("bui/form/checkfield"),n=t.extend({bindUI:function(){var e=this,t=e.get("parent"),n=e.get("name");t&&e.getInnerControl().on("click",function(r){var i=t.getFields(n);BUI.each(i,function(t){t!=e&&t.set("checked",!1)})})}},{ATTRS:{controlTpl:{view:!0,value:'<input type="radio"/>'},controlContainer:{value:".radio"},tpl:{value:'<label><span class="radio"></span>{label}</label>'}}},{xclass:"form-field-radio"});return n}),define("bui/form/plainfield",["bui/form/basefield"],function(e){var t=e("bui/form/basefield"),n=t.View.extend({_uiSetValue:function(e){var t=this,n=t.get("textEl"),r=t.getControlContainer(),i=t.get("renderer"),s=i?i(e):e,o=t.get("width"),u=0,a;n&&n.remove(),s=s||"&nbsp;",a=BUI.substitute(t.get("textTpl"),{text:s}),n=$(a).appendTo(r),u=n.outerWidth()-n.width(),n.width(o-u),t.set("textEl",n)}},{ATTRS:{textEl:{},value:{}}},{xclass:"form-field-plain-view"}),r=t.extend({},{ATTRS:{controlTpl:{value:'<input type="hidden"/>'},textTpl:{view:!0,value:'<span class="x-form-text">{text}</span>'},renderer:{view:!0,value:function(e){return e}},tpl:{value:""},xview:{value:n}}},{xclass:"form-field-plain"});return r}),define("bui/form/listfield",["bui/common","bui/form/basefield","bui/list"],function(e){function i(e){var n=e;return $.isPlainObject(e)&&(n=[],t.each(e,function(e,t){n.push({text:e,value:t})})),n}var t=e("bui/common"),n=e("bui/list"),r=e("bui/form/basefield"),n=r.extend({initializer:function(){var e=this;e._initList()},_getList:function(){var e=this,t=e.get("children");return t[0]},bindUI:function(){var e=this,t=e._getList();t&&t.on("selectedchange",function(){var n=e._getListValue(t);e.set("value",n)})},_getListValue:function(e){var t=this;return e=e||t._getList(),e.getSelectionValues().join(",")},setControlValue:function(e){var t=this,n=t.getInnerControl(),r=t._getList();n.val(e),t._getListValue(r)!==e&&r.getCount()&&(r.get("multipleSelect")&&r.clearSelection(),r.setSelectionByField(e.split(",")))},syncUI:function(){this.set("list",this._getList())},_initList:function(){var e=this,n=e.get("defaultListCfg"),r=e.get("children"),i=e.get("list")||{};if(r[0])return;$.isPlainObject(i)&&t.mix(i,n),r.push(i)},setItems:function(e){var t=this,n=t.get("value"),r=t._getList();r.set("items",i(e)),r.setSelectionByField(n.split(","))},_uiSetItems:function(e){e&&this.setItems(e)}},{ATTRS:{controlTpl:{value:'<input type="hidden"/>'},defaultListCfg:{value:{xclass:"simple-list"}},items:{setter:function(e){if($.isPlainObject(e)){var n=[];t.each(e,function(e,t){n.push({value:t,text:e})}),e=n}return e}},list:{}},PARSER:{list:function(e){var t=e.find(".bui-simple-list");if(t.length)return{srcNode:t}}}},{xclass:"form-field-list"});return n}),define("bui/form/uploaderfield",["bui/common","bui/form/basefield"],function(e){var t=e("bui/common"),n=t.JSON,r=e("bui/form/basefield"),i=r.extend({renderUI:function(){var e=this,t=e.getInnerControl();if(e.get("srcNode")&&t.get(0).type==="file")return;e._initUpload()},_initUpload:function(){var e=this,n=e.get("children"),r=e.get("uploader")||{};t.use("bui/uploader",function(t){r.render=e.getControlContainer(),r.autoRender=!0,r=new t.Uploader(r),e.set("uploader",r),e.set("isCreate",!0),e.get("children").push(r),r.get("uploaderType").on("success",function(t){var n=r.get("queue").getItems();e.setControlValue(n)})})},setControlValue:function(e){var r=this,i=r.getInnerControl(),s=[];t.each(e,function(e){s.push(e.result)}),i.val(n.stringify(s))}},{ATTRS:{controlTpl:{value:'<input type="hidden"/>'},uploader:{},value:{value:[]}}},{xclass:"form-field-uploader"});return i}),define("bui/form/checklistfield",["bui/common","bui/form/listfield"],function(e){"use strict";var t=e("bui/common"),n=e("bui/form/listfield"),r=n.extend({},{ATTRS:{defaultListCfg:{value:{itemTpl:'<li><span class="x-checkbox"></span>{text}</li>',multipleSelect:!0,allowTextSelection:!1}}}},{xclass:"form-field-checklist"});return r}),define("bui/form/radiolistfield",["bui/common","bui/form/listfield"],function(e){"use strict";var t=e("bui/common"),n=e("bui/form/listfield"),r=n.extend({},{ATTRS:{defaultListCfg:{value:{itemTpl:'<li><span class="x-radio"></span>{text}</li>',allowTextSelection:!1}}}},{xclass:"form-field-radiolist"});return r}),function(){var e="bui/form/";define(e+"field",["bui/common",e+"textfield",e+"datefield",e+"selectfield",e+"hiddenfield",e+"numberfield",e+"checkfield",e+"radiofield",e+"checkboxfield",e+"plainfield",e+"listfield",e+"checklistfield",e+"radiolistfield"],function(t){var n=t("bui/common"),r=t(e+"basefield");return n.mix(r,{Text:t(e+"textfield"),Date:t(e+"datefield"),Select:t(e+"selectfield"),Hidden:t(e+"hiddenfield"),Number:t(e+"numberfield"),Check:t(e+"checkfield"),Radio:t(e+"radiofield"),Checkbox:t(e+"checkboxfield"),Plain:t(e+"plainfield"),List:t(e+"listfield"),Uploader:t(e+"uploaderfield"),CheckList:t(e+"checklistfield"),RadioList:t(e+"radiolistfield")}),r})}(),define("bui/form/valid",["bui/common","bui/form/rules"],function(e){var t=e("bui/common"),n=e("bui/form/rules"),r=function(){};r.prototype={getErrorsContainer:function(){var e=this,n=e.get("errorContainer");return n?t.isString(n)?e.get("el").find(n):n:e.getContentElement()},showErrors:function(e){var n=this,r=n.getErrorsContainer(),i=n.get("errorTpl");n.clearErrors();if(!n.get("showError"))return;if(n.get("showOneError")){e&&e.length&&n.showError(e[0],i,r);return}t.each(e,function(e){e&&n.showError(e,i,r)})},showError:function(e,t,n){},clearErrors:function(){}};var i=function(){};return i.ATTRS={defaultRules:{value:{}},defaultMessages:{value:{}},rules:{shared:!1,value:{}},messages:{shared:!1,value:{}},validator:{},errorContainer:{view:!0},errorTpl:{view:!0,value:'<span class="x-field-error"><span class="x-icon x-icon-mini x-icon-error">!</span><label class="x-field-error-text">{error}</label></span>'},showError:{view:!0,value:!0},showOneError:{},error:{}},i.prototype={__bindUI:function(){var e=this;e.on("afterDisabledChange",function(t){var n=t.newVal;n?e.clearErrors(!1):e.valid()})},isValid:function(){},valid:function(){},validControl:function(){},validRules:function(e,t){if(!e)return;var r=this,i=r._getValidMessages(),s=null;for(var o in e)if(e.hasOwnProperty(o)){var u=e[o];s=n.valid(o,t,u,i[o],r);if(s)break}return s},_getValidMessages:function(){var e=this,n=e.get("defaultMessages"),r=e.get("messages");return t.merge(n,r)},getValidError:function(e){var t=this,n=t.get("validator"),r=null;return r=t.validRules(t.get("defaultRules"),e)||t.validRules(t.get("rules"),e),r||(t.parseValue&&(e=t.parseValue(e)),r=n?n.call(this,e):""),r},getErrors:function(){},showErrors:function(e){var t=this,e=e||t.getErrors();t.get("view").showErrors(e)},clearErrors:function(e){e=e==null?!0:e;var n=this,r=n.get("children");e&&t.each(r,function(e){e.clearErrors&&e.clearErrors()}),n.set("error",null),n.get("view").clearErrors()},addRule:function(e,t,n){var r=this,i=r.get("rules"),s=r.get("messages");i[e]=t,n&&(s[e]=n)},addRules:function(e,n){var r=this;t.each(e,function(e,t){var i=n?n[t]:null;r.addRule(t,e,i)})},removeRule:function(e){var t=this,n=t.get("rules");delete n[e]},clearRules:function(){var e=this;e.set("rules",{})}},i.View=r,i}),define("bui/form/groupvalid",["bui/form/valid"],function(e){function r(){}function i(){}var t="x-form-error",n=e("bui/form/valid");return BUI.augment(r,n.View,{showError:function(e,n,r){var i=BUI.substitute(n,{error:e}),s=$(i);s.appendTo(r),s.addClass(t)},clearErrors:function(){var e=this,n=e.getErrorsContainer();n.children("."+t).remove()}}),i.ATTRS=ATTRS=BUI.merge(!0,n.ATTRS,{events:{value:{validchange:!0,change:!0}}}),BUI.augment(i,n,{__bindUI:function(){var e=this,t="validchange change";e.on(t,function(t){var n=t.target;if(n!=this&&e.get("showError")){var r=e.isChildrenValid();r&&(e.validControl(e.getRecord()),r=e.isSelfValid()),r?e.clearErrors():e.showErrors()}})},isValid:function(){if(this.get("disabled"))return!0;var e=this,t=e.isChildrenValid();return t&&e.isSelfValid()},valid:function(){var e=this,t=e.get("children");if(e.get("disabled"))return;BUI.each(t,function(e){e.get("disabled")||e.valid()})},isChildrenValid:function(){var e=this,t=e.get("children"),n=!0;return BUI.each(t,function(e){if(!e.get("disabled")&&!e.isValid())return n=!1,!1}),n},isSelfValid:function(){return!this.get("error")},validControl:function(e){var t=this,n=t.getValidError(e);t.set("error",n)},getErrors:function(){var e=this,t=e.get("children"),n=e.get("showChildError"),r=null,i=[];return n&&BUI.each(t,function(e){e.getErrors&&(i=i.concat(e.getErrors()))}),e.isChildrenValid()&&(r=e.get("error"),r&&i.push(r)),i},_uiSetErrorTpl:function(e){var t=this,n=t.get("children");BUI.each(n,function(t){t.set("errorTpl",e)})}}),i.View=r,i}),define("bui/form/fieldcontainer",["bui/common","bui/form/field","bui/form/groupvalid"],function(e){function f(e){return e.is(a)}function l(e,n){if(e!=n){if(f(e))return[e];var r=e.attr("class");if(r&&(r.indexOf(u)!==-1||r.indexOf(o)!==-1))return[e]}var i=[],s=e.children();return t.each(s,function(e){i=i.concat(l($(e),n))}),i}var t=e("bui/common"),n=e("bui/form/field"),r=e("bui/form/groupvalid"),i=t.prefix,s="form-field",o=i+s,u=i+"form-group",a="input,select,textarea",c=t.Component.View.extend([r.View]),h=t.Component.Controller.extend([r],{syncUI:function(){var e=this,n=e.getFields(),r=e.get("validators");t.each(n,function(e){var t=e.get("name");r[t]&&e.set("validator",r[t])}),t.each(r,function(t,n){if(n.indexOf("#")==0){var r=n.replace("#",""),i=e.getChild(r,!0);i&&i.set("validator",t)}})},getDecorateElments:function(){var e=this,t=e.get("el"),n=l(t,t);return n},findXClassByNode:function(e,n){return e.attr("type")==="checkbox"?s+"-checkbox":e.attr("type")==="radio"?s+"-radio":e.attr("type")==="number"?s+"-number":e.hasClass("calendar")?s+"-date":e[0].tagName=="SELECT"?s+"-select":f(e)?s:t.Component.Controller.prototype.findXClassByNode.call(this,e,n)},getRecord:function(){var e=this,n={},r=e.getFields();return t.each(r,function(r){var i=r.get("name"),s=e._getFieldValue(r);if(!n[i])n[i]=s;else if(t.isArray(n[i])&&s!=null)n[i].push(s);else if(s!=null){var o=[n[i]];o.push(s),n[i]=o}}),n},getFields:function(e){var r=this,i=[],s=r.get("children");return t.each(s,function(t){t instanceof n?(!e||t.get("name")==e)&&i.push(t):t.getFields&&(i=i.concat(t.getFields(e)))}),i},getField:function(e){var n=this,r=n.getFields(),i=null;return t.each(r,function(t){if(t.get("name")===e)return i=t,!1}),i},getFieldAt:function(e){return this.getFields()[e]},setFieldValue:function(e,n){var r=this,i=r.getFields(e);t.each(i,function(e){r._setFieldValue(e,n)})},_setFieldValue:function(e,r){if(e.get("disabled"))return;if(e instanceof n.Check){var i=e.get("value");r&&(i===r||t.isArray(r)&&t.Array.contains(i,r))?e.set("checked",!0):e.set("checked",!1)}else r==null&&(r=""),e.set("value",r)},getFieldValue:function(e){var n=this,r=n.getFields(e),i=[];return t.each(r,function(e){var t=n._getFieldValue(e);t&&i.push(t)}),i.length===0?null:i.length===1?i[0]:i},_getFieldValue:function(e){return e instanceof n.Check&&!e.get("checked")?null:e.get("value")},clearFields:function(){this.clearErrors(),this.setRecord({})},setRecord:function(e){var n=this,r=n.getFields();t.each(r,function(t){var r=t.get("name");n._setFieldValue(t,e[r])})},updateRecord:function(e){var n=this,r=n.getFields();t.each(r,function(t){var r=t.get("name");e.hasOwnProperty(r)&&n._setFieldValue(t,e[r])})},focus:function(){var e=this,t=e.getFields(),n=t[0];n&&n.focus()},_uiSetDisabled:function(e){var n=this,r=n.get("children");t.each(r,function(t){t.set("disabled",e)})}},{ATTRS:{record:{setter:function(e){this.setRecord(e)},getter:function(){return this.getRecord()}},validators:{value:{}},defaultLoaderCfg:{value:{property:"children",dataType:"json"}},disabled:{sync:!1},isDecorateChild:{value:!0},xview:{value:c}}},{xclass:"form-field-container"});return h.View=c,h}),define("bui/form/group/base",["bui/common","bui/form/fieldcontainer"],function(e){var t=e("bui/common"),n=e("bui/form/fieldcontainer"),r=n.extend({},{ATTRS:{label:{view:!0},defaultChildClass:{value:"form-field"}}},{xclass:"form-group"});return r}),define("bui/form/group/range",["bui/form/group/base"],function(e){function n(e,t,n){var r=e.get("allowEqual");return r?n<=t:n<t}var t=e("bui/form/group/base"),r=t.extend({},{ATTRS:{rangeText:{value:"\u5f00\u59cb\u4e0d\u80fd\u5927\u4e8e\u7ed3\u675f\uff01"},allowEqual:{value:!0},validator:{value:function(e){var t=this,r=t.getFields(),i=!0;for(var s=1;s<r.length;s++){var o=r[s],u=r[s-1],a,f;if(o&&u){a=o.get("value"),f=u.get("value");if(!n(t,a,f)){i=!1;break}}}return i?null:t.get("rangeText")}}}},{xclass:"form-group-range"});return r}),define("bui/form/group/check",["bui/form/group/base"],function(e){function n(e){var t=e.getFieldAt(0);return t?t.get("name"):""}var t=e("bui/form/group/base"),r=t.extend({bindUI:function(){var e=this;e.on("change",function(t){var r=n(e),i=e.get("range"),s=e.getRecord(),o=s[r],u=i[1];o&&o.length>=u?e._setFieldsEnable(r,!1):e._setFieldsEnable(r,!0)})},_setFieldsEnable:function(e,t){var n=this,r=n.getFields(e);BUI.each(r,function(e){t?e.enable():e.get("checked")||e.disable()})},_uiSetRange:function(e){this.addRule("checkRange",e)}},{ATTRS:{range:{setter:function(e){if(BUI.isString(e)||BUI.isNumber(e))e=[parseInt(e,10)];return e}}}},{xclass:"form-group-check"});return r}),define("bui/form/group/select",["bui/form/group/base","bui/data"],function(e){function i(e){var t=[];return BUI.each(e,function(e){t.push({text:e.text,value:e.id})}),t}var t=e("bui/form/group/base"),n=e("bui/data"),r=BUI.Component.UIBase.Bindable,s=t.extend([r],{initializer:function(){var e=this,t=e.get("url"),r=e.get("store")||e._getStore();r.isStore||(r.autoLoad=!0,t&&(r.url=t),r=new n.TreeStore(r),e.set("store",r))},bindUI:function(){var e=this;e.on("change",function(t){var n=t.target;if(n!=e){var r=n,i=r.get("value"),s=e._getFieldIndex(r)+1;e._valueChange(i,s)}})},onLoad:function(e){var t=this,n=e?e.node:t.get("store").get("root");t._setFieldItems(n.level,n.children)},_getStore:function(){var e=this,t=e.get("type");return t&&o[t]?o[t]:{}},_valueChange:function(e,t){var n=this,r=n.get("store");if(e){var i=r.findNode(e);if(!i)return;r.isLoaded(i)?n._setFieldItems(t,i.children):r.loadNode(i)}else n._setFieldItems(t,[])},_setFieldItems:function(e,t){var n=this,r=n.getFieldAt(e),s=i(t);r&&(r.setItems(s),n._valueChange(r.get("value"),e+1))},_getFieldIndex:function(e){var t=this,n=t.getFields();return BUI.Array.indexOf(e,n)}},{ATTRS:{type:{},store:{}}},{xclass:"form-group-select"}),o={};return s.addType=function(e,t){o[e]=t},s.addType("city",{proxy:{url:"http://lp.taobao.com/go/rgn/citydistrictdata.php",dataType:"jsonp"},map:{isleaf:"leaf",value:"text"}}),s}),define("bui/form/fieldgroup",["bui/common","bui/form/group/base","bui/form/group/range","bui/form/group/check","bui/form/group/select"],function(e){var t=e("bui/common"),n=e("bui/form/group/base");return t.mix(n,{Range:e("bui/form/group/range"),Check:e("bui/form/group/check"),Select:e("bui/form/group/select")}),n}),define("bui/form/form",["bui/common","bui/form/fieldcontainer"],function(e){var t=e("bui/common"),n={NORMAL:"normal",AJAX:"ajax",IFRAME:"iframe"},r=e("bui/form/fieldcontainer"),i=t.Component,s=r.View.extend({_uiSetMethod:function(e){this.get("el").attr("method",e)},_uiSetAction:function(e){this.get("el").attr("action",e)}},{ATTRS:{method:{},action:{}}},{xclass:"form-view"}),o=r.extend({renderUI:function(){var e=this,n=e.get("buttonBar"),r;$.isPlainObject(n)&&e.get("buttons")&&(r=t.merge(e.getDefaultButtonBarCfg(),n),e._initButtonBar(r)),e._initSubmitMask()},_initButtonBar:function(e){var n=this;t.use("bui/toolbar",function(t){buttonBar=new t.Bar(e),n.set("buttonBar",buttonBar)})},bindUI:function(){var e=this,t=e.get("el");t.on("submit",function(t){e.valid();if(!e.isValid()||e.onBeforeSubmit()===!1){t.preventDefault();return}e.isValid()&&e.get("submitType")===n.AJAX&&(t.preventDefault(),e.ajaxSubmit())})},getDefaultButtonBarCfg:function(){var e=this,t=e.get("buttons");return{autoRender:!0,elCls:"toolbar",render:e.get("el"),items:t,defaultChildClass:"bar-item-button"}},submit:function(e){var t=this,r=t.get("submitType");t.valid();if(t.isValid()){if(t.onBeforeSubmit()==0)return;r===n.NORMAL?t.get("el")[0].submit():r===n.AJAX&&t.ajaxSubmit(e)}},ajaxSubmit:function(e){var n=this,r=n.get("method"),i=n.get("action"),s=n.get("callback"),o=n.get("submitMask"),u=n.serializeToObject(),a,f=t.merge(!0,{url:i,type:r,dataType:"json",data:u},e);e&&e.success&&(a=e.success),f.success=function(e){o&&o.hide&&o.hide(),a&&a(e),s&&s.call(n,e)},o&&o.show&&o.show(),$.ajax(f)},_initSubmitMask:function(){var e=this,r=e.get("submitType"),i=e.get("submitMask");r===n.AJAX&&i&&t.use("bui/mask",function(n){var r=$.isPlainObject(i)?i:{};i=new n.LoadMask(t.mix({el:e.get("el")},r)),e.set("submitMask",i)})},serializeToObject:function(){return t.FormHelper.serializeToObject(this.get("el")[0])},onBeforeSubmit:function(){return this.fire("beforesubmit")},reset:function(){var e=this,t=e.get("initRecord");e.setRecord(t)},resetTips:function(){var e=this,n=e.getFields();t.each(n,function(e){e.resetTip()})},destructor:function(){var e=this,t=e.get("buttonBar"),n=e.get("submitMask");t&&t.destroy&&t.destroy(),n&&n.destroy&&n.destroy()},_uiSetInitRecord:function(e){this.setRecord(e)}},{ATTRS:{action:{view:!0,value:""},allowTextSelection:{value:!0},events:{value:{beforesubmit:!1}},method:{view:!0,value:"get"},defaultLoaderCfg:{value:{autoLoad:!0,property:"record",dataType:"json"}},submitMask:{value:{msg:"\u6b63\u5728\u63d0\u4ea4\u3002\u3002\u3002"}},submitType:{value:"normal"},callback:{},decorateCfgFields:{value:{method:!0,action:!0}},defaultChildClass:{value:"form-field"},elTagName:{value:"form"},buttons:{},buttonBar:{shared:!1,value:{}},childContainer:{value:".x-form-fields"},initRecord:{},showError:{value:!1},xview:{value:s},tpl:{value:'<div class="x-form-fields"></div>'}}},{xclass:"form"});return o.View=s,o}),define("bui/form/horizontal",["bui/common","bui/form/form"],function(e){var t=e("bui/common"),n=e("bui/form/form"),r=n.extend({getDefaultButtonBarCfg:function(){var e=this,t=e.get("buttons");return{autoRender:!0,elCls:"actions-bar toolbar row",tpl:'<div class="form-actions span21 offset3"></div>',childContainer:".form-actions",render:e.get("el"),items:t,defaultChildClass:"bar-item-button"}}},{ATTRS:{defaultChildClass:{value:"form-row"},errorTpl:{value:'<span class="valid-text"><span class="estate error"><span class="x-icon x-icon-mini x-icon-error">!</span><em>{error}</em></span></span>'},elCls:{value:"form-horizontal"}},PARSER:{}},{xclass:"form-horizontal"});return r}),define("bui/form/row",["bui/common","bui/form/fieldcontainer"],function(e){var t=e("bui/common"),n=e("bui/form/fieldcontainer"),r=n.extend({},{ATTRS:{elCls:{value:"row"},defaultChildCfg:{value:{tpl:' <label class="control-label">{label}</label>                <div class="controls">                </div>',childContainer:".controls",showOneError:!0,controlContainer:".controls",elCls:"control-group span8",errorTpl:'<span class="valid-text"><span class="estate error"><span class="x-icon x-icon-mini x-icon-error">!</span><em>{error}</em></span></span>'}},defaultChildClass:{value:"form-field-text"}}},{xclass:"form-row"});return r}),define("bui/form/rule",["bui/common"],function(e){function r(e,n,r,i,o){t.isArray(r)&&t.isString(r[1])&&(r[1]&&(i=r[1]),r=r[0]);var u=e,a=u.get("validator"),f=s(e,r,i),l=!0;return n=n==null?"":n,a.call(u,n,r,f,o)}function i(e){if(e==null)return{};if($.isPlainObject(e))return e;var n=e,r={};if(t.isArray(e)){for(var i=0;i<n.length;i++)r[i]=n[i];return r}return{0:e}}function s(e,n,r){var s=i(n);return r=
r||e.get("msg"),t.substitute(r,s)}var t=e("bui/common"),n=function(e){n.superclass.constructor.call(this,e)};return t.extend(n,t.Base),n.ATTRS={name:{},msg:{},validator:{value:function(e,t,n,r){}}},t.augment(n,{valid:function(e,t,n,i){var s=this;return r(s,e,t,n,i)}}),n}),define("bui/form/rules",["bui/form/rule"],function(e){function n(e){return parseFloat(e)}function r(e){return BUI.Date.parse(e)}function b(e,t,n){var r=e&&e.equals!==!1;return r?n<=t:n<t}function w(e){return e==""||e==null}function E(e,t,n,r){var i=r.getFields(),s=!0;for(var o=1;o<i.length;o++){var u=i[o],a=i[o-1],f,l;if(u&&a){f=u.get("value"),l=a.get("value");if(!w(f)&&!w(l)&&!b(t,f,l)){s=!1;break}}}return s?null:n}function T(e){var t=e.getFieldAt(0);return t?t.get("name"):""}function N(e,t){BUI.isArray(t)||(t=[t]);if(!e||!t.length)return!1;var n=e?BUI.isArray(e)?e.length:1:0;if(t.length==1){var r=t[0];if(!r)return!0;if(r>n)return!1}else{var i=t[0],s=t[1];if(i>n||s<n)return!1}return!0}var t=e("bui/form/rule"),i={},s={add:function(e){var n;return $.isPlainObject(e)?(n=e.name,i[n]=new t(e)):e.get&&(n=e.get("name"),i[n]=e),i[n]},remove:function(e){delete i[e]},get:function(e){return i[e]},valid:function(e,t,n,r,i){var o=s.get(e);return o?o.valid(t,n,r,i):null},isValid:function(e,t,n,r){return s.valid(e,t,n,r)==null}},o=s.add({name:"required",msg:"\u4e0d\u80fd\u4e3a\u7a7a\uff01",validator:function(e,t,n){if(t!==!1&&/^\s*$/.test(e))return n}}),u=s.add({name:"equalTo",msg:"\u4e24\u6b21\u8f93\u5165\u4e0d\u4e00\u81f4\uff01",validator:function(e,t,n){var r=$(t);return r.length&&(t=r.val()),e===t?undefined:n}}),a=s.add({name:"min",msg:"\u8f93\u5165\u503c\u4e0d\u80fd\u5c0f\u4e8e{0}\uff01",validator:function(e,t,r){if(e!==""&&n(e)<n(t))return r}}),f=s.add({name:"max",msg:"\u8f93\u5165\u503c\u4e0d\u80fd\u5927\u4e8e{0}\uff01",validator:function(e,t,r){if(e!==""&&n(e)>n(t))return r}}),l=s.add({name:"length",msg:"\u8f93\u5165\u503c\u957f\u5ea6\u4e3a{0}\uff01",validator:function(e,t,n){if(e!=null){e=$.trim(e.toString());if(t!=e.length)return n}}}),c=s.add({name:"minlength",msg:"\u8f93\u5165\u503c\u957f\u5ea6\u4e0d\u5c0f\u4e8e{0}\uff01",validator:function(e,t,n){if(e!=null){e=$.trim(e.toString());var r=e.length;if(r<t)return n}}}),h=s.add({name:"maxlength",msg:"\u8f93\u5165\u503c\u957f\u5ea6\u4e0d\u5927\u4e8e{0}\uff01",validator:function(e,t,n){if(e){e=$.trim(e.toString());var r=e.length;if(r>t)return n}}}),p=s.add({name:"regexp",msg:"\u8f93\u5165\u503c\u4e0d\u7b26\u5408{0}\uff01",validator:function(e,t,n){if(t)return t.test(e)?undefined:n}}),d=s.add({name:"email",msg:"\u4e0d\u662f\u6709\u6548\u7684\u90ae\u7bb1\u5730\u5740\uff01",validator:function(e,t,n){e=$.trim(e);if(e)return/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(e)?undefined:n}}),v=s.add({name:"date",msg:"\u4e0d\u662f\u6709\u6548\u7684\u65e5\u671f\uff01",validator:function(e,t,n){if(BUI.isNumber(e))return;if(BUI.isDate(e))return;e=$.trim(e);if(e)return BUI.Date.isDateString(e)?undefined:n}}),m=s.add({name:"minDate",msg:"\u8f93\u5165\u65e5\u671f\u4e0d\u80fd\u5c0f\u4e8e{0}\uff01",validator:function(e,t,n){if(e){var i=r(e);if(i&&i<r(t))return n}}}),g=s.add({name:"maxDate",msg:"\u8f93\u5165\u65e5\u671f\u4e0d\u80fd\u5927\u4e8e{0}\uff01",validator:function(e,t,n){if(e){var i=r(e);if(i&&i>r(t))return n}}}),y=s.add({name:"number",msg:"\u4e0d\u662f\u6709\u6548\u7684\u6570\u5b57\uff01",validator:function(e,t,n){if(BUI.isNumber(e))return;return e=e.replace(/\,/g,""),isNaN(e)?n:undefined}}),S=s.add({name:"dateRange",msg:"\u7ed3\u675f\u65e5\u671f\u4e0d\u80fd\u5c0f\u4e8e\u8d77\u59cb\u65e5\u671f\uff01",validator:E}),x=s.add({name:"numberRange",msg:"\u7ed3\u675f\u6570\u5b57\u4e0d\u80fd\u5c0f\u4e8e\u5f00\u59cb\u6570\u5b57\uff01",validator:E}),C=s.add({name:"checkRange",msg:"\u5fc5\u987b\u9009\u4e2d{0}\u9879\uff01",validator:function(e,t,n,r){var i=T(r),s,o=t;if(i&&o){s=e[i];if(!N(s,o))return n}return null}});return s}),define("bui/form/remote",["bui/common"],function(e){var t=e("bui/common"),n=function(){};n.ATTRS={isLoading:{},loadingEl:{}},n.prototype={getLoadingContainer:function(){},_setLoading:function(){var e=this,t=e.get("loadingEl"),n=e.get("loadingTpl");t||(t=$(n).appendTo(e.getLoadingContainer()),e.setInternal("loadingEl",t))},_clearLoading:function(){var e=this,t=e.get("loadingEl");t&&(t.remove(),e.setInternal("loadingEl",null))},_uiSetIsLoading:function(e){var t=this;e?t._setLoading():t._clearLoading()}};var r=function(){};return r.ATTRS={defaultRemote:{value:{method:"GET",cache:!0,callback:function(e){return e}}},remoteDaly:{value:500},cacheMap:{value:{}},loadingTpl:{view:!0,value:'<img src="http://img02.taobaocdn.com/tps/i2/T1NU8nXCVcXXaHNz_X-16-16.gif" alt="loading"/>'},isLoading:{view:!0,value:!1},remote:{setter:function(e){return t.isString(e)&&(e={url:e}),e}},remoteHandler:{},events:{value:{remotecomplete:!1,remotestart:!1}}},r.prototype={__bindUI:function(){var e=this;e.on("valid",function(t){if(e.get("remote")&&e.isValid()){var n=e.getControlValue(),r=e.getRemoteParams();e._startRemote(r,n)}}),e.on("error",function(t){e.get("remote")&&e._cancelRemote()})},_startRemote:function(e,t){function o(){n._remoteValid(e,r,t),n.set("isLoading",!0)}var n=this,r=n.get("remoteHandler"),i=n.get("cacheMap"),s=n.get("remoteDaly");r&&n._cancelRemote(r);if(i[t]!=null){n._validResult(n._getCallback(),i[t]);return}r=setTimeout(o,s),n.setInternal("remoteHandler",r)},_validResult:function(e,t){var n=this,r=e(t);n.onRemoteComplete(r,t)},onRemoteComplete:function(e,t,n){var r=this;n==r.get("remoteHandler")&&(r.fire("remotecomplete",{error:e,data:t}),r.set("isLoading",!1),r.setInternal("remoteHandler",null))},_getOptions:function(e){var n=this,r=n.get("remote"),i=n.get("defaultRemote"),s=t.merge(i,r,{data:e});return s},_getCallback:function(){return this._getOptions().callback},_remoteValid:function(e,t,n){var r=this,i=r.get("cacheMap"),s=r._getOptions(e);s.success=function(e){var o=s.callback,u=o(e);i[n]=e,r.onRemoteComplete(u,e,t)},s.error=function(e,n,i){r.onRemoteComplete(i,null,t)},r.fire("remotestart",{data:e}),$.ajax(s)},getRemoteParams:function(){},_cancelRemote:function(e){var t=this;e=e||t.get("remoteHandler"),e&&(clearTimeout(e),t.setInternal("remoteHandler",null)),t.set("isLoading",!1)}},r.View=n,r});