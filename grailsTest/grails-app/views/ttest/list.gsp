
<%@ page import="com.lj.test.Ttest" %>
<!DOCTYPE html>
<html>
	<head>
        <g:set var="entityName" value="${message(code: 'ttest.label', default: 'Ttest')}"/>
        <title><g:message code="default.list.label" args="[entityName]"/></title>
        <link href="${resource(dir: "/bui/css", file: "dpl-min.css")}" rel="stylesheet" type="text/css"/>
        <link href="${resource(dir: "/bui/css", file: "bui-min.css")}" rel="stylesheet" type="text/css"/>
        <link href="${resource(dir: "/bui/css", file: "main-min.css")}" rel="stylesheet" type="text/css"/>
        %{-- <g:javascript library="jquery"/>--}%
        <script type="text/javascript" src="${resource(dir: "/bui", file: "jquery-1.8.1.min.js")}"></script>
        <script type="text/javascript" src="${resource(dir: "/bui", file: "bui-min.js")}"></script>

	</head>
	<body style="margin: 15px;overflow: auto">
    <div class="panel" id="searchPanel">
        <div class="panel-header" style="height: 20px;">
            <div class="pull-left">
                <h3><g:message code="default.search.label" default="Search" /></h3>
            </div>
            <div class="pull-right">
                <button class="button button-small" onclick="expandSearchPanel()" id="searchPanelExpandBt" style="display: none;">
                    <i class="icon-chevron-down"></i>
                </button>
                <button class="button button-small" onclick="packUpSearchPanel()"  id="searchPanelPackUpBt">
                    <i class="icon-chevron-up"></i>
                </button>
            </div>
        </div>

        

        <div class="panel-body" id="searchPanmel-body">

            <form class="form-horizontal " id="searchForm">
                <table class="table" style="width: auto;">
                    <thead>
                    <tr>
                        <th><g:message code="default.search.field.label" default="Search Field" /></th>
                        <th>
                            <select id="addSFRowSelect">
                                
                                    <option value="iTestSFRow">
                                        <g:message code="ttest.iTest.label" default="IT est" />
                                    </option>
                                
                                    <option value="ccSFRow">
                                        <g:message code="ttest.cc.label" default="Cc" />
                                    </option>
                                
                                    <option value="dlTestSFRow">
                                        <g:message code="ttest.dlTest.label" default="Dl Test" />
                                    </option>
                                
                                    <option value="dtTestSFRow">
                                        <g:message code="ttest.dtTest.label" default="Dt Test" />
                                    </option>
                                
                                    <option value="ftTestSFRow">
                                        <g:message code="ttest.ftTest.label" default="Ft Test" />
                                    </option>
                                
                                    <option value="isGoodSFRow">
                                        <g:message code="ttest.isGood.label" default="Is Good" />
                                    </option>
                                
                                    <option value="llSFRow">
                                        <g:message code="ttest.ll.label" default="Ll" />
                                    </option>
                                
                                    <option value="oneTestSFRow">
                                        <g:message code="ttest.oneTest.label" default="One Test" />
                                    </option>
                                
                                    <option value="sTestSFRow">
                                        <g:message code="ttest.sTest.label" default="ST est" />
                                    </option>
                                
                                    <option value="secondTestsSFRow">
                                        <g:message code="ttest.secondTests.label" default="Second Tests" />
                                    </option>
                                
                                    <option value="stTestSFRow">
                                        <g:message code="ttest.stTest.label" default="St Test" />
                                    </option>
                                
                                    <option value="tzSFRow">
                                        <g:message code="ttest.tz.label" default="Tz" />
                                    </option>
                                
                            </select>
                        </th>
                        <th>
                            <button type="button" class="button button-small" style="" id="addSFRowButton">
                                <g:message code="default.search.add.label" default="Add Field" />
                            </button>
                        </th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>

                    
                    <tr id="iTestSFRow">
                        <input type="hidden" name="iTest" value="true"/>
                        <td style="border: 0">
                            <label for="iTest">
                                <g:message code="ttest.iTest.label" default="IT est" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="iTestOperator">
                                <option value="equals">
                                    <g:message code="default.search.operator.equals.label" default="Equals" />
                                </option>
                                
                                <option value="gt">
                                    <g:message code="default.search.operator.gt.label" default="Greater" />
                                </option>
                                <option value="ge">
                                    <g:message code="default.search.operator.ge.label" default="Greater or Equal" />
                                </option>
                                <option value="lt">
                                    <g:message code="default.search.operator.lt.label" default="Less" />
                                </option>
                                <option value="le">
                                    <g:message code="default.search.operator.le.label" default="Less or Equal" />
                                </option>
                                
                            </select>
                        </td>
                        <td style="border: 0">
                            
                                
                                <g:select name="iTestKey" from="${Ttest.constraints.iTest.inList}"/>
                                
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    
                    <tr id="ccSFRow">
                        <input type="hidden" name="cc" value="true"/>
                        <td style="border: 0">
                            <label for="cc">
                                <g:message code="ttest.cc.label" default="Cc" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="ccOperator">
                                <option value="equals">
                                    <g:message code="default.search.operator.equals.label" default="Equals" />
                                </option>
                                
                            </select>
                        </td>
                        <td style="border: 0">
                            
                                    <g:currencySelect name="ccKey"
                                     />
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    
                    <tr id="dlTestSFRow">
                        <input type="hidden" name="dlTest" value="true"/>
                        <td style="border: 0">
                            <label for="dlTest">
                                <g:message code="ttest.dlTest.label" default="Dl Test" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="dlTestOperator">
                                <option value="equals">
                                    <g:message code="default.search.operator.equals.label" default="Equals" />
                                </option>
                                
                                <option value="gt">
                                    <g:message code="default.search.operator.gt.label" default="Greater" />
                                </option>
                                <option value="ge">
                                    <g:message code="default.search.operator.ge.label" default="Greater or Equal" />
                                </option>
                                <option value="lt">
                                    <g:message code="default.search.operator.lt.label" default="Less" />
                                </option>
                                <option value="le">
                                    <g:message code="default.search.operator.le.label" default="Less or Equal" />
                                </option>
                                
                            </select>
                        </td>
                        <td style="border: 0">
                            
                                
                                <g:field name="dlTestKey" type="number" value=""/>
                                
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    
                    <tr id="dtTestSFRow">
                        <input type="hidden" name="dtTest" value="true"/>
                        <td style="border: 0">
                            <label for="dtTest">
                                <g:message code="ttest.dtTest.label" default="Dt Test" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="dtTestOperator">
                                <option value="equals">
                                    <g:message code="default.search.operator.equals.label" default="Equals" />
                                </option>
                                
                                <option value="gt">
                                    <g:message code="default.search.operator.gt.label" default="Greater" />
                                </option>
                                <option value="ge">
                                    <g:message code="default.search.operator.ge.label" default="Greater or Equal" />
                                </option>
                                <option value="lt">
                                    <g:message code="default.search.operator.lt.label" default="Less" />
                                </option>
                                <option value="le">
                                    <g:message code="default.search.operator.le.label" default="Less or Equal" />
                                </option>
                                
                            </select>
                        </td>
                        <td style="border: 0">
                            
                                <input name="dtTestKey" type="text" class="calendar calendar-time" />
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    
                    <tr id="ftTestSFRow">
                        <input type="hidden" name="ftTest" value="true"/>
                        <td style="border: 0">
                            <label for="ftTest">
                                <g:message code="ttest.ftTest.label" default="Ft Test" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="ftTestOperator">
                                <option value="equals">
                                    <g:message code="default.search.operator.equals.label" default="Equals" />
                                </option>
                                
                                <option value="gt">
                                    <g:message code="default.search.operator.gt.label" default="Greater" />
                                </option>
                                <option value="ge">
                                    <g:message code="default.search.operator.ge.label" default="Greater or Equal" />
                                </option>
                                <option value="lt">
                                    <g:message code="default.search.operator.lt.label" default="Less" />
                                </option>
                                <option value="le">
                                    <g:message code="default.search.operator.le.label" default="Less or Equal" />
                                </option>
                                
                            </select>
                        </td>
                        <td style="border: 0">
                            
                                
                                <g:field name="ftTestKey" type="number" value=""/>
                                
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    
                    <tr id="isGoodSFRow">
                        <input type="hidden" name="isGood" value="true"/>
                        <td style="border: 0">
                            <label for="isGood">
                                <g:message code="ttest.isGood.label" default="Is Good" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="isGoodOperator">
                                <option value="equals">
                                    <g:message code="default.search.operator.equals.label" default="Equals" />
                                </option>
                                
                            </select>
                        </td>
                        <td style="border: 0">
                            
                                <select  name="isGoodKey">
                                    <option value="true"><g:formatBoolean boolean="true" /></option>
                                    <option value="false"><g:formatBoolean boolean="false" /></option>
                                </select>
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    
                    <tr id="llSFRow">
                        <input type="hidden" name="ll" value="true"/>
                        <td style="border: 0">
                            <label for="ll">
                                <g:message code="ttest.ll.label" default="Ll" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="llOperator">
                                <option value="equals">
                                    <g:message code="default.search.operator.equals.label" default="Equals" />
                                </option>
                                
                            </select>
                        </td>
                        <td style="border: 0">
                            
                                    <g:localeSelect name="llKey"
                                     />
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    
                    <tr id="oneTestSFRow">
                        <input type="hidden" name="oneTest" value="true"/>
                        <td style="border: 0">
                            <label for="oneTest">
                                <g:message code="ttest.oneTest.label" default="One Test" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="oneTestOperator">
                                <option value="equals">
                                    <g:message code="default.search.operator.equals.label" default="Equals" />
                                </option>
                                
                            </select>
                        </td>
                        <td style="border: 0">
                            
                                <g:select name="oneTestKey" from="${com.lj.test.OneTest.list()}" optionKey="id" class="many-to-one"/>
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    
                    <tr id="sTestSFRow">
                        <input type="hidden" name="sTest" value="true"/>
                        <td style="border: 0">
                            <label for="sTest">
                                <g:message code="ttest.sTest.label" default="ST est" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="sTestOperator">
                                <option value="equals">
                                    <g:message code="default.search.operator.equals.label" default="Equals" />
                                </option>
                                
                                    <option value="contains">
                                        <g:message code="default.search.operator.contains.label" default="Contains" />
                                    </option>
                                    <option value="start">
                                        <g:message code="default.search.operator.start.label" default="Start" />
                                    </option>
                                    <option value="end">
                                        <g:message code="default.search.operator.end.label" default="End" />
                                    </option>
                                
                            </select>
                        </td>
                        <td style="border: 0">
                            
                                <g:textField name="sTestKey" value=""/>
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    
                    <tr id="secondTestsSFRow">
                        <input type="hidden" name="secondTests" value="true"/>
                        <td style="border: 0">
                            <label for="secondTests">
                                <g:message code="ttest.secondTests.label" default="Second Tests" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="secondTestsOperator">
                                <option value="equals">
                                    <g:message code="default.search.operator.equals.label" default="Equals" />
                                </option>
                                
                                    <option value="contains">
                                        <g:message code="default.search.operator.contains.label" default="Contains" />
                                    </option>
                                
                            </select>
                        </td>
                        <td style="border: 0">
                            
                                <g:select name="secondTestsKey" from="${com.lj.test.SecondTest.list()}" size="5" multiple="multiple" optionKey="id" class="control-row3"/>
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    
                    <tr id="stTestSFRow">
                        <input type="hidden" name="stTest" value="true"/>
                        <td style="border: 0">
                            <label for="stTest">
                                <g:message code="ttest.stTest.label" default="St Test" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="stTestOperator">
                                <option value="equals">
                                    <g:message code="default.search.operator.equals.label" default="Equals" />
                                </option>
                                
                                <option value="gt">
                                    <g:message code="default.search.operator.gt.label" default="Greater" />
                                </option>
                                <option value="ge">
                                    <g:message code="default.search.operator.ge.label" default="Greater or Equal" />
                                </option>
                                <option value="lt">
                                    <g:message code="default.search.operator.lt.label" default="Less" />
                                </option>
                                <option value="le">
                                    <g:message code="default.search.operator.le.label" default="Less or Equal" />
                                </option>
                                
                            </select>
                        </td>
                        <td style="border: 0">
                            
                                
                                <g:field name="stTestKey" type="number" value=""/>
                                
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    
                    <tr id="tzSFRow">
                        <input type="hidden" name="tz" value="true"/>
                        <td style="border: 0">
                            <label for="tz">
                                <g:message code="ttest.tz.label" default="Tz" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="tzOperator">
                                <option value="equals">
                                    <g:message code="default.search.operator.equals.label" default="Equals" />
                                </option>
                                
                            </select>
                        </td>
                        <td style="border: 0">
                            
                                    <g:timeZoneSelect name="tzKey"
                                     />
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    

                    <tr>
                        <td style="border: 0"></td>
                        <td style="border: 0"></td>
                        <td style="border: 0"></td>
                        <td style="border: 0">
                            <button  type="button" id="btnSearch" class="button button-primary">
                                ${message(code: 'default.button.search.label', default: 'Search')}
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>


    <div class="search-grid-container">
        <div id="grid" style="margin-right: 5px;"></div>
    </div>




	</body>



