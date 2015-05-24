
<%@ page import="com.lj.test.TestTest" %>
<!DOCTYPE html>
<html>
	<head>
        <g:set var="entityName" value="${message(code: 'testTest.label', default: 'TestTest')}"/>
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
                                
                                    <option value="iiTestSFRow">
                                        <g:message code="testTest.iiTest.label" default="Ii Test" />
                                    </option>
                                
                                    <option value="bTestSFRow">
                                        <g:message code="testTest.bTest.label" default="BT est" />
                                    </option>
                                
                                    <option value="cTestSFRow">
                                        <g:message code="testTest.cTest.label" default="CT est" />
                                    </option>
                                
                                    <option value="ccSFRow">
                                        <g:message code="testTest.cc.label" default="Cc" />
                                    </option>
                                
                                    <option value="dlTestSFRow">
                                        <g:message code="testTest.dlTest.label" default="Dl Test" />
                                    </option>
                                
                                    <option value="dtTestSFRow">
                                        <g:message code="testTest.dtTest.label" default="Dt Test" />
                                    </option>
                                
                                    <option value="ftTestSFRow">
                                        <g:message code="testTest.ftTest.label" default="Ft Test" />
                                    </option>
                                
                                    <option value="isGoodSFRow">
                                        <g:message code="testTest.isGood.label" default="Is Good" />
                                    </option>
                                
                                    <option value="lTestSFRow">
                                        <g:message code="testTest.lTest.label" default="LT est" />
                                    </option>
                                
                                    <option value="llSFRow">
                                        <g:message code="testTest.ll.label" default="Ll" />
                                    </option>
                                
                                    <option value="oneTestSFRow">
                                        <g:message code="testTest.oneTest.label" default="One Test" />
                                    </option>
                                
                                    <option value="ootSFRow">
                                        <g:message code="testTest.oot.label" default="Oot" />
                                    </option>
                                
                                    <option value="sTestSFRow">
                                        <g:message code="testTest.sTest.label" default="ST est" />
                                    </option>
                                
                                    <option value="stTestSFRow">
                                        <g:message code="testTest.stTest.label" default="St Test" />
                                    </option>
                                
                                    <option value="tzSFRow">
                                        <g:message code="testTest.tz.label" default="Tz" />
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

                    
                    <tr id="iiTestSFRow">
                        <input type="hidden" name="iiTest" value="true"/>
                        <td style="border: 0">
                            <label for="iiTest">
                                <g:message code="testTest.iiTest.label" default="Ii Test" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="iiTestOperator">
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
                            
                                
                                <g:select name="iiTestKey" from="${TestTest.constraints.iiTest.inList}"/>
                                
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    
                    <tr id="bTestSFRow">
                        <input type="hidden" name="bTest" value="true"/>
                        <td style="border: 0">
                            <label for="bTest">
                                <g:message code="testTest.bTest.label" default="BT est" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="bTestOperator">
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
                            
                                
                                <g:field name="bTestKey" type="number" value=""/>
                                
                            
                        </td>
                        <td style="border: 0">
                            <button type="button" class="button button-small" style="" data-name="removeSFRow">
                                <i class="icon-remove"></i>
                            </button>
                        </td>
                    </tr>
                    
                    <tr id="cTestSFRow">
                        <input type="hidden" name="cTest" value="true"/>
                        <td style="border: 0">
                            <label for="cTest">
                                <g:message code="testTest.cTest.label" default="CT est" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="cTestOperator">
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
                            
                                
                                <g:field name="cTestKey" type="number" value=""/>
                                
                            
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
                                <g:message code="testTest.cc.label" default="Cc" />
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
                                <g:message code="testTest.dlTest.label" default="Dl Test" />
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
                                <g:message code="testTest.dtTest.label" default="Dt Test" />
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
                                <g:message code="testTest.ftTest.label" default="Ft Test" />
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
                                <g:message code="testTest.isGood.label" default="Is Good" />
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
                    
                    <tr id="lTestSFRow">
                        <input type="hidden" name="lTest" value="true"/>
                        <td style="border: 0">
                            <label for="lTest">
                                <g:message code="testTest.lTest.label" default="LT est" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="lTestOperator">
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
                            
                                
                                <g:field name="lTestKey" type="number" value=""/>
                                
                            
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
                                <g:message code="testTest.ll.label" default="Ll" />
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
                                <g:message code="testTest.oneTest.label" default="One Test" />
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
                    
                    <tr id="ootSFRow">
                        <input type="hidden" name="oot" value="true"/>
                        <td style="border: 0">
                            <label for="oot">
                                <g:message code="testTest.oot.label" default="Oot" />
                            </label>
                        </td>
                        <td style="border: 0">
                            <select name="ootOperator">
                                <option value="equals">
                                    <g:message code="default.search.operator.equals.label" default="Equals" />
                                </option>
                                
                            </select>
                        </td>
                        <td style="border: 0">
                            
                                <g:select name="ootKey" from="${com.lj.test.over.OneOverTest.list()}" optionKey="id" class="many-to-one"/>
                            
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
                                <g:message code="testTest.sTest.label" default="ST est" />
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
                    
                    <tr id="stTestSFRow">
                        <input type="hidden" name="stTest" value="true"/>
                        <td style="border: 0">
                            <label for="stTest">
                                <g:message code="testTest.stTest.label" default="St Test" />
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
                                <g:message code="testTest.tz.label" default="Tz" />
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
                    {title: '<g:message code="testTest.id.label" default="Id"/>', dataIndex: 'id', width: 80, renderer: function (item) {
                        return Search.createLink({
                            id: item,
                            title: '${message(code: 'testTest.label', default: 'TestTest')}:'+item,
                            text: item,
                            href: '${createLink(action: "show")}/'+item
                        });
                    }}
                    
                             ,{title: '${message(code: 'testTest.iiTest.label', default: 'Ii Test')}', dataIndex: 'iiTest', width: 100}
                    
                             ,{title: '${message(code: 'testTest.bTest.label', default: 'BT est')}', dataIndex: 'bTest', width: 100}
                    
                             ,{title: '${message(code: 'testTest.cTest.label', default: 'CT est')}', dataIndex: 'cTest', width: 100}
                    
                             ,{title: '${message(code: 'testTest.cc.label', default: 'Cc')}', dataIndex: 'cc', width: 100}
                    
                             ,{title: '${message(code: 'testTest.dlTest.label', default: 'Dl Test')}', dataIndex: 'dlTest', width: 100}
                    
                             ,{title: '${message(code: 'testTest.dtTest.label', default: 'Dt Test')}', dataIndex: 'dtTest', width: 100}
                    
                             ,{title: '${message(code: 'testTest.ftTest.label', default: 'Ft Test')}', dataIndex: 'ftTest', width: 100}
                    
                             ,{title: '${message(code: 'testTest.isGood.label', default: 'Is Good')}', dataIndex: 'isGood', width: 100}
                    
                             ,{title: '${message(code: 'testTest.lTest.label', default: 'LT est')}', dataIndex: 'lTest', width: 100}
                    
                             ,{title: '${message(code: 'testTest.ll.label', default: 'Ll')}', dataIndex: 'll', width: 100}
                    
                            ,{title: '${message(code: 'testTest.oneTest.label', default: 'One Test')}', dataIndex: 'oneTest', width: 100,renderer:function(item){
                        return Search.createLink({
                            id: item.id,
                            title:'${message(code: 'testTest.oneTest.label', default: 'One Test')}:'+item.id,
                            text:'${message(code: 'testTest.oneTest.label', default: 'One Test')}:'+ item.id,
                            href: '${createLink(controller: "oneTest",action: "show")}/'+item.id
                        });}}
							
                            ,{title: '${message(code: 'testTest.oot.label', default: 'Oot')}', dataIndex: 'oot', width: 100,renderer:function(item){
                        return Search.createLink({
                            id: item.id,
                            title:'${message(code: 'testTest.oot.label', default: 'Oot')}:'+item.id,
                            text:'${message(code: 'testTest.oot.label', default: 'Oot')}:'+ item.id,
                            href: '${createLink(controller: "oneOverTest",action: "show")}/'+item.id
                        });}}
							
                             ,{title: '${message(code: 'testTest.sTest.label', default: 'ST est')}', dataIndex: 'sTest', width: 100}
                    
                    ,{title: '${message(code: 'testTest.secondTests.label', default: 'Second Tests')}', dataIndex: 'secondTests', width: 100,renderer:function(items){
                        var result="";
                        for(i=0;i<items.length;i++){
                            var item=items[i];
                            result+=Search.createLink({
                                id: item.id,
                                title:'${message(code: 'testTest.secondTests.label', default: 'Second Tests')}:'+item.id,
                                text:'${message(code: 'testTest.secondTests.label', default: 'Second Tests')}:'+ item.id,
                                href: '${createLink(controller: "secondTest",action: "show")}/'+item.id
                            })+"<br/>";
                        }
                        return result;
                    }}
            
                             ,{title: '${message(code: 'testTest.stTest.label', default: 'St Test')}', dataIndex: 'stTest', width: 100}
                    
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
