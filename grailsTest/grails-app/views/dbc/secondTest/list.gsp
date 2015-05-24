<%@ page import="com.lj.test.SecondTest" %>
<!DOCTYPE html>
<html>
<head>
    <g:set var="entityName" value="${message(code: 'secondTest.label', default: 'SecondTest')}"/>
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
            <h3>搜索</h3>
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
                <th>查询字段</th>
                <th>
                   <select id="addSFRowSelect">
                       <option value="nameSFRow">name</option>
                       <option value="otsSFRow">ots</option>
                       <option value="otSFRow">ot</option>
                   </select>
                </th>
                <th>
                    <button type="button" class="button button-small" style="" id="addSFRowButton">
                        add
                    </button>
                </th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <tr id="nameSFRow">
                <input type="hidden" name="name" value="true"/>
                <td style="border: 0">
                    <label for="name">
                        <g:message code="secondTest.name.label" default="Name" />
                    </label>
                </td>
                <td style="border: 0">
                    <select name="nameOperator">
                        <option value="contains">包含</option>
                        <option value="equals">等于</option>
                        <option value="start">开始于</option>
                        <option value="end">结束于</option>
                    </select>
                </td>
                <td style="border: 0">
                    <g:textField name="nameKey" value="${secondTestInstance?.name}"/>
                </td>
                <td style="border: 0">
                    <button type="button" class="button button-small" style="" data-name="removeSFRow">
                        <i class="icon-remove"></i>
                    </button>
                </td>
            </tr>
            <tr id="otsSFRow">
                <input type="hidden" name="ots" value="true"/>
                <td style="border: 0">
                    <label for="ots">
                        <g:message code="secondTest.ots.label" default="Ots" />
                    </label>
                </td>
                <td style="border: 0">
                    <select name="otsOperator">
                        <option>包含</option>
                        <option>等于</option>
                        <option>以之开始</option>
                        <option>以之结束</option>
                    </select>
                </td>
                <td style="border: 0">
                    <g:select name="otsKey" from="${com.lj.test.OneTestSub.list()}" multiple="multiple" optionKey="id" value="${secondTestInstance?.ots*.id}" class="control-row3"/>
                </td>
                <td style="border: 0">
                    <button type="button" class="button button-small" style="" data-name="removeSFRow">
                        <i class="icon-remove"></i>
                    </button>
                </td>
            </tr>
            <tr id="otSFRow">
                <input type="hidden" name="ot" value="true"/>
                <td style="border: 0">
                    <label for="ot">
                        <g:message code="secondTest.ot.label" default="Ot" />
                        <span class="required-indicator">*</span>
                    </label>
                </td>
                <td style="border: 0">
                    <select>
                        <option>包含</option>
                        <option>等于</option>
                        <option>以之开始</option>
                        <option>以之结束</option>
                    </select>
                </td>
                <td style="border: 0">
                    <g:select id="ot" name="ot.id" from="${com.lj.test.OneTest.list()}" optionKey="id" required="" value="${secondTestInstance?.ot?.id}" class="many-to-one"/>
                    ><input id="t2" type="text" class="calendar calendar-time" />
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
                    <button  type="button" id="btnSearch" class="button button-primary">${message(code: 'default.button.search.label', default: 'Search')}</button>
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
            dateMask : 'yyyy/mm/dd HH:MM:ss',
            autoRender : true
        });
    });
</script>


<script type="text/javascript">
    BUI.use(['common/search', 'common/page'], function (Search) {

        var columns = [
                    {title: '<g:message code="secondTest.id.label" default="Id"/>', dataIndex: 'id', width: 80, renderer: function (item) {
                        return Search.createLink({
                            id: item,
                            title: '${message(code: 'secondTest.label', default: 'SecondTest')}:'+item,
                            text: item,
                            href: '${createLink(action: "show")}/'+item
                        });
                    }},
                    {title: '${message(code: 'secondTest.name.label', default: 'Name')}', dataIndex: 'name', width: 100,renderer:function(item){
                         return "";
                    }},
                    {title: '${message(code: 'secondTest.name.label', default: 'Name')}', dataIndex: 'name', width: 100},
                    {title: '<g:message code="secondTest.ot.label" default="Ot"/>', dataIndex: 'ot', width: 100,renderer:function(item){
                        return Search.createLink({
                            id: item.id,
                            title:item.id,
                            text: item.id,
                            href: '${createLink(controller: "oneTest",action: "show")}/'+item.id
                        });
                    }},
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
