
package com.lj.test.over

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
class OneOverTestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [oneOverTestInstanceList: OneOverTest.list(params), oneOverTestInstanceTotal: OneOverTest.count()]
    }

    def create() {
        [oneOverTestInstance: new OneOverTest(params)]
    }

    def save() {
        def oneOverTestInstance = new OneOverTest(params)
        if (!oneOverTestInstance.save(flush: true)) {
            render(view: "create", model: [oneOverTestInstance: oneOverTestInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'oneOverTest.label', default: 'OneOverTest'), oneOverTestInstance.id])
        redirect(action: "show", id: oneOverTestInstance.id)
    }

    def show(Long id) {
        def oneOverTestInstance = OneOverTest.get(id)
        if (!oneOverTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oneOverTest.label', default: 'OneOverTest'), id])
            redirect(action: "list")
            return
        }

        [oneOverTestInstance: oneOverTestInstance]
    }

    def edit(Long id) {
        def oneOverTestInstance = OneOverTest.get(id)
        if (!oneOverTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oneOverTest.label', default: 'OneOverTest'), id])
            redirect(action: "list")
            return
        }

        [oneOverTestInstance: oneOverTestInstance]
    }

    def update(Long id, Long version) {
        def oneOverTestInstance = OneOverTest.get(id)
        if (!oneOverTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oneOverTest.label', default: 'OneOverTest'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (oneOverTestInstance.version > version) {
                oneOverTestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'oneOverTest.label', default: 'OneOverTest')] as Object[],
                          "Another user has updated this OneOverTest while you were editing")
                render(view: "edit", model: [oneOverTestInstance: oneOverTestInstance])
                return
            }
        }

        oneOverTestInstance.properties = params

        if (!oneOverTestInstance.save(flush: true)) {
            render(view: "edit", model: [oneOverTestInstance: oneOverTestInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'oneOverTest.label', default: 'OneOverTest'), oneOverTestInstance.id])
        redirect(action: "show", id: oneOverTestInstance.id)
    }

    def delete(Long id) {
        def oneOverTestInstance = OneOverTest.get(id)
        if (!oneOverTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oneOverTest.label', default: 'OneOverTest'), id])
            redirect(action: "list")
            return
        }

        try {
            oneOverTestInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'oneOverTest.label', default: 'OneOverTest'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'oneOverTest.label', default: 'OneOverTest'), id])
            redirect(action: "show", id: id)
        }
    }

    def listJson() {
        //println("params--->"+params);

        params.max = Math.min(params.limit as Integer ?: 10, 100)
        params.offset= params.start

        def conditions={
            
            if(params.code&&params.code=="true"){
            
                    int codeKey=0;
                    try{
                        codeKey=Integer.parseInt(params.codeKey);
                    }catch (Exception ex){}
                    if(params.codeOperator=="equals"){
                        eq("code",codeKey);
                    }else if(params.codeOperator=="gt"){
                        gt("code",codeKey);
                    }else if(params.codeOperator=="ge"){
                        ge("code",codeKey);
                    }else if(params.codeOperator=="lt"){
                        lt("code",codeKey);
                    }else if(params.codeOperator=="le"){
                        le("code",codeKey);
                    }
                
            }
            
        }
        def rows=OneOverTest.createCriteria().list(params,conditions);
        def totalCount = OneOverTest.createCriteria().count(conditions);
        //render(view:"/dbc/SecondTest/list",model:[secondTestInstanceList: SecondTest.list(params), secondTestInstanceTotal: SecondTest.count()])
        def resultObj=[rows : rows, //数据集合
                results : totalCount, //记录总数
                hasError : false, //是否存在错误
                error : "" // 仅在 hasError : true 时使用
        ];
        //println("resultObj-->"+(resultObj as JSON))
        render resultObj as JSON;
    }
    def deleteJson() {
        //println("params-->"+params)
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
            //println("ids-->"+idsP);
            for(int i=0;i<ids.length;i++){
                def id=ids[i];
                def oneOverTestInstance =  OneOverTest.get(id)
                try {
                    oneOverTestInstance.delete(flush: true)
                }
                catch (DataIntegrityViolationException e) {
                    def message = message(code: 'default.not.deleted.message', args: [message(code: 'oneOverTest.label', default: 'OneOverTest'), id])
                    def resultObj=[success:false,message:message];
                    render resultObj as JSON;
                    return
                }
            }
            def message = message(code: 'default.deleted.message', args: [message(code: 'oneOverTest.label', default: 'OneOverTest'), ids])
            def resultObj=[success:true,message:message];
            render resultObj as JSON;
        }

    }
}
