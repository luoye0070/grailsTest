<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14-12-24
  Time: 下午11:34
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
    <link href="${resource(dir: "/bui/css", file: "dpl-min.css")}" rel="stylesheet" type="text/css"/>
    <link href="${resource(dir: "/bui/css", file: "bui-min.css")}" rel="stylesheet" type="text/css"/>
    <link href="${resource(dir: "/bui/css", file: "main-min.css")}" rel="stylesheet" type="text/css"/>
   %{-- <g:javascript library="jquery"/>--}%
    <script type="text/javascript" src="${resource(dir: "/bui", file: "jquery-1.8.1.min.js")}"></script>
    <script type="text/javascript" src="${resource(dir: "/bui", file: "bui-min.js")}"></script>

</head>
<body>
<div class="header">

    <div class="dl-title">
        <a href="http://www.builive.com" title="文档库地址" target="_blank"><!-- 仅仅为了提供文档的快速入口，项目中请删除链接 -->
            <span class="lp-title-port"></span><span class="dl-title-text">饭店预订饭店管理</span>
        </a>
    </div>

    <div class="dl-log">
        欢迎您，<span class="dl-log-user">dd</span>
        <g:if test="${session.shopManagerId}">
            <a href="${createLink(controller: "dinnerShopManager",action: "logout")}" title="退出系统" class="dl-log-quit">[退出]</a>
        </g:if>
        <g:else>
            <a href="${createLink(controller: "dinnerShopManager",action: "login")}" title="登录" class="dl-log-quit">[登录]</a>
        </g:else>
    </div>
</div>

<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title">贴心小秘书<s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav" class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">首页</div></li>
            <li class="nav-item"><div class="nav-item-inner nav-order">支付系统</div></li>
            %{--<li class="nav-item"><div class="nav-item-inner nav-inventory">用户系统</div></li>--}%
            %{--<li class="nav-item"><div class="nav-item-inner nav-supplier">详情页</div></li>--}%
        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script>
    BUI.use('common/main', function () {
        var config = [
            {
                id: 'menu',
                homePage: 'dinnerFoodClassInfo',
                menu: [
                    {
                        text: '数据库管理',
                        items: [
                            {id: 'dinnerFoodClassInfo', text: '菜单类别管理', href: '${createLink(controller: "dinnerFoodClassInfo",action: "list",params:[loginBackTag:"menu/dinnerFoodClassInfo"])}', closeable: false},
                            %{--{id: 'dinnerFoodInfo', text: '菜单管理', href: '${createLink(controller: 'dinnerFoodInfo', action: 'list')}'},--}%
                            {id: 'dinnerFoodManage', text: '菜单管理', href: '${createLink(controller: 'dinnerFoodManage', action: 'foodList',params:[loginBackTag:"menu/dinnerFoodManage"])}'},
                            %{--{id: 'dinnerImageClassInfo', text: '图片类别管理', href: '${createLink(controller: 'dinnerImageClassInfo', action: 'list')}'},--}%
                            %{--{id: 'dinnerImageSpace', text: '图片管理', href: '${createLink(controller: 'dinnerImageInfo', action: 'list')}'},--}%
                            {id: 'dinnerImageSpace', text: '图片空间管理', href: '${createLink(controller: 'dinnerImageSpace', action: 'upload',params:[loginBackTag:"menu/dinnerImageSpace"])}'},
                            {id: 'editReserveType', text: '预定类型时间管理', href: '${createLink(controller: 'dinnerShopManager', action: 'editReserveType',params:[loginBackTag:"menu/editReserveType"])}'},
                            {id: 'orderList', text: '订单管理', href: '${createLink(controller: 'dinnerStaff', action: 'orderList',params:[loginBackTag:"menu/orderList"])}'},
                            {id: 'staffList', text: '工作人员管理', href: '${createLink(controller: 'dinnerStaffInfo', action: 'list',params:[loginBackTag:"menu/staffList"])}'}
                             <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                                    ,{id: '${c.fullName}', text: '${c.fullName}', href: '${createLink(controller: c.logicalPropertyName)}'}
                    </g:each>
                        ]
                    }
                    %{--,--}%
                    %{--{--}%
                    %{--text: '系统管理',--}%
                    %{--items: [--}%
                    %{--{id: 'manager', text: '管理员管理', href: '${createLink(controller: "manager",action: "list",params:[loginBackTag:"menu/manager"])}'},--}%
                    %{--{id: 'app-list', text: '接入应用管理', href: '${createLink(controller: "appInfo",action: "list",params:[loginBackTag:"menu/app-list"])}'},--}%
                    %{--{id: 'client-list', text: '客户端管理', href: '${createLink(controller: "dinnerClientInfo",action: "list",params:[loginBackTag:"menu/client-list"])}'}--}%
                    %{--]--}%
                    %{--}--}%
                ]
            }
            ,
            {
            id: 'user',
            menu: [
            {
            text: '会员管理',
            items: [
            {id: 'member-list', text: '会员管理', href: '${createLink(controller: "member",action: "list",params:[loginBackTag:"user/member"])}'}
            ]
            },
            {
            text: 'app管理',
            items: [
            {id: 'userApp-list', text: '接入应用管理', href: '${createLink(controller: "userApp",action: "list",params:[loginBackTag:"user/userApp"])}'},
            ]
            }
            ]
            }
        ];
        new PageUtil.MainPage({
            modulesConfig: config
        });
    });
</script>
</body>
</html>