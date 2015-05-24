
<%@ page import="com.lj.test.over.OneOverTest" %>
<!DOCTYPE html>
<html>
	<head>
        <g:set var="entityName" value="${message(code: 'oneOverTest.label', default: 'OneOverTest')}"/>
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
                                
                                    <option value="codeSFRow">
                                        <g:message code="oneOverTest.code.label" default="Code" />
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

                    
                    <tr id="codeSFRow">
                        <input type="hidden" name="code" value="true"/>
                        <td style="border: 0">
                            <label for="code">
                                <g:message code="oneOverTest.code.label" default="Code" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="codeOperator">
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
                            
                                
                                <g:field name="codeKey" type="number" value=""/>
                                
                            
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
                    {title: '<g:message code="oneOverTest.id.label" default="Id"/>', dataIndex: 'id', width: 80, renderer: function (item) {
                        return Search.createLink({
                            id: item,
                            title: '${message(code: 'oneOverTest.label', default: 'OneOverTest')}:'+item,
                            text: item,
                            href: '${createLink(action: "show")}/'+item
                        });
                    }}
                    
                             ,{title: '${message(code: 'oneOverTest.code.label', default: 'Code')}', dataIndex: 'code', width: 100}
                    
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
