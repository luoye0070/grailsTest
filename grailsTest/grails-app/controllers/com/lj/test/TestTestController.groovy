
package com.lj.test

import org.springframework.dao.DataIntegrityViolationException
import grails.converters.JSON
class TestTestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        println("list-params-->"+params);
        [testTestInstanceList: TestTest.list(params), testTestInstanceTotal: TestTest.count()]
    }

    def create() {
        [testTestInstance: new TestTest(params)]
    }

    def save() {
        def testTestInstance = new TestTest(params)
        if (!testTestInstance.save(flush: true)) {
            render(view: "create", model: [testTestInstance: testTestInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'testTest.label', default: 'TestTest'), testTestInstance.id])
        redirect(action: "show", id: testTestInstance.id)
    }

    def show(Long id) {
        def testTestInstance = TestTest.get(id)
        if (!testTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'testTest.label', default: 'TestTest'), id])
            redirect(action: "list")
            return
        }

        [testTestInstance: testTestInstance]
    }

    def edit(Long id) {
        def testTestInstance = TestTest.get(id)
        if (!testTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'testTest.label', default: 'TestTest'), id])
            redirect(action: "list")
            return
        }

        [testTestInstance: testTestInstance]
    }

    def update(Long id, Long version) {
        def testTestInstance = TestTest.get(id)
        if (!testTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'testTest.label', default: 'TestTest'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (testTestInstance.version > version) {
                testTestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'testTest.label', default: 'TestTest')] as Object[],
                          "Another user has updated this TestTest while you were editing")
                render(view: "edit", model: [testTestInstance: testTestInstance])
                return
            }
        }

        testTestInstance.properties = params

        if (!testTestInstance.save(flush: true)) {
            render(view: "edit", model: [testTestInstance: testTestInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'testTest.label', default: 'TestTest'), testTestInstance.id])
        redirect(action: "show", id: testTestInstance.id)
    }

    def delete(Long id) {
        def testTestInstance = TestTest.get(id)
        if (!testTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'testTest.label', default: 'TestTest'), id])
            redirect(action: "list")
            return
        }

        try {
            testTestInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'testTest.label', default: 'TestTest'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'testTest.label', default: 'TestTest'), id])
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
            
            if(params.iiTest&&params.iiTest=="true"){
            
                    int iiTestKey=0;
                    try{
                        iiTestKey=Integer.parseInt(params.iiTestKey);
                    }catch (Exception ex){}
                    if(params.iiTestOperator=="equals"){
                        eq("iiTest",iiTestKey);
                    }else if(params.iiTestOperator=="gt"){
                        gt("iiTest",iiTestKey);
                    }else if(params.iiTestOperator=="ge"){
                        ge("iiTest",iiTestKey);
                    }else if(params.iiTestOperator=="lt"){
                        lt("iiTest",iiTestKey);
                    }else if(params.iiTestOperator=="le"){
                        le("iiTest",iiTestKey);
                    }
                
            }
            
            if(params.bTest&&params.bTest=="true"){
            
                    byte bTestKey=0;
                    try{
                        bTestKey=Byte.parseByte(params.bTestKey);
                    }catch (Exception ex){}
                    if(params.bTestOperator=="equals"){
                        eq("bTest",bTestKey);
                    }else if(params.bTestOperator=="gt"){
                        gt("bTest",bTestKey);
                    }else if(params.bTestOperator=="ge"){
                        ge("bTest",bTestKey);
                    }else if(params.bTestOperator=="lt"){
                        lt("bTest",bTestKey);
                    }else if(params.bTestOperator=="le"){
                        le("bTest",bTestKey);
                    }
                
            }
            
            if(params.cTest&&params.cTest=="true"){
            
                    char  cTestKey=0;
                    try{
                        cTestKey=params.cTestKey.toCharacter()[0];
                    }catch (Exception ex){}
                    if(params.cTestOperator=="equals"){
                        eq("cTest",cTestKey);
                    }else if(params.cTestOperator=="gt"){
                        gt("cTest",cTestKey);
                    }else if(params.cTestOperator=="ge"){
                        ge("cTest",cTestKey);
                    }else if(params.cTestOperator=="lt"){
                        lt("cTest",cTestKey);
                    }else if(params.cTestOperator=="le"){
                        le("cTest",cTestKey);
                    }
                
            }
            
            if(params.cc&&params.cc=="true"){
            
                    eq("cc",Currency.getInstance(params.ccKey));
                
            }
            
            if(params.dlTest&&params.dlTest=="true"){
            
                    double  dlTestKey=0d;
                    try{
                        dlTestKey=Double.parseDouble(params.dlTestKey);
                    }catch (Exception ex){}
                    if(params.dlTestOperator=="equals"){
                        eq("dlTest",dlTestKey);
                    }else if(params.dlTestOperator=="gt"){
                        gt("dlTest",dlTestKey);
                    }else if(params.dlTestOperator=="ge"){
                        ge("dlTest",dlTestKey);
                    }else if(params.dlTestOperator=="lt"){
                        lt("dlTest",dlTestKey);
                    }else if(params.dlTestOperator=="le"){
                        le("dlTest",dlTestKey);
                    }
                
            }
            
            if(params.dtTest&&params.dtTest=="true"){
            
            }
            
            if(params.ftTest&&params.ftTest=="true"){
            
                    float ftTestKey=0f;
                    try{
                        ftTestKey=Float.parseFloat(params.ftTestKey);
                    }catch (Exception ex){}
                    if(params.ftTestOperator=="equals"){
                        eq("ftTest",ftTestKey);
                    }else if(params.ftTestOperator=="gt"){
                        gt("ftTest",ftTestKey);
                    }else if(params.ftTestOperator=="ge"){
                        ge("ftTest",ftTestKey);
                    }else if(params.ftTestOperator=="lt"){
                        lt("ftTest",ftTestKey);
                    }else if(params.ftTestOperator=="le"){
                        le("ftTest",ftTestKey);
                    }
                
            }
            
            if(params.isGood&&params.isGood=="true"){
            
                    boolean  isGoodKey=true;
                    try{
                        isGoodKey=Boolean.getBoolean(params.isGoodKey);
                    }catch (Exception ex){}
                    eq("isGood",isGoodKey);
                
            }
            
            if(params.lTest&&params.lTest=="true"){
            
                    long  lTestKey=0l;
                    try{
                        lTestKey=Long.parseLong(params.lTestKey);
                    }catch (Exception ex){}
                    if(params.lTestOperator=="equals"){
                        eq("lTest",lTestKey);
                    }else if(params.lTestOperator=="gt"){
                        gt("lTest",lTestKey);
                    }else if(params.lTestOperator=="ge"){
                        ge("lTest",lTestKey);
                    }else if(params.lTestOperator=="lt"){
                        lt("lTest",lTestKey);
                    }else if(params.lTestOperator=="le"){
                        le("lTest",lTestKey);
                    }
                
            }
            
            if(params.ll&&params.ll=="true"){
            
                    if(params.llKey){
                        String language="";
                        String country="";
                        String llKey=params.llKey;
                        int i=llKey.indexOf("_");
                        if(i==-1){
                            language=llKey;
                        }else {
                            language=llKey.substring(0,i);
                            country=llKey.substring(i+1);
                        }
                        eq("ll",new Locale(language,country));
                    }
                
            }
            
            if(params.oneTest&&params.oneTest=="true"){
            
                    long  oneTestKey=0l;
                    try{
                        oneTestKey=Long.parseLong(params.oneTestKey);
                    }catch (Exception ex){}
                    def oneTest=com.lj.test.OneTest.get(oneTestKey);
                    if(oneTest){
                        eq("oneTest",oneTest);
                    }
                
            }
            
            if(params.oot&&params.oot=="true"){
            
                    long  ootKey=0l;
                    try{
                        ootKey=Long.parseLong(params.ootKey);
                    }catch (Exception ex){}
                    def oneOverTest=com.lj.test.over.OneOverTest.get(ootKey);
                    if(oneOverTest){
                        eq("oot",oneOverTest);
                    }
                
            }
            
            if(params.sTest&&params.sTest=="true"){
            
                    if(params.sTest&&params.sTest=="true"){
                        if(params.sTestOperator=="contains"){
                            like("sTest","%"+params.sTestKey+"%");
                        }else if(params.sTestOperator=="start"){
                            like("sTest",params.sTestKey+"%");
                        } else if(params.sTestOperator=="end"){
                            like("sTest","%"+params.sTestKey);
                        }else if(params.sTestOperator=="equals"){
                            eq("sTest",params.sTestKey);
                        }
                    }
                
            }
            
            if(params.secondTests&&params.secondTests=="true"){
            
            }
            
            if(params.stTest&&params.stTest=="true"){
            
                    short  stTestKey=0;
                    try{
                        stTestKey=Short.parseShort(params.stTestKey);
                    }catch (Exception ex){}
                    if(params.stTestOperator=="equals"){
                        eq("stTest",stTestKey);
                    }else if(params.stTestOperator=="gt"){
                        gt("stTest",stTestKey);
                    }else if(params.stTestOperator=="ge"){
                        ge("stTest",stTestKey);
                    }else if(params.stTestOperator=="lt"){
                        lt("stTest",stTestKey);
                    }else if(params.stTestOperator=="le"){
                        le("stTest",stTestKey);
                    }
                
            }
            
            if(params.tz&&params.tz=="true"){
            
                    eq("tz",TimeZone.getTimeZone(params.tzKey));
                
            }
            
        }
        def rows=TestTest.createCriteria().list(params,conditions);
        def totalCount = TestTest.createCriteria().count(conditions);
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
                def testTestInstance =  TestTest.get(id)
                try {
                    testTestInstance.delete(flush: true)
                }
                catch (DataIntegrityViolationException e) {
                    def message = message(code: 'default.not.deleted.message', args: [message(code: 'testTest.label', default: 'TestTest'), id])
                    def resultObj=[success:false,message:message];
                    render resultObj as JSON;
                    return
                }
            }
            def message = message(code: 'default.deleted.message', args: [message(code: 'testTest.label', default: 'TestTest'), ids])
            def resultObj=[success:true,message:message];
            render resultObj as JSON;
        }

    }
}
