package com.lj.dbc.com.zxl



import org.springframework.dao.DataIntegrityViolationException

import com.lj.test.SecondTest


class SecondTestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

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
}
