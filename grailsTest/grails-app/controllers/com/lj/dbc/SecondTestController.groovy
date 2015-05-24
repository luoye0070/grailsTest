package com.lj.dbc

import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException

import com.lj.test.SecondTest
import org.springframework.validation.ObjectError


class SecondTestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST",delete: "GET"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {

        params.max = Math.min(max ?: 10, 100)
        render(view:"/dbc/SecondTest/list",model:[secondTestInstanceList: SecondTest.list(params), secondTestInstanceTotal: SecondTest.count()])
    }

    def create() {
        render(view:"/dbc/SecondTest/create",model:[secondTestInstance: new SecondTest(params)])
    }

    def save() {
        def secondTestInstance = new SecondTest(params)
        if (!secondTestInstance.save(flush: true)) {
            render(view: "/dbc/SecondTest/create", model: [secondTestInstance: secondTestInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'secondTest.label', default: 'SecondTest'), secondTestInstance.id])
        redirect(action: "show", id: secondTestInstance.id)
    }

    def show(Long id) {
        def secondTestInstance = SecondTest.get(id)
        if (!secondTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secondTest.label', default: 'SecondTest'), id])
            redirect(action: "list")
            return
        }

        render(view:"/dbc/SecondTest/show",model:[secondTestInstance: secondTestInstance])
    }

    def edit(Long id) {
        def secondTestInstance = SecondTest.get(id)
        if (!secondTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secondTest.label', default: 'SecondTest'), id])
            redirect(action: "list")
            return
        }

        render(view:"/dbc/SecondTest/edit",model:[secondTestInstance: secondTestInstance])
    }

    def update(Long id, Long version) {
        def secondTestInstance = SecondTest.get(id)
        if (!secondTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secondTest.label', default: 'SecondTest'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (secondTestInstance.version > version) {
                secondTestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'secondTest.label', default: 'SecondTest')] as Object[],
                          "Another user has updated this SecondTest while you were editing")
                render(view: "/dbc/SecondTest/edit", model: [secondTestInstance: secondTestInstance])
                return
            }
        }
                        println("params-->"+params)
        secondTestInstance.properties = params

        if (!secondTestInstance.save(flush: true)) {
            render(view: "/dbc/SecondTest/edit", model: [secondTestInstance: secondTestInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'secondTest.label', default: 'SecondTest'), secondTestInstance.id])
        redirect(action: "show", id: secondTestInstance.id)
    }

    def delete(Long id) {
        def secondTestInstance = SecondTest.get(id)
        if (!secondTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secondTest.label', default: 'SecondTest'), id])
            redirect(action: "list")
            return
        }

        try {
            secondTestInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'secondTest.label', default: 'SecondTest'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'secondTest.label', default: 'SecondTest'), id])
            redirect(action: "show", id: id)
        }
    }

    def listJson() {
        println("params--->"+params);

        params.max = Math.min(params.limit as Integer ?: 10, 100)
        params.offset= params.start

        if(params.name){
            println("params.name--->"+params.name);
        }

        def conditions={
            if(params.name&&params.name=="true"){
                if(params.nameOperator=="contains"){
                    like("name","%"+params.nameKey+"%");
                }else if(params.nameOperator=="start"){
                    like("name",params.nameKey+"%");
                } else if(params.nameOperator=="end"){
                    like("name","%"+params.nameKey);
                }else if(params.nameOperator=="equals"){
                    eq("name",params.nameKey);
                }
            }
        }
        def rows=SecondTest.createCriteria().list(params,conditions);
        def totalCount = SecondTest.createCriteria().count(conditions);
        //render(view:"/dbc/SecondTest/list",model:[secondTestInstanceList: SecondTest.list(params), secondTestInstanceTotal: SecondTest.count()])
        def resultObj=[rows : rows, //数据集合
                 results : totalCount, //记录总数
               hasError : false, //是否存在错误
               error : "" // 仅在 hasError : true 时使用
        ];
        println("resultObj-->"+(resultObj as JSON))
        render resultObj as JSON;
    }
    def deleteJson() {
        println("params-->"+params)
         def idsP=params.get("ids[]");
        println("idsP-->"+idsP)
        def ids;
        if(idsP){
            if(idsP instanceof Object[]){
                ids=idsP;
            }else{
                ids=new String[1];
                ids[0]=idsP;
            }
            println("ids-->"+idsP);
            for(int i=0;i<ids.length;i++){
                def id=ids[i];
                def secondTestInstance = SecondTest.get(id)
                try {
                    secondTestInstance.delete(flush: true)
                }
                catch (DataIntegrityViolationException e) {
                    def message = message(code: 'default.not.deleted.message', args: [message(code: 'secondTest.label', default: 'SecondTest'), id])
                    def resultObj=[success:false,message:message];
                    render resultObj as JSON;
                    return
                }
            }
            def message = message(code: 'default.deleted.message', args: [message(code: 'secondTest.label', default: 'SecondTest'), ids])
            def resultObj=[success:true,message:message];
            render resultObj as JSON;
        }

    }

//    def updateJson(Long id, Long version) {
//        def secondTestInstance = SecondTest.get(id)
//        if (!secondTestInstance) {
//            def message = message(code: 'default.not.found.message', args: [message(code: 'secondTest.label', default: 'SecondTest'), id])
//            def resultObj=[success:true,message:message];
//            render resultObj as JSON;
//            return
//        }
//
//        if (version != null) {
//            if (secondTestInstance.version > version) {
//                secondTestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
//                        [message(code: 'secondTest.label', default: 'SecondTest')] as Object[],
//                        "Another user has updated this SecondTest while you were editing")
//                StringBuffer sb=new StringBuffer()
//                for(def error in secondTestInstance.errors){
//                    if(error instanceof  String)
//                        sb.append(error+"\n")
//                    else if(error instanceof ObjectError)
//                        sb.append(g.message(error:error)+"\n")
//                }
//                def resultObj=[success:false,message:sb.toString()];
//                render resultObj as JSON;
//                return
//            }
//        }
//        println("params-->"+params)
//        secondTestInstance.properties = params
//
//        if (!secondTestInstance.save(flush: true)) {
//            StringBuffer sb=new StringBuffer()
//            for(def error in secondTestInstance.errors){
//                if(error instanceof  String)
//                    sb.append(error+"\n")
//                else if(error instanceof ObjectError)
//                    sb.append(g.message(error:error)+"\n")
//            }
//            def resultObj=[success:false,message:sb.toString()];
//            render resultObj as JSON;
//            return
//        }
//
//        def message = message(code: 'default.updated.message', args: [message(code: 'secondTest.label', default: 'SecondTest'), secondTestInstance.id])
//        def resultObj=[success:false,message:message];
//        render resultObj as JSON;
//        return
//    }

}
