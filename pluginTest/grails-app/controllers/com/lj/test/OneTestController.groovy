package com.lj.test

import org.springframework.dao.DataIntegrityViolationException

class OneTestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [oneTestInstanceList: OneTest.list(params), oneTestInstanceTotal: OneTest.count()]
    }

    def create() {
        [oneTestInstance: new OneTest(params)]
    }

    def save() {
        def oneTestInstance = new OneTest(params)
        if (!oneTestInstance.save(flush: true)) {
            render(view: "create", model: [oneTestInstance: oneTestInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'oneTest.label', default: 'OneTest'), oneTestInstance.id])
        redirect(action: "show", id: oneTestInstance.id)
    }

    def show(Long id) {
        def oneTestInstance = OneTest.get(id)
        if (!oneTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oneTest.label', default: 'OneTest'), id])
            redirect(action: "list")
            return
        }

        [oneTestInstance: oneTestInstance]
    }

    def edit(Long id) {
        def oneTestInstance = OneTest.get(id)
        if (!oneTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oneTest.label', default: 'OneTest'), id])
            redirect(action: "list")
            return
        }

        [oneTestInstance: oneTestInstance]
    }

    def update(Long id, Long version) {
        def oneTestInstance = OneTest.get(id)
        if (!oneTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oneTest.label', default: 'OneTest'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (oneTestInstance.version > version) {
                oneTestInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'oneTest.label', default: 'OneTest')] as Object[],
                          "Another user has updated this OneTest while you were editing")
                render(view: "edit", model: [oneTestInstance: oneTestInstance])
                return
            }
        }

        oneTestInstance.properties = params

        if (!oneTestInstance.save(flush: true)) {
            render(view: "edit", model: [oneTestInstance: oneTestInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'oneTest.label', default: 'OneTest'), oneTestInstance.id])
        redirect(action: "show", id: oneTestInstance.id)
    }

    def delete(Long id) {
        def oneTestInstance = OneTest.get(id)
        if (!oneTestInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'oneTest.label', default: 'OneTest'), id])
            redirect(action: "list")
            return
        }

        try {
            oneTestInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'oneTest.label', default: 'OneTest'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'oneTest.label', default: 'OneTest'), id])
            redirect(action: "show", id: id)
        }
    }
}
