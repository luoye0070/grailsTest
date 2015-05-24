package com.lj.test

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
class TtestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ttestInstanceList: Ttest.list(params), ttestInstanceTotal: Ttest.count()]
    }

    def create() {
        [ttestInstance: new Ttest(params)]
    }

    def save() {
        def ttestInstance = new Ttest(params)
        if (!ttestInstance.save(flush: true)) {
            render(view: "create", model: [ttestInstance: ttestInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ttest.label', default: 'Ttest'), ttestInstance.id])
        redirect(action: "show", id: ttestInstance.id)
    }

    def show(Long id) {
        def ttestInstance = Ttest.get(id)
        if (!ttestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ttest.label', default: 'Ttest'), id])
            redirect(action: "list")
            return
        }

        [ttestInstance: ttestInstance]
    }

    def edit(Long id) {
        def ttestInstance = Ttest.get(id)
        if (!ttestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ttest.label', default: 'Ttest'), id])
            redirect(action: "list")
            return
        }

        [ttestInstance: ttestInstance]
    }

    def update(Long id, Long version) {
        def ttestInstance = Ttest.get(id)
        if (!ttestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ttest.label', default: 'Ttest'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ttestInstance.version > version) {
                ttestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ttest.label', default: 'Ttest')] as Object[],
                          "Another user has updated this Ttest while you were editing")
                render(view: "edit", model: [ttestInstance: ttestInstance])
                return
            }
        }

        ttestInstance.properties = params

        if (!ttestInstance.save(flush: true)) {
            render(view: "edit", model: [ttestInstance: ttestInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ttest.label', default: 'Ttest'), ttestInstance.id])
        redirect(action: "show", id: ttestInstance.id)
    }

    def delete(Long id) {
        def ttestInstance = Ttest.get(id)
        if (!ttestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ttest.label', default: 'Ttest'), id])
            redirect(action: "list")
            return
        }

        try {
            ttestInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ttest.label', default: 'Ttest'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ttest.label', default: 'Ttest'), id])
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
        def conditions={}
//        def conditions={
//            if(params.name&&params.name=="true"){
//                if(params.nameOperator=="contains"){
//                    like("name","%"+params.nameKey+"%");
//                }else if(params.nameOperator=="start"){
//                    like("name",params.nameKey+"%");
//                } else if(params.nameOperator=="end"){
//                    like("name","%"+params.nameKey);
//                }else if(params.nameOperator=="equals"){
//                    eq("name",params.nameKey);
//                }
//            }
//        }
        def rows=Ttest.createCriteria().list(params,conditions);
        def totalCount = Ttest.createCriteria().count(conditions);
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
                def ttestInstance =  Ttest.get(id)
                try {
                    ttestInstance.delete(flush: true)
                }
                catch (DataIntegrityViolationException e) {
                    def message = message(code: 'default.not.deleted.message', args: [message(code: 'ttest.label', default: 'Ttest'), id])
                    def resultObj=[success:false,message:message];
                    render resultObj as JSON;
                    return
                }
            }
            def message = message(code: 'default.deleted.message', args: [message(code: 'ttest.label', default: 'Ttest'), ids])
            def resultObj=[success:true,message:message];
            render resultObj as JSON;
        }

    }
}