<script type="text/javascript">
    function packUpSearchPanel(){
        $("#searchPanmel-body").hide(300);
        $("#searchPanelExpandBt").show();
        $("#searchPanelPackUpBt").hide();
    }
    function expandSearchPanel(){
        $("#searchPanmel-body").show(300);
        $("#searchPanelExpandBt").hide();
        $("#searchPanelPackUpBt").show();
    }
</script>

<script type="text/javascript">
    BUI.use('bui/calendar',function(Calendar){
        var datepicker = new Calendar.DatePicker({
            trigger:'.calendar-time',
            showTime : true,
            dateMask : 'yyyy-mm-dd HH:MM:ss',
            autoRender : true
        });
    });
</script>

<script type="text/javascript">
    BUI.use(['common/search', 'common/page'], function (Search) {

        var columns = [
                    {title: '<g:message code="ttest.id.label" default="Id"/>', dataIndex: 'id', width: 80, renderer: function (item) {
                        return Search.createLink({
                            id: item,
                            title: '${message(code: 'ttest.label', default: 'Ttest')}:'+item,
                            text: item,
                            href: '${createLink(action: "show")}/'+item
                        });
                    }}
                    
                             ,{title: '${message(code: 'ttest.iTest.label', default: 'IT est')}', dataIndex: 'iTest', width: 100}
                    
                             ,{title: '${message(code: 'ttest.cc.label', default: 'Cc')}', dataIndex: 'cc', width: 100}
                    
                             ,{title: '${message(code: 'ttest.dlTest.label', default: 'Dl Test')}', dataIndex: 'dlTest', width: 100}
                    
                             ,{title: '${message(code: 'ttest.dtTest.label', default: 'Dt Test')}', dataIndex: 'dtTest', width: 100}
                    
                             ,{title: '${message(code: 'ttest.ftTest.label', default: 'Ft Test')}', dataIndex: 'ftTest', width: 100}
                    
                             ,{title: '${message(code: 'ttest.isGood.label', default: 'Is Good')}', dataIndex: 'isGood', width: 100}
                    
                             ,{title: '${message(code: 'ttest.ll.label', default: 'Ll')}', dataIndex: 'll', width: 100}
                    
                            ,{title: '${message(code: 'ttest.oneTest.label', default: 'One Test')}', dataIndex: 'oneTest', width: 100,renderer:function(item){
                        return Search.createLink({
                            id: item.id,
                            title:'${message(code: 'ttest.oneTest.label', default: 'One Test')}:'+item.id,
                            text:'${message(code: 'ttest.oneTest.label', default: 'One Test')}:'+ item.id,
                            href: '${createLink(controller: "oneTest",action: "show")}/'+item.id
                        });}}
							
                             ,{title: '${message(code: 'ttest.sTest.label', default: 'ST est')}', dataIndex: 'sTest', width: 100}
                    
                    ,{title: '${message(code: 'ttest.secondTests.label', default: 'Second Tests')}', dataIndex: 'secondTests', width: 100,renderer:function(items){
                        var result="";
                        for(i=0;i<items.length;i++){
                            var item=items[i];
                            result+=Search.createLink({
                                id: item.id,
                                title:'${message(code: 'ttest.secondTests.label', default: 'Second Tests')}:'+item.id,
                                text:'${message(code: 'ttest.secondTests.label', default: 'Second Tests')}:'+ item.id,
                                href: '${createLink(controller: "secondTest",action: "show")}/'+item.id
                            })+"<br/>";
                        }
                        return result;
                    }}
                    
                   ,
                    {title: '${message(code: 'default.button.operate.label', default: 'Operate')}', dataIndex: '', width: 200, renderer: function (value, obj) {
                        return "<a class='grid-command btn-edit' href='${createLink(action: "edit")}/"+obj.id+"'>${message(code:"default.button.edit.label",default:"Edit")}</a>"+
                                '<span class="grid-command btn-del">${message(code:"default.button.delete.label",default:"Delete")}</span>'
                    }}
                ],
                store = Search.createStore('${createLink(action: "listJson")}', {
//                    limit:10,
                    autoSync: true //保存数据后，自动更新
                }),
                gridCfg = Search.createGridCfg(columns, {
                    tbar: {
                        items: [
                            {text: '<i class="icon-plus"></i>${message(code:"default.button.new.label",default:"New")}', btnCls: 'button button-small', handler: addFunction},
                            {text: '<i class="icon-remove"></i>${message(code:"default.button.delete.label",default:"Delete")}', btnCls: 'button button-small', handler: delFunction}
                        ]
                    },
                    plugins: [ BUI.Grid.Plugins.CheckSelection, BUI.Grid.Plugins.AutoFit] // 插件形式引入多选表格
                });

        var search = new Search({
                    store: store,
//                    limit:10,
                    gridCfg: gridCfg
                }),
                grid = search.get('grid');

        function addFunction() {
            location.href='${createLink(action: "create")}';
        }

        //删除操作
        function delFunction(){
            var selections = grid.getSelection();
            delItems(selections);
        }

        function delItems(items){
            var ids = [];
            BUI.each(items,function(item){
                ids.push(item.id);
            });

            if(ids.length){
                BUI.Message.Confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}',function(){
                    $.ajax({
                        url : '${createLink(action: "deleteJson")}',
                        type:"post",
                        dataType : 'json',
                        data : {ids : ids},
                        success : function(data){
                            if(data.success){ //删除成功
                                search.load();
                            }else{ //删除失败
                                BUI.Message.Alert('删除失败！');
                            }
                        }
                    });
                },'question');
            }
        }

        //监听事件，删除一条记录
        grid.on('cellclick', function (ev) {
            var sender = $(ev.domTarget); //点击的Dom
            if (sender.hasClass('btn-del')) {
                var record = ev.record;
                delItems([record]);
            }
        });

        $("button[data-name='removeSFRow']").click(function(){
            $(this).parent().parent().css("display","none");
            $(this).parent().parent().children("input[type='hidden']").val("false");
        });
        $("#addSFRowButton").click(function(){
            var addSFRowSelectStr=$("#addSFRowSelect").val();
            $("#"+addSFRowSelectStr).css("display","");
            $("#"+addSFRowSelectStr).children("input[type='hidden']").val("true");
        });
    });
</script>
</html>
